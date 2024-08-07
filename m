Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B334C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 18:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24C704065C;
	Wed,  7 Aug 2024 18:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1Kn9CaAlSzs; Wed,  7 Aug 2024 18:09:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81AFB40651
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81AFB40651;
	Wed,  7 Aug 2024 18:09:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0BABE1BF363
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 18:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBE0180835
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 18:09:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ud3mhHfgbDYx for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 18:09:05 +0000 (UTC)
X-Greylist: delayed 3123 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 07 Aug 2024 18:09:03 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 14D3580495
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14D3580495
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=210.130.202.161;
 helo=mo-csw-fb.securemx.jp; envelope-from=nick.whitlock@eizo.com;
 receiver=<UNKNOWN> 
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1802.securemx.jp
 [210.130.202.161])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 14D3580495
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 18:09:03 +0000 (UTC)
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1802) id 477HH7Lj1598898;
 Thu, 8 Aug 2024 02:17:07 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1800) id 477HGgYi1446243;
 Thu, 8 Aug 2024 02:16:43 +0900
X-Iguazu-Qid: 2yAb2N10YIgtbRVXqC
X-Iguazu-QSIG: v=2; s=0; t=1723051002; q=2yAb2N10YIgtbRVXqC;
 m=OLMNfcRgjHLX7q9FrN2edv0yBYWcapK724+1Y4cdVM0=
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp17010005.outbound.protection.outlook.com [40.93.73.5])
 by relay.securemx.jp (mx-mr1802) id 477HGexo2551138
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 8 Aug 2024 02:16:40 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L0BjWyED66AZ4JfsP8IKtGnpeEh7DO2Y1sOiG6Y4j7SrxAsZxdl04hwCvz/zMZlBzxYOzkckAdC0dfPwpZ2CUze2MvRRQSsaAzrnaaTe7WuXXrnMPONgh7VL5EcT1E8B0ttLRXGNg2RjngGzxMnKq8hv4O2ZLR8BehiI1+v7gsIy5QG2z0ody3q/vzc+5NOVgqbVnrR8hs3Yqjcmyy/nykxMI4H5GhRZ9wY91h+xX1WpCwK75zV8a5g4NKzMBDo2BEhLykMQQdMeSmp9x9nWPyjYpZNdlCHtHe2d4jW+43m2pTTqnQPYX4ng1903Sg0HuySOa4uqT7vTz1jRXCmCgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OEjgLDGqgJB/mK0SgjBQRqaBNAc/sHiBf2mqZ1tXBk=;
 b=XUCpzf4A2A3BaakbKUe8vfLkODWp5LehhR+66AKmnu+ePCnZScTkoRV++bFO1pP0n2ONMsmrY+ySMDjozgJq7o9SLz/mimh9qTWlFVHs/hSGobhjAZH5EZxfbfYXhhpKoaAhaT4Vpog8OpgTSnBxMgkKzlw2x70yuW+bxyqkTMumR+Zt8k8a5n1QKnMhAKP9HCpyZezt9is2mySkIDDmBYOAwFp+evynfPae6SSkPLbLZY9rEYdWjkVAhpUj1usqB0HZUtAi7haG/SqOU5kJVe9pmwl+1rI9/J/qeltuP/UHggbWUxvfChKvrlldLFMuFNkIakS7k3bWrC47YSp9MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eizo.com; dmarc=pass action=none header.from=eizo.com;
 dkim=pass header.d=eizo.com; arc=none
