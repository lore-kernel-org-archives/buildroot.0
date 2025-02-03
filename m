Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67687C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 22:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2837B605CF;
	Mon,  3 Feb 2025 22:24:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1Uf73ncqqmM; Mon,  3 Feb 2025 22:24:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4227260A50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4227260A50;
	Mon,  3 Feb 2025 22:24:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B0DF12A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3004880AA8
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Rl-UPFoLJl5 for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 22:24:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F233280A46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F233280A46
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F233280A46
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:24:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06BB044364;
 Mon,  3 Feb 2025 22:24:22 +0000 (UTC)
Date: Mon, 3 Feb 2025 23:24:22 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Kory Maincent via buildroot <buildroot@buildroot.org>
Cc: Kory Maincent <kory.maincent@bootlin.com>, Marcin Niestroj
 <m.niestroj@grinn-global.com>
Message-ID: <20250203232422.170fe7b6@windsurf>
In-Reply-To: <20250117155030.3238710-1-kory.maincent@bootlin.com>
References: <20250117155030.3238710-1-kory.maincent@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeektdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehudetueefkeeiveeigeeugeeigfdvveehgffguddtieeuvddtgfelvdegveelieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepudelgedrjeekrddvuddurddvvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudelgedrjeekrddvuddurddvvddtpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhdrnhhivghsthhrohhjsehgrhhinhhnqdhglhhosggrlhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738621463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uvIj+ryLow/BgyZX5FE3ixSCOAJDolD7Ua3tsxMkBjA=;
 b=BYQgdv2SDh19p9HlPKEBqclMIwZWflMjToW2bJkGeFLU2i6YtwAnp5PMyAD8G3vIHPdtsk
 syMgjm2/Sz6bQY7Ai0aMFwoSyQ4aKD8Y8UOSNjQ8Q085cL8QY35oicmIDyIZGk6+ncEIzx
 EZUCN1AkQVu5VDhwcM7YQdAc1ivEaqmf81HxL8uhJYeW/pwkQLmzgGDmS6HCHTUnWKrNmC
 Yq4Oo4d/Tij6k3+5p6qrwXZmEemW44JGJ1KacjJ5oYql13AAp9vIUUlG9j6ctxB/ruK2DE
 senmx9V3I82Dj6v39VOT7WhXVNKOCMsg0qk8Pj5lqFKSo5nqftJuIl9L5WpbOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BYQgdv2S
