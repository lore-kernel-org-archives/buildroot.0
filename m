From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Aug 2019 10:47:51 +0200
Subject: [Buildroot] Buildroot ts7680_defconfig no longer builds
Message-ID: <20190810104751.647f64ed@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Julien,

The ts7680_defconfig in Buildroot no longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/269139303

The actual error is not directly visble in the Gitlab CI output, but
downloading the full build log shows this when building the kernel:

/tmp/cc2MGAgf.s: Assembler messages:
/tmp/cc2MGAgf.s:893: Error: .err encountered
scripts/Makefile.build:308: recipe for target 'sound/core/compress_offload.o' failed

This typically happens with old kernels, when building with gcc 8.x
(gcc 8.x is now our default gcc version).

Therefore, could you update the kernel version in this defconfig ?

While at it, could you add an entry in the DEVELOPERS file for this
defconfig ?

If you no longer have access to the board, or you're no longer
interested in maintaining this defconfig, please say so.

Thanks!

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
