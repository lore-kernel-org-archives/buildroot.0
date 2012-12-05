From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Dec 2012 00:39:32 -0800
Subject: [Buildroot] [git commit] radvd: bump to version 1.9.2
Message-ID: <20121205091357.0B0478F555@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=34c4091d2e3fb0a37e39b0bd740bdd1c17965899
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/radvd/radvd-highjob.patch |   27 ---------------------------
 package/radvd/radvd.mk            |    2 +-
 2 files changed, 1 insertions(+), 28 deletions(-)

diff --git a/package/radvd/radvd-highjob.patch b/package/radvd/radvd-highjob.patch
deleted file mode 100644
index 5945435..0000000
--- a/package/radvd/radvd-highjob.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From ce4911c13a3ab6877c0288c8a1874decb5d0e90a Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Mon, 23 Jul 2012 09:14:24 -0300
-Subject: [PATCH] Makefile: fix high jobcount build failures
-
-gram.h is a dependency for scanner.c rather than scanner.o which is
-unused.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- Makefile.am |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 04b834b..8a90ca7 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -131,5 +131,5 @@ dist-hook:
- 	rm -f $(distdir)/gram.h
- 	rm -f $(distdir)/scanner.c
- 
--scanner.o: gram.h
-+scanner.c: gram.h
- 
--- 
-1.7.8.6
-
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 6151236..2a60729 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-RADVD_VERSION = 1.9.1
+RADVD_VERSION = 1.9.2
 RADVD_SITE = http://www.litech.org/radvd/dist
 RADVD_DEPENDENCIES = flex libdaemon host-flex host-pkgconf
 RADVD_AUTORECONF = YES
