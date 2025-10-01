Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3405DCCA470
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 20:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BB7F614C0;
	Wed,  1 Oct 2025 20:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YazwjYNs1UMj; Wed,  1 Oct 2025 20:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E55E614C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E55E614C4;
	Wed,  1 Oct 2025 20:59:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D2141CE
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43624614C4
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4tsBT2zhfX7N for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 20:59:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d114::;
 helo=sn4pr2101cu001.outbound.protection.outlook.com;
 envelope-from=ohitsdylan@outlook.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 85B51614C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85B51614C0
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazolkn190120000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d114::])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85B51614C0
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:59:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvM28Te7xrI79L/Vs43JpKnyIJmv/pWy926V6XUL81Iulp+hl8szs0alwTfCudxLMCN1Gk3QU+NQS6AAv2VDeACHI9uEyLZe0RR/OfGP9CD4iLvDIviDjdhRveWPbkzJG6HveC7Im8LOGost7z2lRM0oGPMA/qg9PcSG2Y6tqz9ov14iJkQeMa45BsjXv9FzRV/O5Nf5W7rtJW3NKeNHP2LfojdZydnRT/06dJmRXJTiyvk/n+rreuxTQj11exmP3a7hdceB0Wob3rfiSodRWK7S9UIaudSOU6jR/6TFwwD0m2hyAIkp+qHoQHe74IuNJON/OQi7+v1MkEv3I/hwYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+iupiVxoX0CGEccw93MGe6065ndGjZEDHC6CDx8Sbg=;
 b=H9RJdH+vgilp8X9KXo2p/1oXiSZpI9aE7NY8m09hYUGAU7NhaenZKi0L6AcJ0n14Hh8soIHPXbOcH9yRWy6ghhPLtdYlExbWmjwOPWd9U08YukQKnr7inhTD9cZe3d4acc2ZIAl4TRBRhhmcyYkzfWt4mzObQPOyKpuJoIjwPDvLhenDfO5i5j3leklU18iXiCHfw2XDoJBrj6MIWNHg7BLFqxR9luyH8NcZRDAEOe1jHLWaoDcdmaoBUKSgPE4vxbkXpKD9ZSWc2DuBaNUbPmGe/0by4H724uYTGQdssH4/f5TWPjGvFV31gBMzBhYvq0LjvAcOrjoDRkfcCL79pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from IA0PPFC38B3687C.namprd19.prod.outlook.com
 (2603:10b6:20f:fc04::ccc) by PH0PR19MB4790.namprd19.prod.outlook.com
 (2603:10b6:510:28::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 20:59:11 +0000
Received: from IA0PPFC38B3687C.namprd19.prod.outlook.com
 ([fe80::c6f:bd1d:b8c4:e7a2]) by IA0PPFC38B3687C.namprd19.prod.outlook.com
 ([fe80::c6f:bd1d:b8c4:e7a2%7]) with mapi id 15.20.9137.018; Wed, 1 Oct 2025
 20:59:11 +0000
Message-ID: <IA0PPFC38B3687C2EF201500BB7B1AEE193CBE6A@IA0PPFC38B3687C.namprd19.prod.outlook.com>
Date: Wed, 1 Oct 2025 16:59:13 -0400
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: bonet@grenoble.cnrs.fr, ohitsdylan@outlook.com
References: <bad4b626-6f6c-4eef-8e8d-0a5af5aa235d@grenoble.cnrs.fr>
Content-Language: en-US
From: Dylan <ohitsdylan@outlook.com>
In-Reply-To: <bad4b626-6f6c-4eef-8e8d-0a5af5aa235d@grenoble.cnrs.fr>
X-ClientProxiedBy: CH0P221CA0032.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11d::11) To IA0PPFC38B3687C.namprd19.prod.outlook.com
 (2603:10b6:20f:fc04::ccc)
