Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D93C83F17
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 22:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4998960DF8;
	Mon, 28 Jul 2025 22:23:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qrxMv3fgSsgy; Mon, 28 Jul 2025 22:23:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F45160DD1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F45160DD1;
	Mon, 28 Jul 2025 22:23:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A88BFDA
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A7008133E
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:23:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lf5wcxU9AqDK for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 22:23:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A66E18133A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A66E18133A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A66E18133A
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:23:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id DB393780333;
 Tue, 29 Jul 2025 00:23:02 +0200 (CEST)
Received: from [192.214.236.6:38968] via [192.214.236.6] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 29 Jul 2025 00:23:02 +0200
MIME-Version: 1.0
Date: Tue, 29 Jul 2025 00:23:02 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Julien Olivain via buildroot <buildroot@buildroot.org>, =?UTF-8?Q?Vin?=
 =?UTF-8?Q?cent_Stehl=C3=A9?= <vincent.stehle@laposte.net>, =?UTF-8?Q?V?=
 =?UTF-8?Q?incent_Stehl=C3=A9?= <vincent.stehle@arm.com>
In-Reply-To: <20250728224955.01eab38a@windsurf>
References: <20250725223613.1401870-1-ju.o@free.fr>
 <20250728224955.01eab38a@windsurf>
User-Agent: Webmail Free/1.6.11
Message-ID: <3cc187a567f8456dc3cace5dcdd27127@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753741386;
 bh=f1lwj8sy3zdL/fqfNvFoXiblttgHE5HehjeFrqulST8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=p05rk6DL+5GhNCj6hVM1JAbSTGfAs0pdUqX/fBJGPnMcwtM5TnTnDpPHsdCL1N3Ql
 +fuwM4hRXVGHzfMyd+32gxUBas6ypUVKgl+f9maqLiQ+XdIuPDM14jnGs4Zo0Ydc3O
 Re+fqV2dL49nNVmwd18auNJb7Ou90lm1iMOXEI9ohbo+dnwSRNrldMHdei/bGy0ebO
 73QjGudmTLa+UnWsAWN/1XAt4pN6GZ2uguCWQwJThNvh8QyZ7b9X01yeNQ6E8fJKxs
 RfP0dS2UvwsqP7aGvgdM3SVMjQMSot2NehCSgelCyhoSL2EKUyBa/8I14L4IUpGCr1
 20CCpqJ156o2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=p05rk6DL
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_xen: rename
 TestXen to TestXenAarch64
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

T24gMjgvMDcvMjAyNSAyMjo0OSwgVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IHdyb3Rl
Ogo+IE9uIFNhdCwgMjYgSnVsIDIwMjUgMDA6MzY6MTMgKzAyMDAKPiBKdWxpZW4gT2xpdmFpbiB2
aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4gCj4+IENvbW1p
dCBbMV0gaW50cm9kdWNlZCBhbiBBcm12NyB0ZXN0IGNhc2UgZm9yIFhlbiBuYW1lZCBUZXN0WGVu
QXJtdjcsCj4+IG5leHQgdG8gdGhlIG9yaWdpbmFsIEFhcmNoNjQgdGVzdCBjYXNlIHdoaWNoIHdh
cyBzaW1wbHkgbmFtZWQgVGVzdFhlbi4KPj4gCj4+IFRoZSB0ZXN0IGxpc3Qgc2hvd3MsIGZvciBl
eGFtcGxlIHdpdGggdGhlIGNvbW1hbmQKPj4gInN1cHBvcnQvdGVzdGluZy9ydW4tdGVzdHMgLWwi
Ogo+PiAKPj4gICAgIHRlc3RzLnBhY2thZ2UudGVzdF94ZW4uVGVzdFhlbgo+PiAgICAgdGVzdHMu
cGFja2FnZS50ZXN0X3hlbi5UZXN0WGVuQXJtdjcKPj4gCj4+IEluIG9yZGVyIHRvIG1ha2UgdGhp
cyB0ZXN0IGxpc3QgYSBiaXQgbW9yZSBleHBsaWNpdCwgdGhpcyBjb21taXQKPj4gcmVuYW1lcyB0
aGUgVGVzdFhlbiB0byBUZXN0WGVuQWFyY2g2NC4gV2l0aCB0aGF0IGNoYW5nZSwgdGhlIGxpc3QK
Pj4gYmVjb21lczoKPj4gCj4+ICAgICB0ZXN0cy5wYWNrYWdlLnRlc3RfeGVuLlRlc3RYZW5BYXJj
aDY0Cj4+ICAgICB0ZXN0cy5wYWNrYWdlLnRlc3RfeGVuLlRlc3RYZW5Bcm12Nwo+PiAKPj4gWzFd
IAo+PiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQv
NTM0NjgyNGE4MzQ4OGY4NDAwMDhlYjI0Zjg0ODY2NDM1YWMzMmExMgo+PiAKPj4gQ2M6IFZpbmNl
bnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSnVs
aWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPiAKPiBMb29rcyBnb29kOgo+IAo+IFJldmlld2Vk
LWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgoKQXBw
bGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCj4gVGhhbmtzIQo+IAo+IFRob21hcwo+IC0tCj4gVGhv
bWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4
IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNv
bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
