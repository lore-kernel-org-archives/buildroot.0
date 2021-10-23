Return-Path: <SRS0=6sxh=PL=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96CD8C433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 09:50:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 138E360F4F
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 09:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 138E360F4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC53281992;
	Sat, 23 Oct 2021 09:50:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hH2WnGGZewAF; Sat, 23 Oct 2021 09:50:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31BEE8184F;
	Sat, 23 Oct 2021 09:50:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AEA1C1BF863
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 09:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E68A6062F
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 09:50:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nUDTUEb7BVFh for <buildroot@lists.busybox.net>;
 Sat, 23 Oct 2021 09:50:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 353D0600BB
 for <buildroot@buildroot.org>; Sat, 23 Oct 2021 09:50:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8808:9eee:e3e0:4a7a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id CAC50B0053E;
 Sat, 23 Oct 2021 11:50:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634982611;
 bh=Qgg2QVomANmbXL1fvFAvO1MK2UvpSxTNvy00KiXVD44=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qK++xY/aVobVkJvcElVwk9VsYJILDSksvOU2LpYcGDqNsidDsornk1SB6HrA85Y7e
 SWbxAm8NmvbRd7ntPP6KcnLQucR9xzTvnT67lLzYMm6zf+eIjuOIsR6nMngEDmnVoa
 ZYvGLArCoC/ixhK3LTnSuV9U/w+su15bWf3LfxUvLYUcuBPNeDNB97jyq1mu0yQz3x
 X4Z+c7dMR3BEg5RcWkQ8+U4MDXEZ6Tno1j1zAUJeuhtgepSfragFwD3cw5JzDgmiCE
 IIpkHmcq8q6USHFdwIGy73BElq8T/oiiRXR6bdDCxuJ7g0gFV95DbsMT0glvmGGYfH
 MsdRRrC0/wKFg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Oct 2021 11:50:02 +0200
Date: Sat, 23 Oct 2021 11:50:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20211023095002.GH2400@scaer>
References: <20211023043114.3208095-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211023043114.3208095-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/gpsd: bump to version 3.23.1
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Robert Hancock <robert.hancock@calian.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2021-10-22 22:31 -0600, James Hilliard spake thusly:
> Fixes:
> https://us-cert.cisa.gov/ncas/current-activity/2021/10/21/gps-daemon-gpsd-rollover-bug
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gpsd/gpsd.hash | 4 ++--
>  package/gpsd/gpsd.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gpsd/gpsd.hash b/package/gpsd/gpsd.hash
> index b91ab16e18..6d93e7b553 100644
> --- a/package/gpsd/gpsd.hash
> +++ b/package/gpsd/gpsd.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256	65504c3af8d3b0cce3c07405b8815d7730d2d2be2da7d28d275f1a9c57c6fe91	gpsd-3.21.tar.gz
> -sha256	fdf339997bbca9eaf507476b82fbcac608fc39a3d89b86b51e16db4c9f933716	COPYING
> +sha256  0b991ce9a46538c4ea450f7a8ee428ff44fb4f8d665fddf2ffe40fe0ae9a6c09  gpsd-3.23.1.tar.gz
> +sha256  fdf339997bbca9eaf507476b82fbcac608fc39a3d89b86b51e16db4c9f933716  COPYING
> diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
> index 45f6d35ef8..ff924c49e0 100644
> --- a/package/gpsd/gpsd.mk
> +++ b/package/gpsd/gpsd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GPSD_VERSION = 3.21
> +GPSD_VERSION = 3.23.1
>  GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
>  GPSD_LICENSE = BSD-2-Clause
>  GPSD_LICENSE_FILES = COPYING
> -- 
> 2.25.1
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
