From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 19 Mar 2012 08:58:08 +0000
Subject: [Buildroot] [PATCH] Added the libtpl package
Message-ID: <1332147488-13020-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in        |    1 +
 package/libtpl/Config.in |    6 ++++++
 package/libtpl/libtpl.mk |   13 +++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 package/libtpl/Config.in
 create mode 100644 package/libtpl/libtpl.mk

diff --git a/package/Config.in b/package/Config.in
index f0ce963..85583c6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -386,6 +386,7 @@ source "package/libglib2/Config.in"
 source "package/libical/Config.in"
 source "package/libnspr/Config.in"
 source "package/libsigc/Config.in"
+source "package/libtpl/Config.in"
 source "package/liburcu/Config.in"
 source "package/lttng-libust/Config.in"
 source "package/orc/Config.in"
diff --git a/package/libtpl/Config.in b/package/libtpl/Config.in
new file mode 100644
index 0000000..a2c2c2d
--- /dev/null
+++ b/package/libtpl/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBTPL
+	bool "libtpl"
+	help
+	  Easily store and retrieve binary data in C
+
+	  http://tpl.sourceforge.net/
diff --git a/package/libtpl/libtpl.mk b/package/libtpl/libtpl.mk
new file mode 100644
index 0000000..6febebf
--- /dev/null
+++ b/package/libtpl/libtpl.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# libtpl
+#
+#############################################################
+LIBTPL_VERSION = 1.5
+LIBTPL_SOURCE = libtpl-$(LIBTPL_VERSION).tar.bz2
+LIBTPL_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/tpl
+
+LIBTPL_INSTALL_STAGING = YES
+LIBTPL_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.5.4
