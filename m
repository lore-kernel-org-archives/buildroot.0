From: Belisko Marek <marek.belisko@gmail.com>
Date: Wed, 22 Sep 2010 09:53:50 +0200
Subject: [Buildroot] [PATCH] Add pcs-lite package to buildroot.
Message-ID: <AANLkTinyYg2p72sarSbRWfxXqZVg_WpvvfQMVdk8ryMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add pcs-lite package to buildroot.

Signed-off-by: Marek Belisko <marek.belisko@gmail.com>
---
 package/Config.in            |    2 ++
 package/pcs-lite/Config.in   |    6 ++++++
 package/pcs-lite/pcs-lite.mk |   18 ++++++++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 package/pcs-lite/Config.in
 create mode 100644 package/pcs-lite/pcs-lite.mk

diff --git a/package/Config.in b/package/Config.in
index ce6057b..504ffc1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -193,6 +193,8 @@ source "package/usbmount/Config.in"
 source "package/usbutils/Config.in"
 source "package/wipe/Config.in"
 source "package/xfsprogs/Config.in"
+source "package/pcs-lite/Config.in"
+#source "package/pcsc-tools/Config.in"
 endmenu

 menu "Interpreter languages and scripting"
diff --git a/package/pcs-lite/Config.in b/package/pcs-lite/Config.in
new file mode 100644
index 0000000..3098d79
--- /dev/null
+++ b/package/pcs-lite/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PCS_LITE
+	bool "pcs-lite"
+	help
+	  Middleware to access a smart card using SCard API (PC/SC).
+
+	  https://alioth.debian.org/frs/download.php/3337
diff --git a/package/pcs-lite/pcs-lite.mk b/package/pcs-lite/pcs-lite.mk
new file mode 100644
index 0000000..0063fa8
--- /dev/null
+++ b/package/pcs-lite/pcs-lite.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# pcs-lite
+#
+#############################################################
+PCS_LITE_VERSION = 1.6.4
+PCS_LITE_SOURCE = pcs-lite-$(PCS_LITE_VERSION).tar.bz2
+PCS_LITE_SITE = https://alioth.debian.org/frs/download.php/3337
+PCS_LITE_AUTORECONF = NO
+PCS_LITE_INSTALL_STAGING = NO
+PCS_LITE_INSTALL_TARGET = YES
+PCS_LITE_LIBTOOL_PATCH = NO
+
+PCS_LITE_CONF_OPT = --disable-libhal
+
+PCS_LITE_DEPENDENCIES = uclibc libusb
+
+$(eval $(call AUTOTARGETS,package,pcs-lite))
-- 
1.7.1
