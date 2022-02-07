Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69285C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 13:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D49AD60BBC;
	Mon,  7 Feb 2022 13:38:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id otGYpqMbe8J4; Mon,  7 Feb 2022 13:38:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C1DA60B20;
	Mon,  7 Feb 2022 13:38:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 409321BF29D
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 13:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CA0C4011A
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 13:38:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fxw2qE9hs8ew for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 13:38:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0126940102
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 13:38:17 +0000 (UTC)
Received: from host-79-2-93-196.business.telecomitalia.it ([79.2.93.196]:55266
 helo=[192.168.101.73])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nH4Df-0003QP-Bk; Mon, 07 Feb 2022 14:38:15 +0100
Message-ID: <16f4b7bf-546b-3bf4-c6a3-b711c8cfcadb@lucaceresoli.net>
Date: Mon, 7 Feb 2022 14:38:15 +0100
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
 <032d657b-eb9a-2dc9-f60b-8536f1fc6c57@lucaceresoli.net>
 <SJ0PR02MB7758A5DBC6DD4DA837E0F47FD72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <SJ0PR02MB7758129FFD78D128D3393198D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <SJ0PR02MB7758129FFD78D128D3393198D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
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

On 07/02/22 14:00, Neal Frager wrote:
> Hi Luca,
> 
>> The zcu106 defconfig currently in Buildroot uses a pmufw that has a hard-coded pm_cfg_obj for zcu106 in its default Vivado configuration. It is an old and unflexible hack that required a different pmufw binary for each zynqmp hardware _and_ peripheral configuration (or other solutions like a "wildcard" configuration).
> 
>> Nowadays pmufw images do not contain a pm_cfg_obj anymore, as it gets passed from U-Boot SPL at runtime [0]. This allows to use the same pmufw binary for all zynqmp designs.
> 
>> This means you should provide a pm_cfg_obj.c file in boards/ and put the path to that file in BR2_TARGET_UBOOT_ZYNQMP_PM_CFG. It will be built in U-Boot SPL, which will pass it at runtime to the PMUFW.
> 
>> Note that you could handle similarly the psu_init_gpl.c: provide one in boards/ and put its path in BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE. But since U-Boot has a builtin psu_init_gpl for the ZCU106 (and 102 too) then you should not need do anything. It's for other boards not supported in U-Boot.
> 
>> [0] https://lucaceresoli.net/zynqmp-uboot-spl-pmufw-cfg-load/
> 
> I tried this method, but I am getting the error below.  Do you have any ideas?  Attached you can find the pm_cfg_obj.c source file that comes with Xilinx 2021.2.
> 
> cp /buildroot/output/images/bl31.bin /buildroot/output/build/uboot-xlnx_rebase_v2021.01_2021.2/
> /buildroot/output/build/uboot-xlnx_rebase_v2021.01_2021.2/tools/zynqmp_pm_cfg_obj_convert.py "board/zynqmp/pm_cfg_obj.c" "/buildroot/output/build/uboot-xlnx_rebase_v2021.01_2021.2/pm_cfg_obj.bin"
> package/pkg-generic.mk:289: recipe for target '/buildroot/output/build/uboot-xlnx_rebase_v2021.01_2021.2/.stamp_built' failed Traceback (most recent call last):
>   File "/buildroot/output/build/uboot-xlnx_rebase_v2021.01_2021.2/tools/zynqmp_pm_cfg_obj_convert.py", line 293, in <module>
>     code, flags=re.DOTALL).group(1)
> AttributeError: 'NoneType' object has no attribute 'group'

Vitis 2020.1 changed the format of pm_cfg_obj.c. There's a fix commit
[0] in U-Boot 2021.04 but as you are based on 2021.01 you don't have it.

You have two options to use that fix:
 1. use U-Boot >= 2021.04
 2. provide that commit as a patch to the uboot package in Buildroot

To go for option 2, you'll have to put the patch in the
BR2_GLOBAL_PATCH_DIR, and of course _not_ remove BR2_GLOBAL_PATCH_DIR
from the defconfig as you would otherwise.

Hint to create the patch file:
  cd <u-boot-clone>
  git format-patch -1 d42ab39f58e828c99a0cba6890e29986e87d11f5
  mv 0001-*.patch <path-to-buildroot>/board/zynqmp/patches/uboot/
Then add a "Backported from:" line to the patch (see [1])

[0]
https://source.denx.de/u-boot/u-boot/-/commit/d42ab39f58e828c99a0cba6890e29986e87d11f5

[1]
https://buildroot.org/downloads/manual/manual.html#_integrating_patches_found_on_the_web

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
