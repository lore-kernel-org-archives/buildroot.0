From: Steve Kenton <skenton@ou.edu>
Date: Fri, 12 Jan 2018 18:31:22 -0600
Subject: [Buildroot] [PATCH 1/1] Add a new package udftools,
 third time is the charm
Message-ID: <20180113003122.2375-1-skenton@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Steve Kenton <skenton@ou.edu>
---
 Try 2: fix stupid copy paste error in Config.in
 Try 3: remove duplicate/misplaced addition to master Config.in
 I wish I could see these issues  when I first look the patch over - sigh

package/Config.in              |  1 +
 package/udftools/Config.in     | 13 +++++++++++++
 package/udftools/udftools.hash |  2 ++
 package/udftools/udftools.mk   | 13 +++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/udftools/Config.in
 create mode 100644 package/udftools/udftools.hash
 create mode 100644 package/udftools/udftools.mk

diff --git a/package/Config.in b/package/Config.in
index 01f4095..ad901ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -196,6 +196,7 @@ menu "Filesystem and flash utilities"
 	source "package/squashfs/Config.in"
 	source "package/sshfs/Config.in"
 	source "package/sunxi-tools/Config.in"
+	source "package/udftools/Config.in"
 	source "package/unionfs/Config.in"
 	source "package/xfsprogs/Config.in"
 endmenu
diff --git a/package/udftools/Config.in b/package/udftools/Config.in
new file mode 100644
index 0000000..b217cd2
--- /dev/null
+++ b/package/udftools/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_UDFTOOLS
+	bool "udftools"
+	depends on BR2_PACKAGE_READLINE
+	help
+	  Tools for creating UDF filesystems
+	  Maintained fork of the 2004 Sourcforge package
+
+	  https://github.com/pali/udftools/releases/tag/2.0
+
+comment "udftools needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
+
diff --git a/package/udftools/udftools.hash b/package/udftools/udftools.hash
new file mode 100644
index 0000000..b297edf
--- /dev/null
+++ b/package/udftools/udftools.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	67fe428d452901215cfad8049d250540c97114b1a20dd63277b91c2c4fae8292	udftools-2.0.tar.gz
diff --git a/package/udftools/udftools.mk b/package/udftools/udftools.mk
new file mode 100644
index 0000000..7cc8d9a
--- /dev/null
+++ b/package/udftools/udftools.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# udftools
+#
+################################################################################
+
+UDFTOOLS_VERSION = 2.0
+UDFTOOLS_SITE = https://github.com/pali/udftools/releases/download/$(UDFTOOLS_VERSION)
+UDFTOOLS_LICENSE = GPL-2.0
+UDFTOOLS_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
+
-- 
2.9.0.137.gcf4c2cf
