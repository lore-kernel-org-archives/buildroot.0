Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5ED8C433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 19:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 542D160BAC;
	Sat, 22 Jan 2022 19:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vRwICLIi91Co; Sat, 22 Jan 2022 19:10:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 862BB60AD4;
	Sat, 22 Jan 2022 19:10:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C65401BF95D
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 19:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B446560AD4
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 19:10:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B_FyIjUoR1OW for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 19:10:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 88F636076A
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 19:10:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8038:e8ec:605a:7149])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4935BB0054C;
 Sat, 22 Jan 2022 20:10:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642878621;
 bh=IZlt3eNkcIfeiGEXngYWSGcmm5SMcsltU6gqqSZrAwY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M/RJhOwUEnO8bDusudCYtiS2b/Du76OPVJ9BSpQnTQymCNyeDcR8LVsUHwG33/3ND
 jDR1LojD5QHX9Bje3zVB8kqxbdYWtjaM7NKViTyl1wpagaPtFzxEG0RzsqSeJgJRLH
 jhJ+bdn6rztgWYQFPezxLuDJMFMjt2EIxe50rKGUJpVXeOlC/rQ9TFzfnLOeDqHCBU
 bPFse3BcwXY32goHs4vzJEvW4INjaZYNFagVKJ/w499BVayDbh0BSyFToJADpqQrUh
 zQNBXe+vpvaZBHSmm21MKjUdHZOt+1S5ArIZNpTTZ7lb/0a73LNvpq7hutk33MR3uQ
 FubIYIQJbKKIA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 22 Jan 2022 20:10:16 +0100
Date: Sat, 22 Jan 2022 20:10:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220122191016.GA3621364@scaer>
References: <20220122153714.26991-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220122153714.26991-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/3] configs/qemu_aarch64_virt_defconfig:
 don't hard code getty port
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2022-01-22 16:37 +0100, Peter Korsgaard spake thusly:
> The Linux defconfig both has VT and serial port support, so it makes more
> sense to run getty on /dev/console instead of hard coding the serial port.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Series of 3 patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/qemu_aarch64_virt_defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
> index e6b72d8838..0caf38112d 100644
> --- a/configs/qemu_aarch64_virt_defconfig
> +++ b/configs/qemu_aarch64_virt_defconfig
> @@ -4,7 +4,6 @@ BR2_cortex_a53=y
>  
>  # System
>  BR2_SYSTEM_DHCP="eth0"
> -BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
>  
>  # Filesystem
>  BR2_TARGET_ROOTFS_EXT2=y
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