Received: from OSAPR01MB4561.jpnprd01.prod.outlook.com (2603:1096:604:63::12)
 by TYCPR01MB6589.jpnprd01.prod.outlook.com (2603:1096:400:ab::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.14; Wed, 7 Aug
 2024 17:16:38 +0000
Received: from OSAPR01MB4561.jpnprd01.prod.outlook.com
 ([fe80::6e34:3db9:1ae4:74b8]) by OSAPR01MB4561.jpnprd01.prod.outlook.com
 ([fe80::6e34:3db9:1ae4:74b8%5]) with mapi id 15.20.7849.008; Wed, 7 Aug 2024
 17:16:38 +0000
From: <nick.whitlock@eizo.com>
To: <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [External] - [PATCH] package/nvidia-driver: bump
 version to 550.78
Thread-Index: AQHa6EhN8AR2Z6Clu0SwkHqBJAHLtrIcCcQg
Date: Wed, 7 Aug 2024 17:16:38 +0000
Message-ID: <OSAPR01MB4561B7C6E4EB47DADDCDF9E084B82@OSAPR01MB4561.jpnprd01.prod.outlook.com>
References: <20240513155907.104270-1-nick.whitlock@eizo.com>
 <PH1P110MB1603A56A788CF657472E9F8C9FE2A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <OSAPR01MB45613F3A13D852BB4C96256D84E22@OSAPR01MB4561.jpnprd01.prod.outlook.com>
 <20240806233322.679a8d3a@windsurf>
In-Reply-To: <20240806233322.679a8d3a@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB4561:EE_|TYCPR01MB6589:EE_
x-ms-office365-filtering-correlation-id: ed12fa78-e744-404b-5e69-08dcb704b279
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|15866825006|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?PGrmaSUxtYD61h+BF/LZ67oa0NWp1IDg+pzrMDL9jUafQqFr1gecm0pRfWu2?=
 =?us-ascii?Q?22eGJdA/L6yuazvBlyvMxssaqi7kWgSwPvPlQxAg2aABGVYdx2DwLkdnWavk?=
 =?us-ascii?Q?917srZokHpTV/knMCzF70YuRQ3CkfFVIdKk9ylyj95y3WjBSMUYbyQWx6Ruf?=
 =?us-ascii?Q?P+Vz4dCH+wmuCx1oL+EQDN5t2kp1t7bFYrPgg2iA1Nz3mXZ8SrnODIFCK52M?=
 =?us-ascii?Q?XJFp4NBrgmJaYsMIzLQjqA6hOxFfecIhWT/yteFBvKR8oL3z2HiPCmQtxVcE?=
 =?us-ascii?Q?zGhi3p0JtNqJRkiL+nepFJhbi0ib/EaHjFu7m8yBafmB5UzgOulbu9r3ml0Y?=
 =?us-ascii?Q?+NkDGAOJPb6NqILwesNs3XHjkz4UiktL0QhOQREl6v9ETA+it0dDuUet6JsS?=
 =?us-ascii?Q?CXJknNA4Zwjj3aRmNW9aaJTLxwHjH0F05Y11MVBqGAQyOPlP7sTPxTikxAZ+?=
 =?us-ascii?Q?CI86VOqU2lhwVO8yRjvpEEwSk9L3B/ZW6HdOUNDP7z8msh4JTsP1MWq+qWTT?=
 =?us-ascii?Q?oqZ7YYuf2rRHB5ffL36KJldJEPkjpMi3Lx/faot2ke45LdDLpN7lUv4AomS9?=
 =?us-ascii?Q?Q5ZyeJE8HZUSMUZwQjLxN6DSBeB4dHwCdHQnsMB2tIn5wpHgv9s4toEBkQwJ?=
 =?us-ascii?Q?rl8aSnFVgkXcHey7vt1b3MuvfK3KoebgT/xcuRueEJJPojal6Vi0nHW4zAm+?=
 =?us-ascii?Q?jThs4ns7wyhAE5MxMGHwlMMOKg9XMGvrFmJKkNsDw1iWrRwJNRvrxUbAR7RN?=
 =?us-ascii?Q?MIOiY8wUjVjm9jzqMDse4OqRCBhconhCH4K4IG8xDWp4stm9lw2zjj2t1q8e?=
 =?us-ascii?Q?blMNXaOGZoTgDJAc+f4omEK3QEqFDSWnfj3scU0BAX8Gt/jjRqn+gfNUI/mK?=
 =?us-ascii?Q?M8vMrRbDIC/KOX4kDpK1+AHrqFhhXkAvNNfreW349y9CBBOogdte+I5oh/9j?=
 =?us-ascii?Q?z5csPLegb/TEa8PNCxXIUdKqEFi7VsDhBJ0VWUbafghWZKc0cjv/6GIQuHdK?=
 =?us-ascii?Q?fibyiigDXtn0PP1ZVhlvuRK4GxIlQ/Mghndc0E+aqlGvjy9bvb+tCWvAMdwL?=
 =?us-ascii?Q?9Bg0/amEHQBtBzeTk4DponXVSMRULR2hVcl5ay8WOdk4tpnsU5SaOPD18GpN?=
 =?us-ascii?Q?Go8X2BAJS620Ln2U/9C4vfIHD95++5FgA1dUdEXdd3tSVYaSz8ugRAvgy6I8?=
 =?us-ascii?Q?ckrwe9ruTlQVGB7Gcp+WStewBIDjYdpOxjpEd2dHBuGZN1JXhh8XNDHX9A8r?=
 =?us-ascii?Q?MCEhQMTVlGlHrk3iulzCTBtfgarT0kI2yVEHT+55TbDb05r0+CDP+2MiXA1U?=
 =?us-ascii?Q?DT8YjzYKB0Wi7S1PM0daO4uO4p/MCH4U6hdyzeXsT/6E9FjDuzjMN2zrM+ZY?=
 =?us-ascii?Q?c0ykPoW0oWjJ6BdCnG09UUTgm7BM6J4xx4UOd7ztCKR342IlnTUX/Xjek2sL?=
 =?us-ascii?Q?9YMd+6VR5Is=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSAPR01MB4561.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(15866825006)(41080700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bgwxuQaBIZ9sSXNFYq5fpt2mBf06bS8T7PAcU9MONe3Nl6eJPEUk2ZVfaU0Z?=
 =?us-ascii?Q?tqnFDoLXtd0s6DCdDPMyEsZRzzzH8iGJ6jZP3DVc7oroqqCQ44wN9GooJlfj?=
 =?us-ascii?Q?Y6hWGDLUZOAAg8ZaNQ30Few1XMIE01UbFmMKNSGydpGtCs03s7OuXLxJszS6?=
 =?us-ascii?Q?tcn8kXrulICNV7n1werTTUzSQXGnHdWHr18njr/bkGvJ4SXg5BrrnJu5AgWK?=
 =?us-ascii?Q?uSeKoeVQ5Po9e3XLjagFTAr88av81a6BO/F7ltihjnozf7lI8WlZ8lH6vALz?=
 =?us-ascii?Q?0ehkNYG8aaKxhWxS9hBnOAaXQIO0gMilZMcOZgtdTDNhKtVCVCjj6t/GGqe9?=
 =?us-ascii?Q?2rQqs8SKz7bLm0tyETtJrtluYO6VI6Oek4lu81p3l5RUg3Ay73pGhEMpH+7e?=
 =?us-ascii?Q?0+qNheYmsKZlgZ5j1VK9s+r6SSGdS9bG591zSxDjiIxulQW+9REhjEOlkJgj?=
 =?us-ascii?Q?+IzqKtDLGM6GISV8B3AzRZUcrvty/vHdwPlXfXysi5oj2fwfrN3QLBO6GJf1?=
 =?us-ascii?Q?WVrSCFxyudWIqjgSteNGfZRn0W+TpTl6DsqLvmVkamdHMIFsaiWudRnEgwYm?=
 =?us-ascii?Q?1CMKuq4TjFOM+lgXII5+Tgah2U50V9ERRvaW/g2qCOtxHhIj7Y+Q1COS5f10?=
 =?us-ascii?Q?6AudhSw/s/BBa6nqWLNE036Gvx/VKoN2sMGoPUx9aIIEKOOFXg5S7hW3o93f?=
 =?us-ascii?Q?PkjulxqHw+bK0IjU2AkEMneXDuoiECvtTjKPA9CHLIXHuiLH/ue9ffy2eBd7?=
 =?us-ascii?Q?3z0J3MZ/7k4u1J3g0g4CxWJOMM6CYXS6XdjA/DGy8aLbYzVAKeZ4r3feaTvX?=
 =?us-ascii?Q?Q/6jkYvJwdgYl1qTOMqbsWxmpjfCgSsBxhlFF+NjFwxOkBdzRQP7sGYlPOem?=
 =?us-ascii?Q?xVbO27DhGWjIpxEEtvW3gOmBgwy56OH7br1GzRgYku1VTwMkvv3pV8x5BPU9?=
 =?us-ascii?Q?Z1Xu+k7Wpj9EOnEovQKN16oxfh4EHCnJYrAtcC1EewyIuHfMy4oE4odhLGiu?=
 =?us-ascii?Q?xttAhM/A97ltATj+f0EbK/pO9BkgLwwxSrxk9unibp0XtX04zBCvEOjhgrkF?=
 =?us-ascii?Q?GXLOZqEce90u7tZv+j4+Ajee+hVpCmNRHRhut6cjmqDn+eVGbgQXCVwwkem7?=
 =?us-ascii?Q?MvDZ4MsZyYO9Dc91SdmvhmeY1rFKozzwrkeg9hVzDIWZZSoWf+g9ShaFdpG2?=
 =?us-ascii?Q?AA7Ltc/xpelJMDYIenTHuPG2iAorYof+dbxLVbR0Yxin0yOMk0SMvCiapsy3?=
 =?us-ascii?Q?+IKsz/gzYmiPeiw5Sxnelj85tgKx4qahYTIbym7vLGv1SFj1J6ul4mjY3eSd?=
 =?us-ascii?Q?0X4SLYJ7VN2vmD873AX7rM8KUV1pObt1Urj91jlruLH02M2YdyPkG1qRNYEA?=
 =?us-ascii?Q?MtW9QgelWZogdr8rarb6j3aY47neYX0w9Im3HsUVnkTL3AKg3K93cQd7rEsD?=
 =?us-ascii?Q?nsnal2evrHc5wJzT/saxr/h5VnsJgvDsy1ZrVgkSLwgeYZy56uqQyVZDSa1x?=
 =?us-ascii?Q?OgDoJIzRil/FhiZ114v4UZGf5uSCdvbFb5nd3iLCtTl4bUtHlSfOoYqaD+0r?=
 =?us-ascii?Q?Ymo9cn6J+PcXSurx6Om8TTjEbcbgDexC/H6xKT8WACgdgB/0/+Voq5M7/fMZ?=
 =?us-ascii?Q?Eg=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 7/cxmqeGmZbAXfJT9bvgIplYk1AdwjSJ+DAAQsTYnHQ0zaEYgzXrDssgA6c8ufIarH3YrBP51QDOJyPDWevfulRa7yA6khCdeR7xpaH7vMOCXhIQSfNAHZjyIHUra6WpfGK9sidNAydPOl49muYXLmG0dkqIUfA2ZtN6Me7OnNCW5+WdH9JBoHIoo6G+ln5/g+k4Eo8CdN1L4QwO4tsui/bJL233RAH109Z8Zc14uDrlKR6xx49cQ6Bj9JON/zlPmgVWXrOp29BacAwvuX5cZKUpzpv1c8XeYtRhwuD0JSCN2aFW0uSSCI7DUsuyvaLMEfV+trFBGBv8eKezf3nqy8Bq4UbthHe29wHYoi4P91ZVuWoEBUnvUrSnhDGyTrPlziEQq1QCexinug2FDtU/g4Y0Co3B5eBWo8mUvIIWkCYK/jAunjwsO91HgIcQo7B7uRKiOe8ld5Fzn3GMK47RIC71L537px9kSeN3CuHC1jJ248Mk7biaDff7yUvwtm/omCuoH6x/eRenU8Nu0Eh6cQx48V3ZrKCKKG/WGZHhHQCGFXJYV12r/foSM92amC7OlDoVQVGorJNx6mTy+z8WrA==
X-OriginatorOrg: eizo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB4561.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed12fa78-e744-404b-5e69-08dcb704b279
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2024 17:16:38.1308 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2329f911-3157-4dd1-9105-ef837241b69d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0XS/HDF8A72cbhXkY4uIAwxP7tLx0PMwd26BsynZcSeV3WxLgUzT10vpp75QfRmkkuYn1sNL03QNr335miqnMW5HcDFPM0QsCMtkzXJQqqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6589
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=eizo.com; h=From:To:CC:
 Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:MIME-Version; i=nick.whitlock@eizo.com; s=key2.smx;
 t=
 1723051003; x=1724260603; bh=1BRbWGImtbhiZM/tC0prQmxNChTK30wX2/o6r6XKxSo=;
 b=XHq
 YCfzPkgNCTmzMA2vAQ6AGz+83U36VNnUUkis3sddtxABkzs73dx2YGZL+InZ4AmOzIz5zUVOhUVeE
 xoiJPMrHKR03DQA8fDgaYwUbGdnNCiP/BQpTUQyxdAXVppnF+SeTxZQe20Rhht6T6OX8LksnJprBO
 tsEXxnNjwq9H9T7O6bGSPqcJPPyw16q4ErYqEB4IgnC7jI2yvKc1vwXggMIn8dsuT91vFzBrzbb5V
 0nDr7JjsKJpvLJSYjeDKHTYU5Ou1KEitnd+anG5TyVcTmFw7BoT3Sk5EbmFeein9EsvyHbveL2WYf
 7pXvxpA5/nFmBYgmRP1rGSD6JCgOe+w==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eizo365.onmicrosoft.com; s=selector1-eizo365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OEjgLDGqgJB/mK0SgjBQRqaBNAc/sHiBf2mqZ1tXBk=;
 b=IMsZIvEQHQQrk/JR1kmcL4heZUITFG2edQt0lylQroVacJsfdPdSnhfa94pmr6Eau5P5Xe8Dk3g1awVK98JtrbSoIeg8eg1vYkENY6s+uyGGGoF1ePNIz9Y8mqzo7Cptj1UdFv/nFv30wdfMNJ6Qfkbq3Obl1EbgxFzzmrqjlFU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=eizo.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=eizo.com
 header.i=nick.whitlock@eizo.com header.a=rsa-sha256 header.s=key2.smx
 header.b=XHqYCfzP; 
 dkim=pass (1024-bit key,
 unprotected) header.d=eizo365.onmicrosoft.com
 header.i=@eizo365.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-eizo365-onmicrosoft-com header.b=IMsZIvEQ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eizo.com;
Subject: Re: [Buildroot] [External] - [PATCH] package/nvidia-driver: bump
 version to 550.78
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
Cc: vfazio@xes-inc.com, yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas,

I can look into adding a version selection mechanism.

About the GTK acceleration. The library (from my understanding) provides GPU hardware acceleration support for GTK so it renders on the GPU instead of on the CPU.

Side note:
Originally when I wrote this patch, I wrote it with the proprietary NVIDIA driver in mind. However, I'm now aware of the open-kernel-modules package of NVIDIA and I may submit a different patch to add support for this (bearing in mind that the open kernel modules only supports Ampere and up).






-----Original Message-----
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com> 
Sent: Tuesday, August 6, 2024 5:33 PM
To: ERS Nick Whitlock <nick.whitlock@eizo.com>
Cc: vfazio@xes-inc.com; buildroot@buildroot.org; yann.morin.1998@free.fr
Subject: Re: [Buildroot] [External] - [PATCH] package/nvidia-driver: bump version to 550.78

Hello Nick,

Sorry for the delay in getting back to you. Thanks as well to Vincent for the review.

On Mon, 13 May 2024 20:03:56 +0000
<nick.whitlock@eizo.com> wrote:

> If a selectable (or user-enterable) version number is the consensus, 
> then I'm all for that.
> 
> There isn't currently a way to use recent NVIDIA discrete GPUs (read:
> Ampere and up) for GPGPU in embedded spaces until this gets resolved 
> though.

I think a version selection is the only approach that we have. Indeed keeping support for older GPUs is important, but supporting newer ones is also important, so we will have to live with a more complicated package that supports different generations of the driver.

Nick, do you think you could prepare a new iteration with such a version selection, but also taking into account the rest of the feedback from Vincent?

> > +config BR2_PACKAGE_NVIDIA_DRIVER_GTK
> > +       bool "nvidia GTK acceleration"

Could you also give a little bit more details about this GTK acceleration? How come two additional .so files can "accelerate GTK" ?
How do they interact with GTK ?

Thanks a lot,

Thomas
--
Thomas Petazzoni, co-owner and CEO, Bootlin Embedded Linux and Kernel engineering and training https://bootlin.com

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
