Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE6CD2CE1C
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 06:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADFF58416D;
	Fri,  5 Dec 2025 06:25:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V3_O16etTWeQ; Fri,  5 Dec 2025 06:25:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 707AA841FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764915931;
	bh=N/zSvpdq9IOnpuiUfuvUJuE335g9evYRoXSzcGe/gOg=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=k0+heHvhttKsLRzHS1yDO+gKkWY0Kl6+DkCCcLEb9skq7bcAdUZMBFxxL3iZlthUE
	 VHhylTODwGh/bww4peHoH3o7L7j5ER+FrvT300VTdTamCjfxOXTb0zAkhEGbt+Ldkv
	 ZoSG7QWkYvo66y0Ug7D928m3kbEqo+/oin1Qpy0TvVkwfk68/7hnjve9Gy1G4v/esZ
	 BN0xFN4dGiJ5R//TjDT08SmOmGU9fU274jTpvzFjnxl3XHNLTENAXwwq3PU8ivV8zB
	 95nmSYVXvyrLxeyka+6gEhCxakseY51h5tEJ//fjXidRkn8jubUw1+xeaey0DUfWze
	 Z7D93Qu5NVeQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 707AA841FA;
	Fri,  5 Dec 2025 06:25:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 45FAF199
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 06:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 429D0608A2
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 06:25:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yHCs6qz6YsVx for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 06:25:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c409::2;
 helo=ma0pr01cu012.outbound.protection.outlook.com;
 envelope-from=esakkiammal.murugan@iwave-global.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EEF51606FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEF51606FA
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c409::2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EEF51606FA
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 06:25:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lp8CkjyI7In0ynuKaJpMCgKtXUDWtTPk3LmpgtrqCz0EmSXFaPUeAzx+Vj+mMJ8OogbjLyEGIkOzJBemIdT5U3jZFzknmdVNW4xv9jEwR3UEMkFbPp/MloetFmpi9F0aanbAf40orMh+c80WNJp8FZQ4rGk6SHDeRxHh1RLGvpSxRYyB7KKsnGh5toANJQIZUvpEpuWnb6q96LroF2OV+KsrC1ikMr3L/8uo4zDX4aCqvGtXE9YNGAkesEQ6MnxQ7mGr2GVMcSzDbJt6cZpjYsCS09HXkwp0OfXXXwNCvHuMAx87tbDv1y9u4Vqn/XAMH9JmSc4aq0qnRNldQNkKNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rby4wF0aY3Pyncp1eeTaww241YTcSzWFlV7OXNUt1Xk=;
 b=MImWzfNIErRcSbse2DIVVEdeYBagEkIV44S8SBDG7j+IVbSUm2b++P/WoK08I3AkrjEoSUysL3YvC9vhr1FAvmSNUtk/Bw4dQkV3YBKIjeiliNV2kRNvfiyOm/oH+Azqa+uaD+pfu5SNevoBBcE3LlQOyqkEi7s5d1HhUT/8t9u4ByvYeqkQWb79CluPtyu5kbTrkQWd3VrfNFe15Nf/l7wMFW0f1zWQC1q6Xkmt9rFtHuqaLUnHDEhSgCWCjLjxQcjfGmj+WoahYqX9O372pDAv72u83Wa7ttk2PHA68xvwiI27fVJyY7xIWT2VuUWqUUNVw3pCmBr2SwFVteiIyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iwave-global.com; dmarc=pass action=none
 header.from=iwave-global.com; dkim=pass header.d=iwave-global.com; arc=none
Received: from PN0P287MB2434.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1bf::6)
 by PNYP287MB4771.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2ed::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 06:25:22 +0000
