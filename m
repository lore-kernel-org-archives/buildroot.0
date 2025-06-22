Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A471CC7115A
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 11:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71BC940C70;
	Sun, 22 Jun 2025 11:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XTl3G-aTnXiW; Sun, 22 Jun 2025 11:45:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B0CD40CEE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B0CD40CEE;
	Sun, 22 Jun 2025 11:45:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CB71512C
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 11:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B236840290
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 11:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2kr0tRltCWZu for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 11:45:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1F3F2400F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F3F2400F1
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F3F2400F1
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 11:45:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A8C3F7804FD;
 Sun, 22 Jun 2025 13:45:30 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Jun 2025 13:45:30 +0200
MIME-Version: 1.0
Date: Sun, 22 Jun 2025 13:45:30 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Heiko Thiery <heiko.thiery@gmail.com>
In-Reply-To: <20250618142825.758131-2-alex.bennee@linaro.org>
References: <20250618142825.758131-1-alex.bennee@linaro.org>
 <20250618142825.758131-2-alex.bennee@linaro.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <b0d35fe3ce64a0bff8c33d0c3d705972@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750592732;
 bh=Z6jobcIODC9rbJpgR9WpGTRI6fWVtmdAuWoEJe44iqU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sdj4NumDKhl5XKOz51WZrsxLAGspz9icVHpaE2xeodbtuN3+ITUTWMLXuNhcmpfY5
 fLHmWZdJvdCCfQ/Dl98ofsTs3U7B6iggAIaDmBTHZ7tLNcrEdwCUAKIWJoo5s3HlkQ
 Yk8Xt+VTOYuybNnNdFPtpn0c4dOU/YAvA5MaICnGka10dTk0QRZggNQ24TA+A2Ph8/
 V8ciqH+L6Flz4OMhFr7t9CIVNT+LNmGFAlVaOoszHj79dvTQ/EFDBsXn6a3yuy+LCw
 HPNxVdL4YR/IzxK8eSIwdpQEyfWjhTQFkj6fvRTngNI/VluDOFdAtMvzoVNASwg/wX
 9SY21mklTSL3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sdj4NumD
Subject: Re: [Buildroot] [PATCH v7 1/4] package/vulkan-sdk: new package
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTgvMDYvMjAyNSAxNjoyOCwgQWxleCBCZW5uw6llIHdyb3RlOgo+IFRoZSBwcmluY2lwbGUg
Y29tcG9uZW50IG9mIHRoaXMgaXMgdGhlIG5ldyB2b2xrIG1ldGEtbG9hZGVyIHdoaWNoIGlzCj4g
cmVxdWlyZWQgZm9yIG1vcmUgcmVjZW50IHZlcnNpb25zIG9mIHZ1bGthbi10b29scy4gVGhlcmUg
ZG9lcyBzZWVtIHRvCj4gYmUgYSBsaXR0bGUgY29uZnVzaW9uIHdpdGggZ2l0aHViIFJlbGVhc2Vz
IGxhZ2dpbmcgYmVoaW5kIHRhZ2dlZAo+IHZlcnNpb25zIG9mIHRoZSBzZGsuIEkndmUgZ29uZSBm
b3IgdGhlIGxhdGVzdCBTREsgdmVyc2lvbiB0byBzdGF5IGFzCj4gY2xvc2VseSBhbGlnbmVkIHRv
IHRoZSByZXN0IG9mIHRoZSBzeXN0ZW0gYXMgSSBjYW4uCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxl
eCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgoKUGF0Y2ggYXBwbGllZCB0byBtYXN0
ZXIsIHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
