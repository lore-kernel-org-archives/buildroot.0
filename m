From: Lubomir Rintel <lkundrak@v3.sk>
Date: Sun, 17 May 2020 13:53:26 +0200
Subject: [Buildroot] [PATCH 00/15] OLPC XO updates
Message-ID: <20200517115341.1677382-1-lkundrak@v3.sk>
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

The first few patches fix the kernel configuration:

  [PATCH 01/15] board/olpc: move MTD symbols up to the common config
  [PATCH 02/15] board/olpc: move SERIO_OLPC_APSP to XO-1.75
  [PATCH 03/15] board/olpc: move BACKLIGHT_CLASS_DEVICE up to common
  [PATCH 04/15] board/olpc: move the SDHCI drivers to appropriate board
  [PATCH 05/15] board/olpc: move GPIO_SYSFS to common config
  [PATCH 06/15] board/olpc: move LIS3_SPI to XO-1.75
  [PATCH 07/15] board/olpc: enable dependencies of options we use
  [PATCH 08/15] board/olpc/xo-1: enable JFFS2
  [PATCH 09/15] board/olpc/xo-1: enable STAGING
  [PATCH 10/15] board/olpc/xo-1: enable ACPI
  [PATCH 11/15] board/olpc/xo-1: drop garbage from kernel config

Followed by the jffs2 related enhancements:

  [PATCH 12/15] board/olpc: set JFFS2 root when booting from a MTD
  [PATCH 13/15] configs/olpc_xo1: enable JFFS2 image
  [PATCH 14/15] board/olpc: move the paragraph on firmware up in the
  [PATCH 15/15] board/olpc: document flashing the JFFS2 image

Tested on a XO-1.

Thank you
Lubo
