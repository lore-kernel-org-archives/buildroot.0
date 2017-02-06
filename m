From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:24 -0500
Subject: [Buildroot] [PATCH 11/44] linux-firmware: add g07007 mpeg-4 encoder
	option.
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-12-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Because this is also a video device, I renamed the video menu to
video card and created a video encoder/decoder firmware menu.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/linux-firmware/Config.in | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index b3be6f8..0d6ff51 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -47,7 +47,7 @@ config BR2_PACKAGE_LINUX_FIRMWARE_YAMAHA
 
 endmenu # Audio
 
-menu "Video firmware"
+menu "Video card firmware"
 
 config BR2_PACKAGE_LINUX_FIRMWARE_AMD_RADEON
 	bool "AMD Radeon video card firmware"
@@ -74,7 +74,16 @@ config BR2_PACKAGE_LINUX_FIRMWARE_NOUVEAU
 	help
 	  Firmware files for various NVIDIA cards.
 
-endmenu # Video
+endmenu # Video card
+
+menu "Video encoder/decoder firmware"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_GO7007
+	bool "GO7007 MPEG-4 encoder"
+	help
+	  Firmware files for the GO7007 MPEG-4 encoder.
+
+endmenu # Video encoder
 
 menu "Bluetooth firmware"
 
-- 
2.9.3
