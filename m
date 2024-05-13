Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C399C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 08:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01C91836C5;
	Mon, 13 May 2024 08:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NBdQeeTcY4jU; Mon, 13 May 2024 08:48:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF717835A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF717835A9;
	Mon, 13 May 2024 08:48:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4664E1BF86C
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 08:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FF4F608D4
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 08:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E9Urc00-E3yu for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 08:48:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6CA5F60889
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CA5F60889
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CA5F60889
 for <buildroot@buildroot.org>; Mon, 13 May 2024 08:48:14 +0000 (UTC)
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 13 May 2024 10:48:10 +0200
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 7CF5FB5ABC
 for <buildroot@buildroot.org>; Mon, 13 May 2024 10:48:10 +0200 (CEST)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 8EDFFB5ABD
 for <buildroot@buildroot.org>; Mon, 13 May 2024 10:47:57 +0200 (CEST)
Received: from stwexm.stww2k.local (172.25.2.110) by stwexm.stww2k.local
 (172.25.2.110) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Mon, 13 May
 2024 10:47:57 +0200
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (104.47.14.51) by
 stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32 via Frontend Transport; Mon, 13 May 2024 10:47:57 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBSDrN4rqtl8QsII0IgwdvIX+c6DYQAEQ4Dn51DACTCOzKhzIfnqh3svqS+7F3YjS8T9+1C6XjZgI7F/LOpUipuIP5nt7OACfnjeR1FIM3AqxrEE6wPlaRTiyjQv0oySNQEZdF+YMLeKWBm+lJTPS0wwtD8BdBb4HSo0B9NW/ChtCUB17hjYaUxEQ+5PwZO0q21F62Rrz/lvm0Ud7BfdUwxg/oDIDXe0aJ0b+MuizEWdb/Z9YNI9SNr2150rFcNyY28WypbYTIUTnDW/Rh3b7vwsBmWHjlc0UTZ/jLlggamyp6f3VFVPwsHt7+73q9vpMGVRXSZU7L/NvzooVCBIAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/omKgV5Q2MjYR+kIsRiBM7Nwaqr1nHI0wo0vnNiw6A=;
 b=eHIvrdXjVbqLpJ8bVOUOMoi+HVAKOd6+dzdQbkLzpJ5S7m6twX0qflseo1GKfMRAFx9QSEOPdp2ZiJI71ZEApqPDsjo6FhXFt3/R+rTn5BBycSA9yAfrBzA2LOvycIs0vtfyt+l5Ui5W8IbI1l7JULLhwAleXuHuTG4p+hcq4x69UPqjQZ1nHoC5Zcd+Jh+tf6Ub32osXokcZAMhz2VUJIsQI7pZPWGAypEM4eN/veiLDvV81NOkpbORpPBgdjayKuXsmSEM2tbk9gZ4GkfYpDqHi8uLyceeagHtkrlVXb53TpUKJlY/29Ewcak79udg/WOW8qKk3+C4a2lJOoV/Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by AS4P250MB0533.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:4b8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 08:47:55 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2%7]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 08:47:55 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/libzenoh-pico: bump to version 0.11.0.1
