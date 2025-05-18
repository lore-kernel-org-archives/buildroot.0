Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D0DC3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0976460D5E;
	Sun, 18 May 2025 14:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zXA4UQ5MKSdY; Sun, 18 May 2025 14:42:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1317C6064D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1317C6064D;
	Sun, 18 May 2025 14:42:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D57CC1BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB5FE81DFB
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:42:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_iDqkHn3VTY for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:42:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CA7A4812F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA7A4812F2
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA7A4812F2
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:42:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E17D51C0FC0; Sun, 18 May 2025 16:42:28 +0200 (CEST)
Message-ID: <0bdc834b-edb1-455e-a293-230618b168db@rnout.be>
Date: Sun, 18 May 2025 16:42:27 +0200
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
 t=1747579349; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6wDwGMRAJAZ4VWlj/DqcyX8NvQnJqiI9Cyip1jcvmGg=;
 b=YFu0j/YgsOFbN7FCMNyi99HaG/JUft+Y+4nfgttSsRTjXYylL1z6/iEVoFxTvgbQ5fZjqG
 7w6QVZ2w0LsoBadX/5bGevu1QM7Kz9zChzoxlrVJGHgYj9AEPnKp2PFli5qTRMWzOKPdr/
 gPjGCLL0vGINjIxXlH+Ee3PU1yxm5AR63728jRahkjXKGKFEdWVnjUWGN5JkBhcfg4wiwg
 j1+vtjOwqplx6ufr2qM9VfLeIuO8G5I/e16QQj2qfDaFVS33ftRLrvwQNvjGC39c7h/PTc
 A71A/2pJBIvWXVF5onDe3SCcC2HdQfJeIwh2enS93exLCHURRbS3T8I5ERSgAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=YFu0j/Yg
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
bGluLmNvbT4KCiAgQXBwbGllZCB0byAyMDI1LjAyLngsIHRoYW5rcy4KCiAgUmVnYXJkcywKICBB
cm5vdXQKCj4gLS0tCj4gICBwYWNrYWdlL211c2VwYWNrLzAwMDYtaW5jb21wYXRpYmxlLXBvaW50
ZXJzLnBhdGNoIHwgNDcgKysrKysrKysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2Vk
LCA0NyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbXVzZXBhY2svMDAw
Ni1pbmNvbXBhdGlibGUtcG9pbnRlcnMucGF0Y2ggYi9wYWNrYWdlL211c2VwYWNrLzAwMDYtaW5j
b21wYXRpYmxlLXBvaW50ZXJzLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwLi43ZmIxYjhmYTIzN2RjMmNk
YzIxYTFjZTBlZTg2MjM0OTIwYjhjOGRiCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2Uv
bXVzZXBhY2svMDAwNi1pbmNvbXBhdGlibGUtcG9pbnRlcnMucGF0Y2gKPiBAQCAtMCwwICsxLDQ3
IEBACj4gK0ZpeGVkIGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGVzCj4gKwo+ICtUaGlzIGlzIGR1
ZSB0byBHQ0MxNCB0aGF0IG5vIGxvbmdlciBhbGxvd3MgaW1wbGljaXRseSBjYXN0aW5nIGFsbCBw
b2ludGVyIHR5cGVzCj4gK3RvIGFsbCBvdGhlciBwb2ludGVyIHR5cGVzLiBSZXN1bHRpbmcgaW4g
ZXJyb3Igc3VjaCBhcyA6Cj4gKwo+ICtvdXRwdXQvYnVpbGQvbXVzZXBhY2stNDc1L2xpYm1wY3Bz
eS9hbnMuYzoyOTE6MTIwOiBlcnJvcjogcGFzc2luZyBhcmd1bWVudCAxMCBvZiDigJhGaW5kT3B0
aW1hbEFOU+KAmSBmcm9tIGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUgWy1XaW5jb21wYXRpYmxl
LXBvaW50ZXItdHlwZXNdCj4gKyAgMjkxIHwgTCwgQU5Tc3BlY19NLCBtLT5OU19PcmRlcl9MLCBt
LT5TTlJfY29tcF9MLCBtLT5GSVJfTCwgc21yLkwsIHNtci5NLCBtLT5TQ0ZfSW5kZXhfTCwgVHJh
bnNpZW50ICk7Cj4gKyAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+Xn5+fn5+fn5+fn5+fgo+ICsgICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwKPiArICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgKgo+ICsKPiArUGF0Y2gg
ZG93bmxvYWRlZCBmcm9tIEdlbnRvbzoKPiAraHR0cHM6Ly9naXR3ZWIuZ2VudG9vLm9yZy9yZXBv
L2dlbnRvby5naXQvdHJlZS9tZWRpYS1zb3VuZC9tdXNlcGFjay10b29scy9maWxlcy9tdXNlcGFj
ay10b29scy00OTUtaW5jb21wYXRpYmxlLXBvaW50ZXJzLnBhdGNoCj4gKwo+ICtTaWduZWQtb2Zm
LWJ5OiBUaG9tYXMgQm9ubmVmaWxsZSA8dGhvbWFzLmJvbm5lZmlsbGVAYm9vdGxpbi5jb20+Cj4g
K1Vwc3RyZWFtOiBOL0Egbm8gU0NNLCBub3QgYWN0aXZlIGFueW1vcmUKPiArCj4gKy0tLSBtdXNl
cGFjay10b29scy00OTUvbGlibXBjcHN5L2Fucy5jCj4gKysrKyBtdXNlcGFjay10b29scy00OTUt
Zml4ZWQvbGlibXBjcHN5L2Fucy5jCj4gK0BAIC0yODcsMTIgKzI4NywxMiBAQAo+ICsgICAgIC8v
IGZvciBMIG9yIE0sIHJlc3BlY3RpdmVseQo+ICsgICAgIG1lbXNldCAoIG0tPkZJUl9MLCAgICAg
IDAsIHNpemVvZiBtLT5GSVJfTCAgICAgICk7ICAgICAgICAgLy8gcmVzZXQgRklSCj4gKyAgICAg
bWVtc2V0ICggbS0+TlNfT3JkZXJfTCwgMCwgc2l6ZW9mIG0tPk5TX09yZGVyX0wgKTsgICAgICAg
ICAvLyByZXNldCBGbGFncwo+ICstCUZpbmRPcHRpbWFsQU5TICggTWF4QmFuZCwgTVNmbGFnLCBB
TlNzcGVjX0wsIEFOU3NwZWNfTSwgbS0+TlNfT3JkZXJfTCwgbS0+U05SX2NvbXBfTCwgbS0+RklS
X0wsIHNtci5MLCBzbXIuTSwgbS0+U0NGX0luZGV4X0wsIFRyYW5zaWVudCApOwo+ICsrCUZpbmRP
cHRpbWFsQU5TICggTWF4QmFuZCwgTVNmbGFnLCBBTlNzcGVjX0wsIEFOU3NwZWNfTSwgbS0+TlNf
T3JkZXJfTCwgbS0+U05SX2NvbXBfTCwgbS0+RklSX0wsIHNtci5MLCBzbXIuTSwgKGNvbnN0IHZv
aWQqKW0tPlNDRl9JbmRleF9MLCBUcmFuc2llbnQgKTsKPiArCj4gKyAgICAgLy8gZm9yIFIgb3Ig
UywgcmVzcGVjdGl2ZWx5Cj4gKyAJbWVtc2V0ICggbS0+RklSX1IsICAgICAgMCwgc2l6ZW9mIG0t
PkZJUl9SICAgICAgKTsgICAgICAgICAvLyByZXNldCBGSVIKPiArIAltZW1zZXQgKCBtLT5OU19P
cmRlcl9SLCAwLCBzaXplb2YgbS0+TlNfT3JkZXJfUiApOyAgICAgICAgIC8vIHJlc2V0IEZsYWdz
Cj4gKy0JRmluZE9wdGltYWxBTlMgKCBNYXhCYW5kLCBNU2ZsYWcsIEFOU3NwZWNfUiwgQU5Tc3Bl
Y19TLCBtLT5OU19PcmRlcl9SLCBtLT5TTlJfY29tcF9SLCBtLT5GSVJfUiwgc21yLlIsIHNtci5T
LCBtLT5TQ0ZfSW5kZXhfUiwgVHJhbnNpZW50ICk7Cj4gKysJRmluZE9wdGltYWxBTlMgKCBNYXhC
YW5kLCBNU2ZsYWcsIEFOU3NwZWNfUiwgQU5Tc3BlY19TLCBtLT5OU19PcmRlcl9SLCBtLT5TTlJf
Y29tcF9SLCBtLT5GSVJfUiwgc21yLlIsIHNtci5TLCAoY29uc3Qgdm9pZCopbS0+U0NGX0luZGV4
X1IsIFRyYW5zaWVudCApOwo+ICsKPiArICAgICByZXR1cm47Cj4gKyB9Cj4gKy0tLSBtdXNlcGFj
ay10b29scy00OTUvbXBjZW5jL21wY2VuYy5oCj4gKysrKyBtdXNlcGFjay10b29scy00OTUtZml4
ZWQvbXBjZW5jL21wY2VuYy5oCj4gK0BAIC0yNDEsOCArMjQxLDggQEAKPiArCj4gKyBmbG9hdCAg
SVNOUl9TY2hhZXR6ZXIgICAgICAgICAgICAgICAgICAoIGNvbnN0IGZsb2F0KiBzYW1wbGVzLCBj
b25zdCBmbG9hdCBjb21wLCBjb25zdCBpbnQgcmVzKTsKPiArIGZsb2F0ICBJU05SX1NjaGFldHpl
cl9UcmFucyAgICAgICAgICAgICggY29uc3QgZmxvYXQqIHNhbXBsZXMsIGNvbnN0IGZsb2F0IGNv
bXAsIGNvbnN0IGludCByZXMpOwo+ICstdm9pZCAgIFF1YW50aXplU3ViYmFuZCAgICAgICAgICAg
ICAgICAgKCB1bnNpZ25lZCBpbnQqIHF1X291dHB1dCwgY29uc3QgZmxvYXQqIGlucHV0LCBjb25z
dCBpbnQgcmVzLCBmbG9hdCogZXJyb3JzLCBjb25zdCBpbnQgbWF4TnNPcmRlciApOwo+ICstdm9p
ZCAgIFF1YW50aXplU3ViYmFuZFdpdGhOb2lzZVNoYXBpbmcgKCB1bnNpZ25lZCBpbnQqIHF1X291
dHB1dCwgY29uc3QgZmxvYXQqIGlucHV0LCBjb25zdCBpbnQgcmVzLCBmbG9hdCogZXJyb3JzLCBj
b25zdCBmbG9hdCogRklSICk7Cj4gKyt2b2lkICAgUXVhbnRpemVTdWJiYW5kICAgICAgICAgICAg
ICAgICAoIG1wY19pbnQxNl90KiBxdV9vdXRwdXQsIGNvbnN0IGZsb2F0KiBpbnB1dCwgY29uc3Qg
aW50IHJlcywgZmxvYXQqIGVycm9ycywgY29uc3QgaW50IG1heE5zT3JkZXIgKTsKPiArK3ZvaWQg
ICBRdWFudGl6ZVN1YmJhbmRXaXRoTm9pc2VTaGFwaW5nICggbXBjX2ludDE2X3QqIHF1X291dHB1
dCwgY29uc3QgZmxvYXQqIGlucHV0LCBjb25zdCBpbnQgcmVzLCBmbG9hdCogZXJyb3JzLCBjb25z
dCBmbG9hdCogRklSICk7Cj4gKwo+ICsgdm9pZCAgIE5vaXNlSW5qZWN0aW9uQ29tcCAoIHZvaWQg
KTsKPiArCj4gCj4gLS0tCj4gYmFzZS1jb21taXQ6IGEzMjBkYmQ5NmQwOGRjNWJjMjg2MTQ5MTVi
YzY2NGY4MWViMGZiYTAKPiBjaGFuZ2UtaWQ6IDIwMjUwMTExLWZpeF9tdXNlcGFjay04ZWY3YWI5
ZmQ1NjQKPiAKPiBCZXN0IHJlZ2FyZHMsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
