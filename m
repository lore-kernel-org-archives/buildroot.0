Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E782C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 09:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D598E4014E;
	Mon,  6 Nov 2023 09:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D598E4014E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6FeXZYAFS0wd; Mon,  6 Nov 2023 09:53:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A99041173;
	Mon,  6 Nov 2023 09:53:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A99041173
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6BB81BF488
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 09:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBA6641F3C
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 09:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBA6641F3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GqVp3Zxo_5G5 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 09:53:46 +0000 (UTC)
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C74D541F3B
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 09:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C74D541F3B
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 06 Nov 2023 10:53:42 +0100
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 52AA3B5ABC;
 Mon,  6 Nov 2023 10:53:42 +0100 (CET)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id CF9A5B5AAC;
 Mon,  6 Nov 2023 10:53:32 +0100 (CET)
Received: from stwexm.stww2k.local (172.25.2.111) by stwexm.stww2k.local
 (172.25.2.111) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Mon, 6 Nov
 2023 10:53:32 +0100
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (104.47.1.50) by
 stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32 via Frontend Transport; Mon, 6 Nov 2023 10:53:32 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQPOIbKJ4d6d+ZKacLO+8PbjBDTgWwY1myQZSUAYGyz4KYxsbzfI+u6p9Uio7HN+RCCBlZMSgrEWODmqbdAZYPrFvFiuWF5IQAkgjGe1zVuv/J2iMEsKa8354dFVhQyINnE/a5zGWnJ4ZA9vnmBjF6PAPJ4EqLx17SY/X8mgsGNrhHlRTyq9oya23NBZB7nUq9Mxx7IDxWx+gFIP01NMyHV0dMmQYYT+L5xPRCgMLQcUJGsenvLu5ISW2Esa0wTVFT9P2vqb+7FBH0lycmQ/WMmp+fWsk8zCOyzZAjQ0HcIhXFUWTLVmyPHYMM+REmSHeoUuYnPl0+J48x9Z9HzkYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJoOSPQlKelhK5lFScr7MRJ4PDZzs+4oK/OVUISaGOc=;
 b=ogLZgrMs7fpYxXebAf9tfZHYirasPFkj8PkXgehRgchl0AMG9xsho0TYlN0tOob1A4oei0KZVTl+UJIqte30XP729bWk7FVpQtKBwFMw4AmhxvE5+5s7nILpok+TybUS4cOkhInSQ4TP6tmJZ3rU/4B9qKGx2Ndfr5qCt6HbqUEfwIRwnjWLS867tcPt2ERK9WMN1CGc0fT2qM8C/f0GO+uSz1LxNFIhKxlXEmgXAY1CBey5eKsK18xiqTYZZbtznLgJblWtcYTjc0zsd1oJ+sBNirEcgsrKVyJSA7NLd+rRHhPxb35+LTutDs40yVmUjkSUMDlMdRUyd5PJO/OJmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by AS8P250MB0361.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:37c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 09:53:29 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::3848:f440:3c65:5e82]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::3848:f440:3c65:5e82%7]) with mapi id 15.20.6954.028; Mon, 6 Nov 2023
 09:53:29 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH] package/zenoh-c: new package
Thread-Index: AdoBmyBiRBd8ExI3RsaabYoZQ4UY8wLUEUUAAOnpmqA=
Date: Mon, 6 Nov 2023 09:53:29 +0000
Message-ID: <AS1P250MB06086CD15C0B581F84F7F00BA9AAA@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
References: <AS1P250MB06088E27875FEBCE10F3B5F9A9D5A@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
 <20231101184652.412eb9cb@windsurf>
