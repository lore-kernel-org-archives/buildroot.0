From: Linux User <newhorizons009@gmail.com>
Date: Wed, 21 Dec 2016 08:22:34 -0500
Subject: [Buildroot] logrotate error
Message-ID: <CA+12NBJSywCO=azSzUtUdSS3irhXTUnhNpcRL6Rr-R=g_9UbHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Guys,

I enabled the logrotate package through the menuconfig, and my compilation
breaks. Can someone pls shed some light.

>>> logrotate 3.8.4 Extracting
gzip -d -c
/home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/dl/logrotate-3.8.4.tar.gz
| tar --strip-components=1 -C
/home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/build/logrotate-3.8.4
-xf -
>>> logrotate 3.8.4 Patching package//logrotate
>>> logrotate 3.8.4 Configuring
>>> logrotate 3.8.4 Building
/usr/bin/make -j9
CC="/home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/host/usr/bin/arm-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os
-g3"
LDFLAGS="/home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/host/usr/bin/arm-linux-gnueabihf-ld"
-C
/home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/build/logrotate-3.8.4
make[1]: Entering directory
`/home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/build/logrotate-3.8.4'
/home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/host/usr/bin/arm-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os
-g3 -E -Wall -D_GNU_SOURCE -DLinux -DVERSION=\"3.8.4\"  -D_LARGEFILE_SOURCE
-D_FILE_OFFSET_BITS=64 -g    -M logrotate.c log.c config.c basenames.c  >
.depend
/home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/host/usr/bin/arm-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os
-g3 -Wall -D_GNU_SOURCE -DLinux -DVERSION=\"3.8.4\"  -D_LARGEFILE_SOURCE
-D_FILE_OFFSET_BITS=64 -g      -c -o logrotate.o logrotate.c
/home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/host/usr/bin/arm-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os
-g3 -Wall -D_GNU_SOURCE -DLinux -DVERSION=\"3.8.4\"  -D_LARGEFILE_SOURCE
-D_FILE_OFFSET_BITS=64 -g      -c -o log.o log.c
/home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/host/usr/bin/arm-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os
-g3 -Wall -D_GNU_SOURCE -DLinux -DVERSION=\"3.8.4\"  -D_LARGEFILE_SOURCE
-D_FILE_OFFSET_BITS=64 -g      -c -o config.o config.c
/home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/host/usr/bin/arm-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os
-g3 -Wall -D_GNU_SOURCE -DLinux -DVERSION=\"3.8.4\"  -D_LARGEFILE_SOURCE
-D_FILE_OFFSET_BITS=64 -g      -c -o basenames.o basenames.c
echo "0" > ./test/test.ACL ;
echo "0" > ./test/test.SELINUX ;
/home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/host/usr/bin/arm-linux-gnueabihf-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os
-g3
/home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/host/usr/bin/arm-linux-gnueabihf-ld
logrotate.o log.o config.o basenames.o -lpopt  -o logrotate
/home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld:
warning: Cannot create .eh_frame_hdr section, --eh-frame-hdr ignored.
/home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld:
unknown architecture of input file
`/home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/host/usr/bin/arm-linux-gnueabihf-ld'
is incompatible with arm output
/home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld:
error in
/home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/host/usr/bin/arm-linux-gnueabihf-ld(.eh_frame);
no .eh_frame_hdr table will be created.
collect2: error: ld returned 1 exit status
make[1]: *** [logrotate] Error 1
make[1]: Leaving directory
`/home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/build/logrotate-3.8.4'
make: ***
[/home/user/PNC_Projects/TR3000/Firmware/Analog_IM/platforms/som/src/output/build/logrotate-3.8.4/.stamp_built]
Error 2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161221/aeaee695/attachment.html>
