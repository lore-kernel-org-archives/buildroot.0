Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC214C10F16
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 10:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CEA5605D4;
	Mon,  6 May 2024 10:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mc3v5JxSH27S; Mon,  6 May 2024 10:11:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C1AE607E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C1AE607E3;
	Mon,  6 May 2024 10:11:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 948CB1BF5DE
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 10:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BF458212D
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 10:11:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DL8GMmpqkSAy for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 10:11:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.153.233;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=849f80af6=nayabbasha.sayed@microchip.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EDA3981362
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDA3981362
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDA3981362
 for <buildroot@buildroot.org>; Mon,  6 May 2024 10:11:00 +0000 (UTC)
X-CSE-ConnectionGUID: /uXWfXZbTwuJOcjOzgeuEQ==
X-CSE-MsgGUID: T9oX9dW/RyG/Gniif5ARZg==
X-IronPort-AV: E=Sophos;i="6.07,258,1708412400"; d="scan'208";a="23802559"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 May 2024 03:11:00 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 03:10:19 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 03:10:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyZ5Zhttt8PR+ZnRuDcyt27bbaNx+rHdlsy9vAiRqjtGn9VEPHMmLf+W0UlqtVGIDH2bY0f8E7am3MFs7tmDxHkrqNDkoSBv1IPNwnR6qGl2iGrGft3UagaeoiJVwjtoxpeDTKf1Vlocvd4UNon/YBwOhK6HoaFgVOzDaqXd4CMgXvKIRwaWylxMRgTouQthlEnEWFqRBUYfJHO2XSInxxGeb2NHdWizISsELtlUuH8ZXgM5zJBuoCI68Ig+WXZ2dwDKgtJyhbGaA1WN24ccO8xWkHBmV9NhBXKSYz142DjIviqa9iPdTG2HHbc4L1iVO0u+NdBdi74d5OJzsFOyCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7dfndBNsDfAbwskS7iUhH45yi2bdU0gvqr7MIvO+8gE=;
 b=LqUPq1zYUjE3zwTQHwDFCW7xX5p4Dal7MeFl7yqlfsi+79RWEbwm1V8OwxBCTPejPiNPMhjfhacoOQg/WQyrLzlGaHr/9LB1ytRWeg1Cj+DaQkLHPa5FEdl4hDMRZht2IySSDUUdxkHoBFzbVNhmQeV0HWJglcQEYeMDtY5EG/5tQzx0HjOy5wupaPZ+K+EXRT7mUgd6c54c/4xEDygY5W+2PKrT7l/i17A0FiEHLT7GIuRBHQmmxe20TkzYsRjvAmKhcNrvXZfSzH5SpomESoS3aJlj4NJ878NlfEqFVODx4mqMLPKBBdCa9kI8UD4m6l2qmxng3CARG0P1R1F9/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 PH0PR11MB5927.namprd11.prod.outlook.com (2603:10b6:510:14e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Mon, 6 May
 2024 10:10:15 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::4e7d:bff5:6393:b574]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::4e7d:bff5:6393:b574%4]) with mapi id 15.20.7544.036; Mon, 6 May 2024
 10:10:15 +0000
To: <thomas.petazzoni@bootlin.com>, <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH] package/busybox: refresh busybox.config
Thread-Index: AQHal7X0lLo+77Ll70CRLMyKDMkIrrGC2hQAgAcycgA=
Date: Mon, 6 May 2024 10:10:14 +0000
Message-ID: <434fcada-7040-4f22-9905-78aa68bd65d4@microchip.com>
References: <20240426-refresh-busybox-config-v1-1-c70cb5b60243@microchip.com>
 <20240501221838.07cb2684@windsurf>
