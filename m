Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05077C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 22:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7332B60BBD;
	Mon, 12 Dec 2022 22:35:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7332B60BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AKEJTs-60P9s; Mon, 12 Dec 2022 22:35:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC93260C05;
	Mon, 12 Dec 2022 22:35:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC93260C05
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A763E1BF2B6
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 22:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F5024023B
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 22:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F5024023B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XErkFGzvVQZA for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 22:35:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4048740002
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4048740002
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 22:35:53 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BCMZkje030890;
 Mon, 12 Dec 2022 16:35:46 -0600
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BCMZkcH026274
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 12 Dec 2022 16:35:46 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 12
 Dec 2022 16:35:45 -0600
Received: from DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f]) by
 DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f%17]) with mapi id
 15.01.2507.016; Mon, 12 Dec 2022 16:35:45 -0600
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?utf-8?B?RnJhbsOnb2lzIFBlcnJhZA==?= <francois.perrad@gadz.org>
Thread-Topic: [Buildroot] [PATCH v7 2/3] boot/ti-k3-image-gen: add new package
Thread-Index: AQHZCZauh/Hy9PckcU+c+irWCzQtXq5pil+AgAAI14CAAAuKgIABQa9Q
Date: Mon, 12 Dec 2022 22:35:45 +0000
Message-ID: <d94714457a334901ba5caf994403f81f@ti.com>
References: <20221206171719.747581-1-gadiyar@ti.com>
 <20221206171719.747581-3-gadiyar@ti.com>	<20221211210933.19fb5199@windsurf>
 <CAB0FRssQAoVA9syt1SM3mwafto722J3rxWXeHwiVRsWFmCyBPw@mail.gmail.com>
 <20221211222229.678a56dc@windsurf>
In-Reply-To: <20221211222229.678a56dc@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.24.77]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1670884546;
 bh=OFwDvyTtyueznDtPyWJkIhU7hev63x1Syv3i4KpXagU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=JQR5e56y7dYUHJ/bve1cyeVsHF6wXlDl+orXallELCArYpGMf6eAO4rcItlFZchol
 GAYN+LwNOURnnumD0ItVfv0E8D5yxk0YpoqfUwkvWgxnlVPZHbtus/25/qyDWW59XR
 mLTjRYbrJuXKUzSocaAtDZsYFgnRXDuIBc1US1mQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=JQR5e56y
Subject: Re: [Buildroot] [PATCH v7 2/3] boot/ti-k3-image-gen: add new package
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
From: "Gadiyar, Anand via buildroot" <buildroot@buildroot.org>
Reply-To: "Gadiyar, Anand" <gadiyar@ti.com>
Cc: "Brattlof, Bryan" <bb@ti.com>, "Davis, Andrew" <afd@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>,
 Anand Gadiyar via buildroot <buildroot@buildroot.org>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

PiBGcm9tOiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPg0K
PiBTZW50OiBTdW5kYXksIERlY2VtYmVyIDExLCAyMDIyIDM6MjIgUE0NCj4gDQo+IE9uIFN1biwg
MTEgRGVjIDIwMjIgMjE6NDE6MTEgKzAxMDANCj4gRnJhbsOnb2lzIFBlcnJhZCA8ZnJhbmNvaXMu
cGVycmFkQGdhZHoub3JnPiB3cm90ZToNCj4gDQo+ID4gc2VlDQo+ID4NCj4gaHR0cHM6Ly9wYXRj
aHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIyMTIxMTIwMzgyNi4z
MTE3Nzg0LTEtZnJhbmNvaXMucGVycmFkQGdhZHoub3JnLw0KPiA+IHRoaXMgcGF0Y2ggZG9lcyB0
aGlzIHJld29yay4NCj4gDQo+IFRoYW5rcywgYnV0IGl0IG5lZWRzIHRvIGJlIGludGVncmF0ZWQg
aW4gYSB2OCBvZiB0aGUgcGF0Y2ggc2VyaWVzLg0KPiANCj4gVGhhbmtzIQ0KPiANCj4gVGhvbWFz
DQoNClRoYW5rcyBmb3IgdGhlIGNvbW1lbnRzIFRob21hcyBhbmQgSSBhcG9sb2dpemUgZm9yIG5v
dA0KY2F0Y2hpbmcgdGhlc2UgcG9pbnRzIGVhcmxpZXIuIFdlIGRpZCBidWlsZCBidXQgZGlkbid0
IHJlYWQgdGhlDQpsb2cgbWVzc2FnZXMgb2J2aW91c2x5Lg0KDQpJIHdpbGwgcmV3b3JrIGFuZCBy
ZXN1Ym1pdCB2OCBzaG9ydGx5Lg0KDQpCZXN0IFJlZ2FyZHMsDQpBbmFuZA0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
