Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F99C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 09:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8CC882BA1;
	Fri,  3 Jul 2026 09:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PLQJRdOCGcGz; Fri,  3 Jul 2026 09:20:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF7D082B21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783070447;
	bh=9xw28GuWrhC3XWhSzWufc0TtJFPtTYh2HRVXh0eUluY=;
	h=Date:To:References:Cc:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fr28RJDTXrWo9usDbV63HhQVkIgJuq2J5cNIwa84FQrXYKWVmaRKsQSp9UxE4519M
	 3ZlhHRtCaMCD2TElSGqCgBCqbpXKbZgnqJjxLN0JTRp6/TEdfwiL+Wfhn2w5zqkaLR
	 X/IrF/JLuHFyqS97MFFvsg0eGz4UfGTkLsZ4bu2Fu4e3mh4QiFLUbMad2TmLP2iDPc
	 IOMId9JjAACVCKhUlGKFyq1vEU/fLIbIzxEayYK3V8QwjDtNcrj5cgk0hSsbRjzl8m
	 XPkRxET9B3GMOw06HWii1GXMcC33STbMPgJuaOKk2EUN7fpO/XsiFjDYqc2wDnk8Jh
	 S8co4pfr1t1RA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF7D082B21;
	Fri,  3 Jul 2026 09:20:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CF653363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 09:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5A7A606C5
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 09:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VDgopgBbUez4 for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 09:20:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c200::3;
 helo=du2pr03cu002.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 152C960741
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 152C960741
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 152C960741
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 09:20:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nSzfyxxcxSP3Oeat2/u7IUfgO3u1+UC6UrXeET9BHPAhHLyocvj6eChRFyM0unyl5WGT3CspfixfPbu+guie+tOBu7l/Qqp5nz1z6P15E4tSuK7XwPYHBCEkFWX5XS+WXWwPZb4TCDPEi4xQF9nf2NQe7v/U3tu7EP41n+Bjc//G0VKikXc3n17/q3RPxaMiI/C+JcEW6Q69C29D5CcOYcIZAThk5vNptQCGVM2bhxU3MMf0JckFRnX0hYDQXuOIRjsyP0qcYDpR52Jxrl5lQoMKQi6oDUsSrXGax+OaMKlBvzGCYF34TN4CJc6/fkUklWdo0hPVyl3jVS06MN8gCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLW3hxHnDCq9GfCJsauRojCvMcnWcNwDcC33Frfca+w=;
 b=fUb99Dhj6nsvaK2yMOx45zfnztKk54tg8TDq9seVMp5M254JXVOVo+aJ5Wa+EnSBJ5CTORJ+MK3UB8sFpuQ75LEq1aNe71vuwzGseUVsmbX81ADsLOzVurdCI1N3oh8mVTQ09TuQ5cqIvFIXZsNdr1sVUUav7Hm8gyt/y0cdA+aaoMY0xy0eNl96pN2xI7FMeEP5dqzjDHisSitI6WyGB7Dpn9HbUQonxSHS8Jtjh/arRTDZxfaceenDfn0ZEfKgqNMLZNFayckgR1gLgc1hPksxMjrktS5hfplsruFPEAcSre2S7z7JZOSqALMfN7cQGWcD/iwb1B6EceKyC7dptA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AM9PR04MB8746.eurprd04.prod.outlook.com (2603:10a6:20b:43f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 09:20:38 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 09:20:38 +0000
Message-ID: <f6b4e9a2-8ee5-4799-960f-36dbf5710da6@cherry.de>
Date: Fri, 3 Jul 2026 11:20:37 +0200
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>
References: <20260702203020.322896-1-thomas.perale@mind.be>
Content-Language: en-US
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
In-Reply-To: <20260702203020.322896-1-thomas.perale@mind.be>
X-ClientProxiedBy: VIVP296CA0042.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:356::17) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AM9PR04MB8746:EE_
X-MS-Office365-Filtering-Correlation-Id: 030d4903-f9a2-484c-6860-08ded8e4584c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|56012099006|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: C5vTym9Hwtuee57apvu52fYNhNTyYNC+FNL06puGTd49zxfqIrO941WwQbaC5gsNsh13YJCJcLtAg8CLV8co+qhoG2ZkLhhdD+mI3nd1l4i9kMziEqOmtps5Yk+aHIne7SW50Du1UZSzzhj1sbnLsQ1a/iDUZ+nTg74Smkecf97WXqQP7BCIGQqBZ37ySIG8AoN/wFMwAlG610L8gUDTu4jneMkPlcfl2p3AhNOMcfusFOMsDaF0SiGBLvG7lGvHMKJD9Ti3/4mJNUDnvBGEAvKhjMQN7ZggUwElfRy63mQr20YFa+8jC+39Tm3HkMId/lMXK4fWPmJguHttdjNIh59fPS5QYh9idgWdZrLsuPHEuKM3Vl3uvpIPUU1xnT53QMSPyTHwNei3Rjvga4SrqQ38ItowlIkpTHzjnIZ+v6JNUsLe4ZDuf4kEE7zMfp8z+ZmNtsRMyWy2Le5MpeEfT1gSnJ9zOl+S1/77YkcQCFqo/MbRSgcjicVN35aHwsE702KF1ABSokan1yF6uSRObIUpf1kRkMl+TSRPATKojB+yKD1jkTQMMOorxmyV2B8cKNQa9j5DHP+YMOMQOC3yGRSpbeTG0m1ejoUS4eCMhSEJqnU3FBqiHMTX6Me8erbBzebiw4HGqdKant45jKNNvlmAvsV9KllNlcnJm02zAuc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR04MB7737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wjk5TC94MFl0MWtPR0lrcFhxSjFWSklzcGU1Z2g1VmJrZFpmQnYxVzZIY2hk?=
 =?utf-8?B?STFaZWw0L29HMmJKdXpOdVlmVmZsNlRZL1l6cmdSZzYvRHA1MGpaY3I4aEY2?=
 =?utf-8?B?OWo3aTRiRjBDOHRpeFg2VmhjZnBvMVhaa0VKd1laS3hJdlNRVE9hL0htRlRr?=
 =?utf-8?B?R1pFZElwb1YxeVZ1TEdad2Q1Z29SaW9QSlZXaFlBSmZCSGRXaGxRNWo1cjd4?=
 =?utf-8?B?Z3EwSHVNUXk5K3VYKzNRS0p5aHhGbE4ybm05ZlZBeWJ1N1hBN0tFdkxGRVBW?=
 =?utf-8?B?TkExZEZld2pzVGIxK2dETlNaT3Q5SXE3UnhDdGUwei9VNXFnRkxkM0dHWmdN?=
 =?utf-8?B?NndIMysrVG95ZjhJaFJrQXNseEpMK1BzdGNaaFM4eWVOOXlSc2dJaTNrNWNs?=
 =?utf-8?B?aEhDSGhWZCszMXNnb2F1UmlSbFk2S0YxNkhKTFUzOHBubFFtc1dnektFdVFh?=
 =?utf-8?B?cytES0xadDFxdmNFYkRQR002b0ZMa3VSOGJkemF2SXZ0M0Uvc1BhSFZhNldu?=
 =?utf-8?B?c3BGMERkMnlibXAxYjMwNjZPSEkrZkR1VXhzekszYWd0bWRlUkZrYVovVXg3?=
 =?utf-8?B?UDhrS3Q2Qll2NmcrRkdQR3RXRXlwaFhWQW83ZjYzK0NUd0doQVdlUGRNbGo0?=
 =?utf-8?B?SFFiTUI4WFJXVlc5RDJNQ0huVk8weE9wRjhRbFFjRjhuVWE3OUdEWXpGWnNM?=
 =?utf-8?B?dDJ2cnlIZERNUnk5Z0hUVk1HQndLcVdmdkNiMEQ3QXBPMVZpNkhKc1NnYjNJ?=
 =?utf-8?B?S2MrTENEQVBCZExCSUZNcSt6dGtGWjN0NDZmLzljOVNTdXZjS0xYU2kvcDBJ?=
 =?utf-8?B?TFRMU01DbEdaT0o5eWRhOUQvTnpvd3ZLYndzcW9YVmNwNHJKWEhpSVVFKzRW?=
 =?utf-8?B?MkwycXQ5UFAyd3RGNk1JUXJiZjd6ZCthcmJXWHRxajViN2UwYlpTZFFubmpz?=
 =?utf-8?B?VFhpMVZjdk1IUnE3alNTV1N5cmZxT1BpdHZpazRadHZVQzRqRlJQNnZRd1Uv?=
 =?utf-8?B?WWxCWFJ1ajV2cGN0a2JhNis4SHE3MDQ5cjEwZ1h5NW9kV0kvanRMNnM0TGVJ?=
 =?utf-8?B?U3hQbFcyampyMW9jVitISC9JUExoaGlvUzVBM0ZCWVVsTEQ4NnN2NE5jWWlI?=
 =?utf-8?B?SzlMeEFONE10cURZVU5hWXhTaFl3MHMxYnF6eHJMWVFtMmxSYjhiaTZ5MkNv?=
 =?utf-8?B?SVRlMjRXRENvZ3M5bUc4UHJ6Nis3Mkk4U2hNUUNiUWh5dUI2MzVFb241YXFk?=
 =?utf-8?B?S1NGRk1qWUVScU5hOXlLTGkxSkNzZjJFdm1mTHV3K2p3OTdDbDJWaDJsY0lq?=
 =?utf-8?B?cnd5SEJlNHphblVRTi9uMkN5T2UyUEk3NnR5VXVoL0xnWFM1OGtyTzlNSytu?=
 =?utf-8?B?NkFYNFQ5QUk1eWY1VXNpOVYwRkRRdkpteTJNZnZadHAyOExJSXJVeWgwM0lN?=
 =?utf-8?B?Q2U3N213OGpSU1JucjlLaWdDZHFvVk9scnJSSWNsTmYzYWk2TGQwbFFjcmFo?=
 =?utf-8?B?VW5YWE1zTHZUMEVHNWVVczkwMnE2V2xWVnpLTTVDcitWVmdQeEJWYzNFcXll?=
 =?utf-8?B?MVI2eVF3cEtNaVFWbDEza1M0eEQrT3JlUjFWdGJwVmkxMk9SZTd5Z1Y0SCt3?=
 =?utf-8?B?NjRrSUNLWXo2Umo4M2JnY3dCMktVZ0dzTmR3T0I0QnYxSzllcGpvREdFS1Ew?=
 =?utf-8?B?N09RL1dlSjRKQXdsY1BveWNqSzlPLzIzOVRrZEM5blcrMkoxYldiZkcvekg5?=
 =?utf-8?B?ZkR2V2Z5bkxqSU9zNGNPMFp3aHZSejNRb0g2VXZibDRPUUFPK05wVmcyQUYy?=
 =?utf-8?B?eThYOTJrR0NkTUFRVndEaWdSLzFLVWtwVEtOblNTTlpxUW94K3puZ2EwV01U?=
 =?utf-8?B?TU1sTlptUXZFTjRuWm41Rm91UXppMGZuVUh0cWdIdGVTQitKSzkxNllyMCsr?=
 =?utf-8?B?KzNCclphR1RxVDFTWUptSXgxaldyZzZKSHRmdW5NdWY5ck03cy96MjFLcGxP?=
 =?utf-8?B?cnJVZFlTRlFNOG5aakthMjdNc2lIL3AwaEVjWGdsM21RbTBYNnhZTHRGdER0?=
 =?utf-8?B?aXQ5K3pDRHcyR08vR0swci9WVnZuaDBXNmF3V3QzMHZTRTNDNkI4b2o3NWVS?=
 =?utf-8?B?bVY1ZVRWS3Q4OHNFMmZJaUVzOGlwNUlnTHFnZmpmUW9FNkNpMVRyYUdBeEZp?=
 =?utf-8?B?K1lYSXQ2eFlRdGxLMUgvODhLQVlTc3NUeXRiN0VrVXFKenlieW1odk1nSE4x?=
 =?utf-8?B?UndpSXV0RDNoTEdPWVNGc2FjTFdPQWxGWHlZNktXSWc3RUtiQUsvUDZDZXFS?=
 =?utf-8?B?bTdrQ3k2SFVJZWhWUWd4RzM4Mk1IWDZ5MXR0VVZiTnFrcEU4Q0FpUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 030d4903-f9a2-484c-6860-08ded8e4584c
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 09:20:38.0310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uswEy0qjQ/Cpaw8hbPShJCmGsp3blL2H/3dGbUhJh74/fgc1J+aIWXu7cc75rL5NYYeqBKi36VC877D+L6OsCZWvSNN6blIEDhEw/wEaybs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8746
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLW3hxHnDCq9GfCJsauRojCvMcnWcNwDcC33Frfca+w=;
 b=gvbQqIH1ZmSk8IO3fFwh6/Kmz2PTVrm14ajEnc+96KMymTgjKcd2cXeDb1AJI+6/UblvZH9Hs+HXru5fo2OGUB7GjCHF2cU/5Ip6YP87KQQmjqLifoCLk0tZ4THDIIvTVSd74EpjePDwlStJFpNtd8zQ3EEmwt1g2hrCedhX+w0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=gvbQqIH1
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH 1/1] docs/website: link LTS tooling
 documentation and staging branch
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Thanks for doing this!

