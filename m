Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCAAC27C53
	for <buildroot@archiver.kernel.org>; Sun,  9 Jun 2024 12:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 082E36074C;
	Sun,  9 Jun 2024 12:55:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TcEQWi_ZDCn7; Sun,  9 Jun 2024 12:55:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC679606E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC679606E3;
	Sun,  9 Jun 2024 12:55:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC4FE1BF3EE
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 12:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7C20405EB
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 12:55:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pCqJi1EuioHx for <buildroot@lists.busybox.net>;
 Sun,  9 Jun 2024 12:55:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 11BCB404CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11BCB404CB
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11BCB404CB
 for <buildroot@buildroot.org>; Sun,  9 Jun 2024 12:54:58 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.1.59.208]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4s4r-1sFSae2Wlr-000VoQ; Sun, 09
 Jun 2024 14:54:55 +0200
Date: Sun, 9 Jun 2024 14:54:55 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <ZmWmH6p7qlp3DHbT@probook>
References: <20240529-ztext-v2-0-82985032f169@gmx.net>
 <20240529-ztext-v2-1-82985032f169@gmx.net>
 <ZluLyQ7JHFYedvcv@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZluLyQ7JHFYedvcv@landeda>
X-Provags-ID: V03:K1:3J+Nf4tDag8JAQ6yCKaYAVjqyeHqVuX/OM98+btbVHtw3d/htwr
 MBNQnSDgx8DZWtq/g5XwJtHGDzdBeE2ck8wPjE6OZTuzJ0CUY+xv7MOU9QNGSHyBT6Anrtt
 xMvyExBKmCcHBGOsghQBJ4PmUX5jwbrkrwWu7phnwi4/6JZ2043S+TlsWT3o/wY6GOcBa1Q
 JWSTx52+6D3qXUdkBkRLw==
UI-OutboundReport: notjunk:1;M01:P0:vpKasYvwdeY=;CTrRSvLtxhqEWx7bcAUj1x5i5bh
 3+orpOfAQCsNzS24U3L0JJwEwsEXlfJOPnVPJZ+CynKY+PP1bzL/npAP+4pQ3uO+NJxP5CaMf
 JKxt0TISKmOu0UNRibSsso46YKnicSauwT6/MK6NMSyxy51xAg3k1L7Dz0UPdCwK1BADq2/Ri
 5pwz/jSCd9sQ3tu+7I6OkzjDNxrYkQSCwIxv5tYmvQyIfDEQa3rgVtxKij5qdy5fY/aUSh9oc
 OjOnQyQ4N1tA7j8BdYmzYgWNZ7ajdzXPWwLvGItKwPqFTUEpoa8pEHxKshNdf63+4fV1S5mgg
 OppOtsmB7JpLhUOPZK9FLwZcoHcTgKOTPO9cAqqptJkT/jqrmFqy2gUes/W5/FE+BjxWNif77
 0v/76xOLvhHPcb+d7S7YfJ2hs9HR9e31z8x/bntD2h3eh9l5FBWTAfg9rMw6lhx6TCH3LNLls
 U74pVd0eceCZK2uv7k1wdZfp2QrnxnTnFayX4oeanTBRtnbtcYD9IIdResGVScTnQVtHVj2Ke
 cam3BxqVtfHgM+k46eEnohPTem3La+42VJSmw7yGM60UE25oZHeP8yInNLbNN6gZ18SxbNfhD
 bLIUPaaFpgS4may3TLeI6rLt6IUMjZR4HhPOx3jZDBNVIasUMkx+SKpEo/bFEjwVosFyKnhI6
 /Y6cmDXeJK65hhRY3Ix8L2qxfDXi+3tnIyh5BlDAW1jvW9XypEt+2hmFOpl2tcLUl8RzY4+1Y
 W8zoDyngAkBw0XSb3LiOgbfrnFQ7B5sMe8vVPEsftKcEosBUGq90ZtGfxe4CyEDW+g4/ZlY67
 zOsVejr/HdLBpmKcJaqfm1FIl6PrPUJGPtDe3fSMajngA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1717937695; x=1718542495; i=j.neuschaefer@gmx.net;
 bh=0gE4la1SnQ23CX9NHjxs7H3hnK2PmlWLSMKQFcftKJs=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=BD/B4cwp2/959HSr0SIuIdiTBgKF4HXRiGTyrNvWqF9JALF044CGeprYf3bRWXdM
 ZiT80/HiE0aGSCANhWl4OfLxev3ldfZKcloBQ1pnxkhZ8Ug7JDyX+Lr9DhpFQC/ta
 +FpyzM6rcM8xnRvNFUIe9c9Uy7HSE3XVdmx2rZGLEEcPoS/D4ma0H5f1BOaImSWXl
 37QFGMC48vkFZdMb9a7S9QOJuZvlNAfxaLcziK0RxEnHK3R3C2uNlvxrM/OT8Xc6d
 3V5SmGUeNDv567kZVkkE+pu6VCMaVkvUc9Zg0BqNs4IMRQ64w5ccsMPTQTUT1tR/q
 a8EGsKIrTGfJkzmZCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=BD/B4cwp
