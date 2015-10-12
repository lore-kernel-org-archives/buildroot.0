From: Carlos Soto <csotoalonso@gmail.com>
Date: Mon, 12 Oct 2015 20:10:38 +0200
Subject: [Buildroot] Change build directory por a package
In-Reply-To: <20151012110903.7dd3ab79@free-electrons.com>
References: <CAD7j7Q9cSriOdjNQXxamwCh8W_TCJsQ0iuYDmsEr+FJ_Az_nkQ@mail.gmail.com>
 <20151012110903.7dd3ab79@free-electrons.com>
Message-ID: <CAD7j7Q9eO6nEgW=FwdXjc2MtMZ-bJyYZc+ZmPpTkM1XwnzgFTQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,


There is already a sdl2 package waiting in patchwork:
>
>   http://patchwork.ozlabs.org/patch/497394/
>
> Instead of re-creating a package, maybe you could use this patch, and
> tell us if it works for you?
>
> Thanks!
>
> Certainly, I saw this patch but I wasn't sure if I tested it or not, so
I've tried it now. It turns out that I've tried it, and there were issues
with it, mainly with the hardware acceleration.

Anyway, it sure compiles, but it is only because it is configured for
static linking. As soon as I remove this config option from sdl2.mk

# We must enable static build to get compilation
successful.SDL2_CONF_OPTS += --enable-static

the problem I reported appears again and the compilation ends with an error.

As Yann sugested, I'm attaching the last lines of the build so you can
check what the error looks like (sorry for the flooding):

