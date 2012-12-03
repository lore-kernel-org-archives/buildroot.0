From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  3 Dec 2012 11:46:01 -0300
Subject: [Buildroot] [PATCH 03/14] radvd: bump to version 1.9.2
In-Reply-To: <1354545972-26783-1-git-send-email-gustavo@zacarias.com.ar>
References: <1354545972-26783-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1354545972-26783-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/radvd/radvd-highjob.patch |   27 ---------------------------
 package/radvd/radvd.mk            |    2 +-
 2 files changed, 1 insertions(+), 28 deletions(-)
 delete mode 100644 package/radvd/radvd-highjob.patch

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
-- 
1.7.8.6
