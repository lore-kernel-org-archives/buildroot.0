From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 Feb 2011 14:58:12 -0300
Subject: [Buildroot] [PATCH 1/3] libcue: new package
Message-ID: <1297360694-24145-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/Config.in        |    1 +
 package/multimedia/libcue/Config.in |    8 ++++++++
 package/multimedia/libcue/libcue.mk |   13 +++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/libcue/Config.in
 create mode 100644 package/multimedia/libcue/libcue.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 69ad113..b60849e 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -15,6 +15,7 @@ source "package/multimedia/gst-plugins-bad/Config.in"
 source "package/multimedia/gst-plugins-ugly/Config.in"
 source "package/multimedia/libao/Config.in"
 source "package/multimedia/libcdaudio/Config.in"
+source "package/multimedia/libcue/Config.in"
 source "package/multimedia/libcuefile/Config.in"
 source "package/multimedia/libdvdread/Config.in"
 source "package/multimedia/libdvdnav/Config.in"
diff --git a/package/multimedia/libcue/Config.in b/package/multimedia/libcue/Config.in
new file mode 100644
index 0000000..e5e2e16
--- /dev/null
+++ b/package/multimedia/libcue/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBCUE
+	bool "libcue"
+	select BR2_PACKAGE_FLEX
+	select BR2_PACKAGE_FLEX_LIBFL
+	help
+	  CUE Sheet Parser Library
+
+	  http://libcue.sourceforge.net/
diff --git a/package/multimedia/libcue/libcue.mk b/package/multimedia/libcue/libcue.mk
new file mode 100644
index 0000000..2de0423
--- /dev/null
+++ b/package/multimedia/libcue/libcue.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libcue
+#
+################################################################################
+
+LIBCUE_VERSION = 1.4.0
+LIBCUE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libcue
+LIBCUE_SOURCE = libcue-$(LIBCUE_VERSION).tar.bz2
+LIBCUE_DEPENDENCIES = flex
+LIBCUE_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS,package/multimedia,libcue))
-- 
1.7.3.4
