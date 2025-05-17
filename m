Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69160C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C796D6FA33;
	Mon, 19 May 2025 10:49:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6h0qpWInEmIW; Mon, 19 May 2025 10:49:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEB766108A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEB766108A;
	Mon, 19 May 2025 10:49:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C313193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3171A411FB
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gPrGly2o31dr for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FF024190C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FF024190C
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E017872E7; Mon, 19 May 2025 10:40:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 10:08:35 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cbabeb507744e220f5edaabb3a1549c1399adad6
X-Git-Newrev: 992b6783931157a809ed8435b08c2d21f380cc01
X-Patchwork-Hint: ignore
Message-Id: <20250519104006.5E017872E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libsepol: bump to
 version 3.8.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=992b6783931157a809ed8435b08c2d21f380cc01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changes:
    - SELinux policy version 34 is available starting with kernel 6.14.
    - Updated 0001-support-static-only.patch to apply cleanly and changed
      the email address from aduskett@gmail.com to
      adam.duskett@amarulasolutions.com

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/libsepol/0001-support-static-only.patch | 39 ++++++++++++++-----------
 package/libsepol/Config.in                      |  2 ++
 package/libsepol/libsepol.hash                  |  2 +-
 package/libsepol/libsepol.mk                    |  2 +-
 4 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/package/libsepol/0001-support-static-only.patch b/package/libsepol/0001-support-static-only.patch
index b3eb608f7b..7a614d7d0d 100644
--- a/package/libsepol/0001-support-static-only.patch
+++ b/package/libsepol/0001-support-static-only.patch
@@ -1,6 +1,6 @@
 From 2140db697c7f1da2a0a3f7bbcb14c1a0dade84e5 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Mon, 9 Oct 2017 16:28:12 -0400
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Wed, 14 May 2025 16:32:53 +0200
 Subject: [PATCH] Add support for static-only build
 
 Instead of unconditionally building shared libraries, this patch
@@ -10,17 +10,19 @@ libraries. It allows to support cases where the target architecture
 does not have support for shared libraries.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[Updated for 3.8.1]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Update for 2.8]
 ---
- src/Makefile | 13 ++++++++++---
- 1 file changed, 10 insertions(+), 3 deletions(-)
+ src/Makefile | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
 
-diff -durNw libsepol-2.7.orig/src/Makefile libsepol-2.7/src/Makefile
---- libsepol-2.7.orig/src/Makefile	2018-01-15 21:07:51.285183415 +0100
-+++ libsepol-2.7/src/Makefile	2018-01-15 21:08:56.515182717 +0100
-@@ -39,7 +39,12 @@
+diff --git a/src/Makefile b/src/Makefile
+index 71fa3ed..efb81bc 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -45,7 +45,12 @@ LDFLAGS += -undefined dynamic_lookup
  LN=gln
  endif
  
@@ -34,14 +36,17 @@ diff -durNw libsepol-2.7.orig/src/Makefile libsepol-2.7/src/Makefile
  
  
  $(LIBA):  $(OBJS)
-@@ -81,8 +86,10 @@
+@@ -87,8 +92,10 @@ endif
  install: all
-	test -d $(DESTDIR)$(LIBDIR) || install -m 755 -d $(DESTDIR)$(LIBDIR)
-	install -m 644 $(LIBA) $(DESTDIR)$(LIBDIR)
+ 	test -d $(DESTDIR)$(LIBDIR) || install -m 755 -d $(DESTDIR)$(LIBDIR)
+ 	install -m 644 $(LIBA) $(DESTDIR)$(LIBDIR)
 +ifeq ($(STATIC),)
-	test -d $(DESTDIR)$(SHLIBDIR) || install -m 755 -d $(DESTDIR)$(SHLIBDIR)
-	install -m 755 $(LIBSO) $(DESTDIR)$(SHLIBDIR)
+ 	test -d $(DESTDIR)$(SHLIBDIR) || install -m 755 -d $(DESTDIR)$(SHLIBDIR)
+ 	install -m 755 $(LIBSO) $(DESTDIR)$(SHLIBDIR)
 +endif
-	test -d $(DESTDIR)$(LIBDIR)/pkgconfig || install -m 755 -d $(DESTDIR)$(LIBDIR)/pkgconfig
-	install -m 644 $(LIBPC) $(DESTDIR)$(LIBDIR)/pkgconfig
-	$(LN) -sf --relative $(DESTDIR)$(SHLIBDIR)/$(LIBSO) $(DESTDIR)$(LIBDIR)/$(TARGET)
+ 	test -d $(DESTDIR)$(LIBDIR)/pkgconfig || install -m 755 -d $(DESTDIR)$(LIBDIR)/pkgconfig
+ 	install -m 644 $(LIBPC) $(DESTDIR)$(LIBDIR)/pkgconfig
+ 	$(LN) -sf --relative $(DESTDIR)$(SHLIBDIR)/$(LIBSO) $(DESTDIR)$(LIBDIR)/$(TARGET)
+-- 
+2.49.0
+
diff --git a/package/libsepol/Config.in b/package/libsepol/Config.in
index 5dfd1a41d3..5b0832009c 100644
--- a/package/libsepol/Config.in
+++ b/package/libsepol/Config.in
@@ -12,6 +12,7 @@ if BR2_PACKAGE_LIBSEPOL
 
 config BR2_PACKAGE_LIBSEPOL_POLICY_VERSION
 	int "Policy version"
+	default 34 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_14
 	default 33 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8
 	default 32 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
 	default 31 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
@@ -32,6 +33,7 @@ config BR2_PACKAGE_LIBSEPOL_POLICY_VERSION
 	  >= 4.13 < 5.5    31
 	  >= 5.5 < 5.8     32
 	  >= 5.8           33
+	  >= 6.14          34
 
 endif
 
diff --git a/package/libsepol/libsepol.hash b/package/libsepol/libsepol.hash
index dcc67ac638..adf7cb86bb 100644
--- a/package/libsepol/libsepol.hash
+++ b/package/libsepol/libsepol.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  cd741e25244e7ef6cd934d633614131a266c3eaeab33d8bfa45e8a93b45cc901  libsepol-3.7.tar.gz
+sha256  0e78705305f955abd4c0654d37a5477ee26349ab74db9e2b03a7868897ae1ddf  libsepol-3.8.1.tar.gz
 
 # Hash for license file
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  LICENSE
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index af14778ead..2376ab852d 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSEPOL_VERSION = 3.7
+LIBSEPOL_VERSION = 3.8.1
 LIBSEPOL_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSEPOL_VERSION)
 LIBSEPOL_LICENSE = LGPL-2.1+
 LIBSEPOL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