Received: from PN0P287MB2434.INDP287.PROD.OUTLOOK.COM
 ([fe80::2ed5:e04b:d79c:817a]) by PN0P287MB2434.INDP287.PROD.OUTLOOK.COM
 ([fe80::2ed5:e04b:d79c:817a%3]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 06:25:22 +0000
Message-ID: <d821e839-2251-42e9-8adf-71e68fe0512b@iwave-global.com>
Date: Fri, 5 Dec 2025 11:55:21 +0530
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <23d1f4ad-241a-4fe1-9db0-08bffa4775b6@iwave-global.com>
 <6ae83dec-c764-4916-8e37-c3d0e9e02a46@iwave-global.com>
Content-Language: en-US
In-Reply-To: <6ae83dec-c764-4916-8e37-c3d0e9e02a46@iwave-global.com>
X-ClientProxiedBy: MA5P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::10) To PN0P287MB2434.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1bf::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2434:EE_|PNYP287MB4771:EE_
X-MS-Office365-Filtering-Correlation-Id: c5d5ca3d-8f2d-4e2f-ef30-08de33c711a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnVBZ2FlSTJQNm50ZmU3cUN5b1daZTY4cHFWQXFTUTJCZXN1SllZYWV1REtt?=
 =?utf-8?B?OHVTNnRPRHpuMDZGNWJiQzNKSlcvZkhLUXpGSyt5K25STDAzYjVESTRTeFR3?=
 =?utf-8?B?Rm8yR3I4Sk9tYnJsbDlURnNQS1granNhM1hWaXdhbktLa1hFdW1mYWk4ekt4?=
 =?utf-8?B?WWNEMFlmbzM5V0YxbjBJQ20rTjVSNDVUeXl4Tk1HOFJUMWtoczBMQ2w1alJo?=
 =?utf-8?B?dHJHT05kbERmZGdFS0VlR2VOYVZ1VzdBMFd0T3lOMWNDM01lNUZKaXp6Qjcw?=
 =?utf-8?B?MHRacWdxK1Z1dStMZE9nZXV6QVA5aGxKNEJRK0JXWEdNa2xWZVd3QUNhWFdv?=
 =?utf-8?B?dS96UkhQTE94UUlvUm5GTFBjTndOdS8vQW8wWUFIWVhseVNJZWh2c3I2NFhC?=
 =?utf-8?B?d0gyVmFpbDFxd2NMOUJYdm1SdGxuNVB3Q2h5VTF4ZG1PUEJHNGxxdFhSQVZQ?=
 =?utf-8?B?QldScFBQZW82TUZkV1V6R21iRGZCMlpuZm1DWW5LQ2dxakJvWlA5MHNlWHY0?=
 =?utf-8?B?UFpyU1lGdnNNZVF4VTY2R241a0dHSGRHWjd6cGVUZk9oSTFPbkx6ZTlWYTJq?=
 =?utf-8?B?R0JMV1dKalhyUThmTkRESTlGSENxS0tLcVdkTk9ucS9sWHlNcHVkVStxK3pq?=
 =?utf-8?B?MzNlMjJUSFZoWGc2MkN6Nmd1OEtYK0pCcUI1VkJLcURMbU0rNlVHR0F2N2dh?=
 =?utf-8?B?TUJEdUxsQzUzS3BsNW1zVE9LZEZCT0hSYWpGQlYvSTBweGx5Ukd0M2UxRlNa?=
 =?utf-8?B?YmRFSEV1Rjd6NFcvSlczaHpsazhONDhmWi9DeTIrRjYva3paWlZjZ1RzNTcv?=
 =?utf-8?B?NS9iMGlCWmpaZlpUL1VkbzVpeTYrNWVGbjI0Zjd4L2pUblpqRGc1anBVSzlz?=
 =?utf-8?B?NjM4TDNPdHlwMHQzVDMvV0luMVkrSStBbktneWxDbWVmUm5rYUtTZmtpNVg2?=
 =?utf-8?B?MHVmZEFOUUNoT0JiWkU5QmkxdElaSDlLVUR0NnhIWXExKzNhRWd4M0tvRjRX?=
 =?utf-8?B?K3M4U0dXbXJycVJTR2lqUTBnUDBBZDJGc0dkZEV6Y21ZbnJlSnUvSVkyS0R5?=
 =?utf-8?B?d0tQaGRNUjRlYzhYNG1LZXVlYWRsVGFUU0xsaG5wOU15TlcyV3FndGN1ZXR6?=
 =?utf-8?B?UWRPdFAxclY5eG1HeUVKOURXenU2UUxYM2JZRmF5VWo3VFp3V3d6TFM1TnU3?=
 =?utf-8?B?cVpiUmp5NENMQkpkL3VQMkxieUlWN2tLM05Gd3NkaHF6dzRob0psN2lLVkcx?=
 =?utf-8?B?LzBNM2l0OHVVN3JBK29IYkMrQ3AzVmFad2FOc0VuRHhHL3RhSFZ1bks3ZnZk?=
 =?utf-8?B?RGpqb0xPaE9CWDhQbTdsOCtrRFFzcnpjWjY4TjMrK1g3cHE4ZkhXNTVKUDR1?=
 =?utf-8?B?cTU1a2VuOWZaaFBFVWpoaFoxc2VSZU04NVdsZDZKNlZtOGZOWk5zQlZUL1NQ?=
 =?utf-8?B?RXFHbVBHdG9tT2FKaTRuL1pPOXd4UlB6LzVmcHVYbXZSOWhYYmFUbStBb3Nu?=
 =?utf-8?B?U3JjNFJBWlR0akt0WTFWZWRQV3RqdmIya2FOeHF3STFCWFVLZE1UU0k4N1U4?=
 =?utf-8?B?SU10Z2FBMlNtS3NuTDNOR0tZNW9RamRRdDBSNU5Ma1BoYWtIb1pSZEd3MXRo?=
 =?utf-8?B?NEJCZVcrSUJlTE1PSFIzUnF4UkRRUEU1WjR2ZFhhakRMV2tlNkQ4bCtITHd6?=
 =?utf-8?B?cW8wcUNyWGNDMmFteWVtVGJYaWN1dmpLL1VJdUdBWEcxcllneGdKVGw0LzBx?=
 =?utf-8?B?SGJ0SkE0elR1VHhlY1FXUEs4MUlMbzJJbXZyNCtlcEwyeUJOR014b2IvRmh1?=
 =?utf-8?B?Q2FGcGxzYzdPczFrcmM0MkRsYnhDMHdUZnNPVjYwQjluakVhMmZ1UFRUNDlo?=
 =?utf-8?B?YXg5Zng1T1VQVDcvQzFOamgxOW9jdVhhRkt6ZDRoOGpScFRoS2hSTzlWVmpw?=
 =?utf-8?Q?zLgqdFe97C2sdAYITkqY11jvk2UagdTr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PN0P287MB2434.INDP287.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bExlMmNqcnNxL09ObVM2RWtoNFN4Q0wvdnFSVG1vMHN5OGhwSHBld2dYVk1E?=
 =?utf-8?B?K1hqL0YrM211WFdXMXBjbjBiYkNVYWc5V1NVaVYwaFJtTkUzYU5PTmNDZC9l?=
 =?utf-8?B?b2w1Q2hjbUZodkxDZ3dwajdBQ2tMdDBHbzJuRTMwODhmZFc5Zko0R3ZyM2Nu?=
 =?utf-8?B?RlFwVkE3aDVGbzY1YzNsdUhURVZQQW1KOHkyWCtlZ1Q0VGdHaU1HMWJEODA5?=
 =?utf-8?B?eEtRTGw3emoyUGdaejlrc2hDQW9uay93YzZHYW9FeU13VXVPWWhZYTNOZTF0?=
 =?utf-8?B?OFl6SXBPc3RtWWRiOUNCaG5Sa2ljeE5ENUZkNnFBSnVLc1hHY2xkMXJtOEZM?=
 =?utf-8?B?cjNva2JSbkZieG9hR1YzRVNGWmhOMHJJUzllR2FGM0xkZkQ0VVFBbzFBeFJG?=
 =?utf-8?B?LzVpazE4NEM0Rk1PWlJreDNYM2JhOWtpK3dYY1NHY1RLWlAzN3kxVDVkbUtk?=
 =?utf-8?B?TVBLSmp6SDkvWHBHVmZXQ2hSZ2MzdVVhVkd3Nk8xNXAwd1RKa3FuNGwrZ25F?=
 =?utf-8?B?SEY5a1FObjZzMlVFSE9hZnpQeVRwdk5WTDdJTUs3T1A3VlNpcXlJUTM5R09K?=
 =?utf-8?B?YUcreG9mWGhuSUlWZytETkhvcDI4ZmtLS0szNXpRVW9PdE5zQ0lxVzNJaXly?=
 =?utf-8?B?L2drNm83Y0pwT1N0Vnk3V1FZSFBNN2lSd25IUGlEQUd4cjA0N3dtVDRWbmcy?=
 =?utf-8?B?Qnh0KzE4OHh3dGlQRGFjd3dkZUpIbVcxbVkzMGZwQlRtdnh5a0ZMTHVCdjNR?=
 =?utf-8?B?ZXlFZ3BhMkVGeU9zZVRaYURRZHNnTjl2K0g3UVlOSnh2THpjQ09KOFZzZXJ2?=
 =?utf-8?B?Mng2RVYwWVJ5QnkveG5odFZFbG5iSktsNTJ4VHZQWmQ3YUFtNUE0M1UzaG8w?=
 =?utf-8?B?OGFpTnNNbnVMWHB1ZjI1TmJ0aDlGT1l1OS85ak5LUlBTRFA4eUlDTXZkTDdG?=
 =?utf-8?B?eVhoTDRYRzBQUTd0UnU3UGZmOHlOL25ZU2IzZzlDSVVITkM0Z3FLK2Zha05s?=
 =?utf-8?B?NVdKNTl4aWhsekVPemV3UkxsaVVsdTArV2x3b3VNNllidktqTXZzcG5BRlkv?=
 =?utf-8?B?WEJKU1d0NExqMEN1Ui9uNDY1SjVJOExOSE10SmZGTktlTjBhS2pNUTgwNXJ1?=
 =?utf-8?B?Qk9odnNhS0dod3JrVURMRDFyWkVKcWl2TVNtZjJKNHQ2MlNjcXhid1BDeTZY?=
 =?utf-8?B?WWYxU2pPSDVLamN2ekdxbXR1RjhkaHpESGJYL0lYUTM1djd1OXZzdHlrQ29y?=
 =?utf-8?B?R2NJTXQxdjc5czNSekZCeGU3SXkxVlN4azRGL2kwOC9xVFJHTG9oTVJDak5S?=
 =?utf-8?B?NlZBbW9DNTdJOG1ta0M0NnRqeVpOZkZRWmFpYTVOcFgzUEZrWDVuclU4YmZ0?=
 =?utf-8?B?djhoeGZKM1NnRzJXV3ZUengyREJxVGcrM2tEYVBWVWcrSnJ3azBtYjdicGMz?=
 =?utf-8?B?eEpaMllac2RCaGFQYTcva2x2Nkt4Rk5xZ0pwZ2ZkcnlOSDRscmhMTTFsNlpG?=
 =?utf-8?B?cmE4bmM0U0V6SUg4U0R2NEtKS3JIem5HTGVUcGtQMDNUL2lWS1FGelNGOHBY?=
 =?utf-8?B?RGxyN09oUmVBSXlpRHYzRFU3VDkxSnJ1RU85RTV0Qm0rYTJZM0hqZUd0L1A5?=
 =?utf-8?B?U1lWYm5FS2xyL0VrUFJ6eC9EVmozUmNaYUZVZGp1VC92bkxIN0xPTC9palha?=
 =?utf-8?B?SjBXQUllRHJkSTdEWFI3a2t4UGlwdmdES0RKemtTNXRmeGhldi9hc1dnc2hv?=
 =?utf-8?B?Rld4MThQZjg1Z0FwRnlac1oxQTZYTVdrdGFiOE5QYmdSTy9KbXVhN0M3aDF5?=
 =?utf-8?B?TXJ2cDJnclVXbEhONVl1ZXBKbG0xWEtRaFpxTXI3Sm9HQXJaZnZLRjlLZGdJ?=
 =?utf-8?B?SFdKR2xycDFiaUk0OGJTY3J5cmRhdk5ic1dpdWpUVTNGaWhTMVYwQ2F6dXda?=
 =?utf-8?B?dWFjR2VPMjRnODFRaThkU1BXaG9Zb1p5S1NEVTRJaXFMNG8xNlZka1FCOXd1?=
 =?utf-8?B?MTVnOTJhZ0Q3NHhkMm9vZHVTUWVGdGlabzQyQVVYdUNnTGhBc1gySjc1UUEz?=
 =?utf-8?B?RW1HYzlwc2t4NmRXUlh6NnNoWElrbGpFamtra25pVjI5UkhmWHBaMkg0dk91?=
 =?utf-8?B?V2hEam5uWTc4TXZCWk14MGxleGhNMjlPcE1BaDdCY2wxM2RoZjZoNCtzZk1S?=
 =?utf-8?Q?TpM7LUxyHrXIYFqzq0Wy6XA=3D?=
