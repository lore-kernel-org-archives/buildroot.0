From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 19 Oct 2015 10:33:57 -0300
Subject: [Buildroot] [PATCH 2/3] libnfs: bump to version 1.9.8
In-Reply-To: <1445261638-14634-1-git-send-email-gustavo@zacarias.com.ar>
References: <1445261638-14634-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1445261638-14634-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Prerequisite for the gvfs 1.26.1.1 bump.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnfs/libnfs.hash | 2 ++
 package/libnfs/libnfs.mk   | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)
 create mode 100644 package/libnfs/libnfs.hash

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
-- 
2.4.10
