From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Sep 2014 23:15:02 +0200
Subject: [Buildroot] [PATCH 12/14] package/linux-firmware: add new revision
	for iwlwifi firmware
In-Reply-To: <cover.1411161197.git.yann.morin.1998@free.fr>
References: <cover.1411161197.git.yann.morin.1998@free.fr>
Message-ID: <a0fac01fac2014e0d4b9da7e1a8cb1de7dd863d1.1411161197.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index efb3851..9d954c2 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -73,7 +73,8 @@ choice
 	bool "iwlwifi 3160/726x revision to use"
 	help
 	  Use revision 7 for kernel 3.10 to 3.12.
-	  Use revision 8 for kernel 3.13 onward.
+	  Use revision 8 for kernel 3.13 to 3.15.
+	  Use revision 9 for kernel 3.16 onward.
 
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV_7
 	prompt "revision 7"
@@ -83,7 +84,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV_7
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV_8
 	prompt "revision 8"
 	help
-	  Use revision 8 for kernel 3.13 onward.
+	  Use revision 8 for kernel 3.13 to 3.15.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV_9
+	prompt "revision 9"
+	help
+	  Use revision 9 for kernel 3.16 onward.
 
 endchoice
 
@@ -91,6 +97,7 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV
 	int
 	default 7 if BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV_7
 	default 8 if BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV_8
+	default 9 if BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV_9
 
 endif # iwlwifi 3160/7260
 
-- 
1.9.1
