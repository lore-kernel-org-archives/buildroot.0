From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2020 10:49:06 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/kodi-pvr-zattoo: new package
In-Reply-To: <20200614084906.874597-1-bernd.kuhls@t-online.de>
References: <20200614084906.874597-1-bernd.kuhls@t-online.de>
Message-ID: <20200614084906.874597-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: no changes

 package/kodi-pvr-zattoo/Config.in            | 10 ++++++++++
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash |  3 +++
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 13 +++++++++++++
 package/kodi/Config.in                       |  1 +
 4 files changed, 27 insertions(+)
 create mode 100644 package/kodi-pvr-zattoo/Config.in
 create mode 100644 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
 create mode 100644 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk

diff --git a/package/kodi-pvr-zattoo/Config.in b/package/kodi-pvr-zattoo/Config.in
new file mode 100644
index 0000000000..ab7ff70034
--- /dev/null
+++ b/package/kodi-pvr-zattoo/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_KODI_PVR_ZATTOO
+	bool "kodi-pvr-zattoo"
+	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_LIBPLATFORM
+	select BR2_PACKAGE_RAPIDXML
+	select BR2_PACKAGE_TINYXML2
+	help
+	  Kodi PVR-Addon for Zattoo
+
+	  https://github.com/rbuehlma/pvr.zattoo
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
new file mode 100644
index 0000000000..5e1454eff6
--- /dev/null
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  36dedc8bc6b95aa6036d0e5aa94d90f7d965f57325cc858ad6bcc401f371d3ed  kodi-pvr-zattoo-18.1.19-Leia.tar.gz
+sha256  d3670aef89085fd6b97665967a8422c89324afbc4720daa0975696a2ee92e236  debian/copyright
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
new file mode 100644
index 0000000000..14ac22db50
--- /dev/null
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-pvr-zattoo
+#
+################################################################################
+
+KODI_PVR_ZATTOO_VERSION = 18.1.19-Leia
+KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
+KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
+KODI_PVR_ZATTOO_LICENSE_FILES = debian/copyright
+KODI_PVR_ZATTOO_DEPENDENCIES = kodi-platform libplatform rapidxml tinyxml2
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index dd90c999fe..5e1c6f419e 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -385,6 +385,7 @@ menu "PVR addons"
 	source "package/kodi-pvr-vdr-vnsi/Config.in"
 	source "package/kodi-pvr-vuplus/Config.in"
 	source "package/kodi-pvr-wmc/Config.in"
+	source "package/kodi-pvr-zattoo/Config.in"
 endmenu
 
 menu "Screensavers"
-- 
2.26.2
