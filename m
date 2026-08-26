Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772B4C5DF97
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 20:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33209606BE;
	Wed, 26 Aug 2026 20:33:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v7Fx0ewC_Lm5; Wed, 26 Aug 2026 20:33:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787776421;
	bh=gtZRkl/CBzdefbZeBSAMA4a7wTI9MZOUUZjrrtmvCR8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oehSSRkjxyFU9sQOhg5yqsopkTjgkGj6cl4xU5cPMxzJla9+ljpN1oKMF0/brBVTP
	 EiBIzW8jm9eQa6leojj3AL268O2i28nMN8y3b/SoNPDx/BcZY1BGTtR3qbQDlejFJ6
	 HpN+j08ODH2QNYYZvP6GGHyUch5yoJdaoQE/ObPE4R4D7ZfEGi3c1WpBrIv3sHyuLL
	 KxvgQ8UoZt8W5xdYJ4eXSi8jcvEeTIJ7Ov9jkw4JzW7bQmfl9XVJnMioTPRMmVJrmP
	 P2APfS0DGpMT4YgSsy2t4pATcHv3AEwfXFBtFLQX1ziac/zgJUVgKi7rvNMFh4J/A6
	 8AkRNqIhCS6eg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D17C60642;
	Wed, 26 Aug 2026 20:33:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EE21B3AD
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4269807E6
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SQNkCnSrFGAn for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 20:33:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8CFBC807D8
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:33:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 680745FFBA;
 Wed, 26 Aug 2026 22:33:31 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 26 Aug 2026 22:33:31 +0200
MIME-Version: 1.0
Date: Wed, 26 Aug 2026 22:33:31 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Daniel Price <daniel.price@gmail.com>, Martin
 Bark <martin@barkynet.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260826140414.347415-1-thomas.perale@mind.be>
References: <20260826140414.347415-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.18
Message-ID: <854b44b8e5c176da175ef3a29d1ffbe6@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/nodejs: security bump to v22.23.2
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

T24gMjYvMDgvMjAyNiAxNjowNCwgVGhvbWFzIFBlcmFsZSB2aWEgYnVpbGRyb290IHdyb3RlOgo+
IFNlZSB0aGUgcmVsZWFzZSBub3RlczoKPiAKPiAtIGh0dHBzOi8vZ2l0aHViLmNvbS9ub2RlanMv
bm9kZS9yZWxlYXNlcy90YWcvdjIyLjIzLjIKPiAtIGh0dHBzOi8vZ2l0aHViLmNvbS9ub2RlanMv
bm9kZS9yZWxlYXNlcy90YWcvdjIyLjIzLjEKPiAtIGh0dHBzOi8vZ2l0aHViLmNvbS9ub2RlanMv
bm9kZS9yZWxlYXNlcy90YWcvdjIyLjIyLjEKPiAtIGh0dHBzOi8vZ2l0aHViLmNvbS9ub2RlanMv
bm9kZS9yZWxlYXNlcy90YWcvdjIyLjIyLjIKPiAtIGh0dHBzOi8vZ2l0aHViLmNvbS9ub2RlanMv
bm9kZS9yZWxlYXNlcy90YWcvdjIyLjIyLjMKPiAKPiBJdCBmaXhlcyB0aGUgZm9sbG93aW5nIHZ1
bG5lcmFiaWxpdGllczoKPiAKPiAtIChDVkUtMjAyNi01Njg0NikgaHR0cDI6IHJldGFpbiBoZWFk
ZXIgbWVtb3J5IGluIHNlc3Npb24gYWNjb3VudGluZyAKPiAoTWF0dGVvIENvbGxpbmEpIOKAkyBI
aWdoCj4gLSAoQ1ZFLTIwMjYtNTY4NDgpIGh0dHAyOiBkZWZlciByc3Qgc3RyZWFtIHdoaWxlIGlu
IHNjb3BlIChNYXR0ZW8gCj4gQ29sbGluYSkg4oCTIEhpZ2gKPiAtIChDVkUtMjAyNi01ODA0Mykg
cGVybWlzc2lvbjogYXZvaWQgZ3JhbnRpbmcgcmFkaXggc3BsaXQgbm9kZXMgCj4gKFJhZmFlbEdT
Uykg4oCTIEhpZ2gKPiAtIChDVkUtMjAyNi01Njg1MCkgaHR0cHM6IGRpc3Rpbmd1aXNoIFBGWCBv
YmplY3QtYXJyYXkgYWdlbnQga2V5cyAKPiAoUmFmYWVsR1NTKSDigJMgTWVkaXVtCj4gLSAoQ1ZF
LTIwMjYtNTgwNDApIGh0dHBzOiBiaW5kIGlkZW50aXR5IGNoZWNrcyB0byBzZXNzaW9uIHJldXNl
IChNYXR0ZW8gCj4gQ29sbGluYSkg4oCTIE1lZGl1bQo+IC0gKENWRS0yMDI2LTU4MDQyKSBkbnM6
IGhhbmRsZSBsYXJnZSByZXNvbHZlQW55IGFkZHJlc3MgcmVwbGllcyAKPiAoUmFmYWVsR1NTKSDi
gJMgTWVkaXVtCj4gLSAoQ1ZFLTIwMjYtNTgwNDUpIHpsaWI6IHRocm93IG9uIG91dC1vZi1ib3Vu
ZHMgd3JpdGUgYnVmZmVycyAKPiAoUmFmYWVsR1NTKSDigJMgTWVkaXVtCj4gLSAoQ1ZFLTIwMjYt
NTY4NDcpIHBlcm1pc3Npb246IGVuZm9yY2UgZnMgd3JpdGUgcGVybWlzc2lvbiBmb3IgdHJhY2Ug
Cj4gZXZlbnRzIChSYWZhZWxHU1MpIOKAkyBMb3cKPiAtIChDVkUtMjAyNi01ODAzOSkgcGVybWlz
c2lvbjogY2hlY2sgZmluYWwgcmVwb3J0IG91dHB1dCBwYXRoIAo+IChSYWZhZWxHU1MpIOKAkyBM
b3cKPiAtIChDVkUtMjAyNi01ODA0NCkgaHR0cDogcmVqZWN0IHJlcXVlc3RzIGV4Y2VlZGluZyBt
YXggaGVhZGVyIGNvdW50IAo+IChNYXR0ZW8gQ29sbGluYSkg4oCTIExvdwo+IAo+IFRoZSBMSUNF
TlNFIHdhcyBjaGFuZ2VkIGluIDIyLjIyLjEsIHNlZSBbMV0uCj4gCj4gWzFdIAo+IGh0dHBzOi8v
Z2l0aHViLmNvbS9ub2RlanMvbm9kZS9jb21taXQvOWNhZmVjMDg0ZTQ4NTZlMmYwM2QwNjUyM2Vh
ZWVjMGM4YmEzNTJiMgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXJhbGUgPHRob21hcy5w
ZXJhbGVAbWluZC5iZT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
