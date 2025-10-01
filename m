Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8669CAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 13:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5392F82051;
	Wed,  1 Oct 2025 13:55:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9bLH0GkeBW11; Wed,  1 Oct 2025 13:55:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5618882151
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5618882151;
	Wed,  1 Oct 2025 13:55:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 77F8A93C
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 13:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DCD082151
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 13:55:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E0k9foYPweJi for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 13:55:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:d111::3;
 helo=ch4pr04cu002.outbound.protection.outlook.com;
 envelope-from=ohitsdylan@outlook.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F5B082051
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F5B082051
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazolkn190130003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d111::3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F5B082051
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 13:55:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uv4jbcMfIQuVaxdnFqW29pW8x+BmKfB3A6JX0E6qkXZqy6hZrN5g4EF+boepvjRSc2w0M0NzI+9jwEkA5vLB83Hj3xOoELzH+saEB7Ng7jTicx5+8S69insPjJTfrXlQy5Fo/0Wr+ZxnOTMsH1YSDqNyhEqzlaQQr4G5qkS51Du/iQYnQyGbSZIC9SbDgTfxitQWZgocLeylMl8bbqW2uTxB+um5yezcTmajOr+HKCOKg4vi10nVjL1rUlN6XY2C/t2ktmSCz3yyVkwm4okwuFN4h+NUAOkTbwuaddHHQdu0wS1MwXEVMFZlo3UWOGImYL7VC2/ZrSN6r/O9z7rHiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=261IPOgWzkoi7eWq8gmOW2e6dAnz0Ziw4OWW0x4Q7bo=;
 b=VHHBTdZ+Ks7VtPYZx7lJ4be7MNdGo6vS+rXXMtwLVNPxGTYsjQ1uW0T2Q16rtVkUg7gDsQF4SHgaw8U+VhRh5s3/6CPg2z/YKspay3Q0VbEZsaMuAzjCGuM7FXgwzDnljs8zLOl0K4k/ncJCSfMOiXNT2zjTNNya8OKwebOB5PNg4MSnmpLuXGu3Y4eJdh4zgaEtuM44ccYmZfqOO9g1noOlWsOxpbf5tQWXAf5TflU+vGXqosowFZlpimuQ1w3+2sSzA9hmYsI+2v1nrTp5TDeJBRLEPm8fjMWlhOTeEb8oMoAcniUhg5uJlORsPzUBPubymAQibo1WEACM56dKJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from PH3PPFC54E34861.namprd19.prod.outlook.com
 (2603:10b6:518:1::c4d) by LV5PR19MB9131.namprd19.prod.outlook.com
 (2603:10b6:408:2fc::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 13:55:17 +0000
Received: from PH3PPFC54E34861.namprd19.prod.outlook.com
 ([fe80::81d8:307c:9747:d61c]) by PH3PPFC54E34861.namprd19.prod.outlook.com
 ([fe80::81d8:307c:9747:d61c%7]) with mapi id 15.20.9137.018; Wed, 1 Oct 2025
 13:55:16 +0000
Content-Type: multipart/mixed; boundary="------------kh0zLu1ZBxg0yXQGK2WCTDy2"
Message-ID: <PH3PPFC54E3486195A5EB083A4D386D83E1CBE6A@PH3PPFC54E34861.namprd19.prod.outlook.com>
Date: Wed, 1 Oct 2025 09:55:14 -0400
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Content-Language: en-US
From: Dylan <ohitsdylan@outlook.com>
X-ClientProxiedBy: FR4P281CA0324.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::14) To PH3PPFC54E34861.namprd19.prod.outlook.com
 (2603:10b6:518:1::c4d)
