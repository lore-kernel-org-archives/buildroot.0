Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9D1C001DB
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 09:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D676C81858;
	Fri, 11 Aug 2023 09:09:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D676C81858
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id faFob2epNeRe; Fri, 11 Aug 2023 09:09:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 123A681767;
	Fri, 11 Aug 2023 09:09:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 123A681767
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F7841BF336
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 09:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67CF140469
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 09:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67CF140469
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iM2r-3H4sOz0 for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 09:09:22 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90F5B400D1
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 09:09:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90F5B400D1
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="165982118"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Aug 2023 02:09:21 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 11 Aug 2023 02:09:15 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 11 Aug 2023 02:09:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GiN2BPon3z7KkGR7H8B9Gg6yBiAGIIWCRDXd0QKENPMYmxQgL15p060cFDjZbTrCHT0dJwOdZIb9vSOx/kMJ/igSeR49a65FBJCBhPLLhEKvJ5NvefQPDeY1g6y2g05Rte3iTRH5KY7ZQUnT63uSmknQgidX8+ZiI4TZZPyIOaXa/wwjHC9x+z1TgbpftHryqsW0tpwRHA4blYZ7VMTvMLkAczsyNVb8caJ//JCA8dkQ0qKK7c6UetVFAjM+fiHz2TjoxjPQCF+8/KS4jqCPnljN05ye73UeDTS8XQOm0XyQ7gJu7HBOHnvi1+SNiGW2WLziDLAe4b5X4E/ULQqHeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/6BN2KTtPM22cw59t6nNkYx0/IE3DBplhWbcov+KfE=;
 b=hj0i1ZIYIlUY1JbzF7HK6CwL3OSKT9h0xTqPNwLEGVNGqRi96y2dYnqsNWjEOSp+YQqT1j6VQtcSmvp6v5aSA3UiTMbhJ4xvBAHu7wiJVta9oR9wT4pqJxQ/F7BfZWodN7J+XTGhLu3v/RaSDmw3MPJrdTUPKMMXYV2nBq97DLegro2cA0CeQIFQcYs9r+21XknFgPPilbXTeRAt3rRPP4ObSKAeYUeynHpg3OLBGEycF6yQMsr/dkgW29N75vZvxIS7k1i8buUpg+JNGynbjJq6wEg+E9Tjv/tALLFzUoh8hCmbvoOuVoyOoXUoNiovzQIYm4U81l/gUt58PEXx6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) by
 PH0PR11MB5189.namprd11.prod.outlook.com (2603:10b6:510:3d::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6652.30; Fri, 11 Aug 2023 09:09:14 +0000
Received: from DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::2644:bbc4:c4eb:cf6d]) by DM4PR11MB6335.namprd11.prod.outlook.com
 ([fe80::2644:bbc4:c4eb:cf6d%7]) with mapi id 15.20.6652.029; Fri, 11 Aug 2023
 09:09:14 +0000
To: <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v3 2/2] configs/microchip_mpfs_icicle: add
 support for Microchip's Icicle Kit
Thread-Index: AQHZtL+rNz3spepjz0usLwXCbpd2eq/hHaqAgAEYkYCAAAVOAIABSs2AgAA0HQCAAUMLgA==
Date: Fri, 11 Aug 2023 09:09:13 +0000
Message-ID: <965c3f58ce3a56554d1a499ea70df9c32904e24b.camel@microchip.com>
References: <20230712125154.1361000-1-jamie.gibbons@microchip.com>
 <20230712125154.1361000-3-jamie.gibbons@microchip.com>
 <20230808235919.0002f19d@windsurf>
 <40906858eaa11edb306b0f56e425d7b13948e0b9.camel@microchip.com>
 <20230809170230.59759159@windsurf>
 <36d1e8110955931efe354356c9b09c29f332f8fb.camel@microchip.com>
 <20230810155300.19ac971b@windsurf>
