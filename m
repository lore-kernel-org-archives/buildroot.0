From: Matuschka, Sebastian <Sebastian.Matuschka@gcd-solutions.de>
Date: Thu, 2 Oct 2008 10:02:53 +0200
Subject: [Buildroot] No rule to make target
	/buildroot-avr32-v2.2.0/toolchain_build_avr32/gcc-4.2.2-final/.libs_installed
Message-ID: <49ED01FC03EE524BB7BB258E8F93BFF32B27CE@bfl-exchange-1.BFL.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

i'm using the buildroot-avr32-v2.2.0 from atmel.no now.
Compiling with atstk1002_defconfig works, but i had to change a few
things which i need or not need for our board, which is based on the
atstk1002.
Now i get this error every time i make it:
mkdir -p
/buildroot-avr32-v2.2.0/project_build_avr32/RavenBT/root/usr/lib
/buildroot-avr32-v2.2.0/project_build_avr32/RavenBT/root/usr/sbin
touch
/buildroot-avr32-v2.2.0/toolchain_build_avr32/gcc-4.2.2-final/.installed
make: *** No rule to make target
>/buildroot-avr32-v2.2.0/toolchain_build_avr32/gcc-4.2.2-final/.libs_ins
talled<,
  needed by `cross_compiler'. Stop.

I've used make clean, make distclean, deleted toolchain_build_avr32
completely, played with make menuconfig, but I get this error every time
I run make.

I guess that the point where this error occurs is in
toolchain/gcc/gcc-uclibc-4.x.mk (Line 390):
cross_compiler:=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
cross_compiler gcc: uclibc-configured binutils gcc_initial \
	$(LIBFLOAT_TARGET) uclibc \
	$(GCC_BUILD_DIR2)/.installed $(GCC_BUILD_DIR2)/.libs_installed \
	$(GCC_TARGETS)

But I don't know what to correct now.

Best Regards
Sebastian
