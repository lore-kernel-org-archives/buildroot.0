From: Nicolas Dechesne <n-dechesne@ti.com>
Date: Mon, 12 Mar 2012 23:41:09 +0100
Subject: [Buildroot] [PATCH 0/3 v3] Initial support for Panda and PandaES
Message-ID: <1331592072-32327-1-git-send-email-n-dechesne@ti.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here is my 3rd attempt to add support for TI PandaBoard and PandaBoard ES.

v3:
 - added more documentation in uboot/Config.in regarding SPL
 - added 'acked-by' as per review
 - rebased on master branch as of 2012/03/12

v2:

 - typo cleanup as per reviews
 - introduce BR2_TARGET_UBOOT_FORMAT_IMG to allow use of u-boot.img
   on platforms that need it, like OMAP. This is better than v1 since
   u-boot.img is not stricly dependent on SPL, so making 2 parameters
   makes more sense.

v1:

Because we want to deprecate x-loader in favor of u-boot SPL:
- my first patch adds support for SPL in BR
- SPL is enabled by default in my panda config.

Both Panda and PandaES have been tested, detection is done at run time
in uboot and kernel, so we can have 1 configuration only.

I've used DEVTMPFS by default, as 1) I generally prefer this, and 2) ttyO
was missing from the generic dev table... 


Nicolas Dechesne (3):
  uboot: Add support for U-Boot SPL
  uboot: add a new binary format for u-boot.img
  configs: add support for PandaBoard and PandaBoard ES

 boot/uboot/Config.in         |   12 ++++++++++++
 boot/uboot/uboot.mk          |    4 ++++
 configs/pandaboard_defconfig |   25 +++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 configs/pandaboard_defconfig

-- 
1.7.9.1
