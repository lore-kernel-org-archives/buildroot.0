Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADB9C83F17
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 15:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6BE640EC5;
	Mon, 28 Jul 2025 15:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2c5kK_MNm4dl; Mon, 28 Jul 2025 15:51:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBE8E40EBD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBE8E40EBD;
	Mon, 28 Jul 2025 15:51:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B0BCD151
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 15:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96A69607DE
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 15:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2I-myshsogPI for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 15:51:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::235;
 helo=relay15.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8E660607AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E660607AD
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E660607AD
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 15:51:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 35E0A4313F;
 Mon, 28 Jul 2025 15:51:27 +0000 (UTC)
Date: Mon, 28 Jul 2025 17:51:25 +0200
To: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
Message-ID: <20250728175125.6f2cb668@windsurf>
In-Reply-To: <20250725-cmake4-v1-1-156f29160913@bootlin.com>
References: <20250725-cmake4-v1-0-156f29160913@bootlin.com>
 <20250725-cmake4-v1-1-156f29160913@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelvdehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeettdfhheejgeffveetueetteehkeekveduueelgeefvdekvdeuteduuddukeegveenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsvghnohhithdrmhhonhhinhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhor
 hhgpdhrtghpthhtohepuggrnhhomhhimhgrnhgthhgvghhouddvfeesghhmrghilhdrtghomhdprhgtphhtthhopeflohgvlhhsohhnvegrrhhlsehgmhgrihhlrdgtohhm
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753717887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wDDfBp09FEq3oExIrH6qnzCn614HukOVKLZIQSClXjA=;
 b=NQC16HDSuFYwdOBl50cP1A0w6I2g0ldxCn4xxWPeA3eflifCBuwL4VzMT6UxNXVPDD7V8Z
 /G3ayNzzeIi4zny6IfqUbpcYsM6VAOm0i5t/7yKIV8E8556sxs+Zr96yuWqx54AaSI1zh5
 MRPYdCt8+cESGj96fdqNcPEcm2OsHHJ0qs3WooRqAOYI/X20Pbml3jTMzdwzW5HprbdmCy
 U7XHsmCZ1NfHkEpRrYbo/0kTyAY1hGLRBg6eymJI0YIxOpTSOki33P/80D41LKPF0TUb7y
 jUQIynSD4GOI57IPF6KyhbpzdBRLVxHBHcH+kALo09LFAyHcX6rp3NpqG24Idw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NQC16HDS
