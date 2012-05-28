From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 May 2012 21:45:18 +0200
Subject: [Buildroot] [git commit] libnetfilter_cttimeout: new package
Message-ID: <20120531113301.1D33C96E2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3797d43017e831f7f8c13bba4eca23563d0df24f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/libnetfilter_cttimeout/Config.in           |   13 +++++++++++++
 .../libnetfilter-cttimeout.mk                      |   13 +++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 360f04f..85a26d5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -406,6 +406,7 @@ source "package/libmnl/Config.in"
 source "package/libmodbus/Config.in"
 source "package/libmbus/Config.in"
 source "package/libnetfilter_conntrack/Config.in"
+source "package/libnetfilter_cttimeout/Config.in"
 source "package/libnfnetlink/Config.in"
 source "package/libnl/Config.in"
 source "package/liboping/Config.in"
diff --git a/package/libnetfilter_cttimeout/Config.in b/package/libnetfilter_cttimeout/Config.in
new file mode 100644
index 0000000..8e2f438
--- /dev/null
+++ b/package/libnetfilter_cttimeout/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBNETFILTER_CTTIMEOUT
+	bool "libnetfilter_cttimeout"
+	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_LIBMNL
+	help
+	  libnetfilter_cttimeout is the userspace library that provides
+	  the programming interface to the fine-grain
+	  connection tracking timeout infrastructure.
+
+	  http://www.netfilter.org/projects/libnetfilter_cttimeout/
+
+comment "libnetfilter_cttimout requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk b/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk
new file mode 100644
index 0000000..b3e1149
--- /dev/null
+++ b/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# libnetfilter-cttimeout
+#
+#############################################################
+
+LIBNETFILTER_CTTIMEOUT_VERSION = 1.0.0
+LIBNETFILTER_CTTIMEOUT_SOURCE = libnetfilter_cttimeout-$(LIBNETFILTER_CTTIMEOUT_VERSION).tar.bz2
+LIBNETFILTER_CTTIMEOUT_SITE = http://www.netfilter.org/projects/libnetfilter_cttimeout/files
+LIBNETFILTER_CTTIMEOUT_INSTALL_STAGING = YES
+LIBNETFILTER_CTTIMEOUT_DEPENDENCIES = host-pkg-config libmnl
+
+$(eval $(call AUTOTARGETS))
