Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42FFC87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 09:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7D4541BE8;
	Wed,  6 Aug 2025 09:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ui8H7j67JOTV; Wed,  6 Aug 2025 09:08:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D86E14122C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D86E14122C;
	Wed,  6 Aug 2025 09:08:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D249F31
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 09:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B93C2610E8
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 09:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xO24s7XGBPTo for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 09:08:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B361560DEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B361560DEC
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B361560DEC
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 09:08:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FB0543350;
 Wed,  6 Aug 2025 09:08:37 +0000 (UTC)
Date: Wed, 6 Aug 2025 11:08:36 +0200
To: Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, =?UTF-8?B?SGVydsOp?= Codina
 <herve.codina@bootlin.com>, Nicolas Carrier
 <nicolas.carrier@nav-timing.safrangroup.com>
Message-ID: <20250806110836.387c867c@windsurf>
In-Reply-To: <20250806-php-dbus-v1-1-78cbe7d1797f@bootlin.com>
References: <20250806-php-dbus-v1-1-78cbe7d1797f@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudejieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveelfedvgeduvedvleekkeegvdejhfetgefhieetvdevkeeufeekffeihfevuddunecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgur
 hhoohhtrdhorhhgpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhhitgholhgrshdrtggrrhhrihgvrhesnhgrvhdqthhimhhinhhgrdhsrghfrhgrnhhgrhhouhhprdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1754471317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LBRfk2ehKOTcfskSU4LRbnDbcJ3EwUu+UItRbt/RMsw=;
 b=UqVcd71CSsPqtUoEVgOXFMmfKk8h3AMVAMsBBk+KfcjSu18WJCw5oh/fXKLTUtsPopM+d/
 jV4/8xbJcwYxVG5AyBTjlrw2++qoHgD8JS/V7DWM4pHWjRwV/o75CADBzkRr9De48hde1Q
 sk2yn/DUwmLiJozJngbuYKWtASdO4jhRZtpSLRjOaQAVg2BYoYBJtuMVihB/kRUDzldXOI
 3Qu7CXrvF3Qql+H3kWg6ccLHiDDsKpjoSkn4cDNMXU7R/xhHgYlNuaIa8cip9A5d2ytbPJ
 HzB5XIXpRCYKuLglg7u2+G2QN4vo0DveoCqma8eKljbs9j+fVu3B9q+tOYlEPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UqVcd71C
Subject: Re: [Buildroot] [PATCH] package/php-pecl-dbus: fix build with PHP8
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

