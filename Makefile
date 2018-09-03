all : powerpistol-lite.pk3 powerpistol-full.pk3
powerpistol-full.pk3 : DECORATE KEYCONF SNDINFO.full SOUNDS/*
	rm -rf build
	mkdir build
	cp -r DECORATE KEYCONF SOUNDS build/
	cp SNDINFO.full build/SNDINFO
	cd build && zip ../powerpistol-full.pk3 DECORATE KEYCONF SNDINFO SOUNDS/*
powerpistol-lite.pk3 : DECORATE KEYCONF SNDINFO.lite
	rm -rf build
	mkdir build
	cp DECORATE KEYCONF build/
	cp SNDINFO.lite build/SNDINFO
	cd build && zip ../powerpistol-lite.pk3 DECORATE KEYCONF SNDINFO
clean :
	rm -rf *.pk3 powerpistol.zip build
publish : clean all powerpistol.txt
	zip -r powerpistol.zip *.pk3 powerpistol.txt
