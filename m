Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E057410F2859
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 16:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C05A83DEE;
	Fri, 27 Mar 2026 16:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id anmompSOLleR; Fri, 27 Mar 2026 16:58:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7B6983DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774630696;
	bh=ygwohLG3AAjiOekhKk1T2CfYf2k7NJheAYIYN9hDFqY=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=UBG5DmcuriNBryOGTKcX2OgCDuGYplKWjQ2gtRhZ0lesyNtJWqq2tF9CcztBGqIDW
	 FOEJsuEad/IX5bzT2bDJd0R8AvbPfrypASfn4pILy3a9whJofuLNkGI2hRmLv7C77H
	 YBsmXzAQxRw+C4f9PJywVnz3jaKpa7jesruIyJ97EQy6x08IxINpmho9n8g5YqG/di
	 +yzAK5kiwY93FMw7fUGjMf8JlPVfmGAnHzlc002nvk8K98m5LJdSK3ZuAJ/JAxwtPy
	 1wFkR9DWFB1dqUE2ZL+im1/WHZ37MW76ayCyM7tBciBireN5CrM3xpefZRW7/yen9N
	 JajyhRNFJW1xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7B6983DF1;
	Fri, 27 Mar 2026 16:58:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AD8112AA
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 16:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E25A83DEE
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 16:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CokLseM7nXCL for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 16:58:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c200::1;
 helo=db3pr0202cu003.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 12C4383DF1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12C4383DF1
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12C4383DF1
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 16:58:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ujKR/2Ivau6DnmT6uM4vAsBnGcc3H036msDazoo56yqBQ43y/ifLfCqwUx3CrTjML6YMw3YFxCOPP/l4B3LRmsf28tPx4dZhkbnIcaE0cvxY+wIj/9AKU5OMEtVF4KZ4TGXU8R2TntV+6YcUXS1YFOiUnlLPI3tq+dk+V+6NC+xBVgULWUj9wPBjL5p1TPc60+MXHVBihSgLWZZwdQXIGz4wID0h2I+1c+/F0o2oEA9+BesQuz2lbfsQfYoKS/UmqHtZMKJb2UH4nnxFdQvqYFTZFE2CFxG9RbLmrPbFNsk8g6gaKDcvO1fuUr7+GGSmSYngoJFELcIvtLSk5EwfPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWO00f4gIP9fntKp4mdfwXbNSOs7Dce+NwAmZJ3uUi8=;
 b=daGxXrgDTA+hLSlsRy+z82jhyCsNqV8ds889hg8OiRy/i7dcO0j2J0OD7gZy4U/KqISZmRpHelww2tDSZEPboxchZiwxMuMV813jfx5724sJqJP7bi0/61QLW969ZuPplxYUmttQbL0poOFljL9O3OFCgqP+P95umhgAe6jNTusFQLcDWesoqF08I79ND95vfV5uYSPhpIEbkZB8YKIvoamFGbcibUGCKtUIhkvGNsIghtmx6a1ibVmKdj9on/q9cVZPAOnLFIuP2OK8vDIN/SgE/Mj97/ZoESI0hVIJVa8HsCymNl4Dx0ea3R4QSt10Ye2D9HyUWyGRhPCIBVWjPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com (2603:10a6:10:643::14)
 by AM8PR04MB7202.eurprd04.prod.outlook.com (2603:10a6:20b:1da::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 16:58:07 +0000
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b]) by DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b%3]) with mapi id 15.20.9745.019; Fri, 27 Mar 2026
 16:58:07 +0000
Message-ID: <fcef4549-6961-4824-a4c7-a73552bf3bf9@cherry.de>
Date: Fri, 27 Mar 2026 17:58:05 +0100
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
References: <20260324-qt5-5-15-18-2025-02-x-v1-0-9d25b343a6e3@cherry.de>
 <20260324-qt5-5-15-18-2025-02-x-v1-5-9d25b343a6e3@cherry.de>
