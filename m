Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E61D6AB00
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 19:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 222B141181;
	Thu,  2 Apr 2026 19:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XcSrlz_gRkgx; Thu,  2 Apr 2026 19:43:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4564E40F5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775159026;
	bh=hLpuEuyim2yNay72DLn0/9rPXXGP1MYs6yMq1/d6ClY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MHjn2HvWw4DcLzyV4Z7hQEoG5W9XDRncA5vL51/PRLh2s4By773bg8dK2UiFkeyv5
	 D2falB36iTE1EL6pCwKKTW6eaZ+mKxaU82aRjIMtGj/GCtOH4uuJFFbmlqvAveXJhY
	 uZOoU41I+RHTCZxGmoemTFIJZTE+sgHls2XCInbP7/Y/8pFHurwkTrt/MRcfHs7fzD
	 p8WrKCP0spE/9ZWtjpCbnfaqfECZl4CF402VnA7lzcDEZeit3T4CsuOuz3S+hoYBYj
	 tBTLmgJVs58YwljqtiTL5wn/wy7oBRgxNzkvIrpU6Bb+p/YekDw5jJVEV5kSBi5CfB
	 1I+PzhCzvqYUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4564E40F5A;
	Thu,  2 Apr 2026 19:43:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B3512CC
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 19:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D71D81E95
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 19:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KgATJYtrYj7u for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 19:43:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31B0D81E64
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31B0D81E64
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 19:43:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 995DB7FF22; Thu,  2 Apr 2026 19:43:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Apr 2026 21:28:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9ac6cce071b322119ba3d3bcd7d919c9cc3184c
X-Git-Newrev: 724635227314010518372c5bad4d37d7c58950c1
X-Patchwork-Hint: ignore
Message-Id: <20260402194343.995DB7FF22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xz: security bump version to 5.8.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/724635227314010518372c5bad4d37d7c58950c1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/tukaani-project/xz/releases/tag/v5.8.3

Fixes CVE-2026-34743.

Switched to sha256 tarball provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/xz/xz.hash | 6 ++----
 package/xz/xz.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 99daa5e9df..488a3d55dc 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,7 +1,5 @@
-# Locally calculated after checking pgp signature
-# https://github.com/tukaani-project/xz/releases/download/v5.8.2/xz-5.8.2.tar.bz2.sig
-# using key 3690C240CE51B4670D30AD1C38EE757D69184620 Lasse Collin <lasse.collin@tukaani.org>
-sha256  60345d7c0b9c8d7ffa469e96898c300def3669f5047fc76219b819340839f3d8  xz-5.8.2.tar.bz2
+# From https://github.com/tukaani-project/xz/releases/tag/v5.8.3
+sha256  33bf69c0d6c698e83a68f77e6c1f465778e418ca0b3d59860d3ab446f4ac99a6  xz-5.8.3.tar.bz2
 
 # Hash for license files
 sha256  616a3ad264ce29b8f1cb97e53037b139d406899ca8d1f799651e17bfa09830b8  COPYING
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 8aa0716b18..91eedd7a83 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.8.2
+XZ_VERSION = 5.8.3
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
 XZ_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
