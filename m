Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18C9C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 22:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67CF060FB2;
	Thu, 14 Apr 2022 22:20:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id htLfhAuI-9S0; Thu, 14 Apr 2022 22:20:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5130260FB8;
	Thu, 14 Apr 2022 22:20:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 568E21BF408
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 22:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4503360F99
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 22:20:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z-ylgrXyWseU for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 22:20:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57DAE606F5
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 22:20:46 +0000 (UTC)
Received: from [77.244.183.192] (port=63002 helo=[192.168.178.75])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nf7pT-0007U5-K5; Fri, 15 Apr 2022 00:20:43 +0200
Message-ID: <ce6d3b44-bdad-3388-4fea-39f2d413b091@lucaceresoli.net>
Date: Fri, 15 Apr 2022 00:20:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: it-IT
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
References: <20220408145531.1641356-1-neal.frager@amd.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <20220408145531.1641356-1-neal.frager@amd.com>
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
Subject: Re: [Buildroot] [PATCH v1 1/4] configs/zynq_zc706_defconfig: bump
 to Xilinx 2021.2
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
Cc: giulio.benetti@benettiengineering.com, ju.o@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 08/04/22 16:55, Neal Frager wrote:
> This patch bumps configs/zynq_zc706_defconfig to Xilinx software release 2021.2
> which includes the following updates:
>   - U-Boot bumped to 2021.01
>   - Linux bumped to 5.10
>   - rootfs changed from CPIO to EXT4
>   - extlinux.conf for distro boot support
> 
> This patch has been build and run tested on a ZC706 evaluation board.

Thank you for these patches and apologies for the delayed reply.

I have one remark in addition to Arnout's.

> --- a/board/zynq/post-image.sh
> +++ b/board/zynq/post-image.sh
> @@ -1,13 +1,15 @@
>  #!/bin/sh
>  
> -# By default U-Boot loads DTB from a file named "devicetree.dtb", so
> +# By default U-Boot loads DTB from a file named "system.dtb", so
>  # let's use a symlink with that name that points to the *first*
>  # devicetree listed in the config.
>  
> -FIRST_DT=$(sed -n \
> -           's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9\-]*\).*"$/\1/p' \
> -           ${BR2_CONFIG})
> +FIRST_DT=$(sed -nr \
> +               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="([-_/[:alnum:]\\.]*).*"$|\1|p' \
> +               ${BR2_CONFIG})

Why do you need this change? I think the old, simpler sed expression
should be still working. BR2_LINUX_KERNEL_INTREE_DTS_NAME is not exev
changed by this patch.

Otherwise looks fine.

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
