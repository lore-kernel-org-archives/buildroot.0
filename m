From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Sun, 17 Feb 2013 18:34:56 +0200
Subject: [Buildroot] [PATCH] new package: iso-codes
Message-ID: <1361118896-2263-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

iso-codes

This package provides the ISO-639 Language code list, the ISO-4217 
Currency code list, the ISO-3166 Territory code list, and ISO-3166-2
sub-territory lists, and all their translations in gettext .po form.

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
Note: This package is needed by network-manager-applet (coming soon)

 package/Config.in              |    1 +
 package/iso-codes/Config.in    |   10 ++++++++++
 package/iso-codes/iso-codes.mk |   13 +++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 package/iso-codes/Config.in
 create mode 100644 package/iso-codes/iso-codes.mk

diff --git a/package/Config.in b/package/Config.in
index e1788c2..cf4b456 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -571,6 +571,7 @@ endmenu
 
 menu "Text and terminal handling"
 source "package/enchant/Config.in"
+source "package/iso-codes/Config.in"
 source "package/libfribidi/Config.in"
 source "package/icu/Config.in"
 source "package/libiconv/Config.in"
diff --git a/package/iso-codes/Config.in b/package/iso-codes/Config.in
new file mode 100644
index 0000000..ee3ac49
--- /dev/null
+++ b/package/iso-codes/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_ISO_CODES
+	bool "iso-codes"
+	select BR2_PACKAGE_GETTEXT
+	help
+	  This package provides the ISO-639 Language code list, the ISO-3166
+	  Territory code list, and ISO-3166-2 sub-territory lists, and all
+	  their translations in gettext .po form.
+
+	  http://alioth.debian.org/projects/pkg-isocodes
+
diff --git a/package/iso-codes/iso-codes.mk b/package/iso-codes/iso-codes.mk
new file mode 100644
index 0000000..ac40f9c
--- /dev/null
+++ b/package/iso-codes/iso-codes.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# iso-codes
+#
+#############################################################
+
+ISO_CODES_VERSION = 3.40
+ISO_CODES_SOURCE = iso-codes-$(ISO_CODES_VERSION).tar.xz
+ISO_CODES_SITE = http://pkg-isocodes.alioth.debian.org/downloads
+ISO_CODES_INSTALL_STAGING = YES
+ISO_CODES_DEPENDENCIES = gettext
+
+$(eval $(autotools-package))
-- 
1.7.7.6