In-Reply-To: <20231101184652.412eb9cb@windsurf>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|AS8P250MB0361:EE_
x-ms-office365-filtering-correlation-id: 54a92ba5-5752-4927-b823-08dbdeae3ace
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CqWDkjohZ+DikFk25UBW7k79ZY60ivmScW2tE4rlUKpkXQwreXYAdISUZHB8DuNFGClUgu5M8oWpPq+sUC61K3W0BxUfME+mvy+8a+Si+zJQYOOT6nrMQyhLBnDr0GbYFmswegVq4CbGg8uj+eZAlA9wLqSInZASHeQV2ck15v7QGeHY82PAUoqqx3mSNP2F2InJoTJByJCvqXkhG9MmNtDWkGfppzD4tImE6YR+88JzHpK6T5Xjxv1kXrRpmN2K9pbOs31jsJ/9CM1hC6F7yadV6TwKoBV5My8xH1H2NLa44SjHAtCMcy4KTPpVwoME+xvA++SW9lWjJ4Sop6REe51ECsDFObgxAaq2JNMJEjXEn0SbRz4LzmJ95W97WU4vyf+RRoQ//E/MSPyoM/i0k64FA4xK5zndbNY8Ft9n9ccovIiJ/TEIPToAaHqCdyHIBjGuUEMJSJ370Us5b1bvGHieSUdaurCVwYfjNDgXC2yrLeJLTACxHKd4be2Q99kwQE/84ijK5SHk4lIO84b8uDQr9GiKw4Y6TsF4cqjveVI2Oe+zc83pgwExbas8THGAleQT3ENERENPqc883JCpwEqRqrCIMsHAWetuvxWVFhQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39840400004)(136003)(396003)(366004)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(38070700009)(122000001)(55016003)(6506007)(66476007)(7696005)(53546011)(66556008)(478600001)(9686003)(966005)(64756008)(76116006)(66946007)(66446008)(86362001)(33656002)(71200400001)(26005)(38100700002)(52536014)(83380400001)(8676002)(2906002)(6916009)(316002)(41300700001)(5660300002)(4326008)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUJYaTRnUmVza1NBSUtiUXpRZFFXYXFzZmExVEtwZTFWRTZtb1BhVmYvRTJN?=
 =?utf-8?B?Q3g4dkJPKzFZOThybUN2QWpET3NvTlA1ZmRWRDh1eFZpWHFxcklnOWlYZGMx?=
 =?utf-8?B?ZlF4c3ZNT3NaZ0RYNkU3c1BwMEtpY0hxbm1CTzJwa2Q3RXkxZ052YVpNZGRj?=
 =?utf-8?B?cURkNi9WZkVwZ0J5Q3lRWk1CVzVqQmZJVW5lelFBNnpUbFM2aEk2cG5JSWN6?=
 =?utf-8?B?RUFXd3FOWUxHRnRWeVVTMms2WVJ4Vi80THlDL2VLM3duNFhsYkltZVVMbEQy?=
 =?utf-8?B?MjNRYm93VWNnVDV6T2FzTi9oN0hPcVlBT1dYaVR3eG1hcCtwbENQWTZmNTRD?=
 =?utf-8?B?MVUydURMdkMwam5zajdWY2E0ai9ZVTBrYWs4VHd5M3hTYkdSaTBuVHNTcWlX?=
 =?utf-8?B?L2dRMWJnR3VZQnNJb1hMcXNEMjBXVjQ5SWpNTWJzbUh5WVN6Vlg4cWM4TWk2?=
 =?utf-8?B?QlN3Yy9jKzZZNi9jVU52VEEzN2VzVzI1ZzJUUWdpZjI5REZUWC9nK25xMENr?=
 =?utf-8?B?a21oWnVERWVST2c0eUJrMFNzc3FLV1FySmRQUm0yZFZzZjdxVnpkNncxbld6?=
 =?utf-8?B?d0ZHeEhwUGtiaU9TZmEwZnN4RWx4VUFYcFpvZlVhRVJvTlBqMkh6OU5IZ3BW?=
 =?utf-8?B?MWdsYzNmTUZHMFVOM2ZoWncwM0UvRUtSMVI2MDhqVXA3SE5uSzZGaDg0dWk0?=
 =?utf-8?B?aXYwQ2x3TUZEUHZlWlN4WHcwSjNna0tyd3hWUGNGU2dNQk82Y3BWMG1GanNH?=
 =?utf-8?B?QXlvUVBTUTNFMkZqdStHYTRzWmlaZEcxT2JRNjg1cmltd3BKSzZlM3EzU1l6?=
 =?utf-8?B?aW9mcTc5RDl1VFp0aWZUMXlUN0taQXBubnhkVWdpTkNoU05NTDF5OGljSEha?=
 =?utf-8?B?QWtKVmgvZG5ZcnFwc2Y5cEhjRG9JWG5HZ0pjR1psWXk0RjQ5enRvcjE3RnY1?=
 =?utf-8?B?bEpBeitJdy8vY1FseTlLNktZUldxOEpPYXJ6MEkxQkJJVGNoekU4enlTRU5W?=
 =?utf-8?B?cyt3Vk5xbng1Z1BVNkZaMGQ2ZjZUSHN1b0ZZeGlveUkzWjZUT05HbDdQcGRp?=
 =?utf-8?B?ejFxMkxXR0Q5akxNdzBORW1JWTdtZWJobFh6VjhFUmgvdU5JYnJyL3VQZkpz?=
 =?utf-8?B?OFpzdkwzUEZZTDZ4VVBWSDRUdllyRW96ZzJReFpmMWt5WmhuU2dUYWh3MExL?=
 =?utf-8?B?TWo5VUU3MzhJRjJ2cW9wK0MvbnNSMWVLZGNXOWsxV01panV1TFB5cXFGV2Qz?=
 =?utf-8?B?anZBdE9hTzNSbExPNTVHS3o1UUNJT1AzRzFJYWtiZVIyeEtLZnNqL3NSaVpK?=
 =?utf-8?B?UGxLcjRRYllFVmtlb3VPaHZXOG5RRVdNS2IzMDZ5UEs0NENnWCtXRTZUOS9x?=
 =?utf-8?B?VHpRbWlVS3ZNd0l3MndWUk9RaWxaVW1XalVWbTVublY2WnNncU5sS3B0WmFC?=
 =?utf-8?B?MWJwKzBjcnpVMGhQL2g2eWRtU2RaZzRiYkZCMnl6L3E2RFI1MTNjWVFFNytJ?=
 =?utf-8?B?OWNxckRNaERLRTVQbUJSMWtpYjk5aVVWM1Q2VFROYXlBemJ1YnNwUHdiTHNk?=
 =?utf-8?B?cGZoRy9zYjJPNjFMQktrdTNtSE9tNlkxNEZ6VWpFQTJGekxBdkxmZkRwZnRF?=
 =?utf-8?B?Mys2TEl3OW9kQmJPcCtSK25kTkhJSkdGWWdwbGJhblpBK0l5bDNmUHA0V0hv?=
 =?utf-8?B?TGJXLzE4d1dxWmY0KzFzemZrOHo3L1lGckJ1SUVyRjlqZ2l4amdHdHY2ZWVU?=
 =?utf-8?B?M3UzY3NjQUl2MDNFTzZEMWdxaFF2QjFoQm9kNDdkb2lXcmtFbmdUS2ljQ05h?=
 =?utf-8?B?YWxIYnR3aVlPc2FaZStXZTBoMzd1UWkxZGlMaG9HZXo0UDZkc29HSUM0WEJj?=
 =?utf-8?B?akhLZ0FnRWdFenkrSXdWdVlKbEUrakh2WkIrU0Y0bnJBWjFwdFpiV2Q1WCtl?=
 =?utf-8?B?aFBYOE5MMTZoZGRhTnNlclZ0Tmk0blZlcXBPeXg3RURSTUNyZmRiZ1lMWTNX?=
 =?utf-8?B?V04waXFDdVJnTHJFOGZxRzRwdVVMVmpWcjRRNzN5aDJnbVE3K2hBZzI1aHNp?=
 =?utf-8?B?ZXA4K09ISkVQamRKbkZyK2R2UVJKZnFnWnY2bHExRCtGODVVNEZQV0RjaGlz?=
 =?utf-8?B?RVVYVzN5b0NHNmlUVE55RFphZXUvMGZqa1BhZjdSUFF3eEhpS0VCa2dlV1ly?=
 =?utf-8?B?b1E9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: XRAa/kXNjhW6obsEpQmBg1PP01w6qOPAXsofiW34gFh/l8A7YQRVYU9gLxk5/u6LAJkon8rgL+XuiI+Kb3jKNX43iWNdXO6UH8rnJy7wRRdNpVVQBnq/+NRiruMiDIbrgOHY2Wex1WyQoMQ+mZoKUZe7E/vuOjIzBI2QjQUunSoyoF2VgQHHvZjnbzjXXOeyd0eHGAvPHYNeRYLp/+dHVApRS7lnK9k0/7FEiB9KpVCrrelGF1KcS2VLTtBB21vy1/xv3qW8309qjyIhh8Yr5JHoYmZoSZ3HPGgu+ayVBYps42YuuecpLdo6M5G13rztQuL1XNptHxvsgCY7TFySc//SeewWmqoYrTAZ3wKpXjZKqdwKsE4VODi2WLyQsLyuyCTsWJ+G7QduhXwZuGW6d0qAVSm0qUxDPapevCHd4r6OFjNEh04UVbun8DJDo4qV4aXGVhoV0oKiTzSj8U5/eIfG1YXM8H3ni1IkuE08CDofsLz02F0miJQpmdnLdzU2ga23A9r3pBDQQ3t0xt8nrkYx13LeZpNtl+qYC3JraX5JoRxIxpTZ4KP/Hn5mF3QP595vlCBJwqhKjiKCDAfH8ajNiXImIGWrr40T9M7VK+mEqlbNbJsbOfXM7WaxQypiSIQLld0su/rAdDGAqH2dGNSHVq/ekZf54cTMYmNnhwzBoRgJ/ipN7SqPGJ5AeJzt+AGDhOojpahKwWoHec68T2VUYZZupPLDQ7YUucbMt5f2CgFAsG6qM85zUv38RfadUTK+q+FD6fSMRinj58t5dA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a92ba5-5752-4927-b823-08dbdeae3ace
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 09:53:29.5307 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GpQSBxx2neIXaFMh+JpGgMeIUiCSzar8DNhhP3TsHrOAMT2bM2dbv8XWV+Po89saWghZs8XDTMB3x6GwdLRaHfTsfxJ1HDF2Road99pmEU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P250MB0361
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-TBoneOriginalCC: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJoOSPQlKelhK5lFScr7MRJ4PDZzs+4oK/OVUISaGOc=;
 b=cH9yDnzaaOgKiQPWuMfpTsGxFtIzPfylwmVyk9+9RraadCn04HI/6pZHDzXGSB6VC30da4mUXUBZ3eTqPYSeZ5JDLEH1tL9iIGqSQCJ5NoeJY1ikUSrkhNGuRFJG4an4GdN4eYgicZkXeYdvr+5SUEILNXYvZCaDUEWzbkZrbRI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=stwmm.onmicrosoft.com
 header.i=@stwmm.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-stwmm-onmicrosoft-com header.b=cH9yDnza
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: Re: [Buildroot] [PATCH] package/zenoh-c: new package
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

