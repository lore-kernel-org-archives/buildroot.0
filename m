Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC65C54754
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 17:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76B6261374;
	Fri, 16 May 2025 17:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JYpDv5FkzfOU; Fri, 16 May 2025 17:59:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 872FE612E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 872FE612E9;
	Fri, 16 May 2025 17:59:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F3685185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3E4941742
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lYEIMhVGqaw3 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:59:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0354640853
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0354640853
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0354640853
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 173461C110D; Fri, 16 May 2025 19:59:33 +0200 (CEST)
Message-ID: <2dfdb15b-104b-4206-8f26-d595d22afaf2@rnout.be>
Date: Fri, 16 May 2025 16:48:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>
References: <20250112-fix_musepack-v1-1-bb966b22d9ef@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250112-fix_musepack-v1-1-bb966b22d9ef@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747418373; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=abgaUkAGLpJds1q+7WxAo14Hapthk+e4Gi406ntLRh0=;
 b=GHZ+92ESmMJITfxEkYrPzYyduugNvhWsOFfx+dQtEktpfr8qljATsFGHilziWhF++mK9fh
 6WiwY5wksgx+jgcshn+upTfoR1aosY7LwmE8YesSL0EpnDmcFPbgaQFPRwxuycuE8Ezyxy
 5HR7Inr8Tu8IbjbwiJ9ufqH2jG0GOU1jQ+p/UINwntv1/N0KWRe2rh5lTrfySIqxJXm1Ir
 1Z5hNHNhF8WFFZ4vmgPCAg5CvaitL/GjhIW8UGpmX9ZVCmYBxsHMCXQYFWAfcS/OuImoct
 OSrKcZmkK8kHmo6/ekOJWaMj9Q304QPcmEGHEfWNW7GY/xmL6PocEePMPGUBqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=GHZ+92ES