SGVsbG8gQWxleGlzLAoKT24gV2VkLCAwNiBBdWcgMjAyNSAxMDo1MzowNyArMDIwMApBbGV4aXMg
TG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gVGhlIHBocC1w
ZWNsLWRidXMgZW5jb3V0ZXJzIHR3byBidWlsZCBpc3N1ZXMgaW4gYnVpbGRyb290IDIwMjUuMDIu
eCwKPiBib3RoIHJlbGF0ZWQgdG8gUEhQOC4gQnJpbmcgdGhlIHJlbGV2YW50IHBhdGNoZXMgdG8g
Zml4IHRoaXMgYnVpbGQuCgpBcmUgdGhlIGlzc3VlcyBhZmZlY3RpbmcgbWFzdGVyIGFzIHdlbGw/
CgpJcyB0aGUgaXNzdWUKaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2U5
OC9lOTg5MmJiZWZhNzgxYjQwM2ZkM2Q4MzRiNmM0ODUyN2M4ZTA3OGJhL2J1aWxkLWVuZC5sb2cK
cGVyaGFwcyA/IElmIHNvLCBwbGVhc2UgYWRkIGEgcmVmZXJlbmNlIHRvIHRoZSBhdXRvYnVpbGRl
ciBmYWlsdXJlLgoKRm9yIGJ1Zy9idWlsZCBmaXhlcywgd2UgbGlrZSB0byB1bmRlcnN0YW5kIHNp
bmNlIHdoZW4gdGhlIHByb2JsZW0gaXMKb2NjdXJyaW5nLCBpLmUgd2hpY2ggY29tbWl0IGludHJv
ZHVjZWQgdGhlIHJlZ3Jlc3Npb24uIElmIHRoaXMgcGFja2FnZQp3YXMgYnVpbGRpbmcgb24gMjAy
NC4wMiBhbmQgbm8gbG9uZ2VyIG9uIDIwMjUuMDIsIEkgc3VzcGVjdCBpdCdzIG9uZSBvZgp0aGUg
UEhQIHZlcnNpb24gYnVtcCBiZXR3ZWVuIHRob3NlIHR3byByZWxlYXNlczoKCmJlZmQ5MGI3NjU1
ODA0YWEzMGVhZTQ5NGZhZTY2NDBmZjE3ODIxN2MgcGFja2FnZS9waHA6IHNlY3VyaXR5IGJ1bXAg
dmVyc2lvbiB0byA4LjMuMTkKMzJkZDkyZDE4ZWRiM2Q4M2ZmNDY1ZTM2NmZmMjExZjc0MTc2NzIy
MiBwYWNrYWdlL3BocDogYnVtcCB2ZXJzaW9uIHRvIDguMy4xNwoyNmEzMjhmOGVmMTc4ZGFiNzQ2
YjZjZDc2NjE0MDY2MWE1ZWU0YzVkIHBhY2thZ2UvcGhwOiBidW1wIHZlcnNpb24gdG8gOC4zLjE2
CjNhMjBkZmI0MjY3ZjNkYzZiMTFhMzk5M2E2YTZkY2MzZTVjMmVkODggcGFja2FnZS9waHA6IGJh
Y2twb3J0IHVwc3RyZWFtIHBhdGNoIHRvIGZpeC93b3JrYXJvdW5kIHh4aGFzaCBpc3N1ZQpiY2Fm
ZmEwYTA0YWYyNzhkMTU0ZTZlMDhiODFhMDZhNDBhMWIzZWU5IHBhY2thZ2UvcGhwOiBidW1wIHZl
cnNpb24gdG8gOC4zLjE1CmUyZjQ0YjUwNjAyZTUxYTNkMjc5ZGJhYTQ2NTA5MzUzN2EzMTM2Mzgg
cGFja2FnZS9waHA6IGZpeCAnZGVhY3RpdmF0ZScgdHlwbwo2ZDgxZTMyMjU2NzJkMTQ2MjQ4ZWQz
ZTM2YmE5ZWMzMzc2OGQyZDI3IE1lcmdlIGJyYW5jaCAnbmV4dCcKOTZkNzNiMzA5MTcwMTY1MTM3
M2M1YjY2NTllNDM3ZTc0NDVhMDYyYiBwYWNrYWdlL3BocDogc2VjdXJpdHkgYnVtcCB2ZXJzaW9u
IHRvIDguMy4xNApiMDc2MGQ0NDg1Yzk4NmNiZGRkNWRlNzNiNzkyMmRkNzIwYzhkM2ViIHBhY2th
Z2UvcGhwOiBidW1wIHZlcnNpb24gdG8gOC4zLjEzCmEyZGE4ODUxOWZjMWY5NmU1MTcxNzFkZmIw
NTNhY2E4YzAwZjdkYWYgcGFja2FnZS9waHA6IHNlY3VyaXR5IGJ1bXAgdmVyc2lvbiB0byA4LjMu
MTIKODMzMWZiMDU5MjViMzNmYmZmMWIwODM2NzQ3MDY1MmUzMTk5NmIzOSBwYWNrYWdlL3BocDog
YnVtcCB2ZXJzaW9uIHRvIDguMy4xMQo0ZjAyNDM1NjdkNzQzMjMwODJlNTNjNDZlNzc3YjMyNjQ3
NmY1YzJkIHBhY2thZ2UvcGhwOiBmaXggYnVpbGQgb24gYXJtCmVhMzAxZWY4MGM4MTA3OTFhNmI2
NzNkNDZiNGYxNmI2YzJmNjJhMjkgcGFja2FnZS9waHA6IGJ1bXAgdmVyc2lvbiB0byA4LjMuMTAK
Njc3YzNmMjk5NWI0ZTZhY2FlZGNlY2M2OTliNWY2ZGRmMjk0ZjUyNCBwYWNrYWdlL3BocDogYnVt
cCB2ZXJzaW9uIHRvIDguMy45CmVjZjA2MGEyZmY5MzYyNmZiNWZiZTFjNTJiOGQ0MmI2ZWUwZmJi
NWIgcGFja2FnZS9waHA6IHNlY3VyaXR5IGJ1bXAgdmVyc2lvbiB0byA4LjMuOAo5MzJiNTJmYWQ4
N2Q3OWQ5ZjI2YTM0M2VkYWZlMjk4MTA3OWRlMTZlIHBhY2thZ2UvcGhwOiBidW1wIHZlcnNpb24g
dG8gOC4zLjcKYjViOTI3ODgxZGFmMzAyM2FkMzhiNGU5MTBhYjc5YWQwODFmN2VlNCBwYWNrYWdl
L3BocDogc2VjdXJpdHkgYnVtcCB2ZXJzaW9uIHRvIDguMy42CjcwMDMxZGQ3ZmEwOTE5MTU2NmYy
ZDFlODk1Mzk5YWU1NzhjNjJkMWIgcGFja2FnZS9waHA6IGZpeCBidWlsZCB3aXRob3V0IHRocmVh
ZHMKZTUwNDYwZjlmMTJhOGM1ZjgyZjIxNjY3MzNhZmU5Y2NhM2M4Y2QxOSBwYWNrYWdlL3BocDog
YnVtcCB2ZXJzaW9uIHRvIDguMy40CjI4MjRhYThhMjNhNzY1YjY2MDIxOWMxMjlkNDk4MGYxYjdj
NzY5MWMgcGFja2FnZS9waHA6IGFkZCBsaWJ1Y29udGV4dCBvcHRpb25hbCBkZXBlbmRlbmN5CgpN
b3N0IGxpa2VseToKCmU1MDQ2MGY5ZjEyYThjNWY4MmYyMTY2NzMzYWZlOWNjYTNjOGNkMTkgcGFj
a2FnZS9waHA6IGJ1bXAgdmVyc2lvbiB0byA4LjMuNAoKV2hpY2ggaXMgYSBidW1wIGZyb20gOC4y
LnggdG8gOC4zLnguIFRoZSBvdGhlciBidW1wcyBhcmUgd2l0aGluIHRoZQo4LjMueCBicmFuY2gs
IHNvIEkgZG91YnQgdGhleSBicm9rZSBBUElzIHRoZXJlLgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0
YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJu
ZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
