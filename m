From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 22:46:54 +0200
Subject: [Buildroot] [git commit] package/kodi-inputstream-adaptive: new
	package
Message-ID: <20170722204650.01A4481DDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b41fc898b45b1afa1362ef7f80eb065bccb42e35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: use SPDX license code.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-inputstream-adaptive/Config.in                 |  8 ++++++++
 .../kodi-inputstream-adaptive.hash                          |  2 ++
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 13 +++++++++++++
 package/kodi/Config.in                                      |  1 +
 4 files changed, 24 insertions(+)

diff --git a/package/kodi-inputstream-adaptive/Config.in b/package/kodi-inputstream-adaptive/Config.in
new file mode 100644
index 0000000..d5fe5e6
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
index 0000000..e461bd9
--- /dev/null
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 cb0fa6f8326b439006701890d3fd90621b4f6f2db6055a9abe781b089170d28f  kodi-inputstream-adaptive-1.0.8_k17.tar.gz
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
new file mode 100644
index 0000000..e5a197c
--- /dev/null
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-inputstream-adaptive
+#
+################################################################################
+
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 1.0.8_k17
+KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,peak3d,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
+KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
+KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = src/main.cpp
+KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = libplatform kodi-platform
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 39355a7..68c72e6 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -300,6 +300,7 @@ menu "Peripheral addons"
 endmenu
 
 menu "Inputstream addons"
+	source "package/kodi-inputstream-adaptive/Config.in"
 	source "package/kodi-inputstream-rtmp/Config.in"
 endmenu
 
