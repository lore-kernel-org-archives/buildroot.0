Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA0BC25B78
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 16:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B17D76079F;
	Wed, 22 May 2024 16:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jlT6M7zvdVDQ; Wed, 22 May 2024 16:07:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52A8160687
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52A8160687;
	Wed, 22 May 2024 16:07:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FC301C5D3A
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 16:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88F5F40520
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 16:07:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T0VmMJVRVZaK for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 16:07:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=8650991c4=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 092E540542
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 092E540542
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 092E540542
 for <buildroot@buildroot.org>; Wed, 22 May 2024 16:07:11 +0000 (UTC)
X-CSE-ConnectionGUID: +KME5hQVSdKT/lsIjuWKFg==
X-CSE-MsgGUID: WP6XHroBSBm/7FKFaJat9Q==
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="256608812"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 May 2024 09:07:10 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 22 May 2024 09:07:00 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 22 May 2024 09:06:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2GgaqfoFDrILY47IQlfv6H02hlSGuj0H9xYX6fAByyj8CFpei145DyFb6zmdLu3EhjEpjoEwpg3RdfxTepb4bvt7YTCWKubeqZ5jiPZDPLfwOVDyy2yrjFda5MYgplXkWXJ3ykM3c8QYaxIg+5WD+oqdxYO/7a5pGuY+QM++zWyZyvikZSjv4e6sTAZHMv1TZLmrn56glfXazPoQeT4N0OeOI9HlMx+UgNvbv+3pylLbZ94rsan9iBkOF4K+8SaLuZurdgFLQ2+Bkd1yS6g5v7C1fdfz2b+EZ17Yz6+XUBhMY3zJvM2QWw5OF/g4Ttok3aruPZpg1VEYUHXTBO5OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLg46b6onFOpnA28d9qpIcZjMfUsUP8ab4qposPpYEA=;
 b=H5K6Y/+xohr2+2rI/zWLcB/SJMridKV//KtNRkF8pc1WU/9rr++STSeHDrv/EoFO2+bxCYV4iWcai208OIix94CMGjH2RwRTmm+GPEPhUNB/dtvEKdAq/7s3NbdkE05NC6InvBTgVybsZvidniXXmGoFvmWc+vCRq6E9B/IvAbe/LAbLzskFojiScDLENWGvNwyo4bnPOUr43wrsj7vvYah9SEQNJ7XDr0Ec7C3s/DYObaXbfPaowQbOrb1W7wBaJpS0wbyD+e+4+w5W/3VBezx+miC5uWFK+NueM6sOTv3ZvH42P+1abu9YK0j9I2GoLXuSdAk6TdLJJCA+F5txOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) by
 MN0PR11MB5962.namprd11.prod.outlook.com (2603:10b6:208:371::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.38; Wed, 22 May
 2024 16:06:55 +0000
Received: from DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::3adb:8c97:94da:80]) by DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::3adb:8c97:94da:80%3]) with mapi id 15.20.7611.016; Wed, 22 May 2024
 16:06:54 +0000
To: <buildroot@buildroot.org>, <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH 1/1] configs/beaglev_fire: add support for
 BeagleV Fire
Thread-Index: AQHaoIuMD6YWAJwBsU+81NB69vek2LGPVtoAgBQssAA=
Date: Wed, 22 May 2024 16:06:54 +0000
Message-ID: <c6b4014930339dbdddcad705965e58e61576bdc7.camel@microchip.com>
References: <20240507143409.230685-1-jamie.gibbons@microchip.com>
 <20240509220334.1641f661@windsurf>
