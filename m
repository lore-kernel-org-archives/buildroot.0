Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C28C433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 19:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FEBF4027A;
	Sat, 22 Jan 2022 19:14:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e6sBearFGrHu; Sat, 22 Jan 2022 19:14:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F0204020B;
	Sat, 22 Jan 2022 19:14:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EFACD1BF574
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 19:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE6C082BA7
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 19:14:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qd8oHkefp_Y2 for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 19:14:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16FE782978
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 19:14:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8038:e8ec:605a:7149])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id DC6EAB004D5;
 Sat, 22 Jan 2022 20:14:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642878878;
 bh=i9QluejzzSR1PHsuOtItGl5WWd5Vl0+0dP9xJN2gEGM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OzsNMpQMwlwz5QC9IcBZ3x5oO2frYufj/DUmH+RitOJxv/qyQqXjkTIM4NBEKiIG2
 tPxxO5r5kgLAYhBOyj6muZYv0fsc2dDBiL7WDDI0c5M0hCJhF4+OdTivxhuEKvnASF
 YU0f357ogv3resEzj7wGQaPzsDRjDjVuT/X94oB2kJyQOp0hgyG9MAtp2hfUk+6Hda
 5D5PG0Bmx0WU2R0dwu9M+WLY4FPYLJ8KzBbeo/xwG+5Y+NDXV9t1Tm5JOeEk3AwkmN
 Qiu+OichoiGOKqaIbprOrUfsJ4Q4plPq7fIuQ6lrf9pADTGl3+TIYM+MQ6/nx80vx7
 0226qAmgitflw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 22 Jan 2022 20:14:34 +0100
Date: Sat, 22 Jan 2022 20:14:34 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20220122191434.GC3621364@scaer>
References: <20220122185049.1194-1-petr.vorel@gmail.com>
 <20220122185049.1194-2-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220122185049.1194-2-petr.vorel@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 2/2] package/nfs-utils: Update supported
 versions
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Petr, All,

On 2022-01-22 19:50 +0100, Petr Vorel spake thusly:
> Suggested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

The commit title was confusing, so I amended it a little, and applied
to master, thanks.

Regards,
Yann E. MORIN.

> ---
> New in v2
> 
>  package/nfs-utils/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
> index df9c12ca44..f00debc420 100644
> --- a/package/nfs-utils/Config.in
> +++ b/package/nfs-utils/Config.in
> @@ -12,6 +12,8 @@ config BR2_PACKAGE_NFS_UTILS
>  	help
>  	  The NFS Linux kernel server.
>  
> +	  Supports NFSv3 and optionally NFSv4 (and later).
> +
>  	  http://linux-nfs.org/
>  
>  if BR2_PACKAGE_NFS_UTILS
> @@ -24,7 +26,7 @@ config BR2_PACKAGE_NFS_UTILS_NFSV4
>  	select BR2_PACKAGE_LVM2
>  	select BR2_PACKAGE_SQLITE
>  	help
> -	  Enable NFSv4/NFSv4.1 support
> +	  Enable NFSv4/NFSv4.1/NFSv4.2 support
>  
>  comment "NFSv4/NFSv4.1 support needs a toolchain w/ dynamic library"
>  	depends on BR2_STATIC_LIBS
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