In-Reply-To: <20230810155300.19ac971b@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6335:EE_|PH0PR11MB5189:EE_
x-ms-office365-filtering-correlation-id: 4b23ebaf-5fd3-4961-c349-08db9a4aa205
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 74yj2o+jzqpdymbDDBFWlceCQ0Qidod4DCoUqb1rBOhsgcwp+v3+OljsYjrkvEWWGeAg/Q+55gh/a5pyCIfw6fXsPWvLCDYbkPmY3g5iJljmZANsdkrDTsuBze5o338HrPlh1a6Vpg+LIkEozBwHm4iP0oHPUNxO3MUre4+7FmaM9fmzgYbLDG2mS2odzqqOiyH2BzO98qcAtH5qrCfo06gFC6vOl2XM2/m0WTXBGR7WGaNHuHmeCjmFGIUexBPF3Q54+lUjs36sM9gsbDPo2vm7XMUcRxdFEqtGd/uDfc3/SIyVQ54PrwgiqMEdEZn52V5U2YHnlKdkjTPdpSzVOQWhEvs7Nb86uUIJXzeoziHsVlqNszVNvPSFXqXQ14Im5+nCii47RrpgFYMLa7Xe0GCsCxrBdC9hCH9XD0mXYnvMFA/fG+8pnlj0P8/RS2+VFc4XKgKOWytn+mCnQ6BJldPtR9cJJqqnx7SS6V5nbLe19a4SrTdcTKF7zTRKU5GHYgD5BfQsmv0+ufJVqxGDY/jy16Z+g5L7P5AbNLsYNY9xFBm66bRpYUodd1SdMyPZbna0E5cmiM4BdOUHR7W3VQYx0EMapy8TmNxJpuVCgHY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6335.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(366004)(346002)(136003)(39860400002)(186006)(451199021)(1800799006)(6512007)(966005)(478600001)(6486002)(91956017)(6916009)(66556008)(66476007)(64756008)(4326008)(76116006)(66446008)(66946007)(5660300002)(316002)(71200400001)(54906003)(41300700001)(8676002)(8936002)(6506007)(122000001)(26005)(86362001)(38070700005)(36756003)(107886003)(38100700002)(2616005)(83380400001)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHh6RHdtNGVxSjc2V2pJaUEva2pLT0lSbDJ1aEtLTElpOGE3dkJ6Q2E3Wmpm?=
 =?utf-8?B?NmtIbFNtOUx5ZXBMV2hEWlY3NUhFZEZMeWdoazJhc3FBRWlFOWlGUnptUnJv?=
 =?utf-8?B?TnNSUTNwTW1IQ3pqRVAzYUJPZUR2SUxmSEgvbkNrbkJnd2lDVWxpQXo0N2tR?=
 =?utf-8?B?dVhnM0ZtcXBzUjV5bE1EczF5VTQwdXBxNGhrUEthWE91WEx6dkhScDhlMEVB?=
 =?utf-8?B?N09PWkV4SGRpMGZ4ZEh6djZ0UkM0VU8rR0paVXBxVnZZL04xVDduemQ2cEp5?=
 =?utf-8?B?ZnpXakMzNWlDaGFvc3JTVFRqdzNJTTdSL1JLYzdndnFqSi8zSzlOcnhKM2Rw?=
 =?utf-8?B?dkRyOEhhVUpWZ1RnSzJQMTA2b3hBeDd4Rm5DRm1WUjFraVNJdTU4SDNEb0xT?=
 =?utf-8?B?Zmg4eVVSNElnY08xRS9OTGMwWWRreHh5VFhCMmttK1pubHBYK2c1NXVHZlla?=
 =?utf-8?B?anorUCtucnQ0OHE0SG1xR2lCWjdLdmxYVCttVjBOclhZY25wWFN2UmFtbkU0?=
 =?utf-8?B?WGt5R3RxZ2prOFpUb3hnRUNEbWpSRkkybVBqVG5uZ1NDTGdlenZ6M2VWWG93?=
 =?utf-8?B?OGdrWkdkVm5oc0FaWitBYm1lUGpkS3d3ZDlmTDd6VTRlSjVFS3dZR1R6d0NU?=
 =?utf-8?B?MTJ1QU4zaURlckQxNFhxQnFkUUtlVEd4dXNQb2FVZVdWRDdjcGFjQnhCc0lO?=
 =?utf-8?B?dHZYelFlZzVPZlNheTR2MGJjTFVBeFpxQjUvUlBkaGMvQ1ZEbW9SSFhReGF4?=
 =?utf-8?B?cXljeE9YVmZHaGtxNmR4N2lhTHJEKzM3VzBFSGdRdjBWVkgwNkFxQldMT1R4?=
 =?utf-8?B?Z2JUSDA3eGVwTzU1YnlGUUhuTU9mZjJkZXJ1RnB2eURWMmlaUGs3RUxMRDE1?=
 =?utf-8?B?Skx0eFFMSkhDMldVQkd5bWpUOHlzWmhtaTBkaWNkemQxV1hqZ2FjaElWREs3?=
 =?utf-8?B?ZmREcGRzYWJFZnBMUGFFcHNtNGlubXhVSDIxMWFFQjQvLzlmcEFiT1gzT2k3?=
 =?utf-8?B?U21FMzdtdXUwSFc1c1FjZ0hLbUlxV2thVHgvT0szMHpmWTNHeEd2UXFiTmo1?=
 =?utf-8?B?cU9GajR5VXJuQ1dERi9tU3l2bVVWQTRQTXl4aTJTR0VjZmJ4SHRSTXVDbVdk?=
 =?utf-8?B?M05oSldId1FQdWxjNjE4aEQ3OW1OZCtDTnpZQ1FSNzhiNE1qbS9lQVYwb2c0?=
 =?utf-8?B?TFpzd0pmb0hRRG80QnlmVWtJSVpoNVM3Z210NmVhVlZSVmtJd3lwWDN6TjVi?=
 =?utf-8?B?SnNlSnRCMUpuRDdobTlDUkFvaWFJbzJOZDJuN2JHRGdvWUxSMDBOcWZuQkQy?=
 =?utf-8?B?MEJCWmRjNmZZRDh0WXd1Uy96dHI0MGdsRGplbmxpY1hIMS9XNlBYRzZDZHp2?=
 =?utf-8?B?Y21acysrTjZRN3BTWkd5TmNuZEs2U203QjAxK0hKLzgvRTU2YkZ4OE12ZmJT?=
 =?utf-8?B?b1NGd2owUFNPV1VxTEZIM2ZWSlZJUUQraSs2NnZTWEdMc2pnSGVkTFVuZlky?=
 =?utf-8?B?R3U1aTIxRVBWWVB6akpuQzJmK0Q5VkRwMFA1TGpRd0JCdWplRXNtbUdqTEJI?=
 =?utf-8?B?cFdIa3hYV29uZDJJVC9qSFFUZjBLdjA1ZjdsVWh4Y1ZHaWFPZnUzRE9ZRHN5?=
 =?utf-8?B?N1dHdVk5QzZIR1RGeDAxc05OenNoWHFGTExWeVRjeEYwTlZzWGFZU1dhTGF4?=
 =?utf-8?B?U1NlWklMSkRjN1FJUnFoRGhnTzJCRVluQXRLRlVtSU5qdmJibFB5dzFMd1Vy?=
 =?utf-8?B?bWVPMXA0MDc5RWhYRGhoM1Q5a2tHSGF2Y05JSHFGZWswR0NiZzh2VnVCYjlj?=
 =?utf-8?B?c1FPNVdaUnVXSDl5cVBxazRBamZ5NkNvMWl5bTFBWGpGS21WeWlPVzJWaFcx?=
 =?utf-8?B?YUpvRHU3QXgxMFF4RTUvUmVOOTVHWHpOSFI2cTIyckVlRWxhRUpGaW4xenJB?=
 =?utf-8?B?RDk0dkFtcEFmQXAwYVYrZWVQanN0aUhsdXlNanplRStaMTRJNHNKcHNYaEdE?=
 =?utf-8?B?RHdhRkpudk5HUHpFT2pveUpqd3AxWnVHNVRPZHRWNnRYM3JpM09iV1JBckh6?=
 =?utf-8?B?RDZiNkIwK01UV2pFWXhyQURWbkdKOEpRY2hlTUZTSnhRd0lRcmtMU0NVZ3Zr?=
 =?utf-8?B?STMxd1Y1aUpLVUM5T1RyYUpjaHRVUDN5RlljanRJVmtTUitBWnViLzhtazNu?=
 =?utf-8?B?Mmc9PQ==?=