In-Reply-To: <20240509220334.1641f661@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6335:EE_|MN0PR11MB5962:EE_
x-ms-office365-filtering-correlation-id: ef4d3e39-a7bb-4c95-1eca-08dc7a793330
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?dmVxZWJVajhuS3RkVDNYdmpVTVpxMEdSUTR2MnhyeCtRMXFRdjF5LzczanNa?=
 =?utf-8?B?eXMzUVg0ajZldy9taW9NUUNUQ3VZWkVZanBMVWVOZzd6b1IxRjBFT2xIMlg1?=
 =?utf-8?B?N3VvdW1rNGdCTU5CZzNWK0Q3TXVCSVVWRDY4UU14Qk5GRDJOT3ZCZDRxWVdn?=
 =?utf-8?B?WlQrVjF3VnpicHdNZnRPdWJPczg3MWRUS0gyblhDdUZrWU5iSDNPTDRVUW8y?=
 =?utf-8?B?SEJuTUYxUFFQMHk4di9GNEp1cEF2QzRSaHVUcmM4UGdxUFJMYW1GS1JzZXY1?=
 =?utf-8?B?aWlzWFR2dFRFRTg2NWN4R0NydEp4SDhnRjcwQmpLQ3pDWDNzekVQVW9pVGR2?=
 =?utf-8?B?dWIyTVVYZFo3R2ZjbWNDSGJuL1dJdTVHVENYNk1ORERTb3JMTklkTlRRTnpr?=
 =?utf-8?B?eXVBZXFlMHJ5dzlITm82ZTA0Sy9sNlc4MkVqbG5IcUZLYzZDYjNKRXV1LzV4?=
 =?utf-8?B?NndKV2dEeVlQaVVwSHBlMHlNY0FrZTdDQk42MG9BS2xqeWlsVG00REhYTjdX?=
 =?utf-8?B?TWdDNDJDRUNvM0xzRjVBYjJBSEZUcTN2NlZrUUdCMmhBSnk0dThndDlTdUQ2?=
 =?utf-8?B?UkNjUmw4RXBWRmtKOUV1Q2E0Yml2ZFBIc2g3RnNYY1JGbDN5SVJoaHhKNUM0?=
 =?utf-8?B?TzI5bmJuTDN3RDRGK2pwU1lESnZnYWJYSy9NbnNsT1FxOHdRbkdyYWt0QVFH?=
 =?utf-8?B?TTNzS0loSnNKK2RQY2NmTk9EZmVwaWMzYnJOQzJqUmZkWUF1OTNkYmxkNXNx?=
 =?utf-8?B?emNtK1RuVnR1Zjk1eklaRXY1RTBsakhTY01Cb3VSQ09USC9lQlk2eVI5dmxt?=
 =?utf-8?B?VlRmZHRvYmF5Zm9MSk1lSUplMDc1cUtBcDZScFY4dXVhRTRTU3g2bzkxQTNw?=
 =?utf-8?B?MzhvNTFOQktyVW5OMm5kc3hhSjRkZEZValR1dTRVL2JzYzZYU2hZV3JkR1Zq?=
 =?utf-8?B?RGZUSnp0Q3h4amd4Wm94d250c3hEZDVwc05jNXV5eDM5TU9FZjJVczBta3Vj?=
 =?utf-8?B?bzh3Uno0dERrdndmYTFZRjBxamZCZmdUaE1LTENSVkVWTVFTRklaOHFRL1du?=
 =?utf-8?B?enhIYSt5RXNnQkxkajQyMVU0T1hoRUZpQkxaek9HNkZkdERoNFRXSE5ESzMw?=
 =?utf-8?B?MStIWllHdUhnK1c3ZlptMjFQK0RLaW9RYm9jaU82c2RFUTcxNERJcTJxWlo0?=
 =?utf-8?B?bUdTL0c2RTQzcDUvY0drUmVHc1RnK3VrWkJ4a2QzRGhUWUVqZ3UwU1dFL1lv?=
 =?utf-8?B?b3EySkg4S0s2SlEvN0VSVlJzVzFhSW02c2R4aTJDakppSXAvUzF5Smp0SjRC?=
 =?utf-8?B?VktBcnB3SDFBeFZydnpudHg4ZStWWUduaTZTMHhlNWZTVmh4T3ZKMmRuaFJF?=
 =?utf-8?B?c3N0Z2o3ZThKSXZLSmpDUndrclRtRzhRL2lJQWxNMzd1RmZjTTdBb2lZb0lJ?=
 =?utf-8?B?MTFRYXNqMm1hZWJlQkxBMWdYczJkSWZTbXZmSUNVRkxIbzFlZDZ6OElKM29B?=
 =?utf-8?B?TkUwZ0x5QWNPd0M5b0RocDU3WWRxMVZRTTVnNmpiMXY4Nm1laHIxdmVUd0lL?=
 =?utf-8?B?elh0cFdDZTNPZVJLSk14dnc0cXBSWFY0VzRoQWRqV2VqcDQ3SlJhb0Q0Q3N4?=
 =?utf-8?B?a3Y5UHFScHBxRkZiOG5nendkMWFjL2VPY2xhS295bWhBWGhMKzR6RGY5bG9k?=
 =?utf-8?B?VWYrQnFTRHhIczcrSFJPWFFiVE9FQTdyRmVtTitvWlJxMjFzd2lsZ3BRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6335.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1hkdmJwY1A1QlgwTTBBSW9OVDUrOW1wVHY4MnV4U3piOEl0dGxYSE9CMHBw?=
 =?utf-8?B?VlRaWkw5VFdLVDFLQ2g0OVdGQjh2YlFrRTNqMGRMM1RMeE5lR2lsbWFLVDZS?=
 =?utf-8?B?a3I1VTFWWVpCNnBOb2J6RTZlaktXNWd4bFZ2aFZOQmNnWFB2clBHbHVndzAr?=
 =?utf-8?B?V3NmVDJBdDBKaXpybTZBenBFaWZZYWs0WG41UURvckt2UnJoRGlZOG1kendE?=
 =?utf-8?B?Z0xxaUhJRXhObnBuV3EwaWM0T1JIaThWeVhJam5HNVZSb3F2eWlDYmJJdWZ0?=
 =?utf-8?B?djdMV2ZUcUlIZHZMT0ExMlM2MnhwL3RQbHJ4c3JCSUxWLy8wZjZvR29HQW9i?=
 =?utf-8?B?TExhTnlQdU1ZbjU3S3hMYmpydU9LMnM2bU1KUTVWSEZFY1IvVmlsakhKamRQ?=
 =?utf-8?B?NG5tcWlzSUROTDZYT2plSG1JdFgxcmlzR3ZGdzA2U1Q4Y0E4TWdETmxFTXNi?=
 =?utf-8?B?SGVVMXFNOXkwMHBTbDNVSm9CUEpBVDZDV1FnKzg4UU1aM1FYRUpodkZybVFy?=
 =?utf-8?B?QnYwUndVbXdDTURZdmkvUGEvcTl1R2E3U1BxYzBNV3d4c01LSzh4UDM1T283?=
 =?utf-8?B?MUFkY1ExMmVEZ1ZqbzFGcktrU0I2VFJ0WThRTlJpZmtHVHhIN2FkN2g5czA0?=
 =?utf-8?B?TmVWcnI1bmxYNVdhVU9ESTFLMlFxQlB3U25XMHdBUnBkMGtpTlQvVDhlZnZI?=
 =?utf-8?B?UWY1dHZ4WG5aTE5mTUR6bFVjbTJVNktvVHNKMCtiWXdWb2tsUmJIRHpnMGE1?=
 =?utf-8?B?akJLaS9IMHRWa0djZFFLMm9Mb1ZnUi9BZDFjbHAxQzJlUzl6eGdock9lZy9l?=
 =?utf-8?B?NGVxL1d6elIyZGY3NWxhZGVIL042OUY0cXdTNVI0RGtYeGsvT0JsazBya1JS?=
 =?utf-8?B?TjNYU1Z3d1pvYTBhZGJ2Qmk4MVJiUjUxeHdGVEg4TkgydGZOM3h4cjR4bEFL?=
 =?utf-8?B?UEtValF4L3hWM0JxVUtBbzV4QXdnRDRhY1YxbEJoQlg2aWZFOHk3d25EcEpV?=
 =?utf-8?B?R3p6d096OC83ZjZmY0lhM0g4UndDeGMwb1lwRDM1OEI1dDZTa21sUUtyME0w?=
 =?utf-8?B?eTdIb0JVK0E0QU04NWJqdG9KQi9iQmMyeUlrYk5ieEVoVmZpNmFkRWJuVlhF?=
 =?utf-8?B?S0VNcmRPRE1LVGRtK3JBMUtUYisxWGpJWEFGbDdCMGtqVU1PU2dvNG81TXBn?=
 =?utf-8?B?T1A2V3ZRSGd4VDU3NEpDdXdlSllOUWt0OWp0UFp5a0k5cy8vd1BaeDNMeXlm?=
 =?utf-8?B?ZzdRbDJwQUhlQWtxV3hBY25CWUFyc3phL2ZjMFQ1SGJTL3NoNkxkclZvUVhF?=
 =?utf-8?B?QnRqOHUzalhMTlAxbjlhVGVueUN4L01KMElDcktLU2hRRVJOOGcySWVrV1k5?=
 =?utf-8?B?MmYvbHlidFk3RkwzWDNVdllpOFR6S0ozR2ZMalBYOW11M3UrN2NyR3lmN3Y3?=
 =?utf-8?B?UXMxRFFwZ3BZeFpUaEw5K0pVSzhLdjVyOG1Vbm1tSTRJK2lNK0xJdnplc2RM?=
 =?utf-8?B?NzZTdUU0UHNUSG1vam51Y09kL3g2b2tUdVFEZG4xYk8wL2NYRlVSM1R4L2Yr?=
 =?utf-8?B?dmdzK21GdjVpZXk0RXpUdnI2N2hkRUFjR2hDekltU24ySTl4akQyTXN2OGJs?=
 =?utf-8?B?Q0Z5MUo3UnBTVm9wNkNpTkE4aWtsTWpIakJ0NC9SOE5yUVBvZXJPc2VMS2dI?=
 =?utf-8?B?VHlCbFZoOUVGSklncG1Sc29Dd013ZjZ2OUREcld0TFFFU0d2RUI2QjUyNlRW?=
 =?utf-8?B?cVo3VHhSbEZ0V3JPUVp3NlQ0MW1WbExRL05FNXBxTlpTSTA1bWl1cDRsWUhE?=
 =?utf-8?B?RGtXZjRocFJHRmRpUEZpNGxlUzBoT1EvNDFvaUl4aEhid2pQcW1Wc1IwVURV?=
 =?utf-8?B?U3pUeW1kOGkzMnJ1NmRSSmhPVHBkVkw0ZEc1YlNpN1l3d2U3d3hKdVhYeExh?=
 =?utf-8?B?Umh0bmZyQlhUL1lJZkplYXJON25jYjNhRWJqc29vN2hqRnFnMjRKREJhYnVB?=
 =?utf-8?B?YUU1VmhHeXJwSmVZMHFzVW9ZNmFmcyswZmszY1ZRb24xUGc0L1FiMFZUTklh?=
 =?utf-8?B?dzdGbGlVcDg3dld1OHlZWDNPZVFPZWtTY1NmUzd0VVY3bGJ4RkZFQWpjV2pV?=
 =?utf-8?B?c2NITXBaWnVndXg4M1FYVFJWSHlvSEttdERlQ0U5c3FNZXRsK2R0K2cvWUVi?=
 =?utf-8?B?R1E9PQ==?=
