From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 20 Mar 2012 08:27:55 +0000
Subject: [Buildroot] socat build failure with 3.3 kernel
Message-ID: <CAHt8ZCM1Psg50WYKoRuYSeV5tJPg_YsNqSHPS=ctdcthsdJ2bg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The socat build falls over with the following output.

$ make
...
/opt/tfx/arch/arm/usr/bin/ccache
/opt/tfx/arch/arm/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc -pipe
-Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-D_GNU_SOURCE  -Wall -Wno-parentheses -DHAVE_CONFIG_H -I.  -I.   -c -o
socat.o socat.c
/opt/tfx/arch/arm/usr/bin/ccache
/opt/tfx/arch/arm/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc -pipe
-Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-D_GNU_SOURCE  -Wall -Wno-parentheses -DHAVE_CONFIG_H -I.  -I.   -c -o
xioinitialize.o xioinitialize.c
/opt/tfx/arch/arm/usr/bin/ccache
/opt/tfx/arch/arm/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc -pipe
-Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-D_GNU_SOURCE  -Wall -Wno-parentheses -DHAVE_CONFIG_H -I.  -I.   -c -o
xiohelp.o xiohelp.c
In file included from sysincludes.h:163:0,
                 from xiosysincludes.h:11,
                 from xioinitialize.c:7:
/opt/tfx/arch/arm/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/linux/ext2_fs.h:178:49:
error: expected ')' before 'mode'
In file included from sysincludes.h:163:0,
                 from socat.c:11:
/opt/tfx/arch/arm/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/linux/ext2_fs.h:178:49:
error: expected ')' before 'mode'
make[1]: *** [socat.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: *** [xioinitialize.o] Error 1
In file included from sysincludes.h:163:0,
                 from xiosysincludes.h:11,
                 from xiohelp.c:7:
/opt/tfx/arch/arm/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/linux/ext2_fs.h:178:49:
error: expected ')' before 'mode'
make[1]: *** [xiohelp.o] Error 1
make[1]: Leaving directory
`/home/simond/TrainFX/code/git/third_party/buildroot/output/build/socat-2.0.0-b4'
make: *** [/home/simond/TrainFX/code/git/third_party/buildroot/output/build/socat-2.0.0-b4/.stamp_built]
Error 2

Also, running

$ diff /opt/tfx/arch/arm/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/linux/ext2_fs.h
output/build/linux-3.3/include/linux/ext2_fs.h

I notice that the header being included is not the same as the header
in the kernel source tree; is this to be expected? Any help would be
greatly appreciated.
