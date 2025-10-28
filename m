Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD29CCD1BF
	for <buildroot@archiver.kernel.org>; Tue, 28 Oct 2025 06:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97CF9848EF;
	Tue, 28 Oct 2025 06:02:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wh4yLtnwma1o; Tue, 28 Oct 2025 06:02:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CBBA848EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CBBA848EC;
	Tue, 28 Oct 2025 06:02:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F0646939
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 06:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D63C640AB7
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 06:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rtl52bpQ8XAw for <buildroot@buildroot.org>;
 Tue, 28 Oct 2025 06:02:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c408::1;
 helo=pnypr01cu001.outbound.protection.outlook.com;
 envelope-from=esakkiammal.murugan@iwave-global.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2682A40A11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2682A40A11
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c408::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2682A40A11
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 06:02:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJcfFbbJ3dGAKc97gUfBMMPDwBvqyuRevmq/gT3RKuK+JZYiOlkQw/OBJlhsqXrkWzv1f0m/E4SLP3A2GAF+6tceM0tN7YDh6kNngt4P5oYsmUTS+JXDAlbvnUhwRwZzWoegX8j1HBW8t4WeigNXQyZDhThxdkMh3w95kLOO7/LOiBs3Ub+Lzbx/BUcygau2GFqvSp5FXtUCRCBNFhhG2djt23EsZoVY3xkY+dUJ6Tu/igx/MZotM74c6HRX5VBffwxszFh7bEhBGq2YwwGi7RVpDrMtz1fH1GXBHdCVu8EoeDnNCgyMrOLNhP3/aWHoNclftIBvc7isYKT/yKk/6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8pNUfz7J8wcJuFFmWaHcNcegvq+iact6PkWB03qzys=;
 b=xmrh/hUCOMd2x0X69Z44r41N5P7Tya++/IAQSk+076I9MAx4y0GHLowmbS1EhGoq4alRwAuRIE2/CK9KLOyyMSyL4KTee3QKPOj9qi58J/de/b81V11F5OKEI3eoRMeAZIGwfZ3KXP9kmuqx2dvE1P9Vb3na4dHIFdNvz1ZinuEfkocuAmTbCseisgeB9Tt6ns9vv/v20E+O3K5omFUGPUV/PsKVCqck6KG72p61ccb9TwwxLbTo+D4mQyDlp+Lab5NBPn0iL01Z5rW2E/SWzMKaPjjhgpu8NhOY51sgMe/2D6613SK0WcOzPrSscrCXuMZ+XeFnrztuOhNHECfQfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iwave-global.com; dmarc=pass action=none
 header.from=iwave-global.com; dkim=pass header.d=iwave-global.com; arc=none
Received: from MA0P287MB2448.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:122::11)
 by PN4P287MB4575.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 06:02:18 +0000
