Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0715C79F80
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8062D80F6A;
	Fri,  4 Sep 2026 16:32:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8WDeNIVUUd9R; Fri,  4 Sep 2026 16:32:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E752F80E54
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788539569;
	b=K0oyUhz9KaRGFiYNvXr7knc1SEA95P0dPty4QxvKT8uFqf35i3JbC9vsO7R1biSH53Hd
	 wgBIZuY+UlT5kzO7NuAGztKx5YNj4T2GMEnaeMu/n4W2qabhLrs9iSjPg5pQDLcnbcwr0
	 S9phVo2XSqJOlyJ3iepyyfX6UqAQ+jrJ815YbzaZe1ulSEaOppMEjc3ZPxbBTm7O1DM+3
	 0Ou3LceLzHDpZzq3WwouILA0ZofT3U8c/X4NfibVxQx8XvFKNh6jXARqOanWRsq/5FOND
	 mK11vDyVaNKGTw1MPLOEJDUyumuB6cd3hTJFDnhmLigOqYW09OIh5lZwyOo9FrGs7Fw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788539569;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=XO5HFI2SKIylvYdhNV8Mi+o8d/xbwhE41biBMLnUpfo=;
	b=SyeJR25X8TgAZArduFGKYcHfqewT1CeEKSe0bAEFy1X7EPTpTPLNSeW7RA896Tu2F/yX
	 WVuNnCCmflvSyv3E+hAiwp9exgfyHDxRPPyXPWPtpJqe+dsWYdYywVSgUvfKu6hQzN1yr
	 A2sXAEqjM3Gb/Lqs2byq+cCeNPyhdDk1R+mZaAH/ntrXgjMxxSpR6vQy1j4/xxHYK1oIv
	 sOKmyl2mhehhTbBe/7R3S5CPg3AOxAPbEqmNiYpC7L3izFTIYVS2VgxtRaUsfos4s7o+k
	 FETPLP88ebe+Qsj5msh2dY7C57K8MWRLvf5sNFGSn1vD6bzjMqg4US/vlKzf2hoSU7g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788539569;
	bh=XO5HFI2SKIylvYdhNV8Mi+o8d/xbwhE41biBMLnUpfo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W1DR5L0gxZa+o2YO1yMGkj9fUzo4jpmgx57ZgOFZwZX0mJzsuTybrkNXS00dZ05PF
	 bSefHcqUINCVGfY/PEIfOetL52OBllyhxtq6dyFrPO9e8aNVr4p68ChuH6av/5pgwv
	 jokyqNxbRqU7B2EI9z1MKtXyPcAx0rpFN2rWkvXppnj2O4v+OYbTMnY995ZOkwiY2p
	 udHThdLW1Y6U6wBXgc7rt7B1mOLnwDLpba7IA2DXVN9j1k0k64icp6NSrrx43PzOLh
	 flTqldGqufsMXJWOQA/gS23JIpGgdNSPPSIdSj1+KxiWA7nNbdNYK/Q7V1Rp2ADVjP
	 xqx3cLJ8jGsWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E752F80E54;
	Fri,  4 Sep 2026 16:32:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E90D2FD
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FDE640A57
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:32:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sP5lQCGZNQNx for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:32:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9C7A640A30
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788539566;
 b=W+ycis+79L+ytTtAhhPfP/mayerubK3CZns82jtSuRoDTHwUhSE3k+kINdIfXS1pK1QX
 eoOzIrmxtrTlVJRDkydV1kxJGqDl8EKpnAgdjDvn4CDqOcCcrEA539MZuGrvguKYCwv4h
 MY1C5AowCv3nib2PR6uNUKnnfBaO/BeXgHT7eBtu4x0cmtoqA6B7JKWm9pl9UVc2haGKw
 bWZ/zQt7kQNg7sSAckTm5ZLyjppuhKhQ6yaBGN0k3eLNMOTDW2n/G2hRnmvzNmMkH/H0P
 XLSvrkO1h2wsElALaYJOWuZ6jNHgDTq4Hl4Qw9ufIePFrNEs6GhtATaMb4fkpVXOh3w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788539566;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=sZC+Vu+vihVPp//PC45yFHd3QuTix0Mns9cnaCNE95U=;
 b=UKCXsTva6qgcr3AWMAcKM99rjmba0+T+YwWTtmRWVVbPv9X1RAeKMjSiIoiDgYcuy5MZ
 J8NNtukM/1oYfJJ8PFNbRNwBQKLrlEUbGTGqtEmzCoTqcSSLl/NAZWhjjRu7bREV39FWf
 JSrh9dZu+JUfexoBGAAI4ucpIb3kv1h7/zt5u4tRWFcO7KsmFMDPf4Xqt1pnfoq56TRlt
 Uq8y56Ov2fsByBfElnt3gjH0nH4S+zeMFtcdtbgJRFQoXj2bPaF3XojmdfmJankXdXTIp
 b4fZkSb1wuHmWf0FrI4ULUr9F1Jx8+orc5eyQEdPCdbhiQDecdyuIUbNU14QOE6EhGg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=WA5q6jtQ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=WA5q6jtQ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C7A640A30
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788539564;
 bh=sZC+Vu+vihVPp//PC45yFHd3QuTix0Mns9cnaCNE95U=;
 h=From:To:Cc:Subject:Date:From;
 b=WA5q6jtQEbEXjw3rev0YHFISX6SHlLUoGPEC3PGNq6CL6EePajOCLrQsCYfVV7DQF
 T/HWrgiRm6fe0AtZ2E1c3qb3h+lXl0mGeJp/0tnOTz7U3Loh42C8mENcWZ2nD42NTZ
 47BfPWmgLIWzaDdnh+8gGiDg3vFONRupR9CN/EVefhy7Vt0x/zNS3IJ4SmAo2CCZIs
 bK8nQkDOVk7FuFPF7MuaedZjF5rEfEU8asXdSWn6R2rbwy5V6IwS1TfyntNq0CMwBR
 KNYImhYDcwbIMvKKK26Bz/yeRlSJIof52dMjxJy6cq0dINEjbQxxs2oCKbr3rILtiB
 dR4c3R//2GASw==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 708BCA4C2096;
 Fri,  4 Sep 2026 18:32:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49782)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2WqK-000000006SI-0frl;
 Fri, 04 Sep 2026 16:32:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dimitrios Siganos <dimitris@siganos.org>
Date: Fri,  4 Sep 2026 18:32:44 +0200
Message-ID: <20260904163244.119883-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/wireless-regdb: bump version to
 2026.09.03
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://lists.infradead.org/pipermail/wireless-regdb/2026-September/001953.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/wireless-regdb/wireless-regdb.hash | 2 +-
 package/wireless-regdb/wireless-regdb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index 4c6b3bec78..7e2bc57dfd 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256  8a27bfc081bafed8c24dd70fab0d96f098e5a0bfcd08d3da672595f225ab8993  wireless-regdb-2026.05.30.tar.xz
+sha256  b22e0901227b820cd1c280abe681a15b773a5103a5e10dc442e94ebb34cbf58d  wireless-regdb-2026.09.03.tar.xz
 # Locally computed
 sha256  678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 9761afc243..469de2acc0 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2026.05.30
+WIRELESS_REGDB_VERSION = 2026.09.03
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
