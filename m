Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DB8EEAA74
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 20:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A62F612B9;
	Thu, 14 Sep 2023 20:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A62F612B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Jw-aFPIgBau; Thu, 14 Sep 2023 20:24:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C92C6120E;
	Thu, 14 Sep 2023 20:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C92C6120E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4806F1BF3E3
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 20:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 217986120E
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 20:24:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 217986120E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7XeT8T5ej69X for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 20:24:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAB8A60FD9
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 20:24:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAB8A60FD9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6C3986FA8; Thu, 14 Sep 2023 20:24:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 22:23:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab4f3fafaa839593b3efd9ea12c8ee5d9340cdeb
X-Git-Newrev: c9dcd9e459d6e0a955129ab42916d4c1140bdc3d
X-Patchwork-Hint: ignore
Message-Id: <20230914202422.C6C3986FA8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luajit: bump to version
 41fb94defa8f830ce69a8122b03f6ac3216d392a
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

commit: https://git.buildroot.net/buildroot/commit/?id=c9dcd9e459d6e0a955129ab42916d4c1140bdc3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The LuaJIT project switches to a rolling release scheme.
Now, the version contains the timestamp of its latest commit.

The timestamp can be seen in build log:
==== Successfully installed LuaJIT 2.1.1693350652 to /usr ====

diff COPYRIGHT:
    -Copyright (C) 2005-2022 Mike Pall. All rights reserved.
    +Copyright (C) 2005-2023 Mike Pall. All rights reserved.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luajit/0001-no-bin-symlink.patch |  4 ++--
 package/luajit/0002-install-inc.patch    |  6 +++---
 package/luajit/luajit.hash               |  4 ++--
 package/luajit/luajit.mk                 | 11 ++++++++++-
 4 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/package/luajit/0001-no-bin-symlink.patch b/package/luajit/0001-no-bin-symlink.patch
index dc36fa58d6..ea0e5bf8d0 100644
--- a/package/luajit/0001-no-bin-symlink.patch
+++ b/package/luajit/0001-no-bin-symlink.patch
@@ -6,7 +6,7 @@ Index: b/Makefile
 ===================================================================
 --- a/Makefile
 +++ b/Makefile
-@@ -45,8 +45,7 @@
+@@ -50,8 +50,7 @@
  INSTALL_MAN= $(INSTALL_SHARE)/man/man1
  INSTALL_PKGCONFIG= $(INSTALL_LIB)/pkgconfig
  
@@ -16,7 +16,7 @@ Index: b/Makefile
  INSTALL_ANAME= libluajit-$(ABIVER).a
  INSTALL_SOSHORT1= libluajit-$(ABIVER).so
  INSTALL_SOSHORT2= libluajit-$(ABIVER).so.$(MAJVER)
-@@ -61,7 +60,6 @@
+@@ -66,7 +65,6 @@
  INSTALL_SHORT1= $(INSTALL_LIB)/$(INSTALL_SOSHORT1)
  INSTALL_SHORT2= $(INSTALL_LIB)/$(INSTALL_SOSHORT2)
  INSTALL_T= $(INSTALL_BIN)/$(INSTALL_TNAME)
diff --git a/package/luajit/0002-install-inc.patch b/package/luajit/0002-install-inc.patch
index 8de777dce2..163a5d36fc 100644
--- a/package/luajit/0002-install-inc.patch
+++ b/package/luajit/0002-install-inc.patch
@@ -6,12 +6,12 @@ Index: b/Makefile
 ===================================================================
 --- a/Makefile
 +++ b/Makefile
-@@ -33,7 +33,7 @@
+@@ -38,7 +38,7 @@
  INSTALL_BIN=   $(DPREFIX)/bin
  INSTALL_LIB=   $(DPREFIX)/$(MULTILIB)
  INSTALL_SHARE= $(DPREFIX)/share
--INSTALL_DEFINC= $(DPREFIX)/include/luajit-$(MAJVER).$(MINVER)
+-INSTALL_DEFINC= $(DPREFIX)/include/luajit-$(MMVERSION)
 +INSTALL_DEFINC= $(DPREFIX)/include
  INSTALL_INC=   $(INSTALL_DEFINC)
  
- INSTALL_LJLIBD= $(INSTALL_SHARE)/luajit-$(VERSION)
+ INSTALL_LJLIBD= $(INSTALL_SHARE)/luajit-$(MMVERSION)
diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index 049f8c2fc2..578bb7a3e2 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  835035b244c3dc3d3d19bdd5ac623af90b84207e6330fb78f9fa51d6e200d760  luajit-8635cbabf3094c4d8bd00578c7d812bea87bb2d3.tar.gz
+sha256  b518721280390e4cec1af30f6819d86756ce4234d82410a55a4e121855f64e08  luajit-41fb94defa8f830ce69a8122b03f6ac3216d392a.tar.gz
 
 # Locally calculated
-sha256  52fc5b15ac968ed81aabb4c1e23ab3bce50f57a5764e9cdca86b463a11072921  COPYRIGHT
+sha256  1130331ac861a4b4520e9c8ad0814efdc6f1e79ea55ea9c460c73733d13ccb5f  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 2a27aa5056..06c8993391 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = 8635cbabf3094c4d8bd00578c7d812bea87bb2d3
+LUAJIT_VERSION = 41fb94defa8f830ce69a8122b03f6ac3216d392a
 LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
@@ -33,6 +33,15 @@ LUAJIT_HOST_CC = $(HOSTCC) -m32
 LUAJIT_XCFLAGS += -DLUAJIT_DISABLE_GC64
 endif
 
+# emulation of git archive with .gitattributes & export-subst
+# Timestamp of the $(LUAJIT_VERSION) commit, obtained in the LuaJit
+# repo, with:   git show -s --format=%ct $(LUAJIT_VERSION)
+define LUAJIT_GEN_RELVER_FILE
+	echo 1693350652 >$(@D)/.relver
+endef
+LUAJIT_POST_EXTRACT_HOOKS = LUAJIT_GEN_RELVER_FILE
+HOST_LUAJIT_POST_EXTRACT_HOOKS = LUAJIT_GEN_RELVER_FILE
+
 # We unfortunately can't use TARGET_CONFIGURE_OPTS, because the luajit
 # build system uses non conventional variable names.
 define LUAJIT_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
