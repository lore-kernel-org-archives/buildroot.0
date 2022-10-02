Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54753C433FE
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 09:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2E55826EA;
	Sun,  2 Oct 2022 09:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2E55826EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eaeE9qUkB3r6; Sun,  2 Oct 2022 09:59:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 069AC8261C;
	Sun,  2 Oct 2022 09:59:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 069AC8261C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A09AB1BF27E
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 09:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 899E860B8D
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 09:59:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 899E860B8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j8io7rkfbqJG for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 09:59:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54FF560B12
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 54FF560B12
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 09:59:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9961:1217:61e8:73cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 142D8780344;
 Sun,  2 Oct 2022 11:59:05 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 02 Oct 2022 11:59:04 +0200
Date: Sun, 2 Oct 2022 11:59:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221002095904.GA2517@scaer>
References: <20220928213631.14450-1-fontaine.fabrice@gmail.com>
 <20221001165241.GM30794@scaer>
 <CAPi7W80PoLx4zqankep5Sv7vgB=t71xLg__BnqzpW-wm40WXdw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPi7W80PoLx4zqankep5Sv7vgB=t71xLg__BnqzpW-wm40WXdw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664704748;
 bh=f1/42NwSrmfyL7MBINg5hiqn5YB/ToANCYqvqH5wV1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N8Gpjw82Zoq0KdLuInu4bMaX6kNM+PNfj3gyOZQ70gvHqMHhYcXK2TLn+gdqiGWGN
 Ax/sw/X/4AHTa6KRir8bHfDq2mIjs04w/GEOdaa9P8jV/Oh6d7Z8+VYn50j4e8k3Ep
 Xq6c35zBt8toTCRQVbCi7W5sK5wM26LDAHPrjs7HtGYK9TH+AkwixvGWEqnq3NKr1A
 9k0q6dqjhxt+8rlOzFWK1iUZAEzKfhF4rClrzeYJgYG1a9sA+LIwmO/3AN+qz/CT8i
 zVSSQE1qELyATS2slXShNceBxx9H/4M0jtLwfV0XoaMTZxvULoWYNgcxKtM+VoFwQv
 UMj1zBlQRR71Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=N8Gpjw82
Subject: Re: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to
 version 5.5.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Sergio Prado <sergio.prado@e-labworks.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmFicmljZSwgQWxsLAoKT24gMjAyMi0xMC0wMSAyMzowNiArMDIwMCwgRmFicmljZSBGb250YWlu
