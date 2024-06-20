Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00703C27C79
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 09:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25E2C42E70;
	Thu, 20 Jun 2024 09:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KWVMGQuc29dI; Thu, 20 Jun 2024 09:26:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D597642E6F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D597642E6F;
	Thu, 20 Jun 2024 09:26:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE4951BF82C
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 09:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8104614ED
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 09:26:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WcYZOdbo7I2e for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 09:26:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 78E7A61515
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78E7A61515
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78E7A61515
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 09:26:03 +0000 (UTC)
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 20 Jun 2024 11:25:54 +0200
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 54A69B5AD3
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 11:25:54 +0200 (CEST)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 3156EB5ACC
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 11:25:43 +0200 (CEST)
Received: from stwexm.stww2k.local (172.25.2.111) by stwexm.stww2k.local
 (172.25.2.111) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Thu, 20 Jun
 2024 11:25:43 +0200
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (104.47.14.47) by
 stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32 via Frontend Transport; Thu, 20 Jun 2024 11:25:42 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWe4a4k+Bd0ZoYXrN7CuISPkC6ZbYFGatKNwtHdQh+PCsDXXcTcfKLDd4ckEZ0oXqDBK0dHTlVxDFeArH/aLRA/z4KL2vbgFp3vMDW67pLkO7PSJ6y94RXklt0f0gaFAY6WkJ59zaDLtuUCvmKhnHNEFtvRJERSVi/sRN0cSxKAWjfB7Q8PeTKmsIRtKde3o95jaM8LdUQQNe/eZqDwLKDBsa+YC7bzYbsPazbrXvU2yhpFebMHUkp2ddiVBYTlrdV1MJgXZq+PY3Aoi5LJ8ukiWOiJN76SBNrIqUaQghQ87qhFb3LtWgLi9iApHCU3NkytJ/7j1a8AfDLHINZ1cxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1p2xGXBfTIEKpWY03/s5o5+umNCbFRZSo+/+fWsUqTY=;
 b=Lpz5Bun5p2n1El2Zq40St9srGrgbr6YSER+vjj9zDWPEp1luIBEnNsjsN0JyAnFTo9Zcx0HvupegB4JRPg4nszycmjVAA2oNofF0ndJ3BfOFjAd08Jz794FwBWv9tZwpmvZfUybYeN3xA10nVqRfOLL/VTF3XA89Lw8K2yt6uMFhLhBltXmoJOPOHTTMl9ev8bRi23J9zU3akLkubo0wT/lAwCX8oXvnmaOjoo23HruH7QL0OW8Os7UBGXCOUemtH2cxAXtMsaN+BuNAu5bI4zRZfqUHbc/ah6XRD3HdLmaYLiNBGsvNqzUge2elFu0xNDvpsfT6qgHxfrrVna+I0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by DU2P250MB0366.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:27b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 09:25:36 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2%7]) with mapi id 15.20.7698.020; Thu, 20 Jun 2024
 09:25:35 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/2] package/libzenoh-c: bump to version 0.11.0