Content-ID: <373C02796487434496925A50C07B61F1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6335.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b23ebaf-5fd3-4961-c349-08db9a4aa205
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2023 09:09:13.9460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0GDaXe3P2SORbYACZnzqOaC4OS3lkDQM5JT5+f8idaSgMEILZ3NBseZMA/thIvoLK8A/WYq1zeVlkjLAvEKMPGMIZ6LyL29IvKj2cpEg7NQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5189
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1691744962; x=1723280962;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=A/6BN2KTtPM22cw59t6nNkYx0/IE3DBplhWbcov+KfE=;
 b=Y5CLBHt6O4OqiQ5UOJbbwrsSki5PzHUZ7nmhlOjBCi3Y3gBXjKYPsGQT
 NQsrUJikSJDDLMT/S2OQL8R97LkjgSLQzyq0gbe2Rk01e9Af9BN96D7GH
 9ROzqEwofj53zRgXOgPmFirM2sIszfPF2TnV9vwEEY2GT5xoMvfiOBohq
 WLn0x6snrmHaaT/j10tpKpu+MsyCW0jVAbjNFQQUH1PdmugAwDlCpOFkE
 I25Qz1IK1tFJlL2P1m1rwrGjqTjeLdXLFmmfWqYWvUjD55nzzjPx55MxQ
 JAAVGhpaWM13ZR6GS2Sh7tv/TrRbGemIwDbJRBM5p+1QYPc0GHyXGm0M8
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/6BN2KTtPM22cw59t6nNkYx0/IE3DBplhWbcov+KfE=;
 b=OUQLt99uWzmlgI50nZHf9HSrgP1sYP5OrkD8WKfddlkHpNG3Ndt2R86vsNflotlhf7gx7itgAkB4znRnnwQYPNZXEfEXsBHahwoxxM1cRC4kJSZCmJMTax3pGsN0eqoJzW55z6qoTivWXxFS6LVnWH2rsogXFsb2u58ECCBvXsk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=Y5CLBHt6; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=OUQLt99u
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
Subject: Re: [Buildroot] [PATCH v3 2/2] configs/microchip_mpfs_icicle: add
 support for Microchip's Icicle Kit
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
Cc: Conor.Dooley@microchip.com, Nicolas.Ferre@microchip.com,
 Ludovic.Desroches@microchip.com, buildroot@buildroot.org,
 Valentina.FernandezAlanis@microchip.com, giulio.benetti@benettiengineering.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Thu, 2023-08-10 at 15:53 +0200, Thomas Petazzoni wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know
