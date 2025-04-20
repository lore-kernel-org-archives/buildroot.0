Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F338C369C2
	for <buildroot@archiver.kernel.org>; Sun, 20 Apr 2025 17:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FA3580D72;
	Sun, 20 Apr 2025 17:55:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zK2f5BJjtui3; Sun, 20 Apr 2025 17:55:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7A068111C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7A068111C;
	Sun, 20 Apr 2025 17:55:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB91C68
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 17:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D65040655
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 17:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iev6FhD9j9C5 for <buildroot@buildroot.org>;
 Sun, 20 Apr 2025 17:55:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 15F7D40638
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15F7D40638
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15F7D40638
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 17:55:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C28A013F89A;
 Sun, 20 Apr 2025 19:55:27 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Apr 2025 19:55:27 +0200
MIME-Version: 1.0
Date: Sun, 20 Apr 2025 19:55:27 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>
Cc: buildroot@buildroot.org, Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>
In-Reply-To: <20250417124124.1911199-1-gael.portay+rtone@gmail.com>
References: <20250417124124.1911199-1-gael.portay+rtone@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <c0d0cbfed0dde937e2040810a7a1cc03@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745171731;
 bh=3rCf5aPM3nCMWryKqWkwGD2lemxN9pC8m+KZTpWK8Mc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jX1Y0i5bIcMlu4DpIwOTu7yXKCIW2IDtMGpZGlHZje6QGsGACV0iR+evUUtOvONVU
 moe7ykEA611R9Jv55g2DJZu+W8yilecs8s2RnwoCrW6MXbgUKroVtJfZkEypVxfvfl
 EhGdGIbvAQmNhdG9xfni25vRvaGZRwdTyWrQEDj4grpg2afyrDsyCVQA+y+JV9WqUx
 mOQ3wDGGZQNHhna0guxCrnlJkBU2iUN5ojC0JI0IOl+6VYRpmqCjRfXfR38pi9nsNn
 +T0cfZk9tyc4mOtW+Xugmo7575s9J4Txf44b+8bESTZyxNNy1MYQ2ANbBQlk8+s9sy
 S2RAAyUVkHTcQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jX1Y0i5b
Subject: Re: [Buildroot] [PATCH 1/1] package/rpi-firmware: add note to keep
 in sync with kernel
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

T24gMTcvMDQvMjAyNSAxNDo0MSwgR2HDq2wgUE9SVEFZIHdyb3RlOgo+IFRoZSBidW1wIG9mIHBh
Y2thZ2VzIHJwaS1maXJtd2FyZSBhbmQgbGludXggaGF2ZSB0byBieSBzeW5jZWQsIHNpbmNlIAo+
IHRoZQo+IGxpbnV4IHBhY2thZ2UgZG9lcyBub3QgaW5zdGFsbCB5ZXQgaXRzIGRldmljZS10cmVl
IG92ZXJsYXkgYmxvYnMuCj4gCj4gVGhpcyBhZGRzIGEgbm90ZSB0byByZW1pbmQgdG8ga2VlcCBp
biBzeW5jIHRoZSB2ZXJzaW9ucyBvZiBycGktZmlybXdhcmUKPiBwYWNrYWdlIGFuZCBrZXJuZWwg
KHNldCBpbiB0aGUgZGVmY29uZmlncykuCj4gCj4gU2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZ
IDxnYWVsLnBvcnRheStydG9uZUBnbWFpbC5jb20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtz
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
