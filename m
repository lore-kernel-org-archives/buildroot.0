Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0D4C3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 11:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFD4460A83;
	Mon, 16 Sep 2024 11:56:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytZ0Q_50HH6h; Mon, 16 Sep 2024 11:56:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D512F60A54
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D512F60A54;
	Mon, 16 Sep 2024 11:56:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 528E11BF2B5
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 11:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 407284057F
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 11:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2wYH9rs1uigd for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 11:55:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0D9AD4057B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D9AD4057B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D9AD4057B
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 11:55:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.102.118])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 36EBA2003F7;
 Mon, 16 Sep 2024 13:55:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 Sep 2024 13:55:45 +0200
Date: Mon, 16 Sep 2024 13:55:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Message-ID: <ZugcwQsvg908X8BM@landeda>
References: <20240118124125.996172-1-flavio.tapajos@newtesc.com.br>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240118124125.996172-1-flavio.tapajos@newtesc.com.br>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726487755;
 bh=vuJXU3eWMx98K1pj5RU0p6l07zbXZXDMwE0OxSpJGUo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EL2dNb0v2knrEWzFjwMaV1ILoseR0Y/fbkZzPvBRNPVbR1BV7lrKlcVQBaMJscu4I
 ERsf7y17uNoZU1d6dRF67HjEC8R6cIeb0FKk7sUDxxoRLxW/egBXzFcgF3q2/7y99b
 NRmGcFAJtqfjhgAm1f1mn34wpxFvZIFUZR7UpHiRM+f3mSA+sSI7fDpi3ieI2h/40Q
 0vZrhY5QqkCpur1aJFUyM5rWK52t+CDun0UxbMU7IxMyuDVVKZeq5b3S0sG1nkTYqK
 UdbnHtU/BhptooRORSZkUGoxyYaiJqCvPDhXgP3Ic0TfjB2ioc+e7+svMMGHqS9/q3
 mOPDSc3/Ek1Aw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EL2dNb0v
Subject: Re: [Buildroot] [PATCH 1/1] package/python-libconf: add package to
 target
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmzDoXZpbywgQWxsLAoKT24gMjAyNC0wMS0xOCAwOTo0MSAtMDMwMCwgRmzDoXZpbyBUYXBhasOz
cyBzcGFrZSB0aHVzbHk6Cj4gVGhpcyBwYWNrYWdlIGlzIHNpbWlsYXIgdG8gcHl0aG9uLWxpYmNv
bmZpZywgYnV0IHNpbmNlIGl0IGlzIGF2YWlsYWJsZQo+IGluIHB5cGksIHB5dGhvbiBkZXZlbG9w
ZXJzIHVzdWFsbHkgZmluZCBpdCBtb3JlIGZhbWlsaWFyCj4gCj4gU2lnbmVkLW9mZi1ieTogRmzD
oXZpbyBUYXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5jb20uYnI+CgpBcHBsaWVkIHRv
IG1hc3RlciwgdGhhbmtzLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gLS0tCj4gIHBhY2th
Z2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsKPiAgcGFja2FnZS9weXRo
b24tbGliY29uZi9Db25maWcuaW4gICAgICAgICB8IDcgKysrKysrKwo+ICBwYWNrYWdlL3B5dGhv
bi1saWJjb25mL3B5dGhvbi1saWJjb25mLm1rIHwgMSArCj4gIDMgZmlsZXMgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1saWJjb25m
L0NvbmZpZy5pbgo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2Uv
Q29uZmlnLmluCj4gaW5kZXggNWI4YjE1ZmE1NC4uODM3N2VkNTNlNiAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmluCj4gQEAgLTExNjMsNiAr
MTE2Myw3IEBAIG1lbnUgIkV4dGVybmFsIHB5dGhvbiBtb2R1bGVzIgo+ICAJc291cmNlICJwYWNr
YWdlL3B5dGhvbi1raXdpc29sdmVyL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9weXRo
b24ta21vZC9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWxhcmsvQ29uZmln
LmluIgo+ICsJc291cmNlICJwYWNrYWdlL3B5dGhvbi1saWJjb25mL0NvbmZpZy5pbiIKPiAgCXNv
dXJjZSAicGFja2FnZS9weXRob24tbGliY29uZmlnL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFj
a2FnZS9weXRob24tbGliZXZkZXYvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL3B5dGhv
bi1saWJ1c2IxL0NvbmZpZy5pbiIKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tbGliY29u
Zi9Db25maWcuaW4gYi9wYWNrYWdlL3B5dGhvbi1saWJjb25mL0NvbmZpZy5pbgo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uZjVjZWNlYzhjNgo+IC0tLSAvZGV2L251
bGwKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1saWJjb25mL0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEs
NyBAQAo+ICtjb25maWcgQlIyX1BBQ0tBR0VfUFlUSE9OX0xJQkNPTkYKPiArCWJvb2wgInB5dGhv
bi1saWJjb25mIgo+ICsJaGVscAo+ICsJICBsaWJjb25mIGlzIGEgcHVyZS1QeXRob24gcmVhZGVy
L3dyaXRlciBmb3IgY29uZmlndXJhdGlvbiBmaWxlcwo+ICsJICBpbiBsaWJjb25maWcgZm9ybWF0
LCB3aGljaCBpcyBvZnRlbiB1c2VkIGluIEMvQysrIHByb2plY3RzLgo+ICsKPiArCSAgaHR0cHM6
Ly9naXRodWIuY29tL0NocmlzQWljaGluZ2VyL3B5dGhvbi1saWJjb25mLwo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3B5dGhvbi1saWJjb25mL3B5dGhvbi1saWJjb25mLm1rIGIvcGFja2FnZS9weXRo
b24tbGliY29uZi9weXRob24tbGliY29uZi5tawo+IGluZGV4IGIzNDllM2U2MGUuLjY1YmRlZTg2
MTkgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9weXRob24tbGliY29uZi9weXRob24tbGliY29uZi5t
awo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWxpYmNvbmYvcHl0aG9uLWxpYmNvbmYubWsKPiBAQCAt
MTAsNCArMTAsNSBAQCBQWVRIT05fTElCQ09ORl9TRVRVUF9UWVBFID0gc2V0dXB0b29scwo+ICBQ
WVRIT05fTElCQ09ORl9MSUNFTlNFID0gTUlUCj4gIFBZVEhPTl9MSUJDT05GX0xJQ0VOU0VfRklM
RVMgPSBMSUNFTlNFCj4gIAo+ICskKGV2YWwgJChweXRob24tcGFja2FnZSkpCj4gICQoZXZhbCAk
KGhvc3QtcHl0aG9uLXBhY2thZ2UpKQo+IC0tIAo+IDIuNDMuMAo+IAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlz
dAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4K
fCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9O
IHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVz
aWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYx
IDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAg
VGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAv
IFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0t
LS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