Content-ID: <7C3BD60D31C2B54F9CC5F83B9952FC07@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6335.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4d3e39-a7bb-4c95-1eca-08dc7a793330
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2024 16:06:54.7888 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ocTnl4NDMgXajVeLFx1k39aYVMnyFPGX0l+sOcCz7tDWWfwOQa5MORU9cBRKlpmVz9QjTS8EnwCX37rkHce4jlMqqisbdPJfnjHTZdCYL3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5962
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1716394032; x=1747930032;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=sLg46b6onFOpnA28d9qpIcZjMfUsUP8ab4qposPpYEA=;
 b=Wl2aHs/SWSlAVP+j6B7yqtBJ8/rtAdUqqnZceJffGltIeqhgIsJP7Y0V
 GJkak76aIISURS0q4r3zSDv6AhHhqQjPrIVqQPWKM/PGF8wAUDo6BHSjI
 +F+FgfQi8CVfcRdB46/7hrFqHIrsJd1G5/e8N+4XGJf+Dt1ol+/RQWHeg
 QAT3BxxY0BMzAnhUgF6O7ZR6CGI9AE0DLrdIt8oY3ojtUwFPLjK/uvRf0
 yDTQOI8hUgf/f4QBobLs57JTeIPGtRXwskRouoZ5/Xv9u1/uK+ZUfHoz5
 /362bksG5yEPvZtJuJHqaY8p5pwzqEk0IVk+yag/ZO2pT4UiLOkc5UQ8W
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchip.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLg46b6onFOpnA28d9qpIcZjMfUsUP8ab4qposPpYEA=;
 b=mdM6e4UbNbzhcBqco+EZNkorrUwsxMwl9WLztTf6b4qSwcYeCu4bvb9PQji9SRQorec03cNC5ur2KplOg4hbGhQOdMdG6gh75qiI3SAPmOnRGZ8lkPiflkdtoHXWSICKbJ0i3oLPFhRk7ScZ4NzT9Z1bZ4ZcNq5kvBk17cUzRSL1OgnINEfrtjpEin+kkgZhvtvD3Gc0HSeB9CTzNbfwYDevF4KIn7eTJzi6/Y3MDgNm8VapJuxflZICQzHcz7PJbm2+WdWm2cirpI3R1evA+YRlhP0l0RLKstAMfM23JquTVGap01z6IgmbaSgQpEePDZr82h3EcWR4p0uBVZjkhw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=microchip.com
 header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Wl2aHs/S; 
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=selector1 header.b=mdM6e4Ub
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
Subject: Re: [Buildroot] [PATCH 1/1] configs/beaglev_fire: add support for
 BeagleV Fire
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
From: "Jamie.Gibbons--- via buildroot" <buildroot@buildroot.org>
Reply-To: Jamie.Gibbons@microchip.com
Cc: Valentina.FernandezAlanis@microchip.com, Conor.Dooley@microchip.com,
 Ludovic.Desroches@microchip.com, Nicolas.Ferre@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Thu, 2024-05-09 at 22:03 +0200, Thomas Petazzoni wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you
