Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262A1C54E58
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 09:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2B9E402C0;
	Thu, 21 Mar 2024 09:03:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sT44lRkTJy3V; Thu, 21 Mar 2024 09:03:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 260EF4026E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 260EF4026E;
	Thu, 21 Mar 2024 09:03:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 914661BF34A
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 09:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E1DD60E29
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 09:03:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K9uL0rnvx9Av for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 09:03:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::601;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 860FA60E26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 860FA60E26
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::601])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 860FA60E26
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 09:03:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyMk7c5cwsDypHtK9F95asIzRUyH1D4KgBebE/X2MeqeAqpYPafH0qi+zfE0/CrvhfB4lmZ7dWyapbyjjm4nT201k1sFUGGH7wYDoNd/d6CGMvLS2OP2qdUplRJMHFDOW9UE0xMtR4YmdY+T0TVo1IDab/kvEoYAbj3MsblJytWtoRSW8cwLoMaXSiaAgprhGKqheh0k/Pg6p+BVFqY9Bl1Yrt+Xbij01xRkkgmCbKtYaPQzxH2Nw5rXl8n6R/CGKvaGm0GujblU5N4dVNKsYW16K/qlziseW4rHxq1Rw76CJ+SLCnhoHzE9XsYzYROpBssqgoHaoo3x/p4v9ex0Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JlqEe8TMGlH5+Oc+BA7cfhl925a3Zu5vlnw0KvTEmZw=;
 b=itvUctRX+EnDF7II/PNIC/qVzDIMDVo7V9e8Y1SZneC6uFZzbwFRNt99hyxn1Yu9ZJO8hZspUzYw0tEtWB4zzJJoWjWCSMZXo4fj3GjElo0ojka3aQ3CvGLj2j2CUHAxZLjMG3LTNX5n1bQqVbqRRsSrE23WiJE61ltlbPXEGwFpzXbnoGMKT1QmtBMzFQRsm7P7zi9vL+LIA7HlOkF+ct18LpZ9zpgLYPNPdBJZ8ShB7y7DKKl0wHZthYTe8rtk4S+meMuLJMrYZz/+2205IiTanmsrG98Cf7GI+b9bnS0VpsgezDbhFkhwW1RythSeyDCOZYCbgY8XNEyNVLZSDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by IA1PR12MB8556.namprd12.prod.outlook.com (2603:10b6:208:452::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Thu, 21 Mar
 2024 09:03:34 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::af8d:96ea:45d4:310f]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::af8d:96ea:45d4:310f%5]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 09:03:33 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, "peter@korsgaard.com"
 <peter@korsgaard.com>, "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v11 1/6] boot/zynqmp-firmware: new boot firmware
Thread-Index: AQHabgdsbJU4KQHfH0ygy96cgtM5wLEuZ8yAgBOZMSA=
Date: Thu, 21 Mar 2024 09:03:33 +0000
Message-ID: <CH2PR12MB5004FE2B2FE46E2E50624F21F0322@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240304074140.1537910-1-neal.frager@amd.com>
 <20240308224525.56790208@booty>
