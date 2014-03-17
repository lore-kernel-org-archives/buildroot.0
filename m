From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 17 Mar 2014 11:57:07 +0100
Subject: [Buildroot] [PATCH] libndp: new package
Message-ID: <1395053827-1966-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in        |    1 +
 package/libndp/Config.in |   10 ++++++++++
 package/libndp/libndp.mk |   15 +++++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 package/libndp/Config.in
 create mode 100644 package/libndp/libndp.mk

diff --git a/package/Config.in b/package/Config.in
index 70e5a7f..f51a16f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -706,6 +706,7 @@ source "package/libmbus/Config.in"
 source "package/libmicrohttpd/Config.in"
 source "package/libmnl/Config.in"
 source "package/libmodbus/Config.in"
+source "package/libndp/Config.in"
 source "package/libnetfilter_acct/Config.in"
 source "package/libnetfilter_conntrack/Config.in"
 source "package/libnetfilter_cthelper/Config.in"
diff --git a/package/libndp/Config.in b/package/libndp/Config.in
new file mode 100644
index 0000000..516ac05
--- /dev/null
+++ b/package/libndp/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBNDP
+	bool "libndp"
+	depends on BR2_INET_IPV6
+	help
+	  This package contains a library which provides a wrapper
+	  for IPv6 Neighbor Discovery Protocol. It also provides a tool
+	  named ndptool for sending and receiving NDP messages.
+
+comment "libndp needs a toolchain w/ IPv6"
+	depends on !BR2_INET_IPV6
diff --git a/package/libndp/libndp.mk b/package/libndp/libndp.mk
new file mode 100644
index 0000000..af58c6e
--- /dev/null
+++ b/package/libndp/libndp.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libndp
+#
+################################################################################
+
+LIBNDP_VERSION = v1.2
+LIBNDP_SITE = $(call github,jpirko,libndp,$(LIBNDP_VERSION))
+LIBNDP_LICENSE = LGPLv2.1
+LIBNDP_LICENSE_FILES = COPYING
+LIBNDP_AUTORECONF = YES
+LIBNDP_INSTALL_STAGING = YES
+LIBNDP_CONF_OPT = --disable-debug
+
+$(eval $(autotools-package))
-- 
1.7.7