X-Microsoft-Original-Message-ID: <cac24160-f3b8-47a7-b95f-105dba8c8626@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFC54E34861:EE_|LV5PR19MB9131:EE_
X-MS-Office365-Filtering-Correlation-Id: b57ad9a0-fcb5-4865-3773-08de00f2269b
X-MS-Exchange-SLBlob-MailProps: znQPCv1HvwUykhYCLh9DY9coCVULpTnXEYU0OkCzeQy9260MAalBY5K7rVX5SS2aSjdE0YbcW7dIJobdA2+9jVKWUJW4FV0BW39wszn9tESmKxo5F7OtUvzXpBEOBSDcpMehzQSSdphrWI2Wz1nmYjKYqVDU5gdAbjHobWyaAsAX9o2VfBUl/EMmypkXV17j1dNpbGSunHiNBM9AfhZt6dtjsyH7Uf1ip4VWDmCPU20AU3vljr2ksKmzoOlEZK5tGbPH/frbtsEh4zyChrz0T4lsdRZ079OqvIBCEanqevYXSiTejfgM/4KvHV0l2Qh6UNgCjWjVZopQEa1mY9eBM2nOY1zNmk4KErW4Bti/6A3qRZtJ9KRawR1l0I3NICGn1K0Y/ErO40WYiKZxND7T+03stx0wz6Wg58I0PsdXPh9hxmRfk0qFWudPl2I78Zueu9Kt57JdJY+zLYfKo32B6sj6PUs2U7tRJqDa60zfqshcNGnSmaONTuK1oYgtBn9Wb2s5EAYkpQCsbFEr0oEJseGzonLzu4kusRJ3gjEJlF03TdFUUcakHCChXSuTLjXquvwGV3A8YpB0mq3JXDKp+0ZB/nbT6TbjZ5w+UKQy0dclsBKCctXt4Ai3w5i6kyg2vaAuPqrC/02h1MxLU9USqdwmDk9BlosaMkL72fxY2+tEhI26+pTJA5Mj1N9YBVEszRsJ8z+Y9IEZkA8yAedUCHB89wSwYTYq6FI9o8YZ77KAL/Ij1MSfQo/RpQGy4C1Pa5/ASCoWT1s=
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|8060799015|41001999006|19110799012|5072599009|23021999003|15080799012|6092099016|12121999013|461199028|40105399003|39105399003|51005399003|3412199025|440099028|4302099013|13041999003|1602099012|20055399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b211bTJaUnUra1RNYy9jQXFOc0ZvSElFclBCQm5vZm5IVG9JNFYyeXJwb2h3?=
 =?utf-8?B?R0lBSmYyNVFNWTRVZXVxMkxYTnhHTEJNSkJ4TEhmSXpjNThSNG4yVFJadE1l?=
 =?utf-8?B?dy9JOWhsSzlQa1dMZENBZ2V4NUhFaU93VGhVR1BURlVwK3QvajFKaStweVl5?=
 =?utf-8?B?QlFoV3pnK3R4V3dhaXJ3MWhkYys4NmdBYXdpbzVmN2VGWVo1K3FLZk15M1Bo?=
 =?utf-8?B?QlBIR2Q0dDNxbG1rQ2RraEFKUWh1cFovemJqOE1nSkxUNkFrRFplZFJSd09U?=
 =?utf-8?B?SHRQelhGVHpqc0t2d3F4NkJOeCt3SmsrVUMxMW5HeGt5RkI2UFhQb3RrbDAx?=
 =?utf-8?B?OTdCWnk5dGFoMDQ5UEVNNkQzNFJGMC9mUjYwSnVXenZFUHdlSGFya2hTY25r?=
 =?utf-8?B?VWVRMlV4N1YwZE9Vcm0rcElxQWhZaXpMeDJlTTgwSHBZVkRMWWFGeDcxeWlF?=
 =?utf-8?B?SFg0NHhkai9nc0JrTnViSHJyUC9ickhsSmdGNThDelkwYnJHSFNJSDZQR0ZU?=
 =?utf-8?B?ZituVmNoa2N1dC94N09GTjRnbmtnbVdOVWkxTjVLK3luVmlXbEhPWWR6TlNQ?=
 =?utf-8?B?bTYzSG12UlZSdmZXK3JQSVRDMjZ0US9MSUp3VlJsS2hNb2xnRkVJWHJFWlpT?=
 =?utf-8?B?VnRPVVBmWmxnRTZHMG9zK1BpOVRVek05V2hmcm1sanBNUnk2am9yeHRPd2VW?=
 =?utf-8?B?djRtTEZzTmp0ZUpLM3lkTTdlNDFuVFVMRWljY2M4ckhqSkZIMU56bzl3ZVIz?=
 =?utf-8?B?R3BPclF4V29ZdlBrVE41VTZPTGtuL3AxYmtyTXp5ZmpxZThzbmp0T2ZFRk96?=
 =?utf-8?B?M2JsRld0QkVJbjd2MWtWcmRsV0lGWHd4OWg3YURYZHRzWHkySmxHZFRLKzhB?=
 =?utf-8?B?T0gzR3NYM3E4NzNnU3pRcGFORnprRE1WNkVQbk1wbWg5Vnh0OWFCOXVoRnlZ?=
 =?utf-8?B?N3JXeHVlT3dQb2JjUVNZcE04K0pJVDFMNi9xYTZvdGVNYUhwZXRWemxDZWYy?=
 =?utf-8?B?ZjFSbmtyM3dQbUhkcTF5T0l1WXdrTmllUVZXc1d1UkJTVHZpZXJlQ1BDTllz?=
 =?utf-8?B?RG5zOVQ5NFcwTlpFQkprUno2ZklGS1dNL1F5YVo4UTROQVhaVUF5R2VCSmtm?=
 =?utf-8?B?OE1NUUtDeTI3Y1JlYmhtM0ZyYklYQXRrMkRlRjdjbjZTaUg4YWhYSkhtVDg2?=
 =?utf-8?B?KysxU3RHZ0xyUHB6R3pmL0J4OVM0clcrUWdod2dYeVEyZDBwREFUbndaT0Uv?=
 =?utf-8?B?SlFqSzlCZlVSZFR3S0oyWERaYTdLY0duVXY0QTNueUkyR3pjd1VyM2s5K2hB?=
 =?utf-8?B?MGQ5YXJIcjdGUHNIVmpQeVNidVJ1cUFKNjJQUmRMZldEbWJUbXhMNmkrSTJW?=
 =?utf-8?B?VUxRZWxaL3hrQ21FUnNLQUZxbUV3OHVteldHUkJ5TnNKRzlYWDlyWDN2azl2?=
 =?utf-8?B?VGxCSVVoOGZCdURpZE81NkhjQTA5RkNTRGhISUh3ZWY0QkhnKzkvaEJIV3c5?=
 =?utf-8?B?K2ZIWUdIUVJCQWRKODNyMlVRSEpCc1Z0eU5JQklLMUNqWExjRzNPeVpFSFVB?=
 =?utf-8?B?akt4cDF4VXNtU1dQQlFKVTBLQzZZUk4xNVlyd3JjTWtsaUcrbnNHTDBjU3F4?=
 =?utf-8?B?OGQvZHJWVGc0a2p5aVJpWTI2RnNhZG9jeFFCaVNDRUx3UWVoTFpLVVZzanBZ?=
 =?utf-8?B?RU5BaVJvRXVTeGoxUW9UemFmd3ZlZ0o2SXd3YTIveEhUU0dtSjJqZG1EZVA4?=
 =?utf-8?B?QnZsYnJ6Q2dCU2NRMUdiVUtKTVFwelZOVFRadnpTVlZZNWlDK0FJKzA3dUdk?=
 =?utf-8?B?aTNzUVo0QmI3aEdiTDZJaXlkMGpXNXFZWGhSTWVzKzgxNlJCOWlxSUQva25h?=
 =?utf-8?B?L1RpNS9IaFlDc3NQVHBsOG9pUmlmcWRIbEtUczRWU3pET0tIZ3I5QWl5Mmcx?=
 =?utf-8?Q?KYny7DgpEik=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mkl3VE5LbGZJcWZkUEY5a1B5V2F0Uit3RGVuN3hwM1hNUUJrMjlYSkFxQS9m?=
 =?utf-8?B?dHlXcnZrZnJvUlJtcUE5MFFiODZSaDNvNWhuYkxYVFBxMHdFREIwM1o2dVc1?=
 =?utf-8?B?OFhiVzlEdDFUMkIyd3hQVEltZ3hwTlVXUmpLWUlQSzZYN2hpbmJjRXJZMlkv?=
 =?utf-8?B?MHI0NjAzVTBWMjBHZ2t2dVRjaHFQeXlUcWFTYmsxTm5OUmt3VmJjSmdNdlJS?=
 =?utf-8?B?QXJtZENyeVprQ0gyZDA4NHZWWU5XaThWR0dsL2xoRXZ5MmIwR3JWd21sZEJn?=
 =?utf-8?B?K0h2M2MxYVJCNTBsSENHMERLL2lzZlg1RXgyWDdNekNRUkxBTzFUS1A5VXhQ?=
 =?utf-8?B?SjNldHo3SlUrY21pNTE0cW1MQWhCRi81Y0dOdEUxTlBsNktuZWp0bVhSWnlL?=
 =?utf-8?B?N1VTcjR5RVltNndqVXhpeHpYVDJjVklnanZwbjdGbW1KQ0pMT2NIMlhrNTQx?=
 =?utf-8?B?K1FIcThneTdaZUZhWGNZOWQxUjFyaDc2bnRxZVJlMlZjY1BISHIvZ2ZzRXAx?=
 =?utf-8?B?RlNVUTFYbnlFaDlHVWNCQkY1UEZ1Q01OdzFSNmFXUnNBdHdiRnZLSVBGOG5i?=
 =?utf-8?B?U0VTREZFM3FrcUpSbkZjUXk1MnFYdWlyUkFreWlsSjE4V1lLUksweWNWMmpV?=
 =?utf-8?B?YkFmMDJTcEwvOVFXZERJR2czVlhXa3lkbGpwT3ducWwvb1BoaVZ0S3NpVFZL?=
 =?utf-8?B?RjVUOTFzSkZOdmdobVRJTUtDTURiTGRGbm9TRmEvVnpyQXNZbndHckJSSm9S?=
 =?utf-8?B?VzJrbGcrWHBnOVV3QTNyY2VFVmw1NUU3SkhVbkx4bENZY0luUzJmcU10M0w5?=
 =?utf-8?B?VmVlTGJDdWpJTkVQN1FvRzh2Ui8yb2NlbHRyTWpra01MZWVDSlUvNDNlWHA2?=
 =?utf-8?B?VmZKcTRSdS9XWFlJN0ZFbDdLWVVkWkFMMGpaRkZGOEM4elZQc2REOE40RFVw?=
 =?utf-8?B?RHhwSGZDOXc0TG16eGVnYVpaRHp1TEFhTGxHTU54VVRuV1NtZW51ZEc5eWxQ?=
 =?utf-8?B?TFlMQXpJTTRtZzQ5NkJGcFJJU0xoaEVFY3NQUHJFRXVrZWdUZ2t6dTNIR3Fo?=
 =?utf-8?B?bmlCdzVpYXZER1RFaHlVS2YrRFU4NmwyR1NCd3BmQTlqU0FUSkQ5N1NXZUNP?=
 =?utf-8?B?NERycFoyRU03c2tpUlF2N2NCa3Vsa0xINjAzVmVxeW94ZVhTdnhwVkNUcUI1?=
 =?utf-8?B?NENKK1Fxb3pFZTVXZmZlckNYV0oyMkdla2NEbjRLajRRTTVzWnZVbmk5ZGtw?=
 =?utf-8?B?NVhsejNaRjhqWWxBNXVNN0REa1p1emFEeEdYalM3OGhEeDVndTBkd2Rva1lV?=
 =?utf-8?B?N0VvbUdrK0tpYkpjbUN1SUN4cUM4MDAxbUlXVU5aTlJVVkxaaWViaVdscTl3?=
 =?utf-8?B?TElrT2M1MVhja05qUmtteWNXVG1aT1RvakFrMUtGcE05bU9lMWMzby9rRjJH?=
 =?utf-8?B?WEJRSGN0N1BiOEdqaEg0RmhFSDVEVGxWTkZnYWdLelhNZEl0STZWejRPS1Mr?=
 =?utf-8?B?aVlsT2VXL0ZLNmNTYU95TXp2eUw1Nk5Mc2UxZU1iYnU3TEI0OE1RZDhzaTR0?=
 =?utf-8?B?NkU0b0JWVzlJQVNLZGRzSmE2dHJob21PUU54Rlk2T1gySWxhNWpjMFpLZ1pu?=
 =?utf-8?Q?I4FkI+SgMxcojia+9nS6hOGhE/1BabUOmr1e8ofv5dMI=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b57ad9a0-fcb5-4865-3773-08de00f2269b
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFC54E34861.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 13:55:16.7619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR19MB9131
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outlook.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=261IPOgWzkoi7eWq8gmOW2e6dAnz0Ziw4OWW0x4Q7bo=;
 b=SGTsS9+mjjz0SCeEwWBNLGWomFsrehpRN6Pkwnxh1NsvRfFRs7BztbEmpRrspMGK7vG75mWxmLhFh2mqUBwgRFwoz1EE8UJfznWxfuoLv19SOdOCRinyv4Dp1+tLx3xmV0QDl8W5UHnaORjPsK4Ybb+uFt6THbdsjOKzGx223vLcaSor7BJPuHto3XIvKq6LwMissx7x9kGLHiwe2SDbvjZ7fdq1l5wOl/WNuu1HQVvt3Fiy3WdYCTBIlxGxKYgPqjz59xbbqyrgDcIr+cpq1nMv40fblJtgQtp+9dXj3xJvRFzH6XRX6Opydd6xeJX536n+jB2NEW8tqhNjNAVl2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=outlook.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=SGTsS9+m