X-OriginatorOrg: iwave-global.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d5ca3d-8f2d-4e2f-ef30-08de33c711a0
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2434.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 06:25:22.1650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 507ae903-cc48-4d6e-bdb6-35278120a345
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MOOw8NmHI4FrOGd2Pnnst8H6aGjTC2ThYogxDMQEkzJ1FY13k63cypuodI/Rf37490aKtukyAMoHgI57BgA71CcHXUlvv5vnwITaoIA5c9DZI6Eaf6knU6NG2XuQGJPX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB4771
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=iwave-global.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rby4wF0aY3Pyncp1eeTaww241YTcSzWFlV7OXNUt1Xk=;
 b=Y4idMdX/96mw6e6/DG5roqy8zu4neqYFnLz9ElSHU0+KUaVT9UR9W9ZrDYzhEzfKMK3RxUbkH564ygKTLKJXeBcu3y/gIE9sbHKGogLBTAaeBGZBTmpKcjXE64mmcUuqv8s8AyUnjX1sXS4TkAl1YUky2bqGaGBORxbKvr5RiZX485/Ml/tWsuoELOlhZ7bqslamVanEctwv/LkfkcgIEmuYhuC5XgMiXA9NjPw9z1bemCShstmyFaYEfHfZNTKIqSffho9WAYABexFbdygdg/x+5uLVa4n7nNCkCSj/2eoQbWmPTjYyu+bWVzFNQtlMUZqq1iDyBNcXFwG42V+Iyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=iwave-global.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=iwave-global.com header.i=@iwave-global.com
 header.a=rsa-sha256 header.s=selector1 header.b=Y4idMdX/
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
Content-Type: multipart/mixed; boundary="===============8150252950135810849=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8150252950135810849==
Content-Type: multipart/alternative;
 boundary="------------IdenRHzjdhArOnnzpftuIrSA"
