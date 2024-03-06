Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC48FC54E41
	for <buildroot@archiver.kernel.org>; Wed,  6 Mar 2024 13:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DBD560EA0;
	Wed,  6 Mar 2024 13:20:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PwZx5z9hXvXm; Wed,  6 Mar 2024 13:20:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 087146063C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 087146063C;
	Wed,  6 Mar 2024 13:20:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD7A71BF357
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 13:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99F0260605
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 13:20:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CaRu8ADBNzIL for <buildroot@lists.busybox.net>;
 Wed,  6 Mar 2024 13:20:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6F5466063C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F5466063C
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F5466063C
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 13:20:04 +0000 (UTC)
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 06 Mar 2024 14:20:00 +0100
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 540D5B5AC0;
 Wed,  6 Mar 2024 14:20:00 +0100 (CET)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 746A2B5ABC;
 Wed,  6 Mar 2024 14:19:49 +0100 (CET)
Received: from stwexm.stww2k.local (172.25.2.111) by stwexm.stww2k.local
 (172.25.2.111) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Wed, 6 Mar
 2024 14:19:49 +0100
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (104.47.51.169)
 by stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32 via Frontend Transport; Wed, 6 Mar 2024 14:19:49 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETVa1hJUbHHOXYnWQG0onR91vGrgLT7ojGIv2OtCETyDhDqROS7HgatWJfzYfufyPzmGhJ+4wjSqU96Pt+TI+JlYD1onDlwTgx/PmdeHotLgR5W4gF2akChy6qrSFRuiRyvwVh+7yTs3GbahL0DCGnHPlwi6YgiJy7UQ0bwpZPwGJ7h8bHz55lVmys+T4me104lKyOv71x839+8GseOJzwI/UuE2vIWbUdYNFa8UKUdaXDizR4VtDQjsHijmVJOpleoKMPrV+FC7mJcKoBDXx2LgkFQ66qo8G4e1bTl9iWZlAcKrpIq69kHDh5GUZGXl6WaVJ6y3dXt1geSsDLoD5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePfxAtqqLtuW4ZjJ39w/KjJMISAKW9ygbifj+bmhMUs=;
 b=FwaOIWuiI14PxWIWn+tO8wkPyveWMm5ogn+I5f5ilshgQuMtzABdTqETnTEVpI1x0gggqHScD2IMV9e7mfTXiS+yCjgf9MABor/QFDNA7UcBLV1khTUM29GFk3ldgIbp5ZMzi9Y/Y4wR9nR8ybx99teawZH4tO9AX0Jtg9qnxbsjbtlxFam/nDRauUA6YWk4OyM5ttYKnALP6qbhk6MmGKQ4fbHy22xVTRxbV/okBek2HGkdc0l09ukVrAoS4kh4S9cF5Vjy7DX0ircQnzbReyNzYzqYATgXN8kfOi6s0EC9SUSQErIw4PFU8FULQk35CSL+GWYPA0pUuQy8J6+QCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by DU2P250MB0063.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:238::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Wed, 6 Mar
 2024 13:19:47 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::256c:ce8e:9709:2e82]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::256c:ce8e:9709:2e82%7]) with mapi id 15.20.7339.035; Wed, 6 Mar 2024
 13:19:47 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH v3] package/libzenoh-c: new package
Thread-Index: AQHaa761ExEDrroE2kuUhVB5/yGN2bEjKjqAgAdvO9A=
Date: Wed, 6 Mar 2024 13:19:47 +0000
Message-ID: <AS1P250MB060844767C03EEECD6ED1812A9212@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
References: <AS1P250MB06088E27875FEBCE10F3B5F9A9D5A@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
 <20231101184652.412eb9cb@windsurf>
 <AS1P250MB06086CD15C0B581F84F7F00BA9AAA@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
 <AS1P250MB06080D04D548B5D4D947C44AA95E2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
 <ZeIVP2WxwT2BIS0z@landeda>
