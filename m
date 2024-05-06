Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E8FC10F16
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 12:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBD7260819;
	Mon,  6 May 2024 12:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uxr_pR-5GnCc; Mon,  6 May 2024 12:41:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E199960825
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E199960825;
	Mon,  6 May 2024 12:41:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C48B31BF307
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 12:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0F5C40141
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 12:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pTFTg9SJh35j for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 12:41:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c213::1;
 helo=zrap278cu002.outbound.protection.outlook.com;
 envelope-from=stefan.mueller@rey-technology.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 79AB9400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79AB9400B5
Received: from ZRAP278CU002.outbound.protection.outlook.com
 (mail-switzerlandnorthazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c213::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79AB9400B5
 for <buildroot@buildroot.org>; Mon,  6 May 2024 12:41:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kI7EOBcKBtIDr1jp+2IAo5fMgXNxxot4HbiUlDvVW6OfvBEmuUs7+k/BsCANvaAg7BlBJ12HmximwwDQTDnFNOc+b5wkylk+D1hs8EUB22VYSR+zu5IJmrz9mj9xEfcck0sglKewTUQf4xKPKqNh5gzTHzzMiPy7i2jmeQgQ4YTnjpXzVekD/AiYxHN9Euk19npN91yqGA8t+jEMJhXZSnbEjT7EargNYXa2Y9iZWj54zru5KtBsGA2q1iyJKKX+KYG2rUVZE7D5hQevtapJ6gW8r9lG7yDjZl1FjctRfpRsA5I9BdwJy6VdqEzuUbfTDp3uviIHNKvrAJZY5ivuug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hz9UnescCIVztIt7Yq4eE1478DLgef/KabGtD9jmtQU=;
 b=cKFLFHhTxRdhZUPacIqZxYwtMoY7PhRXjemeBMATYe0p3xtxhVSC9zNpCsY+mewKZgBI8B9kpUeKQP39W8dTEhYV7Pv0EPO2pa2FsU0Uh6ApSBdcYrn62lWmz6oyl6xtvzbuoz5RrKZv81aFcWpeKyJSZNgGIWnkAAxi78R+4qwdOHM48UaDbg35QfQ++ijIeG9+SqmjsEA3iAOxMQr7q5w2k+3t3y/r0ywd23VvWvrgN4DGSkt8Sakbdo1lrEmI203w8mX6Bp7J1FcEYKmcsLYemo9U4nja6gmT76fvoBhICY/roVcLryrqHcAUfDV77A5M3n6sY3Cn0q3aWMLZ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rey-technology.com; dmarc=pass action=none
 header.from=rey-technology.com; dkim=pass header.d=rey-technology.com;
 arc=none
Received: from ZR0P278MB1168.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:55::14)
 by GV0P278MB1300.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:5a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 12:41:19 +0000
Received: from ZR0P278MB1168.CHEP278.PROD.OUTLOOK.COM
 ([fe80::21b0:e2c7:5163:8630]) by ZR0P278MB1168.CHEP278.PROD.OUTLOOK.COM
 ([fe80::21b0:e2c7:5163:8630%7]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 12:41:18 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] question: used wrong librarys to build packages
Thread-Index: AdqdLSlQxVPJhkERS+iK1q9U+h9yWwAQelMAAIZ6sYAACgl6gA==
Date: Mon, 6 May 2024 12:41:18 +0000
Message-ID: <ZR0P278MB11686B31D2C51D21AA527C75BF1C2@ZR0P278MB1168.CHEP278.PROD.OUTLOOK.COM>
References: <ZR0P278MB0201C028ACBF4BFB1CEE9FB0BF1F2@ZR0P278MB0201.CHEP278.PROD.OUTLOOK.COM>
 <ZjUDfla_cDBWzc-I@landeda>
 <ZR0P278MB116859A2D6446D0BB9AB54D4BF1C2@ZR0P278MB1168.CHEP278.PROD.OUTLOOK.COM>
