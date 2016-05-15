From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Sun, 15 May 2016 10:28:45 +0200
Subject: [Buildroot] QtMultimedia and gstreamer-1.0
In-Reply-To: <20160515100303.003752e2@gmx.net>
References: <5738116B.9050904@gmail.com> <20160515100303.003752e2@gmx.net>
Message-ID: <5738333D.8010707@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 15/05/2016 10:03, Peter Seiderer ha scritto:
> This means the header files etc. which are installed into the staging 
> directory (and not into the target directory) which Qt needs to detect 
> and compile with GStreamer support... 

Thus, those files are needed only during the build process, they don't 
need to be copied to the target, do they?

I found a config.log in my qt5multimedia-5.6.0 output/build/ directory. 
It is attached to this email. It seems the gstreamer tests were 
successfully. Furthermore in the plugins/mediaservice subdirectory I find:

libgstaudiodecoder.so
libgstcamerabin.so
libgstmediacapture.so
libgstmediaplayer.so

which are installed on target under /usr/lib/qt/plugins/mediaservice/

By the way, on target their size is slightly smaller. This is because 
they are stripped or perhaps this may lead to an hidden problem? (just 
to be sure I tried to copy them to the target but the behavior is the same).
I can rebuild all from scratch, but if it's correct it would be useless!

What else I should check?
Best regards
Marco

-------------- next part --------------
executing config test openal
+ cd /home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/openal && /home/femtotech/dev/buildroot/output/host/usr/bin/qmake -spec /home/femtotech/dev/buildroot/output/host/usr/mkspecs/devices/linux-buildroot-g++ "CONFIG -= qt debug_and_release app_bundle lib_bundle" /home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/openal
+ cd /home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/openal && make
make[1]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/openal"
/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os --sysroot=/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot -O2 -O3 -std=gnu++0x -fno-exceptions -Wall -W -fPIC -DQT_NO_MTDEV -DQT_NO_LIBINPUT -DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -I. -I/home/femtotech/dev/buildroot/output/host/usr/mkspecs/devices/linux-buildroot-g++ -o .obj/main.o main.cpp
main.cpp:37:19: fatal error: AL/al.h: File o directory non esistente
 #include <AL/al.h>
                   ^
compilation terminated.
Makefile:296: set di istruzioni per l'obiettivo ".obj/main.o" non riuscito
make[1]: *** [.obj/main.o] Errore 1
make[1]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/openal"
test openal FAILED
executing config test pulseaudio
+ cd /home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/pulseaudio && /home/femtotech/dev/buildroot/output/host/usr/bin/qmake -spec /home/femtotech/dev/buildroot/output/host/usr/mkspecs/devices/linux-buildroot-g++ "CONFIG -= qt debug_and_release app_bundle lib_bundle" /home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/pulseaudio
+ cd /home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/pulseaudio && make
make[1]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/pulseaudio"
/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os --sysroot=/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot -O2 -O3 -std=gnu++0x -fno-exceptions -Wall -W -fPIC -DQT_NO_MTDEV -DQT_NO_LIBINPUT -D_REENTRANT -DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -I. -isystem /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include -isystem /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/glib-2.0 -I/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/glib-2.0/include -I/home/femtotech/dev/buildroot/output/host/usr/mkspecs/devices/linux-buildroot-g++ -o .obj/pulseaudio.o pulseaudio.cpp
/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++ --sysroot=/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot -Wl,-O1 -Wl,--enable-new-dtags -o pulseaudio .obj/pulseaudio.o   -lrt -lpthread -ldl -L/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib -lpulse-mainloop-glib -lpulse -lglib-2.0 -lintl 
make[1]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/pulseaudio"
test pulseaudio succeeded
executing config test gstreamer
+ cd /home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/gstreamer && /home/femtotech/dev/buildroot/output/host/usr/bin/qmake -spec /home/femtotech/dev/buildroot/output/host/usr/mkspecs/devices/linux-buildroot-g++ "CONFIG -= qt debug_and_release app_bundle lib_bundle" /home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/gstreamer
+ cd /home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/gstreamer && make
make[1]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/gstreamer"
/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os --sysroot=/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot -O2 -O3 -std=gnu++0x -pthread -pthread -pthread -pthread -pthread -fno-exceptions -Wall -W -fPIC -DQT_NO_MTDEV -DQT_NO_LIBINPUT -DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -I. -isystem /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/gstreamer-1.0 -I/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/gstreamer-1.0/include -isystem /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/glib-2.0 -I/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/glib-2.0/include -isystem /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include -I/home/femtotech/dev/buildroot/output/host/usr/mkspecs/devices/linux-buildroot-g++ -o .obj/main.o main.cpp
main.cpp:38:14: warning: unused parameter ?argc? [-Wunused-parameter]
 int main(int argc, char** argv)
              ^
