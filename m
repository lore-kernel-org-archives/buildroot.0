From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Fri, 23 Mar 2012 01:51:34 +0100
Subject: [Buildroot] [PATCH 1/2] Add libcap-ng package.
Message-ID: <1332463895-18574-1-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 package/Config.in              |    1 +
 package/libcap-ng/Config.in    |   10 ++++++++++
 package/libcap-ng/libcap-ng.mk |   12 ++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 package/libcap-ng/Config.in
 create mode 100644 package/libcap-ng/libcap-ng.mk

diff --git a/package/Config.in b/package/Config.in
index 85583c6..ccc9b34 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -377,6 +377,7 @@ source "package/argp-standalone/Config.in"
 source "package/boost/Config.in"
 source "package/libatomic_ops/Config.in"
 source "package/libcap/Config.in"
+source "package/libcap-ng/Config.in"
 source "package/libdaemon/Config.in"
 source "package/libelf/Config.in"
 source "package/libevent/Config.in"
diff --git a/package/libcap-ng/Config.in b/package/libcap-ng/Config.in
new file mode 100644
index 0000000..d1663cd
--- /dev/null
+++ b/package/libcap-ng/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBCAP_NG
+	bool "libcap-ng"
+	help
+	  The libcap-ng library is intended to make programming with
+	  posix capabilities much easier than the traditional libcap
+	  library. It includes utilities that can analyse all currently
+	  running applications and print out any capabilities and whether
+	  or not it has an open ended bounding set.
+
+	  http://people.redhat.com/sgrubb/libcap-ng/
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
new file mode 100644
index 0000000..6ea5de4
--- /dev/null
+++ b/package/libcap-ng/libcap-ng.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# libcap-ng
+#
+#############################################################
+
+LIBCAP_NG_VERSION = 0.6.6
+LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng/
+LIBCAP_NG_SOURCE = libcap-ng-$(LIBCAP_NG_VERSION).tar.gz
+LIBCAP_NG_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.5.4
