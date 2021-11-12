Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E44CC433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:14:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 487C360ED4
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 487C360ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 137AF404CF;
	Fri, 12 Nov 2021 22:14:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pnp9SUzgivlU; Fri, 12 Nov 2021 22:14:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E241940183;
	Fri, 12 Nov 2021 22:14:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C82E41BF3A3
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B892A827C9
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:14:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bm0EVkdFgVoc for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 22:14:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D377F827B5
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 22:14:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.1.143.61])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 9126419F522;
 Fri, 12 Nov 2021 23:14:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636755263;
 bh=1hK9kpUdjc8b+6t4Tp6DrPJSBlIzEaJHrBcUeAa1b+4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IJcEpDzIGXpr32ec3uicCeyXPK/FmB7komXyrABHEy4UMOtg1a0BWjyIQ76sKcufW
 1Ws4O/Hjz/aA1ezFdq4tYlkKI2BmMSA8ULNKox9Ni70VZVT/fMAyr9ioXu5vn5HlBX
 dv9tQbcPXxu4H1ShgcEjG/9goV3UOn1fJknHvJETAZQ6N5YjsCu2GhWFh/dYtnqIDH
 91rrIpoFa4szXZu7Vb4cfYmOZVjV6hXRyFkOB8eEZExqTg8SuNTUUivv64x7JIhFH7
 ZkQ8KVWUMiiLmFEPSSCPF3nEcGwmM4aSdL0qfiykJ8P7lvaikJU3RMkjKiDWmBo1dx
 tClLFxNfQDpRQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 12 Nov 2021 23:14:13 +0100
Date: Fri, 12 Nov 2021 23:14:13 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211112221413.GG247986@scaer>
References: <20211111200439.15379-1-ps.report@gmx.net>
 <20211111200439.15379-3-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211111200439.15379-3-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH/next v1 3/7] package/rpi-userland: bump
 version to bab9bf8
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
Cc: Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2021-11-11 21:04 +0100, Peter Seiderer spake thusly:
> Changelog (since 6e8f786):
> 
>   - 7f72bc2 userland: Reduce debug_sym error messages
>   - 0093675 interface/vcos: Get rid of LLTHREAD cast warning
>   - 705ff8e hello_fft: Update outdated link to V3D spec
>   - bab9bf8 hello_fft: Remove unused function declaration
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rpi-userland/rpi-userland.hash | 2 +-
>  package/rpi-userland/rpi-userland.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
> index 4927a8b43b..da573f3eae 100644
> --- a/package/rpi-userland/rpi-userland.hash
> +++ b/package/rpi-userland/rpi-userland.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  e1ac871911e52b9fe07b3daa080b21bcdec3f1d2926cc98c934794780a4bf8d8  rpi-userland-6e8f786db223c2ab6eb9098a5cb0e5e1b25281cd.tar.gz
> +sha256  e1ac871911e52b9fe07b3daa080b21bcdec3f1d2926cc98c934794780a4bf8d8  rpi-userland-bab9bf8790cd69660d443ce43b4e372999f3f7ac.tar.gz
>  sha256  bee6f1249175683d8610651706e1aa7dffcbfd3f9c4c05bc1e5ab34f313c2db5  LICENCE
> diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
> index a670a4a02d..09a7f6af74 100644
> --- a/package/rpi-userland/rpi-userland.mk
> +++ b/package/rpi-userland/rpi-userland.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RPI_USERLAND_VERSION = 6e8f786db223c2ab6eb9098a5cb0e5e1b25281cd
> +RPI_USERLAND_VERSION = bab9bf8790cd69660d443ce43b4e372999f3f7ac
>  RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
>  RPI_USERLAND_LICENSE = BSD-3-Clause
>  RPI_USERLAND_LICENSE_FILES = LICENCE
> -- 
> 2.33.1
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
