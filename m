Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133FEC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 282395040E;
	Fri, 28 Feb 2025 17:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id krka6Z7YZ1dS; Fri, 28 Feb 2025 17:00:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D648850410
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D648850410;
	Fri, 28 Feb 2025 17:00:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DE42711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C13442E32
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d7D6mYpaS7me for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 875E34264D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 875E34264D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 816D685EF6; Fri, 28 Feb 2025 16:30:14 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Jan 2025 21:10:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 26a328f8ef178dab746b6cd766140661a5ee4c5d
X-Git-Newrev: ae9b9e96dc931e20cf63821d7ffe7ab8d9e17273
X-Patchwork-Hint: ignore
Message-Id: <20250228163014.816D685EF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/luajit: bump to
 version a4f56a459a588ae768801074b46ba0adcfb49eb1
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae9b9e96dc931e20cf63821d7ffe7ab8d9e17273
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

diff COPYRIGHT:
    -Copyright (C) 2005-2023 Mike Pall. All rights reserved.
    +Copyright (C) 2005-2025 Mike Pall. All rights reserved.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/luajit/0001-no-bin-symlink.patch | 4 ++--
 package/luajit/0002-install-inc.patch    | 8 ++++----
 package/luajit/luajit.hash               | 4 ++--
 package/luajit/luajit.mk                 | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/luajit/0001-no-bin-symlink.patch b/package/luajit/0001-no-bin-symlink.patch
index ea0e5bf8d0..3141d2adba 100644
--- a/package/luajit/0001-no-bin-symlink.patch
+++ b/package/luajit/0001-no-bin-symlink.patch
@@ -6,7 +6,7 @@ Index: b/Makefile
 ===================================================================
 --- a/Makefile
 +++ b/Makefile
-@@ -50,8 +50,7 @@
+@@ -51,8 +51,7 @@
  INSTALL_MAN= $(INSTALL_SHARE)/man/man1
  INSTALL_PKGCONFIG= $(INSTALL_LIB)/pkgconfig
  
@@ -16,7 +16,7 @@ Index: b/Makefile
  INSTALL_ANAME= libluajit-$(ABIVER).a
  INSTALL_SOSHORT1= libluajit-$(ABIVER).so
  INSTALL_SOSHORT2= libluajit-$(ABIVER).so.$(MAJVER)
-@@ -66,7 +65,6 @@
+@@ -67,7 +66,6 @@
  INSTALL_SHORT1= $(INSTALL_LIB)/$(INSTALL_SOSHORT1)
  INSTALL_SHORT2= $(INSTALL_LIB)/$(INSTALL_SOSHORT2)
  INSTALL_T= $(INSTALL_BIN)/$(INSTALL_TNAME)
diff --git a/package/luajit/0002-install-inc.patch b/package/luajit/0002-install-inc.patch
index eec77a5f82..ff4d169afb 100644
--- a/package/luajit/0002-install-inc.patch
+++ b/package/luajit/0002-install-inc.patch
@@ -6,12 +6,12 @@ Index: b/Makefile
 ===================================================================
 --- a/Makefile
 +++ b/Makefile
-@@ -38,7 +38,7 @@
- INSTALL_BIN=   $(DPREFIX)/bin
+@@ -39,7 +39,7 @@
  INSTALL_LIB=   $(DPREFIX)/$(MULTILIB)
- INSTALL_SHARE= $(DPREFIX)/share
+ INSTALL_SHARE_= $(PREFIX)/share
+ INSTALL_SHARE= $(DESTDIR)$(INSTALL_SHARE_)
 -INSTALL_DEFINC= $(DPREFIX)/include/luajit-$(MMVERSION)
 +INSTALL_DEFINC= $(DPREFIX)/include
  INSTALL_INC=   $(INSTALL_DEFINC)
  
- export INSTALL_LJLIBD= $(INSTALL_SHARE)/luajit-$(MMVERSION)
+ export INSTALL_LJLIBD= $(INSTALL_SHARE_)/luajit-$(MMVERSION)
diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index eddd2a2419..e14bcc9063 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  cbf1647acbd340c62b9c342dae43290762efa1b26d8bf8457f143fabf8ed86c7  luajit-97813fb924edf822455f91a5fbbdfdb349e5984f.tar.gz
+sha256  b4120332a4191db9c9da2d81f9f11f0d4504fc4cff2dea0f642d3d8f1fcebd0e  luajit-a4f56a459a588ae768801074b46ba0adcfb49eb1.tar.gz
 
 # Locally calculated
-sha256  1130331ac861a4b4520e9c8ad0814efdc6f1e79ea55ea9c460c73733d13ccb5f  COPYRIGHT
+sha256  5b79fb4754728487cf43d55b213bb68369912484f2dd7ab68380435e994bce39  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 301973db7e..b030a16cfc 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = 97813fb924edf822455f91a5fbbdfdb349e5984f
+LUAJIT_VERSION = a4f56a459a588ae768801074b46ba0adcfb49eb1
 LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