Thread-Index: AdqlEcIZgURe+ofCS/+TzAmL5bz5og==
Date: Mon, 13 May 2024 08:47:55 +0000
Message-ID: <AS1P250MB06087BB3F8FFBDD7D73C1436A9E22@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|AS4P250MB0533:EE_
x-ms-office365-filtering-correlation-id: aea788c2-6090-42a5-bdf9-08dc73296201
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?ATYkLOa6aEiAUgXMRkxxMwQyaP+NI1HUUPQUDbJ3oX2nFMJdyznK7MU2lbAD?=
 =?us-ascii?Q?aFDGR9fZsmJvu8u6WHFPtjtUbLgo5dTl2fSvVby6g7ngcCx7mMjj9OtDxl6a?=
 =?us-ascii?Q?VJ252mmyTyr0HKtGCU3Jl/fW3sFMDiiXxCbsQWU+MZIbqWU4zl3fc2b0GS0A?=
 =?us-ascii?Q?5/78x2jf/SUZjKKM+3FoWJFSuI2s3B4RoOj2qWGMeArzQTMUM+GayKiudH+L?=
 =?us-ascii?Q?FXX2FdvJDJVaAyzokU1p/ABY7dhRKqvKao1J6NZjNnxCOl3O7oNbc9aJoEKm?=
 =?us-ascii?Q?unmHpChsm1b0JtHjvrcVP3geHPvLBs2c0kWTUMeQn9xblG7mT9IzezU7gUhT?=
 =?us-ascii?Q?tw3hsQKoZUYZtDWRpveuggC7SpT1FPn7oXaYDr6zYjecypP+c8hQOdSsCexi?=
 =?us-ascii?Q?sc/qt4u4mE3c86RxJLv/aHeszaQ0OPPi42CqMkTNNup7xcie/jGmy226NFLp?=
 =?us-ascii?Q?LvPkG/K815OMEWz3PrugYUOArrLXLmdyyRBlAzSQJEMXWiWkAP0EMVE4yHTL?=
 =?us-ascii?Q?AVfv7g1SisogkX4DyUv2RHrbiT5zDdOA/20QA7TuZfnYgf1y1MfRDPc4wkhs?=
 =?us-ascii?Q?Z84Z13au6ncjR8H0cfP3xsbtz7vLcnkl7jhh/D2clkFTts06YoUIHVdHyULR?=
 =?us-ascii?Q?+63JV+8xMQ3S6E19ob5465CtUtB6AESL26sBtZlcFeWusoMh/zku8mQeFgSw?=
 =?us-ascii?Q?PRQh6NMke586JD5G5NVgCw3MGBBFU5Nc83/uccE5RZ0ZcFQdfycPlE9n6oLk?=
 =?us-ascii?Q?NmSzhPIsS6sIDyEXlswGZEoHiy3wq/q7YwHnpniMwfQHgOhImPRxMpQt3txL?=
 =?us-ascii?Q?bQcRjfllHphkMh79eZpoXyrLqSmbe6FRV1IbzkGUPapDAHIivUciD80cE+Wn?=
 =?us-ascii?Q?9lrBAq05nxffCF3uYsDUrkGfOjXMCoQliiRFQT7PIkclFkPfixKA5yGe+12X?=
 =?us-ascii?Q?8URY8PzDhMNrHLi+7vrdtVGis45Q3cyukha03WV1I/GMyFPeUEPUQJC1bH/X?=
 =?us-ascii?Q?se49zjNp3MGG052M5oQ9Oqw18Jmf1/U9IgiL5+fPFie8hZYw7B/4KfBVwegZ?=
 =?us-ascii?Q?EBWtmwao39HwFIkcRsbrhDiYKTYyntMlxCmRjtoqcHMl93RpzgMtWRfy70Dd?=
 =?us-ascii?Q?pJbOBKBlslPUPWxbQMZYN06STvXALdWce04wwjz0S73G7fk3Ssa9PSAZAh1V?=
 =?us-ascii?Q?E53vy/FNSnJ1pjzbmYv9tZbhiT6yoqkOnYCgnqVTDAJgqqChrii8ZIngqiqf?=
 =?us-ascii?Q?FdKyK7sP9ToEn3KusVRRLA5nD265mw8H6UN1gra+PA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gfMIIzsE4Buwa7QzSQc0hvcL37MNkerxfZU+7K6KsTlQ569Oa7XBil0Gv/GZ?=
 =?us-ascii?Q?qpw/AzbFDbgVJMvLHI2VCZYe6O+k0zDbH4WT1eQwv5Mt7J51VYe700JYZXaZ?=
 =?us-ascii?Q?d7MZr1fLJy/qvEiDhVzc3IOdaVNQjhFO1w4QeJKPxtn7zhObGhtQBQ5kjAKv?=
 =?us-ascii?Q?czrIlAwXP3vt9OvfQ/MyTDkJJTwHf3nsnkM3UYjOqHkvFMSFXOfFjQ+tVI4k?=
 =?us-ascii?Q?ySQAGvlO5YKuZG/t2tIJzd/pRgpdqQAaHj9OE1PMMD/XCaviQVtGM0Ln9AFg?=
 =?us-ascii?Q?qs+N2PAE0rTT0nJRK0D6GiENV8HK/2xVsMDghBNiEMeiByXEzTolkQpON5Tp?=
 =?us-ascii?Q?9R6HnIxAM9MoAiF2YCsGtPIt8blN5s62Jm0guNpCp9+m+b851XqoGVLMjH4Y?=
 =?us-ascii?Q?CuVDihgkY2QelokX2ciQ2TL53Qe8NcDuQYrSniIKnr/LLwztZS5QUkwTdYqs?=
 =?us-ascii?Q?NlmFwSubZWfS7CbA+KuSzKrSNgOJ+9PlHDlBUqU/i+Fbzx6laWOTyCsOA4rb?=
 =?us-ascii?Q?akRUvJtEiHkO1OydCbUdDyrbQCU9udhQxWL0+7kKlE8244N88gZLc/l9GwJV?=
 =?us-ascii?Q?XC8rtoc08WE0IbyUF+aeZJ7+QQPdo9vCDTNsKWZoneNNzX43JqY2qckgOLu7?=
 =?us-ascii?Q?XI4FTOZ9jNFbeoLwPD3ICGLeCP3vQ1pIS5RAR0pnT09xsnJ60veMLt2iUXaq?=
 =?us-ascii?Q?ivJioqcNI62vqSfNWmwa+sMRW/SwA7+R1OgFsDT+YMFq5HxkVyLasTt4mAa2?=
 =?us-ascii?Q?95NboGhx9amlqOOES2oEiI+CixdJuRV4/UpsovHHajJ+fPP8fa2l62C4g+d6?=
 =?us-ascii?Q?1Tiwzb2wuIvzo4I8W6YjJXvvidtRl8I4lcquXXipxx52GK9uZSrmzsJ8GtIQ?=
 =?us-ascii?Q?2kUcCaOWC7snx9yR+ATGuFIlomHGQ164USaeuGXKWOlelqo7SCmSJhCE/kuS?=
 =?us-ascii?Q?l3ALq65VKN7w1JcOpuObV10Z4aX+vG4WHBfpCXKdW47fEQ0iz6SOY9RbP3Vp?=
 =?us-ascii?Q?BsJFa82kWvhHwH8QxJM/Oq1VZE26ohOkv12O/9v4VbAmapLEM3r82mRj3D5h?=
 =?us-ascii?Q?mXJM6et3FuibEAs1sMWKQfJxh4VyC/Q/kHb/GzNsR/9wVvbR6gZZZ1x+tUNF?=
 =?us-ascii?Q?a03h34uPr0z+xOsIyHQ0VbI1EoVRhCn4y32okR+BBNjWmd+bOMC8KxY5s1Pr?=
 =?us-ascii?Q?WzjTWoltmEEcaM4KqXfHQ+oKFuxxpGlXsLRCC9l1d4Cs2YdUDoDtYvm9AGjE?=
 =?us-ascii?Q?bcDG0Wqzyvi0+9OM7PL7ehn7cET9IN6dV8DIqEj43/q8IjtZuNGtAZt4YD4u?=
 =?us-ascii?Q?u+7tDcATb2oryS8ZNYg9Uie9H5J8oxvnWtukf1cIx4k59MOHUacVQzzHPoDc?=
 =?us-ascii?Q?BscpPamOfIG9veQK25pNcXGv7GpeGkQc0GG8Z+0Bg4AFWAtMuwwNJfr7NDpq?=
 =?us-ascii?Q?mMUjdeK9LxdOoWylPvaIUxEvBTZCPtQrm/iVgOM2IpRMCjLkUHzPmn0g8rm8?=
 =?us-ascii?Q?a7lpIw2foU56dDBwqT4eXzM4QdCgTxZBAnX6ihyT6x1ydeU33TI1HdkL0I5q?=
 =?us-ascii?Q?ON9NPDVgolQzDJY9rVPKkDOCVGjbdu5RSCEHzus8ADWvYamC5Oeb+lbHFZ5I?=
 =?us-ascii?Q?rA=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: U0Anh2CLENRa7imgnBWvxIdAAY85LYy0/6cY2Od9WfT4ik8il+7kmnpRPm+ph+E1X6WafHXvfQ8Y6C3GI3742RRq3LvPA6bG0oj5Yr0ILJVPYAQgAH7QvwEmjLxuMbTRovjsqaCbgN4hoSRH7uwAdzIp4MqR5mK78Dd+EYT2yaUGRpVUO9HsjFR0JQ0IUN7hf+VZOYiqEl/sgBbzXZQy7C3YUdr2XiO0R+WpoqoM8FQrpMk4apyBJajH78v0FSVYktslkIA4lP2+IjmIQ6qBY1+s0SY1ukbrThq5HkCMg94GLMC2XTgNmLnGqeOcqSf8MfmbJMvH0CBzULxSt0im/J7qMH2VHQ1W0GXRBNPMD2dCDufbfHhIn+2i6CCOeew2phGwvQU9rGSzoi1O1cc/nYV8FTaP9+Ir5Fbk1blMlBCeIuhhyTbYIjAkXQTCjbKZOKI3xSBrCfIH84lGMBEGGH04GYk0gCE9YUW0t3IBc0XczlcYO9TaytmrR+qaah1Ho1zXmMqn0uozPcYo9QLlsxxVjxH/PnxOQOp79NJdBbgkigHB3wlxg+HgUGmcu9MRZnaEY6JzINhHHQL54IfldA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: aea788c2-6090-42a5-bdf9-08dc73296201
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 08:47:55.4158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ftfy7cT8S9hOg2ABkHJLhSXp003h/y7R9dRDDBPLF2Ps1i6ux/csfa/ZaF35eYBgzefud+HCl68nsgnx+R/nAPBcifAgPijY5+hU602Cmis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P250MB0533
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneOriginalCC: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/omKgV5Q2MjYR+kIsRiBM7Nwaqr1nHI0wo0vnNiw6A=;
 b=AbbgnT2NthaFbcZ6ixNrfzIS0aWjQwic9obh+Pmrl8M7sRZe9CQZQTaEB+GsAP+bPUs1LaM/UnQxAVKZwv9DeWNpoNsYFvNmk9/mofpAoaq7J+GzK86X0EGlZDmhY3okFGf3WzCaCBy5qzxBr2SdFNVtSc/VK8QUGhkFmpG3CYo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=stwmm.onmicrosoft.com header.i=@stwmm.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-stwmm-onmicrosoft-com
 header.b=AbbgnT2N
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH 1/1] package/libzenoh-pico: bump to version
 0.11.0.1
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