main.cpp:38:27: warning: unused parameter ?argv? [-Wunused-parameter]
 int main(int argc, char** argv)
                           ^
/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++ --sysroot=/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot -Wl,-O1 -Wl,--enable-new-dtags -o gstreamer .obj/main.o   -lrt -lpthread -ldl -L/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib -lgstaudio-1.0 -lgstvideo-1.0 -lgstbase-1.0 -lgstpbutils-1.0 -lgstreamer-1.0 -lgobject-2.0 -lglib-2.0 -lintl 
make[1]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/gstreamer"
test gstreamer succeeded
executing config test gstreamer_photography
+ cd /home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/gstreamer_photography && /home/femtotech/dev/buildroot/output/host/usr/bin/qmake -spec /home/femtotech/dev/buildroot/output/host/usr/mkspecs/devices/linux-buildroot-g++ "CONFIG -= qt debug_and_release app_bundle lib_bundle" /home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/gstreamer_photography
+ cd /home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/gstreamer_photography && make
make[1]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/gstreamer_photography"
/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os --sysroot=/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot -O2 -O3 -std=gnu++0x -pthread -pthread -pthread -pthread -pthread -fno-exceptions -Wall -W -fPIC -DQT_NO_MTDEV -DQT_NO_LIBINPUT -DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -I. -isystem /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/gstreamer-1.0 -I/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/gstreamer-1.0/include -isystem /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/glib-2.0 -I/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/glib-2.0/include -isystem /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include -I/home/femtotech/dev/buildroot/output/host/usr/mkspecs/devices/linux-buildroot-g++ -o .obj/main.o main.cpp
main.cpp:41:14: warning: unused parameter ?argc? [-Wunused-parameter]
 int main(int argc, char** argv)
              ^
main.cpp:41:27: warning: unused parameter ?argv? [-Wunused-parameter]
 int main(int argc, char** argv)
                           ^
/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++ --sysroot=/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot -Wl,-O1 -Wl,--enable-new-dtags -o gstreamer_photography .obj/main.o   -lrt -lpthread -ldl -lgstphotography-1.0 -L/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib -lgstaudio-1.0 -lgstvideo-1.0 -lgstbase-1.0 -lgstpbutils-1.0 -lgstreamer-1.0 -lgobject-2.0 -lglib-2.0 -lintl 
make[1]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/gstreamer_photography"
test gstreamer_photography succeeded
executing config test gstreamer_encodingprofiles
+ cd /home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/gstreamer_encodingprofiles && /home/femtotech/dev/buildroot/output/host/usr/bin/qmake -spec /home/femtotech/dev/buildroot/output/host/usr/mkspecs/devices/linux-buildroot-g++ "CONFIG -= qt debug_and_release app_bundle lib_bundle" /home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/gstreamer_encodingprofiles
+ cd /home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/gstreamer_encodingprofiles && make
make[1]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/gstreamer_encodingprofiles"
/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os --sysroot=/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot -O2 -O3 -std=gnu++0x -pthread -pthread -pthread -pthread -pthread -fno-exceptions -Wall -W -fPIC -DQT_NO_MTDEV -DQT_NO_LIBINPUT -DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -I. -isystem /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/gstreamer-1.0 -I/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/gstreamer-1.0/include -isystem /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/glib-2.0 -I/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/glib-2.0/include -isystem /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include -I/home/femtotech/dev/buildroot/output/host/usr/mkspecs/devices/linux-buildroot-g++ -o .obj/main.o main.cpp
main.cpp:39:14: warning: unused parameter ?argc? [-Wunused-parameter]
 int main(int argc, char** argv)
              ^
main.cpp:39:27: warning: unused parameter ?argv? [-Wunused-parameter]
 int main(int argc, char** argv)
                           ^
/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++ --sysroot=/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot -Wl,-O1 -Wl,--enable-new-dtags -o gstreamer_encodingprofiles .obj/main.o   -lrt -lpthread -ldl -L/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib -lgstaudio-1.0 -lgstvideo-1.0 -lgstbase-1.0 -lgstpbutils-1.0 -lgstreamer-1.0 -lgobject-2.0 -lglib-2.0 -lintl 
make[1]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/gstreamer_encodingprofiles"
test gstreamer_encodingprofiles succeeded
executing config test gstreamer_appsrc
+ cd /home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/gstreamer_appsrc && /home/femtotech/dev/buildroot/output/host/usr/bin/qmake -spec /home/femtotech/dev/buildroot/output/host/usr/mkspecs/devices/linux-buildroot-g++ "CONFIG -= qt debug_and_release app_bundle lib_bundle" /home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/gstreamer_appsrc
+ cd /home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/gstreamer_appsrc && make
make[1]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/gstreamer_appsrc"
/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os --sysroot=/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot -O2 -O3 -std=gnu++0x -pthread -pthread -pthread -pthread -pthread -fno-exceptions -Wall -W -fPIC -DQT_NO_MTDEV -DQT_NO_LIBINPUT -DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -I. -isystem /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/gstreamer-1.0 -I/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/gstreamer-1.0/include -isystem /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/glib-2.0 -I/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/glib-2.0/include -isystem /home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include -I/home/femtotech/dev/buildroot/output/host/usr/mkspecs/devices/linux-buildroot-g++ -o .obj/main.o main.cpp
main.cpp:38:14: warning: unused parameter ?argc? [-Wunused-parameter]
 int main(int argc, char** argv)
              ^
