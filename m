Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA78C36002
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 19:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17A92607D9;
	Wed,  9 Apr 2025 19:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eG5jRzDrlh25; Wed,  9 Apr 2025 19:51:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35B5360D65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35B5360D65;
	Wed,  9 Apr 2025 19:51:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BE6F201
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 19:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F160560D65
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 19:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iR9kflvTXDYP for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 19:51:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 400EC607D9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 400EC607D9
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 19:51:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 397E883F61; Wed,  9 Apr 2025 19:51:10 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Apr 2025 21:42:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49c73215d327b7bb2fdfd3ecb72d196050b0f9f6
X-Git-Newrev: 2c18a7d235dda7a91604c19fdba8d57de4fadd71
X-Patchwork-Hint: ignore
Message-Id: <20250409195110.397E883F61@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liblinear: bump to 2.48
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2c18a7d235dda7a91604c19fdba8d57de4fadd71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebase patch for new version.
Soname changed, so updating accordingly in the mk file.
COPYRIGHT year got updated[2]

[1] https://github.com/cjlin1/liblinear/commit/818442728081980e9786cd3e87034d4e2912f0c4
[2] https://github.com/cjlin1/liblinear/commit/6c0108dcf3f84262530b909c53e778007235bff5

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/liblinear/0001-build-static-lib.patch | 27 ++++++++++++++++++++-------
 package/liblinear/liblinear.hash              |  4 ++--
 package/liblinear/liblinear.mk                |  6 +++---
 3 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/package/liblinear/0001-build-static-lib.patch b/package/liblinear/0001-build-static-lib.patch
index f3497b767e..69769a8005 100644
--- a/package/liblinear/0001-build-static-lib.patch
+++ b/package/liblinear/0001-build-static-lib.patch
@@ -1,14 +1,24 @@
-Makefile: add a rule to build a static library
+From 43a6b4c7b3a63b1cd7f1ed2772a1147be892560f Mon Sep 17 00:00:00 2001
+From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
+Date: Wed, 9 Apr 2025 16:03:59 +0200
+Subject: [PATCH] Makefile: add a rule to build a static library
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 [Fabrice: update for 2.43]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-diff -durN liblinear-1.96.orig/Makefile liblinear-1.96/Makefile
---- liblinear-1.96.orig/Makefile	2014-11-15 07:50:23.000000000 +0100
-+++ liblinear-1.96/Makefile	2014-12-14 00:23:00.135893956 +0100
-@@ -16,6 +16,11 @@
- 	fi; \
- 	$(CXX) $${SHARED_LIB_FLAG} linear.o newton.o blas/blas.a -o liblinear.so.$(SHVER)
+[Marcus: update for 2.48]
+Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
+---
+ Makefile | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index 4f22d17..5cf9b26 100644
+--- a/Makefile
++++ b/Makefile
+@@ -16,6 +16,11 @@ all: train predict
+ lib: linear.o newton.o blas/blas.a
+ 	$(CXX) $(SHARED_LIB_FLAG) linear.o newton.o blas/blas.a -o liblinear.so.$(SHVER)
  
 +# Keeping blas/blas.a as a pre-requisite, to ensure all .o files are built
 +static-lib: linear.o newton.o blas/blas.a
@@ -18,3 +28,6 @@ diff -durN liblinear-1.96.orig/Makefile liblinear-1.96/Makefile
  train: newton.o linear.o train.c blas/blas.a
  	$(CXX) $(CFLAGS) -o train train.c newton.o linear.o $(LIBS)
  
+-- 
+2.43.0
+
diff --git a/package/liblinear/liblinear.hash b/package/liblinear/liblinear.hash
index 6bc72909d0..01c7254df6 100644
--- a/package/liblinear/liblinear.hash
+++ b/package/liblinear/liblinear.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3c64eec45c01943a656baac7aeb8ffd782fe0aea53629aa9f5fdb8eec177c92f  liblinear-2.45.tar.gz
-sha256  d49b7898fd9ea7c29f0478e8c409ee7c0f621533d5eca7b7912e80391dc564e3  COPYRIGHT
+sha256  72ea3853a9fb430b49c3196177d8acdffd2dadb5901832ee323465792087e8cc  liblinear-2.48.tar.gz
+sha256  684e76f565a31ab057790c612bdacc2ee542f8a90b69f922377a92334771488c  COPYRIGHT
diff --git a/package/liblinear/liblinear.mk b/package/liblinear/liblinear.mk
index 134673a230..fb3dfdd38c 100644
--- a/package/liblinear/liblinear.mk
+++ b/package/liblinear/liblinear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLINEAR_VERSION = 2.45
+LIBLINEAR_VERSION = 2.48
 LIBLINEAR_SITE = https://www.csie.ntu.edu.tw/~cjlin/liblinear/oldfiles
 LIBLINEAR_LICENSE = BSD-3-Clause
 LIBLINEAR_LICENSE_FILES = COPYRIGHT
@@ -14,8 +14,8 @@ LIBLINEAR_CFLAGS = $(TARGET_CFLAGS)
 ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
 # $1: destination directory
 define LIBLINEAR_INSTALL_SHARED
-	$(INSTALL) -m 0644 -D $(@D)/liblinear.so.5 $(1)/usr/lib/liblinear.so.5
-	ln -sf liblinear.so.5 $(1)/usr/lib/liblinear.so
+	$(INSTALL) -m 0644 -D $(@D)/liblinear.so.6 $(1)/usr/lib/liblinear.so.6
+	ln -sf liblinear.so.6 $(1)/usr/lib/liblinear.so
 endef
 LIBLINEAR_CFLAGS += -fPIC
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
