From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Apr 2010 17:04:47 +0200
Subject: [Buildroot] [git commit master] Add libatomic_ops 1.2 needed by
	libdrm Intel support
Message-ID: <20100414150704.404068AD9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=71a041c852df27f7400472c7ba4bbb62615994b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                |    3 ++-
 package/Config.in                      |    1 +
 package/libatomic_ops/Config.in        |    4 ++++
 package/libatomic_ops/libatomic_ops.mk |   12 ++++++++++++
 4 files changed, 19 insertions(+), 1 deletions(-)
 create mode 100644 package/libatomic_ops/Config.in
 create mode 100644 package/libatomic_ops/libatomic_ops.mk

diff --git a/CHANGES b/CHANGES
index f48d8d9..ed23e5c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,7 +9,8 @@
 
 	X.org updated to 7.5.
 
-	New packages: librsync, libusb-compat, lmbench, netperf, squid
+	New packages: librsync, libatomic_ops, libusb-compat, lmbench,
+	netperf, squid
 
 	Updated/fixed packages: busybox, dnsmasq, dosfstools,
 	e2fsprogs, fbv, freetype, iperf, iptables, iw, less,
diff --git a/package/Config.in b/package/Config.in
index 877a87e..6104903 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -297,6 +297,7 @@ source "package/libupnp/Config.in"
 endmenu
 
 menu "Other"
+source "package/libatomic_ops/Config.in"
 source "package/libcap/Config.in"
 source "package/libdaemon/Config.in"
 source "package/libelf/Config.in"
diff --git a/package/libatomic_ops/Config.in b/package/libatomic_ops/Config.in
new file mode 100644
index 0000000..b9f14d1
--- /dev/null
+++ b/package/libatomic_ops/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_LIBATOMIC_OPS
+	bool "libatomic_ops"
+	help
+	  Atomic operations library
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
new file mode 100644
index 0000000..f26a5fa
--- /dev/null
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# Atomic_ops library
+#
+#############################################################
+
+LIBATOMIC_OPS_VERSION = 1.2
+LIBATOMIC_OPS_SOURCE = libatomic_ops-$(LIBATOMIC_OPS_VERSION).tar.gz
+LIBATOMIC_OPS_SITE = http://www.hpl.hp.com/research/linux/atomic_ops/download
+LIBATOMIC_OPS_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS,package,libatomic_ops))
-- 
1.6.3.3
