From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 Apr 2012 11:34:57 -0300
Subject: [Buildroot] [PATCH 2/2] unionfs: bump to version 0.25
In-Reply-To: <1334586897-18826-1-git-send-email-gustavo@zacarias.com.ar>
References: <1334586897-18826-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1334586897-18826-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/unionfs/unionfs-make-mandir.patch |   15 ---------------
 package/unionfs/unionfs.mk                |    2 +-
 2 files changed, 1 insertions(+), 16 deletions(-)
 delete mode 100644 package/unionfs/unionfs-make-mandir.patch

diff --git a/package/unionfs/unionfs-make-mandir.patch b/package/unionfs/unionfs-make-mandir.patch
deleted file mode 100644
index bf3c241..0000000
--- a/package/unionfs/unionfs-make-mandir.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Make the man directory if it's missing before installing the man page.
-Already upstream see http://hg.podgorny.cz/unionfs-fuse/rev/6ca07ad1b855
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura unionfs-fuse-0.24.orig/Makefile unionfs-fuse-0.24/Makefile
---- unionfs-fuse-0.24.orig/Makefile	2010-05-20 08:04:08.000000000 -0300
-+++ unionfs-fuse-0.24/Makefile	2012-01-11 08:08:02.382667776 -0300
-@@ -9,5 +9,6 @@
- 
- install: build
- 	install -d $(DESTDIR)$(PREFIX)$(BINDIR)
-+	install -d $(DESTDIR)$(PREFIX)/share/man/man8
- 	install -m 0755 src/unionfs $(DESTDIR)$(PREFIX)$(BINDIR)
- 	install -m 0644 man/unionfs-fuse.8 $(DESTDIR)$(PREFIX)/share/man/man8/
diff --git a/package/unionfs/unionfs.mk b/package/unionfs/unionfs.mk
index b0bc93b..ce6d582 100644
--- a/package/unionfs/unionfs.mk
+++ b/package/unionfs/unionfs.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-UNIONFS_VERSION = 0.24
+UNIONFS_VERSION = 0.25
 UNIONFS_SITE = http://podgorny.cz/unionfs-fuse/releases
 UNIONFS_SOURCE = unionfs-fuse-$(UNIONFS_VERSION).tar.bz2
 UNIONFS_DEPENDENCIES = libfuse
-- 
1.7.3.4
