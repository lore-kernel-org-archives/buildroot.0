From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Oct 2015 22:06:44 +0200
Subject: [Buildroot] [git commit] libnfs: bump to version 1.9.8
Message-ID: <20151019202704.B49F381EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39d1f0156b1ea18db084220dd3a6518a2d0d8b5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Prerequisite for the gvfs 1.26.1.1 bump.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnfs/libnfs.hash |    2 ++
 package/libnfs/libnfs.mk   |    8 +++++++-
 2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/package/libnfs/libnfs.hash b/package/libnfs/libnfs.hash
new file mode 100644
index 0000000..14d304f
--- /dev/null
+++ b/package/libnfs/libnfs.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	e95af693e763a504eee72dacf3dc6c1001d83e40b807e7e1d0be2eaf48af779c	libnfs-libnfs-1.9.8.tar.gz
diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
index fb95e21..40d5ceb 100644
--- a/package/libnfs/libnfs.mk
+++ b/package/libnfs/libnfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFS_VERSION = libnfs-1.9.5
+LIBNFS_VERSION = libnfs-1.9.8
 LIBNFS_SITE = $(call github,sahlberg,libnfs,$(LIBNFS_VERSION))
 LIBNFS_INSTALL_STAGING = YES
 LIBNFS_AUTORECONF = YES
@@ -17,4 +17,10 @@ ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 LIBNFS_DEPENDENCIES += libtirpc
 endif
 
+# Needed for autoreconf
+define LIBNFS_MAKE_M4_DIR
+	mkdir $(@D)/m4
+endef
+LIBNFS_POST_EXTRACT_HOOKS += LIBNFS_MAKE_M4_DIR
+
 $(eval $(autotools-package))
