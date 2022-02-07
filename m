Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A291BC433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 10:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 612C981382;
	Mon,  7 Feb 2022 10:25:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sf7RAQOEWv-k; Mon,  7 Feb 2022 10:25:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B99B812B4;
	Mon,  7 Feb 2022 10:25:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 169B21BF41D
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 10:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04806600B5
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 10:25:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uPyy4RvKwsJM for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 10:25:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A123F6009C
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 10:25:18 +0000 (UTC)
Received: from host-79-2-93-196.business.telecomitalia.it ([79.2.93.196]:54306
 helo=[192.168.101.73])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nH1Cu-0004fq-DX; Mon, 07 Feb 2022 11:25:16 +0100
Message-ID: <032d657b-eb9a-2dc9-f60b-8536f1fc6c57@lucaceresoli.net>
Date: Mon, 7 Feb 2022 11:25:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Neal Frager <nealf@xilinx.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <SJ0PR02MB7758F655ACB4D148D78E403BD72B9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <0a82d8c7-a0c6-06a5-6a0b-788fd5c4a935@benettiengineering.com>
 <8be136a0-1263-3b17-0b78-b7d34ef146c2@lucaceresoli.net>
 <SJ0PR02MB775843B513EA2CAFD0FEBD82D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <SJ0PR02MB775843B513EA2CAFD0FEBD82D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] Xilinx zynqmp_zcu10x_defconfigs: two things left
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 07/02/22 10:34, Neal Frager wrote:
> Adding buildroot ML on copy of discussion:
> 
> Hi Neal, Giulio,
> 
> Neal, it's better to send technical discussion e-mail on the Buildroot mailing list: you'll get more replies, less latency and other people can benefit from the discussion (now and in the future).

Thanks for adding the ML in the loop!

> 
> On 06/02/22 23:20, Giulio Benetti wrote:
>> Hi Neal,
>>
>> On 06/02/22 20:27, Neal Frager wrote:
>>> Hi Giulio, Luca,
>>>
>>> I now have a version of the defconfigs which will at least build 
>>> cleanly with buildroot without requiring any manual steps.  However, 
>>> in order to get Linux to boot and login to the rootfs, I am still 
>>> doing two manual things to make this happen.  If our goal is to make 
>>> defconfigs that just boot, then we need to find a solution to make 
>>> these two manual things included with the buildroot build automation.
>>>
>>> 1. PMU firmware configuration object.  Without configuring the 
>>> following U-Boot .config option, the PMU firmware does not appear to 
>>> be working properly.  I have been fixing this manually by adding this 
>>> configuration, rebuilding U-Boot, and then copying the results into 
>>> the output/images directory.  While this works, it is not a clean out 
>>> of box experience for new users.
>>>
>>> CONFIG_ZYNQMP_SPL_PM_CFG_OBJ_FILE
>>>
>>> Is there a buildroot config option like BR2_TARGET_UBOOT_ZYNQMP_PMUFW 
>>> available that can be used for configuring this with the automated 
>>> build process?
>>
>> There is a better option I think:
>> BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES
> 
> Even better, use BR2_TARGET_UBOOT_ZYNQMP_PM_CFG Buildroot option (Bootloaders -> U-Boot -> Boot on the Xilinx ZynqMP SoCs). It is specifically done for that purpose.

In reply to your additional question (sent privately):

> Thank you for sharing this option.  That should work well.  But where
> will it get the pmu_obj.bin file from?  Do we need to put that file on
> your git as well, so that it can get automatically downloaded at build
> time?

The zcu106 defconfig currently in Buildroot uses a pmufw that has a
hard-coded pm_cfg_obj for zcu106 in its default Vivado configuration. It
is an old and unflexible hack that required a different pmufw binary for
each zynqmp hardware _and_ peripheral configuration (or other solutions
like a "wildcard" configuration).

Nowadays pmufw images do not contain a pm_cfg_obj anymore, as it gets
passed from U-Boot SPL at runtime [0]. This allows to use the same pmufw
binary for all zynqmp designs.

This means you should provide a pm_cfg_obj.c file in boards/ and put the
path to that file in BR2_TARGET_UBOOT_ZYNQMP_PM_CFG. It will be built in
U-Boot SPL, which will pass it at runtime to the PMUFW.

Note that you could handle similarly the psu_init_gpl.c: provide one in
boards/ and put its path in BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE. But
since U-Boot has a builtin psu_init_gpl for the ZCU106 (and 102 too)
then you should not need do anything. It's for other boards not
supported in U-Boot.

[0] https://lucaceresoli.net/zynqmp-uboot-spl-pmufw-cfg-load/

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
