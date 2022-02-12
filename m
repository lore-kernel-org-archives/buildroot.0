Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA51CC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 13:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71C02403A2;
	Sat, 12 Feb 2022 13:13:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DrbvAqEDhDnW; Sat, 12 Feb 2022 13:13:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 506DA40272;
	Sat, 12 Feb 2022 13:13:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5891F1BF283
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46F1D402B9
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:13:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DskyXyxeLmuN for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 13:13:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96670402B7
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 13:13:30 +0000 (UTC)
Received: from [77.244.183.192] (port=62284 helo=[192.168.178.41])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nIsDQ-0008X9-JD; Sat, 12 Feb 2022 14:13:28 +0100
Message-ID: <69189572-6eba-ed26-52dd-08a8b098f124@lucaceresoli.net>
Date: Sat, 12 Feb 2022 14:13:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: it-IT
To: Neal Frager <neal.frager@xilinx.com>, buildroot@buildroot.org
References: <20220211144402.1626443-1-neal.frager@xilinx.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <20220211144402.1626443-1-neal.frager@xilinx.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] [PATCH v6 1/2] configs/zynqmp_zcu106: bump
 ATF/U-Boot/Linux to Xilinx 2022
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
Cc: giulio.benetti@benettiengineering.com, michal.simek@xilinx.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 11/02/22 15:44, Neal Frager wrote:
[...]
> diff --git a/board/zynqmp/zcu106/pm_cfg_obj.c b/board/zynqmp/zcu106/pm_cfg_obj.c
> new file mode 100644
> index 0000000000..6d15d510e9
> --- /dev/null
> +++ b/board/zynqmp/zcu106/pm_cfg_obj.c
> @@ -0,0 +1,562 @@
> +/******************************************************************************
> +* Copyright (c) 2017 - 2021 Xilinx, Inc.  All rights reserved.
> +* SPDX-License-Identifier: MIT
> +******************************************************************************/
> +
> +#include "xil_types.h"
> +#include "pm_defs.h"
> +
> +#define PM_CONFIG_MASTER_SECTION_ID	0x101U
> +#define PM_CONFIG_SLAVE_SECTION_ID	0x102U
> +#define PM_CONFIG_PREALLOC_SECTION_ID	0x103U
> +#define PM_CONFIG_POWER_SECTION_ID	0x104U
> +#define PM_CONFIG_RESET_SECTION_ID	0x105U
> +#define PM_CONFIG_SHUTDOWN_SECTION_ID	0x106U
> +#define PM_CONFIG_SET_CONFIG_SECTION_ID	0x107U
> +#define PM_CONFIG_GPO_SECTION_ID	0x108U
> +
> +#define PM_SLAVE_FLAG_IS_SHAREABLE	0x1U
> +#define PM_MASTER_USING_SLAVE_MASK	0x2U
> +
> +#define PM_CONFIG_GPO1_MIO_PIN_34_MAP	(1U << 10U)
> +#define PM_CONFIG_GPO1_MIO_PIN_35_MAP	(1U << 11U)
> +#define PM_CONFIG_GPO1_MIO_PIN_36_MAP	(1U << 12U)
> +#define PM_CONFIG_GPO1_MIO_PIN_37_MAP	(1U << 13U)
> +
> +#define PM_CONFIG_GPO1_BIT_2_MASK	(1U << 2U)
> +#define PM_CONFIG_GPO1_BIT_3_MASK	(1U << 3U)
> +#define PM_CONFIG_GPO1_BIT_4_MASK	(1U << 4U)
> +#define PM_CONFIG_GPO1_BIT_5_MASK	(1U << 5U)
> +
> +#define SUSPEND_TIMEOUT	0xFFFFFFFFU
> +
> +#define PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK    0x00000001
> +#define PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK    0x00000100
> +#define PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK    0x00000200
> +
> +
> +
> +#if defined (__ICCARM__)
> +#pragma language=save
> +#pragma language=extended
> +#endif
> +#if defined (__GNUC__)
> +    const u32 XPm_ConfigObject[] __attribute__((used, section(".sys_cfg_data"))) =
> +#elif defined (__ICCARM__)
> +#pragma location = ".sys_cfg_data"
> +__root const u32 XPm_ConfigObject[] =
> +#endif
> +{
> +	/**********************************************************************/
> +	/* HEADER */
> +	2,	/* Number of remaining words in the header */
> +	8,	/* Number of sections included in config object */
> +	1U,	/* Type of config object as base */

Here's where you have manually replaced "PM_CONFIG_OBJECT_TYPE_BASE" ->
"1U", right? Well, it should be well noted in the commit message. This
file is supposed to be generated by Vitis and used untouched, any manual
edits whould be documented.

Or, even better, use the U-Boot patch I sent (see other e-mail I just
wrote) and use an unmodified pm_cfg_obj.c

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
