From: Nathan Lynch <ntl@pobox.com>
Date: Mon,  6 May 2013 14:01:16 -0500
Subject: [Buildroot] [PATCH v2] chrony: new package
Message-ID: <1367866876-5339-1-git-send-email-ntl@pobox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nathan Lynch <ntl@pobox.com>
---

 v2: Add upstream URL to help text
     Add dependency on BR2_USE_MMU (fork)
     Add header to chrony.mk
     Checked build with br-arm-basic, br-arm-full-nothread; no changes needed

 package/Config.in        |  1 +
 package/chrony/Config.in |  8 ++++++++
 package/chrony/chrony.mk | 12 ++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/chrony/Config.in
 create mode 100644 package/chrony/chrony.mk

diff --git a/package/Config.in b/package/Config.in
index fe4f56b..d5719a8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -670,6 +670,7 @@ source "package/bind/Config.in"
 source "package/bmon/Config.in"
 source "package/bridge-utils/Config.in"
 source "package/can-utils/Config.in"
+source "package/chrony/Config.in"
 source "package/connman/Config.in"
 source "package/crda/Config.in"
 source "package/ctorrent/Config.in"
diff --git a/package/chrony/Config.in b/package/chrony/Config.in
new file mode 100644
index 0000000..05d6fc1
--- /dev/null
+++ b/package/chrony/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_CHRONY
+	bool "chrony"
+	depends on BR2_USE_MMU # fork()
+	help
+	  Chrony is a pair of programs which are used to maintain the
+	  accuracy of the system clock.
+
+	  http://chrony.tuxfamily.org/
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
new file mode 100644
index 0000000..e8f121d
--- /dev/null
+++ b/package/chrony/chrony.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# chrony
+#
+#############################################################
+
+CHRONY_VERSION = 1.27
+CHRONY_SITE = http://download.tuxfamily.org/chrony/
+CHRONY_LICENSE = GPLv2
+CHRONY_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.8.1.4
