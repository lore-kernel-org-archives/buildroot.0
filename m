Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF44DC43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 09:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B14161171;
	Mon, 25 Jul 2022 09:37:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B14161171
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YMS1O_PmWdXq; Mon, 25 Jul 2022 09:37:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 884DD610EE;
	Mon, 25 Jul 2022 09:37:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 884DD610EE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B0AD31BF3FD
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 09:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A7DE610EE
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 09:37:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A7DE610EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 780Y1R4ZbzQr for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 09:37:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7ECF96105B
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7ECF96105B
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 09:37:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9102:8e95:18fd:a25a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 13FE419F74B;
 Mon, 25 Jul 2022 11:37:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 25 Jul 2022 11:37:46 +0200
Date: Mon, 25 Jul 2022 11:37:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20220725093746.GC3168@scaer>
References: <20220725002414.704892-1-christian@paral.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220725002414.704892-1-christian@paral.in>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658741870;
 bh=+kbwZxKfH/5cuTg1/HaKGQU3KR5DkJwoIyEVultb04E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LPctm0BU6JHqStJLLl8bS92kQXU6EtNbMBJSuZEmWFd7TGLQFas6bA4AyM19RqXlE
 jPRXpwbofuF76c7N+ZuaWC3X599wZbOjbck11ewab5WCSi7ZDLJGgQlChjFlkR3fwy
 2laL8L9iU/KdZew6XOy6mgoiENRQCO7qLwaD8UhsJ6QesqxMD21Z4LjleejRAwj2Al
 Bft68tLFnVxzCJl7LfiTlhPMNyaaSW2hUup0x/LrWsLB0i/OjfJbVyw4LTLgkxKI0P
 JpOlFmTzS+2P57wf+9U9uKrdAcWf3y7vhM26nIJS5t9nqH+qkDel3ZPC9JenVOVEpg
 EPjWau85HNhUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LPctm0BU
Subject: Re: [Buildroot] [PATCH v4 1/1] package/runc: add host package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2022-07-24 17:24 -0700, Christian Stewart via buildroot spake thusly:
> Adds support for building runc as a host package.
> 
> The bin name and gomod have to be specified as the pkg-golang infrastructure
> assumes the bin name will be "host-runc" on default.

After a test build here, _BIN_NAME and _INSTALL_BINS really do not seem
needed, so I dropped them.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Christian Stewart <christian@paral.in>
> 
> ---
> 
> changes v3 -> v4:
> 
>  - drop unnecessary GOMOD line
>  - remove seccomp and apparmor tags for host package
>  - thanks Thomas for the review.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/Config.in.host      | 1 +
>  package/runc/Config.in.host | 8 ++++++++
>  package/runc/runc.mk        | 6 ++++++
>  3 files changed, 15 insertions(+)
>  create mode 100644 package/runc/Config.in.host
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 71f2a9311c..8078a8304d 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -82,6 +82,7 @@ menu "Host utilities"
>  	source "package/raspberrypi-usbboot/Config.in.host"
>  	source "package/rauc/Config.in.host"
>  	source "package/riscv-isa-sim/Config.in.host"
> +	source "package/runc/Config.in.host"
>  	source "package/rustc/Config.in.host"
>  	source "package/s6-rc/Config.in.host"
>  	source "package/sam-ba/Config.in.host"
> diff --git a/package/runc/Config.in.host b/package/runc/Config.in.host
> new file mode 100644
> index 0000000000..ce0dd518a6
> --- /dev/null
> +++ b/package/runc/Config.in.host
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_HOST_RUNC
> +	bool "host runc"
> +	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
> +	help
> +	  runC is a CLI tool for spawning and running containers
> +	  according to the OCP specification.
> +
> +	  https://github.com/opencontainers/runc
> diff --git a/package/runc/runc.mk b/package/runc/runc.mk
> index 5faa8b683d..8ccff13a3e 100644
> --- a/package/runc/runc.mk
> +++ b/package/runc/runc.mk
> @@ -23,4 +23,10 @@ RUNC_TAGS += seccomp
>  RUNC_DEPENDENCIES += libseccomp host-pkgconf
>  endif
>  
> +HOST_RUNC_BIN_NAME = runc
> +HOST_RUNC_LDFLAGS = $(RUNC_LDFLAGS)
> +HOST_RUNC_TAGS = cgo static_build
> +HOST_RUNC_INSTALL_BINS = $(HOST_RUNC_BIN_NAME)
> +
>  $(eval $(golang-package))
> +$(eval $(host-golang-package))
> -- 
> 2.35.1
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
