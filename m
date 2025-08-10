Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D15C87FCF
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 11:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C4A640DB7;
	Sun, 10 Aug 2025 11:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fl5_pxf0Sa-P; Sun, 10 Aug 2025 11:15:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 654B440DAC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 654B440DAC;
	Sun, 10 Aug 2025 11:15:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A22B154
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 11:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BDED40848
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 11:15:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uh6azFu5rc3t for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 11:15:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 022D5400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 022D5400B5
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 022D5400B5
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 11:15:09 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 912725805EA
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 10:49:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF7B944284;
 Sun, 10 Aug 2025 10:49:05 +0000 (UTC)
Date: Sun, 10 Aug 2025 12:49:04 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 buildroot@buildroot.org, =?UTF-8?B?TWlxdcOobA==?= Raynal
 <miquel.raynal@bootlin.com>, Wade Berrier <wberrier@gmail.com>, Florian
 Weimer <fweimer@redhat.com>
Message-ID: <20250810124904.2d77ac82@windsurf>
In-Reply-To: <bb6b38a0-ef8b-4e52-8934-7813994da85e@smile.fr>
References: <20250802-fix_ngrep-v1-1-03dbe4c6b0ce@bootlin.com>
 <bb6b38a0-ef8b-4e52-8934-7813994da85e@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdelfeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdujeejtdfhleeludelffelgfeltdegtdfgudfhudduvdeiieevieejvdektdfhnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesshhmihhlvgdrfhhrpdhrtghpthhtohepthhhohhmrghsrdgsohhnnhgvfhhilhhlvgessghoo
 hhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopeifsggvrhhrihgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehffigvihhmvghrsehrvgguhhgrthdrtghomh
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1754822946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JJNFlsIL4Jf2w0y7iIX5XAElDrvR9APX9q0qnMeSiT4=;
 b=n9YNpL0ZpxVrUDLJlFYA/MJKwmke4p6BMXUWohTYim5AZEhM6Z2GduzhJgsvGDGt+32YYt
 h81EwEIOcPWNrkhl+XrBWEGBVFa5MX9dML+t6u2cY6irdF7241aYMqEsBQHXCNFdbgAifQ
 g4hWBBBdlBHp78H/HUxkuMwyigWc7wDv0B1M8UZdF0YFEtlkqWaWHeb7+qc/+4yVf5OeoV
 6XYVcph6MVwOxGV46VGZmu+L402hIgBYV5TdumNMHT6FLRu0F2711M0e0JmZXiQymqH1Sp
 ZnZo+bmzMIRcL9qub1tM1Hu0hM2y4ZM34GxlVBGkIBp7fLEBwcLa7AWzZL7KSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=n9YNpL0Z
Subject: Re: [Buildroot] [PATCH] package/ngrep: fix implicit function
 declaration
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

SGVsbG8gUm9tYWluLAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LCBidXQgc29tZXRoaW5nIGlzIG5v
dCBjbGVhci4gU2VlIGJlbG93LgoKT24gU2F0LCA5IEF1ZyAyMDI1IDIzOjUyOjU1ICswMjAwClJv
bWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPiB3cm90ZToKCj4gSGVsbG8gVGhvbWFz
LCBBbGwsCj4gCj4gTGUgMDIvMDgvMjAyNSDDoCAxMzozNywgVGhvbWFzIEJvbm5lZmlsbGUgdmlh
IGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+ID4gRml4ZXM6IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxk
cm9vdC5vcmcvcmVzdWx0cy8yMGIvMjBiOTI0YzVjOTZiM2Y0M2UzODFkODdlNTlmYjE2MGJhOGQz
ZGNkMC8vICAKPiAKPiBQbGVhc2UsIGNhbiB5b3UgcHJvdmlkZSB5b3VyIGFuYWx5c2lzIG9uIHRo
aXMgaXNzdWU/Cj4gCj4gRnJvbSB0aGUgcGF0Y2gsIEkgdW5kZXJzdGFuZCB0aGF0IGl0J3MgYW4g
ZXJyb3IgZ2VuZXJhdGVkIGJ5IGdjYy0xNCAoYW4gbmV3ZXIpLgo+IEJ1dCBuZ3JlcCBwYWNrYWdl
IGZhaWwgdG8gYnVpbGQgb25seSB3aGVuIEJSMl9QQUNLQUdFX0xJQk5FVCBpcyBzZWxlY3RlZC4K
ClNvIHlvdSBhc2sgZm9yIG1vcmUgZGV0YWlscyAod2hpY2ggd291bGQgZW5jb3VyYWdlIHRoZSBz
dWJtaXR0ZXIgdG8Kc2VuZCBhIG5ldyB2ZXJzaW9uIG9mIHRoZSBwYXRjaCkuLi4KCj4gSSB1cGRh
dGVkIHRoZSBjb21taXQgbG9nIHdpdGggYSBkZWZjb25maWcgYW5kIHRoZSBtaW5pbWFsIGdjYyB2
ZXJzaW9uIHRvCj4gcmVwcm9kdWNlIHRoZSBpc3N1ZS4KCi4uLiBidXQgeW91IHNheSB5b3UgaGF2
ZSBhbHJlYWR5IHVwZGF0ZWQgdGhlIGNvbW1pdCBsb2cgd2l0aCBtb3JlCmRldGFpbHMuIFNvPyBE
aWQgeW91IGFscmVhZHkgYXBwbHkgdGhlIHBhdGNoIGFuZCBzZW5kaW5nIGEgbmV3Cml0ZXJhdGlv
biBpcyBub3QgbmVlZGVkLCBvcj8KClRoYW5rcyEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9u
aSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
