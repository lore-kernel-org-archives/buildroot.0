From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  4 Jun 2013 23:49:53 +0200
Subject: [Buildroot] [PATCH] legacy: add options for the legacy Realtek WiFi
	options in linux-firmware
Message-ID: <1370382593-26889-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Config.in.legacy | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7748ab3..bb9c4a9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -41,6 +41,24 @@ comment "will fail.                                          "
 endif
 
 #
+# Legacy options since 2013.05
+#
+
+config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8192
+	bool "Realtek 8192 replaced by Realtek 81xx"
+	select BR2_LEGACY
+	select BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX
+	help
+	  Now covers the whole Realtek 81xx familly: 8188/8192.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8712
+	bool "Realtek 8712 replaced by Realtek 87xx"
+	select BR2_LEGACY
+	select BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX
+	help
+	  Now covers the whole Realtek 87xx familly: 8712/8723.
+
+#
 # Legacy options since 2013.02
 #
 
-- 
1.8.1.2
