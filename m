From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 13 Nov 2011 19:27:54 -0300
Subject: [Buildroot] [PATCH 06/10] m4: bump to version 1.4.16
In-Reply-To: <1321223278-14388-1-git-send-email-gustavo@zacarias.com.ar>
References: <1321223278-14388-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1321223278-14388-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/m4/m4-1.4.15-uclibc-sched_param-def.patch  |   19 -------------------
 ...UR_MAX.patch => m4-1.4.16-001-MB_CUR_MAX.patch} |    0
 package/m4/m4.mk                                   |    4 ++--
 3 files changed, 2 insertions(+), 21 deletions(-)
 delete mode 100644 package/m4/m4-1.4.15-uclibc-sched_param-def.patch
 rename package/m4/{m4-1.4.8-001-MB_CUR_MAX.patch => m4-1.4.16-001-MB_CUR_MAX.patch} (100%)

diff --git a/package/m4/m4-1.4.15-uclibc-sched_param-def.patch b/package/m4/m4-1.4.15-uclibc-sched_param-def.patch
deleted file mode 100644
index 47bdd3d..0000000
--- a/package/m4/m4-1.4.15-uclibc-sched_param-def.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-uclibc defines __GLIBC__ but it does not expose struct shed_param as much as glibc
-and is not needed too per standard. gnulib attempts to use it but we have to account
-for it because in this case uclibc does not behave like glibc.
-
--Khem
-
-Index: m4-1.4.14/lib/spawn.in.h
-===================================================================
---- m4-1.4.14.orig/lib/spawn.in.h	2010-06-01 14:27:59.394242980 -0700
-+++ m4-1.4.14/lib/spawn.in.h	2010-06-01 14:28:28.202332200 -0700
-@@ -31,7 +31,7 @@
- 
- /* Get definitions of 'struct sched_param' and 'sigset_t'.
-    But avoid namespace pollution on glibc systems.  */
--#ifndef __GLIBC__
-+#if !defined __GLIBC__ || defined __UCLIBC__
- # include <sched.h>
- # include <signal.h>
- #endif
diff --git a/package/m4/m4-1.4.8-001-MB_CUR_MAX.patch b/package/m4/m4-1.4.16-001-MB_CUR_MAX.patch
similarity index 100%
rename from package/m4/m4-1.4.8-001-MB_CUR_MAX.patch
rename to package/m4/m4-1.4.16-001-MB_CUR_MAX.patch
diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index 4f18aa4..173bba8 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -3,10 +3,10 @@
 # m4
 #
 #############################################################
-M4_VERSION = 1.4.15
+
+M4_VERSION = 1.4.16
 M4_SOURCE = m4-$(M4_VERSION).tar.bz2
 M4_SITE = $(BR2_GNU_MIRROR)/m4
-
 M4_CONF_ENV = gl_cv_func_gettimeofday_clobber=no
 
 ifneq ($(BR2_USE_WCHAR),y)
-- 
1.7.3.4
