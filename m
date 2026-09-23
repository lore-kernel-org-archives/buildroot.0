Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13FCC98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 971EA8110D;
	Thu, 24 Sep 2026 18:57:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OJTWKKX7B8H7; Thu, 24 Sep 2026 18:57:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 91F9981109
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276236;
	b=a3+dxoub9r+Bnhl5H9v9+YaAEPSp40AMT3lk5gQvnSd7BamtUtNEwn6H4SNJo0iI78Ph
	 X4YWC5RBKBDpiMXlvP5UcAOOMQSWfV9DMzn5WLD+aG7QTqS01fMr+j6Os7XLguj4fIoBJ
	 uHUlUmQmFH4pc+hxDHk5eQj9qwAzHV45bnIeIu6yGQP48mTv9CxoP1Nfxcke0X6pw7R1M
	 5Nz4YlHsnHMHmtbYV5DcdobsgbFacipKTV5R0FWttFjI14X5Mz1xBWNhD6YRiF1GAHUwF
	 zefbokrUfDpoff+C98fR6jl8Wp10sbpaiBEuSLidRnB5ufai5xR+ckWTsHpMR2QbpOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276236;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=XMPzLsio4nTHVKKk2tyVZAfw8ouOhQi8SmHZrgPRXRk=;
	b=JHJLNUgswRJLI6EAde+Ns4NZgTE0to6YPG9HNf5V2qwGHvZJKa5Fxijfm/ybUhQ1S91G
	 yHE+t6utq7+b0loS6G2FYibSbME3lQIPA4Rkx7rlTljsPqfWu6qZ1TQSf2FQ3RJGWgYdT
	 fUMHokE14C0QaPGPicfBD67r96qqP9dVAU7gvjkKWNJ0n8ompawcewYKDmwXfiMJs/skV
	 dA0ZFgvAESPPUSyRgAEOWSI288DEPuiYefjcsSeRmCDoguTJxqdSDUtto6p0CYjK5G1Xu
	 EbMuZidqlICU+ySz4wSF8QMBXDpogPwR/IAkuqOYLZsNa17kRzXCMqQDLAaA9uRX7Lg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276236;
	bh=XMPzLsio4nTHVKKk2tyVZAfw8ouOhQi8SmHZrgPRXRk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HqfDBfAxf5dD21Ot38laZlbh//eYs1RAwj4GFJ9otApZNcPk9CRy+dLyu1A+CSeWU
	 pBihO/F+hldDDkffxC8SdXYcRwgu9yMZa56EkwY829u4k+knsDLoSeV6qfDPvGvi37
	 gJdGaEuGpDKpJ793ls63fOzH3XfMi8cKDXNPX8zRF/hf4CNUQ6DhYKl62rfjd+N+Vm
	 0mhlxQMIaWdZGM10w2/yGwMWzMVFSW71pvK1vr6TdTh4sjLulX3W2su1E87Y9SYKNY
	 BKJE3RcB1n/I4EXpfrdQEFoHBFTmNMSOUQO5qFzCfcPKkllcWJ/oL6r3MdV5sI2rSC
	 AzyCZDlQ13v/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91F9981109;
	Thu, 24 Sep 2026 18:57:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 55BD4392
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BDC540AE9
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DSWmvtXvsaD1 for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E885A40AC6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276202;
 b=AfFZnSK71NucIyVBsn12C0Qlf9IUI21YzGcfvP/Zt0n4HqT/4NrxBKzE/Su3qC8JK3KQ
 WlRt03ZWJP0lsaf9aHwx6+MpIyx0NT91oUEeVD3AYbdomtd/PA1LNfUTq2LXUSy6zaHbE
 3faBYc/h9cT2RIUTEVwj9qktvazuv5B5kwt2DShj+Z9UtV6vM8pER1m4SJol9EBwl7/xN
 5XeX48cz5ucwESbRhTjMJMUhu2JPeTopEP706hOd+tR8G5p31iNYjfd8wzfjCfsX9NWG/
 77T9vhofvpSwl50nBkRJ1/WsxCUjLwoL/UiTJq6MvB3XqgBynWdnGXzNjW+dvmee/LQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276202;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=YP7ddzX8u/pXIwAFgAvISMp5nu6W2bsAEqx3dUC+JKw=;
 b=OdjytKHyqdc56XCcyfJx7ShwauwyFzfp2Y/PjEMt/3lCHoUC40ZWpaBzY1r2PwneHXF2
 0LoDURqpX+c8gVu9cdg8IEggwQuhXFSnJaEFghP3Ejlo9Z88egxjzNsODrFj7T/KtydD3
 hM0LTcHYd02fEi4hGnBVBtJi/BiPgQx1PDbmFKt/Z18Lx8wjRrWN/vVSg5Op0wGrEzqIo
 e7tt9SO+webZp8MtM93yi1guMHVOOWwH2QkpN0dtPM7FCkC4/2jQmxY8BwwPqp0HpsTQk
 OUXcT/YlUqUi5TPkOw2LQXw25kxiJOsQyhi5H/eO2fLELZ8thvXTx6pUR5bMSJeuoXA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E885A40AC6
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CB3898383; Thu, 24 Sep 2026 18:55:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:56:07 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f275b8b2c1f22888eadf5f80cbca0786e94d1dbf
X-Git-Newrev: af569d7cf36ee1f14cbc867a902c1b499714d62a
X-Patchwork-Hint: ignore
Message-Id: <20260924185532.8CB3898383@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/wpewebkit:
 propagate gst1-libav architecture dependency
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1180362671080600112=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1180362671080600112==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/af569d7cf36ee1f14cbc867a902c1b499714d62a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA selects BR2_PACKAGE_GST1_LIBAV, which
depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS, but doesn't propagate
this dependency. In practice, there is no issue, as webkitgtk is only
available on a subset of CPU architectures, while
BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS makes ffmpeg available on pretty much
all CPU architectures, except Cortex-M, m68k coldfire, and some
specific cases of OpenRISC, which are not supported by webkitgtk.

But for the sake of having correct dependency propagation, let's fix
this.

The other packages selected by BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA have
dependencies that are already handled at the top-level
BR2_PACKAGE_WPEWEBKIT option.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 251a80dd9d5322d15afb8ffd5766ce879c478331)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/wpewebkit/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index f9c0f7cf42..ace1771ee5 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -87,6 +87,7 @@ comment "sandboxing supports needs a toolchain w/ headers >= 3.17"
 
 config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 	bool "multimedia support"
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS # gst1-libav
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BAD
 	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS

--===============1180362671080600112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1180362671080600112==--
