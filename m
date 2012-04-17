From: Rico Bachmann <bachmann@tofwerk.com>
Date: Tue, 17 Apr 2012 16:35:16 +0200
Subject: [Buildroot] [PATCH] Add apr-package
In-Reply-To: <1334673316-28944-1-git-send-email-bachmann@tofwerk.com>
References: <1334673316-28944-1-git-send-email-bachmann@tofwerk.com>
Message-ID: <1334673316-28944-2-git-send-email-bachmann@tofwerk.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rico Bachmann <bachmann@tofwerk.com>
---
 package/Config.in     |    1 +
 package/apr/Config.in |    8 ++++++++
 package/apr/apr.mk    |   18 ++++++++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 package/apr/Config.in
 create mode 100644 package/apr/apr.mk

diff --git a/package/Config.in b/package/Config.in
index 4c6d4d8..bf1bdcf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -372,6 +372,7 @@ source "package/zeromq/Config.in"
 endmenu
 
 menu "Other"
+source "package/apr/Config.in"
 source "package/fftw/Config.in"
 source "package/libargtable2/Config.in"
 source "package/argp-standalone/Config.in"
diff --git a/package/apr/Config.in b/package/apr/Config.in
new file mode 100644
index 0000000..292cadb
--- /dev/null
+++ b/package/apr/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_APR
+	bool "apr"
+	help
+	  The mission of the Apache Portable Runtime (APR) project is to create
+	  and maintain software libraries that provide a predictable and
+	  consistent interface to underlying platform-specific implementations
+
+	  http://apr.apache.org/
diff --git a/package/apr/apr.mk b/package/apr/apr.mk
new file mode 100644
index 0000000..3158913
--- /dev/null
+++ b/package/apr/apr.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# apr
+#
+#############################################################
+APR_VERSION = 1.4.6
+APR_SITE = http://archive.apache.org/dist/apr
+APR_INSTALL_STAGING = YES
+APR_CONF_ENV = \
+	ac_cv_file__dev_zero=yes \
+	ac_cv_func_setpgrp_void=yes \
+	apr_cv_process_shared_works=yes \
+	apr_cv_mutex_robust_shared=no \
+	apr_cv_tcp_nodelay_with_cork=yes \
+	ac_cv_sizeof_struct_iovec=8 \
+	apr_cv_mutex_recursive=yes
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.2.5
