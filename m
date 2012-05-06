From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 May 2012 23:09:19 +0200
Subject: [Buildroot] [git commit] libnetfilter_conntrack: new package
Message-ID: <20120506212038.DDA8196A44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30e5d09a40b4955aa01867a7c6a64d75a8b63f2d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/libnetfilter_conntrack/Config.in           |    9 +++++++++
 .../libnetfilter-conntrack.mk                      |   13 +++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index b495c49..aecb056 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -401,6 +401,7 @@ source "package/neon/Config.in"
 source "package/libmnl/Config.in"
 source "package/libmodbus/Config.in"
 source "package/libmbus/Config.in"
+source "package/libnetfilter_conntrack/Config.in"
 source "package/libnfnetlink/Config.in"
 source "package/libnl/Config.in"
 source "package/libpcap/Config.in"
diff --git a/package/libnetfilter_conntrack/Config.in b/package/libnetfilter_conntrack/Config.in
new file mode 100644
index 0000000..caf8a8a
--- /dev/null
+++ b/package/libnetfilter_conntrack/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBNETFILTER_CONNTRACK
+	bool "libnetfilter_conntrack"
+	select BR2_PACKAGE_LIBNFNETLINK
+	help
+	  libnetfilter_conntrack is a userspace library providing
+	  a programming interface (API) to the in-kernel
+	  connection tracking state table.
+
+	  http://www.netfilter.org/projects/libnetfilter_conntrack/
diff --git a/package/libnetfilter_conntrack/libnetfilter-conntrack.mk b/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
new file mode 100644
index 0000000..66f0f69
--- /dev/null
+++ b/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# libnetfilter-conntrack
+#
+#############################################################
+
+LIBNETFILTER_CONNTRACK_VERSION = 1.0.0
+LIBNETFILTER_CONNTRACK_SOURCE = libnetfilter_conntrack-$(LIBNETFILTER_CONNTRACK_VERSION).tar.bz2
+LIBNETFILTER_CONNTRACK_SITE = http://www.netfilter.org/projects/libnetfilter_conntrack/files
+LIBNETFILTER_CONNTRACK_INSTALL_STAGING = YES
+LIBNETFILTER_CONNTRACK_DEPENDENCIES = host-pkg-config libnfnetlink
+
+$(eval $(call AUTOTARGETS))
