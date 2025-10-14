Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315F9CCD184
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 12:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4F7E80E82;
	Tue, 14 Oct 2025 12:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BcM2BGWPhO9j; Tue, 14 Oct 2025 12:14:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30F7483DDA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30F7483DDA;
	Tue, 14 Oct 2025 12:14:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 451A91C9
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 12:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C13D41499
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 12:14:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9VAzY5E731Bf for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 12:14:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c409::1;
 helo=ma0pr01cu009.outbound.protection.outlook.com;
 envelope-from=esakkiammal.murugan@iwave-global.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EA9594140F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA9594140F
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c409::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA9594140F
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 12:14:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nr8ZrwgYTApSa3sWIL46Kre2zAC3EOhTXEGBfaslBxpVsWsnX3VuYZsumVN1HNiwNWqIxBDlsSIjJK5HMHX1UPVrdd0JBgPlTvKbZ/1mRQaJwu4cWA0WTOqzLxFAbcqdhdeNJoes2zg4CsyxxSK6k9vx0+77qt9J9499HSzgm1m76PQsDCByaF8kTH1PjLcDB01AVdGSUmkQ13NghpvIpIhUB44Etp00Xn7EAkMhHixERbXX8kqzGjYfM2fCsGJZMyvD30uuJ0YsRuYVNE9i/cHlm1w/YZpKD/Qa1nRv4jvjJ7gkbIbgGjnSIwkYXp1Vh1BVOAUJd5Lbbeg5qXvVxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLubuHy4Q82Y57RoMdEE81ABdbe5F1S7gzD62Zdnr8M=;
 b=i2kYkPyivS/g7/4ruUwb8+CNP2+AKGjQN4zrydv5fl/6UxiDXRiw5PQkF3riimSQo9HKlZPWTQAhbbEshzxBvyqYUmDt0EfvqL+1Kqp4MABjuRFmlfNGtmEZdOWl3vddw4nSuPRfOCjLUcpBln5NmxzA464xKZ7vVuOQmW4UghcfLHYeI8jxzI2weC0KvHxU3zW1e0a4XDxwZAvKGdmjtXkoGJfsCQCv6mQ1chWPg6omjzBT/VPKTl/Mr4yuN/tWiZV4W4o0oc/k78BNj3kcolg9MYWq9FpeOGNOfwGrt20AMXf9gjqt2nF32k1WwyZ6Yd+vpch804a4OYKMgNflHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iwave-global.com; dmarc=pass action=none
 header.from=iwave-global.com; dkim=pass header.d=iwave-global.com; arc=none
Received: from MA0P287MB2448.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:122::11)
 by PN1P287MB3920.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:250::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 12:13:57 +0000
