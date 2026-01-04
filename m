Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0E0C2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 14:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A5CD60730;
	Sun,  4 Jan 2026 14:27:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K1g_ZL0CBVNh; Sun,  4 Jan 2026 14:27:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36F9960756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767536870;
	bh=Nf69q+k8Q09UBeURsLvhiuEw+DPHurgP5Z3my9Z1zh8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZKAqHvJ4xwuvg9bQ0xiRnZT0WWQFh9cWagBCcMeInU/lghZ8j7YWmTBu0uoJtQhF+
	 Qqid8df8b2PaalIAQs0s54GP0fw4PeJXcdDUFL7vEg6jcRvwqSuGmo//1PiJRM6FEP
	 O7qCciJ7NOu4Elk9878ykalPs3dNviefCieS9/HYGbgwPyFnQsM2hLWATabn7xWeRA
	 56NM59YjP10o1hsiIK2ORItCPkklnLfRgpR3F85fJPdzmKZH7m0oSjm3OidzWNknAN
	 YAEE6lm9vMaIBhhv24Bw5LIOVXsX8xu6KQugKPfuB4pxd/zEJfAi1GOhaFh0oklwLO
	 82JAAk3GPkmwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36F9960756;
	Sun,  4 Jan 2026 14:27:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B349A229
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A10FC80E2F
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:27:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AYa7d-f2CMIR for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 14:27:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8587480E1F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8587480E1F
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:27:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 748E48815A; Sun,  4 Jan 2026 14:27:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Jan 2026 15:09:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d3d5c68a2a3783acdbe2eb6a19fa15760038e3d
X-Git-Newrev: 8cc383185c103bdb7d2bb9bafe68f858283290b1
X-Patchwork-Hint: ignore
Message-Id: <20260104142747.748E48815A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/e2tools: bump version to 0.1.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8cc383185c103bdb7d2bb9bafe68f858283290b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream project was moved to https://github.com/e2tools/e2tools
https://github.com/ndim/e2tools/commit/8829023675b316cd3e32559000101403cd63c8f3

Switched to tarball provided by upstream, dropped autoreconf.

Updated lisense hash due to upstream commit
https://github.com/e2tools/e2tools/commit/5201a6882b4bec33256f0dad89d52a7f1d0ca893

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/e2tools/Config.in      | 2 +-
 package/e2tools/Config.in.host | 2 +-
 package/e2tools/e2tools.hash   | 4 ++--
 package/e2tools/e2tools.mk     | 6 ++----
 4 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/e2tools/Config.in b/package/e2tools/Config.in
index e4a35e27f4..c2c1f6f59a 100644
--- a/package/e2tools/Config.in
+++ b/package/e2tools/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_E2TOOLS
 	  utilities access a filesystem directly using the ext2fs
 	  library.
 
-	  https://github.com/ndim/e2tools
+	  https://e2tools.github.io
 
 comment "e2tools needs a toolchain w/ threads, wchar"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/e2tools/Config.in.host b/package/e2tools/Config.in.host
index 859c47bdc5..2f0ada9922 100644
--- a/package/e2tools/Config.in.host
+++ b/package/e2tools/Config.in.host
@@ -7,4 +7,4 @@ config BR2_PACKAGE_HOST_E2TOOLS
 	  utilities access a filesystem directly using the ext2fs
 	  library.
 
-	  https://github.com/ndim/e2tools
+	  https://e2tools.github.io
diff --git a/package/e2tools/e2tools.hash b/package/e2tools/e2tools.hash
index 14be7dbd96..dc716fa92a 100644
--- a/package/e2tools/e2tools.hash
+++ b/package/e2tools/e2tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1d06ca71f01483ad6d9a514e31466e7d2357b3465de2813d667a8b2f9638544e  e2tools-0.0.16.4.tar.gz
-sha256  0e79fd282723e1eb3f7381d41233a83ed20cf3e8c83aa53e6847bf7ffe781583  COPYING
+sha256  b19593bbfc85e9c14c0d2bc8525887901c8fe02588c76df60ab843bf0573c4a2  e2tools-0.1.2.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/e2tools/e2tools.mk b/package/e2tools/e2tools.mk
index 7c9ef0ffc7..5eee699310 100644
--- a/package/e2tools/e2tools.mk
+++ b/package/e2tools/e2tools.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-E2TOOLS_VERSION = 0.0.16.4
-E2TOOLS_SITE = $(call github,ndim,e2tools,v$(E2TOOLS_VERSION))
+E2TOOLS_VERSION = 0.1.2
+E2TOOLS_SITE = https://github.com/e2tools/e2tools/releases/download/v$(E2TOOLS_VERSION)
 
-# Source coming from GitHub, no configure included.
-E2TOOLS_AUTORECONF = YES
 E2TOOLS_LICENSE = GPL-2.0
 E2TOOLS_LICENSE_FILES = COPYING
 E2TOOLS_DEPENDENCIES = e2fsprogs
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
