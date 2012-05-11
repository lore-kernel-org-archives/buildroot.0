From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 May 2012 10:29:30 -0300
Subject: [Buildroot] [PATCH 1/2] liboping: new package
Message-ID: <1336742971-3709-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in            |    1 +
 package/liboping/Config.in   |   11 +++++++++++
 package/liboping/liboping.mk |   13 +++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 package/liboping/Config.in
 create mode 100644 package/liboping/liboping.mk

diff --git a/package/Config.in b/package/Config.in
index ffdcb21..ecb3d84 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -405,6 +405,7 @@ source "package/libmbus/Config.in"
 source "package/libnetfilter_conntrack/Config.in"
 source "package/libnfnetlink/Config.in"
 source "package/libnl/Config.in"
+source "package/liboping/Config.in"
 source "package/libpcap/Config.in"
 source "package/libosip2/Config.in"
 source "package/librsync/Config.in"
diff --git a/package/liboping/Config.in b/package/liboping/Config.in
new file mode 100644
index 0000000..d2c0bbd
--- /dev/null
+++ b/package/liboping/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBOPING
+	bool "liboping"
+	depends on BR2_INET_IPV6
+	help
+	  liboping is a C library to generate ICMP echo requests,
+	  better known as "ping packets".
+
+	  http://verplant.org/liboping/
+
+comment "liboping requires a toolchain with IPv6 support enabled"
+	depends on !BR2_INET_IPV6
diff --git a/package/liboping/liboping.mk b/package/liboping/liboping.mk
new file mode 100644
index 0000000..e0d892b
--- /dev/null
+++ b/package/liboping/liboping.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# liboping
+#
+#############################################################
+
+LIBOPING_VERSION = 1.6.2
+LIBOPING_SITE = http://verplant.org/liboping/files
+LIBOPING_INSTALL_STAGING = YES
+LIBOPING_DEPENDENCIES = $(if $(BR2_PACKAGE_NCURSES),ncurses)
+LIBOPING_CONF_OPT = --without-perl-bindings
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.3.4