main.cpp:38:27: warning: unused parameter ?argv? [-Wunused-parameter]
 int main(int argc, char** argv)
                           ^
/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++ --sysroot=/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot -Wl,-O1 -Wl,--enable-new-dtags -o gstreamer_appsrc .obj/main.o   -lrt -lpthread -ldl -L/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib -lgstaudio-1.0 -lgstvideo-1.0 -lgstbase-1.0 -lgstpbutils-1.0 -lgstreamer-1.0 -lgobject-2.0 -lglib-2.0 -lintl 
make[1]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/gstreamer_appsrc"
test gstreamer_appsrc succeeded
executing config test linux_v4l
+ cd /home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/linux_v4l && /home/femtotech/dev/buildroot/output/host/usr/bin/qmake -spec /home/femtotech/dev/buildroot/output/host/usr/mkspecs/devices/linux-buildroot-g++ "CONFIG -= qt debug_and_release app_bundle lib_bundle" /home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/linux_v4l
+ cd /home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/linux_v4l && make
make[1]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/linux_v4l"
/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os --sysroot=/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot -O2 -O3 -std=gnu++0x -fno-exceptions -Wall -W -fPIC -DQT_NO_MTDEV -DQT_NO_LIBINPUT -DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -I. -I/home/femtotech/dev/buildroot/output/host/usr/mkspecs/devices/linux-buildroot-g++ -o .obj/main.o main.cpp
main.cpp:36:14: warning: unused parameter ?argc? [-Wunused-parameter]
 int main(int argc, char** argv)
              ^
main.cpp:36:27: warning: unused parameter ?argv? [-Wunused-parameter]
 int main(int argc, char** argv)
                           ^
/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++ --sysroot=/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot -Wl,-O1 -Wl,--enable-new-dtags -o linux_v4l .obj/main.o   -lrt -lpthread -ldl 
make[1]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/linux_v4l"
test linux_v4l succeeded
executing config test resourcepolicy
+ cd /home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/resourcepolicy && /home/femtotech/dev/buildroot/output/host/usr/bin/qmake -spec /home/femtotech/dev/buildroot/output/host/usr/mkspecs/devices/linux-buildroot-g++ "CONFIG -= qt debug_and_release app_bundle lib_bundle" /home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/resourcepolicy
Project ERROR: libresourceqt5 development package not found
test resourcepolicy FAILED
executing config test gpu_vivante
+ cd /home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/gpu_vivante && /home/femtotech/dev/buildroot/output/host/usr/bin/qmake -spec /home/femtotech/dev/buildroot/output/host/usr/mkspecs/devices/linux-buildroot-g++ "CONFIG -= qt debug_and_release app_bundle lib_bundle" /home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/gpu_vivante
+ cd /home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/gpu_vivante && make
make[1]: ingresso nella directory "/home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/gpu_vivante"
/home/femtotech/dev/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os --sysroot=/home/femtotech/dev/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot -O2 -O3 -std=gnu++0x -fno-exceptions -Wall -W -fPIC -DQT_NO_MTDEV -DQT_NO_LIBINPUT -DQT_NO_EXCEPTIONS -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -I. -I/home/femtotech/dev/buildroot/output/host/usr/mkspecs/devices/linux-buildroot-g++ -o .obj/main.o main.cpp
main.cpp:37:20: error: ?GL_VIV_YV12? was not declared in this scope
 const int format = GL_VIV_YV12;
                    ^
main.cpp:39:14: warning: unused parameter ?argc? [-Wunused-parameter]
 int main(int argc, char** argv)
              ^
main.cpp:39:27: warning: unused parameter ?argv? [-Wunused-parameter]
 int main(int argc, char** argv)
                           ^
Makefile:296: set di istruzioni per l'obiettivo ".obj/main.o" non riuscito
make[1]: *** [.obj/main.o] Errore 1
make[1]: uscita dalla directory "/home/femtotech/dev/buildroot/output/build/qt5multimedia-5.6.0/config.tests/gpu_vivante"
test gpu_vivante FAILED