In-Reply-To: <20240501221838.07cb2684@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|PH0PR11MB5927:EE_
x-ms-office365-filtering-correlation-id: 1eaf7ca2-e15a-484f-9b06-08dc6db4b949
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?UDdJQ0RRM3pwRFJHNXlYTDJSTzVJSmlGaitLVGZUMUpZcHgrT3hmZ01xR256?=
 =?utf-8?B?OCt5bDlGMEVBYzl4a1VSSC9ScThENnBDNjAyMCtSNE92VDZCaEJyZ2U3NDFh?=
 =?utf-8?B?MzNLdWJpeXRFdW51TTFscHdZVUlzSWtvSnV5L3cwdGhSL1UvMXpXbGRJdW4r?=
 =?utf-8?B?a1hEbk9IOXdyS01SS2xMRHQvZWtvSmMybWtqK0hRU2xJa0ZLblFZRlJ3Nmxv?=
 =?utf-8?B?RVpKaVF3NlJqUFNjM1Z1Z2F3ME5DR3drbHpUR0VXLy9ITStkWXR2YVppS1dU?=
 =?utf-8?B?NmZlZ3F2S3RScEtQWXF1WVpZTExHb0FJV3kzQm1tbTBRWkk2QzFUSW1idmFR?=
 =?utf-8?B?YVMxbFRXaE4vbXlNa3ROVTllZHBLbG41QU4yRnZVWXMybEhtSDVsU1ZlYllz?=
 =?utf-8?B?TlpkMHZ6QUpWMXJ6MnY4T3pMRlRTZHRabzRBMjVkZ1FxSVFnUFRVYmIyV0JI?=
 =?utf-8?B?aTVQRkpLWGErKzhJYU9iYWVhNG14YnRJeWJqcjNLUHIzWHovc0JGMXpjZDc5?=
 =?utf-8?B?M1RNalhJWmM3VVpZaTJUb2svNWhYMzJuVG1iU013QzlURGhoV1Y2RWtBNy9R?=
 =?utf-8?B?WFZkZHR6TXU4c3ZmblJVTFRaQjNhS0tMbkJQYWlVVitYWUcySGNUSjk2K1ZX?=
 =?utf-8?B?WWNPMG5RKzRmK0tidTcwaDd3cDlGdERMTmhTZlJlelEzQzY2UHZGbEtqOFJR?=
 =?utf-8?B?RTB5Skl4Nk43T3NsNlNPSWxLR01CUWZEOGwxdDNCZVNQMVR2SnlmVS9hOEhu?=
 =?utf-8?B?VnNVRHd5U2FIVDNSR1hnQmxnaE1Gb0oyVVBLQUs4Q1VGVnpFWTNVRXdya3Ja?=
 =?utf-8?B?RTdPOE5hdTZTRUhKQkFUeDlrdzhLY2RQODhQc0ZDNENUYlBIMm1DYUdGbU04?=
 =?utf-8?B?SUVGWDJoczBRUndsdVFqbm1RMnF2VmpkMmVUOGxiYkNlN2h5a1hVLytxWDhu?=
 =?utf-8?B?UU5hbUs0SDVvam40a2poa0tuYUw0Wkk5aFRGMkF2ZTVVK3RCYXNqaElJRXBy?=
 =?utf-8?B?K0IyZDJVVkQ2Rkw5NFJQVHlLc0I0MW5hUEhVV29FUGhoZWQyeDhIZENSY1l0?=
 =?utf-8?B?Nmp1TThlRXBDUFc5RFJIYm5XbDdDbE9SaTZOd1hvR2ROb3JRZjFSb09XdVpr?=
 =?utf-8?B?TUV4dFpOL1hRTEtORmsvODdIL0N1UjZ6Ky96Yy81SnlKbjBIZk5kNExGSkgv?=
 =?utf-8?B?QUtlamk4YmowdElwZG1RUG1pYVdoWktNcUM0MGdxT2RHUzcwTmVYaFBlTk9m?=
 =?utf-8?B?L2VOclNENWdIdGFOREkybUUvSXAzT2oveG4yRWhxSzJ4bG5RcGdmaStaOENo?=
 =?utf-8?B?c3RJREU1WHBMUGlhWGxaZEZjNE16a2xFVlpIWFdNMkFMaFhHdEd4QVRhbDVx?=
 =?utf-8?B?eVJla1ByQXFNZHpnUTg4UytPMmhKNDF0bWdJQk12YnRxWTNpSVEraHFteitH?=
 =?utf-8?B?SlRRcGFDUFU5bU1CSXNrNnAyY2Y1WHkzV1FjbDNiUXhrbzVlTGpqc2h1Sm1J?=
 =?utf-8?B?VkpsUW5KSStucGRVUUtrUWpzamVUY1hmZGxmZ204Q2ZoTFQyUXhLOEE3a3Ji?=
 =?utf-8?B?ZVZjZGkwaXRLZTZ4c29LckFpNkh2ZWJtTkZWTE1nU1Q2MlFzZVhsbjVGWXJY?=
 =?utf-8?B?dnpDdW12aEs1K3E4ZTYyT0hVUWxPa2xhblRTdmkzVG8vcFBSRE9uQmNIYWhZ?=
 =?utf-8?B?WG5zU1QxK2xyeVh6QjFtdjVBWnhWVlN0U2dENkdpcTh6dFJjTFB2M3FSdCt4?=
 =?utf-8?B?RHJFUUwxSlFBYTRzM2hwTUpWNjAxd2owNnlIdE5vUjBEdHEvcTE5cmUxUExU?=
 =?utf-8?B?NEw4ZkJBN2ZFNG0rS29OQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TC85RDE0dU0xM3hpL2JzM3pDNDU5YnM3bEZhVmM0dnlybVRKUFNWN1VYRDBL?=
 =?utf-8?B?OEZtRHEzTUU1SEE2ODJoNzJxZkFjTUk3a05oSy9aZmtSc2FtR0JXbVV2c1lV?=
 =?utf-8?B?Tk1Vc0hCSnRsREFuVUsxdDhFSW1mRVlGR0NIcXFQYktCaTlKT2V5Y2FEYXQ1?=
 =?utf-8?B?MHlXVENHVFZMMnhQYzVwcEY3QVdRVU9SR3RyMlFRQjBsYlEzenhsU3BtWXRW?=
 =?utf-8?B?alBHUFFjdHFzUWl6Y0xyL3hHMlhFL3hyNDF5cWdwemdzZC9yK1lLR1FnNUpu?=
 =?utf-8?B?MzNsNnR0NVBGbjZxSlU0eE00di9lYjA2alBIUzZZN2l5VTlxWmhrenVsVGM5?=
 =?utf-8?B?V2RlZVVDUkw5ZlREcE1QMDA5ME43Rzd6NEl0bEZTcUp2b3lUS2RybkZEMVd0?=
 =?utf-8?B?dXRyQmhVL1kzN09HQ3V5dDRrNGVEYlNJcE9iTk5Gd0ViUWxsc0t2NDRNMHhO?=
 =?utf-8?B?amtKNUI4Rk5kbk9MWXovVTQyaEdDKzJJcmJ6TWRab1VFMmpwSUd2RTc4WWxK?=
 =?utf-8?B?RDBYRjJZbEZOQng4bDVtQUtYeWN5cFhEbmkyRjZqbHlpYmF0MUE4S0FDM3Fk?=
 =?utf-8?B?dzJQSkgvNnlEWFN6UDhRMGYvVnRzV0E2TVFkK3I4S1M2cE9YeDB3NU4zdk94?=
 =?utf-8?B?MzBRSURqd0ZZbzQva2hReXdYU1VHc251Qy9JWFBkU3p1bGc5cjhKMTZIaTF4?=
 =?utf-8?B?YkpzRFYrUklSOG9lNG1yRE5mUlRYZThCckNCR0lxZm1JaWozUEFkQVJ0MkNi?=
 =?utf-8?B?S2RGUW8vWE01L3FIRWQ1c2xEVGNWWVIrYndmaVNzQjhDTnVFQVc1WEVFamhn?=
 =?utf-8?B?bnFFOFZDbzdndDA5WG5nWmdtSysvcjNPS3ZieUpRMWlPRGEvSWZxdzdBWEdC?=
 =?utf-8?B?U0tNTlRWU2t5VEhvT05LL3hlMjEwVGRieUhxZTdmUmU3RXBaREJxS2RLa2l5?=
 =?utf-8?B?TnBnOC94QVpGQWtKUU5YNWEwSXZJK0xYaEpEcDVFMDJFdmk0TDhzcjBMVFRW?=
 =?utf-8?B?WDZyUWxySWNCc0RlSTBnd29YZnZJb29JeHh0RGNDTmIycWdiS1F6UlFKMkVz?=
 =?utf-8?B?bmpuZFpUc0xqL0JuSGxqM3BJNXVFT0tHYTNJN2tZWHY5aXROd2x0d2FSbUJR?=
 =?utf-8?B?QnZabVEvd2VDMGZaMzkwL1dTU2llUEZidS96dzBOUTZKZWRSbmJlNE5xSDkx?=
 =?utf-8?B?eWkrblA5aFdGM3FDZXdQcHkzMkJNRTJYMlFJeERtdmUreDhLaUk0UFF3OW5n?=
 =?utf-8?B?UnB6bVJxakJ4dkg0ZHk0TTUwZG0rcGoyRUhRa0NpeGQyaVFPWE9rMEVLZm4y?=
 =?utf-8?B?dzhCWkVkOXAwUjh4RkFyQ3B0cGlkVTVkdml5bHNMdC9VNWRqa090RU5aRUgr?=
 =?utf-8?B?Wm9sV09KVkJPRTdQZVdrS3Z4MlV6a3N1SXVxNVRQeEdXZmVCV3BWUEhOT1lL?=
 =?utf-8?B?S2xHRzdxcGI5Vk9mMGFPRlVmaGhCZGVJUC9SZWZXTEFVQTR2UkhOU3FyVDZr?=
 =?utf-8?B?ak1oVTlOMEtabS9TNmRsUCswa0FQeGxzd3E4UTFzZVA4a05TR2lVcEtiRU4z?=
 =?utf-8?B?cDFiVE85UzQ1eWRSRTV2aHhSWkN6clJpdXp4c2t1TE40MzhRQVdRUk9SbHN0?=
 =?utf-8?B?cTJReldQWnNSbHhRMitkblN1eVVlQi92Mmp3OEtqb0F2MEcrNjRhcnJyMDF0?=
 =?utf-8?B?dFZ3dzFFdnREZ3NjNUVLRnlwWHA1NmNvZ05Oa1QyVnlrTm5iNkdQZkFaTjda?=
 =?utf-8?B?TlBaQndMVVBwWVErZHREdUZ4TzhFa2dkTDlGNTRaZFFlZXJVYU1WSUwxUXVZ?=
 =?utf-8?B?Nm82WGo1dm12Uk40MVpzeDhEcXhKdmwwQVlJU2I3NVQrK2hxampmMzc0WTNE?=
 =?utf-8?B?ZVFmRFQwN3B1Z01adW9reVN5N1hPNzRLb2JUcXYyNkpLUFlFUWdlZnNvV29y?=
 =?utf-8?B?cC9wVERFd2FjQUxyVTJLclAzTmJPemFDUk45VmRrdGtmUWdmTjNLd3RBM2lB?=
 =?utf-8?B?TGpKZjYwUWNWaG1KSFVqbE5qL1hJVExIVUpEc3J0Z0djcEw2bzlMMkQ1bkxi?=
 =?utf-8?B?NlBCaFdaZW1POUdFbkpRMEtWS3BxSFRXb2tRd0ltNnpIakhuVWFzWklPcXd3?=
 =?utf-8?B?RTJ5YlhCQTNpYVV4ZU84WnNzTmhSSHVaNC96S3lIdkJlbU4vUUNMQUkyZStQ?=
 =?utf-8?B?QlE9PQ==?=