Received: from MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
 ([fe80::fafd:97ba:ad13:4c1e]) by MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
 ([fe80::fafd:97ba:ad13:4c1e%5]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 12:13:57 +0000
Message-ID: <23d1f4ad-241a-4fe1-9db0-08bffa4775b6@iwave-global.com>
Date: Tue, 14 Oct 2025 17:43:56 +0530
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Content-Language: en-US
X-ClientProxiedBy: MA5P287CA0103.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::8) To MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:122::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2448:EE_|PN1P287MB3920:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fa2371a-6901-44cc-0543-08de0b1b2682
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlpEaG5oSEZXUXNZeUFDbzdEeXJYNC9ERDJLTnE3SEtFWGRPejR4czJhdXln?=
 =?utf-8?B?eFh2T3h3eHR3TkdPWUhKUnVQTFh5UUQ3aitpTFlZWWowN2FweWRJRk1Vd2Jt?=
 =?utf-8?B?bFFiOFZBbmkxYnY0dnFwWXhGM2RGVTM3Rk5GWEdPdm02STBhcEtEZHlqd1Uw?=
 =?utf-8?B?eUZVRTN5bVVxYThQSUdhR205b2EzS3BOaG8zUXd6UlFWbTRBTjhnZ2pGc25J?=
 =?utf-8?B?dXkvb3hmak5xR3ZnU1pCMlJpZ3BxZmNsWUEwWFR4T21GMDZzMXE3c1hxSWlY?=
 =?utf-8?B?YU9ZOGJubkFSdjBKTUtLQWh6ak1xT3cyUFhLbXdnWkNrL3FhRVZVQ1V3blhw?=
 =?utf-8?B?UVBod0xLY3BFUSt1bzVQT0JwR3lyWkpwTHhkdGdBYm5nckxwNnlKL041emJv?=
 =?utf-8?B?Z0dxVzk4Qzk3Z2FXdWlCS1NFTzV3ZWFrSnYycFo5ZE9sV1JzUFBjZWptODNW?=
 =?utf-8?B?bldvYStqS1JhYkh1dkpoL0tuSm5MLzFJWUFrdCtyOE52cW1OQU9qdzBkWjVL?=
 =?utf-8?B?ZGU0TllMbTdFQVlJeXI2UTJueSszQnFIUHZHYkpYQ2NLTjhkTG1LclVqUlAx?=
 =?utf-8?B?Mk1RWjN3OFFaRmF1MkFZLzZZazlUMFllR0ZQenFHVEpTQldZMmpFa2JmYXh0?=
 =?utf-8?B?THhrM0trRVBzb2N4Z0ZSMEdpTTUzNzRpbGlqMmVUNm1hUHhIQUt5d0pYeVN1?=
 =?utf-8?B?YVluYWU1RXEvVVhBeThheE9BNTBkT3dHOFVFUVpWUnp2MFRKbmZ2YlZEdERt?=
 =?utf-8?B?cUZjRkVTMTNQZjBjV21SOVZnWUVjMUdabktvRGtYQVE4MVNsdTNZdkVhMGJv?=
 =?utf-8?B?WDdkcGZ6bGhteWRxaWgyd0lrMWt4am5WaFFIcDdIZXhyRXRyY3FGVTd1ZWQv?=
 =?utf-8?B?aG91V3VsQUZGWGFhOFExaWtYN1lIMFJPQzZxNVpWK2FXdVFvRHJIMm5mbmJM?=
 =?utf-8?B?Vm1TN0s4eVFRMnEvdzNCOWJhMFB0SU10T0JlVWxoZXFSeFJRb0lsdFhuNkFG?=
 =?utf-8?B?T0wydU1hYWJUR3oxc0hmbHZ6WW84QUFORHdIbVNGN0YvOXVXNHpYVld6Skc1?=
 =?utf-8?B?SVByaEpSYzN3aVNENCt1OHN0cS80OHBpUEhVamYrdjN5TVovYmxjZTBma2dv?=
 =?utf-8?B?UFBjeGNwWHFuU28vY2U2c0NPOXdjb2hONjFZZGtIQWNUbW9UQkNVeWhnN280?=
 =?utf-8?B?OGs1bWdOVnpUVHJpWWc5QWQzZGxYZ1pQRUxZZG5tZkJiMTBiMm9SeUJFT1Zz?=
 =?utf-8?B?U2Z5VXhFL2FUUC84K2N6Qi9PQVc2Z1NYWXR5WEpLRGVUNTEwT1NpNW8wZHZx?=
 =?utf-8?B?dXZhR0VWZlBkZkRaK3NiMGgwVTVMVzdPOHhxUG9EdGZ6NE5IODQvQzBvS0hU?=
 =?utf-8?B?RW9qdnUwV1NiU1lpZC83eVNEWTE5NVFqQXFid2hWdVMxK3BMRUdwOHkweXNU?=
 =?utf-8?B?eWxCdlFyUVNkbk03N3c3QnR1dmhreUhicUd1K0NuNEoyYm1STVFzRVNvOXpL?=
 =?utf-8?B?dHlicjRUanhwaGV0ZmV3Z2xWTjR1elJ0QnBFSXh0MmFqQ3lHdTNqVjhpbjlB?=
 =?utf-8?B?MytBdEFyMUtlTFRZdWVqblNoMzZadTB1dnYvRVlSU2lwOEdhQTdHSHl0Y2hM?=
 =?utf-8?B?ZGVpOGdOSzhnZHlUdUVGWVp4OXZOdGhWcDhSZC9JSFdxN2pkbVhsTWhaMXRp?=
 =?utf-8?B?eXAwSTlqSkl2d2VFblB2NDFFd2pld3UvL01ObGMyNWFZdzF5ZTlSaHo2blRj?=
 =?utf-8?B?WWRRS1FRUk9iNHFQeGJqd2FlZHR3eGZYVFBhVHRVUlFsT2xocTZvVUJzbENW?=
 =?utf-8?B?cEpxcEk2NVBGbjlZeFpacENUaHlQbzJIUzBJN0tKMTNFSHV4VEpUZWNHMGxa?=
 =?utf-8?B?am9tYzIrUklSYlBONzV1eVFibnpQNUxZdCtTNkVsMGZRSktNRjhIUjdCQ1F2?=
 =?utf-8?Q?DoQvLRHTWZdj5x7nlQRtW5qu4oqymAWp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MA0P287MB2448.INDP287.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFdaRU9LdW9zaVNEVm9LU1lmbENvdVpaY3FocVN2KzZJNzk4Ky95THBIWWpo?=
 =?utf-8?B?VnRjRkY1S1dGQktncktweE9CNVdwRzhWU1BGazdheWhKeGgrK2piU2MyZ1dD?=
 =?utf-8?B?YWdtbGVFUEc1VFRnQTc1Ni9YcHpTaU4xL243Q3RiTVc3ejAzU3N5MmVzOTZi?=
 =?utf-8?B?OWVqWTY5RVhubmdPellnbDNtdXFZMitGa3FtVGJXbks5V0Ewc3BrekJ6ejky?=
 =?utf-8?B?bVdFQnVwM0tJRkVHVmFwMnZJY1hiWjhKS2UxTlFqSG9MaFlzWWlnUUZGRGQ0?=
 =?utf-8?B?TGxwV1pYRDFGdGlhMjRHaHFRcWhiWVgyZkNnZEJTeThSQjZEK2V1b3JvOXJ3?=
 =?utf-8?B?ODBxdEs0Tm0wcUtldnNHdysvK2pQNjNrUDZrKzBBUjVRQVVQZEZ2TmJpV3FF?=
 =?utf-8?B?UUJFWWRzRmJVaTZxMVhBQlJCbmZPNlhzWjdSMjc0RHJlR3BmNFBWRHh3Zitu?=
 =?utf-8?B?a0dDOFlPNlJDQUFqL1IyUnNjMUU4amJsTmt4clVFdUNFRU12ODdvZzd3RGx2?=
 =?utf-8?B?MFdRcXNoRDZuMGJKbjdkcFNVL1IvVUVramJuem1kaTJ6Y2RSODkrRG1EbkNm?=
 =?utf-8?B?T200dUd2N05mTm9mTkVuV0p6ajZCVEV5MDlYeWhkT1pWUmpLNHZrM2o1TkJQ?=
 =?utf-8?B?a0pubVlScklEdnpFbGlGT0F2ZytqTHo4TlVUcTMyWGFQbFFuVS9sWmQ3NG8w?=
 =?utf-8?B?UlpWUlVNdldVeG1NQit2NUJLNlRmYTBGNkNJNFd4cklWL1EyN0hKWWtsMEw5?=
 =?utf-8?B?Mmk1NmRLcWpvV1poQUQxbVcveDZhS3g5SVdoc1pOS1lHK2gxNXRGbjJ0MzB4?=
 =?utf-8?B?K0NMblNTMWpob0JGRGs5K2ozd2JiVWNyc0JTNldacHZHcVNkaTJia2RRbVVw?=
 =?utf-8?B?d3FHcFJJVit2aFFEOWhndGZhc2prVm9ad1MzL3lJV0NrM1RYVHBCK2VyNERo?=
 =?utf-8?B?aDd6Nm1INXRReHRtRnROZzZzd2Jzc0FsRUJjUVFVNUw5S0VvSVdGN3NNM2wz?=
 =?utf-8?B?Q0sxR3VYYXdETHNTRDd4czZQbkVWWmxaMWFNSGlWbFlXeW9pWDRRVVJaTFU4?=
 =?utf-8?B?Rm12VzFiM1dBRFRjcndwZlc1NGZYUys2RGNkMUlPTjh2dkwvd0RlNTA2RmtV?=
 =?utf-8?B?RWRyWEZ5UktSTGtkTWZrbmdZdlpVa2VKNnB2ZnFGOCttUDVBYlJtZ2l3OHF2?=
 =?utf-8?B?cGNEYnhOK09DMHJXc3VzamdneHBnYzJ1dWI4b0xpT083K0cwZ20zNVBIWVNt?=
 =?utf-8?B?Z0dadi9zRG5Ma0l0dWI4VVF2UDF6bWtidUNaMWVEMTZOa1Q1ZXhieFpDV1dR?=
 =?utf-8?B?M1h1WkFYQ280UStLR1JhK3liZC8yamNweFh0MGFOZ3VxM1JXb3cyUldEdDJx?=
 =?utf-8?B?QjBpZnUxZ3pxbVhmaGtOd3NLRTZLRDBNd0hEUGdVaUdRZkJKOE43U2VLd2x2?=
 =?utf-8?B?aDh0L2tyWU1uSnk5WVFCTERFVzRZdDFETnREMEFXWFhkQTA4RnEzcGp5Z3JP?=
 =?utf-8?B?NEtSYnlETmdWcTV1dmRSM2Y2RU9sN0JqNmJ5RXMwanZlTHBzOE52SkJKNXIy?=
 =?utf-8?B?Yk9UN3huclFsSVAwNEhFNVd5WmhpMmZuTXhlOThaenFzanZibXNOcHZ4VUVP?=
 =?utf-8?B?d0VZSjM5U2dyQ3JMdHdLbDdHZ2hGUXZTZ3R2SURvb1dIZWxVNlIvd1A1TDdS?=
 =?utf-8?B?NHBwYndJam9GTllXUmZFVnYvMWxJTFpKdGJVb2RBMXZhc084NkFOcTFxdGoy?=
 =?utf-8?B?dFQ2ZDJzWHVCMWVWdnYxNzQ5bU5VSUFCVVJHeFl4TUV5Q1M3Y21NeHJ6cUxr?=
 =?utf-8?B?R2hkdDRIVjBqaGhnSmNqMElsSUsxdDZ4UWxOeGhUdjFvbmdubG5YTnhhQURy?=
 =?utf-8?B?Y0tFSWVNalcyVXMvcjBTRUhTSVo3bzIveGEyVlBMU05rN1lBdUVDNnJIc2xS?=
 =?utf-8?B?UEtQWHB5WHR2RWRYV0lSdGluQ0I5SElJSVBQTEJrNERnRS9HMnI3SEYwM1Fw?=
 =?utf-8?B?cmZ3bnl6QVl3ZjJwU1lCWDNEanl6RThoeEtxUEZ0YlRrQXM0dEtOcllrVk8x?=
 =?utf-8?B?Y2swNFVsd2JkTVNUSnpyNHI3U3lPWUdsV253WW1aMExGcEJXZmY2aUx2VjBM?=
 =?utf-8?B?VlZJcmMySHNRZTR1UWVGSzRHN0x4WWhxY0tvRlZ0WkpNcDB4blVRTkpVc0FH?=
 =?utf-8?Q?98hERuUmFkRm7o0Z+YKV/+s=3D?=