ZSBzcGFrZSB0aHVzbHk6Cj4gSGksCj4gTGXCoHNhbS4gMSBvY3QuIDIwMjIgw6DCoDE4OjUyLCBZ
YW5uIEUuIE1PUklOIDwgWzFdeWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IGEgw6ljcml0wqA6Cj4g
Cj4gICBGYWJyaWNlLCBBbGwsCj4gCj4gICBPbiAyMDIyLTA5LTI4IDIzOjM2ICswMjAwLCBGYWJy
aWNlIEZvbnRhaW5lIHNwYWtlIHRodXNseToKPiAgID4gRGVuaWFsIG9mIHNlcnZpY2UgYXR0YWNr
IGFuZCBidWZmZXIgb3ZlcmZsb3cgYWdhaW5zdCBUTFMgMS4zCj4gICA+IHNlcnZlcnMgdXNpbmcg
c2Vzc2lvbiB0aWNrZXQgcmVzdW1wdGlvbi4gV2hlbiBidWlsdCB3aXRoCj4gICA+IC0tZW5hYmxl
LXNlc3Npb24tdGlja2V0IGFuZCBtYWtpbmcgdXNlIG9mIFRMUyAxLjMgc2VydmVyIGNvZGUgaW4K
PiAgID4gd29sZlNTTCwgdGhlcmUgaXMgdGhlIHBvc3NpYmlsaXR5IG9mIGEgbWFsaWNpb3VzIGNs
aWVudCB0byBjcmFmdCBhCj4gICA+IG1hbGZvcm1lZCBzZWNvbmQgQ2xpZW50SGVsbG8gcGFja2V0
IHRoYXQgY2F1c2VzIHRoZSBzZXJ2ZXIgdG8gY3Jhc2guCj4gICA+IFRoaXMgaXNzdWUgaXMgbGlt
aXRlZCB0byB3aGVuIHVzaW5nIGJvdGggLS1lbmFibGUtc2Vzc2lvbi10aWNrZXQgYW5kIFRMUwo+
ICAgPiAxLjMgb24gdGhlIHNlcnZlciBzaWRlLiBVc2VycyB3aXRoIFRMUyAxLjMgc2VydmVycywg
YW5kIGhhdmluZwo+ICAgPiAtLWVuYWJsZS1zZXNzaW9uLXRpY2tldCwgc2hvdWxkIHVwZGF0ZSB0
byB0aGUgbGF0ZXN0IHZlcnNpb24gb2Ygd29sZlNTTC4KPiAKPiAgIEkgc2VlIHRoYXQgd2UgYXJl
IG5vdCBleHBsaWNpdGx5IHVzaW5nIGVpdGhlciAtLWVuYWJsZSBvcgo+ICAgLS1kaXNhYmxlLXNl
c3Npb24tdGlja2V0LCBzbyB3aGF0IGlzIHRoZSBkZWZhdWx0LCBhbmQgd2VyZSB3ZSBpbXBhY3Rl
ZD8KPiAKPiBzZXNzaW9uLXRpY2tldCBpcyBkaXNhYmxlZCBieSBkZWZhdWx0Lgo+IE1vcmVvdmVy
LCBzZXNzaW9uLXRpY2tldCBpcyBlbmFibGVkIGlmIG5naW54LCB3cGFzLCBoYXByb3h5IG9yIGxp
Z2h0eSBpcyBlbmFibGVkIChidXQgYWxsIG9mIHRoZW0gYXJlIGRpc2FibGVkKS4KCkkgYW0gbm90
IHN1cmUgSSBncm9ra2VkIHRoYXQgc2VudGVuY2UuCgo+IFNvLCB3ZSB3ZXJlIG5vdCBpbXBhY3Rl
ZCBleGNlcHQgaWYgdGhlIHVzZXIgaGFzIGV4cGxpY2l0bHkgZW5hYmxlZCB0aGlzIG9wdGlvbiBp
biBpdHMgb3duIHRyZWUuCgpPSy4KCj4gICBBbHNvLCB3ZSBzaG91bGQgaGF2ZSBhbiBleHBsaWNp
dCBzZXR0aW5nIGZvciB0aGF0LCByYXRoZXIgdGhhbiBsZWF2ZSBpdAo+ICAgdG8gY2hhbmNlLgo+
IAo+IFdoeSBub3QsIGJ1dCB3b2xmc3NsIGhhcyBhIHRvbiBvZiBvcHRpb25zLCBzaG91bGQgd2Ug
YWxzbyBleHBsaWNpdGx5IHNldCB0aGVtIHRvIGZhbHNlIGV2ZW4gaWYgdGhleSBhcmUgZGlzYWJs
ZWQgYnkgZGVmYXVsdD8KCkluZGVlZCwgSSBqdXN0IHNhdyBob3cgbWFueSBpb3QgaGFzLCBzbyB3
ZSBjYW4ndCBkZWNlbnRseSBoYXZlIGFsbCBvZgp0aGVtIGV4cGxpY2l0bHkgc3RhdGVkLgoKSSB3
YXMgO29zdGx5IHdvbmRlcmluZyBpZiBhZGRpbmcgYW4gZXhwbGljaXQgLS1kaXNhYmxlLXNlc3Np
b24tdGlja2V0CnRvIHRoZW4gYWRkIGEgX0lHTk9SRV9DVkVTLCB3aGljaCBjb3VsZCBiZSBiYWNr
cG9ydGVkLCByYXRoZXIgdGhhbgpiYWNrcG9ydGluZyB0aGUgdmVyc2lvbiBidW1wLCB0byB0aGUg
c3RhYmxlIGJyYW5jaGVzLiBCdXQgc2luY2UgdGhleSBhbGwKYWxyZWFkeSBoYXZlIDUuNS4wLCBl
dmVuIHRoZSBMVFMsIGJhY2twb3J0aW5nIHRoZSB2ZXJzaW9uIGJ1bXAgaXMKYmV0dGVyIHRoYW4g
YWRkaW5nIGFuIGV4cGxpY2l0IC0tZGlzYWJsZS4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgot
LSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUg
RW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMg
NjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9f
XyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0t
OiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmlu
LmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3Bp
cmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
