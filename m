From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 17 Apr 2020 03:11:19 -0600
Subject: [Buildroot] [PATCH 1/1] package/exfatprogs: new package
Message-ID: <20200417091119.13764-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

exFAT filesystem userspace utilities

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/exfatprogs/Config.in       |  6 ++++++
 package/exfatprogs/exfatprogs.hash |  3 +++
 package/exfatprogs/exfatprogs.mk   | 14 ++++++++++++++
 5 files changed, 25 insertions(+)
 create mode 100644 package/exfatprogs/Config.in
 create mode 100644 package/exfatprogs/exfatprogs.hash
 create mode 100644 package/exfatprogs/exfatprogs.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3d9c976a95..2d1db22d35 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1171,6 +1171,7 @@ F:	configs/pine64_defconfig
 F:	configs/pine64_sopine_defconfig
 
 N:	James Hilliard <james.hilliard1@gmail.com>
+F:	package/exfatprogs/
 F:	package/gensio/
 F:	package/lua-std-debug/
 F:	package/lua-std-normalize/
diff --git a/package/Config.in b/package/Config.in
index ccf54f2417..b6c0c44402 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -199,6 +199,7 @@ menu "Filesystem and flash utilities"
 	source "package/erofs-utils/Config.in"
 	source "package/exfat/Config.in"
 	source "package/exfat-utils/Config.in"
+	source "package/exfatprogs/Config.in"
 	source "package/f2fs-tools/Config.in"
 	source "package/flashbench/Config.in"
 	source "package/fscryptctl/Config.in"
diff --git a/package/exfatprogs/Config.in b/package/exfatprogs/Config.in
new file mode 100644
index 0000000000..54840513d3
--- /dev/null
+++ b/package/exfatprogs/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_EXFATPROGS
+	bool "exfatprogs"
+	help
+	  exFAT filesystem userspace utilities
+
+	  https://github.com/exfatprogs/exfatprogs
diff --git a/package/exfatprogs/exfatprogs.hash b/package/exfatprogs/exfatprogs.hash
new file mode 100644
index 0000000000..424cc2b1fa
--- /dev/null
+++ b/package/exfatprogs/exfatprogs.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  9cd3b71b0d90695969b83a68d5412898c120a60893e01434ef5e2be9f14fe570  exfatprogs-1.0.1.tar.gz
+sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/exfatprogs/exfatprogs.mk b/package/exfatprogs/exfatprogs.mk
new file mode 100644
index 0000000000..d2077ecbaa
--- /dev/null
+++ b/package/exfatprogs/exfatprogs.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# exfatprogs
+#
+################################################################################
+
+EXFATPROGS_VERSION = 1.0.1
+EXFATPROGS_SITE = $(call github,exfatprogs,exfatprogs,$(EXFATPROGS_VERSION))
+EXFATPROGS_LICENSE = GPL-2.0
+EXFATPROGS_LICENSE_FILES = COPYING
+EXFATPROGS_DEPENDENCIES = host-pkgconf
+EXFATPROGS_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.20.1
