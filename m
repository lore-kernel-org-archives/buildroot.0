Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F0AC5DF69
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D43D40CBF;
	Fri, 14 Aug 2026 13:21:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5rfecypPOgCg; Fri, 14 Aug 2026 13:21:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66A2640CBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713697;
	bh=z3S5A00zm8I65RvKkGZajMtDcGAEEPkjN+AEugIDCWs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Qjma+LWSAo/TfL9MyovL2K/b5tke2X1tVjjA8cKLXrKdz4Ch24R1ugkeqyR04serK
	 4zz1UQj0HgpHbEu2ws88AyK8yI4s2REQ6l+pmQzN/b7WJgTQiMPIfKoVeOMy1jycti
	 vGqFAODCevm2X3bBW2cQa3jeO7oH4sxEqJVBp3zqRAQYweaMWE2MC/PlwDVNYJX4DB
	 r0xQlNOuFJi53dxAkaNZidHzJxjwsvaGILZKYRmkVVUc9XEhb0qPSeU1BK+876NXhN
	 pzrw1OUCINYn8Gy8JIVCrPHzcocYW9pMCSDpcZZX5LFe3W31R0yn4IJaquJNHsspRE
	 aDOsp0SJpkLag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66A2640CBB;
	Fri, 14 Aug 2026 13:21:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 222F8139B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B4FA40316
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ah7JEPbGRPWc for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E25A402FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E25A402FB
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:21:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 366A68D665; Fri, 14 Aug 2026 13:20:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 16:03:39 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 3eed5b8f927a427f993b453e5b1a4470b9f32a89
X-Git-Newrev: f60e785b4c5e9ab2ccad792cba75fd9341dabb33
X-Patchwork-Hint: ignore
Message-Id: <20260814132035.366A68D665@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/{glibc,
 localedef}: move to Gitlab mirror repo
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f60e785b4c5e9ab2ccad792cba75fd9341dabb33
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Downloading from sourceware.org/git/glibc.git causes many 429 errors
these days so we switch to the upstream Gitlab mirror:
https://sourceware.org/glibc/wiki/GlibcGit#Fetching_The_Repository

Fixes:
https://autobuild.buildroot.net/results/09e/09e760063607b1cbf4ef687bf9bbe17b12d648b2/
https://autobuild.buildroot.net/results/22a/22afc952e0c05648d538d13ea593e5ad8c4c03c7/
https://autobuild.buildroot.net/results/281/28159f29e38b0475ae33fe73a9cab04ea3a8835f/
https://autobuild.buildroot.net/results/961/9616d46c46bd2a10a6e719d76ed6e1d8e3b3d0d2/
https://autobuild.buildroot.net/results/fd4/fd48fb96639871889fb2238dba360d1740d7962c/
https://autobuild.buildroot.net/results/91a/91a0b7ccad116911f84281b4cbcb080309ad952e/
https://autobuild.buildroot.net/results/17f/17ff61f0eac946b3c027a540147b2573e224dcdb/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1e9de8815f7e8cd5785df97819157e05b28cc560)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 5aa2ef5f99..797df314e9 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -8,7 +8,7 @@
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
 GLIBC_VERSION = 2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674
-GLIBC_SITE = https://sourceware.org/git/glibc.git
+GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
 GLIBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 732ed6d4ad..8eff7f136d 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -9,7 +9,7 @@
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 LOCALEDEF_VERSION = 2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
-LOCALEDEF_SITE = https://sourceware.org/git/glibc.git
+LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
 HOST_LOCALEDEF_DL_SUBDIR = glibc
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