Received: from MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
 ([fe80::fafd:97ba:ad13:4c1e]) by MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
 ([fe80::fafd:97ba:ad13:4c1e%5]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 06:02:18 +0000
Message-ID: <43a21f89-2be2-439f-a601-eaa406a4c71e@iwave-global.com>
Date: Tue, 28 Oct 2025 11:32:17 +0530
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <23d1f4ad-241a-4fe1-9db0-08bffa4775b6@iwave-global.com>
 <45b0422f-620c-4db5-9a35-423466de2db5@iwave-global.com>
 <584f433e-3ace-4493-a073-7cb92eae6d08@gmx.de>
 <3ac2065a-8ac7-4a59-9889-51fce1eae53d@iwave-global.com>
 <5eb375f3-d026-4592-81f4-462548717d61@iwave-global.com>
 <a08cca53-7d11-4101-ac6f-b34de963d870@iwave-global.com>
 <68a237a6-6e79-42b9-a3b5-52194d42e782@iwave-global.com>
 <438a57da-d01d-41ee-8f11-0bb2ec522350@iwave-global.com>
Content-Language: en-US
Cc: Fiona Klute <fiona.klute@gmx.de>
In-Reply-To: <438a57da-d01d-41ee-8f11-0bb2ec522350@iwave-global.com>
X-ClientProxiedBy: MA5PR01CA0191.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::14) To MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:122::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2448:EE_|PN4P287MB4575:EE_
X-MS-Office365-Filtering-Correlation-Id: 676f0c39-1be0-4504-52cf-08de15e78d2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qk5KN21lUXBNWUZXakxkMUdnWURTdVhnMHoyclJtSFVocGZuY0E0NW94N0FI?=
 =?utf-8?B?ZnhhS08zb3JDV2JpTjFWV1hhckhUR0pPeVVTWXQ3bURXLzBuYjk0WVBpY3RY?=
 =?utf-8?B?LytlWVV5aEFsNGdjQ3VLK1huODRKZ2tEVzc1UHFpQ1Z0RDExYXBhc1BQZFZO?=
 =?utf-8?B?cnE4Ync4U0RZQ2pLekNPT1NIVXk4dU9FNEdaajlYRVVXaURCcjNEc0Njd0cw?=
 =?utf-8?B?N3NTM1BqM0FhVm9xZXpBQmJFZlJEMTMrSEhuYjRLZmZPZ0RsSDhRamlKbzRu?=
 =?utf-8?B?UzVkdnFPcVQwOTkrT1hRN09XM1FvRERpUjRqN3FZTjdqcmM0cStmOVUxUCtI?=
 =?utf-8?B?ckt1Zkl6TDRxcUxzcVlwMzlaTWkrVis0d1pWdTdoU0VzVlYxcFU3NmsxQTd3?=
 =?utf-8?B?VjRVc1JiWEZaOE5MRndmYm9YUytpai9SKy9kbzBPY0dWOE5WeDYzL0Z3ZlFQ?=
 =?utf-8?B?MWVvSDZmYThVcXByWWltb3RlaW8rdlpaNy9iYzNiNmRTaUdyWVRWTWFScnJV?=
 =?utf-8?B?cGt1TndORzhGTVQvRmV4U0J1dlVQV0FHU2pFNXpVaFVvRXVxUFJZQjM3Ukc4?=
 =?utf-8?B?SmxPWURQQjhrM3hQMkc1ZnczQ29RbEx0NDV5R0lxWW1aT3E4aEJON3YyZEw0?=
 =?utf-8?B?ZVpKNjdXcXAzRFpwUENZTWY3ZVl1WHVzVUFVMGZSTFBhVjBkUXNEQTRxdWw0?=
 =?utf-8?B?R0M0bDdhNVZ5VU16NW1CS2d3Zi91M1lCclNPc3pxT0VKTXkwTGRmR0JNWng1?=
 =?utf-8?B?dko1ejN1aFFUaXZrSnFDak5RMmo0M05kWlZMeWYvWVpidWQwK1VpYVJiZmEr?=
 =?utf-8?B?akV2SURBOTFONWNEd1F1bkVMdDQ1SFhlc3JVam40c1VOVzh5REhRTmxPV0RM?=
 =?utf-8?B?V0s4R1JEWHdUS3JhamVNT08rR2VYTnorMkFVU0Zkc1lpWWpMcVVkSE5Tcmt4?=
 =?utf-8?B?akNFMzdEdjdtbEVIdGlyRjZ6MisvN2V4MExqZjYycTYwK0ROYW1QdFZSUHlH?=
 =?utf-8?B?aWQyRlhkMkU3SjJQUFE3ZVRPekMvcFFkZ3ZSR2YxdHdrK3N3bSs5V3ovYUNt?=
 =?utf-8?B?NkZpWFNGY09lUXN1QTEyNFdJTXlTMWF2SzFPUm02d0p1SmZXamduanBDQ2Rp?=
 =?utf-8?B?eFVIVjNjQW56NEZ6SlJFOElUNzFSemVuY21iY2JPdHM4UjROOHlaU0k3VWl2?=
 =?utf-8?B?UHpRWmxaK24vbHd1bXJGYzlGSFZRUUhuaDlWdW5lRE5XQmY4VmYzTG5IUG4w?=
 =?utf-8?B?aTJ3dWl1Y1JLZjhiRjZuNEdmdkcrMlZjZEhJREZGWWRaZnNTLzJ0MjVuZmRu?=
 =?utf-8?B?Z1RibVUzY096ZG1ySTQ2WmdFb0haNVpkUXNVZGd5WUtjOWdtVVJhK1JOdEpI?=
 =?utf-8?B?RDhESkgydStLVG0wcndRZXIxMzF6b2gyU3VTYjBVTG5nVEgyTlBwMVNkWEhx?=
 =?utf-8?B?ajBWWHJPdkVESUJFWER1UXJmNVM2RUJPcGdNV0dobE44aUZWODFrdzRPcEQ2?=
 =?utf-8?B?SGRQTzdHQjM2bm40Y1VxV3pud1JSbW5YN3RxVUd6c3pVQTNpaUdLRDZqdGw4?=
 =?utf-8?B?TTBiWmRZdEdIQkhuOHNoaVdEdFNkTURndEFBSWQwUkJpVDlZakNoa29MaWE2?=
 =?utf-8?B?a1c1M3NwdGllZW11WFRTM2dyeVJ5VG9ubmVDK1NxcWU0U0ZJa0tYa0NWME9w?=
 =?utf-8?B?R29RdFJmQ2lHN01FUFhtNitQRmprNkNIT0V4S1VBQmt0MHRJbE9Ya0dhK2xV?=
 =?utf-8?B?WjhlWG9TWHc1N0ZCN0JhTktVaTdCdWRocnVLajlCZUd2NjFQdUVqUDZsbmxh?=
 =?utf-8?B?NnFpQ3UycXVXRFZiSDhGTjJMZHBiekVLQnVmdG1wZTRBcWM4eDJEVmNZRGdm?=
 =?utf-8?B?RnZOYVVZRHNwcDBVYmFHOWt3SGNuWmpLejF0TGNwVnU0Wnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MA0P287MB2448.INDP287.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(13003099007); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVRUYzZid1RBbHM5ejdTSlRXT1ExZHpadFpINEN3TlpQYUdPK3VhZmRFdURO?=
 =?utf-8?B?RVpSQVlDeFRvNDd3UHZFd1UvVlBlYmltdnY3Y0J6TzhOZ2RsQUhBSFk5aU9s?=
 =?utf-8?B?bko1SzcyWTk3R1lMWTBqaW44N3Vrdlh4M1lkQWU1MkVudW9NNFl2dUROZ3F0?=
 =?utf-8?B?WlAvS0NLVlVJa3hyN0ZnTDRCaExLbUVubGh3ZGNIMFhUcEhaM1ZlWUFyNlU4?=
 =?utf-8?B?V3VCOEJyNU0rMjFOeXJVdlE1ejgrYWtQTXRHNUVJL3dEQlRRcWgyQ1lUN3BJ?=
 =?utf-8?B?dC8ySUFVa0Y2djNYRTZaajErZlB1SS9UYmtBbDF5eFVCZGhjQlRLNjRNL0JJ?=
 =?utf-8?B?NUo4RjZHQVVPRUdqR21lelgxZU9aNkJ3S1h4ZUI4ajJyWG5yN0NKZmsxUlBK?=
 =?utf-8?B?cUVBV2hrOXdQcHp4ZlR4TzlWTnRUOHoxODVnaVRsYUh5dDZ0TlRYcHlZd2NO?=
 =?utf-8?B?cEdwODFvbjR0d012Q1hITktpQ21DRVQ4TnBEM0RYZTBKc1dxb3FUZHdGK1JY?=
 =?utf-8?B?bEhqc3BpYm91bzNTZEUvWFZaRkh6SHNPb3JRWFNuMmQ1ZFpzd0RIMVlCaTEy?=
 =?utf-8?B?NVQrZG5CYnJOM0JsbkY2OTIxZVh6UmZFK2k4UnZWaHhjUGJTM00xZ01kb3Zk?=
 =?utf-8?B?NzVNckNZV3lpZmg4TnNILzNIVmtMendVZ3JoWGt6dWQyRkVVcFRNYXNUUFc5?=
 =?utf-8?B?UmNvSFJMT2tEcVdpRlBQYTU5MWxEdUM0TE9zSURUaCtWaDUvQjFKaHFEUzQ5?=
 =?utf-8?B?cldBaytqdDl5ay9jQWw3b2gyT3lwS3c3YStMdHUrUXNwaC9LZ1laWDRHVWZX?=
 =?utf-8?B?dEtCVXYxdlVLclFINGxsdDFoeUxVRW85bll5bW1aTUhoRGFKOHkxdFhyNlFy?=
 =?utf-8?B?TmV0STFsSnlUVWpIUjVzVHl2R3BBRG8rd00wQURYREhEVDNVZENJUlBvQ0pt?=
 =?utf-8?B?L0JWV3FYaTNkUHI3a3hMVXk0b0ZLNHFBQUVzdnZweENPSEhHL0thdWRmMHVw?=
 =?utf-8?B?bHhuTnVMVG1NTEYrU2YvRjY5M2VJcHFZZTkxNEhrSGdmRWJvaXM1N1BENURU?=
 =?utf-8?B?eURST0pLU3FtT1UxOXlUTkRaTTB0SXloV29MQXVuSEZ4eXU3aHVNT0hobWxu?=
 =?utf-8?B?dWNaclU4SFNpSWtkNC8xUVBSNUlaL3gwUVR2TUtic1E2M3k2Zy9sSDl6bHkx?=
 =?utf-8?B?aTVoMjJOY2RncmJ6eEhIcmwvcnNmQU5xY1czb0NCdENiZjlmQ0FJUnRabkdG?=
 =?utf-8?B?S3pwZFhkSEVSMFlpNGhuVFhIalJlQmpPM1hUUVdtRE5hK3BZekVFNjAzSFpV?=
 =?utf-8?B?TVFyVTErUkIvRTlsQjJFSktEYTRGOWlBMDNHTFNHSDJ5dUFzSXR3THo4bHBB?=
 =?utf-8?B?am1LVldPTlA3bVVJUGVsRmJsbjVaNGZNZm0rRHZXL0YvcHcvS1ZCdS9lY3FS?=
 =?utf-8?B?azdLamU1MlFXSkRWYjFtd0RhcWh3eDE0VGcvSHgwbHNKK0dYQ0RlWnllYi85?=
 =?utf-8?B?Z3p4YUFrSWZSdzVibU0xSG5idkJrZU9sbldGUytxR0cwa3dUckFRclBOc0pp?=
 =?utf-8?B?TzBiOXhudmN0aW1VTkVBSW5tNG45c3c0TmdWTjFLZFBIYUVoRzdIVUhNaGds?=
 =?utf-8?B?M01HUHM3T2NNaEtyakRpcDhmRkt2TUpmZHhDcDNGcE9kellRNldxU1NFenFm?=
 =?utf-8?B?Znl1Q2hjODRwZDNseUh0RXFjRS8weW9NajZFWFVkL0NIYUY4TW9KYkpGQTRj?=
 =?utf-8?B?bkIwTGpwd3ZVSGFWMW91anJBaDdxUkZTeWhSM1I1ZmJiS09NQ1BDOTV4bEMr?=
 =?utf-8?B?K1dPWkRUaHZlLzRYZzV1b2xOTEtVb3dRdENUd3c0QklsRHZzM1pSa1Y3U25n?=
 =?utf-8?B?U3lVeHhIaDc0WnBMSkdKalB0ckg4cUs3ZEVDb21NaG5sWVZhcU5ZOEJGYjJI?=
 =?utf-8?B?WnQvNjdKRGgwY2VpNVB4b21Ib3dmTzkrVnl3cVhtSTNaYVJ1UnB3VWhJZkIw?=
 =?utf-8?B?bUFuTFdvU042RHNkZU9halpaYVF5Z0hoVUFIKytLWUVYWjgybWpHWDhBdWNq?=
 =?utf-8?B?R0ZHdS9PeEJrK0xoaWtwMlBoaktaM29oY09SOVVpNE9LeXpjTS96a1lQWUxQ?=
 =?utf-8?B?WmY4MndBTm1waXorZWtDRU9mRVVEY1Rrd25UQ3JzSE51SUV1RnFUNEN3TTEx?=
 =?utf-8?Q?yF9LKBHLlC/4P/6MwCmpGIo=3D?=
