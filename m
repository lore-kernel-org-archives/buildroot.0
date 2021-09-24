Return-Path: <SRS0=IJqM=OO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CBCDC433F5
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 19:58:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4366A6103D
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 19:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4366A6103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C68060768;
	Fri, 24 Sep 2021 19:58:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UzBHcHTxSn38; Fri, 24 Sep 2021 19:58:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D3C660761;
	Fri, 24 Sep 2021 19:58:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 25B241BF870
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 19:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2112B40215
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 19:58:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DaJ6WBhU4KIs for <buildroot@lists.busybox.net>;
 Fri, 24 Sep 2021 19:58:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E798940168
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 19:58:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e5cb:5ead:8e76:4901])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 0A1377802BE;
 Fri, 24 Sep 2021 21:57:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632513482;
 bh=BRBkZ7E98LaUPbEMimp2UdBJ2aZy2u9A+MxNZEo8Mao=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sR3ayaDOAqZmwzeAgQxMP6+1zLPU4cMTYQkmB7U9d6EU22sRknYUw7Kd0nOg85lm1
 gBdCR8DFUTG7fNl9QWcZwNkDmgax50tyNVsPo8RU5WNfYUForAmjDjBMY5+vFICyzN
 1sRg8EGF7EKz+DL4Ad6TBooHaJ/5dXeqmbEsjxaXym3T9/Vi4oOJv8VxewfLZbjxR/
 QLTUhTZ3RSel533x+L4PE+Hy+1z2IeyL0xIKsABaLWka5FYFm0JYqWpbcrfgO/FM5H
 DngMLpoyl2MPOIeFV6r5KtntwYNu9axnco27HgKBAng3YsZY2SVl2M4hf42d4fyRyz
 0fLwYcpCM54Cg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 24 Sep 2021 21:57:55 +0200
Date: Fri, 24 Sep 2021 21:57:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Message-ID: <20210924195755.GG3176@scaer>
References: <20210924162349.2802374-1-quentin.schulz@theobroma-systems.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210924162349.2802374-1-quentin.schulz@theobroma-systems.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: point
 LICENSE_FILES to correct file
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quentin, All,

On 2021-09-24 18:23 +0200, Quentin Schulz spake thusly:
> Since v2.2 release (commits 8cc36aec912 "doc: De-duplicate readme and
> license files" and 9f1622b018ab "doc: Move content out of readme and
> create new index page "), the license.rst file at the root of the git
> repo is only telling to look at docs/license.rst file.
> 
> Let's point the ARM_TRUSTED_FIRMWARE_LICENSE_FILES to the correct file
> and modify the .hash file accordingly.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>  boot/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
> index 1ab50a9e28..80402ec374 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
>  sha256  d12a824afcc5cb90d005f9820f3274f1319cef1bb282e40a6a190b75900206d3  arm-trusted-firmware-v2.5.tar.gz
> -sha256  487795b8023df866259fa159bab94706b747fb0d623b7913f1c4955c0ab5f164  license.rst
> +sha256  0171b0795501ee90634fbc4a7835e2fb215d9423daf1cf5b0d0682adde12c597  docs/license.rst
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index 9d44a5df06..001121477a 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -21,7 +21,7 @@ ARM_TRUSTED_FIRMWARE_SITE = $(call github,ARM-software,arm-trusted-firmware,$(AR
>  # This is valid only for the official v1.4.

I've also tweaked this comment to no longer reference a specific
version, so that it is never wrong again.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION),y)
>  ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
> -ARM_TRUSTED_FIRMWARE_LICENSE_FILES = license.rst
> +ARM_TRUSTED_FIRMWARE_LICENSE_FILES = docs/license.rst
>  endif
>  endif
>  
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