In-Reply-To: <ZR0P278MB116859A2D6446D0BB9AB54D4BF1C2@ZR0P278MB1168.CHEP278.PROD.OUTLOOK.COM>
Accept-Language: de-CH, de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR0P278MB1168:EE_|GV0P278MB1300:EE_
x-ms-office365-filtering-correlation-id: 2cdd4633-cce0-468f-33f2-08dc6dc9d3ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|376005|1800799015|38070700009|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?S0FsN2JZdG16T2hIK3RzMmJOV1RwaFJoK3ZWZkNxWjc5WlVFL2psTGNsMXlK?=
 =?utf-8?B?Q3V6SUlpV0hTWkpPSFdZOGNyWmFqa3IyeG40aWphMFFDaWlDbUFKWGJVU3VW?=
 =?utf-8?B?SndZYWNueTRyRExlNms4T0xjTHlSZDBxSU5EQW1IUm9UQVdma1c2YzY2MmpP?=
 =?utf-8?B?enRlbTRxSFEzRVo0RUhJRUJ1Q0NQVWdZYXNkN21VV1RHUTl0SEEzdzV0MEVz?=
 =?utf-8?B?RmNEMjBJNW9FdDl3RThZUVo5N2hZUjZrZkEvRmR1Uy9ZVUpkcFE1T2loY2dJ?=
 =?utf-8?B?c1pqcFZ4ZUU5ckZRRG9kNnRISjhnQ1NVbUFKUVNSanNHVnhhT3FlSlg2ZVNo?=
 =?utf-8?B?RHkwS3NWQUVMREl4eFNVcGVTQnlTR1BadHFBYnZGQ0xFb2JwMHZLZGlWWXJm?=
 =?utf-8?B?ejRJMGRrREVOamJvYUJQamhWMzZVTjdBb080QS9VVEIzVCsvYWc4VkptSkNS?=
 =?utf-8?B?cTVVYzYza0J0NGxYZkptZ3BabFRkS1pROEdWZXQ2NEM1dXVybFlMWC9KaEor?=
 =?utf-8?B?bitneFlBaHN2b3RLQWlRYVluSkZOTWY4ZlZsMCtVUncrUDdmTjBLSy9BV3Y2?=
 =?utf-8?B?RHlya05IbWFJY1YwVUUyZ1hocjdyb3Y4V3c5SzcyVXNVMCtGa0VyMklGQU1q?=
 =?utf-8?B?azhrYXBiaDNFcXRrNXRCMy9IdnVjY2hkcTlDbm5HQ29jMUd3bUpiVWFoSnFN?=
 =?utf-8?B?RnJvRmlkbnNIRVlhaWZqWGIxcU1PVktrdUdwekY5d094OGVzV0c5WWFqNzNU?=
 =?utf-8?B?MkNvZ1k2aWJRcHFXNVl6Zzc1M3dtUUE5NEc0T3B6SXpxRXBsaVJUdkZ2MEQ4?=
 =?utf-8?B?Rk9Ia1V6NkV1NUZqR091SlhtL2pORno1Q09QenBlZmxWcFlveW5SUjNJVFhK?=
 =?utf-8?B?OUFaU2R6N0FBSkhNaUhUNlZ2c2pNMzBRMW9xaFEvR3N5SVRMYVAxREdkRklw?=
 =?utf-8?B?Nks5R3gxazNQK1RCMW14TFl3VVNIZ2JoMm02c2NWZ0ZNQVFQSUZ0UjQyM3JP?=
 =?utf-8?B?WHFZNWlxWXBhSE51NlI3QVo2NjFOQmN1V1RVby8rUmI0YzVvdGhLRkwyMlJU?=
 =?utf-8?B?ei90N2J5UmREYzgra0xhRDZ3eHBpVFJ1eVdXM0RKck1DRHFaeWVEWUJOZXRy?=
 =?utf-8?B?SFJ0bFpEWFNkVW9qK1FVcVNXblV5MHBHbERhcE9adFprRDZmNUUvMlZHNm0x?=
 =?utf-8?B?dFJaSUhna3dXc3lIaStuYUxlT1E1dWRjMVpiVkJldW5QMktBemhGdTNOV1FC?=
 =?utf-8?B?YndQMGRFSjlodDlMajQrcW1rZ0kxSXdLQ1hKMDEwSUsrS1M4ZmQyTXo2MHo0?=
 =?utf-8?B?cXV6eEt3MEZQaWUxQ2FVYXEya1IvbTBIWDRyUDE2RFBDOHFMc3FSZTVqeGZO?=
 =?utf-8?B?Y2k1TlNUS3RqUktJbjRMUFlnc3pqREoxMVlPZnRxcEFPV0E1bngrdXk1SEZX?=
 =?utf-8?B?b29TeldaQXVDQ0NJTnZ5aURpdkZvMEV1MkNSYkhHclp0aXB0VDVDSjJsYk5C?=
 =?utf-8?B?NEFsaFBWUUVOQURwaStkMzRGS3cxc1NQZUQ0Wm1YWkVYOHZGaHlEZnNpUDMz?=
 =?utf-8?B?bWg1dDhuVGdsYkFwMXc2L1RLRTFzSmNkN2ZmZ3g5bDhJSWVEbUxGaERLY3Vm?=
 =?utf-8?B?VTJtOElORTNLM3NqSUZQSzZjTmtWelpXMXY1ZjgzbnBlZmRvUnJxWE5TdERm?=
 =?utf-8?B?L3pndC9LVTUvSUJTclZmcW9mUEd0N0UvTFhZQ3BRV0ZhN3RtVFFBdXcydUZz?=
 =?utf-8?B?L0E4bHpkMmxRWTZqOExLbExEYUp2V1ZNeVZvMFFiOE4xcTREUDBPM2F2cExZ?=
 =?utf-8?Q?A3FizuYFLJy7q8zdNMIB9VSD/XVO6dh4raumI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZR0P278MB1168.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009)(41080700001); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUdFdVE1SkVieVo2a1cwT2loTFFUaWZ3dmNCcmgyNUlISVdaT3IxeWRJRDE5?=
 =?utf-8?B?RURzbXAwZTBiUGxQYVNLa2pKUWtXWndYK09FM0ZyeWhkQUNrajk4MnlKQkRT?=
 =?utf-8?B?c0VoQXF6TTI4UFdqRWtndDVmdHNLeGlOVmttbFpsQS9qN011b1dnT2srR1Rz?=
 =?utf-8?B?Vm5OSGtBUEFUcldTNUpTam5CeWl3ckdlVFdsQXB5UXo0YllwM0taR2hRS3Ir?=
 =?utf-8?B?M1NsblZkWWpwSTgyOVFNRkFGWUNkQ2cvM2FPUlAyOVZ3L24vbzRDMVRTaEFP?=
 =?utf-8?B?NW5jckR3b3U1TUZKbFVDMXJhNEQ1TXA5bHBKaFJPemk5Y05zOE5Tbkh2TTBM?=
 =?utf-8?B?NkJON0ljTVVNRVpacHVabU1ncnZrWCtUM2g0dDhoQXNvWEJFV2V4ZlBXaDgv?=
 =?utf-8?B?eXhRbEZ3ZkNkQzlPMmVkOTVsY29ZNDBoc3RvOU1lRTRQbHBrL2hxMUM0cG05?=
 =?utf-8?B?MUZ5bE1tR2dJY1lla0NqMlhYNTRRZmNPVDUya0QySm9XRVBNcTM4S3VlenVk?=
 =?utf-8?B?R0hGNEVJanJZM1c2UFR0eC9FL3BpaHVpV3ozK1RqNGUzWllOVUxEVGRMc1lD?=
 =?utf-8?B?VVR5TFd0bFRPK011N29WMGpUemZoVTlEZ1ZsNjVsT1YvcDRodEtPMmFpT3Rl?=
 =?utf-8?B?ZnpxZWlNVE0xOHVWb3VlVjdOa3lqekc5RUh6ZjBWTnEyWENRSXdocDE2bFk1?=
 =?utf-8?B?cWpRbTZpT0x1UDF1SlA2bkE2TU1EV3RoaG9EdTIrZGxoOXV0TGJTTmxReERW?=
 =?utf-8?B?U1ZpdXBFQzFDd0YvanRvd0tJVmpmbmw2SThjZGRpUTJwdzdkaVlrTWNQUXFT?=
 =?utf-8?B?ZUQ4YWJmdFBlOXFHSEttOVMxMjJZUzdUeCt5K3QzZmVjZzk0TUFXRFNnNnQ3?=
 =?utf-8?B?WDlManhjZnloZFU4cjk0NGJxcm02R00ySm9MOUltR3JsT29XSmJGK0pmK2di?=
 =?utf-8?B?SmQ3RWR3M2FJMm1ZcHpkd1JpUGZ0Snk4ckRyVXBpNlFwTTlKOFF3T3hScXNG?=
 =?utf-8?B?dGpLUi9POHhKQnhHOHFXbkZINXBjMjJHRXdmSHpKcm1hYUwyYS9WY2pPNUhi?=
 =?utf-8?B?dGpVTzBzVlRGY2pBTDA0NjNYcm1OVlo5TytSQ3RPMUpDTlhzekZJLzlML2Vx?=
 =?utf-8?B?R0JSSy9oeldsRWxudHlEdlFrTlliRldwRXN2c25SRS91VTE1elI4QWs4N2kv?=
 =?utf-8?B?Y2Z5M0ZGWEpKUTBmaWFNdDVnS3NYK0syUnUzOGtTWmtpV0FkOTBoNy9ROHFT?=
 =?utf-8?B?dnVnZWNNVnJHNFg2cXl2eFVaUC93b3BrcnVvUzA4TVlkMzFIalpxWUM5ZnBO?=
 =?utf-8?B?eW9NQ3p6SGZqZURwVzBNeU1xWnR4ZU44V2VtS1dGOFRmZERWSVpHMFBJejRR?=
 =?utf-8?B?bG8yTDNEYUpXdnRHenJXRDdOaW9lNzNwQzI0c2x1ZXNEQXphZ1ZROUorQ0lK?=
 =?utf-8?B?dzdqY04xZEF3czBkU0s0d1hoNUl6cWZTU1lsS2NEcHFzM1NlL0FmVG9XREF4?=
 =?utf-8?B?WjhpWlBSV2lCZHdLWnhBcjJ0WXJqM2xaQjhUZEFGV1lvKzdyd0g5N1E2WnBt?=
 =?utf-8?B?cUJUVWxRTU5WcUk0NmdLSmtldndySzE1SlQ5Wm1ibjlqUC8rSENuWTRtbjFE?=
 =?utf-8?B?ajVYbFI5YkptRnhLNlNpekRtYnVXZ3ZjU0RIUnhTT3g1U05ha282VDdDeitU?=
 =?utf-8?B?VEhaU0drR3lEaXdSRG1PeHpqbVZlUzBkdDV1Z1Q5U0ZGMFVpOWxrZWxBL2RG?=
 =?utf-8?B?WEtYN2pHVmxqcmR4WlBMNklRRWRQZUszZ3pzaGp5aURZc3EvUnRjYUltY0FB?=
 =?utf-8?B?ZzI2RHpNZE1lWDVuc29DU0xKbjhrOXVobktOSVBvQlJCZEdRZXZWY3V6ejhj?=
 =?utf-8?B?bDNtNzZVUzUybTd4RlhtZnBlNDBWa1BiS2pGS3F6N1U1cmNlYVBPN1hSSDMv?=
 =?utf-8?B?NTZMazRndkxqRVIxY21VSlltRXgrRUlaQlBPdDRxZStDeVFMaVlCdTh3Tk5R?=
 =?utf-8?B?ZXBabENGcUdEU0dHcHlaZ0lldXpqR2dXV0lFMWVIcVlhSG9hQ2ZmTWFnQXVa?=
 =?utf-8?B?UUNZM2J5c2tmNm90b1dCbWlNU3hOeDUxSDhNdXQrZkdiQ1JJZ0tFVW10ekJy?=
 =?utf-8?B?UGtBc1g4WCt0VGFtVi9PbzRqOGJDcUFNdDAvRDU5VmM0bU5hdVUwVlZLV1lJ?=
 =?utf-8?B?cFE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: rey-technology.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB1168.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cdd4633-cce0-468f-33f2-08dc6dc9d3ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2024 12:41:18.8422 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7137cfb5-c814-4224-8896-1b4a6ff99146
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JgYCjuRV06hYjdUkxRGijqbMqfbOe9hJ+CDy/5Y2rp+kQEhNU/9t3b1/gQW2evO25IHTD4vQc4yGAfU7cFn65P2X4+3zeDo/wba+pjS86A5L9wwTagzhqS/3Zml3x+xE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1300
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rey-technology.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hz9UnescCIVztIt7Yq4eE1478DLgef/KabGtD9jmtQU=;
 b=qIF6dxWqa3ITc8s3vRrBsdKxb/czOYe/f5J74G4fTu60zx8PYg7JiZHbo2gFlfymAR++aNys+95VSMsv5OFjMqi2qmRXDcNR9su7eGBlcDy2GbBw2QJwjCTP/vaNRJVcuZIYELFRy7U4z/cuDGaCY3wNGPi8pWeqiMJL7gbw/l4JkMYy8iOvOterKDYnCDqkJ8RZljwUh3uR/aLxD/aXrIZCIv1UIrm6uinIjNXmiM/6gbuCfGogMBEsX6iSol7zHoJSj5cG6ZRmDP4cLDvue6iGZqAgeEHqLJmT7coANJa9+5mLs7oKw01j0m39+lniJQK1BG7W1qLRwKXxD08Thg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rey-technology.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rey-technology.com header.i=@rey-technology.com
 header.a=rsa-sha256 header.s=selector1 header.b=qIF6dxWq
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=rey-technology.com;
Subject: Re: [Buildroot] question: used wrong librarys to build packages
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
From: =?utf-8?q?Stefan_M=C3=BCller_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?B?U3RlZmFuIE3DvGxsZXI=?= <stefan.mueller@rey-technology.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I have found the library problem.
during the boot process my system-reconfiguration-script has overwritten the libcurl.so.4 with a wrong version.


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