> know the content is safe
> 
> Hello Jamie,
> 
> On Tue, 7 May 2024 15:34:09 +0100
> Jamie Gibbons via buildroot <buildroot@buildroot.org> wrote:
> 
> > Add support for the BeagleV Fire, the Beagleboard SBC powered by
> > Microchip's PolarFire SoC.
> 
> Thanks a lot for this patch! It mostly looks good, but there are a
> number of small questions/comments below.

Thank you for all your feedback. I have been working on implementing
the changes and preparing a v2. However, I have some replies and a
question for you to gain clarification on your request.
> 
> 
> 
> 
> 
> > diff --git a/board/beaglev_fire/uboot-env.txt
> > b/board/beaglev_fire/uboot-env.txt
> > new file mode 100644
> > index 0000000000..1b996ed76b
> > --- /dev/null
> > +++ b/board/beaglev_fire/uboot-env.txt
> > @@ -0,0 +1,16 @@
> > +# this assumes ${scriptaddr} is already set!!
> > +
> > +# Try to boot a fitImage from eMMC/SD
> > +
> > +setenv fdt_high 0xffffffffffffffff
> > +setenv initrd_high 0xffffffffffffffff
> > +
> > +load mmc 0:${distro_bootpart} ${scriptaddr} beaglev_fire.itb;
> > +bootm start ${scriptaddr}#kernel_dtb;
> > +bootm loados ${scriptaddr};
> > +# Try to load a ramdisk if available inside fitImage
> > +bootm ramdisk;
> > +bootm prep;
> > +fdt set /soc/ethernet@20112000 mac-address
> > ${beaglevfire_mac_addr0};
> > +fdt set /soc/ethernet@20110000 mac-address
> > ${beaglevfire_mac_addr1};
> > +bootm go;
> 
> Nowadays, we try to use distro bootcmd instead of custom uBoot
> environment scripts. See
> https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/doc/develop/distro.rst
> for some details.

