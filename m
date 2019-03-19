From: Esben Haabendal <esben.haabendal@gmail.com>
Date: Tue, 19 Mar 2019 12:43:44 +0100
Subject: [Buildroot] [PATCH] mtree: new package
Message-ID: <20190319114344.11138-1-esben.haabendal@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Esben Haabendal <esben@haabendal.dk>

Signed-off-by: Esben Haabendal <esben@haabendal.dk>
---
 package/Config.in       |  1 +
 package/mtree/Config.in | 10 ++++++++++
 package/mtree/mtree.mk  | 15 +++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/mtree/Config.in
 create mode 100644 package/mtree/mtree.mk

diff --git a/package/Config.in b/package/Config.in
index b5321aeb49c9..13f7fae09df6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -197,6 +197,7 @@ menu "Filesystem and flash utilities"
 	source "package/mmc-utils/Config.in"
 	source "package/mtd/Config.in"
 	source "package/mtools/Config.in"
+	source "package/mtree/Config.in"
 	source "package/nfs-utils/Config.in"
 	source "package/nilfs-utils/Config.in"
 	source "package/ntfs-3g/Config.in"
diff --git a/package/mtree/Config.in b/package/mtree/Config.in
new file mode 100644
index 000000000000..97e1cf614972
--- /dev/null
+++ b/package/mtree/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_MTREE
+	bool "mtree"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  mtree - utility for creating and verifying file hierarchies.
+
+	  Port of the mtree utility, originally only available in BSD
+	  distributions, to Linux and other operating systems.
+
+	  https://github.com/archiecobbs/mtree-port
diff --git a/package/mtree/mtree.mk b/package/mtree/mtree.mk
new file mode 100644
index 000000000000..b828dd53ffe3
--- /dev/null
+++ b/package/mtree/mtree.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# mtree
+#
+################################################################################
+
+MTREE_VERSION = 1.0.4
+MTREE_SOURCE = mtree-$(MTREE_VERSION).tar.gz
+MTREE_SITE = https://s3.amazonaws.com/archie-public/mtree-port
+MTREE_LICENSE = BSD-3-Clause
+MTREE_LICENSE_FILES = COPYING
+
+MTREE_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-exec
+
+$(eval $(autotools-package))
-- 
2.21.0
