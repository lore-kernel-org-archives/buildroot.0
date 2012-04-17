From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Apr 2012 16:44:19 +0200
Subject: [Buildroot] [git commit] Add apr-package
Message-ID: <20120417145439.3FD0D96AFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5ece0d8eebf2f908b952141130664d3a6430f67
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rico Bachmann <bachmann@tofwerk.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in     |    1 +
 package/apr/Config.in |    8 ++++++++
 package/apr/apr.mk    |   18 ++++++++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 567fbed..5ae1c81 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -374,6 +374,7 @@ source "package/zeromq/Config.in"
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