X-OriginatorOrg: iwave-global.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa2371a-6901-44cc-0543-08de0b1b2682
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 12:13:57.2180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 507ae903-cc48-4d6e-bdb6-35278120a345
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0+Qg5Exi4UABH3OG15AVUH+AGIZ2yWB+PRshkyS1d1iZIfg4e/mA+AZwnUKD695xFkfOTOrTsn8AK15vVBTIsEaS6Xwe+ww6Lgry41SSg+SvuRLFHlcLvT9DwJj3HDV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1P287MB3920
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=iwave-global.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLubuHy4Q82Y57RoMdEE81ABdbe5F1S7gzD62Zdnr8M=;
 b=LdjQMA07AC4s5EKmOnCQo7Vs3YKVGuM6IGE6j/ms4JNw++pPgvJdkQdfOBJKo0Ufc0GleCwh5yinu9T3dGXW+IECeUlhkNBWvaXXDEwK44DWmWJckXO7dioiTien+3pApVHRJqKLUEArHMBfjFDCinnXROCpC0lqe1Z9GXVJbcJki74BBu8x4n+KbfEUGj3fwgJq7VVO12lWw7ayHu8/byeCDAylgw/K0ZI3LzBpM5XQl2b4i9EUBX/zCOhiHz7Ht+446R7Xoe785fpEcbuXFA/NGzWCEALXIaJJKVO+cwlRf2hyaEI91MLHcfwOAzjFEIl6nLMUdRX6mTZzDDjp7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=iwave-global.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=iwave-global.com header.i=@iwave-global.com
 header.a=rsa-sha256 header.s=selector1 header.b=LdjQMA07
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iwave-global.com;
Subject: [Buildroot] Implementation Procedure for i.MX93 Custom Board
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
Content-Type: multipart/mixed; boundary="===============8774855284815045384=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8774855284815045384==
Content-Type: multipart/alternative;
 boundary="------------dG29ODRa4SLzkh6njW9u4nyo"
