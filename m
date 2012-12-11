From: Berns <Berns@BEKA-Elektronik.de>
Date: Tue, 11 Dec 2012 10:30:42 +0100
Subject: [Buildroot] buildroot 2012.11 large file support
In-Reply-To: <NDBBKLDECLOIHFJKBINACEFAFPAA.Berns@BEKA-Elektronik.de>
Message-ID: <NDBBKLDECLOIHFJKBINAIEFOFPAA.Berns@BEKA-Elektronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I changed from gcc 4.6.X to gcc 4.5.X and now it works.
Maybe it's an isue with ubuntu 12.04 and gcc 4.6.X.


-----Original Message-----
From: buildroot-bounces@busybox.net
[mailto:buildroot-bounces at busybox.net]On Behalf Of Berns
Sent: Monday, December 10, 2012 1:36 PM
To: buildroot at busybox.net
Subject: [Buildroot] buildroot 2012.11 large file support


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

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
