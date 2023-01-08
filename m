Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C61C53210
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 16:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A02D81D11;
	Sun,  8 Jan 2023 16:12:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A02D81D11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jeh7FLMvgFI8; Sun,  8 Jan 2023 16:12:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8135E81CEF;
	Sun,  8 Jan 2023 16:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8135E81CEF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0673A1BF304
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 16:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E31A660A69
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 16:12:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E31A660A69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4vx0_RtWtrA8 for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 16:12:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E247D60A68
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E247D60A68
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 16:12:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 2BCBB5FFBE;
 Sun,  8 Jan 2023 17:12:20 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 08 Jan 2023 17:12:19 +0100
Date: Sun, 8 Jan 2023 17:12:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20230108161219.GF151997@scaer>
References: <20221006140754.46144-1-tianyuanhao3@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221006140754.46144-1-tianyuanhao3@163.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673194342;
 bh=v6sxG16hssb7u4aNriZ0v/RFtsyEaFO6qX+i95FCt/Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ASFst2Pi0DOHVjaqSqfj51RgxKQMQMApoXHsbTKG+yGnyoOWUh3T16P33xi2nJUsh
 Zd7L9F43dPw+PLS3rxtSui75QwA9qegOh9OCWvAzIu4vjC2MUvZN30vPZLryYGb5eW
 Fpy3dR3ENmB/xkzddjQfT+aC2/7ShOY96WUneCUZ1+yu9np0joNdo14N2gGZdgmxdy
 j78rFD4D62b243jGXgBgMjjCgY9r0yFv8fPddBRY4dBr0GNry9oC6uINY4BEAuwnb/
 Klpt9ErE62uzy3s97c1Rd6/cyK7COTT0Xz5j8Wh8cVskhQfJQ0fjUQTMZu9LYRaJQT
 0e/WyFveXt3tg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ASFst2Pi
Subject: Re: [Buildroot] [PATCH 1/1] package/crun: support crun as runtime
 in containerd
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

Yuanhao, All,

On 2022-10-06 07:07 -0700, TIAN Yuanhao spake thusly:
> Create runc symlink to crun when runc is missing.

I've split this patch in two, as they are semantically separate:
 1. have crun impersonate runc if the latter is not enabled,
 2. do not force runc in containerd if crun is enabled

Indeed, one may very well want to use crun as an anternative to runc,
even without using containerd.

> See: https://github.com/containerd/containerd/discussions/6162
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/containerd/Config.in | 2 +-
>  package/crun/crun.mk         | 7 +++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/containerd/Config.in b/package/containerd/Config.in
> index 0e3a55ef39..e69dd6768a 100644
> --- a/package/containerd/Config.in
> +++ b/package/containerd/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_CONTAINERD
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_TOOLCHAIN_USES_UCLIBC # runc
>  	depends on BR2_USE_MMU # util-linux
> -	select BR2_PACKAGE_RUNC # runtime dependency
> +	select BR2_PACKAGE_RUNC if !BR2_PACKAGE_CRUN # runtime dependency
>  	select BR2_PACKAGE_UTIL_LINUX # runtime dependency
>  	select BR2_PACKAGE_UTIL_LINUX_BINARIES
>  	select BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
> diff --git a/package/crun/crun.mk b/package/crun/crun.mk
> index 4a0c150594..19dda71a9f 100644
> --- a/package/crun/crun.mk
> +++ b/package/crun/crun.mk
> @@ -36,4 +36,11 @@ else
>  CRUN_CONF_OPTS += --disable-systemd
>  endif
>  
> +ifeq ($(BR2_PACKAGE_RUNC),)
> +define CRUN_CREATE_SYMLINK
> +	ln -sf crun $(TARGET_DIR)/usr/bin/runc
> +endef
> +CRUN_POST_INSTALL_TARGET_HOOKS += CRUN_CREATE_SYMLINK
> +endif
> +
>  $(eval $(autotools-package))
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
