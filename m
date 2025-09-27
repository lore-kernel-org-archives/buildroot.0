Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E73CAC5B0
	for <buildroot@archiver.kernel.org>; Sat, 27 Sep 2025 10:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09637422B0;
	Sat, 27 Sep 2025 10:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4qfc9yeaT7Cs; Sat, 27 Sep 2025 10:48:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F41642286
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F41642286;
	Sat, 27 Sep 2025 10:48:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E734198
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 10:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FE7A616BB
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 10:48:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kUitRuT30fPo for <buildroot@buildroot.org>;
 Sat, 27 Sep 2025 10:48:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 58B7B60DC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58B7B60DC2
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58B7B60DC2
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 10:48:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 779CE2003CC;
 Sat, 27 Sep 2025 12:48:03 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 27 Sep 2025 12:48:03 +0200
MIME-Version: 1.0
Date: Sat, 27 Sep 2025 12:48:03 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <ECCE8DCB-304F-40EC-A6BD-1DA56D9FC24A@benettiengineering.com>
References: <f133f133285ba3207a596e83284cf435@free.fr>
 <ECCE8DCB-304F-40EC-A6BD-1DA56D9FC24A@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <222c788c4403fd73eb3a0cb6f75a57f1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758970084;
 bh=VMktSJdH+Bterq03SYez3IJpVkLhI0xT+SaVkFDhZ74=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XiJJLaTgQ2oUI3D8wuNcEAXCndnNEdJH3fi5Y8xMQYJd+wzGG+oeX3R+xcuVAIA8w
 W8T+uwqj0jSmCaKAYFs5JD5coifO9XChyJMyeZj6aiAFHS0km87U0d15nvVRlyg957
 rIYlw2PrRzTS0GVgCjUCg/BfAy9WuVi44UxmoHEFFD6e4Otvwi78NoXwPvS5ISEQ9I
 ckPcAXF3Hgrq1ORCkeaJQbFBsyb54aV3Ar/Et2G0YgeNZE1gcjfUeWfQ4KVeFjL8th
 SHwOLxWi2m28uuPdQM/3MyIO/0Ig5dvJrmtAVLVESJ60eJmRfkVi+KbQ7QRVS2PDzv
 0GwIZCS2p6kUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XiJJLaTg
Subject: Re: [Buildroot] [PATCH] package/libblockdev: security bump to
 version 3.4.0
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

T24gMjcvMDkvMjAyNSAxMjozOCwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4gSGkgSnVsaWVuLAo+
IAo+PiBJbCBnaW9ybm8gMjcgc2V0IDIwMjUsIGFsbGUgb3JlIDExOjA3LCBKdWxpZW4gT2xpdmFp
biA8anUub0BmcmVlLmZyPiAKPj4gaGEgc2NyaXR0bzoKPj4gCj4+IO+7v0hpIEdpdWxpbywKPj4g
Cj4+PiBPbiAyNi8wOS8yMDI1IDIzOjM3LCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPj4+IFJlbGVh
c2Ugbm90ZXM6Cj4+PiBodHRwczovL2dpdGh1Yi5jb20vc3RvcmFnZWQtcHJvamVjdC9saWJibG9j
a2Rldi9ibG9iLzMuNC4wL05FV1MucnN0Cj4+IAo+PiBJcyB0aGlzIHJlYWxseSBhIHNlY3VyaXR5
IGJ1bXAsIGFzIHNhaWQgaW4gdGhlIGNvbW1pdCB0aXRsZT8KPj4gSSBjYW4ndCBmaW5kIGFueSBk
aXJlY3QgcmVmZXJlbmNlIG9mIHNlY3VyaXR5IGZpeCBpbiB0aGlzIHJlbGVhc2UgCj4+IG5vdGUu
Cj4gCj4gUGFyZG9uLCBubyBpdOKAmXMgbm90IGEgc2VjdXJpdHkgYnVtcCwgaXTigJlzIGEgd3Jv
bmcgY29weSBhbmQgcGFzdGUgb2YgCj4gcHJldmlvdXMgcGFja2FnZSBidW1wIGxvZy4KPiBEbyB5
b3Ugd2FudCBtZSB0byByZXNlbmQgdGhlIHBhdGNoIHVwZGF0ZWQ/CgpObyBuZWVkIHRvIHJlc2Vu
ZCwgSSdsbCBmaXggaXQgdXAgd2hpbGUgYXBwbHlpbmcuClRoYW5rcyBmb3IgdGhlIGNvbmZpcm1h
dGlvbi4KCj4gQmVzdCByZWdhcmRzCj4gR2l1bGlvCgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
