Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4512D185C6
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 11:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64F0E828BA;
	Thu,  8 Jan 2026 11:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5QeeiSR2ENhf; Thu,  8 Jan 2026 11:02:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 947EE82884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767870179;
	bh=kPX9nsxon7WqI460eIkrA7E0ab+XUh856WEHE4XSjBQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ww7mShA6S3cyUs6whP2doVdOIhZvPi94uZATczO7bsGwwwR+B1gm0U0GLd+kRDxlg
	 IEy+7RJYDtBeC14KiaKBkGI6k4Bf3ZlmLyDkabo1hDC5TEVSQzKhAgKK/eVCfZ/46/
	 4RHUdfSAHr78WNiYOpJs+EhCuK75o1CuGlgvzl8lgauu4OEHkwa9n47dCjSjhWgqUG
	 tiw14Zjoib9yRfuKFd5X4wz4WNnOwoHn6p0K9vzOj/0cV2E8nyfQ+sSkjiw/5c9t4o
	 PR5JeMZRGnBrxfx/qdoPTub9fhspL0j1zQoI0Dk6p+VGrJqm9kLi5GwUKVk71/b/zz
	 jApgdBhLCP+tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 947EE82884;
	Thu,  8 Jan 2026 11:02:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 796B1436
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BAF840087
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:02:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U9RUmO9Dfh2s for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 11:02:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FDF34004E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FDF34004E
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:02:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D8CB8845E; Thu,  8 Jan 2026 11:02:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Jan 2026 12:02:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa66f3dfd0f0afdd0d7d0ac214a0a054dbaedca6
X-Git-Newrev: 0a1f5fd5925c73640475722ca2c405a5dc42c23c
X-Patchwork-Hint: ignore
Message-Id: <20260108110256.7D8CB8845E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: Drop support for some packages
 from Francois Perrad
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0a1f5fd5925c73640475722ca2c405a5dc42c23c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2dbd64a455..c150ab8fc5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1167,33 +1167,25 @@ F:	configs/sipeed_licheepi_nano_defconfig
 F:	configs/visionfive2_defconfig
 
 N:	Francois Perrad <francois.perrad@gadz.org>
-F:	board/freescale/ls1028ardb/
 F:	board/olimex/a20_olinuxino
 F:	board/olimex/imx233_olinuxino/
 F:	board/olimex/stmp1_olinuxino/
-F:	configs/ls1028ardb_defconfig
 F:	configs/olimex_a20_olinuxino_*
 F:	configs/olimex_imx233_olinuxino_defconfig
 F:	configs/olimex_stmp157_olinuxino_lime_defconfig
 F:	package/4th/
 F:	package/cgilua/
-F:	package/chipmunk/
-F:	package/cog/
 F:	package/collectl/
 F:	package/copas/
 F:	package/coxpcall/
 F:	package/dado/
 F:	package/ficl/
-F:	package/graphene/
 F:	package/janet/
-F:	package/libgtk4/
 F:	package/libtomcrypt/
 F:	package/libtommath/
-F:	package/libwpe/
 F:	package/linenoise/
 F:	package/ljlinenoise/
 F:	package/lua-inotify/
-F:	package/lmdb/
 F:	package/lpeg/
 F:	package/lpty/
 F:	package/lrandom/
@@ -1202,16 +1194,11 @@ F:	package/lua*
 F:	package/lynis/
 F:	package/lzlib/
 F:	package/moarvm/
-F:	package/mstpd/
-F:	package/netsurf/
 F:	package/perl*
 F:	package/pkg-perl.mk
 F:	package/pkg-luarocks.mk
 F:	package/quickjs/
 F:	package/rings/
-F:	package/tekui/
-F:	package/wpebackend-fdo/
-F:	package/wpewebkit/
 F:	package/wsapi/
 F:	package/wsapi-fcgi/
 F:	package/wsapi-xavante/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
