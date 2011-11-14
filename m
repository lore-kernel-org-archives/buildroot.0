From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Nov 2011 09:25:25 +0100
Subject: [Buildroot] [git commit branch/next] bison: bump to version 2.5
Message-ID: <20111114083547.BD5C18F555@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=28df108c9b446ec582530721636584fefe27b564
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../bison/bison-2.4.3-uclibc-sched_param-def.patch |   19 -------------------
 package/bison/bison.mk                             |    2 +-
 2 files changed, 1 insertions(+), 20 deletions(-)

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