Subject: [Buildroot] Issue Applying Patches to Package
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
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--------------kh0zLu1ZBxg0yXQGK2WCTDy2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

I am trying to patch the psplash package. I've followed the Buildroot 
documentation and set up a global patch directory with the package name 
and the patches within:

/home/dylan/project_name/external/board/my_board/patches
└── psplash
     ├── 0001-psplash-config.patch
     ├── 0002-psplash-colors.patch
     ├── psplash-colors.h
     ├── psplash-colors.h.orig
     ├── psplash-config.h
     └── psplash-config.h.orig

When Buildroot tries to patch the psplash package, it returns an error 
message, "can't find file to patch at input line 3".
I've included the output of "make psplash-patch V=1" in the pastebin 
here: https://paste.ack.tf/ce2678

I'm not sure what I'm doing wrong here; it seems to me that everything 
is set up correctly.

I've attached the patch files here, as well.

Thank you,
Dylan

--------------kh0zLu1ZBxg0yXQGK2WCTDy2
Content-Type: text/plain; charset=UTF-8; name="0002-psplash-colors.patch"
Content-Disposition: attachment; filename="0002-psplash-colors.patch"
Content-Transfer-Encoding: base64

LS0tIHBzcGxhc2gtY29sb3JzLmgub3JpZyAgICAgICAyMDI1LTA5LTAzIDE1OjAwOjEyLjQzMDQ4
ODUzNiAtMDQwMA0KKysrIHBzcGxhc2gtY29sb3JzLmggICAgMjAyNS0wOS0wMyAxNTowNDoxMS43
NTU2NzcwMTYgLTA0MDANCkBAIC0xMiwxNiArMTIsMTYgQEANCiAjZGVmaW5lIF9IQVZFX1BTUExB
U0hfQ09MT1JTX0gNCg0KIC8qIFRoaXMgaXMgdGhlIG92ZXJhbGwgYmFja2dyb3VuZCBjb2xvciAq
Lw0KLSNkZWZpbmUgUFNQTEFTSF9CQUNLR1JPVU5EX0NPTE9SIDB4ZWMsMHhlYywweGUxDQorI2Rl
ZmluZSBQU1BMQVNIX0JBQ0tHUk9VTkRfQ09MT1IgMHgwMCwweDAwLDB4MDANCg0KIC8qIFRoaXMg
aXMgdGhlIGNvbG9yIG9mIGFueSB0ZXh0IG91dHB1dCAqLw0KLSNkZWZpbmUgUFNQTEFTSF9URVhU
X0NPTE9SIDB4NmQsMHg2ZCwweDcwDQorI2RlZmluZSBQU1BMQVNIX1RFWFRfQ09MT1IgMHhmZiww
eGZmLDB4ZmYNCg0KIC8qIFRoaXMgaXMgdGhlIGNvbG9yIG9mIHRoZSBwcm9ncmVzcyBiYXIgaW5k
aWNhdG9yICovDQotI2RlZmluZSBQU1BMQVNIX0JBUl9DT0xPUiAweDZkLDB4NmQsMHg3MA0KKyNk
ZWZpbmUgUFNQTEFTSF9CQVJfQ09MT1IgMHhmZiwweGZmLDB4ZmYNCg0KIC8qIFRoaXMgaXMgdGhl
IGNvbG9yIG9mIHRoZSBwcm9ncmVzcyBiYXIgYmFja2dyb3VuZCAqLw0KLSNkZWZpbmUgUFNQTEFT
SF9CQVJfQkFDS0dST1VORF9DT0xPUiAweGVjLDB4ZWMsMHhlMQ0KKyNkZWZpbmUgUFNQTEFTSF9C
QVJfQkFDS0dST1VORF9DT0xPUiAweDAwLDB4MDAsMHgwMA0KDQogI2VuZGlm

