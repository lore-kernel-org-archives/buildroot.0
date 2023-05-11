Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBCFC7EE22
	for <buildroot@archiver.kernel.org>; Thu, 11 May 2023 20:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 873416169E;
	Thu, 11 May 2023 20:44:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 873416169E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ft719GnOWgfX; Thu, 11 May 2023 20:44:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A60DA61698;
	Thu, 11 May 2023 20:44:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A60DA61698
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 07DE41BF283
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 20:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D408C83B10
 for <buildroot@lists.busybox.net>; Thu, 11 May 2023 20:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D408C83B10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XkXN_NhY4K90 for <buildroot@lists.busybox.net>;
 Thu, 11 May 2023 20:44:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6FFD822E0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6FFD822E0
 for <buildroot@buildroot.org>; Thu, 11 May 2023 20:44:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b925:bb32:bfe1:7e0e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 8A2CA20047F;
 Thu, 11 May 2023 22:44:02 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 May 2023 22:44:02 +0200
Date: Thu, 11 May 2023 22:44:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230511204402.GM252090@scaer>
References: <20230210233658.3763549-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230210233658.3763549-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683837844;
 bh=I6fWCcY6FII209Y/+68pcx1nEvLg/enLoHh1G8uft4U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qFphIbZB7unQ7LzFx7QfelnU5/DZqq7NOFrtsfLLvg0j3iPXKjchfINeV2pLzpjgi
 LtDnCzq2Z5r3R9vK7gJPdyPe57jD9c5oRvaa0rprhATuHLWs5N/zy/UMB7fEWAM0ap
 jVC9NuTZLpuqPcZRw+bjCn45c6+n6yhV5tIPdQhiGZH+sVfAlbw9qsjzoWWG49FMUN
 cr39UHB1dxEugCrWNRC/S8YHiUzsAbwfmfZds4KXQ80zbn6jFvunCw+vrINtja5jFQ
 l0928Nm4UpP7FqBwn/c280CHzxC/Jq/Mev9liBcD1tb8B/QgmoU4aREhRh43R8D9BT
 ECZQcl58/FjlQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qFphIbZB
Subject: Re: [Buildroot] [PATCH] package/busybox: disable stack optimization
 for i386 target
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

Romain, All,

On 2023-02-11 00:36 +0100, Romain Naour spake thusly:
> The toolchain-builder project reported an issue with Qemu 7.2.0 for
> x86-core2--glibc--bleeding-edge toolchain [1]:
> 
>   Run /sbin/init as init process
>   random: fast init done
>   EXT4-fs (vda): warning: mounting unchecked fs, running e2fsck is recommended
>   EXT4-fs (vda): re-mounted. Opts: (null). Quota mode: disabled.
>   Starting syslogd: OK
>   traps: syslogd[52] general protection fault ip:b7e21465 sp:bfe59e6c error:0 in libc.so.6[b7d9b000+123000]
>   Starting klogd: OK
>   traps: klogd[56] general protection fault ip:b7e94465 sp:bf8f069c error:0 in libc.so.6[b7e0e000+123000]
>   Running sysctl: traps: logger[62] general protection fault ip:b7e48b6c sp:bfd7d194 error:0 in libc.so.6[b7e05000+123000]
>   Segmentation fault
>   traps: logger[64] general protection fault ip:b7dd3b6c sp:bf9b8604 error:0 in libc.so.6[b7d90000+123000]
>   Segmentation fault
> 
>   (Followed by a kernel panic.)
> 
> Testing with the pevious Qemu release (7.1.0) allows to boot the system without any problem.
> 
> Building qemu sources between 7.1.0 and 7.2.0 allows to identify the first "bad" commit [2] and
> report to the Qemu project [3].
> 
> Thanks to Qemu maintainers review, several issues was noticed:
> 
>   "The default i386 busybox build config does not respect glibc's requirements around stack alignment
>   (see [4] for previous discussions and a workaround)."
> 
> Disabling CONFIG_STACK_OPTIMIZATION_386 option (as suggested in the Gentoo bug report) fixed the issue!
> 
> This option has been added and enabled by default in buxybox 1_29_0, so it was used since then the for
> Buildroot's qemu defconfig.
> 
> Note: The x86-i686--glibc--bleeding-edge (generic x86) doesn't trigger the issue with
> CONFIG_STACK_OPTIMIZATION_386 enabled.
> 
> Fixes:
> https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/3731683337
> 
> [1] https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/3731683337
> [2] https://gitlab.com/qemu-project/qemu/-/commit/958e1dd1300f37f18b2161dfb4eb806fc8c19b44
> [3] https://gitlab.com/qemu-project/qemu/-/issues/1478
> [4] https://bugs.gentoo.org/725674
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/busybox/busybox-minimal.config | 2 +-
>  package/busybox/busybox.config         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/busybox/busybox-minimal.config b/package/busybox/busybox-minimal.config
> index 1fb4e39e21..1e7ad1d357 100644
> --- a/package/busybox/busybox-minimal.config
> +++ b/package/busybox/busybox-minimal.config
> @@ -53,7 +53,7 @@ CONFIG_EXTRA_CFLAGS=""
>  CONFIG_EXTRA_LDFLAGS=""
>  CONFIG_EXTRA_LDLIBS=""
>  # CONFIG_USE_PORTABLE_CODE is not set
> -CONFIG_STACK_OPTIMIZATION_386=y
> +# CONFIG_STACK_OPTIMIZATION_386 is not set
>  CONFIG_STATIC_LIBGCC=y
>  
>  #
> diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
> index 4826fb8242..6e8bd2799d 100644
> --- a/package/busybox/busybox.config
> +++ b/package/busybox/busybox.config
> @@ -53,7 +53,7 @@ CONFIG_EXTRA_CFLAGS=""
>  CONFIG_EXTRA_LDFLAGS=""
>  CONFIG_EXTRA_LDLIBS=""
>  # CONFIG_USE_PORTABLE_CODE is not set
> -CONFIG_STACK_OPTIMIZATION_386=y
> +# CONFIG_STACK_OPTIMIZATION_386 is not set
>  CONFIG_STATIC_LIBGCC=y
>  
>  #
> -- 
> 2.34.3
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
