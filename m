Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A74C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 14:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C51518453E;
	Thu, 30 Nov 2023 14:43:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C51518453E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sHoNZexjlBrL; Thu, 30 Nov 2023 14:43:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D618F84535;
	Thu, 30 Nov 2023 14:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D618F84535
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6DB301BF378
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 14:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 459B484535
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 14:43:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 459B484535
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HvJ2nYHtw4X0 for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 14:43:51 +0000 (UTC)
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74FD78451C
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 14:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74FD78451C
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 30 Nov 2023 15:43:47 +0100
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 38808B5ABC;
 Thu, 30 Nov 2023 15:43:47 +0100 (CET)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id F4219B5AAC;
 Thu, 30 Nov 2023 15:43:34 +0100 (CET)
Received: from stwexm.stww2k.local (172.25.2.111) by stwexm.stww2k.local
 (172.25.2.111) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Thu, 30 Nov
 2023 15:43:34 +0100
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (104.47.1.51) by
 stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32 via Frontend Transport; Thu, 30 Nov 2023 15:43:34 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2IrO5Ii6Rxm0OQGvX82Ktx+6RDGAcd8nkZip0EXVlfUmU2EPxx4USwOGilygzU99Rz29KU/O++pcBc/qu+D8LtF22HwsxVIwiczFJToDRYX8+0mfDGAccHc3Agl2u1VMn9a5G1mMXsZ4XZSN53DBRPqqLna5vIpF2IOoveqofN3OoTmPWAZFO49NIaIuMffdRyc4ihbRJAaKGEMcvcnTIilox1ETfAk5QHkpAGKoTTck6+T5SMJNn/cE+K142VVbnvQRiNWxio6oD8EqtLfdq2bzYYczfagIVN36ng/o59WLZdhk7XO0QBaNiJItIUDbcPi2zEAOxkWDCGpIZmjhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39BC/SE/BxQycPUaMZtIKSzfnrsNpqDrEga55cC+dC4=;
 b=A26Pbhzt6Teoed2WaAzBRPw1Y60KlU5BLKFdKkvYJKowHrOaEhP4fuEttLdE2OFYLHZ6Jk5LYdoLzaWsIg8lsgw0Qac5T6lZm//4T5KwoqFcuD74gZ53qt7SleUSpZt3pSRdAZl6oWY5REsixUD+NxqvRMIvh3E8Yxg1d6QbNP1F58LHUDSVXIZ++MfkajH0saEzII1NaiwAYYDxDCn3/tKB5NN+lrB8z//2XDD4WGF22+bWnnGFhIhYnLPx/AuKgvQAV3jl2Jjrhca0cAupTJNBpFjZ0A6EYIawOi4Ij72Ok2pU2grRKHqN3FwmLjr6agOPxaH8Mj/baoENsyOmJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by AS8P250MB0362.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:37d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 14:43:33 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::e6f7:7b61:cde2:b8bb]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::e6f7:7b61:cde2:b8bb%4]) with mapi id 15.20.7046.015; Thu, 30 Nov 2023
 14:43:33 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [autobuild.buildroot.net] Your daily results for 2023-11-29
Thread-Index: AQHaI1e1e8DFNG+IH06io80mqiT0cLCSd8vggAAGv4CAAHDXMA==
Date: Thu, 30 Nov 2023 14:43:33 +0000
Message-ID: <AS1P250MB0608BD8803DA627E78F61E26A982A@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
References: <192a91$58bkb@mail.sensor-technik.de>
 <AS1P250MB0608FF5000E2423DEE2A893DA982A@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
 <20231130085541.519eb02b@windsurf>
