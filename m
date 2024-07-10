Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100EAC3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3EB660F12;
	Wed, 10 Jul 2024 21:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ned5VMC4Jn4; Wed, 10 Jul 2024 21:30:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01CBF61026
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01CBF61026;
	Wed, 10 Jul 2024 21:30:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D44721BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C12BB40142
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:30:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NF_EoqbQaVAa for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:30:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4417E40126
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4417E40126
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4417E40126
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:30:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C905B60006;
 Wed, 10 Jul 2024 21:30:16 +0000 (UTC)
Date: Wed, 10 Jul 2024 23:30:14 +0200
To: Gero =?UTF-8?B?U2Nod8Okcmlja2U=?= via buildroot <buildroot@buildroot.org>
Message-ID: <20240710233014.16677ba1@windsurf>
In-Reply-To: <20240620110905.1205820-2-gero.schwaericke@grandcentrix.net>
References: <20240620110905.1205820-1-gero.schwaericke@grandcentrix.net>
 <20240620110905.1205820-2-gero.schwaericke@grandcentrix.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720647017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6L4taQxuu85wwyOjFCoOsnjRwePK/ukzec8ebWsWRG4=;
 b=VrZcq0MsT6W06EXcfP8qV9pWHx5DZDyhIeMZyj2JEuIiZMvQSTbsXQUe/oFJ9Xxn/rOmvZ
 YbjKlR2lQAVQgFRvXpU9xGCWLdzneZLy7UCURk/Io6444C1qhRoalRgU9HtgUau44lP50/
 5DMqoYdkbZHwqD1OKIMhSsArg6GqYWYhcTDfCPuv+dGSJrNM+V7jyH+wQSaG/hWf+czm5W
 ViFh0qKxn1GVQYYlDRr+quiW/zMqTs7RxwCSH3+YSBF4m+3/yk9IvBVvhjFyL8qSqVD+NA
 w9YQcQlJA/hBDTHBbONP0bwk1qA52g5p4Neb43GS8blHASMiAeHwCEvXQDZkgg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VrZcq0Ms
Subject: Re: [Buildroot] [PATCH 1/2] board/ti/am62x-sk: update custom hashes
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Xuanhao Shi <X15000177@gmail.com>,
 Gero =?UTF-8?B?U2Nod8Okcmlja2U=?= <gero.schwaericke@grandcentrix.net>,
 Bryan Brattlof <bb@ti.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAyMCBKdW4gMjAyNCAxMzowODoyMCArMDIwMApHZXJvIFNjaHfDpHJpY2tlIHZpYSBi
dWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKCj4gU2lnbmVkLW9mZi1i
eTogR2VybyBTY2h3w6RyaWNrZSA8Z2Vyby5zY2h3YWVyaWNrZUBncmFuZGNlbnRyaXgubmV0Pgo+
IC0tLQo+ICAuLi4vcGF0Y2hlcy9hcm0tdHJ1c3RlZC1maXJtd2FyZS9hcm0tdHJ1c3RlZC1maXJt
d2FyZS5oYXNoICAgIHwgMiArLQo+ICAuLi4vdGkvYW02Mngtc2svcGF0Y2hlcy90aS1rMy1yNS1s
b2FkZXIvdGktazMtcjUtbG9hZGVyLmhhc2ggIHwgNCArKy0tCj4gIGJvYXJkL3RpL2FtNjJ4LXNr
L3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFzaCAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0KPiAg
MyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpUaGFua3Mg
Zm9yIHlvdXIgdHdvIHBhdGNoZXMuIFRoZXkgYXJlIGJvdGggY29ycmVjdCBpbmRlZWQsIGJ1dCB0
aGUKY29tbWl0IGxvZyBzaG91bGQgaGF2ZSBleHBsYWluZWQgd2hhdCBoYXBwZW5lZC4gU28gaGVy
ZSBpcyB3aGF0IEkgYWRkZWQKKHNvIHRoYXQgeW91IGNhbiBzZWUgdGhlIHNvcnQgb2YgZXhwbGFu
YXRpb24gd2UgZXhwZWN0IHRvIHNlZSBpbiBjb21taXQKbG9ncyk6CgogICAgYm9hcmQvdGkvYW02
Mngtc2s6IHVwZGF0ZSBjdXN0b20gaGFzaGVzCiAgICAKICAgIENvbW1pdAogICAgY2MyOTEwYTdk
YmQzMzFhZTBhZDZhOGYwNmNlN2NkMDU1OWExZWJlMSAoImNvbmZpZ3MvdGlfYW02Mnhfc2tfZGVm
Y29uZmlnOgogICAgdXBkYXRlIFUtQm9vdCB0byB2MjAyNC4wNCIpIHVwZGF0ZWQgVS1Cb290IGFu
ZCB0aGUgdGktazMtcjUtbG9hZGVyIHRvCiAgICAyMDI0LjA0LCBidXQgZGlkIG5vdCB1cGRhdGUg
dGhlIGhhc2ggZmlsZXMgaW4gYm9hcmQvdGkvYW02Mngtc2svLiBJdAogICAgZW5kZWQgdXAgd29y
a2luZyBmb3Igbm93LCBiZWNhdXNlIHRoZSBvZmZpY2lhbCB2ZXJzaW9ucyBvZiBib290L3Vib290
CiAgICBhbmQgYm9vdC90aS1rMy1yNS1sb2FkZXIvIGFsc28gdXNlIDIwMjQuMDQgYW5kIHRoZXJl
Zm9yZSBoYXZlIHRoaXMKICAgIGhhc2gsIGJ1dCBpdCB3b3VsZCBoYXZlIHN0YXJ0ZWQgZmFpbGlu
ZyBhcyBzb29uIGFzIGJvb3QvdWJvb3QgYW5kL29yCiAgICBib290L3RpLWszLXI1LWxvYWRlciBv
ZmZpY2lhbCB2ZXJzaW9uIHdlcmUgdXBkYXRlZC4KICAgIAogICAgU2lnbmVkLW9mZi1ieTogR2Vy
byBTY2h3w6RyaWNrZSA8Z2Vyby5zY2h3YWVyaWNrZUBncmFuZGNlbnRyaXgubmV0PgogICAgU2ln
bmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNv
bT4KCkJvdGggcGF0Y2hlcyBhcHBsaWVkIHdpdGggdGhvc2UgaW1wcm92ZWQgY29tbWl0IG1lc3Nh
Z2VzLiBUaGFua3MgYWdhaW4hCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9v
dGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxp
bi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