> the content is safe
> 
> Hello Jamie,
> 
> On Thu, 10 Aug 2023 10:46:30 +0000
> <Jamie.Gibbons@microchip.com> wrote:
> 
> > THe HSS code is located in eNVM of the Icicle kit for PolarFire SoC
> > and
> > built outside of Buildroot.
> 
> ACK.
> 
> > The HSS paylaod generator which is a host tool to create HSS
> > formatted
> > payloads is built by buildroot. This is covered in the microchip-
> > hss-
> > payload-generator package. This tool is released under dual
> > MIT/GPLv2+
> > licenses.
> > https://github.com/polarfire-soc/hart-software-services/blob/master/tools/hss-payload-generator/LICENSE.md
> > 
> > The HSS payload generator is the only software compnent here that is
> > built inside Buildroot. The HSS code and OpenSBI are both built
> > outside
> > Buildroot, so their licences are not a concern.
> > 
> > I hope this clears things up further.
> 
> This is all clear.
> 
> Can this HSS code + OpenSBI stored in the eNVM be updated by the user?

Yes, it can be updated by the user.
> 

> If it's the case, would it make sense for Buildroot to be able to
> build
> it?

However, it does not make sense for Buildroot to be able to built it.
The HSS is tightly coupled with our FPGA flow and because of this we
believe it is best to keep building/changing the HSS code separate from
the Linux system development.

> 
> > > Does that make sense in the RISC-V world?
> > 
> > After a discussion with colllegues we believe that the above two
> > configs
> > should be available when BR2_riscv_g is selected as suggested. This
> > does
> > make sense.
> 
> Cool, we agree!
> 
> > Would you like me to include this change in a patchset to fix the
> > configs for the microchip_mpfs_icicle_defconfig or do you want to
> > make
> > this update yourself?
> 
> Feel free to send a patch set :-)

Great. Will send over a patch set for all the previously mentioned
changes over the coming days.

Thanks for everything,

Jamie.



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
