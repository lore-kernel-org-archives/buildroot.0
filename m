From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Jan 2014 09:36:28 +0100
Subject: [Buildroot] [git commit] socketcand: bump version and remove
	obsolete patch
Message-ID: <20140117083716.89BC89C537@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=074a420cf324ef05493fbde75de58709e6c06d2e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The latest socketcand revision replaced 'cp -n' with proper
'install command.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../socketcand-replace-cp-by-install.patch         |   25 --------------------
 package/socketcand/socketcand.mk                   |    2 +-
 2 files changed, 1 insertions(+), 26 deletions(-)

diff --git a/package/socketcand/socketcand-replace-cp-by-install.patch b/package/socketcand/socketcand-replace-cp-by-install.patch
deleted file mode 100644
index 4462ddf..0000000
--- a/package/socketcand/socketcand-replace-cp-by-install.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 9d2797ce08034aba0087e6fe45873c3ccd8db489 Mon Sep 17 00:00:00 2001
-From: Maxime Ripard <maxime.ripard@free-electrons.com>
-Date: Tue, 3 Apr 2012 10:35:09 +0200
-Subject: [PATCH] Remove cp -n which might not exist on old system and rely on install instead
-
-Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
----
- Makefile.in |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 40d8193..290a8dd 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -38,6 +38,6 @@ install: socketcand
- 	mkdir -p $(DESTDIR)$(sysroot)$(mandir)
- 	cp $(srcdir)/socketcand.1 $(DESTDIR)$(sysroot)$(mandir)/
- 	mkdir -p $(DESTDIR)$(sysroot)/etc/
--	cp -n $(srcdir)/etc/socketcand.conf $(DESTDIR)$(sysroot)/etc/
-+	install -m 0644 $(srcdir)/etc/socketcand.conf $(DESTDIR)$(sysroot)/etc/
- 	if [ $(init_script) = yes ]; then mkdir -p $(DESTDIR)$(sysroot)/etc/init.d; install --mode=755 $(srcdir)/init.d/socketcand $(DESTDIR)$(sysroot)/etc/init.d/socketcand; fi
- 	if [ $(rc_script) = yes ]; then install --mode=755 $(srcdir)/rc.d/socketcand $(DESTDIR)$(sysroot)/etc/rc.d/socketcand; fi
--- 
-1.7.4.1
-
diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index 1a2c9fc..fdba96e 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOCKETCAND_VERSION = dc3437abf17359fa8cb16567415b47e7ef8568d0
+SOCKETCAND_VERSION = 274e4e44107f6138a29bbc4e20f9fbd2a7d4dab1
 SOCKETCAND_SITE = $(call github,dschanoeh,socketcand,$(SOCKETCAND_VERSION))
 SOCKETCAND_AUTORECONF = YES
 