I fixed all issues you found in my first patch and there is the second version of my patch in the end of this email:

-----Original Message-----
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com> 
Sent: Wednesday, November 1, 2023 6:47 PM
To: Michel Alex <Alex.Michel@wiedemann-group.com>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH] package/zenoh-c: new package

> However, I have some other questions:
> 
> - You're using cargo to build this package, but at
>   https://github.com/eclipse-zenoh/zenoh-c they suggest to use CMake.
>   Any opinion on this?

When using CMake, I have to additionally specify some RUSTFLAGS which are needed for cross compilation,
because the cmake uses rustc command to build the package:

ZENOH_C_CONF_ENV = RUSTFLAGS="-Clinker=arm-linux-gnueabihf-gcc -Car=arm-linux-gnueabihf-ar"
ZENOH_C_MAKE_ENV = RUSTFLAGS="-Clinker=arm-linux-gnueabihf-gcc -Car=arm-linux-gnueabihf-ar"
ZENOH_C_CONF_OPTS = -DZENOHC_CUSTOM_TARGET="arm-unknown-linux-gnueabihf"

All the 3 lines are passed automatically when building with cargo infrastructure.


> - When using cargo to build,
>  https://github.com/eclipse-zenoh/zenoh-c/blob/master/Cargo.toml is
>  used, and I'm worried by the following lines:
>
> zenoh = { git = "https://github.com/eclipse-zenoh/zenoh.git", branch = "master", features = [ "shared-memory", "unstable" ] } zenoh-protocol = { git = "https://github.com/eclipse-zenoh/zenoh.git", branch = "master", features = [ "shared-memory" ] } zenoh-util = { git = "https://github.com/eclipse-zenoh/zenoh.git", branch = "master" }

