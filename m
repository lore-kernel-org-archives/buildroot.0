From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Oct 2012 09:46:25 -0300
Subject: [Buildroot] [PATCH 08/12] libnetfilter_log: add new package
In-Reply-To: <1350909989-1012-1-git-send-email-gustavo@zacarias.com.ar>
References: <1350909989-1012-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1350909989-1012-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                            |    1 +
 package/libnetfilter_log/Config.in           |    8 ++++++++
 package/libnetfilter_log/libnetfilter-log.mk |   15 +++++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 package/libnetfilter_log/Config.in
 create mode 100644 package/libnetfilter_log/libnetfilter-log.mk

diff --git a/package/Config.in b/package/Config.in
index 8a8af71..c2ff2d5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -449,6 +449,7 @@ source "package/libnetfilter_acct/Config.in"
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
index 0000000..f72a641
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
+LIBNETFILTER_LOG_DEPENDENCIES = host-pkg-config libnfnetlink
+LIBNETFILTER_LOG_LICENSE = GPLv2
+LIBNETFILTER_LOG_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.7.8.6
