Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF27AC433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 11:48:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34A0E6115C
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 11:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 34A0E6115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C133E83984;
	Sat, 16 Oct 2021 11:48:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lSSb_GLRebfL; Sat, 16 Oct 2021 11:48:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A6D583896;
	Sat, 16 Oct 2021 11:48:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E6DE1BF866
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 11:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CCDA401CE
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 11:48:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P5rYKpHC5C5I for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 11:48:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AB9740017
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 11:48:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5399795C7B; Sat, 16 Oct 2021 11:45:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 13:47:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5dfe70377006b5b1031879ce69644c767049bd31
X-Git-Newrev: 84be5d6cf061cbe260810e096654bb674f93b51f
X-Patchwork-Hint: ignore
Message-Id: <20211016114546.5399795C7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liblockfile: bump to version 1.17
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=84be5d6cf061cbe260810e096654bb674f93b51f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- MMU is mandatory since version 1.11 and
  https://github.com/miquels/liblockfile/commit/09b8935abac7417870d6fbb2db8c4f1c7c35f4b6
- DESTDIR must be used since version 1.10 and
  https://github.com/miquels/liblockfile/commit/e35f9eabcbba224ecc70b145d5d2a2d81064c195
  so drop custom commands (LIBLOCKFILE_INSTALL_{STAGING,TARGET}_CMDS)
  and replace patch by an upstreamable one
- Update hash of COPYRIGHT and add licenses/{GPL-2,LGPL-2} to license
  files:
  https://github.com/miquels/liblockfile/commit/40f8d8092bbb88177d810131c1b1f96ad0ec0bf7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-Makefile.in-fix-cross-compilation.patch   | 82 ++++++++++++++++++++++
 package/liblockfile/0001-install.patch             | 16 -----
 package/liblockfile/Config.in                      |  1 +
 package/liblockfile/liblockfile.hash               | 10 +--
 package/liblockfile/liblockfile.mk                 | 21 ++----
 package/lockfile-progs/Config.in                   |  1 +
 package/usbmount/Config.in                         |  2 +
 7 files changed, 98 insertions(+), 35 deletions(-)