Content-ID: <4920C9CF90CAE54BB1C85F7CC5E18FD1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eaf7ca2-e15a-484f-9b06-08dc6db4b949
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2024 10:10:14.9727 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k/c2aXrGmSKyX/LI/47VEMhsdqTyJFg5zmyhsD7qS5BZ/5ixLWSpODB1K/A7+O6HjTaZ21n0Fa0xtmh1Oz+XUpN48pOAJTrAwmrKXm9dXwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5927
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1714990261; x=1746526261;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=7dfndBNsDfAbwskS7iUhH45yi2bdU0gvqr7MIvO+8gE=;
 b=QOoRL0767RRlkG4JkjdvQZaAejeakBRqmeMQ1LOPAX69yVyA7IbCkxRj
 XpIIiukEyZx1P8s7xB9StTtyxwLdnoFynZ662kiuM58jAtvpwAFxn+UtK
 dLmz+gMBA/zDyOVaVoW4hvH0rWfp1HXgMAnLC9/iNJb5VVB2DRnyIv9Yr
 UoUKnCA7MsG+i/az2uC3GcV91u5orknJCupOfwgIDkXd++ya/gy2LJ+mo
 KK3374N/hNGvY3k9jrMGSrFyVG6o7ckNrAkffP+LT0wJfjnltn0xItv8/
 5n5Wq0mrfwQCcFyn74j3BfeatNL8E2FeJ2SkKPSRi7WXHAzX6ftMWZnv7
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchip.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dfndBNsDfAbwskS7iUhH45yi2bdU0gvqr7MIvO+8gE=;
 b=ZzZGMOgWWmClkcGEkUNDNc/GEYwa3Vu8zt4pPMdviTJ50FfWDSHeSklFI6p4MCo97P6qmj9C9DsDNL1JOLPT1ZlQvL7gEvzW7gyLs+kEcKPE/naH2YUy4hJs2yBLCtpKGkZINsWMxHhEHuxWTs4bKdTXwImEwkOWrt7DMHp0fh76cwjjwvLK1x0Qt95j/XlBuWZs8hq5VmaJ+IdLivWlsmMjRQuvmSuscOvI0X0d6FI8h+HB8LzZ/PyTczP/rbITmrDFoYYpcUJz/KwV2hCrRbl3z7aBx9K8nyBjbeqGqXqlgHb86p7Vw6qOAsoNADONeOuhwBJPQuAmloSDIPmHNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=microchip.com
 header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=QOoRL076; 
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=selector1 header.b=ZzZGMOgW
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
Subject: Re: [Buildroot] [PATCH] package/busybox: refresh busybox.config
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
From: Nayab Sayed via buildroot <buildroot@buildroot.org>
Reply-To: Nayabbasha.Sayed@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 02/05/24 01:48, Thomas Petazzoni wrote:
>>   CONFIG_TEST2=y
>>   CONFIG_FEATURE_TEST_64=y
>> -# CONFIG_TIMEOUT is not set
>> +CONFIG_TIMEOUT=y
> Nayab: this doesn't show up here when I refresh the file. Are you sure
> this isn't a custom change on your side, unrelated to the Busybox file
> refresh?

Yes, CONFIG_TIMEOUT shouldn't be present. I will remove this custom 
config and send a v2 once Arnout replies regarding 
CONFIG_UDHCPC6_DEFAULT_SCRIPT

-- 
Thanks,
Nayab

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