In-Reply-To: <ZeIVP2WxwT2BIS0z@landeda>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|DU2P250MB0063:EE_
x-ms-office365-filtering-correlation-id: 4b22ec6b-33a7-4c90-dd43-08dc3de018aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +9n2Xb4eq0d+tUbAVGSg3ZkOAoVOLN4EalovpTXNiX9iVZwdvDsXUcsNA6Xi1Pmst1DaSBOlq2zCjYYziZkDfCN4gVo9KmL0EeFfnPwLwUgyIS2hTH7UpahgNeYaX5f4ylCyiJ4mVJizfzNYnuu2R01KOIxUnDO2qYAAvwn5QKBrz7tl9Z93kikub6/sALf5UOh+QxBETbvHmjKqpwA1oHFK1WHbE6ds3JzqCu7XMwKEjIHrCH3RLP6/TLaZ6Es4qRHmKJgLko4gNPy3RcZe2CmXhWiDWDPS49WNiBpFljWq9y0kuQoJaHKIMyYAXLVHLl6IZY/SONQxGhgFTUNNNCpDqFp9B0ThSyVHbndT9dDF4oEBtBdT05ooDRgbJSZTLEg49gfLcM+VJQkdBBwkjHIAaL5KYAZyzLHaO63AGxvyrw2oKOpA87tvXMDccQ1WBvej6cHqHeYopS/rN0kwEwZ7i215KNQ/rtx0LMC57doutTrgH9wRv6dDahVnYQyqiPdGEb4OthT0Zc0zreJzdurykm1CclJS+V8jctVyFdjRqA1Vtv7eOyVhUQdNfZnN6uxWG9K2eZSVyfjeS9ziUz2OUwXelV+E0t4eqYwhYMEFKi7c7djz+gD//3Cty3lLZ55K7fEYdwM9b0IUFsNJE+7jCqaN2/U7R0xn+eae4B5+DvrLX8gWFnwIHsdhcsJZFP9dHO3Pg9TUt3tbaeJdRA6DxDClDu6Fwmh7LfK0xif2oSnULmTfw5HzH1j1gfY3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009)(41080700001); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3ppQWZjQndERDdSaDczN29XbWk0bDh0N2pQd2ZlVjE0bXIwWHlMWlliS2Nn?=
 =?utf-8?B?cHlrazhpcnZnMUNHbGsyQWd1c0R5ZC94dnMxUnR4WE9VRENGSWJ4OTdYQWJR?=
 =?utf-8?B?SDgzRExzL2hBelRDYmpOc01yM2ZxUnQ0MFp0dUU5MjBWN0dGaDAwRjhpM1o5?=
 =?utf-8?B?eDR0SXVOMm5pbEF2K2UzM0NUZk4ydVhTUFZ4Z25jSi9pSjFmbGx5eGMrZW1M?=
 =?utf-8?B?ZCtoTSttdW15N1ZZR2p1TnNZWkpxM280TXRlVm5FSlJLQmE4RDh3aGpnWldk?=
 =?utf-8?B?UzZBbW1JN040SG02eDhWNXhEVkt0S0ZmYUdjVldvNjlaZFRRa1IxcHBWUXZR?=
 =?utf-8?B?WHloK1NHYS9veFl2azJKQjlMWVBaUG9lUnprVTU5NU54Yk9adUJGbDU1SkNB?=
 =?utf-8?B?cTl0aFF3RWZLbDQxVXc0VzFVN1lrWVVJa1ZTcGhTclI5dEQrVlpIcUk4TVQv?=
 =?utf-8?B?MFFDNnYxaHVtYW5RSUd1ejdQNnQ4R0kxMnhoaSt3ZGVqWk5sd3BvMXkwdkZu?=
 =?utf-8?B?eTBjTTJZa1A3ajdjbDRDQkhuZDJkV05PVkpNazFyZGZHWXlVYnBtcGhLVFBT?=
 =?utf-8?B?WW9obTFob0JKWWpTOTZTL3BqMlZBb0hiVjFzMmt1cVVTMXducFl5cTd4OEM0?=
 =?utf-8?B?WVpqNmdTalpGSTJZbU5EV29iU0hvcTc3OWNNcGhEYmhYQWF6V1FPeGVURlBp?=
 =?utf-8?B?ZWkxbG5CbzNaRXYvK2tvSEhENUd6QXM2R3RuR1g0VnVSNysrbEJFaXhkSVJ2?=
 =?utf-8?B?MTF5eE5YZXorYmoxWVZiM0NLOGFGOGM1ODlFUURRelUwYlJQTzVHUExGends?=
 =?utf-8?B?bXYzNGV3WStXTUFvNzJsUEo4UFBXdXFscC85czIyQkM3SkJFSnVpdi9VSFRY?=
 =?utf-8?B?Sys3ZGR3c3B2ajV0ZWlDWkNNV0d5c0xjZk5RdnNhT1NsOEVUK3A2MjdWaElO?=
 =?utf-8?B?eXJMZnpXTkhEbndvbnkwdmxwREdCbnFZKzZIYnhVT0F1Yi9JcWFRU3FKSEF5?=
 =?utf-8?B?QnpKeFdkK2lQQzVIOVBKbFdLWTVxZnhXazF1RHhtdmJjK0J5ZVl6bDV0MmF6?=
 =?utf-8?B?SFIxNFV0eGFVV081L2lwRklzN3VBa21lYytpdndVbnNZUGFJNXBsUkNVN3cy?=
 =?utf-8?B?QkJXR3Z0S0pFdldxRVpiNEljL0lvaythVmp3UHpwMENRQlIySDAyYStXRDQ3?=
 =?utf-8?B?WTB6NGNQUTNhcE56NVFRU0pNZitXdi9CdVRudm5NcmhCZ3JTSjZiby9xOXhH?=
 =?utf-8?B?Y1J0NHg3c2xzbXJVUXgrNStEL2FRR3ltT0RTL1prMXlUdjhRMlpJMlRwZjRS?=
 =?utf-8?B?TFpJQWhPZTVRYnZzbUJsR080SXhpcFo0WjRqV0diR0Y3bERFRjNwMUczemZV?=
 =?utf-8?B?UktpcHhvM3hCelJDOEVhSE5MVWdtUEhQK2QxVzd6eFpWZG1ZWUVIdHJoU3N0?=
 =?utf-8?B?SHEvdWM0ZUtPTzlkZ05tTXA3OUk2UHlQa0d0bGVhclBjd3h4SWt5ckN1TC9R?=
 =?utf-8?B?aDFsYlJaRWpmUTdOREdhRmkwajN4TDBkb1oxczV0TTE5djZvUmRiYUtRN0Vh?=
 =?utf-8?B?eFp3Um5NajBuVjZGZHZqcHN3ZFAxVStENU1ZVStLcnhFU2RyLzNSL0RiY2I2?=
 =?utf-8?B?TFFXQ01XWUxVTGZEUWIxb29GR04yUC9SUU5Hd3U1WjFiSzZHMjZla2JEZ3Yx?=
 =?utf-8?B?NjFiNnYzSHFjaVJNZWhhSE56WVJwak1vMHdLSnBTZmE5Z25nOVRzeXpXU3dN?=
 =?utf-8?B?N2YvVTZ3T1RiVy8vMHpyT1NOam4ydDR1SkRTMnlUYVRaRWl2Uzl3OUljcVV4?=
 =?utf-8?B?RzZQQnRYOUFWNXUrOTFOanJnQURSR1lVQjI0R2grMERhL216N1lQdVV3ZFlG?=
 =?utf-8?B?c1dDM0pIT01tcU1nUFZrWW9IWjVPUjdOMktjU21NbUl4SkVaQk1OdGN3QWtW?=
 =?utf-8?B?Tk9Bc1ljdU9zWXJQZ083Qy90cTA1eGh6Z3c1c0lFRXNQenFaTTVObUEvSFhR?=
 =?utf-8?B?T01FZFk1ZFBKRlRMcXpvd3gvaVJaZkliOW1LczJKSlJ4eVpIdVZRelBrcDhx?=
 =?utf-8?B?aTJwT2xvamd3SVVkTUhYelZzcG5XMUlsa1J6OFJ0QjY3R0F0WXI3OXdHVkdV?=
 =?utf-8?B?dG5qVW10akZmV0NWVTAwelhTTm5GODYyTXI5ZW1KVFF3MXdlUGRySUtqUkkx?=
 =?utf-8?B?UFE9PQ==?=
