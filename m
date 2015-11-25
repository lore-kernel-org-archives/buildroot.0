From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Nov 2015 09:22:09 +0100
Subject: [Buildroot] defconfig build failure on cubieboard2_defconfig
Message-ID: <20151125092209.6e1bb1ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The Travis build of all defconfigs failed last night, on the
cubieboard2_defconfig:

   https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/93053316

The error is:

/home/travis/build/buildroot/buildroot-defconfig-testing/buildroot/output/build/uboot-b4bca5e0651b460a4511582f07a935cb48f74948/spl/lib/vsprintf.o:
file not recognized: File truncated

The previous build on 953b84a930fe6872ec349fb977fc9475da501931 was
entirely successful, but last night build on
b29cb968040e31c5fa1abdfbe8d4c26e237d730a failed. But I don't quite see
between those two commits what could have caused the problem:

b29cb968040e31c5fa1abdfbe8d4c26e237d730a pcre: security bump to version 8.38
caca64ed5ffe62055b13326a62c9bd7605f7ad7d gstreamer1: fix unaligned detection for nios2
a8362d11c55468c624e1edb2c495beb56db1b9f6 gstreamer: fix unaligned detection for nios2
c626998d47e14cc8086917fe17c28045a2f9b09a libfreeimage: fix build issue with gcc 5.x
7f1ec872cd163ff1b5dd2448f8ff8af1a7178347 openntpd: fix linking problem when building statically
97ab48658d574ded87f8af799795ba7ed76f6ba4 docs/website: New website
a597e3c676948c6c1eb6440c82f19b7460f29192 Revert "openssl: enable parallel build and installation"
917b6e72ea01c689a2376b24c87d7f6f1570a06f fastd: add upstream patch to fix build with musl
2a8e96d05738421898c373ffaeb61ef3ab008ef2 package/rpi-userland: bump version

So this looks like a parallel build issue. Is it possible that U-Boot
doesn't build properly in parallel ? Seems unlikely, no ? Any ideas ?

All other defconfigs built fine.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
