Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865DCC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 22:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EF6060648;
	Wed, 20 Dec 2023 22:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EF6060648
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y8ED6Gugzgr7; Wed, 20 Dec 2023 22:37:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FAA561072;
	Wed, 20 Dec 2023 22:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FAA561072
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 568931BF471
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 22:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C3534185D
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 22:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C3534185D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w03VdUXPktc1 for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 22:37:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29B9941833
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 22:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29B9941833
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FE8E87CEF; Wed, 20 Dec 2023 22:37:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 23:36:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de5a82755d11ebd2f351a7c8f9250838542fce43
X-Git-Newrev: 02c818bc5c7a6967a212f12e4caa8ccdfa0b452b
X-Patchwork-Hint: ignore
Message-Id: <20231220223741.0FE8E87CEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libutempter: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=02c818bc5c7a6967a212f12e4caa8ccdfa0b452b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../libutempter/0001-force-symlink-creation.patch  | 36 ++++++++++++++++++++++
 package/libutempter/Config.in                      | 11 +++++++
 package/libutempter/libutempter.hash               |  3 ++
 package/libutempter/libutempter.mk                 | 27 ++++++++++++++++
 6 files changed, 79 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6e5bebeea6..874e7bd3d2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -38,6 +38,7 @@ F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
+F:	package/libutempter/
 F:	package/python-kmod/
 F:	package/python-versioneer/
 F:	package/tllist/
diff --git a/package/Config.in b/package/Config.in
index ce8b8a610e..7d4d624253 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2164,6 +2164,7 @@ menu "Other"
 	source "package/libunwind/Config.in"
 	source "package/liburcu/Config.in"
 	source "package/liburing/Config.in"
+	source "package/libutempter/Config.in"
 	source "package/libuv/Config.in"
 	source "package/lightning/Config.in"
 	source "package/linux-pam/Config.in"
diff --git a/package/libutempter/0001-force-symlink-creation.patch b/package/libutempter/0001-force-symlink-creation.patch
new file mode 100644
index 0000000000..c30928afd5
--- /dev/null
+++ b/package/libutempter/0001-force-symlink-creation.patch
@@ -0,0 +1,36 @@
+From 13e0a4ca67d860bc8f1e3b2ad6a3926758d76b47 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Wed, 22 Nov 2023 14:09:13 -0700
+Subject: [PATCH] force symlink creation
+
+Force symlink creation to avoid errors when reinstalling
+
+Upstream: https://github.com/altlinux/libutempter/pull/5
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 8c90121..1cfc627 100644
+--- a/Makefile
++++ b/Makefile
+@@ -83,12 +83,12 @@ install:
+ 	$(INSTALL) -p -m644 $(PROJECT).h $(DESTDIR)$(includedir)/
+ 	$(INSTALL) -p -m755 $(SHAREDLIB) $(DESTDIR)$(libdir)/$(SHAREDLIB).$(VERSION)
+ 	$(INSTALL) -p -m644 $(STATICLIB) $(DESTDIR)$(libdir)/
+-	ln -s $(SHAREDLIB).$(VERSION) $(DESTDIR)$(libdir)/$(SONAME)
+-	ln -s $(SONAME) $(DESTDIR)$(libdir)/$(SHAREDLIB)
++	ln -sf $(SHAREDLIB).$(VERSION) $(DESTDIR)$(libdir)/$(SONAME)
++	ln -sf $(SONAME) $(DESTDIR)$(libdir)/$(SHAREDLIB)
+ 	$(INSTALL) -p -m644 $(PROJECT).3 $(DESTDIR)$(man3dir)/
+ 	for n in lib$(PROJECT) utempter_add_record utempter_remove_record \
+ 	    utempter_remove_added_record utempter_set_helper; do \
+-		ln -s $(PROJECT).3 $(DESTDIR)$(man3dir)/$$n.3; \
++		ln -sf $(PROJECT).3 $(DESTDIR)$(man3dir)/$$n.3; \
+ 	done
+ 
+ clean:
+-- 
+2.42.0
+
diff --git a/package/libutempter/Config.in b/package/libutempter/Config.in
new file mode 100644
index 0000000000..a06a240418
--- /dev/null
+++ b/package/libutempter/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBUTEMPTER
+	bool "libutempter"
+	help
+	  The libutempter library provides interface for terminal
+	  emulators such as screen and xterm to record user
+	  sessions to utmp and wtmp files.
+
+	  http://ftp.altlinux.org/pub/people/ldv/utempter/
+
+comment "libutempter needs a toolchain w/ headers >= 4.14, dynamic library"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 || BR2_STATIC_LIBS
diff --git a/package/libutempter/libutempter.hash b/package/libutempter/libutempter.hash
new file mode 100644
index 0000000000..53a6c6db63
--- /dev/null
+++ b/package/libutempter/libutempter.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  967fef372f391de501843ad87570c6cf5dabd9651f00f1783090fbc12b2a34cb  libutempter-1.2.1.tar.gz
+sha256  ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING
diff --git a/package/libutempter/libutempter.mk b/package/libutempter/libutempter.mk
new file mode 100644
index 0000000000..44b0dc38b0
--- /dev/null
+++ b/package/libutempter/libutempter.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# libutempter
+#
+################################################################################
+
+LIBUTEMPTER_VERSION = 1.2.1
+LIBUTEMPTER_SITE = ftp.altlinux.org/pub/people/ldv/utempter
+LIBUTEMPTER_INSTALL_STAGING = YES
+LIBUTEMPTER_LICENSE = LGPL-2.1
+LIBUTEMPTER_LICENSE_FILES = COPYING
+
+define LIBUTEMPTER_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define LIBUTEMPTER_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
+		$(MAKE) DESTDIR=$(STAGING_DIR) PREFIX=/usr -C $(@D)/ install
+endef
+
+define LIBUTEMPTER_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
+		$(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/ install
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