Subject: Re: [Buildroot] [PATCH] package/murata-cyw-fw: Bump to last revision
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gS8O2cnksCgpPbiBGcmksIDE3IEphbiAyMDI1IDE1OjUwOjMwICswMDAwCktvcnkgTWFp
bmNlbnQgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgoKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9tdXJhdGEtY3l3LWZ3L0NvbmZpZy5pbiBiL3BhY2thZ2UvbXVy
YXRhLWN5dy1mdy9Db25maWcuaW4KPiBpbmRleCA3NTMwNDc3NTExLi44YTI3OTVlODA2IDEwMDY0
NAo+IC0tLSBhL3BhY2thZ2UvbXVyYXRhLWN5dy1mdy9Db25maWcuaW4KPiArKysgYi9wYWNrYWdl
L211cmF0YS1jeXctZncvQ29uZmlnLmluCj4gQEAgLTI1LDIwICsyNSw5IEBAIGNvbmZpZyBCUjJf
UEFDS0FHRV9NVVJBVEFfQ1lXX0ZXX0NZVzQzMzYyCj4gIAkgIE11cmF0YSBXaXJlbGVzcyBDWVc0
MzM2MiAoU044MDAwKSBtb2R1bGUgZmlybXdhcmUgZmlsZXMuCj4gIAo+ICBjb25maWcgQlIyX1BB
Q0tBR0VfTVVSQVRBX0NZV19GV19DWVc0MzM5Cj4gLQlib29sICJDWVc0MzM5ICgxQ0svWlApIgo+
ICsJYm9vbCAiQ1lXNDMzOSAoWlApIgo+ICAJaGVscAo+IC0JICBNdXJhdGEgV2lyZWxlc3MgQ1lX
NDMzOSAoMUNLL1pQKSBtb2R1bGUgZmlybXdhcmUgZmlsZXMuCj4gLQo+IC1jaG9pY2UKPiAtCXBy
b21wdCAiQ1lXNDMzOSBtb2R1bGUiIGlmIEJSMl9QQUNLQUdFX01VUkFUQV9DWVdfRldfQ1lXNDMz
OQo+IC0KPiAtY29uZmlnIEJSMl9QQUNLQUdFX01VUkFUQV9DWVdfRldfQ1lXNDMzOV8xQ0sKPiAt
CWJvb2wgIjFDSyIKPiAtCj4gLWNvbmZpZyBCUjJfUEFDS0FHRV9NVVJBVEFfQ1lXX0ZXX0NZVzQz
MzlfWlAKPiAtCWJvb2wgIlpQIgoKWW91J3JlIGRyb3BwaW5nIHNvbWUgb3B0aW9ucyBoZXJlLCBz
byB3ZSBzaG91bGQgY29uc2lkZXIgYmFja3dhcmQKY29tcGF0aWJpbGl0eS4gRG9lcyB0aGlzIG5l
ZWQgQ29uZmlnLmluLmxlZ2FjeSBoYW5kbGluZz8gV2h5IGFyZSB0aG9zZQpvcHRpb25zIHJlbW92
ZWQ/IChOb3QgZXhwbGFpbmVkIGluIHRoZSBjb21taXQgbWVzc2FnZSkKCgo+ICBNVVJBVEFfQ1lX
X0ZXX0ZJTEVTXyQoQlIyX1BBQ0tBR0VfTVVSQVRBX0NZV19GV19DWVc0MzAxMikgKz0gXAo+IC0J
YnJjbWZtYWM0MzAxMi1zZGlvLmJpbiBcCj4gLQlicmNtZm1hYzQzMDEyLXNkaW8uMUxWLmNsbV9i
bG9iIFwKPiAtCWJyY21mbWFjNDMwMTItc2Rpby4xTFYudHh0IFwKPiAtCUNZVzQzMDEyQzAuMUxW
LmhjZAo+ICsJY3lmbWFjNDMwMTItc2Rpby5iaW4gXAo+ICsJY3lmbWFjNDMwMTItc2Rpby4xTFYu
Y2xtX2Jsb2IgXAo+ICsJY3lmbWFjNDMwMTItc2Rpby4xTFYudHh0IFwKPiArCUJDTTQzMDEyQzBf
MDAzLjAwMS4wMTUuMDMwMy4wMjY3LjFMVi5zQW50LmhjZAoKQnV0IGFsbCB0aG9zZSBmaXJtd2Fy
ZSBmaWxlcyB0aGF0IGhhdmUgY2hhbmdlZCBuYW1lLi4uIGhvdyBkb2VzIHRoYXQKd29yayB3aXRo
IHRoZSBrZXJuZWwgbG9hZGluZyB0aG9zZSBmaXJtd2FyZSBmaWxlcz8gVGhlIGZpcm13YXJlIGZp
bGUKbmFtZSBpcyBvZnRlbiBoYXJkY29kZWQgaW4gdGhlIGRyaXZlciwgbm8/IFNvIGlzIHRoZXJl
IHNvbWUgdmVyc2lvbgpkZXBlbmRlbmN5IHJlbGF0aW9uc2hpcCBiZXR3ZWVuIGtlcm5lbCB2ZXJz
aW9uIGFuZCB0aGlzIEZXIHVwZGF0ZT8KClRoYW5rcyBpbiBhZHZhbmNlIGZvciB5b3VyIGZlZWRi
YWNrIQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290
bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0
dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