Content-Language: en-US

--------------dG29ODRa4SLzkh6njW9u4nyo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hello,

I have implemented support for our i.MX93 custom board by referring to 
the i.MX93 EVK configuration.

I used the freescale_imx93evk_defconfig, and the board is successfully 
booting into U-Boot. I have validated that the following interfaces are 
working in the kernel: eMMC, SD, USB, and Ethernet.

However, the following interfaces are not working in the kernel: Wi-Fi, 
Bluetooth, Watchdog, SPI, CAN, Audio, Camera, and Display.

U-Boot and kernel have already been validated using the Yocto root 
filesystem, so the U-Boot and kernel configurations are confirmed to be 
proper.

Kindly guide me on how to add the required packages in Buildroot for 
validating the above interfaces (Wi-Fi, BT, Wdog, SPI, CAN, Audio, 
Camera, and Display) in the Buildroot user area.

Thanks & Regards,

Esakkiammal M

------------------------------------------------------------------------


--------------dG29ODRa4SLzkh6njW9u4nyo
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <span data-teams="true"><br>
      Hello,<br>
      <br>
      I have implemented support for our i.MX93 custom board by
      referring to the i.MX93 EVK configuration.<br>
      <br>
      I used the freescale_imx93evk_defconfig, and the board is
      successfully booting into U-Boot. I have validated that the
      following interfaces are working in the kernel: eMMC, SD, USB, and
      Ethernet.<br>
      <br>
      However, the following interfaces are not working in the kernel:
      Wi-Fi, Bluetooth, Watchdog, SPI, CAN, Audio, Camera, and Display.<br>
      <br>
      U-Boot and kernel have already been validated using the Yocto root
      filesystem, so the U-Boot and kernel configurations are confirmed
      to be proper.<br>
      <br>
      Kindly guide me on how to add the required packages in Buildroot
      for validating the above interfaces (Wi-Fi, BT, Wdog, SPI, CAN,
      Audio, Camera, and Display) in the Buildroot user area.<br>
      <br>
      Thanks &amp; Regards,<br>
    </span>
    <p><span data-teams="true">Esakkiammal M</span></p>
    <p><span data-teams="true"></span></p>
    <hr width="100%" size="2">
    <p><span data-teams="true"><br>
      </span></p>
  </body>
</html>

--------------dG29ODRa4SLzkh6njW9u4nyo--

--===============8774855284815045384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8774855284815045384==--
