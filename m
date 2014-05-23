From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 May 2014 22:05:54 +0200
Subject: [Buildroot] [git commit] lvm2: bump to version 2.02.106
Message-ID: <20140601083245.743B99C779@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f4106ef191cb699e9c4d244c68e462d860c4fa35
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Readline patch is now upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lvm2/lvm2-001-readline-deprecated.patch |   19 -------------------
 package/lvm2/lvm2.mk                            |    2 +-
 2 files changed, 1 insertions(+), 20 deletions(-)

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
