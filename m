Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBA7FF885A
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 21:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 148328108B;
	Fri, 24 Apr 2026 21:41:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XKxbZNr5JW21; Fri, 24 Apr 2026 21:41:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2253881090
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777066898;
	bh=l7CmJuGkGrdEKjK21mAHN7NCBReg/roM81oiky19qww=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nmsj63XFkQemseeGt8oEWHpW9FummuyjqsS7wK98nKlveGgd/dGx1f70YsG8bO4OP
	 3uRjveE/QJv0OWQviX6ZggCoO0wWTqmvdDmM94vowz5F4GcB6vuU4qBotsG7Tn8URX
	 Bj92UjTTgdOOny6ysjyeCLrINVmSO2KktebikFiIpgJjcurLDPB8P4fg3GHh4/vHMI
	 MjKP0Y1wAJvqroDAEC455RASjnncU5KcMD5VlWx77Y8TbabxvlQGv77BnUVhPD8MgV
	 iSmcahgCM+hVrHC5DF5BJQf7gbrB8YIHgmQlLbly3/BFqInKboHyMiLOXn6Djkih89
	 EKn2G5W9l2DVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2253881090;
	Fri, 24 Apr 2026 21:41:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 52C3D2EC
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 21:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38F4F40223
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 21:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r8tvXe8pQi1Q for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 21:41:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68F84401D2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68F84401D2
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 21:41:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11221832D7; Fri, 24 Apr 2026 21:41:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 23:31:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 863b920e6b467733f39647410228f7c62b3daf2e
X-Git-Newrev: 18935d9d35c377f6de1ee5355f7f0cc743a2685b
X-Patchwork-Hint: ignore
Message-Id: <20260424214135.11221832D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/davfs2: bump version to 1.7.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/18935d9d35c377f6de1ee5355f7f0cc743a2685b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/alisarctl/davfs2/blob/rel-1-7-3/ChangeLog

Removed patch 0002 which is not needed anymore due to upstream removal
of the neon version check:
https://github.com/alisarctl/davfs2/commit/6b614bed3e814eb820a43a433c1f2c715c301f61

Upstream added musl support with this version:
https://github.com/alisarctl/davfs2/commit/270607253e4cbfa40ff59fc67a850b252bf0b0fa

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0002-configure.ac-add-neon-version-0.33.patch  | 27 ----------------------
 package/davfs2/Config.in                           |  6 ++---
 package/davfs2/davfs2.hash                         |  2 +-
 package/davfs2/davfs2.mk                           |  4 +---
 4 files changed, 5 insertions(+), 34 deletions(-)

diff --git a/package/davfs2/0002-configure.ac-add-neon-version-0.33.patch b/package/davfs2/0002-configure.ac-add-neon-version-0.33.patch
deleted file mode 100644
index 93eff48cd5..0000000000
--- a/package/davfs2/0002-configure.ac-add-neon-version-0.33.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 1c539d158ae73e867d0d30b8c3d27f48d742ed06 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 30 Mar 2024 09:18:15 +0100
-Subject: [PATCH] configure.ac: add neon version 0.33
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://savannah.nongnu.org/bugs/?65247
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4f86cde..ede9b1e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -36,7 +36,7 @@ AC_PROG_LN_S
- # Checks for libraries.
- AM_GNU_GETTEXT_VERSION(0.19.8)
- AM_GNU_GETTEXT([external])
--NE_REQUIRE_VERSIONS([0], [27 28 29 30 31 32])
-+NE_REQUIRE_VERSIONS([0], [27 28 29 30 31 32 33])
- DAV_CHECK_NEON
- 
- # Checks for header files.
--- 
-2.43.0
-
diff --git a/package/davfs2/Config.in b/package/davfs2/Config.in
index 31a680563c..082a422059 100644
--- a/package/davfs2/Config.in
+++ b/package/davfs2/Config.in
@@ -1,10 +1,10 @@
-comment "davfs2 needs a glibc toolchain"
+comment "davfs2 needs a glibc or musl toolchain"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_PACKAGE_DAVFS2
 	bool "davfs2"
-	depends on BR2_TOOLCHAIN_USES_GLIBC # fstab.h
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # fstab.h
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NEON
 	select BR2_PACKAGE_NEON_XML
diff --git a/package/davfs2/davfs2.hash b/package/davfs2/davfs2.hash
index 1cbacc388f..f23f21aed5 100644
--- a/package/davfs2/davfs2.hash
+++ b/package/davfs2/davfs2.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  251db75a27380cca1330b1b971700c5e5dcc0c90e5a47622285f0140edfe3a2f  davfs2-1.7.0.tar.gz
+sha256  a5368161eb5055651d7e5e8180c1606da95e78c941b6bb8a9286df7923cfcba9  davfs2-1.7.3.tar.gz
 # License file, locally calculated
 sha256  0ae0485a5bd37a63e63603596417e4eb0e653334fa6c7f932ca3a0e85d4af227  COPYING
diff --git a/package/davfs2/davfs2.mk b/package/davfs2/davfs2.mk
index 9f9e4a7073..be30dd0c45 100644
--- a/package/davfs2/davfs2.mk
+++ b/package/davfs2/davfs2.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-DAVFS2_VERSION = 1.7.0
+DAVFS2_VERSION = 1.7.3
 DAVFS2_SITE = http://download.savannah.nongnu.org/releases/davfs2
 DAVFS2_LICENSE = GPL-3.0+
 DAVFS2_LICENSE_FILES = COPYING
 DAVFS2_CPE_ID_VENDOR = werner_baumann
-# 0002-configure.ac-add-neon-version-0.33.patch
-DAVFS2_AUTORECONF = YES
 
 DAVFS2_DEPENDENCIES = \
 	neon \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