Subject: Re: [Buildroot] [PATCH 1/2] package/cjson: fix cmake 4 compatibility
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQmVub8OudCwKCk9uIEZyaSwgMjUgSnVsIDIwMjUgMTc6MjI6NTAgKzAyMDAKQmVub8Ou
dCBNb25pbiA8YmVub2l0Lm1vbmluQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gQWRkIGEgcGF0Y2gg
Zml4aW5nIGNtYWtlIDQgY29tcGF0aWJpbGl0eSwgZm91bmQgaW4gdXBzdHJlYW0gcHVsbAo+IHJl
cXVlc3QgIzkzNS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCZW5vw650IE1vbmluIDxiZW5vaXQubW9u
aW5AYm9vdGxpbi5jb20+Cj4gLS0tCj4gIC4uLi8wMDAxLW1ha2VfY29tcGF0aWJsZV93aXRoX2Nt
YWtlXzQuMC5wYXRjaCAgICAgIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2Nqc29u
LzAwMDEtbWFrZV9jb21wYXRpYmxlX3dpdGhfY21ha2VfNC4wLnBhdGNoIGIvcGFja2FnZS9janNv
bi8wMDAxLW1ha2VfY29tcGF0aWJsZV93aXRoX2NtYWtlXzQuMC5wYXRjaAo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MC4uZjQ0ZGFlNDU0ODVlOGE5ODY4ZmRlZGZkNTcyOTc4OWMyNjBkMmNmMwo+IC0tLSAvZGV2L251
bGwKPiArKysgYi9wYWNrYWdlL2Nqc29uLzAwMDEtbWFrZV9jb21wYXRpYmxlX3dpdGhfY21ha2Vf
NC4wLnBhdGNoCj4gQEAgLTAsMCArMSwzMyBAQAo+ICtGcm9tIDU4YmM3YzgyM2MyZTM5ZjFhNjI2
ZWM0ZGE4Njk1MmJjNjgxOWJkNmIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IE1h
cmt1cyBWaWV0aCA8bXZpZXRoQHRlY2hmYWsudW5pLWJpZWxlZmVsZC5kZT4KPiArRGF0ZTogU3Vu
LCAzMCBNYXIgMjAyNSAxMToxMjowNyArMDIwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIE1ha2UgY29t
cGF0aWJsZSB3aXRoIENNYWtlIDQuMCBXaGVuIHRyeWluZyB0byBidWlsZCB3aXRoCj4gKyBDTWFr
ZSA0LjAsIHRoZSBmb2xsb3dpbmcgZXJyb3IgaXMgc2hvd246Cj4gKwo+ICtDTWFrZSBFcnJvciBh
dCBDTWFrZUxpc3RzLnR4dDoyIChjbWFrZV9taW5pbXVtX3JlcXVpcmVkKToKPiArICBDb21wYXRp
YmlsaXR5IHdpdGggQ01ha2UgPCAzLjUgaGFzIGJlZW4gcmVtb3ZlZCBmcm9tIENNYWtlLgo+ICsK
PiArICBVcGRhdGUgdGhlIFZFUlNJT04gYXJndW1lbnQgPG1pbj4gdmFsdWUuICBPciwgdXNlIHRo
ZSA8bWluPi4uLjxtYXg+IHN5bnRheAo+ICsgIHRvIHRlbGwgQ01ha2UgdGhhdCB0aGUgcHJvamVj
dCByZXF1aXJlcyBhdCBsZWFzdCA8bWluPiBidXQgaGFzIGJlZW4gdXBkYXRlZAo+ICsgIHRvIHdv
cmsgd2l0aCBwb2xpY2llcyBpbnRyb2R1Y2VkIGJ5IDxtYXg+IG9yIGVhcmxpZXIuCj4gKwo+ICsg
IE9yLCBhZGQgLURDTUFLRV9QT0xJQ1lfVkVSU0lPTl9NSU5JTVVNPTMuNSB0byB0cnkgY29uZmln
dXJpbmcgYW55d2F5Lgo+ICsKPiArVGhpcyBjaGFuZ2UgcmFpc2VzIHRoZSBtaW5pbXVtIHJlcXVp
cmVkIENNYWtlIHZlcnNpb24gdG8gMy41IGFuZCB0aHVzIG1ha2VzIHRoZSBwcm9qZWN0IGNvbXBh
dGlibGUgd2l0aCBDTWFrZSA0LjAKPiArCj4gK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20v
RGF2ZUdhbWJsZS9jSlNPTi9wdWxsLzkzNQoKVGhhbmtzIGZvciB0aGlzIHBhdGNoLiBXZSBoYXZl
IGEgcG9saWN5IGluIEJ1aWxkcm9vdCB0aGF0IGFsbCBwYXRjaGVzCnRoYXQgYXJlIGludGVncmF0
ZWQgaW50byBwYWNrYWdlcyBzaG91bGQgYmUgU2lnbmVkLW9mZi1ieSBieSB3aG9ldmVyCmFkZHMg
dGhlIHBhdGNoIGludG8gQnVpbGRyb290LCBpbiB0aGlzIGNhc2U6IHlvdS4KCkNvdWxkIHlvdSBy
ZXNlbmQgeW91ciBzZXJpZXMgd2l0aCB5b3VyIFNvQiBsaW5lIGFkZGVkIHRvIHRoZSBwYXRjaGVz
CnRoZW1zZWx2ZXM/CgpUaGFua3MgYSBsb3QhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmks
IGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdp
bmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