diff --git a/package/liblockfile/0001-Makefile.in-fix-cross-compilation.patch b/package/liblockfile/0001-Makefile.in-fix-cross-compilation.patch
new file mode 100644
index 0000000000..bc85694f80
--- /dev/null
+++ b/package/liblockfile/0001-Makefile.in-fix-cross-compilation.patch
@@ -0,0 +1,82 @@
+From 7535d990645d867a6e491d16cd2548ea7e54958e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 5 Apr 2021 16:21:32 +0200
+Subject: [PATCH] Makefile.in: fix cross-compilation
+
+- Use DESTDIR to install each files instead of prepending prefix with it
+  as this will result in dotlockfile being wrongly install in $(bindir)
+- Use -f when creating symlink to avoid an error if link already exists
+- Do not install files with root group as this will break
+  cross-compilation
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/miquels/liblockfile/pull/11]
+---
+ Makefile.in | 36 ++++++++++++++++++------------------
+ 1 file changed, 18 insertions(+), 18 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 9c74b35..5ce8153 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -10,7 +10,7 @@ CFLAGS		= @CFLAGS@ -I.
+ LDFLAGS		= @LDFLAGS@
+ CC		= @CC@
+ 
+-prefix		= $(DESTDIR)@prefix@
++prefix		= @prefix@
+ exec_prefix	= @exec_prefix@
+ bindir		= @bindir@
+ libdir		= @libdir@
+@@ -60,34 +60,34 @@ dlockfile.o:	lockfile.c
+ 			-c lockfile.c -o dlockfile.o
+ 
+ install_static:	static install_common
+-		install -d -m 755 -g root -p $(libdir)
+-		install -m 644 liblockfile.a $(libdir)
++		install -d -m 755 -p $(DESTDIR)$(libdir)
++		install -m 644 liblockfile.a $(DESTDIR)$(libdir)
+ 
+ install_shared:	shared install_static install_common
+-		install -d -m 755 -g root -p $(libdir)
++		install -d -m 755 -p $(DESTDIR)$(libdir)
+ 		install -m 755 liblockfile.so \
+-			$(libdir)/liblockfile.so.$(SOVER)
+-		ln -s liblockfile.so.$(SOVER) $(libdir)/liblockfile.so.$(MAJOR)
+-		ln -s liblockfile.so.$(SOVER) $(libdir)/liblockfile.so
++			$(DESTDIR)$(libdir)/liblockfile.so.$(SOVER)
++		ln -sf liblockfile.so.$(SOVER) $(DESTDIR)$(libdir)/liblockfile.so.$(MAJOR)
++		ln -sf liblockfile.so.$(SOVER) $(DESTDIR)$(libdir)/liblockfile.so
+ 		if test "$(DESTDIR)" = ""; then @LDCONFIG@; fi
+ 
+ install_common:
+-		install -d -m 755 -g root -p $(includedir)
+-		install -d -m 755 -g root -p $(bindir)
+-		install -d -m 755 -g root -p $(mandir)/man1
+-		install -d -m 755 -g root -p $(mandir)/man3
+-		install -m 644 lockfile.h maillock.h $(includedir)
++		install -d -m 755 -p $(DESTDIR)$(includedir)
++		install -d -m 755 -p $(DESTDIR)$(bindir)
++		install -d -m 755 -p $(DESTDIR)$(mandir)/man1
++		install -d -m 755 -p $(DESTDIR)$(mandir)/man3
++		install -m 644 lockfile.h maillock.h $(DESTDIR)$(includedir)
+ 		if [ "$(MAILGROUP)" != "" ]; then\
+-		  install -g $(MAILGROUP) -m 2755 dotlockfile $(bindir);\
++		  install -g $(MAILGROUP) -m 2755 dotlockfile $(DESTDIR)$(bindir);\
+ 		else \
+-		  install -g root -m 755 dotlockfile $(bindir); \
++		  install -m 755 dotlockfile $(DESTDIR)$(bindir); \
+ 		fi
+-		install -m 644 *.1 $(mandir)/man1
+-		install -m 644 *.3 $(mandir)/man3
++		install -m 644 *.1 $(DESTDIR)$(mandir)/man1
++		install -m 644 *.3 $(DESTDIR)$(mandir)/man3
+ 
+ install_nfslib:	nfslib
+-		install -d -m 755 -g root -p $(nfslockdir)
+-		install -m 755 nfslock.so.$(NFSVER) $(nfslockdir)
++		install -d -m 755 -p $(DESTDIR)$(nfslockdir)
++		install -m 755 nfslock.so.$(NFSVER) $(DESTDIR)$(nfslockdir)
+ 		if test "$(DESTDIR)" = ""; then @LDCONFIG@; fi
+ 
+ test:		test-stamp
diff --git a/package/liblockfile/0001-install.patch b/package/liblockfile/0001-install.patch
deleted file mode 100644
index bfa197c64f..0000000000
--- a/package/liblockfile/0001-install.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-diff -ur liblockfile-1.06.1/Makefile.in liblockfile-1.06.1-patched/Makefile.in
---- liblockfile-1.06.1/Makefile.in	2001-03-16 22:08:33.000000000 -0600
-+++ liblockfile-1.06.1-patched/Makefile.in	2007-04-11 07:18:38.000000000 -0500
-@@ -60,11 +60,7 @@
- 
- install_common:
- 		install -m 644 lockfile.h maillock.h $(ROOT)$(includedir)
--		if [ "$(MAILGROUP)" != "" ]; then\
--		  install -g $(MAILGROUP) -m 2755 dotlockfile $(ROOT)$(bindir);\
--		else \
--		  install -g root -m 755 dotlockfile $(ROOT)$(bindir); \
--		fi
-+		install -m 2755 dotlockfile $(ROOT)$(bindir);\
- 		install -m 644 *.1 $(ROOT)$(mandir)/man1
- 		install -m 644 *.3 $(ROOT)$(mandir)/man3
- 
diff --git a/package/liblockfile/Config.in b/package/liblockfile/Config.in
index 83ffea86c8..30bdf462c8 100644
--- a/package/liblockfile/Config.in
+++ b/package/liblockfile/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBLOCKFILE
 	bool "liblockfile"
+	depends on BR2_USE_MMU # fork()
 	help
 	  NFS-safe locking library.
 
