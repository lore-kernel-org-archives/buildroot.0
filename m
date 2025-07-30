Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D15CC83F26
	for <buildroot@archiver.kernel.org>; Wed, 30 Jul 2025 19:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B62BD6144C;
	Wed, 30 Jul 2025 19:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ngMRCprSRxim; Wed, 30 Jul 2025 19:29:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9CA261450
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9CA261450;
	Wed, 30 Jul 2025 19:29:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F50E12E
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 19:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA4DC6144B
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 19:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UvfDrF_rWdRS for <buildroot@buildroot.org>;
 Wed, 30 Jul 2025 19:29:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BFD976143D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFD976143D
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BFD976143D
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 19:29:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68E9A44516;
 Wed, 30 Jul 2025 19:29:12 +0000 (UTC)
Date: Wed, 30 Jul 2025 21:29:11 +0200
To: Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>
Cc: <tim.hammer@nav-timing.safrangroup.com>,
 <nicolas.carrier@nav-timing.safrangroup.com>, <buildroot@buildroot.org>
Message-ID: <20250730212911.5ef08183@windsurf>
In-Reply-To: <DBPLAFAMQCJW.9Q3OD0DZX1BS@bootlin.com>
References: <20250730-openscap-v1-0-46e4a32e26da@bootlin.com>
 <20250730-openscap-v1-4-46e4a32e26da@bootlin.com>
 <20250730191834.6bc7f097@windsurf>
 <DBPLAFAMQCJW.9Q3OD0DZX1BS@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelkeejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehudetueefkeeiveeigeeugeeigfdvveehgffguddtieeuvddtgfelvdegveelieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhimhdrhhgrmhhmvghrsehnrghvqdhtihhmihhnghdrshgrfhhrrghnghhro
 hhuphdrtghomhdprhgtphhtthhopehnihgtohhlrghsrdgtrghrrhhivghrsehnrghvqdhtihhmihhnghdrshgrfhhrrghnghhrohhuphdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753903752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oO7EzhnO+29i6XelEOJXmM4QqsrPxV1XGaHye0DRw2c=;
 b=U4/2EDT8kljABMg1dvdDi9pOrOcIF4UbcTRb2CcKN5aE5/QU4uDjMMoRsI4k6rYgjkO48c
 b/aBcVoOzGhGpvc5BqjYyfSbX8pvGBR6I7pXH7ofEr+vzvjJBrYGS7mv92HnhHBWjSSqvK
 y6bUaSohf+ung7mcJm+7KPoe0dWqZxmdZmAs0Mo6EmuUAcHl9XG6oNwW4Om4otbMRy3Ei8
 GWfbpcnVCJg9LVT2tMFkMrd2OHGkvi3xH22z7W5b1LtqoaPoa5jlHoJoDoWQcWGjoEEg26
 rmBd9/piccEtYx2qfDs4TTL+lX1PYNRehsn0Bp4v3Ae4KVSwjre1KiYi6d/S/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U4/2EDT8
Subject: Re: [Buildroot] [PATCH 4/4] package/compliance-as-code: add new
 package
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

