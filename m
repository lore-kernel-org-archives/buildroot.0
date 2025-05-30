Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8923EC5AD49
	for <buildroot@archiver.kernel.org>; Fri, 30 May 2025 20:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DD49607CA;
	Fri, 30 May 2025 20:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFlhn2jou5mz; Fri, 30 May 2025 20:04:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99B2C608C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99B2C608C2;
	Fri, 30 May 2025 20:04:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BA655236
 for <buildroot@buildroot.org>; Fri, 30 May 2025 20:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A002D40D51
 for <buildroot@buildroot.org>; Fri, 30 May 2025 20:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iPxwprkUU7BE for <buildroot@buildroot.org>;
 Fri, 30 May 2025 20:04:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9450840D4C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9450840D4C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9450840D4C
 for <buildroot@buildroot.org>; Fri, 30 May 2025 20:04:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B96F439CF;
 Fri, 30 May 2025 20:04:11 +0000 (UTC)
Date: Fri, 30 May 2025 22:04:09 +0200
To: Vincent =?UTF-8?B?U3RlaGzDqQ==?= via buildroot <buildroot@buildroot.org>
Cc: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@laposte.net>, Julien
 Olivain <ju.o@free.fr>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
Message-ID: <20250530220409.5187b93a@windsurf>
In-Reply-To: <20250523174313.7056-1-vincent.stehle@laposte.net>
References: <20250523174313.7056-1-vincent.stehle@laposte.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleelvdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehudetueefkeeiveeigeeugeeigfdvveehgffguddtieeuvddtgfelvdegveelieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgduieemfeelmeektggujeemvgdutdelmeelvddttgemvdefvdekmeeijedvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudeimeefleemkegtugejmegvuddtleemledvtdgtmedvfedvkeemieejvddvpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehvihhntggvnhhtrdhsthgvhhhlvgeslhgrphhoshhtvgdrn
 hgvthdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopehgihhulhhiohdrsggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748635451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uxy6lOD8y/2lFLYLAcE7XBWLDOFEnQySVmkeZAHWDdA=;
 b=Yw6gKYkGklf2ShZYIIeL7APWyKPRCP2VxR0b8pzIYOCB/5Fqli+7SwUh++Iw7bfHdO+LnZ
 hov4RUvTA5QOhtktSrs+zcZFAk8JnKTNmoAF5Wu4z3wizOjW6/tsv1Kx0stEwC2GknvY7i
 XTwiP53UdTZL55QaIHleIg019YaFx/14WHDHK5tHqHLqXw90zNtsfK6LBLrTnRB+Bd3R4d
 aHOWwy7czBmI/KaUSO4cQrquhr0fImHiipmbYrzDXaNmcJCQja0qnejcxvDk+SINne3zRv
 3dnbDTVMqf3YMbV7iT0hitvkaVKuNuTkp1nE6jtIsAx+bGRwIMmp6Pqfwn0/Iw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Yw6gKYkG
Subject: Re: [Buildroot] [PATCH 0/5] Add support for HPPA (PA-RISC)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVmluY2VudCwKCk9uIEZyaSwgMjMgTWF5IDIwMjUgMTk6NDM6MDggKzAyMDAKVmluY2Vu
dCBTdGVobMOpIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToK
Cj4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBtaW5pbWFsIHN1cHBvcnQgZm9yIGEgIm5ldyIgYXJj
aGl0ZWN0dXJlOiBIUC9QQQo+IChhLmsuYS4gUEEtUklTQyk7IG9uZSBvZiB0aGUgUklTQyBhcmNo
aXRlY3R1cmVzIG9mIHRoZSBsYXRlIDgwaWVzLgo+IAo+IFRoaXMgYXJjaGl0ZWN0dXJlIGlzIHN0
aWxsIHdlbGwgc3VwcG9ydGVkIGJ5IGdjYywgTGludXggYW5kIHNvbWUgb3RoZXIKPiBkaXN0cm9z
OyB0aGVyZWZvcmUgaXQgc2hvdWxkIG5vdCBiZSB0b28gbXVjaCBvZiBhIGJ1cmRlbiB0byBzdXBw
b3J0IGluCj4gQnVpbGRyb290Lgo+IAo+IFdpdGggdGhvc2UgcGF0Y2hlcyB3ZSBoYXZlIGVub3Vn
aCB0byBidWlsZCBhbmQgcnVuIGEgTGludXgga2VybmVsIHdpdGgKPiBidXN5Ym94IG9uIFFlbXUs
IHdoaWNoIG1ha2VzIGl0IGVhc2lseSB0ZXN0YWJsZS4gCj4gCj4gSSBwbGFuIHRvIGFkZCBzdXBw
b3J0IGxhdGVyIG9uIGZvciBydW5uaW5nIG9uIGFjdHVhbCBoYXJkd2FyZTsgdGhlIEhQCj4gOTAw
MCA3MTIgUEEtUklTQyBXb3Jrc3RhdGlvbi4KCkkgaGF2ZSBub3RoaW5nIGFnYWluc3QgSFBQQSwg
YnV0IGlzIHRoaXMgZ29pbmcgdG8gYmUgdXNlZCBpbiBwcmFjdGljZT8KV2UgYWxyZWFkeSBzdXBw
b3J0IHF1aXRlIGEgbG90IG9mICJleG90aWMiIGFyY2hpdGVjdHVyZXMgaW4gQnVpbGRyb290LAph
bmQgdGhleSBhcmUgYSBmYWlybHkgaGVhdnkgbWFpbnRlbmFuY2UgYnVyZGVuLCBkdWUgdG86Cgot
IEFyY2hpdGVjdHVyZSBkZXBlbmRlbmNpZXMgaW4gc2V2ZXJhbCBjb3JlIHBhY2thZ2VzLiBGb3Ig
ZXhhbXBsZSwKICBsaWJmZmksIGxpYmNhcCwgYXJlIHVzZWQgYnkgemlsbGlvbnMgb2YgcGFja2Fn
ZXMgYW5kIHRoZXkgaGF2ZQogIGFyY2hpdGVjdHVyZSBkZXBlbmRlbmNpZXMuCgotIEdDQyBpc3N1
ZXMuIE91ciBhdXRvYnVpbGRlcnMgYXJlIGZsb29kZWQgYnkgR0NDIGlzc3VlcyBhZmZlY3RpbmcK
ICBTdXBlckgsIE1pY3JvYmxhemUgYW5kIG90aGVyIGV4b3RpYyBhcmNoaXRlY3R1cmVzLCBhbmQg
dGhvc2UgaXNzdWVzCiAgYXJlIG5ldmVyIGZpeGVkIGJlY2F1c2Ugbm9ib2R5IGNhcmVzLgoKU28g
d2hpbGUgSSBmaW5kIGl0IG5pY2UgdGhhdCB3ZSBzdXBwb3J0IHNvIG1hbnkgYXJjaGl0ZWN0dXJl
cywgSSB0aGluawp3ZSBzaG91bGQgYWxsIHdvbmRlciB3aGV0aGVyIGl0IG1ha2VzIHNlbnNlIHRv
IHN1cHBvcnQgZXZlbiBtb3JlIGFuZApmb3Igd2hhdCB1c2UtY2FzZS4KClRoYW5rcyBmb3IgeW91
ciBmZWVkYmFjayEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENF
TywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFp
bmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
