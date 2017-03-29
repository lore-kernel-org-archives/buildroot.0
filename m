From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 29 Mar 2017 14:51:36 +0100
Subject: [Buildroot] [PATCH] ntfs-3g: bump version to 2017.3.23
Message-ID: <20170329135136.8459-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And remove patches already included in this release.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...-libfuse-util-include-paths.h-when-needed.patch | 43 ----------------------
 package/ntfs-3g/ntfs-3g.hash                       |  3 +-
 package/ntfs-3g/ntfs-3g.mk                         |  3 +-
 3 files changed, 2 insertions(+), 47 deletions(-)
 delete mode 100644 package/ntfs-3g/0001-libfuse-util-include-paths.h-when-needed.patch

diff --git a/package/ntfs-3g/0001-libfuse-util-include-paths.h-when-needed.patch b/package/ntfs-3g/0001-libfuse-util-include-paths.h-when-needed.patch
deleted file mode 100644
index 1765f68..0000000
--- a/package/ntfs-3g/0001-libfuse-util-include-paths.h-when-needed.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From da021ed297ff7a69f3b7532ef68a9b6877a55265 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 20 Aug 2016 11:05:27 +0200
-Subject: [PATCH] libfuse-util: include <paths.h> when needed
-
-Both fusermount.c and mount_util.c use _PATH_MOUNTED, so they should
-include <paths.h>, which provides this definition.
-
-This fixes the build with the musl C library.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- libfuse-lite/fusermount.c | 1 +
- libfuse-lite/mount_util.c | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/libfuse-lite/fusermount.c b/libfuse-lite/fusermount.c
-index 4e724db..680fee1 100644
---- a/libfuse-lite/fusermount.c
-+++ b/libfuse-lite/fusermount.c
-@@ -19,6 +19,7 @@
- #include <errno.h>
- #include <fcntl.h>
- #include <pwd.h>
-+#include <paths.h>
- 
- #ifdef __SOLARIS__
- #include <sys/mnttab.h>
-diff --git a/libfuse-lite/mount_util.c b/libfuse-lite/mount_util.c
-index 8ea5e08..8b31722 100644
---- a/libfuse-lite/mount_util.c
-+++ b/libfuse-lite/mount_util.c
-@@ -15,6 +15,7 @@
- #include <dirent.h>
- #include <errno.h>
- #include <limits.h>
-+#include <paths.h>
- #include <sys/stat.h>
- #include <sys/wait.h>
- #ifdef __SOLARIS__
--- 
-2.7.4
-
diff --git a/package/ntfs-3g/ntfs-3g.hash b/package/ntfs-3g/ntfs-3g.hash
index eaa3d98..2e0b06f 100644
--- a/package/ntfs-3g/ntfs-3g.hash
+++ b/package/ntfs-3g/ntfs-3g.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256 d7b72c05e4b3493e6095be789a760c9f5f2b141812d5b885f3190c98802f1ea0 ntfs-3g_ntfsprogs-2016.2.22.tgz
-sha256 43deadaeade489934b0b45e2ed8aa5f853ad0364fbde7ad144211b80132ea041  0003-CVE-2017-0358.patch
+sha256 3e5a021d7b761261836dcb305370af299793eedbded731df3d6943802e1262d5  ntfs-3g_ntfsprogs-2017.3.23.tgz
diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index 6e1a8f9..25658f9 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-NTFS_3G_VERSION = 2016.2.22
+NTFS_3G_VERSION = 2017.3.23
 NTFS_3G_SOURCE = ntfs-3g_ntfsprogs-$(NTFS_3G_VERSION).tgz
 NTFS_3G_SITE = http://tuxera.com/opensource
-NTFS_3G_PATCH = https://sources.debian.net/data/main/n/ntfs-3g/1:2016.2.22AR.1-4/debian/patches/0003-CVE-2017-0358.patch
 NTFS_3G_CONF_OPTS = --disable-ldconfig
 NTFS_3G_INSTALL_STAGING = YES
 NTFS_3G_DEPENDENCIES = host-pkgconf
-- 
2.10.2