In-Reply-To: <20231130085541.519eb02b@windsurf>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|AS8P250MB0362:EE_
x-ms-office365-filtering-correlation-id: 63da89ad-bdbf-44d0-e462-08dbf1b2ba3b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PnP8R8KpSDKBBHxjosAmyITOUFqDKi8BgJqsAYS9ooIpGnBBFDnwMMvoIa+4xsErBfOgpnRm1XASUNfRwHhbYELUbgrtYzyEGH6PJZrYN83G4PLWFn2YV2klMOjAo/r3dQaN1L9rwKSd7D75FTpooOdL8tuXF/d3tBESrzmFb9zjsJoiJQzOL4KNnKtyWSX5C1mW6j4E6awGCHjaoBnbzaL2jrlE8/BU3R8t4kbs58NHxnHT/C5hEhocupNi/A9Iu+NPAb0v6VWzweptndBVltWEmCQmDgILD1t/1yICNj+JZbYj10AAnjqBmj4ZssqgrdnRiutFsuhKfWOSV0Qrd+F7hT7iOj7RIRwnNSi3Xebj9Nnkx1mi+IihUkS82HcDSDwCuHDDE1RdTUgnkNAFwlXhq8zBzT5cevipOjOz1l0NKFWrylQpBx5HRlU0SxU8XcL1xU7XUBU4AuQ80FVk2A7r1At3bI3f8q0y0923Z5omLsEsft5u2L7hb61+irRs+tzvZlGTstBSqAr/U1LQOlexxjDiH9xolcxIhC8BsyzV52AsECgwH2fpIBCrmgb4hDnV3S0mJ+SJLEk55xNfZEut9bGWwYQNdolminM8uUxGUlZUevMDbzvIx/dc8badh1JlsBVEwsax659asHFn1A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(39850400004)(376002)(366004)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(71200400001)(478600001)(9686003)(6506007)(53546011)(122000001)(966005)(7696005)(26005)(2906002)(66574015)(83380400001)(4001150100001)(5660300002)(66946007)(66556008)(66446008)(6916009)(64756008)(66476007)(76116006)(8676002)(316002)(8936002)(52536014)(4326008)(41300700001)(38100700002)(38070700009)(86362001)(33656002)(55016003)(547064002)(357404004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDZLOUNSL0RUdllQckI4ZXIvbDFjZFVGZ3dNWCtXR0VVWk56cWpxU2orMEJN?=
 =?utf-8?B?ZnhadEpFbDZHMEZKWnBwK1ZKV3lCNTVuOENDQ1dPcmtYRytkRjhhOWJpRzhp?=
 =?utf-8?B?ZU9JY21IdHpYK2p2OFdqN0w5Z0w3U0ZjM09wVE9hSTFZOGdRMStaelJ2RTVQ?=
 =?utf-8?B?MFFaZldZcFlCZ2R0RTZzNit6NzFBdkQ1Zzc2aHJJamV1czU1eVEyL282eCt1?=
 =?utf-8?B?bmFMcWlyK0xtSFVXMXdzWS9MRzFGazRwVkZROWZGUHZjOEprSi9OZnRMNFU0?=
 =?utf-8?B?Rjl6MVdCVGkvUnFPcUk5Tmd4aHdSTmljS1duS2MwRlR0NFd2anNSYzIyZ2U5?=
 =?utf-8?B?M05BaDJqdEhNcERSUU1UVWVLTHhOMzV0ejEwdVBSSk9XNGVUZXREZ0RFVTA4?=
 =?utf-8?B?SzgvYk15RmlUa3h1UEFmMW9ncFd3SG5JR3FaZWpDSThhYVJCZHZsWkxSeTdY?=
 =?utf-8?B?MU9sVG5jQTBzSmpKYzNBaGQvVWRqZUx6enROWDZ5TS9RZ3lFWE9ZZ2VRRU9y?=
 =?utf-8?B?UU9YY3g4M09kOFZGNkRpdk1EYllYdGFJNnowWTdEL2FBWGVpZXU3UnZnT3dP?=
 =?utf-8?B?bzVzZXp5bDd4UWd6dkN0SXo5REpKZU53MElkeHdXWTdHaFhwa1phTkVrMTZh?=
 =?utf-8?B?QjMxdlEwa2xYYXFUK0Y5c1dHVndqSGE1dm5qWk5FMUFEYzd2T0JMNm9UMjd6?=
 =?utf-8?B?K1NFYnhKK3d0M1FXSmQ3Q0JodUYyL2diVnRxcmpacUI3Nk0xdVh6MG1kaUZi?=
 =?utf-8?B?aFY0T1MvVWhEaFI1Q2lZRk95S2FsVWpiTGZ2QjJ1THEyTE1iWjhmaXhYeHpW?=
 =?utf-8?B?WnFzMWxKM2ZnaDJvRThPaTduUmpxcHJxVUplSU1SRXdheTY0Um1ySFlyY2Zh?=
 =?utf-8?B?QWRYQmpJNC9Oak5jTjk1QlhQTzFNT2RtSGpBM0VsaHUrUWRHSEpvUXhzeTRa?=
 =?utf-8?B?aHVkOHRkSG1hS0ltOW11dHR2b0NXMjNTdmF3Rms3cHBMOXEzS2M3dDI0Y0RO?=
 =?utf-8?B?OGJzTTBUUFIzRWIrRE5MdDN1cGFUV09hRDhGcVVYVFRNeHpBQnlPTHBKQUhs?=
 =?utf-8?B?QzllOCtpdC9QbGVBalRLdjRtSkZXbVByNWozM0JzUUNxaXN3Yk9ubzhiRTBD?=
 =?utf-8?B?ZVhBR1pKTkhsU243L2FCLzRDVk1JNWl5cldHV0ZBTTBOWTRUVCtRRXNkdmt5?=
 =?utf-8?B?K3A0c3NuMUNUOEFVZlJHV0QwUGUrL0ozMGNnWkVTUDQ3MmVKZmZZc3Jjb3M0?=
 =?utf-8?B?VUFhVGlyZzNNOU93NG5keXJCQm5LTHdQWGVmVWpoamdRODd2MFZNLzV0T2lI?=
 =?utf-8?B?clVxYkcwUGV2VVEvNFhlTWVjdmdFWDhxU1Fsc3U4NWxHVVgwVEY4K1Y0UFB0?=
 =?utf-8?B?QXNFRVJsejliaWFyNDJkSVpNRGhLSnhVN1g4a2dxWGtOZHVLQXdRWXg5eG8x?=
 =?utf-8?B?dS9NNEtFZWpjODVrV3lSRzNSbG1EMTAyQjhDbTRFNU1OQmdHcUdVSmNWcENK?=
 =?utf-8?B?NGpIMVJ6OUNGS2ZUbWNYTzErb05JZ0hpakJnM29SZXY5eDVBaHlSRHZtRU1I?=
 =?utf-8?B?QTRUM3VJN3VRWnJtRldDcERSYkIyT241Um9RM29LQktqYktCbm1tS2tnSGVL?=
 =?utf-8?B?V2VRc2oyeHdvTTFyak9jVVdqanRIQnVQcFVnK2YrRitJUllvUUhMVDVhbjQx?=
 =?utf-8?B?bXhRTlJMdVVYSUNucHl6OXpWTTBCeDY3TUdId051UTl1bzB5V3V4Nm1Uejl6?=
 =?utf-8?B?UDdON0lSS0ZUcG5qVDh0eW9xU1A0MHdlazlTTGZGWjc0cGsxQnpTdVJnUC9a?=
 =?utf-8?B?emw4elQyeXVYRnlIVTdNMy9LUERKaVZLM3kzQkt6eElZT0lPa1pDbGNZZHZ1?=
 =?utf-8?B?clFWbUc4OXcrR05NUlFpc1Q1RGsrUWdsWSt4L285M3ZtNmkzNVdMazF4S0hx?=
 =?utf-8?B?aFpyVDJUbmtGNm03SzZ6WEF2VjdoSWk0a3JTRXo1R2s3YngvdkhzVGhNb1Jp?=
 =?utf-8?B?dVhyY0hralBaQVluY2V3MDBMTE16WFByVFQrZUl1QXJOSmlZako2S2ZEbDBr?=
 =?utf-8?B?U1pWaUY3bjdZU040WERBZHdwK0lDNmEzRlFsZzRSaXFvQnlJb1duL1FpTGRn?=
 =?utf-8?B?dVlJUHZBMmFwUzNuWTdDeHFGSVFwdVVtMk5LcHFhR2hYY3AzQUdOMWNLRG05?=
 =?utf-8?B?RlE9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: sKbe3ldU4+gcscMMGP7DkxSxy/0HgM26L0ePN8HIjMFuTkByktTMoG2arxuE6QIWCVyPAhkf/C99u3N/MZ4k3K5JdnzSMB+a8Oe/hXSPeN5E8NtH8kdjE7lFZequUC+QR+M4rkDUTKgiu8a+Y2PKwZM5zNonGHJazs84zVgEnf3+/IWi3IF1VZh5zw981Tsi90ObP10ZENBU4UglfGBA4hS5phr9q3T8wnRIL1wRnibGL8XgaUXWdyADB4wBEBZJfCN7AEOon9qXFceFZv/9GXK1cn9V1NYQr8ehQWCgzL4ox7E14y288l2SYBvy/Mard35U59ThugwJJJC5yyKC1ZFfQGP8rRgY3fQ44KyE13hZun5w4g7G5RuIwZN6ubGPU2GJ6sU5EGHBAm1qXVyPXrrSiFSVbUoIpASnN+HDOkCNEJBrbAFkvpUdVx15g3/gv3453s3KCvqMgIl3sw3eOzjYnf175pI62ZZiSHIbPon47BaVHDfPNiPOuRxbVg0EQvOT5a5VDKs6eQt5MLLNHYuu4AsqBU4aoS9zxylK9JAP3UVW6l9gJYpMN7d5YBa4OApHLhw90M9OTLb6Hs2UvasbsiIxoz5wSvIkbYJuWenxppslRRymGcJE6ibZxvQWQAwmU8pt2vfBpjqZgZjhsPs9I3FyMDbkpzFzUp57ar5AOITe9ybp41ORQGyBfb9GxMWAZ29FvToUZG9G8o7mpo5jYYEFkIAf2rpOqn/KGFENBUVIW+9OdCSrY31oPN5UIx4npWT1YPvjhRwwTmnNNQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 63da89ad-bdbf-44d0-e462-08dbf1b2ba3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 14:43:33.3416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 57xfYxuFdjAHlgAf5GlI0n16+cLDNSnj1dj9sDlKKUlfdDxeyDOWuTIMuIracLMIqjPUytU6Hoqxc91ljouJp/LvvCkurVaDgM3Bq/v+NvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P250MB0362
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-TBoneOriginalCC: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39BC/SE/BxQycPUaMZtIKSzfnrsNpqDrEga55cC+dC4=;
 b=PrsMwItxYQx80lXiO2bmJ0fNivom6+MuEAG2vUQgr0EbpAKCy2ZZvof7sSdQcyb8Omaabl3u0cbTud3wHsEuQbt0R1I0MxX/EK6Wy1FWAC6O9K09CmA192Fnpn2yQN0GYs/cZHnFc4vOeiwYSekNXVbIbNtOqId8A3+BxfJTdpQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=stwmm.onmicrosoft.com
 header.i=@stwmm.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-stwmm-onmicrosoft-com header.b=PrsMwItx
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLA0KDQp0aGFua3MgZm9yIHlvdXIgcmVwbHkuDQoNCldoYXQgaXMgdGhlIGJl
c3Qgc3RyYXRlZ3kgdG8gZml4IHRoaXMgYnVpbGQgZXJyb3I/IFRvIGV4Y2x1ZGUgYXIxayBhcmNo
aXRlY3R1cmUgZm9yIHRoaXMgbGlicmFyeSAoZGlzYWJsZSBpdCBpZiBhcjFrIGlzIHNlbGVjdGVk
KSBvciB0byBwcm92aWRlIGEgcGF0Y2ggd2hpY2gganVzdCByZW1vdmVzIHRoZSBjb3JyZXNwb25k
aW5nIGxpbmU/DQoNCkJlc3QgcmVnYXJkcywNCkFsZXgNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5j
b20+IA0KU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDMwLCAyMDIzIDg6NTYgQU0NClRvOiBNaWNo
ZWwgQWxleCA8QWxleC5NaWNoZWxAd2llZGVtYW5uLWdyb3VwLmNvbT4NCkNjOiBidWlsZHJvb3RA
YnVpbGRyb290Lm9yZw0KU3ViamVjdDogUmU6IFthdXRvYnVpbGQuYnVpbGRyb290Lm5ldF0gWW91
ciBkYWlseSByZXN1bHRzIGZvciAyMDIzLTExLTI5DQoNClZvcnNpY2h0OiBFcyBoYW5kZWx0IHNp
Y2ggdW0gZWluZSBleHRlcm5lIEUtTWFpbCB2b20gQWJzZW5kZXIgVGhvbWFzIFBldGF6em9uaSA8
dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4uIEJpdHRlIGtsaWNrZW4gU2llIG5pY2h0IGF1
ZiBMaW5rcyBvZGVyIEFuaMOkbmdlLCBzb2xhbmdlIFNpZSBuaWNodCB2b24gZGVyIEVjaHRoZWl0
IGRlciBOYWNocmljaHQgw7xiZXJ6ZXVndCBzaW5kLg0KDQpIZWxsbyBBbGV4LA0KDQpUaGUgY29k
ZSBpbiBsaWJ6ZW5vaC1waWNvIGlzIHN0dXBpZDoNCg0Kc2l6ZV90IF96X2VuZHBvaW50X2NvbmZp
Z19zdHJsZW4oY29uc3QgX3pfc3RyX2ludG1hcF90ICpzLCBjb25zdCBjaGFyICpwcm90bykgew0K
ICAgIHNpemVfdCBsZW4gPSAwOw0KDQogICAgLy8gQ2FsbCB0aGUgcmlnaHQgY29uZmlndXJhdGlv
biBwYXJzZXIgZGVwZW5kaW5nIG9uIHRoZSBwcm90b2NvbCAjaWYgWl9MSU5LX1RDUCA9PSAxDQog
ICAgaWYgKF96X3N0cl9lcShwcm90bywgVENQX1NDSEVNQSkgPT0gdHJ1ZSkgew0KICAgICAgICBs
ZW4gPSBfel90Y3BfY29uZmlnX3N0cmxlbihzKTsNCiAgICB9IGVsc2UNCiNlbmRpZg0KI2lmIFpf
TElOS19VRFBfVU5JQ0FTVCA9PSAxIHx8IFpfTElOS19VRFBfTVVMVElDQVNUID09IDENCiAgICAg
ICAgaWYgKF96X3N0cl9lcShwcm90bywgVURQX1NDSEVNQSkgPT0gdHJ1ZSkgew0KICAgICAgICBs
ZW4gPSBfel91ZHBfY29uZmlnX3N0cmxlbihzKTsNCiAgICB9IGVsc2UNCiNlbmRpZg0KI2lmIFpf
TElOS19CTFVFVE9PVEggPT0gMQ0KICAgICAgICBpZiAoX3pfc3RyX2VxKHByb3RvLCBCVF9TQ0hF
TUEpID09IHRydWUpIHsNCiAgICAgICAgbGVuID0gX3pfYnRfY29uZmlnX3N0cmxlbihzKTsNCiAg
ICB9IGVsc2UNCiNlbmRpZg0KI2lmIFpfTElOS19TRVJJQUwgPT0gMQ0KICAgICAgICBpZiAoX3pf
c3RyX2VxKHByb3RvLCBTRVJJQUxfU0NIRU1BKSA9PSB0cnVlKSB7DQogICAgICAgIGxlbiA9IF96
X3NlcmlhbF9jb25maWdfc3RybGVuKHMpOw0KICAgIH0gZWxzZQ0KI2VuZGlmDQojaWYgWl9MSU5L
X1dTID09IDENCiAgICAgICAgaWYgKF96X3N0cl9lcShwcm90bywgV1NfU0NIRU1BKSA9PSB0cnVl
KSB7DQogICAgICAgIGxlbiA9IF96X3dzX2NvbmZpZ19zdHJsZW4ocyk7DQogICAgfSBlbHNlDQoj
ZW5kaWYNCiAgICB7DQogICAgICAgIF9fYXNtX18oIm5vcCIpOw0KICAgIH0NCg0KICAgIHJldHVy
biBsZW47DQp9DQoNClNlZSB0aGUgX19hc21fXygibm9wIikuIFRoaXMgaXMgY29tcGxldGVseSBz
dHVwaWQuIEl0IGFzc3VtZXMgZXZlcnkgQ1BVIGFyY2hpdGVjdHVyZSBpbiB0aGUgd29ybGQgaGFz
IGEgQ1BVIGluc3RydWN0aW9uIG5hbWVkICJub3AiLCB3aGljaCBvZiBjb3Vyc2UgaXMgbm90IHRy
dWUuIEkgZG9uJ3QgcmVhbGx5IHNlZSB3aGF0IHRoZXkgaGF2ZSBhZGRlZCB0aGF0LCBpdCByZWFs
bHkgZG9lc24ndCBtYWtlIHNlbnNlLiBJIGJlbGlldmUgdGhpcyBmaW5hbCAiZWxzZSIgYmxvY2sg
c2hvdWxkIGJlIGRyb3BwZWQgKGFzIHdlbGwgYXMgaW4gdGhlIG5leHQgZnVuY3Rpb24sIHRoYXQg
dXNlcyB0aGUgc2FtZSBwYXR0ZXJuKS4NCg0KQmVzdCByZWdhcmRzLA0KDQpUaG9tYXMNCg0KT24g
VGh1LCAzMCBOb3YgMjAyMyAwNzozNDozNyArMDAwMA0KTWljaGVsIEFsZXggPEFsZXguTWljaGVs
QHdpZWRlbWFubi1ncm91cC5jb20+IHdyb3RlOg0KDQo+IFRob21hcywNCj4gDQo+IGRvIHlvdSBo
YXZlIGFueSBpZGVhIGhvdyB0byBmaXggdGhpcyBidWlsZCBlcnJvcj8NCj4gDQo+IEVycm9yOiB1
bnJlY29nbml6ZWQgaW5zdHJ1Y3Rpb24gYG5vcCcNCj4gDQo+IEFsZXgNCj4gDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRh
enpvbmlAYm9vdGxpbi5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAzMCwgMjAyMyA3
OjM4IEFNDQo+IFRvOiBNaWNoZWwgQWxleCA8QWxleC5NaWNoZWxAd2llZGVtYW5uLWdyb3VwLmNv
bT4NCj4gU3ViamVjdDogW2F1dG9idWlsZC5idWlsZHJvb3QubmV0XSBZb3VyIGRhaWx5IHJlc3Vs
dHMgZm9yIDIwMjMtMTEtMjkNCj4gDQo+IA0KPiBIZWxsbywNCj4gDQo+IEF1dG9idWlsZGVyIGZh
aWx1cmVzDQo+ID09PT09PT09PT09PT09PT09PT09DQo+IA0KPiBCZWxvdyBpcyBhIGxpc3Qgb2Yg
YnVpbGQgZmFpbHVyZXMgcmVwb3J0ZWQgYnkgdGhlIEJ1aWxkcm9vdCBhdXRvYnVpbGRlcnMgaW4g
cmVsYXRpb24gdG8gcGFja2FnZXMgb3IgQ1BVIGFyY2hpdGVjdHVyZXMgeW91IGFyZSBpbiBjaGFy
Z2Ugb2YuDQo+IFBsZWFzZSBoZWxwIHVzIGltcHJvdmluZyB0aGUgcXVhbGl0eSBvZiBCdWlsZHJv
b3QgYnkgaW52ZXN0aWdhdGluZyB0aG9zZSBidWlsZCBmYWlsdXJlcyBhbmQgc2VuZGluZyBwYXRj
aGVzIHRvIGZpeCB0aGVtLg0KPiANCj4gUmVzdWx0cyBmb3IgdGhlICdtYXN0ZXInIGJyYW5jaA0K
PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiBCdWlsZCBmYWlsdXJlcyBy
ZWxhdGVkIHRvIHlvdXIgcGFja2FnZXM6DQo+IA0KPiAgICAgYXJjaCAgICAgfCAgICAgICAgICAg
ICByZWFzb24gICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVybCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQo+IC0tLS0tLS0t
LS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCj4gLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSst
LQ0KPiAtLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQo+IC0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0rLS0NCj4gLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAtLS0tLS0tLS0tLS0tKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tDQo+IC0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tDQo+ICAgICBvcjFrICAgICB8ICAgIGxpYnplbm9o
LXBpY28tMC4xMC4wLXJjICAgICB8IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1
bHRzLzY2M2I2MzE4MTBiN2UzOTgyZjM1NTM5ZjVkMzg4Y2Y1ZTUwOTA2NTQNCj4gDQo+IA0KPiBU
aGFua3MgZm9yIHlvdXIgY29udHJpYnV0aW9uIHRvIEJ1aWxkcm9vdCENCj4gDQo+IC0tDQo+IGh0
dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldA0KDQoNCg0KLS0NClRob21hcyBQZXRhenpvbmks
IGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdp
bmVlcmluZyBhbmQgdHJhaW5pbmcgaHR0cHM6Ly9ib290bGluLmNvbQ0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
