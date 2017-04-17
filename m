From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 17 Apr 2017 21:54:31 +0200
Subject: [Buildroot] [PATCH v5 32/34] package/kodi-inputstream-adaptive: new
	package
In-Reply-To: <20170417195433.26672-1-bernd.kuhls@t-online.de>
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
Message-ID: <20170417195433.26672-33-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-inputstream-adaptive/Config.in                 |  8 ++++++++
 .../kodi-inputstream-adaptive.hash                          |  2 ++
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 13 +++++++++++++
 package/kodi/Config.in                                      |  1 +
 4 files changed, 24 insertions(+)
 create mode 100644 package/kodi-inputstream-adaptive/Config.in
 create mode 100644 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
 create mode 100644 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk

diff --git a/package/kodi-inputstream-adaptive/Config.in b/package/kodi-inputstream-adaptive/Config.in
new file mode 100644
index 000000000..d5fe5e61c
--- /dev/null
+++ b/package/kodi-inputstream-adaptive/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_KODI_INPUTSTREAM_ADAPTIVE
+	bool "kodi-inputstream-adaptive"
+	select BR2_PACKAGE_LIBPLATFORM
+	select BR2_PACKAGE_KODI_PLATFORM
+	help
+	  Kodi inputstream addon for several manifest types
+
+	  https://github.com/peak3d/inputstream.adaptive
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
new file mode 100644
index 000000000..d3600eb19
--- /dev/null
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 7e3fbb9bac11777b2f553fce0f36f2dd463adbb956a957e6c000c7013202b9ad  kodi-inputstream-adaptive-v1.0.6.tar.gz
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
new file mode 100644
index 000000000..bd3c34c0c
--- /dev/null
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-inputstream-adaptive
+#
+################################################################################
+
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = v1.0.6
+KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,peak3d,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
+KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPLv2+
+KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = src/main.cpp
+KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = libplatform kodi-platform
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index cc8470319..f4095c9fe 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -293,6 +293,7 @@ menu "Audio encoder addons"
 endmenu
 
 menu "Inputstream addons"
+	source "package/kodi-inputstream-adaptive/Config.in"
 	source "package/kodi-inputstream-rtmp/Config.in"
 endmenu
 
-- 
2.11.0