Content-Type: multipart/mixed;
 boundary="_002_AS1P250MB060844767C03EEECD6ED1812A9212AS1P250MB0608EURP_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: iTclkPgQt0GKmW/eBVQCDMEdoxHmaIMyDWrmLfddDF6oFkgiMTVn6/hmRMdf9g376DQQ9jgOui1lPBaFx8N1bi2NR325YGUH9V0qELvmadL0G/PdDFj53Wouc/h/CzB9eXFXCvIw/O6vuDhq/yS22QD0FaoDJiNR2VPwRvlzLdS8STSWSNjusQTKACKPggMMP47CHC1E9+s2YeCUo7R3c/LMPtAbb1so3Rt6J4vBk7bCIl+3Ow76cvt7Qy/1/0LEAQHJIU3nq6DzfNSs0gbXmobvz8qIjcGgE+Ev8akArP0rDvipYPfQMk5fmvZUPBMCOPp2E9a1jXB3CE7v8avvUUVZUwBynzubV8+GC8L+j0yy0plNO+0NHI+qREPSzXy8scXAD37dQAWifRyJPLp7xJn+Ui5OT8gJnNsTraY1jFCnQO9A3Thrf+2InoD9ig8XqSSDNC6H64O2KzpZMWRIdNl30ud28z1tv2/KLzg/GJRl64m0EtTHZu/faTN3p5SWuISh6iU+HKhf1IrgofF1oTTPbCR9YpD2/JAx8UktT0CVTT4bsMKbtBbFaIu+4MclkwRrOQ5Xhel0c73iCnM6nQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b22ec6b-33a7-4c90-dd43-08dc3de018aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2024 13:19:47.5079 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: medmzqV7JcPRefP2OVJAEXCTR6e+j7vRrUmk5835RDqPxlqVXEg6aa8DJGnLJrrjJQdRjmIeyCWvWzhQDQhjZlJKXnqZVm8QAFKtcY/vlOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P250MB0063
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-TBoneOriginalCC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePfxAtqqLtuW4ZjJ39w/KjJMISAKW9ygbifj+bmhMUs=;
 b=JTShxTgEwgr4XUy+VP2ARgy3KqLXGzIwt2FTIzebf1+Ib1A6qNxyBTK0ND8HmJH7awWtsqiEOCNjLmlZubGghumA6fxMYRYymXl3UbtALjYQ0xx+nI53AVFb6reqNIJpLXX5zeEoiCYqzNbZcG8lt4syUsTtW3bCUg6IChfJ9MA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=stwmm.onmicrosoft.com header.i=@stwmm.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-stwmm-onmicrosoft-com
 header.b=JTShxTgE
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: Re: [Buildroot] [PATCH v3] package/libzenoh-c: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--_002_AS1P250MB060844767C03EEECD6ED1812A9212AS1P250MB0608EURP_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WWFubiwNCg0KdGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLiBTZWUgbXkgYW5zd2VyIGJlbG93Og0K
DQo+IA0KPiA+IC0tLQ0KPiA+ICBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDEgKw0KPiA+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgIHwgIDEgKw0KPiA+
ICBwYWNrYWdlL2xpYnplbm9oLWMvQ29uZmlnLmluICAgICAgIHwgIDkgKysrKysrKysrDQo+ID4g
IHBhY2thZ2UvbGliemVub2gtYy9saWJ6ZW5vaC1jLmhhc2ggfCAgMyArKysNCj4gPiAgcGFja2Fn
ZS9saWJ6ZW5vaC1jL2xpYnplbm9oLWMubWsgICB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKw0KPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGliemVub2gtYy9Db25maWcuaW4gIGNyZWF0ZSBtb2RlIDEw
MDY0NA0KPiA+IHBhY2thZ2UvbGliemVub2gtYy9saWJ6ZW5vaC1jLmhhc2gNCj4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGliemVub2gtYy9saWJ6ZW5vaC1jLm1rDQo+ID4NCj4gPiBk
aWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMNCj4gPiBpbmRleCBhYzI3NzQyM2Ex
Li4wOGMzZDlhNWExIDEwMDY0NA0KPiA+IC0tLSBhL0RFVkVMT1BFUlMNCj4gPiArKysgYi9ERVZF
TE9QRVJTDQo+ID4gQEAgLTc1LDYgKzc1LDcgQEAgTjogICAgICBBbGVzc2FuZHJvIFBhcnRlc290
dGkgPGEucGFydGVzb3R0aUBnbWFpbC5jb20+DQo+ID4gIEY6ICAgICAgcGFja2FnZS9vYXRwcC8N
Cj4gPg0KPiA+ICBOOiAgICAgQWxleCBNaWNoZWwgPGFsZXgubWljaGVsQHdpZWRlbWFubi1ncm91
cC5jb20+DQo+ID4gK0Y6ICAgICBwYWNrYWdlL2xpYnplbm9oLWMvDQo+IA0KPiBOb3JtYWxseSwg
dGhpcyBmaWxlIGlzIGluZGVudGVkIHdpdGggVEFCcywgYnV0IHlvdXIgbWFpbCBvbmx5IGNvbnRh
aW5zIHNwYWNlcy4gTm90DQo+IHN1cmUgaG93IHlvdSBhcmUgc2VuZGluZyBpdCwgYnV0IHVzaW5n
IGdpdCBzZW5kLWVtYWlsIGVuc3VyZXMgaXQgaXMgcHJvcGVybHkgc2VudC4NCj4gDQoNClNvcnJ5
IGJ1dCBJIGFtIG5vdCBhbGxvd2VkIHRvIHVzZSBnaXQgc2VuZC1lbWFpbCBjb21tYW5kLCBJIGhh
dmUgdG8gdXNlIE91dGxvb2sgaW5zdGVhZC4NClBlcmhhcHMgb3V0bG9vayBhdXRvLWNvcnJlY3Rz
IGFsbCBpbmRlbnRhdGlvbiB0byB3aGl0ZXNwYWNlcywgSSBkb24ndCBrbm93LiBJIHdpbGwgcHJv
dmlkZQ0KdGhlIG5leHQgdmVyc2lvbiBvZiBteSBwYXRjaCBhcyBhdHRhY2htZW50IHRvIHRoaXMg
ZW1haWwuDQoNCj4gDQo+ICAgICAkKElOU1RBTEwpIC1EIC1tIDY0NCBcDQo+ICAgICAgICAgJChA
RCkvdGFyZ2V0LyovcmVsZWFzZS9saWJ6ZW5vaGMuc28gXA0KPiAgICAgICAgICQoMSkvdXNyL2xp
Yi9saWJ6ZW5vaGMuc28NCj4gDQo+IEFsc28sIEkgdGhpbmsgdGhlICdyZWxlYXNlJyBwYXRoIGNv
bXBvbmVudCB3aWxsIGNoYW5nZSB3aGVuDQo+IEJSMl9FTkFCTEVfREVCVUc9eSwgYXMgd2UgZG8g
bm90IHBhc3MgLS1yZWxlYXNlIGluIHRoYXQgY2FzZS4NCj4gDQo+IEFzbG8sIHdoeSBkbyB3ZSBu
ZWVkIGEgJyonIHBhdGggY29tcG9uZW50PyBTaW5jZSB0aGUgZGVzdGluYXRpb24gaXMgYSBzaW5n
bGUgZmlsZSwNCj4gd2UgZG8gb25seSBleHBlY3QgbmUgaW5vdXQgZmlsZSwgc28gdGhlICcqJyBp
cyBleHBlY3RlZCB0byBtYXRjaCBhIHNpbmdsZSBkaXJlY3RvcnksDQo+IHdoaWNoIHdlIHNob3Vs
ZCBoYXZlIGEgd2F5IHRvIGtub3cuIENhbiB5b3UgZXhwbGFpbiB0aGF0IGFzIHdlbGwsIHBsZWFz
ZT8NCg0KRml4ZWQsIHVzZSBub3cgQlIyX0VOQUJMRV9ERUJVRyAgYW5kIFJVU1RDX1RBUkdFVF9O
QU1FIHZhcmlhYmxlcy4NCg0KPiANCj4gPiArICAgICAgIG1rZGlyIC1wICQoU1RBR0lOR19ESVIp
L3Vzci9pbmNsdWRlLw0KPiA+ICsgICAgICAgY3AgLWRwZnIgJChARCkvaW5jbHVkZS8qICQoU1RB
R0lOR19ESVIpL3Vzci9pbmNsdWRlLyBlbmRlZg0KPiANCj4gVGhpcyBtYWNybyBpcyBleHBhbmRl
ZCBpbiB0aGUgSU5TVEFMTF9UQVJHRVQgY2FzZSwgd2hpY2ggbWVhbnMgZmlsZXMgd2lsbCBiZQ0K
PiBpbnN0YWxsZWQgdG8gc3RhZ2luZyBkdXJpbmcgdGhlIHRhcmdldCBpbnN0YWxsLiBUaGF0IGRv
ZXMgbm90IGxvb2sgcmlnaHQuDQo+IA0KDQpGaXhlZC4NCg0KU2VlIGF0dGFjaG1lbnQsIHRoYW5r
cy4NCg0KUmVnYXJkcywNCkFsZXgNCg==

