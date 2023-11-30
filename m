Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B6CC4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 07:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99EDB41A2A;
	Thu, 30 Nov 2023 07:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99EDB41A2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zmfLvMmZcVWV; Thu, 30 Nov 2023 07:34:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAD7141991;
	Thu, 30 Nov 2023 07:34:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAD7141991
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 153271BF422
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 07:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEB1B41991
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 07:34:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEB1B41991
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y2D_SDcdF209 for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 07:34:53 +0000 (UTC)
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3715341989
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 07:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3715341989
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 30 Nov 2023 08:34:49 +0100
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 0F60AB5ABD;
 Thu, 30 Nov 2023 08:34:49 +0100 (CET)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id AC052B5AAC;
 Thu, 30 Nov 2023 08:34:39 +0100 (CET)
Received: from stwexm.stww2k.local (172.25.2.111) by stwexm.stww2k.local
 (172.25.2.111) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Thu, 30 Nov
 2023 08:34:39 +0100
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (104.47.11.233)
 by stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32 via Frontend Transport; Thu, 30 Nov 2023 08:34:39 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lqjC9vU/Vcif2G2T2Y8lXMwW8PQUYcRFC+YiXMzIXlSGiOb5QRguVIGfszQ8XivRNHNTz/y3N1Y1VDRZR52ZhX/yUX7eNUanm6talbp12kk3F14FrJTI2lIbIvUxIhwxX9bR0LGA9r+WkFvy/TLqt1yx3v3jaIN6irYd7EdOc6pi1Qu6BSn0UKNSAjQ2MOY7OomFyMIifvE/dnRoWNRP/h76ofixcQPfUUGh0ySoiVKUmr2I4F4OqR1S1oINP07KgBXo63Fg85lBEt9c6eIADsFQLDbZi86FsnXLwQGeD1dR30i/AnoXTWZ5QyORAkeZ8WKsqhKlGJJPYgmG/gAIdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0oq49CWTBDiFlrwWD//pLbrvKr6L+W8JadAR+V8R8g=;
 b=oN73F7SinkmxjCSCub1NNJHgmZA7ka3JuZtpbdEo+FENiNTHeq5y/jmlzRCp7uQE+qFFgLr6I8N4Gf1U6KJRl2q9ynSh2QGxof6zR7rJCC2d5nFRPZewCsHwiSyR1goHRYl2jrLL4w0XXkwzkQa6xhqsOv7zPUxitV9tIhApn7mm7nlF4MltmMzGHPnPnC/+eESYU5dtqzKnttIXRNgxqkagEMuGsIXn/rwFe3aOQUNfgtEo8AvsjtyVV2xdSaoGfEZ84f6nBBfNDofJDnEZtHFlv7Eud3U0WYxyXAdtjZ3RjI+4uK8sQAzEtPl7EgkZHqJSsYVMzm675obsQ6sQpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by PR3P250MB0212.EURP250.PROD.OUTLOOK.COM (2603:10a6:102:17b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Thu, 30 Nov
 2023 07:34:37 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::e6f7:7b61:cde2:b8bb]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::e6f7:7b61:cde2:b8bb%4]) with mapi id 15.20.7046.015; Thu, 30 Nov 2023
 07:34:37 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [autobuild.buildroot.net] Your daily results for 2023-11-29
