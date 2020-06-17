From: Lubomir Rintel <lkundrak@v3.sk>
Date: Wed, 17 Jun 2020 12:49:08 +0200
Subject: [Buildroot] [PATCH v2 00/17] OLPC XO updates
Message-ID: <20200617104925.1036330-1-lkundrak@v3.sk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

please consider applying this patch set. The ultimate goal is to enable
jffs2 images for the XO-1. While I that, I noticed that while tidying up
the kernel configuration, I messed up a bit and some config symbols
ended up disabled.

Since this was first posted, a 5.7 kernel was release. I've tested that
5.7.1 works well on both XO-1.75 (arm) and XO-1 (x86), so I've added two
patches that bump the kernel version too.

The first few patches fix the kernel configuration:

  [PATCH v2 01/17] board/olpc: move MTD symbols up to the common config
  [PATCH v2 02/17] board/olpc: move SERIO_OLPC_APSP to XO-1.75
  [PATCH v2 03/17] board/olpc: move BACKLIGHT_CLASS_DEVICE up to common
  [PATCH v2 04/17] board/olpc: move the SDHCI drivers to appropriate board
  [PATCH v2 05/17] board/olpc: move GPIO_SYSFS to common config
  [PATCH v2 06/17] board/olpc: move LIS3_SPI to XO-1.75
  [PATCH v2 07/17] board/olpc: enable dependencies of options we use
  [PATCH v2 08/17] board/olpc/xo-1: enable JFFS2
  [PATCH v2 09/17] board/olpc/xo-1: enable STAGING
  [PATCH v2 10/17] board/olpc/xo-1: enable ACPI
  [PATCH v2 11/17] board/olpc/xo-1: drop garbage from kernel config

Followed by the jffs2 related enhancements:

  [PATCH v2 12/17] board/olpc: set JFFS2 root when booting from a MTD
  [PATCH v2 13/17] configs/olpc_xo1: enable JFFS2 image
  [PATCH v2 14/17] board/olpc: move the paragraph on firmware up in the
  [PATCH v2 15/17] board/olpc: document flashing the JFFS2 image

These two are new in v2:

  [PATCH v2 16/17] configs/olpc_xo1: bump kernel version
  [PATCH v2 17/17] configs/olpc_xo175: bump kernel version

Tested on a XO-1 and XO-1.75.

Thank you
Lubo
