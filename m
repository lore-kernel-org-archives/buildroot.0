From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  7 Jul 2014 16:53:03 -0300
Subject: [Buildroot] [PATCH 1/2] libmpdclient: new package
Message-ID: <1404762784-16079-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                    |  1 +
 package/libmpdclient/Config.in       |  7 +++++++
 package/libmpdclient/libmpdclient.mk | 16 ++++++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 package/libmpdclient/Config.in
 create mode 100644 package/libmpdclient/libmpdclient.mk

diff --git a/package/Config.in b/package/Config.in
index 9900271..4b2dd2b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -518,6 +518,7 @@ menu "Audio/Sound"
 	source "package/libmad/Config.in"
 	source "package/libmodplug/Config.in"
 	source "package/libmpd/Config.in"
+	source "package/libmpdclient/Config.in"
 	source "package/libreplaygain/Config.in"
 	source "package/libsamplerate/Config.in"
 	source "package/libsndfile/Config.in"
diff --git a/package/libmpdclient/Config.in b/package/libmpdclient/Config.in
new file mode 100644
index 0000000..a58c6c3
--- /dev/null
+++ b/package/libmpdclient/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBMPDCLIENT
+	bool "libmpdclient"
+	help
+	  A stable, documented, asynchronous API library for interfacing MPD
+	  in the C, C++ & Objective C languages.
+
+	  http://www.musicpd.org/libs/libmpdclient/
diff --git a/package/libmpdclient/libmpdclient.mk b/package/libmpdclient/libmpdclient.mk
new file mode 100644
index 0000000..530e4fc
--- /dev/null
+++ b/package/libmpdclient/libmpdclient.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libmpdclient
+#
+################################################################################
+
+LIBMPDCLIENT_VERSION_MAJOR = 2
+LIBMPDCLIENT_VERSION = $(LIBMPDCLIENT_VERSION_MAJOR).9
+LIBMPDCLIENT_SOURCE = libmpdclient-$(LIBMPDCLIENT_VERSION).tar.xz
+LIBMPDCLIENT_SITE = http://www.musicpd.org/download/libmpdclient/$(LIBMPDCLIENT_VERSION_MAJOR)
+LIBMPDCLIENT_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
+LIBMPDCLIENT_INSTALL_STAGING = YES
+LIBMPDCLIENT_LICENSE = BSD-3c
+LIBMPDCLIENT_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.8.5.5
