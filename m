From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Nov 2012 19:12:14 +0100
Subject: [Buildroot] [git commit] libnetfilter_log: add new package
Message-ID: <20121103182341.63CA599A6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f16acce6d3e0b50ae5f9d29cd4118afa212cd077
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                            |    1 +
 package/libnetfilter_log/Config.in           |    8 ++++++++
 package/libnetfilter_log/libnetfilter-log.mk |   15 +++++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index dde8475..f5ccf0a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -459,6 +459,7 @@ source "package/libnetfilter_acct/Config.in"
 source "package/libnetfilter_conntrack/Config.in"
 source "package/libnetfilter_cthelper/Config.in"
 source "package/libnetfilter_cttimeout/Config.in"
+source "package/libnetfilter_log/Config.in"
 source "package/libnetfilter_queue/Config.in"
 source "package/libnfnetlink/Config.in"
 source "package/libnl/Config.in"
diff --git a/package/libnetfilter_log/Config.in b/package/libnetfilter_log/Config.in
new file mode 100644
index 0000000..927cd0a
--- /dev/null
+++ b/package/libnetfilter_log/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBNETFILTER_LOG
+	bool "libnetfilter_log"
+	select BR2_PACKAGE_LIBNFNETLINK
+	help
+	  libnetfilter_log is a userspace library providing interface
+	  to packets that have been logged by the kernel packet filter.
+
+	  http://www.netfilter.org/projects/libnetfilter_log/
diff --git a/package/libnetfilter_log/libnetfilter-log.mk b/package/libnetfilter_log/libnetfilter-log.mk
new file mode 100644
index 0000000..0d98e12
--- /dev/null
+++ b/package/libnetfilter_log/libnetfilter-log.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# libnetfilter-log
+#
+#############################################################
+
+LIBNETFILTER_LOG_VERSION = 1.0.1
+LIBNETFILTER_LOG_SOURCE = libnetfilter_log-$(LIBNETFILTER_LOG_VERSION).tar.bz2
+LIBNETFILTER_LOG_SITE = http://www.netfilter.org/projects/libnetfilter_log/files
+LIBNETFILTER_LOG_INSTALL_STAGING = YES
+LIBNETFILTER_LOG_DEPENDENCIES = host-pkgconf libnfnetlink
+LIBNETFILTER_LOG_LICENSE = GPLv2
+LIBNETFILTER_LOG_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