X-OriginatorOrg: iwave-global.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 676f0c39-1be0-4504-52cf-08de15e78d2c
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 06:02:18.4654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 507ae903-cc48-4d6e-bdb6-35278120a345
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6yU4r9R+SuOiF0ucAzB365YkZbKlLxTLjG4yo8Cu6PjMKoLYHFRWNjM6T+KA6h8oi4mpfs6BpJ/JBi135xqUErpnxq3kdgWVx5tM511z1VWRFFoYKCIPOtdyFcjcPhcP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB4575
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=iwave-global.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8pNUfz7J8wcJuFFmWaHcNcegvq+iact6PkWB03qzys=;
 b=FnmHvuZ+GHOXXYEbCsmxSfrBZTXVUmEIQwLcnrlTzEkALSDSeWPwKfwuC357D7ZBSiTE+HuDqDuoiOAMDodbvcgL3sE12rezyxzXCdhjWAhzbBKeL4PO0ff8zpzM4PAF9vH8HauEBvtqMHE6/6z7DgtKHUTv59LZDWWz3cVMO7hg7cXQZYnYfOyFwZBrKvJ9U/OaLgSpLrmDh/eGhumlGdf9mrxCZjnp0SnNO41a1aLN9GgONPVJ0JBjHH6WHiZO1Vq68CDnER/0Yaxjixu45hDWj6h/TY50i0GZMNME8w4KXRk2PJigZzwicSUMokpvSX0ilkbADSi2I5+IU9wXRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=iwave-global.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=iwave-global.com header.i=@iwave-global.com
 header.a=rsa-sha256 header.s=selector1 header.b=FnmHvuZ+
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iwave-global.com;
Subject: Re: [Buildroot] Implementation Procedure for i.MX93 Custom Board
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Esakkiammal M via buildroot <buildroot@buildroot.org>
Reply-To: Esakkiammal M <esakkiammal.murugan@iwave-global.com>
Content-Type: multipart/mixed; boundary="===============1776377245829943593=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1776377245829943593==
Content-Type: multipart/alternative;
 boundary="------------PaMQs9ao50tsH6gqf0PP6ac6"
