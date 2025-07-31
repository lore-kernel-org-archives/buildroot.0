Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1DDC87FCC
	for <buildroot@archiver.kernel.org>; Thu, 31 Jul 2025 12:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEA4F84648;
	Thu, 31 Jul 2025 12:49:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cX4yIYF5Yeia; Thu, 31 Jul 2025 12:49:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85A5884641
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85A5884641;
	Thu, 31 Jul 2025 12:49:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DCB3160
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 12:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50005610F7
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 12:49:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tjiYsc-v6Opj for <buildroot@buildroot.org>;
 Thu, 31 Jul 2025 12:49:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 41AFC61467
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41AFC61467
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41AFC61467
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 12:48:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8FC6A4329B;
 Thu, 31 Jul 2025 12:48:55 +0000 (UTC)
Date: Thu, 31 Jul 2025 14:48:52 +0200
To: Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>
Cc: <tim.hammer@nav-timing.safrangroup.com>,
 <nicolas.carrier@nav-timing.safrangroup.com>, <buildroot@buildroot.org>
Message-ID: <20250731144852.25bb9e9e@windsurf>
In-Reply-To: <DBQ8SCGP37TS.2V8HRWA7RWPTW@bootlin.com>
References: <20250730-openscap-v1-0-46e4a32e26da@bootlin.com>
 <20250730-openscap-v1-3-46e4a32e26da@bootlin.com>
 <20250730190231.51e0715e@windsurf>
 <DBQ8SCGP37TS.2V8HRWA7RWPTW@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutddtkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptedthfehjeegffevteeuteetheekkeevudeuleegfedvkedvueetudduudekgeevnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhimhdrhhgrmhhmvghrsehnrghvqdhtihhmi
 hhnghdrshgrfhhrrghnghhrohhuphdrtghomhdprhgtphhtthhopehnihgtohhlrghsrdgtrghrrhhivghrsehnrghvqdhtihhmihhnghdrshgrfhhrrghnghhrohhuphdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753966136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3VZDSaHVJNzPtzqUijk13yIqVWsQm9hWye3eurC9SgM=;
 b=mJm9wuReu+QodZuPa+hQEGyZTMCi/xzzKo/RMyIXzw2MB8I+areGEC2CtbvYr2TJsC5rY0
 f80wMAigD8FPXmCvP3soP5COtNqTPLg3zjmf1iL3P7mjwV8JQmKgOq8yDokCys07WpoD3W
 xAor9auJQ1e9OvVQAli6wie7Znoosk6jMOImFKZ0NLNBImgCIF9nqlLX3iXewA6DlquizL
 eU0mLsqXwoYp7fxfFyZeMtAOiXuISAi6ghx1Fy3Xx3Da0rrfNUpOetf0nPCDksQel9Ikoo
 tI0nXYJoD0yGuhvIbS/o6PAvacjYV1s0phXuBccBM4u0eg1V1qpPHL1VcJfMHg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mJm9wuRe
Subject: Re: [Buildroot] [PATCH 3/4] package/openscap: add openscap package
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

