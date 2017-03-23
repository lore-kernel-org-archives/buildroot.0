From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 23 Mar 2017 18:28:33 +0100
Subject: [Buildroot] [PATCH v4 12/39] package/kodi-inputstream-rtmp: new
	package
In-Reply-To: <20170323172900.25458-1-bernd.kuhls@t-online.de>
References: <20170323172900.25458-1-bernd.kuhls@t-online.de>
Message-ID: <20170323172900.25458-13-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-inputstream-rtmp/Config.in                  |  7 +++++++
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash |  2 ++
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk   | 13 +++++++++++++
 package/kodi/Config.in                                   |  4 ++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/kodi-inputstream-rtmp/Config.in
 create mode 100644 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
 create mode 100644 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk

diff --git a/package/kodi-inputstream-rtmp/Config.in b/package/kodi-inputstream-rtmp/Config.in
new file mode 100644
index 000000000..c40bff2d7
--- /dev/null
+++ b/package/kodi-inputstream-rtmp/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_KODI_INPUTSTREAM_RTMP
+	bool "kodi-inputstream-rtmp"
+	select BR2_PACKAGE_RTMPDUMP
+	help
+	  RTMP input stream add-on for Kodi
+
+	  https://github.com/notspiff/inputstream.rtmp
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
new file mode 100644
index 000000000..f5a82d2aa
--- /dev/null
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 75a3cc87243a7c92a0a2e3f16710a1e60d05cd8dbc8b7fd1852244fbc5da2ae8  kodi-inputstream-rtmp-v1.0.4.tar.gz
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
new file mode 100644
index 000000000..414c8dfc3
--- /dev/null
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-inputstream-rtmp
+#
+################################################################################
+
+KODI_INPUTSTREAM_RTMP_VERSION = v1.0.4
+KODI_INPUTSTREAM_RTMP_SITE = $(call github,notspiff,inputstream.rtmp,$(KODI_INPUTSTREAM_RTMP_VERSION))
+KODI_INPUTSTREAM_RTMP_LICENSE = GPLv2+
+KODI_INPUTSTREAM_RTMP_LICENSE_FILES = src/RTMPStream.cpp
+KODI_INPUTSTREAM_RTMP_DEPENDENCIES = kodi rtmpdump
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 9ada997a6..692d0192b 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -268,6 +268,10 @@ menu "Audio encoder addons"
 	source "package/kodi-audioencoder-wav/Config.in"
 endmenu
 
+menu "Inputstream addons"
+	source "package/kodi-inputstream-rtmp/Config.in"
+endmenu
+
 menu "PVR addons"
 	source "package/kodi-pvr-argustv/Config.in"
 	source "package/kodi-pvr-dvblink/Config.in"
-- 
2.11.0
