Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA98CC5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 21:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DF8782024;
	Sat, 31 May 2025 21:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gATLP0pQFoMr; Sat, 31 May 2025 21:51:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD95582AC6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD95582AC6;
	Sat, 31 May 2025 21:51:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C1D8235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 21:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D3D6400B5
 for <buildroot@buildroot.org>; Sat, 31 May 2025 21:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKwLNY9Pkg83 for <buildroot@buildroot.org>;
 Sat, 31 May 2025 21:51:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1D9644003A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D9644003A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D9644003A
 for <buildroot@buildroot.org>; Sat, 31 May 2025 21:51:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id A31F72003A4;
 Sat, 31 May 2025 23:51:12 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 31 May 2025 23:51:12 +0200
MIME-Version: 1.0
Date: Sat, 31 May 2025 23:51:12 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Ricardo Martincoski
 <ricardo.martincoski@datacom.com.br>
In-Reply-To: <20250303161557.571619-7-alex.bennee@linaro.org>
References: <20250303161557.571619-1-alex.bennee@linaro.org>
 <20250303161557.571619-7-alex.bennee@linaro.org>
User-Agent: Webmail Free/1.6.10
Message-ID: <718a3907f383c7d17b956ee261071dae@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748728275;
 bh=0IvyPPyrHUHCbIxtCgmadf/CCBOo/6PMvdPSWkKYq4w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=izeULo210x5TLi56h0kqB5tuoKQJeF4XJmsQddoiknEsMkZeIB1zTxz34LjDBZb9W
 gIdJhP13LVbuGlTKlRoxRtG/5nyJaOtngOO/o/etdPSHo1s+tjwXIcqpAJ6lUCeJTg
 E0fcgq/U00v8iVz7rv+pu5xCxdsuleAcIbHrqcEGG8ayHoDHjv5EtWD692PKfcxjM+
 pF7Z0tkaDJR1zI5982zoB8W41/LtUga1+WQp1IQPmhRSzYdr/Bxu8xnU1lZpJHE0Fc
 owr49BklT5XHCg0eTe48O/isZyf8kt2IzZvrNgqTEBTgLwCaZdVp/k7Kvx+aebbisd
 8o3HXN0RSqFIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=izeULo21
Subject: Re: [Buildroot] [PATCH v4 6/6] support/testing: add test for vkmark
 package
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

SGkgQWxleCwKCk9uIDAzLzAzLzIwMjUgMTc6MTUsIEFsZXggQmVubsOpZSB3cm90ZToKPiBUbyB0
ZXN0IHZrbWFyayB3ZSBuZWVkIGEgaGVhZGxlc3MgV2VzdG9uIGNvbXBvc2l0b3Igc28gd2UgY2Fu
IHJ1biB0aGUKPiB0ZXN0IHdpdGhvdXQgbWVzc2luZyBhcm91bmQgd2l0aCBhY3R1YWwgZGlzcGxh
eXMuCgpUaGlzIHRlc3QgY292ZXJzIGEgYml0IG1vcmUgdGhhbiB0aGUgdmttYXJrIHBhY2thZ2Uu
IEl0IGFsc28gdGVzdCBNZXNhM0QKVnVsa2FuIFZpcnRpbywgd2hpY2ggYnJpbmdzIG5ldyByZXF1
aXJlbWVudHMgb24gdGhlIGhvc3QtcWVtdSAodG8gaGF2ZQp0aGUgc3VmZmljaWVudCB2ZXJzaW9u
IGFuZCBidWlsZCBvcHRpb25zKSBhbmQgYWxzbyBvbiB0aGUgaG9zdCBpdHNlbGYKKHRvIGhhdmUg
YSB2YWxpZCB2dWxrYW4gaW1wbGVtZW50YXRpb24pLgoKVGhlIEJ1aWxkcm9vdCB0ZXN0IHN1aXRl
IGN1cnJlbnRseSBydW5zIGluIHRoZSBEb2NrZXIgcmVmZXJlbmNlIGltYWdlLAp3aGljaCBpbmNs
dWRlIGFuICJvbGQiIHFlbXUgNy4yLjE1LiBTcGVjaWZpYyBydW50aW1lIHRlc3RzIGNhbiByZXF1
ZXN0CmEgYnVpbGQgb2YgaG9zdC1xZW11LCB3aGljaCBpcyBjdXJyZW50bHkgdmVyc2lvbiAxMC4w
IGJ1dCB3aWxsIGxhY2sKdGhlIHZpcmdscmVuZGVyZXIgc3VwcG9ydC4gU2VlOgpodHRwczovL2dp
dGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9ibG9iLzIwMjUuMDUtcmMyL3BhY2th
Z2UvcWVtdS9xZW11Lm1rI0w0NjUKCkZpbmFsbHksIGlmIHRoZXJlIGlzIG5vIGFjdHVhbCBWdWxr
YW4tY2FwYWJsZSBHUFUgaGFyZHdhcmUgb24gdGhlIGhvc3QsCml0IHNob3VsZCB0aGVuIHVzZSBh
IGhvc3QtbWVzYTNkIHZ1bGthbiBsbHZtcGlwZS4gVGhpcyB3b3VsZCBwcm9iYWJseQpiZSBhIGNv
bnNpZGVyYWJsZSByZXdvcmsgKG9mIGhvc3QtcWVtdSByZWNpcGUsIG9yIHJlZmVyZW5jZSBkb2Nr
ZXIgCmltYWdlKS4KCklmIG1lcmdlZCBhcyBpcywgdGhpcyB0ZXN0IHdpbGwgYWx3YXlzIGZhaWwg
aW4gdGhlIEJ1aWxkcm9vdCBHaXRsYWIgQ0k6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qu
b3JnL2J1aWxkcm9vdC8tL2pvYnMKCkNvdWxkIHRoaXMgdGVzdCBiZSBzaW1wbGlmaWVkIHRvIHJ1
biB2a21hcmsgd2l0aCBNZXNhM0QgVnVsa2FuIGxsdm1waXBlPwoKSXQgd2lsbCBubyBsb25nZXIg
dGVzdCB0aGUgVnVsa2FuIFZpcnRpbyBHUFUgcGF0aCwgYnV0IGF0IGxlYXN0CnRoZSB2a21hcmsg
cmVjaXBlIHdpbGwgYmUgdGVzdGVkLgoKV2hhdCBkbyB5b3UgdGhpbms/CgpCZXN0IHJlZ2FyZHMs
CgpKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
