From: Gao Xiang <hsiangkao@aol.com>
Date: Sat, 26 Jun 2021 06:05:06 +0800
Subject: [Buildroot] [PATCH] package/erofs-utils: bump version to 1.3
References: <20210625220506.2968-1-hsiangkao.ref@aol.com>
Message-ID: <20210625220506.2968-1-hsiangkao@aol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- new upstream version (mainly add big pcluster support);
- add 0001-erofs-utils-manpage-only-install-erofsfuse.1-with-th.patch [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/patch/?id=7ab34000c672adca90388a8fcb1f70a7d391d35c

Signed-off-by: Gao Xiang <hsiangkao@aol.com>
---
 ...age-only-install-erofsfuse.1-with-th.patch | 32 +++++++++++++++++++
 package/erofs-utils/erofs-utils.hash          |  2 +-
 package/erofs-utils/erofs-utils.mk            |  2 +-
 3 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 package/erofs-utils/0001-erofs-utils-manpage-only-install-erofsfuse.1-with-th.patch

diff --git a/package/erofs-utils/0001-erofs-utils-manpage-only-install-erofsfuse.1-with-th.patch b/package/erofs-utils/0001-erofs-utils-manpage-only-install-erofsfuse.1-with-th.patch
new file mode 100644
index 000000000000..0aa99d5324d0
--- /dev/null
+++ b/package/erofs-utils/0001-erofs-utils-manpage-only-install-erofsfuse.1-with-th.patch
@@ -0,0 +1,32 @@
+From 7ab34000c672adca90388a8fcb1f70a7d391d35c Mon Sep 17 00:00:00 2001
+From: David Michael <fedora.dm0@gmail.com>
+Date: Thu, 3 Jun 2021 16:18:57 -0400
+Subject: [PATCH] erofs-utils: manpage: only install erofsfuse.1 with the
+ command
+
+Link: https://lore.kernel.org/r/87lf7q3dn2.fsf at gmail.com
+Reviewed-by: Gao Xiang <xiang@kernel.org>
+Signed-off-by: David Michael <fedora.dm0@gmail.com>
+Signed-off-by: Gao Xiang <xiang@kernel.org>
+---
+ man/Makefile.am | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/man/Makefile.am b/man/Makefile.am
+index ffcf6f81c255..0df947b6fbf7 100644
+--- a/man/Makefile.am
++++ b/man/Makefile.am
+@@ -1,5 +1,9 @@
+ # SPDX-License-Identifier: GPL-2.0+
+ # Makefile.am
+ 
+-dist_man_MANS = mkfs.erofs.1 erofsfuse.1
++dist_man_MANS = mkfs.erofs.1
+ 
++EXTRA_DIST = erofsfuse.1
++if ENABLE_FUSE
++man_MANS = erofsfuse.1
++endif
+-- 
+2.20.1
+
diff --git a/package/erofs-utils/erofs-utils.hash b/package/erofs-utils/erofs-utils.hash
index 0de52d28a906..8bbb0885689b 100644
--- a/package/erofs-utils/erofs-utils.hash
+++ b/package/erofs-utils/erofs-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6b2ea15c3b092bd9a3abd966f78bc01c6caacb94022643ff34cf69893ee04e84  erofs-utils-1.2.1.tar.gz
+sha256  132635740039bbe76d743aea72378bfae30dbf034e123929f5d794198d4c0b12  erofs-utils-1.3.tar.gz
 sha256  feee3b3157dcdf78d4f50edefbd5dd7adf8b6d52c11bfaaa746a85a373256713  COPYING
diff --git a/package/erofs-utils/erofs-utils.mk b/package/erofs-utils/erofs-utils.mk
index 5d547148b204..e35470b02edc 100644
--- a/package/erofs-utils/erofs-utils.mk
+++ b/package/erofs-utils/erofs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EROFS_UTILS_VERSION = 1.2.1
+EROFS_UTILS_VERSION = 1.3
 EROFS_UTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot
 EROFS_UTILS_LICENSE = GPL-2.0+
 EROFS_UTILS_LICENSE_FILES = COPYING
-- 
2.20.1
