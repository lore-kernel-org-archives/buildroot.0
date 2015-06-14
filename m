From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 16:36:01 +0200
Subject: [Buildroot] [PATCH/RFC v2 02/44] package/libplatform: new package
In-Reply-To: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1434292603-12052-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed by libcec 3.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                  |    1 +
 package/libplatform/Config.in      |    6 ++++++
 package/libplatform/libplatform.mk |   16 ++++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 package/libplatform/Config.in
 create mode 100644 package/libplatform/libplatform.mk

diff --git a/package/Config.in b/package/Config.in
index 8823c8d..442641f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1044,6 +1044,7 @@ menu "Other"
 	source "package/liblinear/Config.in"
 	source "package/libnspr/Config.in"
 	source "package/libpfm4/Config.in"
+	source "package/libplatform/Config.in"
 	source "package/libplist/Config.in"
 	source "package/libpthread-stubs/Config.in"
 	source "package/libpthsem/Config.in"
diff --git a/package/libplatform/Config.in b/package/libplatform/Config.in
new file mode 100644
index 0000000..7d275b1
--- /dev/null
+++ b/package/libplatform/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBPLATFORM
+	bool
+	help
+	  Platform support library used by libCEC and binary add-ons for Kodi
+
+	  https://github.com/Pulse-Eight/platform
diff --git a/package/libplatform/libplatform.mk b/package/libplatform/libplatform.mk
new file mode 100644
index 0000000..efb5f29
--- /dev/null
+++ b/package/libplatform/libplatform.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libplatform
+#
+################################################################################
+
+LIBPLATFORM_VERSION = 1.0.9
+LIBPLATFORM_SITE = $(call github,Pulse-Eight,platform,$(LIBPLATFORM_VERSION))
+LIBPLATFORM_LICENSE = GPLv3+
+LIBPLATFORM_LICENSE_FILES = COPYING
+LIBPLATFORM_INSTALL_STAGING = YES
+
+LIBPLATFORM_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
-- 
1.7.10.4