In-Reply-To: <20240308224525.56790208@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|IA1PR12MB8556:EE_
x-ms-office365-filtering-correlation-id: bf62f540-c5af-42e2-00d7-08dc4985c95a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i0QwhEVRMQLAnuF4XropwxLxabap7ri0ZTKtdVW4mLh6MvIJrM5/Wzoj5EbKo+/Fuj+pARcou7avsO7oUIhTXzi7uXd0079IXJeRUVQSb4D+n4RbNZFLcP9P1UpZnWmZYcXRXK3MEYVtDcmTH1jaNpPx5XLHARtxB6UaJHKjcryoWK4mmQFw8YCu0e4DoC/Sbq/cO9Hj0vxKXuvzB9QL+NKjm08QNtw5ltymw6ub+tTbi3DOPG0/G0gjKVxNvIn0jax8bX0zvquM2uaxqUaodwboyZ30fueb/koq3/bnkUF6mAtlphSt1T/jVF4MS3N4fcVY5EnIXHgT0/7xTgluQBbdjQp+8/QDhQtps6bmBh1SGKOzGavUzTQDbRp9o+4prhh/Ytokn5Rboda0wcLKxCaIIeYtiJrSoKuNS9AFWj3rvD8jEhnmpfVDXCK4L33mvevDrRoNW8CfazHxV3klHeumi/8f7jZAllu9XkwywG1rrS1YW1tZseJn1HlH6j9FPgzBqZeamLpBRqlMY0oTF/Y/6kazugQFjwzDBayuPjIi2kM4kbh6JKVJInpQSLNdGMa/+fYejryybg/TK+2QRj9+JI2THnfGkgY3qBE6xIjlCGhh0r15L+cVgv0fqa1/HdOXIDjtWYhMpMYvknm+iyMgqoUA6WB5G98pErrxI487iierBt11FtE+5jwt4BbblF6YJBCibDp7tqGO4slIsPQqHOVT7gX8jp7Eowj5pKA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AWhazTHBdLYcVxP5UwMghoQ3PHHjFku53zc0F6USRksxM50s6bYuWCN/rIi1?=
 =?us-ascii?Q?TYuuzkgk3GmgxAIUEeyF5z/l8KwmM9Hilyg+CJUa+fP/1GoCxycZT5okf+vX?=
 =?us-ascii?Q?tBRx2Vvve3yQQVgcz9yTD/+0pMH8ZYPI1+30fOqs6yshmAXZesc1fQpA11ZS?=
 =?us-ascii?Q?0duCet7/gcY9mz941Wg0tCX5Jstda+vzDCM0saGUzpZ6pTJMBy9dPixqqdIO?=
 =?us-ascii?Q?6Au6Z/JIBZSVjnXmlUdi/Pln3C9Y/fpmzX8iHYvFoORjwA6D2OmaAhU0omjr?=
 =?us-ascii?Q?XkTnHNvdh/4P8PgBkTmfWlQtTfAJnRhJECKEILJkUJSviIek0mQCbaaGhHv2?=
 =?us-ascii?Q?4NgCrp++qQFfVSj7rS18v0/SHdBGw22itrtXcuYVBUkvTUGb25L2tF0Ievo/?=
 =?us-ascii?Q?c+yyAanLJvUonLBtsLYdHVrCPFaKDBbRkuHUOIMh04GbBmTIk/ukYIS3alAl?=
 =?us-ascii?Q?K3tMkyvrLNVcpsoc2wbOucw7YURFh3/lS1yNRiNzPuKgsMllHBsGjZAD9aMH?=
 =?us-ascii?Q?+pxBKRFEttphba1eaBDYWBjxGpQrzyO40SmC8p5qV82qy0ShkgrXBuHGeJdy?=
 =?us-ascii?Q?pyimgcZxxdVQ2kmASaxmxjRExROT8Cv8fD1786bFeyZdvp4tXNYC7GKMXw2k?=
 =?us-ascii?Q?j1TAXnYedOVfL8U/PlUp13qzoN2FBVi86BvgZknhrfSagMN3MOcmdfE0Yf+x?=
 =?us-ascii?Q?XymvXLliW6O0NOUS1mkLWbsLc0QZiXpn5QZRskwf1V9zEB+4v0ff2YZ1lbjZ?=
 =?us-ascii?Q?yDwdRYJ+IJWm7xIOixbAZrbLi9GSeraSZguicpV2yyOpWWLyi7r9c6AqHfyN?=
 =?us-ascii?Q?3WQ3ql4YluFL2HKfLmplBKQmb78vWFOJbOfLadXTPmjM4ZRJQ7jVAUIbx1D0?=
 =?us-ascii?Q?5ocLeCu1MxIkWnhUZmhCLU13iOqjQFkhQXL1PEbWH6f51C/hxIfoGcmqswyC?=
 =?us-ascii?Q?nKnUejqsK7pPy15o9desFoKC4rEOH+5+SGxLtop1luWY/24SN2u0VFaOdK3W?=
 =?us-ascii?Q?9MBQNvZ/7bJwuiodmK4aQNnWQy3gP2NusGN4DlvqPR0LzW2lGl/48hufagAW?=
 =?us-ascii?Q?U7USME58tMgqtqpzHAy53BUO0m4EVZyBO1w3A5IFhBVIBQR5SFPuwTDHVWTK?=
 =?us-ascii?Q?edhy6qO3j8W+x+NwiCkLcwzXvz/yPw2yE11wZX8K0+RHuW2ejEoaEVgqTYiF?=
 =?us-ascii?Q?E6x8cuKciA3Oh6aomZ1x5TDjGCWrW/l+kvhGWMAsmNyDjQxaxwSP5yIveQef?=
 =?us-ascii?Q?m+YX5a0StuY77J2+Bbd1pvBBLpzmpPUzWw5b+xf6J0LXIUDaj80BMHpOPV+d?=
 =?us-ascii?Q?cMZF2ABPBVdsUCKbAka5hypRhAtmRwmFdSTKVKVD1n7o5tjiWRPuZdEDCF8n?=
 =?us-ascii?Q?1ytU4rrdPYeNpHyDG49jN8IR0JPYUKN/cX+c0n4xpwWGvbJqNRhDYam8jcQa?=
 =?us-ascii?Q?ryrjAfQLSXuGNyO207reeeS3bur5t3Bmru1unHuovrPoR3Ng2xMEftobIEvX?=
 =?us-ascii?Q?5QRMfFWtPWoqkYotnMnWQi+OcIL+KrwoLu40wijlWoVT66WcpdUxX56aZrZM?=
 =?us-ascii?Q?fetVJEQsAp5NR2Ps4Dbp7U8bozTirSvKsJn/DCy0pT3ZniGQpAlBbPxHZi5l?=
 =?us-ascii?Q?LpPTfOFrByNT15DEmA+gQME=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf62f540-c5af-42e2-00d7-08dc4985c95a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2024 09:03:33.7074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rppDxObqWC5ci8lIxRZ3/uFq7NUNQgc9tnZ24WtL7GkyQDpmtTtNSEFgj4SRshNH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8556
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlqEe8TMGlH5+Oc+BA7cfhl925a3Zu5vlnw0KvTEmZw=;
 b=1wz6f43iWKaBLUa7VI7ZDgkj3F8mC529Bj9zrGXLPUCajKT4Cubd4uXJdw+Z2XEhoMQMYyZ91aL189wGiwT8bC7w4g0uIl6Tb2MKIpHXJ73c6bgtNduFHNXFBvmod/WSDqsFMyV8/Bey1jW+9rGwhEB7O9vq+4gQJoUJuigxZJ4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=1wz6f43i
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v11 1/6] boot/zynqmp-firmware: new boot
 firmware
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone,

> This patch adds a new boot firmware to buildroot for building the zynqmp pmufw.
> It requires the toolchain-bare-metal package that includes a bare-metal
> binutils, gcc and newlib which can be built for the microblaze architecture.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> [Tested on Kria KV260 starter kit]
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Any other feedback regarding this patch set?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
