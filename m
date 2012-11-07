From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Nov 2012 18:18:11 +0100
Subject: [Buildroot] [git commit] calao: use zImage on usb-a9263 and
	usb-a9g20 lpw
Message-ID: <20121107190646.2A72899C3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b3c9b89bd97f8ed414fa7b6a479c37a3d68b616b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The board boot more fast with a zImage than a uImage
as the kernel will not have to be relocated during the decompression.

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/calao_usb_a9263_defconfig     |    1 +
 configs/calao_usb_a9g20_lpw_defconfig |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/configs/calao_usb_a9263_defconfig b/configs/calao_usb_a9263_defconfig
index 65263cf..422f35e 100644
--- a/configs/calao_usb_a9263_defconfig
+++ b/configs/calao_usb_a9263_defconfig
@@ -11,3 +11,4 @@ BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="usb_a9263"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/calao/usb-a9263/linux-3.4.4.config"
+BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/calao_usb_a9g20_lpw_defconfig b/configs/calao_usb_a9g20_lpw_defconfig
index e3d9cf5..4a644da 100644
--- a/configs/calao_usb_a9g20_lpw_defconfig
+++ b/configs/calao_usb_a9g20_lpw_defconfig
@@ -12,3 +12,4 @@ BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="usb_a9g20"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/calao/usb-a9g20-lpw/linux-3.4.4.config"
+BR2_LINUX_KERNEL_ZIMAGE=y
