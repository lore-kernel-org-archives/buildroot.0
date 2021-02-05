From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  5 Feb 2021 18:36:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/libfuse3: bump version to 3.10.2
Message-ID: <20210205163639.74025-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch (already on upstream).

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 .../0001-remove-old-uclibc-hack.patch         | 34 -------------------
 package/libfuse3/libfuse3.hash                |  2 +-
 package/libfuse3/libfuse3.mk                  |  2 +-
 3 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 package/libfuse3/0001-remove-old-uclibc-hack.patch

diff --git a/package/libfuse3/0001-remove-old-uclibc-hack.patch b/package/libfuse3/0001-remove-old-uclibc-hack.patch
deleted file mode 100644
index 79b2f8c65e..0000000000
--- a/package/libfuse3/0001-remove-old-uclibc-hack.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 4ebb018e78b53a8afe0368e7cd7a17a67c52e3df Mon Sep 17 00:00:00 2001
-From: Rosen Penev <rosenp@gmail.com>
-Date: Wed, 28 Oct 2020 19:20:35 -0700
-Subject: [PATCH] remove old uclibc hack
-
-This actually prevents sshfs linking to it as fuse_new becomes
-unavailable.
-
-According to the git history, this seems to predate 2006.
-
-Signed-off-by: Rosen Penev <rosenp@gmail.com>
-[Retrieved from:
-https://github.com/libfuse/libfuse/commit/4ebb018e78b53a8afe0368e7cd7a17a67c52e3df]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/fuse_misc.h | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/lib/fuse_misc.h b/lib/fuse_misc.h
-index a8b59617..f384aeab 100644
---- a/lib/fuse_misc.h
-+++ b/lib/fuse_misc.h
-@@ -10,10 +10,9 @@
- 
- /*
-   Versioned symbols cannot be used in some cases because it
--    - confuse the dynamic linker in uClibc
-     - not supported on MacOSX (in MachO binary format)
- */
--#if (!defined(__UCLIBC__) && !defined(__APPLE__))
-+#ifndef __APPLE__
- # if HAVE_SYMVER_ATTRIBUTE
- #  define FUSE_SYMVER(sym1, sym2) __attribute__ ((symver (sym2)))
- # else
diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index 4e03ba4a87..9b2f8cc144 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  52bbb52035f7eeaa54d139e21805d357f848f6e02ac956831d04988165a92c7b  libfuse3-3.10.0.tar.gz
+sha256  a16f93cc083264afd0d2958a0dc88f24c6c5d40a9f3842c645b1909e13edb75f  libfuse3-3.10.2.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index 0a896d8dad..f805eda506 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.10.0
+LIBFUSE3_VERSION = 3.10.2
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
-- 
2.27.0
