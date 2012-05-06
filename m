From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 May 2012 23:08:14 +0200
Subject: [Buildroot] [git commit] libnfnetlink: new package
Message-ID: <20120506212038.D146B96A44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a5686b8acdfc81f3ab73f013f04be0a1462d3408
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                    |    1 +
 package/libnfnetlink/Config.in       |   11 +++++++++++
 package/libnfnetlink/libnfnetlink.mk |   12 ++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 90b8e19..b495c49 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -401,6 +401,7 @@ source "package/neon/Config.in"
 source "package/libmnl/Config.in"
 source "package/libmodbus/Config.in"
 source "package/libmbus/Config.in"
+source "package/libnfnetlink/Config.in"
 source "package/libnl/Config.in"
 source "package/libpcap/Config.in"
 source "package/libosip2/Config.in"
diff --git a/package/libnfnetlink/Config.in b/package/libnfnetlink/Config.in
new file mode 100644
index 0000000..fa247c5
--- /dev/null
+++ b/package/libnfnetlink/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBNFNETLINK
+	bool "libnfnetlink"
+	help
+	  libnfnetlink is the low-level library for netfilter related
+	  kernel/userspace communication.
+	  It provides a generic messaging infrastructure for in-kernel
+	  netfilter subsystems (such as nfnetlink_log, nfnetlink_queue,
+	  nfnetlink_conntrack) and their respective users
+	  and/or management tools in userspace.
+
+	  http://www.netfilter.org/projects/libnfnetlink/
diff --git a/package/libnfnetlink/libnfnetlink.mk b/package/libnfnetlink/libnfnetlink.mk
new file mode 100644
index 0000000..67ea266
--- /dev/null
+++ b/package/libnfnetlink/libnfnetlink.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# libnfnetlink
+#
+#############################################################
+
+LIBNFNETLINK_VERSION = 1.0.0
+LIBNFNETLINK_SOURCE = libnfnetlink-$(LIBNFNETLINK_VERSION).tar.bz2
+LIBNFNETLINK_SITE = http://www.netfilter.org/projects/libnfnetlink/files
+LIBNFNETLINK_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