X-Microsoft-Original-Message-ID: <9f05d4a9-61f4-4fa5-9647-ef5fe544e8f4@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PPFC38B3687C:EE_|PH0PR19MB4790:EE_
X-MS-Office365-Filtering-Correlation-Id: f29c63da-e4a0-4d42-1ca9-08de012d5ec9
X-MS-Exchange-SLBlob-MailProps: hnD4Fgoc1bOPxY5jP7d5r6/tY/NRJSkf0wRQ52thXbNB7sSFJlNp0rWBaR4TfX3O1j9WRhUYaKbhz6+cmf7gWV4N5gDOiX2NVnBFjlj6eB76MMHfXnXeAAdnahKC2aWCYVlQKTdv7KC3a6IPJSiT5/cknKOamLvJ7QSmF7F93Sent0dX7wBuz/g2zvVv0UWFchGZnS9grrozSKUNK+mkVtpQq2ji1+kElK0CIMkA75679FS93wa9uFSDsw1lLjRCrF3rJBeiHSDvAbcZiw5af/kBUjgbLaLXtKBdVb3Qpacw1DjqiEmbelfuH4dW+VROHyLPIpyN5bxF1tYEbUaOh3T/JS9lm4l6ln3vVXfQbD3nf0zWIdGTbJ0zUDUngp1v2dr8CbEWOf6w+opQ/6EJtkXz8o+af3Nf51oUAkJqwM1EHbhevBDrrycnQ+h57l8lBVLeZFL4zP1QCYy06p9TvRKAqQIjFVkRDVqXrf5cZ/C7IOkUgWzlda36TRpH5wJFn+MfnmngzkOpxHYbzJv5syXPYV73pRcP4WrQPdAO9e4/8gilSIGarpwsWvKbAzkZrJBnTr8xC5z2M8K/vJTgAsi2s2RPsKN4YGcqQ0NNBnCXzrgeRQRgXM7tO2xJm0V3
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|5072599009|19110799012|461199028|6090799003|15080799012|23021999003|8060799015|40105399003|440099028|3412199025|13041999003|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWsyUUpZcjgvZ3NFSHRpK2dvcmloYjluRDR4bnhLbEFZRGdBU0pleTZyWWxZ?=
 =?utf-8?B?WmFkNmoyOUZjZ1E3TExYdm9QYVl3ajd3NEx3eDVUclY0UDdUMHJkekNXcnpI?=
 =?utf-8?B?QmVtemZXUXNvSTQ2bFI2RUdGUU82aFpSSEMxOVBpZ1o1NWtPSnByUHo2MUdh?=
 =?utf-8?B?YmZsL1VzdTE1VWswTHhFZ1gwUEhZVWRQY25wOTRBY0FIaUZjNGxvSUNwRDZo?=
 =?utf-8?B?MmdmS2FORDdnTTZJcXBDNWU0QlRoczRrdElLSnp2R0ZOcnEydGR0cG5uUEc2?=
 =?utf-8?B?NUljUk9pRVVxL01hTk80S3ptWU1ZeHI5Nks1am9Pd2dLU3dHWXVmN3VPOGMx?=
 =?utf-8?B?Z3BFSGdNd09ZM1BUSUttRUUrRlNnN01RQTV1MStGZW5lcWRwSENlV3VyN3BX?=
 =?utf-8?B?UnFrRTRPVDMwL0JKbWNxTUI3cjkvbnNxR3dmTGx2ZnVsdDBGUjZHK1M1R0p0?=
 =?utf-8?B?TXYrSExrNDhPQXY3bmdsd2xuei9aU2orY0VwRyswaTMzaktNSTZuV256NVdH?=
 =?utf-8?B?SEVlK1lZSGd1VklOSUNLbEhIZFZxbE9aTTFzZjVhRzIvUGhWZE5IWVBLNlNh?=
 =?utf-8?B?d0pKU3hZT0s1aXU1U3NiRzVDajdkandtemtPWUREcFFXa1BQaERMczIwVCtl?=
 =?utf-8?B?dW9PYTcyRDd2RnVYZGlpTmE1SjRFSG5IUHlqamlST1JDazFMU2NpdE0yUEpt?=
 =?utf-8?B?Vkp5RTZURTBtR1lKamtXZzBkS3ZYeTJrT3JiN1BZb2ljSjExOXRHem9QcHp2?=
 =?utf-8?B?UGhReXRiSkowb3dYYWpENzc4STNXQnZxMmU0b0pkczYrQ2ZlVjZLL2lRN0JK?=
 =?utf-8?B?VEpCalNmRFBveEdVOTQ5UHRKYTRiL3Buci83UVVabUhqL1E4c3R3dXBaVjF4?=
 =?utf-8?B?UXhkaEE0WUt2WXMwYkV1aXhyWFRseCtOK21KRmhyS3pTblVkZFFtVU45ZXpu?=
 =?utf-8?B?T21SRDVDK0NnSzJZb1lJNkk2dnk4R2tidFRHNUxQRWNWMUlDVXdJV2s2cWlI?=
 =?utf-8?B?ZnAzQllGb1N1eDJNRitrMzBXaVFGN3hlNHA1UVVENVA5L3ZKQVBIR2JOUWtS?=
 =?utf-8?B?M3crdVcxLysxWERhWTdUbmJqVjhDRFkxYmE5dENlQkJSYngvL1c4UE9jMlQw?=
 =?utf-8?B?Vlc5Vy9LZ2Q3T2xqc2VYb1JvZFBQdGgxYThoMmZOQkwra3Q1N3hvbmtCZm5M?=
 =?utf-8?B?U3FnYkQrRVplb25KcEJnTy9EUFpGWUxKTi94RWJwYjVCTEl2bGJyUXdrOTU2?=
 =?utf-8?B?Q3AxWmt3aGRUV05hajVKall5bmNyanRFWkFtTmtWbkIvdnNKV29IYVJEc3VT?=
 =?utf-8?B?TEI1R1hmQUVmQ0V6ZWEzZTBSNzhIbkxXa3VyU2djaFB5dlFkUTZSMmNxV1Ux?=
 =?utf-8?B?YVgvTjJ6dUtnL0p4SFhTSk1uMkkzL1gyZTVPbldncjJJZVhTOXhDcUtvOXdi?=
 =?utf-8?B?YzZlTnRiajB2eEdOMHZyVnZGWW5mbmpEbXNFaHJIa1p5NFJ6MWtyU1gwVWQ0?=
 =?utf-8?B?UjhoQ1NlaXFSK1o3UUJST0syd29OQ24yS0QyeWZWbUIrUW5PaXNiMzFXMWpt?=
 =?utf-8?B?cGNQVFQ5bVhwVlZtc0dlK0NablFjelFPTTVJOUlyWk5FUTBNemE5a2Zmc0Rt?=
 =?utf-8?Q?V2jUC7Y4R89WmsRhZ3OXx6Ij/tJyke8Lzp+uaZFDJyGI=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bU1hREpNWjdtRXlrbERyKzVIbkwrZS9MNGZpb01hWHZrK25Yc1lMYnRCeHBN?=
 =?utf-8?B?TlZDY0ZlREx1ZVQ2Tm5jZzVrL1B4UlVwdWllSE8wakZZaElUY0JtbGM5T0ty?=
 =?utf-8?B?T3VOMVl2ODhlVlFkN0JEMXQxWmo1R016SkFKZUlZMUZEYlRCQU5DenU0WE5m?=
 =?utf-8?B?T2l1czBoTkMwSmw3Y2JRUzVvOUo2eWpQZkQ1Qm5pVHM2SHJEbyt3U3hSdlMx?=
 =?utf-8?B?dzdlb3kwQVV6TmVkNVdFeW1BUE1oNUl6MHZJV1Q5NGFqTWRkN09wcUZZSFdD?=
 =?utf-8?B?KzJENkhBa1MzR0VYampJMGJmZCtFV0o2TmtHR3N6M3VYNkdSemZLbDNVRDVE?=
 =?utf-8?B?Y1AyNVg2elFpVG1MYldHUHJsSUlpNVBEMXhMeU5NZ285NFRSQXJKa3lZOVVL?=
 =?utf-8?B?R3Vvdkc2OTcvOFNldTlBU2VaTDBjbnVMZ01Fd1kxaitWckdpbEQ5RnVIc1Ny?=
 =?utf-8?B?SDR3L2NtZkR6c2JqUDExMDdHTFlvMGxuaW5DaFFva0l0N0ZxVFNBRENDSXFB?=
 =?utf-8?B?eEZxamVzK21icnRxREVDVndoUzE5ZmVCZEk5YVY4YkdhdkhLR3pOYWovRXJT?=
 =?utf-8?B?QkxodStTTDFWd1NRSWRkT3UvNnJYSUFEbDNwRlBTYkRtWXdHTkhZYW5XUHBt?=
 =?utf-8?B?RFBHa3Z4MHp3bWVmRUJNcE5vYzEzdGxDOTdscmY0QTFBZTNiYm5DcFpGMTFy?=
 =?utf-8?B?Zzc3OW43aFVQSjl2c3YvZDFMaEdrSUd0ZEVtQlNDZlBWUTFTM3VWSm85V05Z?=
 =?utf-8?B?MUZDNVlsVkVEQlN4amZHcWl6eEpYNHdGWUt4TjZXZjYwK0ZscVpMbEdpZnBU?=
 =?utf-8?B?cExHVytHUERUb1NmejF1NmNWd3RueVBTcEdMdEZDU1phQ3VyYThZbTUwbWds?=
 =?utf-8?B?NllMUDBFd2taeUFUbXJuc1ZpalV2bnhhcGNrZlFLRW9iT0FyRUFTY2tUR013?=
 =?utf-8?B?LzFjOTVTRkw3aml3c1F4WkR0NFArZ0FxcHZiY3BwbFNjUk1wTk4razhRejBT?=
 =?utf-8?B?OHJYZzZ3YzBXb3M4L2FmUGZrZE9nekdQVUl3U1k1V2ZMcmovbDl6dzNLUzZ3?=
 =?utf-8?B?VEk1d0xES2t0YmRKQW9DcEJRRmkxc21sOXJRR2tDWDVTV3JUNkdITy9jVk50?=
 =?utf-8?B?SG5iek84U1dkRDJCNC9uTzdKcHE4UTRkYmIvcDJscFoxVmVpQ1ZBMGxJcnVl?=
 =?utf-8?B?UkRpSTlySEFzM0pmSE1GNm1jV3JadWk2TGhDZlU2eGRkdHZKelRXMkxxZDZS?=
 =?utf-8?B?ZDVnekpyaGNtaWtjNEtaK0dYOVV5UWsybzExMFhCcjVxT2ZNL1VJS1JvUjlI?=
 =?utf-8?B?T29NMm5QUEluYkNzWXpuM0x1SXE0aE1lbEdrYXJaYUtsNzBsVTZGZk53Sy9O?=
 =?utf-8?B?N21tdk5LQTd1QnhCcGMwMWx0dWkxck8rVWd3TnJDd0N5QklMcllucy9YVkU4?=
 =?utf-8?B?aVBTRVF0U0k2d3VPN0I2ck5ualR5S1N1MUJSeCtNSFNWM2daWWdFMVJubjhY?=
 =?utf-8?B?WDN1Mk03cWI5eGQ0WTlwWTJZcXV5SnJFMTJTcFoxZ01kT3BqUWNnVEVvZ3cr?=
 =?utf-8?B?cEtMa3N5TVlUNUhuOXRlQnM4UTVlcWVJUE9rS3lRZFJGcXBZdHVUR2ZCaHZ4?=
 =?utf-8?Q?f5v7fJzBjjkgFqqgySpOqHGytJvXLj3iGzg5wxyTQCak=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f29c63da-e4a0-4d42-1ca9-08de012d5ec9