Subject: Re: [Buildroot] [PATCH] package/musepack: fix incompatible pointer
 types
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMi8wMS8yMDI1IDEwOjIzLCBUaG9tYXMgQm9ubmVmaWxsZSB2aWEgYnVpbGRyb290IHdy
b3RlOgo+IEFzIG9mIEdDQzE0LCBHQ0Mgbm8gbG9uZ2VyIGFsbG93cyBpbXBsaWNpdGx5IGNhc3Rp
bmcgYWxsIHBvaW50ZXIgdHlwZXMKPiB0byBhbGwgb3RoZXIgcG9pbnRlciB0eXBlcy4KPiAKPiBX
ZSBjYW4gZml4IHRoaXMgZXJyb3IsIGJ5IGFkZGluZyB0aGUgYXBwcm9wcmlhdGUgY2FzdC4KPiBU
aGlzIHBhdGNoIGlzIGEgcG9ydCBvZiBhIEdlbnRvbyBwYXRjaC4KPiAKPiBMaW5rOiBodHRwczov
L2dpdHdlYi5nZW50b28ub3JnL3JlcG8vZ2VudG9vLmdpdC90cmVlL21lZGlhLXNvdW5kL211c2Vw
YWNrLXRvb2xzL2ZpbGVzL211c2VwYWNrLXRvb2xzLTQ5NS1pbmNvbXBhdGlibGUtcG9pbnRlcnMu
cGF0Y2gKPiAKPiBGaXhlczoKPiAKPiAgICAgIGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5v
cmcvcmVzdWx0cy82NDEyZmMzN2Q1MzNkZmYyN2YxOGIwOWM2Njg4NzBiZWJmZjJiZWM1Lwo+IAo+
IFNpZ25lZC1vZmYtYnk6IFRob21hcyBCb25uZWZpbGxlIDx0aG9tYXMuYm9ubmVmaWxsZUBib290
bGluLmNvbT4KCiAgQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCiAgUmVnYXJkcywKICBBcm5v
dXQKCj4gLS0tCj4gICBwYWNrYWdlL211c2VwYWNrLzAwMDYtaW5jb21wYXRpYmxlLXBvaW50ZXJz
LnBhdGNoIHwgNDcgKysrKysrKysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA0
NyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbXVzZXBhY2svMDAwNi1p
bmNvbXBhdGlibGUtcG9pbnRlcnMucGF0Y2ggYi9wYWNrYWdlL211c2VwYWNrLzAwMDYtaW5jb21w
YXRpYmxlLXBvaW50ZXJzLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwLi43ZmIxYjhmYTIzN2RjMmNkYzIx
YTFjZTBlZTg2MjM0OTIwYjhjOGRiCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvbXVz
ZXBhY2svMDAwNi1pbmNvbXBhdGlibGUtcG9pbnRlcnMucGF0Y2gKPiBAQCAtMCwwICsxLDQ3IEBA
Cj4gK0ZpeGVkIGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGVzCj4gKwo+ICtUaGlzIGlzIGR1ZSB0
byBHQ0MxNCB0aGF0IG5vIGxvbmdlciBhbGxvd3MgaW1wbGljaXRseSBjYXN0aW5nIGFsbCBwb2lu
dGVyIHR5cGVzCj4gK3RvIGFsbCBvdGhlciBwb2ludGVyIHR5cGVzLiBSZXN1bHRpbmcgaW4gZXJy
b3Igc3VjaCBhcyA6Cj4gKwo+ICtvdXRwdXQvYnVpbGQvbXVzZXBhY2stNDc1L2xpYm1wY3BzeS9h
bnMuYzoyOTE6MTIwOiBlcnJvcjogcGFzc2luZyBhcmd1bWVudCAxMCBvZiDigJhGaW5kT3B0aW1h
bEFOU+KAmSBmcm9tIGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUgWy1XaW5jb21wYXRpYmxlLXBv
aW50ZXItdHlwZXNdCj4gKyAgMjkxIHwgTCwgQU5Tc3BlY19NLCBtLT5OU19PcmRlcl9MLCBtLT5T
TlJfY29tcF9MLCBtLT5GSVJfTCwgc21yLkwsIHNtci5NLCBtLT5TQ0ZfSW5kZXhfTCwgVHJhbnNp
ZW50ICk7Cj4gKyAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+Xn5+fn5+fn5+fn5+fgo+ICsgICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwKPiArICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgKgo+ICsKPiArUGF0Y2ggZG93
bmxvYWRlZCBmcm9tIEdlbnRvbzoKPiAraHR0cHM6Ly9naXR3ZWIuZ2VudG9vLm9yZy9yZXBvL2dl
bnRvby5naXQvdHJlZS9tZWRpYS1zb3VuZC9tdXNlcGFjay10b29scy9maWxlcy9tdXNlcGFjay10
b29scy00OTUtaW5jb21wYXRpYmxlLXBvaW50ZXJzLnBhdGNoCj4gKwo+ICtTaWduZWQtb2ZmLWJ5
OiBUaG9tYXMgQm9ubmVmaWxsZSA8dGhvbWFzLmJvbm5lZmlsbGVAYm9vdGxpbi5jb20+Cj4gK1Vw
c3RyZWFtOiBOL0Egbm8gU0NNLCBub3QgYWN0aXZlIGFueW1vcmUKPiArCj4gKy0tLSBtdXNlcGFj
ay10b29scy00OTUvbGlibXBjcHN5L2Fucy5jCj4gKysrKyBtdXNlcGFjay10b29scy00OTUtZml4
ZWQvbGlibXBjcHN5L2Fucy5jCj4gK0BAIC0yODcsMTIgKzI4NywxMiBAQAo+ICsgICAgIC8vIGZv
ciBMIG9yIE0sIHJlc3BlY3RpdmVseQo+ICsgICAgIG1lbXNldCAoIG0tPkZJUl9MLCAgICAgIDAs
IHNpemVvZiBtLT5GSVJfTCAgICAgICk7ICAgICAgICAgLy8gcmVzZXQgRklSCj4gKyAgICAgbWVt
c2V0ICggbS0+TlNfT3JkZXJfTCwgMCwgc2l6ZW9mIG0tPk5TX09yZGVyX0wgKTsgICAgICAgICAv
LyByZXNldCBGbGFncwo+ICstCUZpbmRPcHRpbWFsQU5TICggTWF4QmFuZCwgTVNmbGFnLCBBTlNz
cGVjX0wsIEFOU3NwZWNfTSwgbS0+TlNfT3JkZXJfTCwgbS0+U05SX2NvbXBfTCwgbS0+RklSX0ws
IHNtci5MLCBzbXIuTSwgbS0+U0NGX0luZGV4X0wsIFRyYW5zaWVudCApOwo+ICsrCUZpbmRPcHRp
bWFsQU5TICggTWF4QmFuZCwgTVNmbGFnLCBBTlNzcGVjX0wsIEFOU3NwZWNfTSwgbS0+TlNfT3Jk
ZXJfTCwgbS0+U05SX2NvbXBfTCwgbS0+RklSX0wsIHNtci5MLCBzbXIuTSwgKGNvbnN0IHZvaWQq
KW0tPlNDRl9JbmRleF9MLCBUcmFuc2llbnQgKTsKPiArCj4gKyAgICAgLy8gZm9yIFIgb3IgUywg
cmVzcGVjdGl2ZWx5Cj4gKyAJbWVtc2V0ICggbS0+RklSX1IsICAgICAgMCwgc2l6ZW9mIG0tPkZJ
Ul9SICAgICAgKTsgICAgICAgICAvLyByZXNldCBGSVIKPiArIAltZW1zZXQgKCBtLT5OU19PcmRl
cl9SLCAwLCBzaXplb2YgbS0+TlNfT3JkZXJfUiApOyAgICAgICAgIC8vIHJlc2V0IEZsYWdzCj4g
Ky0JRmluZE9wdGltYWxBTlMgKCBNYXhCYW5kLCBNU2ZsYWcsIEFOU3NwZWNfUiwgQU5Tc3BlY19T
LCBtLT5OU19PcmRlcl9SLCBtLT5TTlJfY29tcF9SLCBtLT5GSVJfUiwgc21yLlIsIHNtci5TLCBt
LT5TQ0ZfSW5kZXhfUiwgVHJhbnNpZW50ICk7Cj4gKysJRmluZE9wdGltYWxBTlMgKCBNYXhCYW5k
LCBNU2ZsYWcsIEFOU3NwZWNfUiwgQU5Tc3BlY19TLCBtLT5OU19PcmRlcl9SLCBtLT5TTlJfY29t
cF9SLCBtLT5GSVJfUiwgc21yLlIsIHNtci5TLCAoY29uc3Qgdm9pZCopbS0+U0NGX0luZGV4X1Is
IFRyYW5zaWVudCApOwo+ICsKPiArICAgICByZXR1cm47Cj4gKyB9Cj4gKy0tLSBtdXNlcGFjay10
b29scy00OTUvbXBjZW5jL21wY2VuYy5oCj4gKysrKyBtdXNlcGFjay10b29scy00OTUtZml4ZWQv
bXBjZW5jL21wY2VuYy5oCj4gK0BAIC0yNDEsOCArMjQxLDggQEAKPiArCj4gKyBmbG9hdCAgSVNO
Ul9TY2hhZXR6ZXIgICAgICAgICAgICAgICAgICAoIGNvbnN0IGZsb2F0KiBzYW1wbGVzLCBjb25z
dCBmbG9hdCBjb21wLCBjb25zdCBpbnQgcmVzKTsKPiArIGZsb2F0ICBJU05SX1NjaGFldHplcl9U
cmFucyAgICAgICAgICAgICggY29uc3QgZmxvYXQqIHNhbXBsZXMsIGNvbnN0IGZsb2F0IGNvbXAs
IGNvbnN0IGludCByZXMpOwo+ICstdm9pZCAgIFF1YW50aXplU3ViYmFuZCAgICAgICAgICAgICAg
ICAgKCB1bnNpZ25lZCBpbnQqIHF1X291dHB1dCwgY29uc3QgZmxvYXQqIGlucHV0LCBjb25zdCBp
bnQgcmVzLCBmbG9hdCogZXJyb3JzLCBjb25zdCBpbnQgbWF4TnNPcmRlciApOwo+ICstdm9pZCAg
IFF1YW50aXplU3ViYmFuZFdpdGhOb2lzZVNoYXBpbmcgKCB1bnNpZ25lZCBpbnQqIHF1X291dHB1
dCwgY29uc3QgZmxvYXQqIGlucHV0LCBjb25zdCBpbnQgcmVzLCBmbG9hdCogZXJyb3JzLCBjb25z
dCBmbG9hdCogRklSICk7Cj4gKyt2b2lkICAgUXVhbnRpemVTdWJiYW5kICAgICAgICAgICAgICAg
ICAoIG1wY19pbnQxNl90KiBxdV9vdXRwdXQsIGNvbnN0IGZsb2F0KiBpbnB1dCwgY29uc3QgaW50
IHJlcywgZmxvYXQqIGVycm9ycywgY29uc3QgaW50IG1heE5zT3JkZXIgKTsKPiArK3ZvaWQgICBR
dWFudGl6ZVN1YmJhbmRXaXRoTm9pc2VTaGFwaW5nICggbXBjX2ludDE2X3QqIHF1X291dHB1dCwg
Y29uc3QgZmxvYXQqIGlucHV0LCBjb25zdCBpbnQgcmVzLCBmbG9hdCogZXJyb3JzLCBjb25zdCBm
bG9hdCogRklSICk7Cj4gKwo+ICsgdm9pZCAgIE5vaXNlSW5qZWN0aW9uQ29tcCAoIHZvaWQgKTsK
PiArCj4gCj4gLS0tCj4gYmFzZS1jb21taXQ6IGEzMjBkYmQ5NmQwOGRjNWJjMjg2MTQ5MTViYzY2
NGY4MWViMGZiYTAKPiBjaGFuZ2UtaWQ6IDIwMjUwMTExLWZpeF9tdXNlcGFjay04ZWY3YWI5ZmQ1
NjQKPiAKPiBCZXN0IHJlZ2FyZHMsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