/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/video/x11/SDL_x11modes.c
-o build/SDL_x11modes.lo
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/video/x11/SDL_x11modes.c
 -fPIC -DPIC -o build/.libs/SDL_x11modes.o
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/video/x11/SDL_x11mouse.c
-o build/SDL_x11mouse.lo
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/video/x11/SDL_x11opengl.c
-o build/SDL_x11opengl.lo
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/video/x11/SDL_x11mouse.c
 -fPIC -DPIC -o build/.libs/SDL_x11mouse.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/video/x11/SDL_x11opengl.c
 -fPIC -DPIC -o build/.libs/SDL_x11opengl.o
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/video/x11/SDL_x11opengles.c
-o build/SDL_x11opengles.lo
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/video/x11/SDL_x11opengles.c
 -fPIC -DPIC -o build/.libs/SDL_x11opengles.o
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/video/x11/SDL_x11shape.c
-o build/SDL_x11shape.lo
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/video/x11/SDL_x11touch.c
-o build/SDL_x11touch.lo
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/video/x11/SDL_x11video.c
-o build/SDL_x11video.lo
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/video/x11/SDL_x11shape.c
 -fPIC -DPIC -o build/.libs/SDL_x11shape.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/video/x11/SDL_x11touch.c
 -fPIC -DPIC -o build/.libs/SDL_x11touch.o
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/video/x11/SDL_x11window.c
-o build/SDL_x11window.lo
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/video/x11/SDL_x11video.c
 -fPIC -DPIC -o build/.libs/SDL_x11video.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/video/x11/SDL_x11window.c
 -fPIC -DPIC -o build/.libs/SDL_x11window.o
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/video/x11/SDL_x11xinput2.c
-o build/SDL_x11xinput2.lo
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/video/x11/edid-parse.c
-o build/edid-parse.lo
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/video/x11/imKStoUCS.c
-o build/imKStoUCS.lo
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/video/x11/edid-parse.c
 -fPIC -DPIC -o build/.libs/edid-parse.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/video/x11/SDL_x11xinput2.c
 -fPIC -DPIC -o build/.libs/SDL_x11xinput2.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/video/x11/imKStoUCS.c
 -fPIC -DPIC -o build/.libs/imKStoUCS.o
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/thread/pthread/SDL_systhread.c
-o build/SDL_systhread.lo
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/thread/pthread/SDL_syssem.c
-o build/SDL_syssem.lo
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/thread/pthread/SDL_syssem.c
 -fPIC -DPIC -o build/.libs/SDL_syssem.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/thread/pthread/SDL_systhread.c
 -fPIC -DPIC -o build/.libs/SDL_systhread.o
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/thread/pthread/SDL_sysmutex.c
-o build/SDL_sysmutex.lo
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/thread/pthread/SDL_syscond.c
-o build/SDL_syscond.lo
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/thread/pthread/SDL_sysmutex.c
 -fPIC -DPIC -o build/.libs/SDL_sysmutex.o
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/thread/pthread/SDL_systls.c
-o build/SDL_systls.lo
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/thread/pthread/SDL_syscond.c
 -fPIC -DPIC -o build/.libs/SDL_syscond.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/thread/pthread/SDL_systls.c
 -fPIC -DPIC -o build/.libs/SDL_systls.o
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/joystick/linux/SDL_sysjoystick.c
-o build/SDL_sysjoystick.lo
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/joystick/linux/SDL_sysjoystick.c
 -fPIC -DPIC -o build/.libs/SDL_sysjoystick.o
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/haptic/linux/SDL_syshaptic.c
-o build/SDL_syshaptic.lo
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/power/linux/SDL_syspower.c
-o build/SDL_syspower.lo
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/filesystem/unix/SDL_sysfilesystem.c
-o build/SDL_sysfilesystem.lo
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/timer/unix/SDL_systimer.c
-o build/SDL_systimer.lo
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/core/linux/SDL_udev.c
-o build/SDL_udev.lo
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/haptic/linux/SDL_syshaptic.c
 -fPIC -DPIC -o build/.libs/SDL_syshaptic.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/filesystem/unix/SDL_sysfilesystem.c
 -fPIC -DPIC -o build/.libs/SDL_sysfilesystem.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/power/linux/SDL_syspower.c
 -fPIC -DPIC -o build/.libs/SDL_syspower.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/timer/unix/SDL_systimer.c
 -fPIC -DPIC -o build/.libs/SDL_systimer.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/core/linux/SDL_udev.c
 -fPIC -DPIC -o build/.libs/SDL_udev.o
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/core/linux/SDL_evdev.c
-o build/SDL_evdev.lo
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/main/dummy/SDL_dummy_main.c
-o build/SDL_dummy_main.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/main/dummy/SDL_dummy_main.c
 -fPIC -DPIC -o build/.libs/SDL_dummy_main.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/core/linux/SDL_evdev.c
 -fPIC -DPIC -o build/.libs/SDL_evdev.o
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_assert.c
-o build/SDL_test_assert.o
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_common.c
-o build/SDL_test_common.o
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_compare.c
-o build/SDL_test_compare.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_assert.c
 -fPIC -DPIC -o build/.libs/SDL_test_assert.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_compare.c
 -fPIC -DPIC -o build/.libs/SDL_test_compare.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_common.c
 -fPIC -DPIC -o build/.libs/SDL_test_common.o
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_crc32.c
-o build/SDL_test_crc32.o
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_font.c
-o build/SDL_test_font.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_crc32.c
 -fPIC -DPIC -o build/.libs/SDL_test_crc32.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_font.c
 -fPIC -DPIC -o build/.libs/SDL_test_font.o
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_fuzzer.c
-o build/SDL_test_fuzzer.o
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_harness.c
-o build/SDL_test_harness.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_harness.c
 -fPIC -DPIC -o build/.libs/SDL_test_harness.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_fuzzer.c
 -fPIC -DPIC -o build/.libs/SDL_test_fuzzer.o
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_imageBlit.c
-o build/SDL_test_imageBlit.o
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_imageBlitBlend.c
-o build/SDL_test_imageBlitBlend.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_imageBlit.c
 -fPIC -DPIC -o build/.libs/SDL_test_imageBlit.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_imageBlitBlend.c
 -fPIC -DPIC -o build/.libs/SDL_test_imageBlitBlend.o
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_imageFace.c
-o build/SDL_test_imageFace.o
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_imagePrimitives.c
-o build/SDL_test_imagePrimitives.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_imageFace.c
 -fPIC -DPIC -o build/.libs/SDL_test_imageFace.o
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_imagePrimitivesBlend.c
-o build/SDL_test_imagePrimitivesBlend.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_imagePrimitives.c
 -fPIC -DPIC -o build/.libs/SDL_test_imagePrimitives.o
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_log.c
-o build/SDL_test_log.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_imagePrimitivesBlend.c
 -fPIC -DPIC -o build/.libs/SDL_test_imagePrimitivesBlend.o
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_md5.c
-o build/SDL_test_md5.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_md5.c
 -fPIC -DPIC -o build/.libs/SDL_test_md5.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_log.c
 -fPIC -DPIC -o build/.libs/SDL_test_log.o
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_random.c
-o build/SDL_test_random.o
/bin/bash ./libtool --mode=compile
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
  -D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall  -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/SDL.c -o
build/SDL.lo
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-ar
cru build/libSDL2main.a build/SDL_dummy_main.o
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/test/SDL_test_random.c
 -fPIC -DPIC -o build/.libs/SDL_test_random.o
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-ar:
build/SDL_dummy_main.o: No such file or directory
make[1]: *** [build/libSDL2main.a] Error 1
make[1]: *** Waiting for unfinished jobs....
libtool: compile:
/home/starsl/iMX6/buildroot/output/host/usr/bin/arm-cortexa9_neon-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DUSING_GENERATED_CONFIG_H -Iinclude
-I/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/include
-fvisibility=hidden
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/dbus-1.0
-I/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/dbus-1.0/include
-D_REENTRANT -DHAVE_LINUX_VERSION_H -Wall -c
/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/src/SDL.c  -fPIC
-DPIC -o build/.libs/SDL.o
make[1]: Leaving directory `/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3'
make: *** [/home/starsl/iMX6/buildroot/output/build/sdl2-2.0.3/.stamp_built]
Error 2

Thanks!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151012/25975814/attachment-0001.html>
