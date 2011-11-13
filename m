From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 13 Nov 2011 19:27:51 -0300
Subject: [Buildroot] [PATCH 03/10] bison: bump to version 2.5
In-Reply-To: <1321223278-14388-1-git-send-email-gustavo@zacarias.com.ar>
References: <1321223278-14388-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1321223278-14388-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../bison/bison-2.4.3-uclibc-sched_param-def.patch |   19 -------------------
 package/bison/bison.mk                             |    2 +-
 2 files changed, 1 insertions(+), 20 deletions(-)
 delete mode 100644 package/bison/bison-2.4.3-uclibc-sched_param-def.patch

diff --git a/package/bison/bison-2.4.3-uclibc-sched_param-def.patch b/package/bison/bison-2.4.3-uclibc-sched_param-def.patch
deleted file mode 100644
index 50652d8..0000000
--- a/package/bison/bison-2.4.3-uclibc-sched_param-def.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-uclibc defines __GLIBC__ but it does not expose struct shed_param as much as glibc
-and is not needed too per standard. gnulib attempts to use it but we have to account
-for it because in this case uclibc does not behave like glibc.
-
--Khem
-
-http://bugs.gentoo.org/336484
-
---- m4-1.4.14/lib/spawn.in.h
-+++ m4-1.4.14/lib/spawn.in.h
-@@ -31,7 +31,7 @@
- 
- /* Get definitions of 'struct sched_param' and 'sigset_t'.
-    But avoid namespace pollution on glibc systems.  */
--#ifndef __GLIBC__
-+#if !defined __GLIBC__ || defined __UCLIBC__
- # include <sched.h>
- # include <signal.h>
- #endif
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index d365e33..759592e 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BISON_VERSION = 2.4.3
+BISON_VERSION = 2.5
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 
 define BISON_DISABLE_EXAMPLES
-- 
1.7.3.4
