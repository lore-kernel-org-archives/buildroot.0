From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 11 Feb 2014 16:23:59 +0100
Subject: [Buildroot] Build error from time to time
Message-ID: <AFACE42542AE499CA9403FAD6805F21A@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

Sometimes I get this error, if I then run make again after removing the nettle-2.7.1 build directory
It rebuilds nettle and the build ends without errors.
Could this be caused by the ccache ?

(I had run make clean before I started the new build.)


ic -MT ecc-modq.o -MD -MP -MF ecc-modq.o.d -fpic -c ecc-modq.c \
	&& true
/home/buildroot12git/output/host/usr/bin/ccache /home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -pipe -Os  -Wno-pointer-sign -Wall -W   -Wmissing-prototypes -Wmissing-declarations -Wstrict-prototypes
-Wpointer-arith -Wbad-function-cast -Wnested-externs -fpic -MT ecc-generic-redc.o -MD -MP -MF ecc-generic-redc.o.d -fpic -c
ecc-generic-redc.c \
	&& true
/usr/bin/make eccdata
make[3]: Entering directory `/home/buildroot12git/output/build/nettle-2.7.1'
Makefile:595: ecc-generic-modq.o.d: No such file or directory
/home/buildroot12git/output/host/usr/bin/ccache /home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -pipe -Os  -Wno-pointer-sign -Wall -W   -Wmissing-prototypes -Wmissing-declarations -Wstrict-prototypes
-Wpointer-arith -Wbad-function-cast -Wnested-externs -fpic -MT ecc-size.o -MD -MP -MF ecc-size.o.d -fpic -c ecc-size.c \
	&& true
make[3]: *** No rule to make target `ecc-generic-modq.o.d'.  Stop.
make[3]: Leaving directory `/home/buildroot12git/output/build/nettle-2.7.1'
make[2]: *** [eccdata.stamp] Error 2
make[2]: *** Waiting for unfinished jobs....
make[2]: Leaving directory `/home/buildroot12git/output/build/nettle-2.7.1'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/buildroot12git/output/build/nettle-2.7.1'
make: *** [/home/buildroot12git/output/build/nettle-2.7.1/.stamp_built] Error 2

Regards 
Sagaert Johan
