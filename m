From: Berns <Berns@BEKA-Elektronik.de>
Date: Mon, 10 Dec 2012 13:35:50 +0100
Subject: [Buildroot] buildroot 2012.11 large file support
Message-ID: <NDBBKLDECLOIHFJKBINACEFAFPAA.Berns@BEKA-Elektronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

i have tried to build at91sam9263ek_defconfig (without any modification)
with the latest release 2012.11 on a 32bit Ubuntu12.04 machine.
The build of the toolchain fails with :
.../buildroot-2012.11/output/toolchain/uClibc_dev//usr/include/features.h:21
9:5: Fehler: #error It appears you have defined _FILE_OFFSET_BITS=64.
Unfortunately, uClibc was built without large file support enabled.

Large file support isn't select and i have also checked it with make
uclibc-menuconfig for uclibc.
The same problem happend with beaglebone_defconfig.

After "make clean" and selecting "large file support" the build process
works.

This problem doesn't happend with release 2012.08.

Has anybody a hint for me ?

Thanks

Rainer
