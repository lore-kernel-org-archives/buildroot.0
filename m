From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 22 May 2014 19:38:44 -0300
Subject: [Buildroot] [PATCH] lvm2: bump to version 2.02.106
Message-ID: <1400798324-21265-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Readline patch is now upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lvm2/lvm2-001-readline-deprecated.patch | 19 -------------------
 package/lvm2/lvm2.mk                            |  2 +-
 2 files changed, 1 insertion(+), 20 deletions(-)
 delete mode 100644 package/lvm2/lvm2-001-readline-deprecated.patch

diff --git a/package/lvm2/lvm2-001-readline-deprecated.patch b/package/lvm2/lvm2-001-readline-deprecated.patch
deleted file mode 100644
index d36adc3..0000000
--- a/package/lvm2/lvm2-001-readline-deprecated.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-The CPPFunction typedef (among others) have been deprecated in favour of
-specific prototyped typedefs since readline 4.2.
-It's been working since because compatibility typedefs have been
-in place until they were removed in readline 6.3.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura LVM2.2.02.103.orig/tools/lvm.c LVM2.2.02.103/tools/lvm.c
---- LVM2.2.02.103.orig/tools/lvm.c	2014-03-01 16:10:57.902422044 -0300
-+++ LVM2.2.02.103/tools/lvm.c	2014-03-01 16:11:34.791598230 -0300
-@@ -185,7 +185,7 @@
- 	char *input = NULL, *args[MAX_ARGS], **argv;
- 
- 	rl_readline_name = "lvm";
--	rl_attempted_completion_function = (CPPFunction *) _completion;
-+	rl_attempted_completion_function = (rl_completion_func_t *) _completion;
- 
- 	_read_history(cmd);
- 
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index ee281a1..612f92f 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.103
+LVM2_VERSION = 2.02.106
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
 LVM2_INSTALL_STAGING = YES
-- 
1.8.5.5