Content-Language: en-US
In-Reply-To: <20260324-qt5-5-15-18-2025-02-x-v1-5-9d25b343a6e3@cherry.de>
X-ClientProxiedBy: VI1PR0102CA0074.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::15) To DU4PR04MB12026.eurprd04.prod.outlook.com
 (2603:10a6:10:643::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB12026:EE_|AM8PR04MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: a9d97f35-a3a2-4d5c-648e-08de8c2204e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: +JCRgdPAK/9ZVk0ZklEaN28wiBCvJ8rguyM+EpKVR/Oz/EMxLicSzcArPahuvudKAHLHxxjcbzC2zNumVHxctNi9l8GiB0pJiewK9m3HX03/bP0Q2vjTJxZyPGk/OY+3fZEwM34YN7Fmo/SqnH0mFiLAiKE5Wrm/+nHhYikqI5PJTHjzMebfnwT7Xda/gZo423eGR8Ek1SGWEMp/9OuyLUKeUSQyd7xkcukr7eYBk7mxdUfdpava13Y/sI2toFAGH3a3lRTdtiaONCGo0Czv7DHUhYzZEws5E5c/Z/5mRma4f6RN1oOuU8uue8ZdVXP6qQ2OxaF6yH7ozNnLQvGesUgV97W15djMHwuYnLm+nreCIl/NTyQIHO2FmSWNikwthEljQh5zv6zQzp0BBC7/48JboaSHBomg9gdX/D39pGp4sODEVrmxKmhhAChNQN6vvxbWSgltQsOdey1Xl2ZH5UDaBNUqox+aAirJuSmdzEe9QDuY9mbjFUa6S7GOxPDBcCAaur41gsaslU3lUYZ3wH+/6Ui8keH7vvHvjk4qpx39+JSXz8lDjAQU08pkgIe2g/GZZOiYOPPFcGY6Apd9myT6tpDnxMqccXfwFC5ogcclE5xYB1HhsQjQTLSJy95skS1mN5ldf+j+3AMg6s2N6jcxUnbLoqjxQpWLQI3HF/xsQ8Jde3owulKEpnhS9Ow9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU4PR04MB12026.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RldYYVZ3bW9vWnYzeVlyQlRkUjJ2TmtlS01sWng0UG1DUE9uQTg2UHc1aUdp?=
 =?utf-8?B?MjZhL2xqL0VSa0xaaVZpQy8vWW5GMjAxN29YNU5WaW4zVzVXUzBFVEdJV044?=
 =?utf-8?B?NDlQSnI2aXA5TUZKWmpOaVhJVUJVeXF2bjRSUmRSaWJsK3lVaDBlWW1TcjVQ?=
 =?utf-8?B?Qi9DTStENERSODdxSnZYVTJjbVNIWllwRE1nOG5UZmlKdnhqcVYrd1RLRVo5?=
 =?utf-8?B?VjZhcWhkWWRhY28rRk1RZFd6bWl5SE9IaDZGUlQyamoyMktVSkJzclgvRERV?=
 =?utf-8?B?S21IMEJubU9tQzdXRnR5d29wYW03RDM3SDYwWTYxY1BtS2ovYlNWYmg0OVE1?=
 =?utf-8?B?Um1NeFAzaml1b1NXQ2RZS0tqK2VIdlVmZldjUWp6QlpKV0FnNlArblpaTE1v?=
 =?utf-8?B?SjlwZ21EY1BhYnloQlNHQ0dyR014U1FZNWFBNUhGaEpnUVBlZlpEQWhPei9v?=
 =?utf-8?B?UkMxN1BybGxHWVl6ZUs5MGpzZVFBWHBTcXU3cytXZGZwY1ZRRmdOQ3ZVVHY5?=
 =?utf-8?B?bElNUngzcDBJY09semtMYStCUUxnaU85aHppcFdCOWk1YUwvd1dIMlVWQis1?=
 =?utf-8?B?YXJrT2djdjUwdXFDUUNaMmNiN09xcHRCUDhaUWpkMmhDakpEc3dSTVhKQVNn?=
 =?utf-8?B?cmt4cjdpR0lORmZ4RUZUMEdTYTg1cmRrSzlpeHNkSTVncTJBUzdpY21rWENl?=
 =?utf-8?B?SnFmbzdzbWdZOUEvb1lsNFpxaTREcDBMWHp4T2l3LzlNZFRTL3FGekVTSVJL?=
 =?utf-8?B?RVg3b2VlRG9TNXdvNEw2elV4N1ZLYkFpZFJ4M3A1d2Z0bW9wOThwaXlNeW9Q?=
 =?utf-8?B?L3FOZTNnWnowOUxEQUxSSEYzL3BnaE9Vb2lCRGZrMzVxT3NQdnZYWVVLbW1K?=
 =?utf-8?B?UVJydVo1cTh5bXpTdytLcm5JbnVybVNHSzNJNERWQnRzY3BOTitNVEtxWVB3?=
 =?utf-8?B?a1FGTUh4UzhIQVZMR2VDdVhrSXltYThyR1hjNlpjZGp1TjZvOXJXaGdrMFN4?=
 =?utf-8?B?MmxLNnBHZFcreTJrR0s2Yjd2U25GeHpXYjZudS8rYlgwNHk5ODVlOXVsUUZR?=
 =?utf-8?B?LzRUTkxMZytmYWc2RUg3QVU1Q2tkOWgwS0hrUmx1eFYwMU5WZ1JFUUVDWExq?=
 =?utf-8?B?S3FOcCtRVnpRenY4MFJON1BpemxBS2xvaDg1K2ZGQko1Rjl5TVovcERsZTZ5?=
 =?utf-8?B?UU4wKzdhY0JaR1BuZE1ES2FsMHdET09VZkRtMTBkZmtxaW5xMDcwMTErWVFm?=
 =?utf-8?B?bTFMbUVLSGQ1Njc1Zk54SVNwSkdpL0tuSDNBTXBLdmpsSktydDZaWUhTTDE0?=
 =?utf-8?B?Vk91QktRRjBVa3VkcFhIRnZjMm1hV2dGSVJ2a28wa2tMNnltOGhHVUx6cDlZ?=
 =?utf-8?B?alBIOUllY1k2cHI0SVE4TE1QQm1oamF3L3lEVDJDZ3o3b0sxMGRnYWNObE1B?=
 =?utf-8?B?SHFOa1U4M1M2VHBnYVJhR01PSWYva3BkYm4zeVczQ2pZS3cxNG9LRHhveUIw?=
 =?utf-8?B?QVFPYmlJOW80Z3NwNVpTc2pLT1YrUlYzMkN5UXY0K2xGZmVQc2R6OVV5RDZH?=
 =?utf-8?B?VXBncnk3VWR1cHlmL24xQ3RFRlJuVjJ6Y0FZeGI0TXppVEs1REZqQWJEQkFr?=
 =?utf-8?B?djRLRTR3SGZoRERwZCtDUE5DcFprREJmK3N2MHlWM214c0ZZUDdkWmRvQldG?=
 =?utf-8?B?YlJzRlErOXV6anJmREQvU1Z3NHp3MVF1YXdKcnZnSlVscHZsSUhkR2ZJM3ZB?=
 =?utf-8?B?SXcvbmsrMmRjaHlvZzdMNjVGRU02NEthdi9sUjhCN0Z3VmhBZW9mZE1Jczhl?=
 =?utf-8?B?Y3ltTkNTU2hmZWhKMjNFSHd6VHliczB6U0MwOWd1QVRxSVl5VnIwVHRlV1M2?=
 =?utf-8?B?Z0tpYlRpaDZYVDRHcCtJQTJFYkwyL2NUUUFzN1hUb1hVdDlobitibUc1RFlq?=
 =?utf-8?B?MEVWOCt4NjJjNGlTazBacE5BYWswUGt2SzllM2hqbjdOY3BBcndzd1pwalRj?=
 =?utf-8?B?OGRtMkN5dTRLbWxHR1ozNzcwdWloRHp1dm1iL3J4cTVZbjJ1MXRDVDZ6dFdF?=
 =?utf-8?B?UkRrUExKNkIxVWMvaHBwbzBNNjR5bXdIYVl6QThKM0tHZkZSK28xOENVSnAr?=
 =?utf-8?B?Q2JXUnVmZ3J5Zm94bkpaZVBDSzNPRHNoMjUxR3ljWlNYOWVReEQ1NnEzc1RK?=
 =?utf-8?B?ZzE5ViszZG9DT01yMWxTdTQ1bWFualJseG1vUWgzSWUyNlljenpOWjcxUXp3?=
 =?utf-8?B?MFNmdDJLelVVZ0tyRVdQamhRTGhGN0VxVGZCcHloVXdZc3B4WFg0dVZsNXRZ?=
 =?utf-8?B?ZDM5d085ZmZPK256NjlKNXV4eXNZKzZpN1ZGZExPL1Awd2JJS3EwaHRsODE5?=
 =?utf-8?Q?P7qaW0yYrI0g01NSdbIClGvAS9uiV6ubfv5hf?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d97f35-a3a2-4d5c-648e-08de8c2204e4
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB12026.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 16:58:07.4532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PvSzCdgB3qmmM+fVgxfJpKfuKzdk54iWdwvQXZub297qYkfL8m4koiaouX0NzmuttsMEkZC1xWB43LnRsd4PFIMlrIoAlYH31A5mIu9wWfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7202
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWO00f4gIP9fntKp4mdfwXbNSOs7Dce+NwAmZJ3uUi8=;
 b=ikaoyJCmeg913zbZ13uSgv4Sj5ZhsMUEpZ3b95ofF6lLEacYT/k9kKp0t5Nyi+abxw8zSgPIFx74uHb6vlWbX+flHvxfj93KC2YjCiJHWo2ZxVqzMwt4SQ+EGKsrpvMx3L/KyOULVbCZJDOwZ0HAbsuF8x5cxOZbj7gfluqy+Mw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=ikaoyJCm
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH 2025.02.x 5/5] package/qt5: bump packages to
 latest 5.15 kde submodule version
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