SGVsbG8sCgpPbiBXZWQsIDMwIEp1bCAyMDI1IDIwOjA5OjExICswMjAwCkFsZXhpcyBMb3Rob3LD
qSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBUaGFua3MgZm9yIHRoZSBw
b2ludGVyLCBJIHdhcyBub3QgYXdhcmUgb2YgdGhvc2UgaW50ZWdyYXRlZCB0ZXN0cy4gSSdsbAo+
IHRha2UgYSBsb29rIGF0IGl0IGFuZCBhZGQgc29tZSAod2l0aG91dCBrbm93aW5nIHlldCB0aGUg
ZnVsbCBzY29wZSBvZiB0aGlzCj4gZnJhbWV3b3JrLCBJIGd1ZXNzIGl0IHdvdWxkIGJlIG5pY2Ug
dG8gZ2V0IGF0IGxlYXN0IGEgbWF0cml4IG9mIHRlc3RzIG9uCj4gdGhlIGRpZmZlcmVudCBLY29u
ZmlnIG9wdGlvbnMgYWRkZWQgZm9yIHRoaXMgcGFja2FnZSkKCllvdSBkb24ndCBoYXZlIHRvIHRl
c3QgYWxsIHBvc3NpYmxlIGNvbWJpbmF0aW9ucy4gSnVzdCBhIHNpbmdsZSB0ZXN0CnRoYXQgZXhl
cmNpc2VzIGEgYml0IGNvbXBsaWFuY2UtYXMtY29kZSArIG9wZW5zY2FwIHdvdWxkIGJlIG1vcmUg
dGhhbgplbm91Z2guCgo+ID4gSSBhc3N1bWUgeW91IHZlcmlmaWVkIGFsbCB0aG9zZSBob3N0IGRl
cGVuZGVuY2llcyBhcmUgYWN0dWFsbHkgbmVlZGVkPyAgCj4gCj4gWWVzLiBGb3IgYWxsIHRoZSBw
YWNrYWdlcyBhZGRlZCBpbiB0aGlzIHNlcmllcywgSSBzdGFydGVkIGJ5IHBlcmZvcm1pbmcgYQo+
IG5hdGl2ZSBidWlsZCBpbiBhIG1pbmltYWwgY29udGFpbmVyLCB0byBkaXN0aW5ndWlzaCB0aGUg
bWFuZGF0b3J5Cj4gZGVwZW5kZW5jaWVzIGZyb20gdGhlIG9wdGlvbmFsIG9uZXMuIFNvIHRoaXMg
bGlzdCByZWFsbHkgcmVmbGVjdHMgdGhlCj4gbWluaW1hbCBzZXQgb2YgbmVlZGVkIGRlcHMuCgpF
eGNlbGxlbnQhCgo+IEFoLCBnb29kIGNhdGNoICEgSSBhY2NpZGVudGFsbHkgZ290IHJpZCBvZiBh
IGJsb2NrIGhlcmUgd2hlbiByZXdvcmtpbmcgdGhpcwo+IHBhcnQuIFRoYXQgc2hvdWxkIHJhdGhl
ciBiZToKPiAKPiBpZmVxKCQoQlIyX1BBQ0tBR0VfQ09NUExJQU5DRV9BU19DT0RFX0RBVEFTVFJF
QU1fT05MWSkseSkKPiBDT01QTElBTkNFX0FTX0NPREVfTUFLRV9PUFRTID0gLWQKPiBlbmRpZgo+
IAo+IENPTVBMSUFOQ0VfQVNfQ09ERV9NQUtFX09QVFMgKz0gXAo+IAkkKGZvcmVhY2ggcCxcCj4g
CSQoY2FsbCBxc3RyaXAsJChCUjJfUEFDS0FHRV9DT01QTElBTkNFX0FTX0NPREVfUFJPRFVDVFMp
KSxcCj4gCSQoaWYgJChCUjJfUEFDS0FHRV9DT01QTElBTkNFX0FTX0NPREVfREFUQVNUUkVBTV9P
TkxZKSwgZ2VuZXJhdGUtc3NnLSQocCktZHMueG1sLCAkKHApKSkKPiAKPiAoYW5kIHNvLCArPSBp
bnN0ZWFkIG9mID0gd2hlbiBldmFsdWF0aW5nIHRoZSBwcm9kdWN0cyBzdHJpbmcpCgpTb3VuZHMg
Z29vZC4gUGVyaGFwcyB5b3Ugd2FudCB0byBpbmRlbnQgdGhpcyBhIGJpdDoKCkNPTVBMSUFOQ0Vf
QVNfQ09ERV9NQUtFX09QVFMgKz0gXAogCSQoZm9yZWFjaCBwLFwKIAkJJChjYWxsIHFzdHJpcCwk
KEJSMl9QQUNLQUdFX0NPTVBMSUFOQ0VfQVNfQ09ERV9QUk9EVUNUUykpLFwKIAkJJChpZiAkKEJS
Ml9QQUNLQUdFX0NPTVBMSUFOQ0VfQVNfQ09ERV9EQVRBU1RSRUFNX09OTFkpLCBnZW5lcmF0ZS1z
c2ctJChwKS1kcy54bWwsICQocCkpCgkpCgpUaGFua3MhCgpUaG9tYXMKLS0gClRob21hcyBQZXRh
enpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5l
bCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