Subject: Re: [Buildroot] [PATCH v2 1/2] Config.in: ban textrels on musl
 toolchains
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwgc29ycnkgZm9yIHRoZSBkZWxheSwKCk9uIFNhdCwgSnVuIDAxLCAyMDI0IGF0
IDEwOjU5OjUzUE0gKzAyMDAsIFlhbm4gRS4gTU9SSU4gd3JvdGU6Cj4gT24gMjAyNC0wNS0yOSAy
MDoyMiArMDIwMCwgSi4gTmV1c2Now6RmZXIgdmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4g
PiBtdXNsLWxpYmMgZG9lc24ndCBzdXBwb3J0IFRFWFRSRUxzWzFdIGFuZCBwcm9ncmFtcyB3aXRo
IFRFWFRSRUxzIHdpbGwKPiA+IGNyYXNoIG9uIHN0YXJ0LXVwIHVuZGVyIG11c2wuCj4gPgo+ID4g
VGhpcyBwYXRjaCBmb3JiaWRzIHRoZSB1c2Ugb2YgVEVYVFJFTHMgb24gbXVzbCwgYnV0IGFkZHMg
YW4gb3B0aW9uIHRvCj4gPiBlaXRoZXIgZm9yYmlkIHRoZW0gb24gb3RoZXIgbGliY3MgYXMgd2Vs
bCwgb3IgYWxsb3cgdGhlbSBvbiBtdXNsLgo+Cj4gSW4geW91ciB2MSwgVGhvbWFzIHN1Z2dlc3Rl
ZCB0aGF0IHRleHRyZWxzIGJlIHNpbXBseSBhbHdheXMgZGlzYWJsZWQgZm9yCj4gbXVzbCwgYmVj
YXVzZSB0aGVyZSBpcyBubyB3YXkgdGhleSBjYW4gd29yay4gQWxsb3dpbmcgcGVvcGxlIHRvIGVu
YWJsZQo+IHRoZW0gb24gbXVzbCB3aWxsIG9ubHkgbWFrZSB0aGluZ3MgcmVhayBhdCBydW50aW1l
LCByYXRoZXIgdGhhbiBhdCBidWlsZAo+IHRpbWUuCj4KPiBJJ20gb24gdGhlIHNhbWUgcGFnZSBh
cyBUaG9tYXMgaGVyZTogaWYgdGV4dHJlbHMgYXJlIHVuc3VwcG9ydGVkIG9uCj4gbXVzbCwgdGhl
biBsZXQncyBub3QgYWxsb3cgdGhlbSBhdCBhbGwuCgpBbHJpZ2h0LCBJIHdhc24ndCBmdWxseSBj
ZXJ0YWluIGFib3V0IGl0LCBidXQgSSdsbCBjaGFuZ2UgdGhlIEtjb25maWcKbG9naWMgYWNjb3Jk
aW5nbHkuCgo+Cj4gPiBbMV06IGh0dHBzOi8vd3d3Lm9wZW53YWxsLmNvbS9saXN0cy9tdXNsLzIw
MjAvMDkvMjUvNAo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5ldXNj
aGFlZmVyQGdteC5uZXQ+Cj4gPiAtLS0KPiBbLS1TTklQLS1dCj4gPiBkaWZmIC0tZ2l0IGEvQ29u
ZmlnLmluIGIvQ29uZmlnLmluCj4gPiBpbmRleCBiNWE5NDMyNWM0Li45MmU4OWVkMzJkIDEwMDY0
NAo+ID4gLS0tIGEvQ29uZmlnLmluCj4gPiArKysgYi9Db25maWcuaW4KPiA+IEBAIC05MTAsNiAr
OTEwLDIwIEBAIGVuZGNob2ljZQo+ID4gIGNvbW1lbnQgIlJFTG9jYXRpb24gUmVhZCBPbmx5IChS
RUxSTykgbmVlZHMgc2hhcmVkIGxpYnJhcmllcyIKPiA+ICAJZGVwZW5kcyBvbiAhQlIyX1NIQVJF
RF9MSUJTCj4gPgo+ID4gK2NvbmZpZyBCUjJfTElOS19aVEVYVAo+ID4gKwlib29sICJEaXNhbGxv
dyB0ZXh0IHNlY3Rpb24gcmVsb2NhdGlvbnMgKFRFWFRSRUxzKSIKPgo+IFdlIHByZWZlciBwb3Np
dGl2ZSBsb2dpYzoKPgo+ICAgICBjb25maWcgQlIyX0xJTktfWlRFWFQKPiAgICAgICAgIGJvb2wg
IkFsbG93IHRleHQgc2VjdGlvbiByZWxvY2F0aW9ucyAoVEVYVFJFTHMpIgo+ICAgICAgICAgZGVm
YXVsdCB5ICAjIExlZ2FjeQo+ICAgICAgICAgZGVwZW5kcyBvbiAhQlIyX1RPT0xDSEFJTl9VU0VT
X01VU0wKPiAgICAgICAgIGRlcGVuZHMgb24gIUJSMl9TVEFUSUNfTElCUwoKR29vZCBpZGVhLCB0
aGlzIGxvb2tzIGEgYml0IGVhc2llciB0byB1bmRlcnN0YW5kLgoKPgo+IGFuZCBpbiB0aGUgLm1r
Ogo+Cj4gICAgIGlmZXEgKCQoQlIyX0xJTktfWlRFWFQpLCkKPiAgICAgVEFSR0VUX0xERkxBR1Mg
Kz0gLXogdGV4dAo+ICAgICBlbmRpZgo+Cj4gKE5vdGUgdGhlICdkZWZhdWx0IHknOiB0ZXh0cmVs
cyB3ZXJlIHByZXZpb3VzbHkgYWx3YXlzIGFsbG93ZWQsIHNvIHdlCj4gd2FudCB0byBrZWVwIHRo
YXQgYmVoYXZpb3VyIGJ5IGRlZmF1bHQpCj4KPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCgpU
aGFua3MgZm9yIHlvdXIgcmV2aWV3IQotLWpuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
