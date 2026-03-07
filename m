Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3C8FC9EF8
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 13:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 001CE60FD1;
	Sat,  7 Mar 2026 13:35:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jLMlqDx0PwYT; Sat,  7 Mar 2026 13:35:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A74F60FDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772890546;
	bh=+00d5y6C3IeTKDcsGEcVlMjRXicJ7T5/I/v1FH92M+k=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZQqO3lp2uk1JYInYTJulVkIULdVaeElarQ1awOZG/pdfp9xV34A9BwuNz5ic3ubGr
	 NWW/QYQktmHa10BqyFPpyD+BU0YdvsU40xS8rwe/zBSGdPMT0f8YjqSR4N37LzHAYH
	 5hcYNQk+0H70E0Ix6curDXzC8vZ4rnKCSBSVImR2+W3lPy3ph6+WIrERWg8yYcyLtJ
	 XQ6J5u97D9PkpjTmxMJxBRQAJIhUfg40pzULBkdNQ/vu0RvmJIN7dr+0TUCw1+YLGq
	 QhAzgUfeosNftoBSe67a+Ez0gPiR5jigrnfUBxHkDgqfsI3hz+Yy7jeBBYCPCoPqvK
	 bTIx5VmDVpbtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A74F60FDB;
	Sat,  7 Mar 2026 13:35:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CE62E169
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 13:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B450D60FDB
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 13:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gCn7GiVWqOLa for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 13:35:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:d107::1;
 helo=dm5pr21cu001.outbound.protection.outlook.com;
 envelope-from=ohitsdylan@outlook.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE3F360FD1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE3F360FD1
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazolkn190110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d107::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE3F360FD1
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 13:35:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yoBDcLfk1eBmapjlbzjRrpFgfwwjPyNIe5qbaqy4cv2GxIJzOS/JmCq4kfmwgHZCdLvYrhs1YopG7DILKGbuAiU96enTAobU54SZAjdxBi2BQYp4sFkvTPxwmHSSFYyHNxWcxk66qvCaHj6rJRppNUYgfTU2BQINPqe6n3ws/JUOD0PGN9EkoTLHsdvFekPV0lIjv3har0TWvEebMV6GsnVF1tV2a09FktZlQ2POsVqzfX6V5A1J/NiVw08/kd28VCKGQ0nlcXHTcQ/jWh+LRU55DpzfZUt/G/zrJbB9nNmfLqDZR0EraKM9+XkqOxR536blICnuZVtRC2ncUDI0Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzNnitMoNEM/mHwreGJXIGPbB0Z0BUSA25T6l/i6VTs=;
 b=HirYgGjni+Xdc0W76POe2gmqNOpt/bwEtirGargzqnAYduEgGmIOdRTc8UK0Qx0D68uCiyjsSR2cI1SPlbdFj/tZrp5H2sHWZPkk+CRoa1d+sh1Jnhs0Hyxkeh7tbtQBCe+rSw9ZIJiDqb/ogzwglii2eMSPjR93z8vsBOhkdwY7Ku8PRX9ovp5MFmTnr+rfmd8qCkfkLE4CKl67UGGSlb72H7HwT71AURH+u790c/IjNIKdPrjvNtNofHv9P+3VLkItrw5s1mwgLnWW+lCeFL78DhnShbBWX0uB0q6+R/sq5q11JOcSEhxVmV+utQUQtXkOFGkVdarzwxlepQ1CGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from PH5PR05MB998506.namprd05.prod.outlook.com
 (2603:10b6:510:39e::23) by SJ0PR05MB7530.namprd05.prod.outlook.com
 (2603:10b6:a03:2e9::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Sat, 7 Mar
 2026 13:35:40 +0000
Received: from PH5PR05MB998506.namprd05.prod.outlook.com
 ([fe80::531b:f829:63a2:1c0f]) by PH5PR05MB998506.namprd05.prod.outlook.com
 ([fe80::531b:f829:63a2:1c0f%5]) with mapi id 15.20.9678.017; Sat, 7 Mar 2026
 13:35:40 +0000
Date: Sat, 07 Mar 2026 13:35:37 +0000
From: Dylan <ohitsdylan@outlook.com>
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
In-Reply-To: <322dd910-1bba-4797-a5f0-4228380e06f1@gmx.de>
References: <PH5PR05MB998506EF0692F2B1FD864EEB3ACB7BA@PH5PR05MB998506.namprd05.prod.outlook.com>
 <322dd910-1bba-4797-a5f0-4228380e06f1@gmx.de>
Message-ID: <PH5PR05MB99850614545F729E273DA3A2A7CB7BA@PH5PR05MB998506.namprd05.prod.outlook.com>
X-ClientProxiedBy: CH2PR20CA0011.namprd20.prod.outlook.com
 (2603:10b6:610:58::21) To PH5PR05MB998506.namprd05.prod.outlook.com
 (2603:10b6:510:39e::23)
X-Microsoft-Original-Message-ID: <F1B8480D-4AAE-42E4-89C7-9FA764D1F531@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH5PR05MB998506:EE_|SJ0PR05MB7530:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d0d6a5a-2b9f-4bcd-074c-08de7c4e6c70
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|12121999013|15080799012|23021999003|461199028|41001999006|19110799012|51005399006|8060799015|5072599009|13041999003|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3YzWEs0Q2lWM1dERHNoMHNoTVdnVEJpc3czSGtpNjRBcUNPWlRvWlkvWVhM?=
 =?utf-8?B?OFJQc0srTloxalZaMmo1dmVZMU1wUGhiOFppMXFXYXAxNEpwNEhybVdxTmpX?=
 =?utf-8?B?WWJLZjBwUmRUYTdrUDFoQjRHY1RaOU0yZkNKaGN5eUNIL3BpUGszM2xHZEZF?=
 =?utf-8?B?MzZNemRQUnlpcFpnTy9sbkNVcmR1cHVuS2wrVjZLS0NiUDBDQ25BY3JEMXZu?=
 =?utf-8?B?REJGNExkM2YyM1VYNFMvY3lMUDJGWnJheHJQcU00V1ZaUEphdkFVZjJRUVFj?=
 =?utf-8?B?QTNHcC84MU13QzZOZEVtVk9xUjA1T2kzc2JFV1MxNE5zeFNiVFA4Q0VqanVP?=
 =?utf-8?B?MzNlNzNJdThzSHlYSlVGcW1hWkRmWWN2YkRFSmt0M1cvMWgyVUU4aHhVbk5k?=
 =?utf-8?B?T09QUEwvdUtQRTRWSjBIQVZRMHI4ZVRZYlowblc3V3gyMHJTd1ZGK0x6eFAx?=
 =?utf-8?B?Yk9CZkpmMEJPWnNpeVlxQ2NPMytrZ2VTZE1NNUdROWQ2RkI5bFdGZU40c0dp?=
 =?utf-8?B?bkE3NlRaY3FSWW1rbDFQWFBwbmIxbmdiTDBjbkhSd2hGRkZiWE1LVm56S2Ir?=
 =?utf-8?B?UG55TFkwZ0JWZXZXZ0tNY2pkNFd3NWswU2VTNHgzbVVMU05Sc0tNdnhTNG8x?=
 =?utf-8?B?RFo3K1F1L0dTNjVycEVmY0dvNjFVSlVKb2J1VFQ4Z0I4ZEZSY3I0YjM0eC9P?=
 =?utf-8?B?dzBJV1owbmpUUWU3TjJJV3ZNVC9RSVJqVDZxRDRkbU1lc0wvSE9GcVRsVldE?=
 =?utf-8?B?b0YxZFVDMUhCQnkvRzVhMVp4cDNCT0dxc3pZWG8wRVYrSEJYbDFEME4yajB1?=
 =?utf-8?B?YVhsUXpYN1pPT2l1UGN6WXRpSUtOWm1YWXZ2QnBrR1d2bUdMcHR1clNlazRN?=
 =?utf-8?B?b0pXdi9HdEJnSkdGQkZsQzUzSzNQbGhqRXJCWUxkZXpEbU9HZ2I4MXh6Ym5x?=
 =?utf-8?B?NnVabmwyb2JZdGlUZTBoeWdQYU5ERGE5YkljSmpBb2Y5NkRVN3VjcEdxTStu?=
 =?utf-8?B?Z3JScEFUaWRTSURlNnhHWEVMc2czRmVxeURtZzMvVXVoRGM3OExWU3drNFl0?=
 =?utf-8?B?NS81M0FJcUozQXhXbUJ3UmIxWVJKSlovUldHWFpVeTZrVHhuWS9zS3dDU0JD?=
 =?utf-8?B?d0ZUWkw5MGZvTnE0WnJRdk93eUpDZEtCNkd2bzNMZEFEUnB4WmNtcEtDWkE2?=
 =?utf-8?B?TkJDOVRmU0xTckd2dUxyb01UUXc2cnRLMUJ1LzhBblAxRVdZOEVhSXV0aW05?=
 =?utf-8?B?clEyOTVIVjNxaWJib1h6TUJ0Y3VLbWVJenY0dzVHZjVVazA1OEtjeGcrOTk4?=
 =?utf-8?Q?ZYf1CyMbft+0QDPu/jIYLGElf6738Ifa3O?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckhOV2ZsYytFeE9WQ3B6RVZaVEt5c1ZGR2lVS3RuMitkK1dUY0trZzM0NERM?=
 =?utf-8?B?ZXhMQ2FwbXVmREtTV0JqYkd2bGwwM0NqK1YwNHJianlaMUs3dUVRSzFZYi9F?=
 =?utf-8?B?VVF3clVnMTU0WTQxYnk2YldFT1IySkRja2VvaDZmZTZVaWo0MlF3V1ltTmxV?=
 =?utf-8?B?Wkc5bXRHcmh4R0JFaTNPL08vWlNYbHRzSUxFemxYQ2lsd05Ydi9JTXh0RVky?=
 =?utf-8?B?Uy9KekxGTkhnRnIvdU9venZmM1czQUFydlBuazdaY0g5aFJHK2hGajZOSjZ2?=
 =?utf-8?B?V1hMYnBYZXdKOEhtUDNPMlFOcGFVOG1McXRKalorb3dhR1N2ZVdEWTMwL3Rl?=
 =?utf-8?B?UFd2cEQzRVdIWGRsTFlNcFo0WGp3RElnT0R4VmRTbVo4czFNWGF0R3JobFhG?=
 =?utf-8?B?T3hJYUFJUlZPU05mS3N5MzBVV2Z0L3dqWktSeEVyRCtxeWh2SFRqaFpOQW8z?=
 =?utf-8?B?SnMybmtwN3NkTlNvTXhidDUzUG4vcUs1bzI5TmUyM0pDZFR5WnV3MVY4bVUr?=
 =?utf-8?B?Nm5IWG9Eb3pwRlM1bVpDenViTU5ucmVtMHlzaGhzcEdQWUZnK25xaEN0QkZx?=
 =?utf-8?B?Qzd1NVV1bkNwVFl2NGJBOHlOK3V3UGVLNFBXT1ErZEhFVFJEYmZrcUZxU3Fr?=
 =?utf-8?B?UUxiWjg4TEIrMjlkenlmU29pRFJ3NE40dlRjK1FxTHptbDBjZDlZTEFod3Uw?=
 =?utf-8?B?SDFuQlNVeWVpd0NRTUlOY0VqcWhncXNLK1FtblQwYmd6TTBxcnNOeXVsdWdh?=
 =?utf-8?B?QXYvcEh1SFJDYWFoUkVTem80VUw3bnhFRnJneWlFNnh3RWtmdVByUjFxREVY?=
 =?utf-8?B?WGQxWDFhRDAyaFlIM1ZOL25MeEFESlI0WEl4a0ljeTRyQndSa1BwY2NIZWxv?=
 =?utf-8?B?cjlKTWhGelByZGM4cGwzMlUyemxIQ29lNDRnUk45cjZ5OU5MaXZqRmQ3aUo4?=
 =?utf-8?B?bGZUMmFQVnI2NU5lM3o3MGNkeEZScklSZ3F2eGRjeVg5V1lCQjRVZFFDcXpJ?=
 =?utf-8?B?a3FCMkx0bUxycnl0OGhMaXlEV21FaGUzcXhvUDJhQTk0QVo0ZGExZStLanIr?=
 =?utf-8?B?NExoaGtKSWxCdk1oTUhJZjVGOEJTTGxreW5UVVlKRHZtb2g2WW1EYXgvZi9P?=
 =?utf-8?B?aXNDU00xd0hzU29CT2JrcmZGYmxVNlF0dHdrK25Ndm5NWHdhUEhISytXYmRE?=
 =?utf-8?B?bHpaREo0YmVoUEdXZFZiaS9sckt0MzRnem5MSStQQlpqVitaTVQxTVpVZ2R1?=
 =?utf-8?B?YlZFRDZTbWtmekltN1U0VXJHSm5HMkViMTZPRENKb2s1S0RaUHZOeEdiYzBm?=
 =?utf-8?B?UmsxTjZ0UG5USFY0bDFMZ1BmY0lQY1diaG1IMC95T01EMWV3UkJVS1diWEk1?=
 =?utf-8?B?dEpudk1oVzNnbVNiY3lLbHpFbTVHOGNsREplSGhoOXJFaFA2OUZhYVd2ay9n?=
 =?utf-8?B?UE8vSG1pcjBKK3NKTlBxb3NvdEFId0xIdUtXKzNrSlc4Z1F3SDlaWW1wVHF4?=
 =?utf-8?B?UkdKK2VidHRJRit5YnF6OXJySFdvRWtRNE9uU29hdlY2TGhKR3lDK0JHNXFt?=
 =?utf-8?B?cENZT1B6Rk5rYkJYeDRoZ2tORFE0K3ZoZVk2bGN0Y3YzZmU1VTN6S0Z0N0tN?=
 =?utf-8?B?VlJxU0phS015c0Z2UlRKQzExMnRBSHJhVUJFeFgycTQ1L2FLYklOWnViWksy?=
 =?utf-8?B?eDA1RW9peENuRHY3dUlvdmpZSWd4VXFYbitOMlF4RUlNNGlRZTZnK1R0Y2tn?=
 =?utf-8?B?a2hUVGVGelF3bWtMQXlXWi9MOG4wc2JSbFFEV2xnOUpRTEtGM0ltOXg1RnFh?=
 =?utf-8?B?NUUvWGdPaWc3QUpGVFBXM2ZzUTg2eVhwN1lRdkF2SDI5WXVMZGtRYVc0YU5H?=
 =?utf-8?Q?AQqhnincwo9SX?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0d6a5a-2b9f-4bcd-074c-08de7c4e6c70
X-MS-Exchange-CrossTenant-AuthSource: PH5PR05MB998506.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2026 13:35:40.5192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR05MB7530
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outlook.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzNnitMoNEM/mHwreGJXIGPbB0Z0BUSA25T6l/i6VTs=;
 b=eVZk3kZFd8sj9bU+UopAtxUqbdB3EmYNNL9J9J8kC5xrVFMZrASXZXgNTFE+31txDuE5er+RKNVgL4N/jWCi+0qxw+zJPWIt2kb6NbKXrU/gVlov+CVHzHvbI4CJfmKazvX4W687nZwLFaSF1bdxNFwA1ElPqibbmerkug+hzNG9KD8Fm03un6FrhcT3F/0/M7W4117VaM6qWR0dLuRPnITeYkqb9+vI9XSukslgjhbXaMWRfzxYQ+m5baRwybXpu7FRwOUEeDR+5Mirtghtp3OSLX31iBepeQHDeqF/jYLwZlYvahzpABpnL1qUiN/YheTnl2Sg6+pr9k/euvZKfw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=outlook.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=eVZk3kZF
Subject: Re: [Buildroot] How to Build python-jinja2 Package as a Host Package
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
Content-Type: multipart/mixed; boundary="===============4856299804628576693=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4856299804628576693==
Content-Type: multipart/alternative;
 boundary=----AKEC09PTXZTYH1Q2BM392UKKCMT6G7
Content-Transfer-Encoding: 7bit

------AKEC09PTXZTYH1Q2BM392UKKCMT6G7
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Fiona,

That makes sense! I will list it as a dependency of my custom package=2E

Thank you all for your time,
Dylan



On March 7, 2026 9:25:46 AM UTC, Fiona Klute <fiona=2Eklute@gmx=2Ede> wrot=
e:
>Am 07=2E03=2E26 um 02:06 schrieb Dylan Buckley:
>> Hello,
>>=20
>> I am trying to build the Python package, Jinja2, as a host package=2E I=
 see calls in the python-jinja2=2Emk file to the host-python-package functi=
on, but I do not see python-jinja2 as an option in the menuconfig host pack=
age list=2E I do have python3 enabled in the host packages=2E
>>=20
>> Am I missing something obvious here?
>Most host packages don't have any config option and are just pulled in vi=
a <pkg>_DEPENDENCIES where needed=2E E=2Eg=2E if you look at package/python=
-jinja2/python-jinja2=2Emk, host-python-markupsafe is listed there, and pyt=
hon-markupsafe doesn't need a config option for the host package for that t=
o work=2E
>
>The host packages with config options are mostly ones people might want t=
o use as tools to go with the Buildroot build results (e=2Eg=2E for post-bu=
ild/image scripts, flashing, debugging)=2E
>
>So, what to do depends on what your goal is:
>
>If you just want to build Jinja2 now: make host-python-jinja2
>
>If you need it for some other package: add it to <pkg>_DEPENDENCIES
>
>If you need it for some post build tooling, you could write a patch to ad=
d a config option=2E There are a few host python modules with config option=
s, you can look at those for an example=2E
>
>If you need it for some custom make target you can technically also just =
add it as a prerequisite for that target, but that'll have it missing from =
dependency tracking (including "make source", "make legal-info") unless som=
ething else pulls it in=2E
>
>Best regards,
>Fiona
>

------AKEC09PTXZTYH1Q2BM392UKKCMT6G7
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8"></=
head><body><div dir=3D"auto">Hi Fiona,<br><br>That makes sense! I will list=
 it as a dependency of my custom package.<br><br>Thank you all for your tim=
e,<br>Dylan<br><br></div><br><br><div class=3D"gmail_quote"><div dir=3D"aut=
o">On March 7, 2026 9:25:46 AM UTC, Fiona Klute &lt;fiona.klute@gmx.de&gt; =
wrote:</div><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt =
0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<pre class=3D"net-thunderbird-android__plain-text-message-pre"><div dir=3D"=
auto">Am 07.03.26 um 02:06 schrieb Dylan Buckley:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin-bottom: 1ex; --net-thunderbird-android__b=
lockquote-default-border-color: #729fcf;"><div dir=3D"auto">Hello,<br><br>I=
 am trying to build the Python package, Jinja2, as a host package. I see ca=
lls in the python-jinja2.mk file to the host-python-package function, but I=
 do not see python-jinja2 as an option in the menuconfig host package list.=
 I do have python3 enabled in the host packages.<br><br>Am I missing someth=
ing obvious here?<br></div></blockquote><div dir=3D"auto">Most host package=
s don't have any config option and are just pulled in via &lt;pkg&gt;_DEPEN=
DENCIES where needed. E.g. if you look at package/python-jinja2/python-jinj=
a2.mk, host-python-markupsafe is listed there, and python-markupsafe doesn'=
t need a config option for the host package for that to work.<br><br>The ho=
st packages with config options are mostly ones people might want to use as=
 tools to go with the Buildroot build results (e.g. for post-build/image sc=
ripts, flashing, debugging).<br><br>So, what to do depends on what your goa=
l is:<br><br>If you just want to build Jinja2 now: make host-python-jinja2<=
br><br>If you need it for some other package: add it to &lt;pkg&gt;_DEPENDE=
NCIES<br><br>If you need it for some post build tooling, you could write a =
patch to add a config option. There are a few host python modules with conf=
ig options, you can look at those for an example.<br><br>If you need it for=
 some custom make target you can technically also just add it as a prerequi=
site for that target, but that'll have it missing from dependency tracking =
(including &quot;make source&quot;, &quot;make legal-info&quot;) unless som=
ething else pulls it in.<br><br>Best regards,<br>Fiona<br><br></div></pre><=
/blockquote></div></body></html>=

------AKEC09PTXZTYH1Q2BM392UKKCMT6G7--

--===============4856299804628576693==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4856299804628576693==--