Thread-Index: AdrC85toXEapi2o+QqK5qG3BJcKSyQ==
Date: Thu, 20 Jun 2024 09:25:35 +0000
Message-ID: <AS1P250MB060825741529F073326AA014A9C82@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|DU2P250MB0366:EE_
x-ms-office365-filtering-correlation-id: 619fefdc-01bd-4a3d-695e-08dc910af0bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|366013|376011|1800799021|38070700015;
x-microsoft-antispam-message-info: =?us-ascii?Q?7JhHhLWl+cvSEXPItPuEn+UbPQL1UnnKz2+YkslaIswwGPnBXSe5hvD9516d?=
 =?us-ascii?Q?xhT+dt+tLy/kNwMsJHwxUgmpZUzNbIHum2SkTJxJXx/T8hZqv66q+DIN6U2X?=
 =?us-ascii?Q?0tiOmXwLYdwDSXiJBT8APLYsNJYm9x/modSH5jLPHEeXVvHcL8WQrVmdgorX?=
 =?us-ascii?Q?scv/6vSoggon4tD7PwfwHrYbVSDORUZRIhFQ+0/n7bif0DGROSZEfBgQzkrk?=
 =?us-ascii?Q?r6Tcn7Yj4uXCT7nARribVXCEma9cXgtfM4mdbLjyT8Ki0478WQwhJqlM1cKa?=
 =?us-ascii?Q?h7ebwwMrFuWVPNEa7RAwRe5M5uZLcUsqKWTE8BzJdm0VUwtPwFuPNzlYtWCq?=
 =?us-ascii?Q?Q2v5+XMYldLT1AS5k6DCw0xEWxKU2qDfQ1wcqutOINSDuOXpo0XjLnM3JTw7?=
 =?us-ascii?Q?aW91L3Big32EXlKUzhAhG0giAqXvGzMkPzNnhcDR+LD/JSc4CJbkDKxEkYIi?=
 =?us-ascii?Q?e9EWzZsyhr0ADwKW9gHy9xr3bv4gClnphaZiH/+e1m7pf3Wehux/PQQEgFJf?=
 =?us-ascii?Q?4qeaJcsI4V857urR/Yuj/NI55X0VBnyJhPUnjShz7XBRBnstJOzElftGMwG6?=
 =?us-ascii?Q?JcFW0hIcmhQudTzIy9B1knWgsAggKGgdE4T+mFEG64jPC9A6QeYrYYRRVd+3?=
 =?us-ascii?Q?oBxuVbutENQP5nDTJl/bNNGeJXBxrJbuashYFQeIoBXq2ivUNmLvaLJnFvDR?=
 =?us-ascii?Q?PAsELSbTP/buXtUtFFiD2z2pGnKoQhrl38HAEMGY17KT6141/YCfKVufgEbT?=
 =?us-ascii?Q?rTethmcat8z5aCMcLpa4TRLauO2NoK+tPMZGbG65OE3kKhN9Ky0pKg3Y+gvo?=
 =?us-ascii?Q?ZPgK+eumEz8ZSZuXYmhIoTgTR669PnREpy3zjXkLMGI/I506Xo1YcFDguICS?=
 =?us-ascii?Q?9E9jyJ/SSr/JwDJU+zqD+x/8Vqkp5+29TIV05QFx169VGAWWTp3IVBIqSiNw?=
 =?us-ascii?Q?F/DkD+I8Q8qOShtqp2xGONAeOw805FLktlrwbYLI0975R5oqYA7UwjOgRiqY?=
 =?us-ascii?Q?O3CO7br7eS5Ugnb3P2fQmB43NtIkpHQxh99pQ2t/QprJQYiJKvC8AKxkW6xS?=
 =?us-ascii?Q?fj/Ha6bIA8ZkZIJBt9uoMCEf8YSd7lagcD1SVAGRFpgCHaSfcw+/HmydH4OJ?=
 =?us-ascii?Q?Px6BAg9wkZC0jgGgUyu8E/HDY/5y1kBck7idQP6aaizxURGkCxTVT4J1CpBT?=
 =?us-ascii?Q?yDEWK/VxwVJMDdvUS01dUcAQnMGNrhT/IgejYHREU/VQaQnXy+GYoPOxlCgl?=
 =?us-ascii?Q?VPIsqFOsTrIjdJJ0o9thGBqLJLjXpDzix2aTNEJ+tHk0N6fv+yhKf7ZEjRY/?=
 =?us-ascii?Q?cJ2ZI1agSPkIEJBGqG2ng5GV?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021)(38070700015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?no4b4biGDjLm4ozAfF4Bq822UrmnCxoQeOW/JiHs1W7in4xWd2SSsp97KDrq?=
 =?us-ascii?Q?KfRY9FM/fegt9twRoJjLkUlQe4lpYD7dB9PK6knHaH+GFbWPjv0qSTF42RqU?=
 =?us-ascii?Q?2hzS3XeHznMmGsQftMWcGHuDEbN/4GvAQy7qJF6hz+hbodKnD3uIQ2y1dNWl?=
 =?us-ascii?Q?oh/DpvKk3rPVwJX9tu/UD3esRtuQ+mVek15pHxVxhiu/DmMvHPgYM681p0Dk?=
 =?us-ascii?Q?E/+ic++bKNacrTwET0DAZlmINVECkAWFmucZr/+o6bHSTmFBq6+mjbgehejE?=
 =?us-ascii?Q?6J/H+Snz1imfIW+NDRLo8mNo4UFvI/8HocmCNFdEBIJy1/VTN2uirtXXyzLC?=
 =?us-ascii?Q?wMkfZrV82N/kaFrJYEGLO30gAQuGxUcbucTYhB9Cx5j7In25ESYk0BEHd4T4?=
 =?us-ascii?Q?MvVMWHoUyJggwpi63OKgtc4/exolYBrD2rik+Tgpr/e1uvC43iyfqP40oVCO?=
 =?us-ascii?Q?HQfnMZWzjsGX8txtmpxWYXb8YsorT8XkDy5cXLMrUTZYYplYACtlclruUOWS?=
 =?us-ascii?Q?qDdVwT3//Apn2Z4stU4/SAxnHec7EFgE0GQE1uROjpZXYkLemO0aptZSUJCy?=
 =?us-ascii?Q?xdojARrfgfCbsq3WSTlBCDPx8c+rTB0JeWAAJPXz7dAgEiRYUYqw5UsmueP1?=
 =?us-ascii?Q?a7I0HUnuh8FqLPCrdj1ocn+j/3lUHAC7543g3OcouCWZciiqNgJgKBQocO2+?=
 =?us-ascii?Q?0MHpUMCtfEGuqCQL1Uh+nxQc/UEpyb4c4wBdt3E9WnWUKGvl9lpgCKWjObUN?=
 =?us-ascii?Q?tWwM3KHmhiynKOyBqhkJ1BLNMlZWXQFjWfqdsOChUC3xCbyI2gAjiJUdt661?=
 =?us-ascii?Q?hkvktoTUC5gc2pgz2aozxTpmXUNo3+6mFqR9M+nh2KfHvmSFvlhxbxlAbZGV?=
 =?us-ascii?Q?30BxEqBsGOfdcnfmzKA+rdUgItxBzPiend63xRzlOWKSlDHItdYS0Jje45qh?=
 =?us-ascii?Q?perai/nGNZxOUUEjtlsAQT5PA6ETsYjUDPnWhDXgNeuCZ6adsDn+GCKkrpiX?=
 =?us-ascii?Q?ftlhjNav3qVqL/BXHonUcL/bBwkkZY4i84qNRBLd4XR3jZt51hyxaVkaP/cx?=
 =?us-ascii?Q?m02wRp5Qhbi904ps9kkwPbJb0Q5PIm2BfhrYuQ7I4ZurdTEogYXj/pqMyDyg?=
 =?us-ascii?Q?JwZukXsI3pf1Ifmz6MaxFLHGdJ4eyFSBfxVwLibCuHhXOFjucmpMdxUCj/2v?=
 =?us-ascii?Q?oMWSD7QQB7LkBsCN4dmjiW/UTXFlF6WUdmI0XEI/mXS9F3TrAhcqwRzUFAd3?=
 =?us-ascii?Q?o4+LUzwMmkXaeIC20yFHcPyZhdqarZG/iyfhsQ2PG55P2EIQCpdKoEVcJAIZ?=
 =?us-ascii?Q?5iFI+JlWnzq5VcfsS5SNO96pILEJyb7hCvEFLFTZjCG1g1GCq244NJDglULj?=
 =?us-ascii?Q?Kd7421gCRufZY33MTikO6Fl6CYf1FMW59G9TDibGLnEelWGYFuuW/z2AXM+U?=
 =?us-ascii?Q?nqMXjbUqkkzkD9vwXI9LBMWOUWeCobaMinRkHja2R0wJwgx7hhZoroN0ESt2?=
 =?us-ascii?Q?MhzsoJM71j5kVdRmmbwVGjincEI5kvWPH4ur4crTCqgUtPlMXo7qJbSj4rmL?=
 =?us-ascii?Q?um28igC/7L19dd+X1KIMXzF9T1e8Pf142rrUzhtjQg/5TB/MQcFYpgjvJsk8?=
 =?us-ascii?Q?wA=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 3eqpQcbleZk4q2+J06dySCpV5R5lDWJ6acJ4jYmjxzXmGuMMXAaI5C8FJba2Bb62OueLORia7omy5lvFCv03HD1djRb3fPstAHtrHTb0FLGfj+1RmvR2nVgnoUstxB+HB0jKlCA0Z0c98Fl69isDuy1VR1vhOHI40BOiVLkFl3wwPUVtKa9f9oSadtV4lLf++J22EyB68uje2/h3EmFhRtDnmqTbQ1vHojVUhomK7wqRLQJCdqjoS/SYArlsrRkNfIu/5zmdKH0yNPTGwsmJcCE6WCi4w2LYDCafHWyhPyEbQH4vF81voWz7uczGnnpTuaM7Gj7sWIgXfv6sIhJ2YHCZlrtoLH816QKtFYARJOFW2jt9EHIkPJnNeyN5TPDCWmGb25hVt/rt3uI8/Vf+LlK03J/H+U0zFiRvi5T2YZLDthx6I0FJ34csksUF0Yv7wcrdZdvrIrwOGn/kgVqiBX0VNAnwraRCyhv7E6Hu6PMA1KQKCWmyFHTwJk1gOyTZqr49Xl8bytlGYLzY+dltHGrMEohSSj7DvWsgRux01Lh/kbfxouBpyLPDS8c5CelWy7RHFYsLYXGihCDpLbjDXg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 619fefdc-01bd-4a3d-695e-08dc910af0bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2024 09:25:35.3974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yyMGc87jg2V6+N4xfWqReqptphltaxg/qlx10sp+YcWC4e4AC+2FfPmaWMpp+8kpIfKCl2hXgeNryrHhdVcPZb374LOdOOQfLgMMYPhdp88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P250MB0366
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneOriginalCC: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1p2xGXBfTIEKpWY03/s5o5+umNCbFRZSo+/+fWsUqTY=;
 b=PZ+D9lcDxUVjtODTh8nJdQp0PM+ahnh9SBn+RJAadh2NtC1L2n2XYTMI8MMBBEA2d4JXJgxcjaEqxZkJ5CtiVp8JYbaTDqzrOtwdvTDCLmIIXwnaGrd1haJkk7xeNVeTWWqVuElFrdLkFah2RU7bYdATPZpNnHJdymRRQE+nqXw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=stwmm.onmicrosoft.com
 header.i=@stwmm.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-stwmm-onmicrosoft-com header.b=PZ+D9lcD
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH 1/2] package/libzenoh-c: bump to version 0.11.0
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
Cc: Michel Alex <Alex.Michel@wiedemann-group.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/eclipse-zenoh/zenoh-c/releases/tag/0.11.0
Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
---
 package/libzenoh-c/libzenoh-c.hash | 2 +-
 package/libzenoh-c/libzenoh-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
index 559c9122ad..66bb5282f4 100644
--- a/package/libzenoh-c/libzenoh-c.hash
+++ b/package/libzenoh-c/libzenoh-c.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c86e468527e573d92b01bf454333dda4dc1217f14d5d5f94c24311961313c234  libzenoh-c-0.11.0.3-cargo2.tar.gz
+sha256  cf8ca9382a17564ceedadf8fe574cd7c73440cd298d2adfbe88fa452427f8526  libzenoh-c-0.11.0-cargo2.tar.gz
 sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
diff --git a/package/libzenoh-c/libzenoh-c.mk b/package/libzenoh-c/libzenoh-c.mk
index 07c153e328..6dd79f3727 100644
--- a/package/libzenoh-c/libzenoh-c.mk
+++ b/package/libzenoh-c/libzenoh-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZENOH_C_VERSION = 0.11.0.3
+LIBZENOH_C_VERSION = 0.11.0
 LIBZENOH_C_SITE = $(call github,eclipse-zenoh,zenoh-c,$(LIBZENOH_C_VERSION))
 LIBZENOH_C_LICENSE = Apache-2.0 or EPL-2.0
 LIBZENOH_C_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