Could you clarify the change you are looking for here? We do use distro
bootcmd (#include <config_distro_bootcmd.h> in our U-Boot config). This
scans for our boot.scr, which as far as I can see is supported under
that link you sent. Are you asking for us to replace the boot.scr with
extlinux.conf? I can see other boards use "extlinux.conf" or
"boot.cmd". Our preference is to use "boot.cmd" as this allows us to
use FITImage and FDT set. Could you clarify your request?
> 
> > diff --git a/board/beaglev_fire/uboot-fragment.config
> > b/board/beaglev_fire/uboot-fragment.config
> > new file mode 100644
> > index 0000000000..861593bd7e
> > --- /dev/null
> > +++ b/board/beaglev_fire/uboot-fragment.config
> > @@ -0,0 +1 @@
> > +CONFIG_MPFS_PRIORITISE_QSPI_BOOT=n
> > diff --git a/configs/beaglev_fire_defconfig
> > b/configs/beaglev_fire_defconfig
> > new file mode 100644
> > index 0000000000..3779658509
> > --- /dev/null
> > +++ b/configs/beaglev_fire_defconfig
> > @@ -0,0 +1,40 @@
> > +BR2_riscv=y
> > +BR2_RISCV_ISA_RVC=y
> > +BR2_KERNEL_HEADERS_VERSION=y
> > +BR2_DEFAULT_KERNEL_VERSION="6.1.30"
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> > +BR2_SYSTEM_DHCP="eth0"
> > +BR2_ROOTFS_OVERLAY="board/beaglev_fire/rootfs-overlay/"
> > +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglev_fire/post-image.sh"
> > +BR2_LINUX_KERNEL=y
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call
> > github,linux4microchip,linux,linux-6.1-
> > mchp+fpga)/linux4microchip+fpga-2024.02.tar.gz"
> > +BR2_LINUX_KERNEL_DEFCONFIG="mpfs"
> > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="microchip/mpfs-beaglev-fire"
> > +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> > +BR2_PACKAGE_MTD=y
> > +BR2_PACKAGE_DTC=y
> > +BR2_PACKAGE_DTC_PROGRAMS=y
> 
> dtc is needed on the targe?
> 
> > +BR2_PACKAGE_BASH=y
> 
> Why?
The above four packages were used to support the gateware scripts.
These will likely be removed for v2 due to the changes in those
scripts.
> 
> > +BR2_TARGET_ROOTFS_CPIO_GZIP=y
> > +BR2_TARGET_ROOTFS_INITRAMFS=y
> 
> 
> 
> Could you have a look at those different comments, and submit a v2
> that
> takes into account this feedback?
> 
> Thanks a lot!
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
