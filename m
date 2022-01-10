Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8A8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 15:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B954C400B9;
	Mon, 10 Jan 2022 15:50:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nOEFK15dfxsC; Mon, 10 Jan 2022 15:50:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90B974018B;
	Mon, 10 Jan 2022 15:50:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 650131BF317
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 15:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 525D68266A
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 15:50:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6VaEPa9vR1EB for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 15:50:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0AF1282443
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 15:50:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8dcf:1110:8dc6:b258])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id C30A519F5C2;
 Mon, 10 Jan 2022 16:49:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641829798;
 bh=ECNkv4DKEb96fKJahz6O+qEchqws8YKirVGfTXlnpMU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GiXYJJC0O563Syfz0X4Bx0fS2QlgIcuyxAHJ8OWip243khH8HGe1H1gOTE+76S/5/
 C6Q3vR9yHXN7lFdN0HNMM3x84X3cv4YFnXZjdxW+KkKVDukVDHxWZ7kdgRLBT7D8HI
 +jvX2utPAWR3/jpR2SabgEx/wjRukK2CapSMd+LyxEyGo6gnIqFxM9zwzdt5tt0RKp
 Ueaf059Vcvs49+/uAnxl6VYF9OjlKrszJ32sumxCtozm2oRS2NAoZwah2kFn+dYnYV
 tj0qIrfr/bcmzIGmUE/r4Og/IFbycLRu9+vnJRRHBLYzmS8T4WrAdIIO29qMfbV6d/
 5lOGzQfKIXvFQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 10 Jan 2022 16:49:54 +0100
Date: Mon, 10 Jan 2022 16:49:54 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Cyril Bur <cyrilbur@gmail.com>
Message-ID: <20220110154954.GR1477939@scaer>
References: <20220110141140.77224ac0@camb691.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220110141140.77224ac0@camb691.localdomain>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3] package/python-greenlet: enable as host
 package
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
Cc: romain.naour@smile.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cyril, All,

On 2022-01-10 14:11 +0000, Cyril Bur spake thusly:
> While currently there is no in-tree Buildroot package which depends on
> host-python-greenlet, we (Adder Technology) have some proprietary
> modules that use it as part of their builds.
> 
> I've tested python-greenlet as host package and confirmed that it builds
> and works correctly. Someone else might require it, so I'm proposing its
> inclusion.

In all theory, host-python-greenlet should have the same dependencies
toward the host that the target variant has toward the target:

    config BR2_PACKAGE_PYTHON_GREENLET_ARCH_SUPPORTS
        bool
        default y if BR2_arm || BR2_armeb
        default y if BR2_aarch64
        default y if BR2_csky
        default y if BR2_m68k
        default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
        default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
        default y if BR2_riscv
        default y if BR2_sparc || BR2_sparc64
        default y if BR2_i386 || BR2_x86_64

However, in practice, hosts that are commonly used to run Buildroot are
virtually all in that list: x86 or x86_64, AArch64 (and maybe a very few
arms just for the fun), PPC, and maybe a few adventurous on riscv.

So in practice, we do not care.

> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v2: Half completed commit message update - sorry
> v3: Updated commit message and Config.in.host
> 
>  package/Config.in.host                     | 1 +
>  package/python-greenlet/Config.in.host     | 7 +++++++
>  package/python-greenlet/python-greenlet.mk | 1 +
>  3 files changed, 9 insertions(+)
>  create mode 100644 package/python-greenlet/Config.in.host
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> index b3e00bb482..6e027d96c2 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -69,6 +69,7 @@ menu "Host utilities"
>  	source "package/pwgen/Config.in.host"
>  	source "package/python/Config.in.host"
>  	source "package/python-cython/Config.in.host"
> +	source "package/python-greenlet/Config.in.host"
>  	source "package/python-lxml/Config.in.host"
>  	source "package/python-six/Config.in.host"
>  	source "package/python-xlrd/Config.in.host"
> diff --git a/package/python-greenlet/Config.in.host b/package/python-greenlet/Config.in.host
> new file mode 100644
> index 0000000000..673fee8cc5
> --- /dev/null
> +++ b/package/python-greenlet/Config.in.host
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_HOST_PYTHON_GREENLET
> +	bool "host python-greenlet"
> +	help
> +	  Greenlets are lightweight coroutines for in-process concurrent
> +	  programming.
> +
> +	  https://greenlet.readthedocs.io/
> diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
> index 7b983ff0ef..3b1ef7e314 100644
> --- a/package/python-greenlet/python-greenlet.mk
> +++ b/package/python-greenlet/python-greenlet.mk
> @@ -12,3 +12,4 @@ PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
>  PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
>  
>  $(eval $(python-package))
> +$(eval $(host-python-package))
> -- 
> 2.34.1
> 
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