--------------kh0zLu1ZBxg0yXQGK2WCTDy2
Content-Type: text/plain; charset=UTF-8; name="0001-psplash-config.patch"
Content-Disposition: attachment; filename="0001-psplash-config.patch"
Content-Transfer-Encoding: base64

LS0tIHBzcGxhc2gtY29uZmlnLmgub3JpZyAgICAgICAyMDI1LTA5LTAzIDE1OjAxOjIxLjI4MjUz
MTc2NiAtMDQwMA0KKysrIHBzcGxhc2gtY29uZmlnLmggICAgMjAyNS0wOS0wMyAxNToxMDoxOC40
NDUxMTYwNjYgLTA0MDANCkBAIC0xOCw3ICsxOCw3IEBADQoNCiAvKiBCb29sIGluZGljYXRpbmcg
aWYgdGhlIGltYWdlIGlzIGZ1bGxzY3JlZW4sIGFzIG9wcG9zZWQgdG8gc3BsaXQgc2NyZWVuICov
DQogI2lmbmRlZiBQU1BMQVNIX0lNR19GVUxMU0NSRUVODQotI2RlZmluZSBQU1BMQVNIX0lNR19G
VUxMU0NSRUVOIDANCisjZGVmaW5lIFBTUExBU0hfSU1HX0ZVTExTQ1JFRU4gMQ0KICNlbmRpZg0K
DQogLyogQm9vbCBpbmRpY2F0ZWQgaWYgdGhlIHByb2dyZXNzIGJhciBzaG91bGQgYmUgZGlzYWJs
ZWQgKi8=

--------------kh0zLu1ZBxg0yXQGK2WCTDy2
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--------------kh0zLu1ZBxg0yXQGK2WCTDy2--