https://github.com/eclipse-zenoh/zenoh-pico/releases/tag/0.11.0.1

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
---
 package/libzenoh-pico/libzenoh-pico.hash | 2 +-
 package/libzenoh-pico/libzenoh-pico.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libzenoh-pico/libzenoh-pico.hash b/package/libzenoh-pico/libzenoh-pico.hash
index 98f804508f..945d0f9aaf 100644
--- a/package/libzenoh-pico/libzenoh-pico.hash
+++ b/package/libzenoh-pico/libzenoh-pico.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7b615515ac844470ec7806921e8106b2923f6c43e242b34f062954de7560b799  libzenoh-pico-0.10.1-rc.tar.gz
+sha256  c259da44aa919919d1129b6a46edb05e2f5f2bf2818f73c27f515e443da9fc83  libzenoh-pico-0.11.0.1.tar.gz
 sha256  d386df32cf327bbb25abe894277d3d7e0f447bafc59f4ad362615b0136f30db5  LICENSE
diff --git a/package/libzenoh-pico/libzenoh-pico.mk b/package/libzenoh-pico/libzenoh-pico.mk
index 90dfda6c98..86204de14f 100644
--- a/package/libzenoh-pico/libzenoh-pico.mk
+++ b/package/libzenoh-pico/libzenoh-pico.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZENOH_PICO_VERSION = 0.10.1-rc
+LIBZENOH_PICO_VERSION = 0.11.0.1
 LIBZENOH_PICO_SITE = $(call github,eclipse-zenoh,zenoh-pico,$(LIBZENOH_PICO_VERSION))
 LIBZENOH_PICO_LICENSE = Apache-2.0 or EPL-2.0
 LIBZENOH_PICO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