diff --git a/package/liblockfile/liblockfile.hash b/package/liblockfile/liblockfile.hash
index 881ad992ae..c2cacd6fed 100644
--- a/package/liblockfile/liblockfile.hash
+++ b/package/liblockfile/liblockfile.hash
@@ -1,5 +1,7 @@
-# From http://snapshot.debian.org/archive/debian/20151026T153523Z/pool/main/libl/liblockfile/liblockfile_1.09-6.dsc
-sha256  16979eba05396365e1d6af7100431ae9d32f9bc063930d1de66298a0695f1b7f  liblockfile_1.09.orig.tar.gz
-sha256  d45eacb7c637c16d03c777c55989d98da494ae9584a0783fe6dbf0db60fa290f  liblockfile_1.09-6.debian.tar.bz2
+# From https://snapshot.debian.org/archive/debian/20210128T210947Z/pool/main/libl/liblockfile/liblockfile_1.17-1.dsc
+sha256  6e937f3650afab4aac198f348b89b1ca42edceb17fb6bb0918f642143ccfd15e  liblockfile_1.17.orig.tar.gz
+sha256  e3657c0e3facfeccb58900c0b48d56cd68ad5f9f24d1b4c6eaa69c26490fb673  liblockfile_1.17-1.debian.tar.bz2
 # Locally computed
-sha256  5fffcc11f94a05a7cff02ff792407737eb1cba840767cc1a71b67fbb19695dd3  COPYRIGHT
+sha256  3d080ab931103a823e6b9b788ccbc3e9d44797bd54546f3feebfd305f90de46a  COPYRIGHT
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licenses/GPL-2
+sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  licenses/LGPL-2
diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
index 0710868232..f472809ebc 100644
--- a/package/liblockfile/liblockfile.mk
+++ b/package/liblockfile/liblockfile.mk
@@ -4,26 +4,17 @@
 #
 ################################################################################
 
-LIBLOCKFILE_VERSION = 1.09
+LIBLOCKFILE_VERSION = 1.17
 LIBLOCKFILE_SOURCE = liblockfile_$(LIBLOCKFILE_VERSION).orig.tar.gz
-LIBLOCKFILE_SITE = http://snapshot.debian.org/archive/debian/20151026T153523Z/pool/main/libl/liblockfile
-LIBLOCKFILE_PATCH = liblockfile_$(LIBLOCKFILE_VERSION)-6.debian.tar.bz2
+LIBLOCKFILE_SITE = http://snapshot.debian.org/archive/debian/20210128T210947Z/pool/main/libl/liblockfile
+LIBLOCKFILE_PATCH = liblockfile_$(LIBLOCKFILE_VERSION)-1.debian.tar.bz2
 
 LIBLOCKFILE_LICENSE = LGPL-2.0+, GPL-2.0+ (dotlockfile)
-LIBLOCKFILE_LICENSE_FILES = COPYRIGHT
+LIBLOCKFILE_LICENSE_FILES = COPYRIGHT licenses/GPL-2 licenses/LGPL-2
 
+# We're patching Makefile.in
+LIBLOCKFILE_AUTORECONF = YES
 LIBLOCKFILE_INSTALL_STAGING = YES
 LIBLOCKFILE_CONF_OPTS = --mandir=/usr/share/man
 
-define LIBLOCKFILE_INSTALL_STAGING_CMDS
-	mkdir -p $(addprefix $(STAGING_DIR)/usr/share/man/man,1 3)
-	rm -f $(STAGING_DIR)/usr/lib/liblockfile.so
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LIBLOCKFILE_DIR) ROOT=$(STAGING_DIR) install
-	ln -sf liblockfile.so $(STAGING_DIR)/usr/lib/liblockfile.so.1
-endef
-
-define LIBLOCKFILE_INSTALL_TARGET_CMDS
-	cp -a $(STAGING_DIR)/usr/lib/liblockfile.so* $(TARGET_DIR)/usr/lib
-endef
-
 $(eval $(autotools-package))
diff --git a/package/lockfile-progs/Config.in b/package/lockfile-progs/Config.in
index de101a9a15..b9dbca9600 100644
--- a/package/lockfile-progs/Config.in
+++ b/package/lockfile-progs/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LOCKFILE_PROGS
 	bool "lockfile programs"
+	depends on BR2_USE_MMU # liblockfile
 	select BR2_PACKAGE_LIBLOCKFILE
 	help
 	  Build lockfile utility programs.
diff --git a/package/usbmount/Config.in b/package/usbmount/Config.in
index 8ce0ce7613..7760356b7c 100644
--- a/package/usbmount/Config.in
+++ b/package/usbmount/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_USBMOUNT
 	bool "usbmount"
+	depends on BR2_USE_MMU # lockfile-progs -> liblockfile
 	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_LOCKFILE_PROGS
 	help
@@ -10,4 +11,5 @@ config BR2_PACKAGE_USBMOUNT
 	  https://wiki.debian.org/usbmount
 
 comment "usbmount requires udev to be enabled"
+	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