On 7/2/26 10:30 PM, Thomas Perale via buildroot wrote:
> Users asked where the notes are available and if the information are
> publicly available.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>   docs/website/lts.html | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/docs/website/lts.html b/docs/website/lts.html
> index 3bfd2a4374..9252127a50 100644
> --- a/docs/website/lts.html
> +++ b/docs/website/lts.html
> @@ -180,13 +180,17 @@
>       Each week, the LTS stewards define the set of commits to
>       analyze based on the previous week's commits to the master branch. The
>       commits are then annotated to define a list of candidates for the LTS
> -    branches.
> -    <br><br>
> -    On Thursday, the candidates are cherry-picked to a staging branch to be
> -    reviewed by the other maintainers. On Thursday evening the branch is
> -    synced with upstream and contributors are notified. Feedback from
> -    users, sponsors and autobuilders are then collected and vulnerability
> -    analyses updated.
> +    branches.<br>
> +    For more information about the development workflow, see the
> +    <a href="https://gitlab.com/buildroot.org/buildroot-lts-tools/-/blob/main/tools/README.md">documentation</a>.
> +    </p>
> +    <p>
> +    On Thursday, the candidates are cherry-picked to a
> +    <a href="https://gitlab.com/essensium-mind/buildroot/-/commits/2025.02.pre">staging branch</a>

Two issues with this. The first is that it applies only to 2025.02.x 
branch but there are at least two LTSes at one point in time (e.g. 
today, 2026.05.x). Second, this link will likely be forgotten and it'll 
stay for that branch even once 2025.02.x is EOL.

I would recommend simply pointing at 
https://gitlab.com/essensium-mind/buildroot and explaining the staging 
branch is named after the initial release of the LTS, e.g. 2025.02, with 
the .pre suffix. Or simply point to 
https://gitlab.com/essensium-mind/buildroot/-/branches where one could 
see all the active branches and extrapolate the information by themselves?

Don't hesitate to Cc me on a v2.

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
