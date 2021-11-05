Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8980C433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:36:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F43360F9E
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F43360F9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55ECC826F5;
	Fri,  5 Nov 2021 21:36:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kswo5whzSAvl; Fri,  5 Nov 2021 21:36:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F80B826D5;
	Fri,  5 Nov 2021 21:36:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BBFE61BF5B5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8B51826D5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:36:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bpRBZMsIPAqV for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 21:36:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29E8D8242D
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 21:36:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9d6e:5497:a761:f603])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 782A85FFA0;
 Fri,  5 Nov 2021 22:36:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636148186;
 bh=LTXV85+f77EPQyisHhmGlztxdQsChomMh+hCU5XQ2Yg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k5+WN517zzInMRa4AcmW/Vg90jfKpYZPlW27PMWe3lsg5vYsUb2RZH92vAuZm1AoE
 PWRgpoPfjEHZJhzotfTpEGrs3YEQnKJP2FtUJQa6Ams5OOMaiYNfHMRCx0odrBwRmR
 tOiYO0YoTPonlgTGzfi0hZQkTK+VMR6JZxKLsXtSeXIJrlo+DABsHWf89p2U9g77k9
 72lo3vtuxcrNq2E4xC9lTWms0rW+4iDCsHiC6SrnwOvIVb6YiMjihLztmT++0V2Lpm
 WSLDvLrSPfhcF91JVR3POMQVYjGlHaZENORzKkzntjd57p/lxd1/XKD/1jbKZOR+Vr
 MoUph40+qCoEA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 05 Nov 2021 22:36:18 +0100
Date: Fri, 5 Nov 2021 22:36:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20211105213618.GI2400@scaer>
References: <20211105211423.941806-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211105211423.941806-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2] package/systemd: enable selinux xdg
 module for refpolicy
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
Cc: Antoine Tenart <atenart@kernel.org>, Adam Duskett <aduskett@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2021-11-05 22:14 +0100, Romain Naour spake thusly:
> Without the selinux xgd module enabled by systemd package, refpolicy
> fail to build due to policy/modules/system/systemd.te [1]
> 
> policy/modules/system/systemd.te:288:ERROR 'attribute xdg_config_type is not declared' at token ';' on line 508447:
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552468
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552470
> 
> [1] https://github.com/SELinuxProject/refpolicy/blob/RELEASE_2_20210908/policy/modules/system/systemd.te#L288
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Adam Duskett <aduskett@gmail.com>
> Cc: Antoine Tenart <atenart@kernel.org>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v2: enable xdg module from syslinux instead of refpolicy (Adam, Thomas)
>     http://lists.busybox.net/pipermail/buildroot/2021-November/627371.html
> ---
>  package/systemd/systemd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 8c187d2ec3..a8b11faa5e 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -20,7 +20,7 @@ SYSTEMD_DEPENDENCIES = \
>  	util-linux-libs \
>  	$(TARGET_NLS_DEPENDENCIES)
>  
> -SYSTEMD_SELINUX_MODULES = systemd udev
> +SYSTEMD_SELINUX_MODULES = systemd udev xdg
>  
>  SYSTEMD_PROVIDES = udev
>  
> -- 
> 2.31.1
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
