Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF68CC5AC9F
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9436C40A48;
	Fri,  7 Aug 2026 09:35:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kFQVnbL1s4TJ; Fri,  7 Aug 2026 09:35:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3E4A40A63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095345;
	bh=1+K9fB4Xp9/t7BP0t6hd9uNObqLFE1Alo1luq0z3IP4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hky+Frbji9StS6S3ZNCSCdTOZtTOn9d6/mn+nRIAwSe1ueujmqltnlB+TRWrI7Pui
	 lBjQiLZr4QtWhefcS9PtbIX83sc6rcg7i9nelvuk2j1GDPC/VtBJJpSVGrtq3vDHd6
	 p/tR9P7oQnSWZ1IniZUJdtVJ9vFyySkUCQmPcnzQwxjUD2m6gD2d12zU1l+/wHW8/1
	 eQZqUVUAJY5RWeeugfKcMygUQCjObOuufalJ/gijbmXil866Zh+6j7E2tJAJx2DrXe
	 TetchMpFMGKGtaInLelmL0XI1oA4BYt7ceODijvBIzjcE46TTsedTe4H4bjxenJ7J/
	 nUYH1lJ4ffeEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3E4A40A63;
	Fri,  7 Aug 2026 09:35:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 174B4397
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F20D7409FB
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UY7SwTVqxDMA for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABC7840A09
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABC7840A09
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4187D8CA40; Fri,  7 Aug 2026 09:34:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:12:42 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 5dd3d0b4340f9b127551528fcf50ff0a0253b383
X-Git-Newrev: 730777efadeeda202d3d82bf2c2ac4cfc262f631
X-Patchwork-Hint: ignore
Message-Id: <20260807093442.4187D8CA40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x]
 package/docker-credential-gcr: bump to 2.1.32
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/730777efadeeda202d3d82bf2c2ac4cfc262f631
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Changelog: https://github.com/GoogleCloudPlatform/docker-credential-gcr/compare/v2.1.30...v2.1.32

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 928a19f6f2288449d90435908b47aae3d03f99d2)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/docker-credential-gcr/docker-credential-gcr.hash | 2 +-
 package/docker-credential-gcr/docker-credential-gcr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-credential-gcr/docker-credential-gcr.hash b/package/docker-credential-gcr/docker-credential-gcr.hash
index 469e8d6b17..1269e239ad 100644
--- a/package/docker-credential-gcr/docker-credential-gcr.hash
+++ b/package/docker-credential-gcr/docker-credential-gcr.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a327753270232cb7f112b98328d5b56ae2da095ad74399b769aa5dad4393c8ae  docker-credential-gcr-v2.1.30-git4-go2.tar.gz
+sha256  7dcb5b75650a49e181afdbd735d09f3289cb62d5b30cb6e3f681e64cf804cbf9  docker-credential-gcr-v2.1.32-git4-go2.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/docker-credential-gcr/docker-credential-gcr.mk b/package/docker-credential-gcr/docker-credential-gcr.mk
index f889eb56c9..7419a47d4a 100644
--- a/package/docker-credential-gcr/docker-credential-gcr.mk
+++ b/package/docker-credential-gcr/docker-credential-gcr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CREDENTIAL_GCR_VERSION = v2.1.30
+DOCKER_CREDENTIAL_GCR_VERSION = v2.1.32
 DOCKER_CREDENTIAL_GCR_SITE = https://github.com/GoogleCloudPlatform/docker-credential-gcr
 DOCKER_CREDENTIAL_GCR_SITE_METHOD = git
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
