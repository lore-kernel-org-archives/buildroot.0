Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47395F483EE
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 031AD821EB;
	Mon, 23 Mar 2026 19:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gpnPcgzQs_4S; Mon, 23 Mar 2026 19:55:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 383FA821F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295714;
	bh=E6Ux3zhBgzouXsKYEbCFiRy8dLvUbJk3WHzgolWF88k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZvqHVoTjmn9FIaVMGbOruVvCX4V+Mlc6SgdeAXucJkLZeprx/8D6+cKtD1hrRtSvb
	 mxWFZ1COXlWHeaVNLCkZeLoDNein0kV7s2j56V9OFjHI+AEFaRwpjHnQTojjXQxybX
	 /73xF6GUm2Tb7KkuLP+jOR3g5cYSwuNFLtt++tKRCr04gkbLsy6O4Lej2PKvqaskev
	 tMRC+LQ7HoZ6iCFtLYFj++0sHVfi/LyK7ToUqNG61ezYluMHGKBvi6PxD+WzMW7rJJ
	 b9Fq898fokdY+SeBnseQc/3ZuNME3U1ztU1DHepBSfYXayYiyTDRPur9389zuI3sB+
	 rSJnsZbJPeWQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 383FA821F7;
	Mon, 23 Mar 2026 19:55:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 71546F4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53F57405EE
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:55:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cgidp349P-E8 for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:55:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C57640A4B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C57640A4B
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:55:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B1BD84CA2; Mon, 23 Mar 2026 19:47:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 22 Mar 2026 13:04:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: abb44c520b93553e98c80ca6fda6946e4bd2712b
X-Git-Newrev: f9c20750e26ccb652e5cf0dc95d3e077440a1ce4
X-Patchwork-Hint: ignore
Message-Id: <20260323194746.3B1BD84CA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dtbocfg: bump version to 0.1.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f9c20750e26ccb652e5cf0dc95d3e077440a1ce4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/ikwzm/dtbocfg/compare/v0.1.0...v0.1.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dtbocfg/dtbocfg.hash | 2 +-
 package/dtbocfg/dtbocfg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dtbocfg/dtbocfg.hash b/package/dtbocfg/dtbocfg.hash
index df1817f7aa..dd943c9e3c 100644
--- a/package/dtbocfg/dtbocfg.hash
+++ b/package/dtbocfg/dtbocfg.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f1667de4250b744bb4a11dfc5f85d8b1f960da7d396c9f230f5b4d12224f524f  dtbocfg-0.1.0.tar.gz
+sha256  74624c17a37f3178623bafb476339d357ae517c1fd4cbfe9175540c8b2638ac8  dtbocfg-0.1.1.tar.gz
 sha256  e57cb9f2ed607cd95bf1b64371325c505c1ac8fe640a8c9933e7fe7637a38567  LICENSE
diff --git a/package/dtbocfg/dtbocfg.mk b/package/dtbocfg/dtbocfg.mk
index df5f692bc1..6231e850c7 100644
--- a/package/dtbocfg/dtbocfg.mk
+++ b/package/dtbocfg/dtbocfg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTBOCFG_VERSION = 0.1.0
+DTBOCFG_VERSION = 0.1.1
 DTBOCFG_SITE = $(call github,ikwzm,dtbocfg,v$(DTBOCFG_VERSION))
 DTBOCFG_LICENSE = BSD-2-Clause
 DTBOCFG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
