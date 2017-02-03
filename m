From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  3 Feb 2017 17:20:04 +0100
Subject: [Buildroot] [PATCH v2 10/38] package/kodi-inputstream-rtmp: new
	package
In-Reply-To: <20170203162032.2923-1-bernd.kuhls@t-online.de>
References: <20170203162032.2923-1-bernd.kuhls@t-online.de>
Message-ID: <20170203162032.2923-11-bernd.kuhls@t-online.de>
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
index 000000000..673547300
--- /dev/null
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 d89ebb21256fcac35ddb961d42e2cae7709b15a431e717054a0cab7f9a54b391  kodi-inputstream-rtmp-v1.0.3.tar.gz
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
new file mode 100644
index 000000000..c19fe562e
--- /dev/null
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# kodi-inputstream-rtmp
+#
+################################################################################
+
+KODI_INPUTSTREAM_RTMP_VERSION = v1.0.3
+KODI_INPUTSTREAM_RTMP_SITE = $(call github,notspiff,inputstream.rtmp,$(KODI_INPUTSTREAM_RTMP_VERSION))
+KODI_INPUTSTREAM_RTMP_LICENSE = GPLv2+
+KODI_INPUTSTREAM_RTMP_LICENSE_FILES = src/RTMPStream.cpp
+KODI_INPUTSTREAM_RTMP_DEPENDENCIES = kodi rtmpdump
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index ef555b502..842e0b6a3 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -267,6 +267,10 @@ menu "Audio encoder addons"
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
