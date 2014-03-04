From: =?ISO-8859-1?Q?Vincent_Stehl=E9?= <vincent.stehle@freescale.com>
Date: Tue, 4 Mar 2014 08:46:28 +0100
Subject: [Buildroot] Linux won't build any more?
Message-ID: <531584D4.3060301@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

FYI I wonder if the recent commits on the master branch have not broken 
linux kernel build in some cases. For example:

   $ make freescale_imx6sabresd_defconfig
   $ make
   linux/linux.mk:171: *** Configuration file 
'/arch/arm/configs/imx6_defconfig' not found..  Stop.

Same with qemu_arm_vexpress_defconfig.

Git bisect points at commit b4cacbf5b15db06132b5f401d39b4c8d4e79158e, 
"linux: check the configuration file exists". If I revert this commit 
build will indeed still complain about the config but will go further.

Best regards,

V.
