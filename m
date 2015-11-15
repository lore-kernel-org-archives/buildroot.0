From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 15 Nov 2015 12:52:20 +0100
Subject: [Buildroot] [PATCH/next v2 4/4] package/nvidia-driver: depends on
	xorg-xserver =< 1.17
In-Reply-To: <1447588340-8270-1-git-send-email-bernd.kuhls@t-online.de>
References: <1447588340-8270-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1447588340-8270-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://www.phoronix.com/scan.php?page=news_item&px=x.org-server-1.18-video-abi
https://www.archlinux.org/news/xorg-1180-enters-testing/
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/nvidia-driver/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/nvidia-driver/Config.in b/package/nvidia-driver/Config.in
index b50e2c3..a9a7f3e 100644
--- a/package/nvidia-driver/Config.in
+++ b/package/nvidia-driver/Config.in
@@ -1,11 +1,13 @@
-comment "nvidia-driver needs an (e)glibc toolchain"
+comment "nvidia-driver needs Xorg <= 1.17 and an (e)glibc toolchain"
 	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
+		BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_20
 
 config BR2_PACKAGE_NVIDIA_DRIVER
 	bool "nvidia-driver"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_20
 	help
 	  The binary-only driver blob for NVidia cards.
 	  This is the userland part only.
-- 
2.6.2