Thread-Index: AQHaI1e1e8DFNG+IH06io80mqiT0cLCSd8vg
Date: Thu, 30 Nov 2023 07:34:37 +0000
Message-ID: <AS1P250MB0608FF5000E2423DEE2A893DA982A@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
References: <192a91$58bkb@mail.sensor-technik.de>
In-Reply-To: <192a91$58bkb@mail.sensor-technik.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|PR3P250MB0212:EE_
x-ms-office365-filtering-correlation-id: 4a97de01-8791-46cb-6729-08dbf176ce94
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l/ppfcWSDj+ChhBQGinrTOw48Mcb4mc2C+6SHFBgSwd9ucfZsUBOvDUlGUJ6lS81GZkJoeFNPf2Tq/V6QdD5D5Hk1/peBYJIYo6EGKCGPdsCXa6NPMWz6Rntuo2YxJ8BRla0U6sgFofmXPX6I4TeLhFoOSc65tFtBgvQEru9pzmDHdBMC9QXmWT2IAdZNlaGX+DiBajrzODtJ6CK2oZDE+d6eg3vXY2gT/ZW64QWI1AZeeNIMGP0+cry68f3yWdWBhS/Ia06cTdcEK4Hr7O+qn4Hq+WMJiOrZlrvcxoOgk5XTRzm+xcylq8zxuwlpJ7JRSo4w+nyV1z/8R2Gta35snG8SEij4TJ4vk0m3SUIFsAogBQXFnSN31ITQ8/sqNUQRY17s5LrihNLSH9jfQeXTGXzrYrWlufkZ6MpV+TQcXlGj1YmD/K+UfwP3ReQGW4uKMRgndd4FJCECdi2YV6nwD0b3BPLS47qaEIT1ClGeOuyrr4shbD1d4EtMm9V1kiRTdxfu8/96sSMj6RMyvFy6gSX5Z/08g8FxNMSqxdUKlxvXk+aSay9sKrmRsvc3k3MuXek6SYDZdLNt3/Mn7N3rf/q41FcljHPN4Q2sFPe35CWnvVW/jn29OoqSvnh0hbgoOjyNtRpzvjDu0lIzRhYuYHsn6slF2CXuCIpzUFmGknuTnB7AroboS36O8T9eGWp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(39850400004)(366004)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(66946007)(66556008)(76116006)(316002)(53546011)(66446008)(66476007)(966005)(64756008)(6916009)(6506007)(7696005)(478600001)(9686003)(33656002)(83380400001)(86362001)(38100700002)(122000001)(5660300002)(4326008)(8676002)(55016003)(8936002)(41300700001)(71200400001)(52536014)(38070700009)(4001150100001)(202311291699003)(26005)(2906002)(547064002)(357404004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZlhuMDZoeXhBWXVnWllaVTRoUGg4TFE1dktHSTFnRWE5YlpaL0xRajJzeHp6?=
 =?utf-8?B?R1grRi9JWDhsUkVya0xHZGFRVmZnaklzQkZuR0ZSbTRuOEx5d3JyTGVaenkw?=
 =?utf-8?B?UkRBKzhvNmRRUDJGWElvQUZKdnNIdFk0dU0xT0hCK1BMeE5YRjhCYXZDdjFi?=
 =?utf-8?B?b3NuNXh3QVArdjd2VGRzV3VXMmwxM0FnVVg3N1UyQ2w5anp2NXlMYnhWQXZz?=
 =?utf-8?B?UHZqUnZZTEdPOGFFeEFKZitNOU9FSDZoOEdsNVliZjhyZ0JXUHpNUXdNK0pn?=
 =?utf-8?B?eDRuS2ROSldaVFFpWmFteHQ3MzRDQTFieFhQVnE2ZnRPelJ2TC82aWQ3RDNM?=
 =?utf-8?B?eGl1ZlhSZTVONjIwd1J5bzRFTnR1K0R1N1hjSGJrdThmdjNNdzB0NzMzSUk3?=
 =?utf-8?B?dXpKWGJMcURIVmtucXpyem1PcXFCRFBXNU1sNk1JTzVWT0VNYzU2TUJMSldD?=
 =?utf-8?B?RCtWNzZTNEZvaTl6WWpEUTR4YXJDeCthdUFYN0dxWlV3bjJsY2g5M04yQ1la?=
 =?utf-8?B?ZlFhU01rY2F4OWNFbUdkVExjYmxicmhoY3NjeDI2ZHVwdXI1cnNTRC9HYlpr?=
 =?utf-8?B?MWphaEJZQmJPMG1lbHhwb01qSUtPTEdmTXBVUDU1UjNmY1ljUlNJNG90WW5K?=
 =?utf-8?B?UnFWODdiL1FpUVRuVjFMeTdXRlFNSk5lMWdvOHcxaFlpSExPWERzY0lDa3RM?=
 =?utf-8?B?bnB0ayt1TDFxRit6d0k1ekVSQXpsL3VobzlOZVJQN3RLWDI3cWpXTm9TM2sw?=
 =?utf-8?B?dE1VQ0E3SCsvNEpheElkOHFmS3AxNGxHYTR2MHZPWEdOUFNvUWE2S1U5QitL?=
 =?utf-8?B?TmcxNUhxL2dkWURpQnN3RnNQWllLbmFIOThKVDhVVWFuUUE0TUFsWHZ1NUdm?=
 =?utf-8?B?dnhQc2R1MXNIS1cwRjl4Um1HaTZOdkptalRrMHlvRndUN1Eyajk1ZHVrZ2lI?=
 =?utf-8?B?STIyM0hsSHdRVlJ0MFI5OXlpcktJUXRaT3RjbmV1MmJyWnM3ZGJIWXh2Qmpz?=
 =?utf-8?B?ZTFxNzdCaFJXMGVraWpzSXpvazdicjBzaEJTc1ZDcXA4bXpyWEZ3RENYSTB4?=
 =?utf-8?B?NlI2Rit0TzQrcWFEb01XcUFQNHZFazFTaHVZYXMxTEc4RzNQWW1pNUNXZFhj?=
 =?utf-8?B?eERFQkJsV0VFelFxOHpBYS9YMHRDdEFwa1VYNHVlWUphVTBDUFVWUTFHY2Ur?=
 =?utf-8?B?SmdtMEl6VTBGbDVsRk80aXJQZGpzZW9meWVaN2lzQndXMnAyYmROaldSRXl0?=
 =?utf-8?B?NmowaVhNdXhLNXhiUlBTRGtETktxSlUwV2dpdEZuQXYvZVJRb2kzQ3Jhdno1?=
 =?utf-8?B?NkRaMG1abEJmcnlISTBkRTFsTnhCUjI4dmZ6WHp2czhaRXBUY3BQWWhRdWFC?=
 =?utf-8?B?YzlCcnM4bjhaVkxZTWs2NjJTblhrTjZIdVFNNEV1a0ZySHppVTdJMGJpazBE?=
 =?utf-8?B?bWFZNmFLd0dMSEpaakxFQ3JPSXNMOW5RTmpDbitZcmRabjRTeWhVeCtsUXZj?=
 =?utf-8?B?eEFZdHdFRVVEa1dUZmx3WVY1bVFrZ1lMNFgrSTI0NndoNnI5bjdlRUhzb0lD?=
 =?utf-8?B?YTVYcGhHRWZSeFQyMUZWU2sxNGxKWFlhdElraXdCU1BnZklqdzc0eEpHb1N2?=
 =?utf-8?B?b1BRYzIra05kaTlFQW9hNlJGSVZkbUFpK25DbmJyR3BjOU56L3Nra09wUXBF?=
 =?utf-8?B?UXFlVTg3dEEzY1dGa2RPa1I0TVp4V3pqS05qVFc1QlFTVU52b2N6QlQ1N2p2?=
 =?utf-8?B?NUFRdUdoKzlUZkc5eFd6dHdBa1Raa2N6WlNnSUFEOVJNM2tDK3JYSHllcUZE?=
 =?utf-8?B?SVdKWWhlYkRnejQ0NmpscE4vQlV4M25zZkhETWczWDNmclU4ejZ5d0F4WFI5?=
 =?utf-8?B?OFZ2dENxWlVsYzlyWUF0cWpSd05CVVpyazViQ1orbkFGQzhuS3k2NnJadkFT?=
 =?utf-8?B?Q3NIUExiN2gwTTJ1cUVMNlltTHJKcnZZakVidGtiTzFxZ3NubkRnU0RSbWQy?=
 =?utf-8?B?bVJNQjd3RGVWYnQxVXYvTUt1dWlzVXVJZmRtSUJzM0cyUUtxUGtiVVJYbmdQ?=
 =?utf-8?B?RDFoSXVVbmpyc2xncFd3SjVPZnBJaEJMbVc5UjNRNDM1VWxiaE1HTnppUnF0?=
 =?utf-8?B?Q3VHeCtvek94KzZHVjY5bGQyMXRtc0x0Z3NPZFlrb1BDNlAyQmpXUXRnRTNr?=
 =?utf-8?B?M2c9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: bW5tuVpgIvFLoIo6vJ/XeI1Yy8JfmoW33jbAVE//z11AKMKglGsC47qT+A9xp4KUBwoqpjH49OqwMoIuQVDrnFEZl/3qrMbUsChID64wrp9Q9TzhugE6GCp5RHKodYzVJ+vo/Xqvx4dlas1aEG5netxi/VMRMWIim8tSKejRJkZsFqvhMFhDW2DQtMM6Y6xVdDSI0eVCmZAgVk/suDQENeH4yUmId8QBj6YLreCR61AP2oKP6nx5fiEbZ4tkTKiHuw1x7gPpsnEa6RWaPGsp0Qr3cccNIA5tXhblTTC2Q3YyhvURsXgW+bGgMiQtDP+5cu1p8N+NGEXavRHhj7yD0fArC06iCSKbvyEx/TKR0186u3a5n74n1lyQ3jDdq8kPCt4FyqPSm8HdrRof4V/lmqTXYga7F/S+YdV1hFPt2BMoyVI1r6IPiuvmRidN505yDfJr3tXPs+zh0MeyxuLQsMzb2PDuEuhJU1Jh5ow2+dC2w+ZqugKSaJ9mX8XaQ9egRqIqViUbUKB2PMYF5iatZIwAp03jdbqB/EGhcYJ2VILJL8hd/6PBDVcy0D8JKuKicYOzeAeBAxj7QbwN19KrJKlx4zzWB16WCUTyOD8IlDbovDYu8lmNG+KcZrdwWJMJ3nJD94CMXTWr6e91PbZZ931+AlUI4tTTgode5OubmLdoR2Ab7bZh14nDLzbw5XI4mYLmtkIIdi+PPG+HV4VcmioNlyD0+EA/L/hp2M63yrc7+OKwx1EFcc6KpU8r3i3aAngzDTY20jMdZPbEBK3Dqg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a97de01-8791-46cb-6729-08dbf176ce94
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 07:34:37.6719 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wQHtKTfPazkFV8yr3hZXtLfYP5pSizOE2JZ+QKBP31g7GUX6nzmrwIaB22LAljsbVP08jzboTw5V6R9aoWoeEqIt/tCUxiPucY+Zp/WTwNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P250MB0212
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-TBoneOriginalCC: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0oq49CWTBDiFlrwWD//pLbrvKr6L+W8JadAR+V8R8g=;
 b=d1NJlsV6mk6UN99c53Zk1lfRSnkocpvaXpTyfgYvjVmUhqLYXNVALyLoENBLxc19PQXxoJd5FsElUptkUcHs79q1siodOjFbjZVuEI+b4s51u83Z4/lh3/yrXHRvWSWnHITvz//P5Abd/gRvqdiltxPYir3+8p6cQTNjSYGicMA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=stwmm.onmicrosoft.com
 header.i=@stwmm.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-stwmm-onmicrosoft-com header.b=d1NJlsV6
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2023-11-29
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

Thomas,

do you have any idea how to fix this build error?

Error: unrecognized instruction `nop'

Alex

-----Original Message-----
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com> 
Sent: Thursday, November 30, 2023 7:38 AM
To: Michel Alex <Alex.Michel@wiedemann-group.com>
Subject: [autobuild.buildroot.net] Your daily results for 2023-11-29


Hello,

Autobuilder failures
====================

Below is a list of build failures reported by the Buildroot autobuilders in relation to packages or CPU architectures you are in charge of.
Please help us improving the quality of Buildroot by investigating those build failures and sending patches to fix them.

Results for the 'master' branch
-------------------------------

Build failures related to your packages:

    arch     |             reason             |                                       url                                      
-------------+--------------------------------+-------------------------
-------------+--------------------------------+-------------------------
-------------+--------------------------------+-------------------------
-------------+--------------------------------+------
    or1k     |    libzenoh-pico-0.10.0-rc     | http://autobuild.buildroot.net/results/663b631810b7e3982f35539f5d388cf5e5090654


Thanks for your contribution to Buildroot!

--
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
