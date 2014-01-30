From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 30 Jan 2014 12:11:51 +0100
Subject: [Buildroot] [PATCH] libubox: new package
Message-ID: <1391080311-30640-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in          |    1 +
 package/libubox/Config.in  |    6 ++++++
 package/libubox/libubox.mk |   13 +++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 package/libubox/Config.in
 create mode 100644 package/libubox/libubox.mk

diff --git a/package/Config.in b/package/Config.in
index 631d8b2..1d57e12 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -747,6 +747,7 @@ source "package/libsigc/Config.in"
 source "package/libsigsegv/Config.in"
 source "package/libtasn1/Config.in"
 source "package/libtpl/Config.in"
+source "package/libubox/Config.in"
 source "package/libunwind/Config.in"
 source "package/liburcu/Config.in"
 source "package/linux-pam/Config.in"
diff --git a/package/libubox/Config.in b/package/libubox/Config.in
new file mode 100644
index 0000000..c6efb33
--- /dev/null
+++ b/package/libubox/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBUBOX
+	bool "libubox"
+	help
+	  Small utility library for OpenWrt.
+
+	  http://nbd.name/gitweb.cgi?p=luci2/libubox.git;a=summary
diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
new file mode 100644
index 0000000..ec8fbdb
--- /dev/null
+++ b/package/libubox/libubox.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libubox
+#
+################################################################################
+
+LIBUBOX_VERSION = bbd846ec2d72b2629758b69dc122ac0b0f2c3e4b
+LIBUBOX_SITE = git://nbd.name/luci2/libubox.git
+LIBUBOX_LICENSE = LGPLv2.1
+LIBUBOX_INSTALL_STAGING = YES
+LIBUBOX_CONF_OPT = -DBUILD_LUA:BOOL=OFF
+
+$(eval $(cmake-package))
-- 
1.7.7