Please look at the 0.10.0-rc version instead of master as you did -> https://github.com/eclipse-zenoh/zenoh-c/blob/0.10.0-rc/Cargo.toml 

zenoh = { version = "0.10.0-rc", features = [ "shared-memory", "unstable" ] }
zenoh-protocol = { version = "0.10.0-rc", features = [ "shared-memory" ] }
zenoh-util = { version = "0.10.0-rc" }


Here is the patch:

From 9e7425a785d87fd177a0541802b24772df3fc466 Mon Sep 17 00:00:00 2001
From: Alex Michel <alex.michel@wiedemann-group.com>
Date: Wed, 18 Oct 2023 10:05:57 +0200
Subject: [PATCH v2] package/libzenoh-c: new package

This package provides a C binding based on the main
Zenoh implementation written in Rust.

https://github.com/eclipse-zenoh/zenoh-c

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>

---
Changes v1 -> v2:
  - renamed zenoh-c to libzenoh-c
  - added myself to DEVELOPERS
  - fixed LICENSE
  - install shared libraries to staging and to target
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/libzenoh-c/Config.in       |  9 +++++++++
 package/libzenoh-c/libzenoh-c.hash |  3 +++
 package/libzenoh-c/libzenoh-c.mk   | 26 ++++++++++++++++++++++++++
 5 files changed, 40 insertions(+)
 create mode 100644 package/libzenoh-c/Config.in
 create mode 100644 package/libzenoh-c/libzenoh-c.hash
 create mode 100644 package/libzenoh-c/libzenoh-c.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ac277423a1..08c3d9a5a1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -75,6 +75,7 @@ N:      Alessandro Partesotti <a.partesotti@gmail.com>
 F:      package/oatpp/

 N:     Alex Michel <alex.michel@wiedemann-group.com>