On 3/24/26 12:01 PM, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> Bump qt5 packages to latest submodule versions from
> https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15
> 
> qtbase repo is a few commits after a tag named v5.15.18-lts-lgpl so
> assume it's now 5.15.18.
> 
> qt5base patches are updated to make them apply silently and cleanly.
> 
> For qt5webengine-chromium:
> - 0001-Add-python3-build-support.patc is removed as commit 68302c9ea158
>    ("Enable building with Python 3") contains similar changes,
> - 0004-Migrate-presubmit-to-python3.patch is only partially kept as
>    commit 68302c9ea158 ("Enable building with Python 3") contains similar
>    changes,
> - 0006-Fix-build-in-Python-3.11-invalid-mode-rU.patch is only partially
>    kept as commit 68302c9ea158 ("Enable building with Python 3") contains
>    similar changes,
> - 0007-Replace-imp.load_source-with-importlib-equivalent.patch is
>    removed as commit 68302c9ea158 ("Enable building with Python 3")
>    contains similar changes,
> - 0010-Fix-building-with-system-libxml2.patch is removed as commit
>    c98d28f2f0f2 ("Fix building with system libxml2") contains similar
>    changes,
> - 0012-Include-cstdint-for-uintptr_t-uint8_t-etc.patch is renamed
>    0009-Include-cstdint-for-uintptr_t-uint8_t-etc.patch and contains more
>    file patching to make qt5webengine build again,
> 
> For qt5webengine:
> - 0002-Add-python3-build-support.patch is removed as commit 2294cc4ed5fd
>    ("Add option to chose python version for building 5.15 WebEngine")
>    contains similar changes. It now supports both Python2 and Python3 and
>    defaults to Python2 if found first. This can be overridden with
>    -webengine-python-version python3 in QT5WEBENGINE_CONF_OPTS but this
>    was unnecessary in my tests as Python3 was properly selected from
>    $(HOST_DIR)/bin/.
> 
> qt5webengine-chromium is updated with qt5webengine following the logic
> stated in Buildroot commit c53455ea4ffa
> ("package/qt5/qt5webengine-chromium: bump version after qtwebengine
> bump").
> 
> I am unsure whether qt5webengine-chromium-catapult also requires an
> update.
> 

Note that I made a mistake in v1 of the series for master that I 
necessarily made when backporting for 2025.02, see...

[...]

> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 3ad2bdfc04..0e375e83fe 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5BASE_VERSION = 2b9835f5c9bcfe3105b60a8dd33c1db7d8611378
> +QT5BASE_VERSION = bebdfd54917e25d1c100e6bd9f5dd53c2e645fd8
>   QT5BASE_SITE = $(QT5_SITE)/qtbase
>   QT5BASE_SITE_METHOD = git
>   QT5BASE_CPE_ID_VENDOR = qt

... there should be a change to QT5BASE_CPE_ID_VERSION here too. See v2 
here: 
https://lore.kernel.org/buildroot/20260327-qt5-5-15-18-v2-5-4c98e853266a@cherry.de/.

I already didn't like much sending a backport series for 2025.02 before 
the series for master was merged so I will refrain from posting a v2 for 
the backport, but if the series for master gets merged, this one here 
only needs

-QT5BASE_CPE_ID_VERSION = 5.15.14
+QT5BASE_CPE_ID_VERSION = 5.15.18

If you want to modify when applying without going through a v2. 
Otherwise, lemme know I'll take care of the backport whenever possible.

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
