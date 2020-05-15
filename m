From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 May 2020 22:59:21 +0200
Subject: [Buildroot] [git commit] configs/olimex_a20_olinuxino_lime{,
 2}: use Python 3.x
Message-ID: <20200515204314.3459D918D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dfbff32543fc0ffdc1b2defbf6a21224eb8b804f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The olimex_a20_olinuxino_lime{,2}_defconfig uses U-Boot 2020.04 since
commit 6b805c3ab70b5ee63c7dcd3a4aa48a999a8a43c3. This new U-Boot
version needs Python 3.x for pylibfdt.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/535054468
  https://gitlab.com/buildroot.org/buildroot/-/jobs/535054466

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998 at free.fr: update with the new NEEDS_PYTHON semantics]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/olimex_a20_olinuxino_lime2_defconfig | 1 +
 configs/olimex_a20_olinuxino_lime_defconfig  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index eb6a82c2f6..243a5a96f6 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -46,6 +46,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 740fd4357a..ec909ebf17 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -46,6 +46,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
