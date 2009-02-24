From: Anders Gabert <anga@Syntronic.se>
Date: Tue, 24 Feb 2009 08:29:01 +0100
Subject: [Buildroot] Problem when compiling modular xorg for AT91SAM9263
Message-ID: <913B398F7060AA40A8CFF5953068F792012F4EAB@lotta.gavle.syntronic.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi 

I have problem installing modular xorg for my AT91SAM9263 board.
I get the following error when compiling Mesa, it complains on the -m32 option. 
Can anyone help me?

The strange thing is that Mesa 3D Graphics Library is not selected in the menuconfig. 
I use the new release of Buildroot 2009.02.

makedepend: warning:  glxcmds.c (reading ../../../src/mesa/main/glheader.h, line 69): cannot find include file "stdarg.h"
        not in -fdepend/stdarg.h
        not in ./stdarg.h
        not in ../../../include/stdarg.h
        not in ../../../include/GL/internal/stdarg.h
        not in ../../../src/mesa/main/stdarg.h
        not in ../../../src/mesa/glapi/stdarg.h
        not in /opt/climatewell/buildroot-2009.02/build_arm/staging_dir/usr/include/drm/stdarg.h
        not in /usr/include/stdarg.h
make[4]: Leaving directory `/opt/project/buildroot-2009.02/build_arm/Mesa-7.0.3/src/glx/x11'
make[4]: Entering directory `/opt/project/buildroot-2009.02/build_arm/Mesa-7.0.3/src/glx/x11'
/opt/project/buildroot-2009.02/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc -c -I. -I../../../include -I../../../include/GL/internal -I../../../src/mesa/main -I../../../src/mesa/glapi `pkg-config --cflags libdrm`  -Wall -Wmissing-prototypes -std=c99 -ffast-math -Os -pipe -Os  -I/opt/project/buildroot-2009.02/build_arm/staging_dir/usr/include -I/opt/project/buildroot-2009.02/build_arm/staging_dir/include --sysroot=/opt/project/buildroot-2009.02/build_arm/staging_dir/ -isysroot /opt/project/buildroot-2009.02/build_arm/staging_dir -mtune=arm9tdmi -mabi=aapcs-linux -msoft-float -fPIC -m32 -D_POSIX_SOURCE -D_POSIX_C_SOURCE=199309L -D_SVID_SOURCE -D_BSD_SOURCE -D_GNU_SOURCE -DPTHREADS -DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER -DGLX_DIRECT_RENDERING -DGLX_INDIRECT_RENDERING -DHAVE_ALIAS -DHAVE_POSIX_MEMALIGN -DUSE_X86_ASM -DUSE_MMX_ASM -DUSE_3DNOW_ASM -DUSE_SSE_ASM -fno-strict-aliasing -DXF86VIDMODE -D_REENTRANT -UIN_DRI_DRIVER -DDEFAULT_DRIVER_DIR=\"/usr/X11R6/lib/modules/dri\" glcontextmodes.c -o glcontextmodes.o
cc1: error: unrecognized command line option "-m32"
make[4]: *** [glcontextmodes.o] Error 1
make[4]: Leaving directory `/opt/project/buildroot-2009.02/build_arm/Mesa-7.0.3/src/glx/x11'
make[3]: *** [subdirs] Error 1
make[3]: Leaving directory `/opt/project/buildroot-2009.02/build_arm/Mesa-7.0.3/src'
make[2]: *** [default] Error 1

BR Anders



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090224/935eae42/attachment.htm>