T24gVGh1LCAzMSBKdWwgMjAyNSAxNDozNDowMSArMDIwMApBbGV4aXMgTG90aG9yw6kgPGFsZXhp
cy5sb3Rob3JlQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gaXQgbG9va3MgbGlrZSBnY3J5cHQvbnNz
IGlzIG5vdCBtYW5kYXRvcnkuIEJ1dCBpZiBJIHRyeSB0byBjb25maWd1cmUgYW5kCj4gcnVuIGEg
YnVpbGQgaW4gYW4gZW52aXJvbm1lbnQgd2l0aG91dCBsaWJnY3J5cHQsIEkgZ290IHNhbWUgbGF0
ZSBsaW5rYWdlCj4gZXJyb3IsIGFib3V0IHNvbWUgbWlzc2luZyBjcmFwaV9pbml0IChubywgSSBh
bSBub3QgbWFraW5nIHRoaXMgZnVuY3Rpb24ncwo+IG5hbWUgdXAuLi4pIGJlaW5nIG1pc3Npbmcu
IEl0IGFwcGVhcnMgdGhhdCB0aGVyZSBhcmUgY29kZSBwYXRocwo+IHByZXByb2Nlc3NlZCBjb25k
aXRpb25uYWx5IG9uIGVpdGhlciBsaWJnY3J5cHQgb3IgbnNzIHByZXNlbmNlLCB3aXRob3V0IGFu
eQo+IGZhbGxiYWNrIGlmIG5vbmUgaXMgZm91bmQuIEkgYW0gbm90IHN1cmUgaWYgSSBhbSBmYWNp
bmcgc29tZSBvcHRpb25hbAo+IGRlcGVuZGVuY2llcyB0aGF0IGFyZSBub3QgIm9wdGlvbmFsIGVu
b3VnaCIgaW4gdGhlIGNvZGUgYmFzZSwgb3Igc29tZSBoYXJkCj4gZHBlbmRlbmNpZXMgdGhhdCBh
cmUgbm90IHN1ZmZpY2llbnRseSBlbmZvcmNlZCBpbiB0aGUgY21ha2UgZmlsZXMuIEJ1dCBpbgo+
IHRoZSBwcm9qZWN0IGN1cnJlbnQgc3RhdGUsIHRoZSBzb2Z0d2FyZSBkb2VzIG5vdCBidWlsZCB3
aXRob3V0IGxpYmdjcnlwdC4KPiAKPiBJZiBJIHRha2UgYSBmdXJ0aGVyIGxvb2sgYXQgdGhlIGRl
diBkb2MKPiAoaHR0cHM6Ly9naXRodWIuY29tL09wZW5TQ0FQL29wZW5zY2FwL2Jsb2IvbWFpbi9k
b2NzL2RldmVsb3Blci9kZXZlbG9wZXIuYWRvYyksCj4gaXQgc2VlbXMgdG8gaGludCB0aGF0IGxp
YmdjcnlwdCBpcyBhY3R1YWxseSBuZWVkZWQgaW4gYW55IGNhc2UuCgpUaGF0J3MgZmluZSwgd2Ug
ZG9uJ3QgZXhwZWN0IHlvdSB0byBmaXggYWxsIHVwc3RyZWFtIGlzc3VlcyA6KQoKSG93ZXZlciwg
bXkgY29uY2VybiB3YXMgbm90IHNvIG11Y2ggYWJvdXQgZ2NyeXB0IGJlaW5nIG5lZWRlZCwgYnV0
IHRoZQpmYWN0IHRoYXQgeW91IG5lZWQgb3BlbnNzbCAqYW5kKiBsaWJnY3J5cHQuIEFyZSBib3Ro
IHRydWx5IG5lZWRlZD8KCj4gSSdsbCByZW1vdmUgdGhlIFdJVEhfQ1JZUFRPPWdjcnlwdCB0aG91
Z2gsIGFzIGl0IGlzIHRoZSBkZWZhdWx0IHZhbHVlIGluCj4gQ01ha2VMaXN0cy50eHQuCgpXZWxs
LCB5b3UgY2FuIGtlZXAgaXQgZXhwbGljaXQsIEkgdGhpbmsgaXQncyBhIGdvb2QgaWRlYS4KCj4g
Cj4gPiAtIFlvdSdyZSBzZXR0aW5nIEVOQUJMRV9QWVRIT04zPU9OLCBidXQgeW91ciB0YXJnZXQg
cGFja2FnZSBkb2VzIG5vdAo+ID4gICBkZXBlbmQgb24gaG9zdC1weXRob24zIG5vciBweXRob24z
IGluIHRlcm1zIG9mIGJ1aWxkIGRlcGVuZGVuY3kuCj4gPiAgIENvdWxkIHlvdSBjbGFyaWZ5IHdo
YXQgdGhpcyBFTkFCTEVfUFlUSE9OMyBvcHRpb24gZG9lcz8gIAo+IAo+IFRoYXQncyBhbiBvbWlz
c2lvbiBvbiBteSBzaWRlLiBUaGlzIEVOQUJMRV9QWVRIT04zIGFsbG93cyBidWlsZGluZyBzb21l
Cj4gYmluZGluZ3MgKHRvIHdyaXRlIHNvbWUgcHl0aG9uIGF1dG9tYXRpb24gdG9vbHMgYmFzZWQg
b24gb3BlbnNjYXAgPykgaWYgdGhlCj4gaW50ZXJwcmV0ZXIgaXMgZm91bmQuIEknbGwgcmVtb3Zl
IGl0LgoKVGhlbiBFTkFCTEVfUFlUSE9OMz1PRkYgaXMgcHJvYmFibHkgYmV0dGVyLiBHZW5lcmFs
bHkgc3BlYWtpbmcgdGhlIG1vcmUKb3B0aW9ucyBhcmUgZXhwbGljaXRseSBzZXQsIHRoZSBiZXR0
ZXIuCgoKPiA+IE5vIGV4cGxpY2l0IG9wdGlvbiB0byBlbmFibGUvZGlzYWJsZSBBQ0wgc3VwcG9y
dD8gIAo+IAo+IFVuZm9ydHVuYXRlbHkgbm8sIHRoaXMgaXMgc2VhcmNoZWQgdW5jb25kaXRpb25h
bGx5OgoKT0shCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8s
IEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5p
bmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
