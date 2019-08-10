From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Aug 2019 10:34:57 +0200
Subject: [Buildroot] Buildroot toradex_apalis_imx6_defconfig no longer builds
Message-ID: <20190810103457.3207daf1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergio, Scott,

The toradex_apalis_imx6_defconfig in Buildroot no longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/269139299

The error is:

/tmp/ccmYVKw5.s: Assembler messages:
/tmp/ccmYVKw5.s:846: Error: .err encountered
/tmp/ccmYVKw5.s:862: Error: .err encountered
/tmp/ccmYVKw5.s:3457: Error: .err encountered
scripts/Makefile.build:258: recipe for target 'fs/fat/dir.o' failed

The kernel is too old, and causes build issues with gcc 8.x, which is
now our default gcc version. The fix is most likely to update the
kernel, either to a newer 4.1.x release, or to a newer series.

Could one of you have a look into this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
