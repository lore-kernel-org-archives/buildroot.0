Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B48CA0EE9
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 19:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5144B614DB;
	Sat, 16 Aug 2025 19:47:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ct1BdnwnWJGP; Sat, 16 Aug 2025 19:47:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FE9F614CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FE9F614CB;
	Sat, 16 Aug 2025 19:47:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C4155196
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 19:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B627040E0B
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 19:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFRyZ2RqbRAS for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 19:47:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 56D7340A2A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56D7340A2A
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56D7340A2A
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 19:47:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37C6F442A7;
 Sat, 16 Aug 2025 19:47:19 +0000 (UTC)
Date: Sat, 16 Aug 2025 21:47:18 +0200
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>, Vincent =?UTF-8?B?U3RlaGzDqQ==?=
 <vincent.stehle@laposte.net>
Message-ID: <20250816214718.0e6f3f2d@windsurf>
In-Reply-To: <20250816143431.50398-1-ju.o@free.fr>
References: <20250816143431.50398-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeejjeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueffffetjeehfeejjeelveelvdelteejfeevtedvvedttdeufeelhfeghedvffeinecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpsghuihhlughrohhothdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehjuhdrohesfhhrv
 ggvrdhfrhdprhgtphhtthhopehvihhntggvnhhtrdhsthgvhhhlvgeslhgrphhoshhtvgdrnhgvth
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755373639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8SVuod2E1BdNNn3OCrgs3p4m/Tpen6hcgIpWc5+PHLk=;
 b=NBiFtWtskeNmWLLGXj/OAetYOR/eNYxNcDwXvcahBtYYD6eHakIL8LNpoyjpCozPtlYGKh
 tI4/SAVXmdEZw1NlJJ/6qHxNCuzZmw6n1HF49FeKSS9k/k8mrG/K72PR1RlgAFZ2IlxWDv
 oS1xFrZ/9jRGvcriBzYTDLrqewC+Dk9WUa292bGib3DflcCAHr4TQeebc9uzXkksYVb6gg
 m8cbKp9xdRrX/L1bw/ZSn5EN/IA+is29WBq7/si6NIxH/Ce0tpwvIlgu/y2Muo4uDEoRcZ
 HRr+ix6aRvGF/HyBe8vufC5l9kIu2A8VctAShTBVGE0BQkGJkV3fTKJWFy8rgQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NBiFtWts
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_msr_tools: fix
 test after bootlin toolchains update
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

T24gU2F0LCAxNiBBdWcgMjAyNSAxNjozNDozMSArMDIwMApKdWxpZW4gT2xpdmFpbiB2aWEgYnVp
bGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IFNpbmNlIEJ1aWxkcm9v
dCBjb21taXQgWzFdICJ1cGRhdGUgdG8gQm9vdGxpbiB0b29sY2hhaW5zIDIwMjUuMDgtMSIsCj4g
dGhlIHRlc3RzLnBhY2thZ2UudGVzdF9tc3JfdG9vbHMgZmFpbHMgd2hlbiBidWlsZGluZyBpdHMg
S2VybmVsIDUuMTUuNTUKPiB3aXRoIGdjYyAxNS4xLjAuCj4gCj4gVGhpcyBjb21taXQgZml4ZXMg
dGhlIGlzc3VlIGJ5IHVwZGF0aW5nIHRoZSB0ZXN0IEtlcm5lbCB0byB0aGUgbGF0ZXN0Cj4gTFRT
IHZlcnNpb24gKDYuMTIuNDIgYXQgdGhlIHRpbWUgb2YgdGhpcyBjb21taXQpIHdoaWNoIGluY2x1
ZGVzIHRoZQo+IGZpeCBmb3IgZ2NjLTE1LiBOb3RlOiB0aGUgNS4xNS55IHNlcmllcyBkb2VzIG5v
dCBpbmNsdWRlIHRoaXMgZml4IGZvcgo+IHRoZSB4ODZfNjQgYXJjaGl0ZWN0dXJlLCB3aGljaCBp
cyB3aHkgdGhpcyBjb21taXQgc3dpdGNoZXMgdG8gNi4xMi55Lgo+IAo+IEZpeGVzOgo+IGh0dHBz
Oi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTA5ODQ2ODYyOTQK
PiAKPiBbMV0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29t
bWl0Lzk0N2RiYzkyYTIwYzVhY2VhNzg4MjE2NmNhZTc4OTNlNmVhNjYxZTEKPiAKPiBDYzogVmlu
Y2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBsYXBvc3RlLm5ldD4KPiBTaWduZWQtb2ZmLWJ5
OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgo+IC0tLQo+ICBzdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvcGFja2FnZS90ZXN0X21zcl90b29scy5weSB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtz
LgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGlu
dXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
