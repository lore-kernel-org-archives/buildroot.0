Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D60CEF4EA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 08:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0638480F45;
	Mon,  6 Apr 2026 08:57:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NjeyDKyuA7y9; Mon,  6 Apr 2026 08:57:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A6D980FA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775465877;
	bh=P6cFlNrLLRtTRcQHeTSeIdkkE0vP/2LZhgKXSaTD6vg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CUehwGbvO/YgtAFzVIArtpTFxqqp9hmXW078aeTo48X51/vWQU8tDJgrhrrA4Z0yn
	 OQbcGUrL8k1xHqLPFlm55fJ8izY2hjLsCP70L5FtmplirMv0lX3GDsOu1+S31AzLeG
	 vbIAQ/P4ssx+8gzUUTNNWp+z9D0Wvszi9O3z55+F44LmuL8leTyTvchbHpruC/Ue9L
	 YEejYwk3whKgl7cIcNERXPx4SqCEsNW/JdeO00ghQ0PJDMZ3kEnnia48VQcLtB0cPs
	 qeRRQoC1PNYxJtad0vx2cgR1vzHmSycIM2QGxE94X+1i1S1zqL4L8DaNdb3BIdhSNC
	 x8coPUga/SY4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A6D980FA8;
	Mon,  6 Apr 2026 08:57:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BC9B92EF
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A28FF80FA8
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5e4B8_Wnz3jj for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 08:57:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03D7680F45
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03D7680F45
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:57:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8928B804AD; Mon,  6 Apr 2026 08:57:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Apr 2026 10:46:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52f9930e64066fc622381066ae4a5fb218c590a6
X-Git-Newrev: 4feaf08d762370e7e9e0c5c5d508fa289dad07c6
X-Patchwork-Hint: ignore
Message-Id: <20260406085754.8928B804AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgis: bump version to 3.6.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4feaf08d762370e7e9e0c5c5d508fa289dad07c6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/postgis/postgis/blob/3.6.2/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/postgis/postgis.hash | 2 +-
 package/postgis/postgis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
index e70d0e43eb..8ca0fa48c3 100644
--- a/package/postgis/postgis.hash
+++ b/package/postgis/postgis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ec0cfaab475630106211d180d71df46782e41e10b6dffe91d79ca818ecd2cbb4  postgis-3.6.1.tar.gz
+sha256  d488089a64ee4060bce7dbba0291fcca358e7f7ac5230e2ee5b344e7485729c4  postgis-3.6.2.tar.gz
 sha256  81749eea887e78402c9b85896cd629b155bc29256927f818f01001f038146391  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index d5c8fc80be..42511536aa 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGIS_VERSION = 3.6.1
+POSTGIS_VERSION = 3.6.2
 POSTGIS_SITE = https://download.osgeo.org/postgis/source
 # parallel build issues
 POSTGIS_MAKE = $(MAKE1)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
