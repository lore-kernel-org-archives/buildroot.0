Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98791C7EE30
	for <buildroot@archiver.kernel.org>; Sun, 29 Jun 2025 11:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B9A081F36;
	Sun, 29 Jun 2025 11:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qoTwMQsEwYmt; Sun, 29 Jun 2025 11:23:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CBCF81E2D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CBCF81E2D;
	Sun, 29 Jun 2025 11:23:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0718D1C5
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 11:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E18B340A35
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 11:23:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zeo5mTk457qU for <buildroot@buildroot.org>;
 Sun, 29 Jun 2025 11:23:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DAD4D40A32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAD4D40A32
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DAD4D40A32
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 11:23:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 48BF319F73B;
 Sun, 29 Jun 2025 13:23:36 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 29 Jun 2025 13:23:36 +0200
MIME-Version: 1.0
Date: Sun, 29 Jun 2025 13:23:36 +0200
To: Bram Oosterhuis <dev@bybram.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250619102712.619955-1-dev@bybram.com>
References: <20250619102712.619955-1-dev@bybram.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <115cd383498b733ed5a9213ad87c07d0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751196217;
 bh=p2SPBIJfTjk2hhbzfeNnB6ftPEXfahJscKN0aUJhg64=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ptr1LX/z0E3NiMmVOI6gY92rBYFE2Pq7oir+Ng1mIhaDQpah2z4KHoMjHvHXUi9f4
 LzJb50hylVOtAR1F84JRmWu8z+2yYgoUcdbI5tIgW081LY2beJAozvjigEFe2vi9bf
 OlHpCJEErBe74umT9cXcHY0wXffcnd6WpNxY5mudw5YYPg3r0YsoIQBJJFPe5L43Tz
 b2zaHsDqZUVPtD2QMW2vRButoPnj9ekqXfIPLSwjDe3JcmvxDV84NUChdDZIMlQhvU
 1yV53hW+75xpSPAG7b20cjwytA66ZUGwSU8OvIh7fbOOT+hFmfYsMg93AhtAgY86IW
 72b+nwZKgebpg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ptr1LX/z
Subject: Re: [Buildroot] [PATCH 1/1] package/libgcrypt: bump to v1.11.1
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTkvMDYvMjAyNSAxMjoyNywgQnJhbSBPb3N0ZXJodWlzIHdyb3RlOgo+IFRoaXMgZml4ZXMg
ImVycm9yOiDigJhhc23igJkgb3BlcmFuZCBoYXMgaW1wb3NzaWJsZSBjb25zdHJhaW50cyBvciB0
aGVyZSAKPiBhcmUgbm90IGVub3VnaCByZWdpc3RlcnMiIGlmIGJ1aWxkIGZvciBhcm1oZiB3aXRo
IEdDQzE0Lgo+IAo+IERldGFpbHM6IGh0dHBzOi8vZGV2LmdudXBnLm9yZy9UNzIyNgo+IFNpZ25l
ZC1vZmYtYnk6IEJyYW0gT29zdGVyaHVpcyA8ZGV2QGJ5YnJhbS5jb20+CgpBcHBsaWVkIHRvIG1h
c3RlciwgdGhhbmtzLgoKRm9yIGluZm8sIEkgcmV3b3JkZWQgdGhlIGNvbW1pdCBsb2cgdG8gYWRk
IGEgbGluayB0byB0aGUgcmVsZWFzZSBub3RlLAphbmQgYSBjb25maWcgdG8gcmVwcm9kdWNlIHRo
ZSBpc3N1ZS4gU2VlOgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3Qv
LS9jb21taXQvODljYTFiZDRmNDg5ZmY2NzM4ZjdjMzE3ZGM2ZDljZmRiZjM2MmJjNwoKQmVzdCBy
ZWdhcmRzLAoKSnVsaWVuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
