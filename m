From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 21:15:03 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: add new revision
	for iwlwifi firmware
Message-ID: <20140921191513.1AD909D488@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f4be99ea724cc6f61e37b236f0a6147e8114930a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/Config.in |   11 +++++++++--
 1 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index dc07a96..99f5956 100644
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
 
