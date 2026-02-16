Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E841E83837
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 21:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A65B60C08;
	Mon, 16 Feb 2026 21:47:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0_YEeAiujDht; Mon, 16 Feb 2026 21:47:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BD9260E15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771278420;
	bh=0dqxW2JfN4OB/PxtC2jS7ZOYzagySC3095D/XTaxiw0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hL2gZy9JyJbqMau9vsW+KX3TPslL9EFJgXIn9Imio04HTDwczaFAv2Jzp/h5AyPX+
	 aIkTkQi03lAjY7NNO77Hw/3mjmMjVbgRWE7IiMr3bfJ/To/XO7EdJZuIykAmj9OE6b
	 +4UPO1Zs1g4h0oE3tAwUJgp2bK++pRQWDGEVu+NvJqmrXwUzeh5NFSp8F1Wo4TxZEm
	 llsuvNnafAlaj5W8d1FYAzyfKE/sRO/G3IoCA+xGHdNiMLqZ1hF1zrzqMzJO45XcsI
	 YBX0so2afGCanIFX8m55rq8R4SUMMowzKRHJKaCIYF+jr9ywY1C3RmaNJ+jU/WjWX5
	 f63OPxK7maoRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BD9260E15;
	Mon, 16 Feb 2026 21:47:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 97D84270
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 21:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88FBE408A5
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 21:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ud2aZmyyatKT for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 21:46:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F44540780
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F44540780
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 21:46:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B73386F62; Mon, 16 Feb 2026 21:46:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 16 Feb 2026 22:45:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50d1dec604c21c04bd518109fff0c67e8f7f029b
X-Git-Newrev: 41eb6620f42fda2c0e38b6a7b122e59b136e02b0
X-Patchwork-Hint: ignore
Message-Id: <20260216214657.2B73386F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/catch2: bump to version 3.13.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/41eb6620f42fda2c0e38b6a7b122e59b136e02b0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

changelog:
https://github.com/catchorg/Catch2/releases/tag/v3.13.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/catch2/catch2.hash | 2 +-
 package/catch2/catch2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/catch2/catch2.hash b/package/catch2/catch2.hash
index 1cf29821c9..c45cd0e3c5 100644
--- a/package/catch2/catch2.hash
+++ b/package/catch2/catch2.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e077079f214afc99fee940d91c14cf1a8c1d378212226bb9f50efff75fe07b23  catch2-3.12.0.tar.gz
+sha256  650795f6501af514f806e78c554729847b98db6935e69076f36bb03ed2e985ef  catch2-3.13.0.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE.txt
diff --git a/package/catch2/catch2.mk b/package/catch2/catch2.mk
index d3da027d2b..fb0edbc9bc 100644
--- a/package/catch2/catch2.mk
+++ b/package/catch2/catch2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CATCH2_VERSION = 3.12.0
+CATCH2_VERSION = 3.13.0
 CATCH2_SITE = $(call github,catchorg,Catch2,v$(CATCH2_VERSION))
 CATCH2_INSTALL_STAGING = YES
 CATCH2_INSTALL_TARGET = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
