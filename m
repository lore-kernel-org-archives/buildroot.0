Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68D2C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 17:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A425408EF;
	Wed, 23 Feb 2022 17:03:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UMx8qP2VD9Lm; Wed, 23 Feb 2022 17:03:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EA5D408EA;
	Wed, 23 Feb 2022 17:03:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6AE151BF5F8
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 17:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59A8560806
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 17:03:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8UUVziqeCj2H for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 17:03:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B906607B4
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 17:03:45 +0000 (UTC)
Received: from host-79-2-93-196.business.telecomitalia.it ([79.2.93.196]:50312
 helo=[192.168.101.73])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nMv3H-0004q6-3K; Wed, 23 Feb 2022 18:03:43 +0100
Message-ID: <3795ba01-3742-acce-9eeb-8c34a00bd941@lucaceresoli.net>
Date: Wed, 23 Feb 2022 18:03:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Neal Frager <nealf@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Peter Korsgaard <peter@korsgaard.com>
References: <20220223125118.2325363-1-neal.frager@xilinx.com>
 <SJ0PR02MB7758FF7514FC2ABEF4BF2F04D73C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <SJ0PR02MB7758FF7514FC2ABEF4BF2F04D73C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
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
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_zcu10x: fix U-Boot
 dts config
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
Cc: "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, Michal Simek <michals@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 23/02/22 15:30, Neal Frager wrote:
> Hi Peter,
> 
> +++ b/board/zynqmp/zcu106/uboot-fragment.config
> @@ -0,0 +1,2 @@
> +CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu106-revA"
> +
> 
> I tried your method of creating a uboot fragment config that just modifies the CONFIG_DEFAULT_DEVICE_TREE.
> 
> However, when I build, I get the following error:
> 
> Device Tree Source (arch/arm/dts/unset.dtb) is not correctly specified.
> Please define 'CONFIG_DEFAULT_DEVICE_TREE'
> or build with 'DEVICE_TREE=<device_tree>' argument

Strange, I just run a build with current master + your patch and it
succeeded.

> I can see that the U-Boot .config is correctly modified with
> CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu106-revA"

Here too.

Maybe try a completely clean build. What I usually do is

 git clean -xdf # similar to 'make clean' but faster
 make zynqmp_zcu106_defconfig
 make

And why not, do it in docker.

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
