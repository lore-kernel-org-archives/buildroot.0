From: Nicolas Dechesne <n-dechesne@ti.com>
Date: Sun,  5 Feb 2012 01:35:45 +0100
Subject: [Buildroot] [PATCH 0/2] Initial support for Panda and PandaES
Message-ID: <1328402147-21404-1-git-send-email-n-dechesne@ti.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here is an attempt to add support for TI PandaBoard and PandaBoard ES.

Because we want to deprecate x-loader in favor of u-boot SPL:
- my first patch adds support for SPL in BR
- SPL is enabled by default in my panda config.

Both Panda and PandaES have been tested, detection is done at run time
in uboot and kernel, so we can have 1 configuration only.

I've used DEVTMPFS by default, as 1) I generally prefer this, and 2) ttyO
was missing from the generic dev table... 

Nicolas Dechesne (2):
  Add support for U-Boot SPL
  Initial support for PandaBoard and PandaBoard ES

 boot/uboot/Config.in         |    6 ++++++
 boot/uboot/uboot.mk          |    4 ++++
 configs/pandaboard_defconfig |   24 ++++++++++++++++++++++++
 3 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 configs/pandaboard_defconfig

-- 
1.7.8.3