--_002_AS1P250MB060844767C03EEECD6ED1812A9212AS1P250MB0608EURP_
Content-Type: application/octet-stream;
	name="v4-0001-package-libzenoh-c-new-package.patch"
Content-Description: v4-0001-package-libzenoh-c-new-package.patch
Content-Disposition: attachment;
	filename="v4-0001-package-libzenoh-c-new-package.patch"; size=4709;
	creation-date="Wed, 06 Mar 2024 13:15:27 GMT";
	modification-date="Wed, 06 Mar 2024 13:19:47 GMT"
Content-Transfer-Encoding: base64

RnJvbSA5MjkyMDljYzQ3ZTI5MzdjNDk0Y2IwZDZiMGFkNDhmNzBkYTQ4YTQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IE1pY2hlbCA8YWxleC5taWNoZWxAd2llZGVtYW5uLWdy
b3VwLmNvbT4KRGF0ZTogV2VkLCAxOCBPY3QgMjAyMyAxMDowNTo1NyArMDIwMApTdWJqZWN0OiBb
UEFUQ0ggdjRdIHBhY2thZ2UvbGliemVub2gtYzogbmV3IHBhY2thZ2UKClRoaXMgcGFja2FnZSBw
cm92aWRlcyBhIEMgYmluZGluZyBiYXNlZCBvbiB0aGUgbWFpbgpaZW5vaCBpbXBsZW1lbnRhdGlv
biB3cml0dGVuIGluIFJ1c3QuCkJlY2F1c2UgdGhpcyBsaWIgZG9lcyBub3QgcHJvdmlkZSBhbnkg
YmluYXJpZXMgb3IgZXhhbXBsZXMsCmFuZCB0aGUgY2FyZ28gaW5mcmEgZG9lcyBub3QgcHJvdmlk
ZSBhbnkgcG9zc2liaWxpdHkgdG8KZGlzYWJsZSB0aGUgLS1iaW5zIG9wdGlvbiBpbiBjYXJnbyBp
bnN0YWxsIHN0ZXAsIHdlCmhhdmUgdG8gb3ZlcnJpZGUgdGhlIElOU1RBTExfU1RBR0lOR19DTURT
IGFuZCB0aGUKSU5TVEFMTF9UQVJHRVRfQ01EUyBtYWNyb3MgdG8gcHJldmVudCBmYWlsaW5nIG9m
IHRoZQpidWlsZHJvb3QgaW5zdGFsbGF0aW9uIHN0ZXAuCgpodHRwczovL2dpdGh1Yi5jb20vZWNs
aXBzZS16ZW5vaC96ZW5vaC1jCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IE1pY2hlbCA8YWxleC5taWNo
ZWxAd2llZGVtYW5uLWdyb3VwLmNvbT4KCi0tLQpDaGFuZ2VzIHYzIC0+IHY0OgogIC0gd3JhcHBl
ZCBsb25nIGxpbmVzIHRvIDgwIGNoYXJhY3RlcnMKICAtIHVzZSBCUjJfRU5BQkxFX0RFQlVHIHZh
cmlhYmxlIGluc3RlYWQgb2YgInJlbGVhc2UiIHBhdGggY29tcG9uZW50CiAgLSB1c2UgUlVTVENf
VEFSR0VUX05BTUUgdmFyaWFibGUgaW5zdGVhZCBvZiAiKiIgcGF0aCBjb21wb25lbnQKICAtIHNo
YXJlZCBtYWNybyBpbnN0YWxscyBvbmx5IHRoZSBjb21tb24gc2V0IG9mIGZpbGVzCiAgLSBJTlNU
QUxMX1RBUkdFVF9DTURTIGluc3RhbGxzIG9ubHkgdGhlIGxpYgogIC0gSU5TVEFMTF9TVEFHSU5H
X0NNRFMgaW5zdGFsbHMgYm90aCB0aGUgbGliIGFuZCBpbmNsdWRlIGZpbGVzCgpDaGFuZ2VzIHYy
IC0+IHYzOgogIC0gYnVtcCBwYWNrYWdlIHRvIDAuMTAuMS1yYwogIC0gc2V0IElOU1RBTExfU1RB
R0lORwoKQ2hhbmdlcyB2MSAtPiB2MjoKICAtIHJlbmFtZWQgemVub2gtYyB0byBsaWJ6ZW5vaC1j
CiAgLSBhZGRlZCBteXNlbGYgdG8gREVWRUxPUEVSUwogIC0gZml4ZWQgTElDRU5TRQogIC0gaW5z
dGFsbCBzaGFyZWQgbGlicmFyaWVzIHRvIHN0YWdpbmcgYW5kIHRvIHRhcmdldAotLS0KIERFVkVM
T1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL0NvbmZpZy5pbiAg
ICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9saWJ6ZW5vaC1jL0NvbmZpZy5pbiAgICAg
ICB8ICA5ICsrKysrKysrCiBwYWNrYWdlL2xpYnplbm9oLWMvbGliemVub2gtYy5oYXNoIHwgIDMg
KysrCiBwYWNrYWdlL2xpYnplbm9oLWMvbGliemVub2gtYy5tayAgIHwgMzUgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYnplbm9oLWMvQ29uZmlnLmluCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS9saWJ6ZW5vaC1jL2xpYnplbm9oLWMuaGFzaAogY3JlYXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvbGliemVub2gtYy9saWJ6ZW5vaC1jLm1rCgpkaWZmIC0tZ2l0IGEvREVW
RUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggYWMyNzc0MjNhMS4uMDhjM2Q5YTVhMSAxMDA2NDQK
LS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC03NSw2ICs3NSw3IEBAIE46ICAg
ICAgQWxlc3NhbmRybyBQYXJ0ZXNvdHRpIDxhLnBhcnRlc290dGlAZ21haWwuY29tPgogRjogICAg
ICBwYWNrYWdlL29hdHBwLwogCiBOOglBbGV4IE1pY2hlbCA8YWxleC5taWNoZWxAd2llZGVtYW5u
LWdyb3VwLmNvbT4KK0Y6CXBhY2thZ2UvbGliemVub2gtYy8KIEY6CXBhY2thZ2UvbGliemVub2gt
cGljby8KIEY6CXBhY2thZ2UvbmV0d29yay1tYW5hZ2VyLW9wZW52cG4vCiAKZGlmZiAtLWdpdCBh
L3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KaW5kZXggY2Q2ODdhNjgyYi4u
YWYxZWUzMDU4NSAxMDA2NDQKLS0tIGEvcGFja2FnZS9Db25maWcuaW4KKysrIGIvcGFja2FnZS9D
b25maWcuaW4KQEAgLTE5OTYsNiArMTk5Niw3IEBAIG1lbnUgIk5ldHdvcmtpbmciCiAJc291cmNl
ICJwYWNrYWdlL2xpYndlYnNvY2svQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9saWJ3ZWJz
b2NrZXRzL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvbGlieWFuZy9Db25maWcuaW4iCisJ
c291cmNlICJwYWNrYWdlL2xpYnplbm9oLWMvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9s
aWJ6ZW5vaC1waWNvL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvbGtzY3RwLXRvb2xzL0Nv
bmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvbWJ1ZmZlci9Db25maWcuaW4iCmRpZmYgLS1naXQg
YS9wYWNrYWdlL2xpYnplbm9oLWMvQ29uZmlnLmluIGIvcGFja2FnZS9saWJ6ZW5vaC1jL0NvbmZp
Zy5pbgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5kMjI4MDdjMDQ3Ci0t
LSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9saWJ6ZW5vaC1jL0NvbmZpZy5pbgpAQCAtMCwwICsx
LDkgQEAKK2NvbmZpZyBCUjJfUEFDS0FHRV9MSUJaRU5PSF9DCisJYm9vbCAibGliemVub2gtYyIK
KwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfVEFSR0VUX0FSQ0hfU1VQUE9SVFMK
KwlzZWxlY3QgQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQworCWhlbHAKKwkgIFRoaXMgcGFja2FnZSBw
cm92aWRlcyBhIEMgYmluZGluZyBiYXNlZCBvbiB0aGUgbWFpbgorCSAgWmVub2ggaW1wbGVtZW50
YXRpb24gd3JpdHRlbiBpbiBSdXN0LgorCisJICBodHRwczovL2dpdGh1Yi5jb20vZWNsaXBzZS16
ZW5vaC96ZW5vaC1jCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnplbm9oLWMvbGliemVub2gtYy5o
YXNoIGIvcGFja2FnZS9saWJ6ZW5vaC1jL2xpYnplbm9oLWMuaGFzaApuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwLi44YzkzYTdhMDkxCi0tLSAvZGV2L251bGwKKysrIGIvcGFj
a2FnZS9saWJ6ZW5vaC1jL2xpYnplbm9oLWMuaGFzaApAQCAtMCwwICsxLDMgQEAKKyMgTG9jYWxs
eSBjb21wdXRlZAorc2hhMjU2ICAzZWRlNTg3ZGQwOGNjZDZiMGI3ZjBiNDRmYWVlZmE0NjZlYjVl
MTg4MjZkYjBiMWNkOTNjNTFmZmM1OTM3N2VjICBsaWJ6ZW5vaC1jLTAuMTAuMS1yYy50YXIuZ3oK
K3NoYTI1NiAgMDFhNDQ3NzRmN2IxYTQ1MzU5NWM3YzZkN2Y3MzA4Mjg0YmE2YTEwNTlkYzQ5ZTE0
ZGFkNjY0N2UxZDQ0YTMzOCAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJ6ZW5vaC1j
L2xpYnplbm9oLWMubWsgYi9wYWNrYWdlL2xpYnplbm9oLWMvbGliemVub2gtYy5tawpuZXcgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4wYWQ4MWYzZTQxCi0tLSAvZGV2L251bGwK
KysrIGIvcGFja2FnZS9saWJ6ZW5vaC1jL2xpYnplbm9oLWMubWsKQEAgLTAsMCArMSwzNSBAQAor
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKyMKKyMgbGliemVub2gtYworIworIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKKworTElCWkVOT0hfQ19WRVJTSU9OID0gMC4xMC4xLXJjCitMSUJaRU5PSF9D
X1NJVEUgPSAkKGNhbGwgZ2l0aHViLGVjbGlwc2UtemVub2gsemVub2gtYywkKExJQlpFTk9IX0Nf
VkVSU0lPTikpCitMSUJaRU5PSF9DX0xJQ0VOU0UgPSBBcGFjaGUtMi4wIG9yIEVQTC0yLjAKK0xJ
QlpFTk9IX0NfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKK0xJQlpFTk9IX0NfSU5TVEFMTF9TVEFH
SU5HID0gWUVTCisKK2lmZXEgKCQoQlIyX0VOQUJMRV9ERUJVRykseSkKK0xJQlpFTk9IX0NfTElC
X0xPQ0FUSU9OID0gJChARCkvdGFyZ2V0LyQoUlVTVENfVEFSR0VUX05BTUUpL2RlYnVnCitlbHNl
CitMSUJaRU5PSF9DX0xJQl9MT0NBVElPTiA9ICQoQEQpL3RhcmdldC8kKFJVU1RDX1RBUkdFVF9O
QU1FKS9yZWxlYXNlCitlbmRpZgorCitkZWZpbmUgTElCWkVOT0hfQ19JTlNUQUxMX0ZJTEVTCisJ
JChJTlNUQUxMKSAtRCAtbSA2NDQgXAorCQkkKExJQlpFTk9IX0NfTElCX0xPQ0FUSU9OKS9saWJ6
ZW5vaGMuc28gXAorCQkkKDEpL3Vzci9saWIvbGliemVub2hjLnNvCitlbmRlZgorCitkZWZpbmUg
TElCWkVOT0hfQ19JTlNUQUxMX1RBUkdFVF9DTURTCisJJChjYWxsIExJQlpFTk9IX0NfSU5TVEFM
TF9GSUxFUywkKFRBUkdFVF9ESVIpKQorZW5kZWYKKworZGVmaW5lIExJQlpFTk9IX0NfSU5TVEFM
TF9TVEFHSU5HX0NNRFMKKwkkKGNhbGwgTElCWkVOT0hfQ19JTlNUQUxMX0ZJTEVTLCQoU1RBR0lO
R19ESVIpKQorCW1rZGlyIC1wICQoU1RBR0lOR19ESVIpL3Vzci9pbmNsdWRlLworCWNwIC1kcGZy
ICQoQEQpL2luY2x1ZGUvKiAkKFNUQUdJTkdfRElSKS91c3IvaW5jbHVkZS8KK2VuZGVmCisKKyQo
ZXZhbCAkKGNhcmdvLXBhY2thZ2UpKQotLSAKMi4zNC4xCgo=

--_002_AS1P250MB060844767C03EEECD6ED1812A9212AS1P250MB0608EURP_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--_002_AS1P250MB060844767C03EEECD6ED1812A9212AS1P250MB0608EURP_--
