From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue,  4 Oct 2011 12:51:17 +0200
Subject: [Buildroot] [PATCH 2/2] linux-fusion: bump to version 8.7.0
In-Reply-To: <1317725477-1694-1-git-send-email-s.neumann@raumfeld.com>
References: <1317725477-1694-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1317725477-1694-2-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch that has become obsolete.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 ...ux-fusion-8.1.2-fix-warnings-at-link-time.patch |   40 --------------------
 package/linux-fusion/linux-fusion.mk               |    2 +-
 2 files changed, 1 insertions(+), 41 deletions(-)
 delete mode 100644 package/linux-fusion/linux-fusion-8.1.2-fix-warnings-at-link-time.patch

diff --git a/package/linux-fusion/linux-fusion-8.1.2-fix-warnings-at-link-time.patch b/package/linux-fusion/linux-fusion-8.1.2-fix-warnings-at-link-time.patch
deleted file mode 100644
index 7c46eaf..0000000
--- a/package/linux-fusion/linux-fusion-8.1.2-fix-warnings-at-link-time.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 7884688ba7a2e4cb7772cbedb34245a7fc9bf9d9 Mon Sep 17 00:00:00 2001
-From: Lionel Landwerlin <llandwerlin@gmail.com>
-Date: Wed, 3 Nov 2010 10:25:17 +0100
-Subject: [PATCH] Fix warnings at link time
-
-Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
----
- linux/drivers/char/fusion/entries.c   |    2 +-
- linux/drivers/char/fusion/fusiondev.c |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/linux/drivers/char/fusion/entries.c b/linux/drivers/char/fusion/entries.c
-index 11edd43..8d102cf 100644
---- a/linux/drivers/char/fusion/entries.c
-+++ b/linux/drivers/char/fusion/entries.c
-@@ -28,7 +28,7 @@
- #include "fusiondev.h"
- #include "entries.h"
- 
--struct timeval now;
-+static struct timeval now;
- 
- void
- fusion_entries_init(FusionEntries * entries,
-diff --git a/linux/drivers/char/fusion/fusiondev.c b/linux/drivers/char/fusion/fusiondev.c
-index 2457bc1..7c7680d 100644
---- a/linux/drivers/char/fusion/fusiondev.c
-+++ b/linux/drivers/char/fusion/fusiondev.c
-@@ -64,7 +64,7 @@
- MODULE_LICENSE("GPL");
- MODULE_AUTHOR("Denis Oliver Kropp <dok@directfb.org>");
- 
--struct proc_dir_entry *proc_fusion_dir;
-+static struct proc_dir_entry *proc_fusion_dir;
- 
- static int fusion_major = FUSION_MAJOR;
- 
--- 
-1.6.0.6
-
diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index 4dba98f..2e62dba 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -3,7 +3,7 @@
 # linux-fusion
 #
 #############################################################
-LINUX_FUSION_VERSION = 8.1.2
+LINUX_FUSION_VERSION = 8.7.0
 LINUX_FUSION_SOURCE = linux-fusion-$(LINUX_FUSION_VERSION).tar.gz
 LINUX_FUSION_SITE = http://directfb.org/downloads/Core/linux-fusion
 LINUX_FUSION_INSTALL_STAGING = YES
-- 
1.7.4.1
