From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Sep 2011 22:12:34 +0200
Subject: [Buildroot] [git commit] u-boot: clarify network settings submenu,
	disable override by default
Message-ID: <20110918210214.7B9868D5CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad1fd9778566e9020ace3b8c7d2b3815b67201b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make it clear that these options override the board defconfig, and
don't enable it by default.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/uboot/Config.in |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 3608cd4..daccd8b 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -92,10 +92,9 @@ config BR2_TARGET_UBOOT_FORMAT_LDR
 endchoice
 
 menuconfig BR2_TARGET_UBOOT_NETWORK
-	bool "Network Settings"
-	default y
+	bool "Custom Network Settings"
 	help
-	  Network settings for U-boot
+	  Custom network settings for U-boot
 
 if BR2_TARGET_UBOOT_NETWORK
 
