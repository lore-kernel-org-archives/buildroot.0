From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 19:55:34 +0200
Subject: [Buildroot] configs/ci20_defconfig does not build
Message-ID: <20200808195534.477395e7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ezequiel,

The ci20_defconfig you have contributed to Buildroot no longer builds.
The kernel fails with tons of:

                 from include/linux/list.h:8,
                 from include/linux/module.h:9,
                 from arch/mips/jz4740/prom.c:16:
include/linux/log2.h:22:1: error: ignoring attribute 'noreturn' because it conflicts with attribute 'const' [-Werror=a
ttributes]
   22 | int ____ilog2_NaN(void);
      | ^~~

Could you have a look ? If you're no longer interested in maintaining
the CI20 defconfig, feel free to send a patch to drop this defconfig.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