Content-Language: en-US

--------------IdenRHzjdhArOnnzpftuIrSA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello team,

Kindly tell the suggestion to implement the Weston in build root.
Only frame buffer is working penguin logo is coming.


Thanks & Regards,

Esakkiammal M


------------------------------------------------------------------------


On 04/12/25 09:25, Esakkiammal M wrote:
>
> Hello,
>
> I have implemented support for our i.MX93 custom board by referring to 
> the i.MX93 EVK configuration.
>
> I used the freescale_imx93evk_defconfig, and the board is successfully 
> booting into U-Boot. I have validated that the following interfaces 
> are working in the kernel: eMMC, SD, USB, Ethernet, etc.
>
> However, the following interfaces are not working in the kernel: Wi-Fi 
> AP mode 5GHz, Bluetooth sink and source, Camera and Display GUI.
>
> Kindly guide me on how to add the required packages in Buildroot for 
> validating the above interfaces in the Buildroot user area.
>
> Thanks & Regards,
>
> Esakkiammal M
>
>
> ------------------------------------------------------------------------
>
>
> On 14/10/25 17:43, Esakkiammal M wrote:
>>
>> Hello,
>>
>> I have implemented support for our i.MX93 custom board by referring 
>> to the i.MX93 EVK configuration.
>>
>> I used the freescale_imx93evk_defconfig, and the board is 
>> successfully booting into U-Boot. I have validated that the following 
>> interfaces are working in the kernel: eMMC, SD, USB, and Ethernet.
>>
>> However, the following interfaces are not working in the kernel: 
>> Wi-Fi, Bluetooth, Watchdog, SPI, CAN, Audio, Camera, and Display.
>>
>> U-Boot and kernel have already been validated using the Yocto root 
>> filesystem, so the U-Boot and kernel configurations are confirmed to 
>> be proper.
>>
>> Kindly guide me on how to add the required packages in Buildroot for 
>> validating the above interfaces (Wi-Fi, BT, Wdog, SPI, CAN, Audio, 
>> Camera, and Display) in the Buildroot user area.
>>
>> Thanks & Regards,
>>
>> Esakkiammal M
>>
>> ------------------------------------------------------------------------
>>
>>
--------------IdenRHzjdhArOnnzpftuIrSA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hello team,</p>
    <p>Kindly tell the suggestion to implement the Weston in build root.<br>
      Only frame buffer is working penguin logo is coming.</p>
    <p>&nbsp;<span data-teams="true"><br>
        Thanks &amp; Regards,<br>
      </span> </p>
    <p><span data-teams="true">Esakkiammal M</span></p>
    <p><br>
    </p>
    <hr width="100%" size="2">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 04/12/25 09:25, Esakkiammal M wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:6ae83dec-c764-4916-8e37-c3d0e9e02a46@iwave-global.com">
      
      <p><span data-teams="true">Hello,<br>
          <br>
          I have implemented support for our i.MX93 custom board by
          referring to the i.MX93 EVK configuration.<br>
          <br>
          I used the freescale_imx93evk_defconfig, and the board is
          successfully booting into U-Boot. I have validated that the
          following interfaces are working in the kernel: eMMC, SD, USB,
          Ethernet, etc.<br>
          <br>
          However, the following interfaces are not working in the
          kernel: Wi-Fi AP mode 5GHz, Bluetooth sink and source, Camera
          and Display GUI.<br>
          <br>
          Kindly guide me on how to add the required packages in
          Buildroot for validating the above interfaces in the Buildroot
          user area.<br>
          <br>
          Thanks &amp; Regards,<br>
        </span> </p>
      <p><span data-teams="true">Esakkiammal M</span></p>
      <p><br>
      </p>
      <hr width="100%" size="2">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 14/10/25 17:43, Esakkiammal M
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:23d1f4ad-241a-4fe1-9db0-08bffa4775b6@iwave-global.com">
        <span data-teams="true"><br>
          Hello,<br>
          <br>
          I have implemented support for our i.MX93 custom board by
          referring to the i.MX93 EVK configuration.<br>
          <br>
          I used the freescale_imx93evk_defconfig, and the board is
          successfully booting into U-Boot. I have validated that the
          following interfaces are working in the kernel: eMMC, SD, USB,
          and Ethernet.<br>
          <br>
          However, the following interfaces are not working in the
          kernel: Wi-Fi, Bluetooth, Watchdog, SPI, CAN, Audio, Camera,
          and Display.<br>
          <br>
          U-Boot and kernel have already been validated using the Yocto
          root filesystem, so the U-Boot and kernel configurations are
          confirmed to be proper.<br>
          <br>
          Kindly guide me on how to add the required packages in
          Buildroot for validating the above interfaces (Wi-Fi, BT,
          Wdog, SPI, CAN, Audio, Camera, and Display) in the Buildroot
          user area.<br>
          <br>
          Thanks &amp; Regards,<br>
        </span>
        <p><span data-teams="true">Esakkiammal M</span></p>
        <p><span data-teams="true"></span></p>
        <hr width="100%" size="2">
        <p><span data-teams="true"><br>
          </span></p>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------IdenRHzjdhArOnnzpftuIrSA--

--===============8150252950135810849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8150252950135810849==--
