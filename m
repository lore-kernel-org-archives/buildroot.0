Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76662C3DA49
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 10:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ECC960A50;
	Thu, 25 Jul 2024 10:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1B4Wt1iFJkDV; Thu, 25 Jul 2024 10:06:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E2D36069D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E2D36069D;
	Thu, 25 Jul 2024 10:06:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F0201BF422
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 10:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DB60406C1
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 10:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADm0QvyS_OvW for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 10:06:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 46719408C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46719408C1
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46719408C1
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 10:06:03 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id D137E35211C3; Thu, 25 Jul 2024 12:05:59 +0200 (CEST)
Date: Thu, 25 Jul 2024 12:05:59 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@gmail.com>
Message-ID: <ZqIjh9iw1hgT8D/D@waldemar-brodkorb.de>
References: <20240723212011.23048-1-gael.portay@rtone.fr>
 <20240723212011.23048-2-gael.portay@rtone.fr>
 <20240724182122.6a1f75ee@windsurf>
 <D2YGQXWLNLWG.2S6K4TCJ7EDN6@gmail.com>
 <20240725101027.77f7b4e4@windsurf>
 <D2YITL40TOEJ.98932ZGHH1A9@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D2YITL40TOEJ.98932ZGHH1A9@gmail.com>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1721901960; bh=XGakqSzHn7yXiadgk01Kp98T0WMRnECPQIjdEBjBEu0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZtO43vPZsuglaDaqiMJq4TQ0n1+L7zUR+7IwuTg2bZQcjHjzyEuHsB1qTiHEuoyWU
 HbIQPrKlog8ClYA9dohpFDqD4OxwpDjx+9gjiu8vqGbYpgZoj3mm+V9EjmNr/uNkBY
 4od5gpQ1nVJyj5d0cMQi7bBybOvRxF8x9AJ1xmOyy9pCDZcoYTqdzIdr7J/ViRE/Ym
 SQwFsUWcX0VPL+DoMwLQY6NPKcZpuS3UOryExBAjoY7TeN0+SgZBL15H0/7qNWZXP4
 YIN0/Tn2uYh2Sz5YB31Fha4HpUo5Kw3pAhqUtPE6IsHs2Y1O1Dq638fPH0EBKYCbnH
 2BnMi4qbO6gww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=ZtO43vPZ
