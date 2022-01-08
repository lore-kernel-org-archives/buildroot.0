Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856DAC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 19:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1486740232;
	Sat,  8 Jan 2022 19:40:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VvMmipGSzsIy; Sat,  8 Jan 2022 19:40:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25BB540204;
	Sat,  8 Jan 2022 19:40:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E3A181BF3C9
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E042981463
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:40:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8qQXie_ozAYc for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 19:40:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCFD881460
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 19:40:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4919:b1be:c8bf:308d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3851213F85A;
 Sat,  8 Jan 2022 20:40:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641670838;
 bh=54vud/BDHBe65RX+DhREspBOwRPBS5Uc1a9RukZIOd8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jvWovs6ajtEF1hQDJtEoXa7Jb9ZkGxYg12pY26pYnoOnmykGmZFDukKRoHyvQ+gEr
 FT+2RG06P6rdnlbNHVhHsNxKtVETyf2WW4EKwSIfLtBkkZEMy2a/zODLVFrhm1BSzU
 TCO0GKG1e+S5RFMEmMQkze0lMDy8os2VHXq9ogjaSzzE4a4APTp3gihnxndv3esLBM
 23wdysE9c9Qo3nG4fRcy3OzT3VCubVI4fhwJxIj9bo4WrUdq03wpZ9ziivkHGlnj1H
 NbR/3IeX4l3gmnLnfm2wCYgUfmCbSqHgXX/n+1GoksVcL1yHEvtPdlEVf4G5R5tlQe
 WMqy9s6w9+o5w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 08 Jan 2022 20:40:35 +0100
Date: Sat, 8 Jan 2022 20:40:35 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220108194035.GF1881783@scaer>
References: <20220108185713.3193240-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220108185713.3193240-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/btrfs-progs: disable zoned on
 host
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-01-08 19:57 +0100, Fabrice Fontaine spake thusly:
> Disable zoned on host variant to avoid the following build failure since
> bump to version 5.15.1 in commit
> 20181c3f1b7191d2b6a1b78bfbe32c1f58e87359 and
> https://github.com/kdave/btrfs-progs/commit/7953f4357bfc6c6526451bc889527b07f0840816:
> 
> checking linux/blkzoned.h usability... yes
> checking linux/blkzoned.h presence... yes
> checking for linux/blkzoned.h... yes
> checking for struct blk_zone.capacity... no
> checking for BLKGETZONESZ defined in linux/blkzoned.h... no
> configure: error: linux/blkzoned.h does not provide blk_zone.capacity
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/03235edd829436d784a9b214050cc97584f372fb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/btrfs-progs/btrfs-progs.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
> index 50c8e59e50..4c26cf0df5 100644
> --- a/package/btrfs-progs/btrfs-progs.mk
> +++ b/package/btrfs-progs/btrfs-progs.mk
> @@ -41,6 +41,7 @@ HOST_BTRFS_PROGS_DEPENDENCIES = host-util-linux host-lzo host-zlib
>  HOST_BTRFS_PROGS_CONF_OPTS = \
>  	--disable-backtrace \
>  	--disable-libudev \
> +	--disable-zoned \
>  	--disable-zstd \
>  	--disable-python \
>  	--disable-convert
> -- 
> 2.34.1
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