Content-Language: en-US

--------------PaMQs9ao50tsH6gqf0PP6ac6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Team,

Kindly respond to my queries.

Thank you.

Thanks & Regards,

Esakkiammal M


------------------------------------------------------------------------


On 27/10/25 15:04, Esakkiammal M wrote:
>
> Hello,
>
> While validation camera ov5604 in build root kernel.
>
> Please let us known the solution of below issue in build root.
>
> # gst-launch-1.0 v4l2src device=/dev/video0 ! 
> video/x-raw,width=1920,height=1080
>  ! waylandsink
> WARNING: erroneous pipeline: no element "waylandsink"
>
> Thanks & Regards,
>
> Esakkiammal M
>
>
> ------------------------------------------------------------------------
>
>
> On 23/10/25 15:59, Esakkiammal M wrote:
>>
>> Hello,
>>
>> WiFi firmware issue is resolved but while validation open network 
>> like without password it is connecting with password like WPA2 and 
>> WPA3 not working.
>>
>> connmanctl> connect 
>> wifi_10322c69d5fa_4e65686127732053323420556c747261_managed_p
>> Agent RequestInput 
>> wifi_10322c69d5fa_4e65686127732053323420556c747261_managed_psk
>>   Passphrase = [ Type=psk, Requirement=mandatory ]
>> Passphrase? 12345678
>> Agent ReportError 
>> wifi_10322c69d5fa_4e65686127732053323420556c747261_managed_psk
>>   invalid-key
>>
>> Kindly let us know the solution of this issue.
>>
>> Thanks & Regards,
>>
>> Esakkiammal M
>>
>> ------------------------------------------------------------------------
>>
>>
>> On 23/10/25 10:59, Esakkiammal M wrote:
>>>
>>> Hello,
>>>
>>> Kindly tell me the solution for this issue in build root wifi porting.
>>>
>>> Thanks & Regards,
>>>
>>> Esakkiammal M
>>>
>>> ------------------------------------------------------------------------
>>> On 16/10/25 11:07, Esakkiammal M wrote:
>>>>
>>>> Hello,
>>>>
>>>> I have enabled the MWIFIEX Wi-Fi driver in Buildroot for my 
>>>> platform. During validation, I observed that the driver fails to 
>>>> initialize the firmware properly. Please find the log details and 
>>>> observations below.
>>>>
>>>>
>>>> Steps Performed
>>>>
>>>> Enabled MWIFIEX configuration in Buildroot.
>>>>
>>>> Loaded the driver using the command:
>>>>
>>>>
>>>> modprobe moal mod_para=nxp/wifi_mod_para.conf
>>>>
>>>>
>>>> # modprobe moal mod_para=nxp/wifi_mod_para.conf
>>>> [   28.293486] mlan: loading out-of-tree module taints kernel.
>>>> [   28.332881] wlan: Loading MWLAN driver
>>>> [   28.336987] wlan: Register to Bus Driver...
>>>> [   28.341369] vendor=0x0471 device=0x0205 class=0 function=1
>>>> [   28.346989] Attach moal handle ops, card interface type: 0x109
>>>> [   28.352833] rps set to 0 from module param
>>>> [   28.359963] SDIW612: init module param from usr cfg
>>>> [   28.364906] card_type: SDIW612, config block: 0
>>>> [   28.369439] cfg80211_wext=0xf
>>>> [   28.372405] max_vir_bss=1
>>>> [   28.375018] cal_data_cfg=none
>>>> [   28.377984] ps_mode = 1
>>>> [   28.380435] auto_ds = 1
>>>> [   28.382879] host_mlme=enable
>>>> [   28.385765] fw_name=nxp/sduart_nw61x_v1.bin.se
>>>> [   28.390227] SDIO: max_segs=128 max_seg_size=65535
>>>> [   28.394921] rx_work=1 cpu_num=2
>>>> [   28.398063] Enable moal_recv_amsdu_packet
>>>> [   28.402098] Attach mlan adapter operations.card_type is 0x109.
>>>> [   28.408248] wlan: Enable TX SG mode
>>>> [   28.411751] wlan: Enable RX SG mode
>>>> [   28.416394] Request firmware: nxp/sduart_nw61x_v1.bin.se
>>>> [   28.642440] Wlan: FW download over, firmwarelen=1065364 
>>>> downloaded 953164
>>>> [   34.648319] Fail to poll firmware status: firmwarestat=0x0
>>>> [   34.653811] FW failed to be active in time!
>>>> [   34.657996] wlan_dnld_fw fail ret=0xffffffff
>>>> [   34.662266] WLAN: Fail download FW with nowwait: 0
>>>> [   34.667216] SDIO Func0 (0x0-0x9): 43 03 02 02 03 00 00 02 03 00
>>>> [   34.673318] SDIO Func1 (0x10-0x17): 00 00 00 00 00 00 00 00
>>>> [   34.679151] SDIO Func1: (0x8) 00 (0x58) 00 (0x5c) 0d (0x5d) 00 
>>>> (0x60) 01 (0x61) 00 (0x62) 00 (0x64) 10 (0x65) 01 (0x66) 00 (0x68) 
>>>> 00 (0x69) 00 (0x6a) 00
>>>> [   34.693708] SDIO Func1 (0xe8-0xff): 00 00 00 00 4c 8b 0e 00 24 
>>>> 14 70 c8 ab 37 80 00 00 00 00 00 01 00 00 00
>>>> [   34.803809] SDIO Func1 (0xe8-0xff): 00 00 00 00 4c 8b 0e 00 24 
>>>> 14 70 c8 ab 37 80 00 00 00 00 00 01 00 00 00
>>>> [   34.813727] woal_request_fw failed
>>>> [   34.817132] Firmware Init Failed
>>>> [   34.824576] Free module params
>>>> [   34.827631] woal_add_card failed
>>>> [   34.831003] wlan_sdio: probe of mmc2:0001:1 failed with error -1
>>>> [   34.837160] wlan: Register to Bus Driver Done
>>>> [   34.841535] wlan: Driver loaded successfully
>>>> #
>>>> # connmanctl
>>>> Error getting VPN connections: The name net.connman.vpn was not 
>>>> provided by any .service files
>>>> connmanctl> [   62.608517] cfg80211: failed to load regulatory.db
>>>> enable wifi
>>>> wifi is not available
>>>> connmanctl> exit
>>>> # ls /lib/firmware/nxp/
>>>> helper_uart_3000000.bin  sduart_nw61x_v1.bin.se uartuart_n61x_v1.bin.se
>>>> sd_w61x_v1.bin.se        uartspi_n61x_v1.bin.se wifi_mod_para.conf
>>>> #
>>>>
>>>> Could you please help me identify the reason for the firmware 
>>>> activation failure and guide me on how to resolve it?
>>>>
>>>>
>>>> Thanks & Regards,
>>>>
>>>> Esakkiammal M
>>>>
>>>>
>>>> ------------------------------------------------------------------------
>>>>
>>>>
>>>> On 15/10/25 16:38, Esakkiammal M wrote:
>>>>>
>>>>> Hello,
>>>>>
>>>>> My kernel and U-Boot are working fine under Yocto on this custom 
>>>>> board. The hardware includes Wi-Fi 6, Bluetooth 5.3, and IEEE 
>>>>> 802.15.4.
>>>>>
>>>>> I’m now testing the same setup in Buildroot, but when I try to 
>>>>> load the Wi-Fi driver using:
>>>>>
>>>>> modprobe moal mod_para=nxp/wifi_mod_para.conf
>>>>>
>>>>> I get this error:
>>>>>
>>>>> modprobe: module moal not found in modules.dep
>>>>>
>>>>> It seems the NXP Wi-Fi driver (moal.ko) isn’t being built or 
>>>>> included in my Buildroot image. Could you please suggest the 
>>>>> recommended way to integrate the nxp-modwifi driver or any patches 
>>>>> required to enable it in Buildroot?
>>>>>
>>>>>
>>>>> Thanks & Regards,
>>>>>
>>>>> Esakkiammal M
>>>>>
>>>>> ------------------------------------------------------------------------
>>>>>
>>>>>
>>>>> On 15/10/25 16:30, Fiona Klute wrote:
>>>>>> Hi Esakkiammal!
>>>>>> Am 15.10.25 um 11:56 schrieb Esakkiammal M via buildroot:
>>>>>>> Hello,
>>>>>>>
>>>>>>> I have implemented support for our i.MX93 custom board by 
>>>>>>> referring to the i.MX93 EVK configuration.
>>>>>>>
>>>>>>> git clone https://github.com/buildroot/buildroot.git
>>>>>>> git switch 2025.02.x
>>>>>>>
>>>>>>> make freescale_imx93evk_defconfig
>>>>>>> make
>>>>>>>
>>>>>>> Can you tell how port WiFi and BT for imx93 custom board.
>>>>>>
>>>>>> It's impossible to give a definitive answer without knowing the 
>>>>>> details of your board, but in general:
>>>>>>
>>>>>> 1. If you have a custom board, you may need a custom DTS that 
>>>>>> correctly describes your board (instead of the default one) for 
>>>>>> all hardware to be detected correctly.
>>>>>>
>>>>>> 2. Make sure the kernel drivers for any additional hardware are 
>>>>>> enabled in the kernel config you use.
>>>>>>
>>>>>> 3. The defconfigs are intentionally minimal. You'll need to add 
>>>>>> the target packages to support what you want to do with wifi and BT:
>>>>>>
>>>>>> * any firmware needed for the devices on your board
>>>>>> * wpa_supplicant or iwd or hostapd, maybe NetworkManager too 
>>>>>> (depending on how you want to use wifi)
>>>>>> * bluez5-utils (probably) for BT
>>>>>>
>>>>>> Some of those packages have optional components that you may or 
>>>>>> may not need.
>>>>>>
>>>>>> Best regards,
>>>>>> Fiona
>>>>>>
--------------PaMQs9ao50tsH6gqf0PP6ac6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Dear Team,</p>
    <p data-start="71" data-end="100">Kindly respond to my queries.</p>
    <p data-start="71" data-end="100">Thank you.</p>
    <p><span data-teams="true"> Thanks &amp; Regards,<br>
      </span> </p>
    <p><span data-teams="true">Esakkiammal M</span></p>
    <p><span data-teams="true"><br>
      </span></p>
    <p><span data-teams="true"></span></p>
    <hr width="100%" size="2">
    <p><span data-teams="true"><br>
      </span></p>
    <p></p>
    <div class="moz-cite-prefix">On 27/10/25 15:04, Esakkiammal M wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:438a57da-d01d-41ee-8f11-0bb2ec522350@iwave-global.com">
      
      <p>Hello,<br>
      </p>
      <p>While validation camera ov5604 in build root kernel.</p>
      <p>Please let us known the solution of below issue in build root.</p>
      <p># gst-launch-1.0 v4l2src device=/dev/video0 !
        video/x-raw,width=1920,height=1080<br>
        &nbsp;! waylandsink<br>
        WARNING: erroneous pipeline: no element &quot;waylandsink&quot;<br>
        <br>
      </p>
      <p><span data-teams="true"> Thanks &amp; Regards,<br>
        </span> </p>
      <p><span data-teams="true">Esakkiammal M</span></p>
      <p><br>
      </p>
      <hr width="100%" size="2">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 23/10/25 15:59, Esakkiammal M
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:68a237a6-6e79-42b9-a3b5-52194d42e782@iwave-global.com">
        <p>Hello,<br>
          <br>
          WiFi firmware issue is resolved but while validation open
          network like without password it is connecting with password
          like WPA2 and WPA3 not working.<br>
          <br>
        </p>
        <p>connmanctl&gt; connect
          wifi_10322c69d5fa_4e65686127732053323420556c747261_managed_p <br>
          Agent RequestInput
          wifi_10322c69d5fa_4e65686127732053323420556c747261_managed_psk<br>
          &nbsp; Passphrase = [ Type=psk, Requirement=mandatory ]<br>
          Passphrase? 12345678<br>
          Agent ReportError
          wifi_10322c69d5fa_4e65686127732053323420556c747261_managed_psk<br>
          &nbsp; invalid-key<br>
        </p>
        <p>Kindly let us know the solution of this issue.<br>
        </p>
        <p><span data-teams="true"> Thanks &amp; Regards,<br>
          </span> </p>
        <p><span data-teams="true">Esakkiammal M</span></p>
        <p><span data-teams="true"></span></p>
        <hr width="100%" size="2">
        <p><span data-teams="true"><br>
          </span></p>
        <div class="moz-cite-prefix">On 23/10/25 10:59, Esakkiammal M
          wrote:<br>
        </div>
        <blockquote type="cite" cite="mid:a08cca53-7d11-4101-ac6f-b34de963d870@iwave-global.com">
          <p>Hello,</p>
          <p>Kindly tell me the solution for this issue in build root
            wifi porting.<br>
            <br>
          </p>
          <p><span data-teams="true"> Thanks &amp; Regards,<br>
            </span> </p>
          <p><span data-teams="true">Esakkiammal M</span></p>
          <hr width="100%" size="2">
          <div class="moz-cite-prefix">On 16/10/25 11:07, Esakkiammal M
            wrote:<br>
          </div>
          <blockquote type="cite" cite="mid:5eb375f3-d026-4592-81f4-462548717d61@iwave-global.com">
            <p>Hello,</p>
            <p>I have enabled the MWIFIEX Wi-Fi driver in Buildroot for
              my platform. During validation, I observed that the driver
              fails to initialize the firmware properly. Please find the
              log details and observations below.<br>
              <br>
              <br>
              Steps Performed<br>
              <br>
              Enabled MWIFIEX configuration in Buildroot.<br>
              <br>
              Loaded the driver using the command:<br>
              <br>
              <br>
              modprobe moal mod_para=nxp/wifi_mod_para.conf<br>
              <br>
              <br>
              # modprobe moal mod_para=nxp/wifi_mod_para.conf<br>
              [&nbsp;&nbsp; 28.293486] mlan: loading out-of-tree module taints
              kernel.<br>
              [&nbsp;&nbsp; 28.332881] wlan: Loading MWLAN driver<br>
              [&nbsp;&nbsp; 28.336987] wlan: Register to Bus Driver...<br>
              [&nbsp;&nbsp; 28.341369] vendor=0x0471 device=0x0205 class=0
              function=1<br>
              [&nbsp;&nbsp; 28.346989] Attach moal handle ops, card interface
              type: 0x109<br>
              [&nbsp;&nbsp; 28.352833] rps set to 0 from module param<br>
              [&nbsp;&nbsp; 28.359963] SDIW612: init module param from usr cfg<br>
              [&nbsp;&nbsp; 28.364906] card_type: SDIW612, config block: 0<br>
              [&nbsp;&nbsp; 28.369439] cfg80211_wext=0xf<br>
              [&nbsp;&nbsp; 28.372405] max_vir_bss=1<br>
              [&nbsp;&nbsp; 28.375018] cal_data_cfg=none<br>
              [&nbsp;&nbsp; 28.377984] ps_mode = 1<br>
              [&nbsp;&nbsp; 28.380435] auto_ds = 1<br>
              [&nbsp;&nbsp; 28.382879] host_mlme=enable<br>
              [&nbsp;&nbsp; 28.385765] fw_name=nxp/sduart_nw61x_v1.bin.se<br>
              [&nbsp;&nbsp; 28.390227] SDIO: max_segs=128 max_seg_size=65535<br>
              [&nbsp;&nbsp; 28.394921] rx_work=1 cpu_num=2<br>
              [&nbsp;&nbsp; 28.398063] Enable moal_recv_amsdu_packet<br>
              [&nbsp;&nbsp; 28.402098] Attach mlan adapter operations.card_type is
              0x109.<br>
              [&nbsp;&nbsp; 28.408248] wlan: Enable TX SG mode<br>
              [&nbsp;&nbsp; 28.411751] wlan: Enable RX SG mode<br>
              [&nbsp;&nbsp; 28.416394] Request firmware:
              nxp/sduart_nw61x_v1.bin.se<br>
              [&nbsp;&nbsp; 28.642440] Wlan: FW download over, firmwarelen=1065364
              downloaded 953164<br>
              [&nbsp;&nbsp; 34.648319] Fail to poll firmware status:
              firmwarestat=0x0<br>
              [&nbsp;&nbsp; 34.653811] FW failed to be active in time!<br>
              [&nbsp;&nbsp; 34.657996] wlan_dnld_fw fail ret=0xffffffff<br>
              [&nbsp;&nbsp; 34.662266] WLAN: Fail download FW with nowwait: 0<br>
              [&nbsp;&nbsp; 34.667216] SDIO Func0 (0x0-0x9): 43 03 02 02 03 00 00
              02 03 00 <br>
              [&nbsp;&nbsp; 34.673318] SDIO Func1 (0x10-0x17): 00 00 00 00 00 00
              00 00 <br>
              [&nbsp;&nbsp; 34.679151] SDIO Func1: (0x8) 00 (0x58) 00 (0x5c) 0d
              (0x5d) 00 (0x60) 01 (0x61) 00 (0x62) 00 (0x64) 10 (0x65)
              01 (0x66) 00 (0x68) 00 (0x69) 00 (0x6a) 00 <br>
              [&nbsp;&nbsp; 34.693708] SDIO Func1 (0xe8-0xff): 00 00 00 00 4c 8b
              0e 00 24 14 70 c8 ab 37 80 00 00 00 00 00 01 00 00 00 <br>
              [&nbsp;&nbsp; 34.803809] SDIO Func1 (0xe8-0xff): 00 00 00 00 4c 8b
              0e 00 24 14 70 c8 ab 37 80 00 00 00 00 00 01 00 00 00 <br>
              [&nbsp;&nbsp; 34.813727] woal_request_fw failed<br>
              [&nbsp;&nbsp; 34.817132] Firmware Init Failed<br>
              [&nbsp;&nbsp; 34.824576] Free module params<br>
              [&nbsp;&nbsp; 34.827631] woal_add_card failed<br>
              [&nbsp;&nbsp; 34.831003] wlan_sdio: probe of mmc2:0001:1 failed with
              error -1<br>
              [&nbsp;&nbsp; 34.837160] wlan: Register to Bus Driver Done<br>
              [&nbsp;&nbsp; 34.841535] wlan: Driver loaded successfully<br>
              # <br>
              # connmanctl<br>
              Error getting VPN connections: The name net.connman.vpn
              was not provided by any .service files<br>
              connmanctl&gt; [&nbsp;&nbsp; 62.608517] cfg80211: failed to load
              regulatory.db<br>
              enable wifi<br>
              wifi is not available<br>
              connmanctl&gt; exit<br>
              # ls /lib/firmware/nxp/<br>
              helper_uart_3000000.bin&nbsp; sduart_nw61x_v1.bin.se&nbsp;&nbsp;
              uartuart_n61x_v1.bin.se<br>
              sd_w61x_v1.bin.se&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uartspi_n61x_v1.bin.se&nbsp;&nbsp;
              wifi_mod_para.conf<br>
              # <br>
              <br>
              Could you please help me identify the reason for the
              firmware activation failure and guide me on how to resolve
              it?<br>
              <br>
              <br>
            </p>
            <p><span data-teams="true"> Thanks &amp; Regards,<br>
              </span> </p>
            <p><span data-teams="true">Esakkiammal M</span></p>
            <p><br>
            </p>
            <hr width="100%" size="2">
            <p><br>
            </p>
            <div class="moz-cite-prefix">On 15/10/25 16:38, Esakkiammal
              M wrote:<br>
            </div>
            <blockquote type="cite" cite="mid:3ac2065a-8ac7-4a59-9889-51fce1eae53d@iwave-global.com">
              <p>Hello,</p>
              <p>My kernel and U-Boot are working fine under Yocto on
                this custom board. The hardware includes Wi-Fi 6,
                Bluetooth 5.3, and IEEE 802.15.4.<br>
                <br>
                I’m now testing the same setup in Buildroot, but when I
                try to load the Wi-Fi driver using:<br>
                <br>
                modprobe moal mod_para=nxp/wifi_mod_para.conf<br>
                <br>
                I get this error:<br>
                <br>
                modprobe: module moal not found in modules.dep<br>
                <br>
                It seems the NXP Wi-Fi driver (moal.ko) isn’t being
                built or included in my Buildroot image. Could you
                please suggest the recommended way to integrate the
                nxp-modwifi driver or any patches required to enable it
                in Buildroot?</p>
              <p>&nbsp;<br>
              </p>
              <p><span data-teams="true"> Thanks &amp; Regards,<br>
                </span> </p>
              <p><span data-teams="true">Esakkiammal M</span></p>
              <p><span data-teams="true"></span></p>
              <hr width="100%" size="2">
              <p><span data-teams="true"><br>
                </span></p>
              <div class="moz-cite-prefix">On 15/10/25 16:30, Fiona
                Klute wrote:<br>
              </div>
              <blockquote type="cite" cite="mid:584f433e-3ace-4493-a073-7cb92eae6d08@gmx.de">Hi
                Esakkiammal! <br>
                Am 15.10.25 um 11:56 schrieb Esakkiammal M via
                buildroot: <br>
                <blockquote type="cite">Hello, <br>
                  <br>
                  I have implemented support for our i.MX93 custom board
                  by referring to the i.MX93 EVK configuration. <br>
                  <br>
                  git clone <a class="moz-txt-link-freetext" href="https://github.com/buildroot/buildroot.git" moz-do-not-send="true">https://github.com/buildroot/buildroot.git</a>
                  <br>
                  git switch 2025.02.x <br>
                  <br>
                  make freescale_imx93evk_defconfig <br>
                  make <br>
                  <br>
                  Can you tell how port WiFi and BT for imx93 custom
                  board. <br>
                </blockquote>
                <br>
                It's impossible to give a definitive answer without
                knowing the details of your board, but in general: <br>
                <br>
                1. If you have a custom board, you may need a custom DTS
                that correctly describes your board (instead of the
                default one) for all hardware to be detected correctly.
                <br>
                <br>
                2. Make sure the kernel drivers for any additional
                hardware are enabled in the kernel config you use. <br>
                <br>
                3. The defconfigs are intentionally minimal. You'll need
                to add the target packages to support what you want to
                do with wifi and BT: <br>
                <br>
                * any firmware needed for the devices on your board <br>
                * wpa_supplicant or iwd or hostapd, maybe NetworkManager
                too (depending on how you want to use wifi) <br>
                * bluez5-utils (probably) for BT <br>
                <br>
                Some of those packages have optional components that you
                may or may not need. <br>
                <br>
                Best regards, <br>
                Fiona <br>
                <br>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------PaMQs9ao50tsH6gqf0PP6ac6--

--===============1776377245829943593==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1776377245829943593==--