Subject: Re: [Buildroot] [PATCH 1/2] package/rpi-utils: new package
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
Cc: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCkdhw6tsIFBPUlRBWSB3cm90ZSwKCj4gVGhvbWFzLAo+IAo+IE9uIFRodSBKdWwgMjUsIDIw
MjQgYXQgMTA6MTAgQU0gQ0VTVCwgVGhvbWFzIFBldGF6em9uaSB3cm90ZToKPiA+IFdlbGwsIHlv
dXIgcGF0Y2ggd2FzIG5vdCBpbmNsdWRpbmcgcGFja2FnZS9ycGktdXRpbHMvQ29uZmlnLmluLCBz
byB0aGUKPiA+IG9wdGlvbiBCUjJfUEFDS0FHRV9SUElfVVRJTFMgZG9lcyBub3QgZXhpc3QuIFBl
cmhhcHMgd2h5IGl0IGdldHMKPiA+IHNraXBwZWQ/Cj4gPgo+IAo+IFNvIHRoZXJlIGlzIGEgYnVp
bGQgaXNzdWUgd2l0aCB0aGUgdWNsaWJjIHRvb2xjaGFpbnMgYmVjYXVzZSBvZgo+IHJlYWxsb2Nh
cnJheSgpLgo+IAo+IAlncG9ydGF5QGFyY2hsaW51eCB+L3NyYy9idWlsZHJvb3QgJCB1dGlscy90
ZXN0LXBrZyAtcCBycGktdXRpbHMKPiAJICAgICAgICAgICAgICAgICAgICBib290bGluLWFybXY1
LXVjbGliYyBbMS82XTogRkFJTEVECj4gCSAgICAgICAgICAgICAgICAgICAgIGJvb3RsaW4tYXJt
djctZ2xpYmMgWzIvNl06IE9LCj4gCSAgICAgICAgICAgICAgICAgICBib290bGluLWFybXY3bS11
Y2xpYmMgWzMvNl06IFNLSVBQRUQKPiAJICAgICAgICAgICAgICAgICAgICAgYm9vdGxpbi14ODYt
NjQtbXVzbCBbNC82XTogT0sKPiAJICAgICAgICAgICAgICAgICAgICAgIGJyLWFybS1mdWxsLXN0
YXRpYyBbNS82XTogU0tJUFBFRAo+IAkgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFybS1h
YXJjaDY0IFs2LzZdOiBPSwo+IAo+IFNlZToKPiAKPiAJL2hvbWUvZ3BvcnRheS9ici10ZXN0LXBr
Zy9ib290bGluLWFybXY1LXVjbGliYy9idWlsZC9ycGktdXRpbHMtYTFkNTIyZjBmMWI1MDg1OGE0
NGZhYzgwNTIzYTJiZDgwMDk4ZTc4OS9waW5jdHJsL3BpbmN0cmwuYzogSW4gZnVuY3Rpb24g4oCY
ZG9fZ3Bpb19wb2xsX2FkZOKAmToKPiAJL2hvbWUvZ3BvcnRheS9ici10ZXN0LXBrZy9ib290bGlu
LWFybXY1LXVjbGliYy9idWlsZC9ycGktdXRpbHMtYTFkNTIyZjBmMWI1MDg1OGE0NGZhYzgwNTIz
YTJiZDgwMDk4ZTc4OS9waW5jdHJsL3BpbmN0cmwuYzoyNjg6MTg6IGVycm9yOiBpbXBsaWNpdCBk
ZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhyZWFsbG9jYXJyYXnigJkgWy1XZXJyb3I9aW1wbGlj
aXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gCSAgMjY4IHwgICAgIHBvbGxfZ3Bpb3MgPSByZWFs
bG9jYXJyYXkocG9sbF9ncGlvcywgbnVtX3BvbGxfZ3Bpb3MgKyAxLAo+IAkgICAgICB8ICAgICAg
ICAgICAgICAgICAgXn5+fn5+fn5+fn5+Cj4gCS9ob21lL2dwb3J0YXkvYnItdGVzdC1wa2cvYm9v
dGxpbi1hcm12NS11Y2xpYmMvYnVpbGQvcnBpLXV0aWxzLWExZDUyMmYwZjFiNTA4NThhNDRmYWM4
MDUyM2EyYmQ4MDA5OGU3ODkvcGluY3RybC9waW5jdHJsLmM6MjY4OjE2OiBlcnJvcjogYXNzaWdu
bWVudCB0byDigJhzdHJ1Y3QgcG9sbF9ncGlvX3N0YXRlICrigJkgZnJvbSDigJhpbnTigJkgbWFr
ZXMgcG9pbnRlciBmcm9tIGludGVnZXIgd2l0aG91dCBhIGNhc3QgWy1XZXJyb3I9aW50LWNvbnZl
cnNpb25dCj4gCSAgMjY4IHwgICAgIHBvbGxfZ3Bpb3MgPSByZWFsbG9jYXJyYXkocG9sbF9ncGlv
cywgbnVtX3BvbGxfZ3Bpb3MgKyAxLAo+IAkgICAgICB8ICAgICAgICAgICAgICAgIF4KPiAJSW4g
ZnVuY3Rpb24g4oCYZ2VuY21k4oCZLAo+IAkgICAgaW5saW5lZCBmcm9tIOKAmG1haW7igJkgYXQg
L2hvbWUvZ3BvcnRheS9ici10ZXN0LXBrZy9ib290bGluLWFybXY1LXVjbGliYy9idWlsZC9ycGkt
dXRpbHMtYTFkNTIyZjBmMWI1MDg1OGE0NGZhYzgwNTIzYTJiZDgwMDk4ZTc4OS92Y2dlbmNtZC92
Y2dlbmNtZC5jOjE1MjoxNDoKPiAJL2hvbWUvZ3BvcnRheS9ici10ZXN0LXBrZy9ib290bGluLWFy
bXY1LXVjbGliYy9idWlsZC9ycGktdXRpbHMtYTFkNTIyZjBmMWI1MDg1OGE0NGZhYzgwNTIzYTJi
ZDgwMDk4ZTc4OS92Y2dlbmNtZC92Y2dlbmNtZC5jOjEwOTo0OiB3YXJuaW5nOiDigJhzdHJuY2F0
4oCZIHNwZWNpZmllZCBib3VuZCAxMDI0IGVxdWFscyBkZXN0aW5hdGlvbiBzaXplIFstV3N0cmlu
Z29wLW92ZXJmbG93PV0KPiAJICAxMDkgfCAgICBzdHJuY2F0ICggIH5+fn5+fn5+fn4KPiAKPiBE
byB5b3Ugd2FudCBtZSB0byBtYWtlIGEgcGF0Y2g/IG9yIHdvcmtzIGFyb3VuZCBmb3IgaXQgdXNp
bmcgS2NvbmZpZz8KPiAKPiAJY29uZmlnIEJSMl9QQUNLQUdFX1JQSV9VVElMUwo+IAkJKC4uLikK
PiAJCWRlcGVuZHMgb24gIUJSMl9UT09MQ0hBSU5fVVNFU19VQ0xJQkMgIyBubyByZWFsbG9jYXJy
YXkKPiAKPiAJY29tbWVudCAicnBpLXV0aWxzIG5lZWRzIGEgZ2xpYmMgb3IgbXVzbCB0b29sY2hh
aW4gdy8gdGhyZWFkcyIKPiAJICAgICAgICBkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fVVNFU19V
Q0xJQkMKPiAKcmVhbGxvY2FycmF5IHdhcyBhZGRlZCBpbiB1Q2xpYmMtbmcgMS4wLjQ3LiB1Q2xp
YmMtbmcgMS4wLjQ4IGlzIGluCkJ1aWxkcm9vdCAyMDI0LjA1LjEuIApAVGhvbWFzOiBXb3VsZCBp
dCBiZSBwb3NzaWJsZSB0byByZWJ1aWxkIGJvb3RsaW4gdG9vbGNoYWlucz8KCmJlc3QgcmVnYXJk
cwogV2FsZGVtYXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