X-MS-Exchange-CrossTenant-AuthSource: IA0PPFC38B3687C.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 20:59:11.2560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB4790
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outlook.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+iupiVxoX0CGEccw93MGe6065ndGjZEDHC6CDx8Sbg=;
 b=IeRSnYrTrVFQCj9wqkGGTefq+FXaJZo6Xd9rDR/QXnWcRiHRRKONB+ckbLR3VP0g133TNyJUp3ggQhaX+9fQADyQbaJ/ji5y0UmzzyGtQaW9bjwu7DHlL7gJ5+svHY9QOBm5XsQgt46chxpYPh3uMq0mz4n/ibSBaw90oNPu5tI9pljNlbC/qQJyX5RZ1iuQXWKwd09gpQKVQOjsuauKDx2UUW8yaLd8MXSxBL8haSQ4++W2HQPYMSWKRuzLeva31srmJwiszAas+PW2jvhe9q//JXtj4LlKdYNgqybwY2mw8Xftx3dI1SrUt/c5ZQFqucwmAZVR7it0/2UsYC1y0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=outlook.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=IeRSnYrT
Subject: Re: [Buildroot] Issue Applying Patches to Package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thank you for the explanation, Edgar! This is going in my notes for sure.

Thanks again, everyone. Y'all are wonderful.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