+F:     package/libzenoh-c/
 F:     package/libzenoh-pico/
 F:     package/network-manager-openvpn/

diff --git a/package/Config.in b/package/Config.in
index cd687a682b..af1ee30585 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1996,6 +1996,7 @@ menu "Networking"
        source "package/libwebsock/Config.in"
        source "package/libwebsockets/Config.in"
        source "package/libyang/Config.in"
+       source "package/libzenoh-c/Config.in"
        source "package/libzenoh-pico/Config.in"
        source "package/lksctp-tools/Config.in"
        source "package/mbuffer/Config.in"
diff --git a/package/libzenoh-c/Config.in b/package/libzenoh-c/Config.in
new file mode 100644
index 0000000000..d22807c047
--- /dev/null
+++ b/package/libzenoh-c/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBZENOH_C
+       bool "libzenoh-c"
+       depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+       select BR2_PACKAGE_HOST_RUSTC
+       help
+         This package provides a C binding based on the main
+         Zenoh implementation written in Rust.
+
+         https://github.com/eclipse-zenoh/zenoh-c
diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
new file mode 100644
index 0000000000..4a7da25233
--- /dev/null
+++ b/package/libzenoh-c/libzenoh-c.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  43c77a6768439681e804c8f02627dcb293f6ebec22d5c67ceb50d42f6c7badda  libzenoh-c-0.10.0-rc.tar.gz
+sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
diff --git a/package/libzenoh-c/libzenoh-c.mk b/package/libzenoh-c/libzenoh-c.mk
new file mode 100644
index 0000000000..b1452c1a97
--- /dev/null
+++ b/package/libzenoh-c/libzenoh-c.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# libzenoh-c
+#
+################################################################################
+
+LIBZENOH_C_VERSION = 0.10.0-rc
+LIBZENOH_C_SITE = $(call github,eclipse-zenoh,zenoh-c,$(LIBZENOH_C_VERSION))
+LIBZENOH_C_LICENSE = Apache-2.0 or EPL-2.0
+LIBZENOH_C_LICENSE_FILES = LICENSE
+
+define LIBZENOH_C_INSTALL_FILES
+       $(INSTALL) -D -m 644 $(@D)/target/*/release/libzenohc.so $(1)/usr/lib/libzenohc.so
+       mkdir -p $(STAGING_DIR)/usr/include/
+       cp -dpfr $(@D)/include/* $(STAGING_DIR)/usr/include/
+endef
+
+define LIBZENOH_C_INSTALL_TARGET_CMDS
+       $(call LIBZENOH_C_INSTALL_FILES,$(TARGET_DIR))
+endef
+
+define LIBZENOH_C_INSTALL_STAGING_CMDS
+       $(call LIBZENOH_C_INSTALL_FILES,$(STAGING_DIR))
+endef
+
+$(eval $(cargo-package))
--
2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
