From: =?UTF-8?q?Daniel=20Nystr=C3=B6m?= <daniel.nystrom@timeterminal.se>
Date: Thu, 28 Nov 2013 19:02:44 +0100
Subject: [Buildroot] [PATCH] e2tools: new package
Message-ID: <1385661764-14355-1-git-send-email-daniel.nystrom@timeterminal.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

E2tools is a simple set of GPL'ed utilities to read, write, and
manipulate files in an ext2/ext3 filesystem.  These utilities access a
filesystem directly using the ext2fs library.

Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
---
 package/Config.in          |  1 +
 package/e2tools/Config.in  | 10 ++++++++++
 package/e2tools/e2tools.mk | 16 ++++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/e2tools/Config.in
 create mode 100644 package/e2tools/e2tools.mk

diff --git a/package/Config.in b/package/Config.in
index f9e72ad..96e729a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -227,6 +227,7 @@ source "package/cramfs/Config.in"
 source "package/curlftpfs/Config.in"
 source "package/dosfstools/Config.in"
 source "package/e2fsprogs/Config.in"
+source "package/e2tools/Config.in"
 source "package/ecryptfs-utils/Config.in"
 source "package/exfat/Config.in"
 source "package/exfat-utils/Config.in"
diff --git a/package/e2tools/Config.in b/package/e2tools/Config.in
new file mode 100644
index 0000000..14f25ab
--- /dev/null
+++ b/package/e2tools/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_E2TOOLS
+	bool "e2tools"
+	select BR2_PACKAGE_E2FSPROGS
+	help
+	  E2tools is a simple set of GPL'ed utilities to read, write,
+	  and manipulate files in an ext2/ext3 filesystem.  These
+	  utilities access a filesystem directly using the ext2fs
+	  library.
+
+	  https://github.com/ndim/e2tools
diff --git a/package/e2tools/e2tools.mk b/package/e2tools/e2tools.mk
new file mode 100644
index 0000000..56797bb
--- /dev/null
+++ b/package/e2tools/e2tools.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# e2tools
+#
+################################################################################
+
+E2TOOLS_VERSION = 3158ef18
+E2TOOLS_SITE = http://github.com/ndim/e2tools/tarball/$(E2TOOLS_VERSION)
+E2TOOLS_AUTORECONF = YES
+E2TOOLS_LICENSE = GPLv2
+E2TOOLS_LICENSE_FILES = COPYING
+E2TOOLS_DEPENDENCIES = e2fsprogs
+E2TOOLS_CONF_ENV = LIBS="-lpthread"
+E2TOOLS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-exec
+
+$(eval $(autotools-package))
-- 
1.8.3.2
