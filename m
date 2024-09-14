Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE99CC0218B
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EF208409B;
	Sat, 14 Sep 2024 09:24:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TBydWJE9XUw6; Sat, 14 Sep 2024 09:24:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D71B840AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D71B840AA;
	Sat, 14 Sep 2024 09:24:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DCFB41BF280
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAFB94061D
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-1ULlBKkcP7 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:24:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 31D31404DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31D31404DC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31D31404DC
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:24:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [IPv6:2a02:61:a2::3f4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 988F6780371;
 Sat, 14 Sep 2024 11:24:02 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 Sep 2024 11:24:02 +0200
Date: Sat, 14 Sep 2024 11:24:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZuVWMm4pkyz-M_IA@landeda>
References: <20240831120833.2915529-1-dario.binacchi@amarulasolutions.com>
 <20240831120833.2915529-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240831120833.2915529-2-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726305848;
 bh=uqbY5bTJ6VnzDSJRXtaFf7a/WuTvgWXcRzh8f06EZJE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aZtFewtYpqr4ckzRPjWI3ldQZMmVTYRE/g73gTLOV25B19t4HM4kxWOO54iesqErT
 Idzmz4zIWdIjsRc4Nd+12EbSwc0/EVM2+arPk20b4lnbuHnbXu2MbDK3reP//S0WfA
 qNrERKEdhG4u7OeGNTyMpJzLh6Xh2vU/DSMDcJqGMMPvJqtSUgE9hE7W9QUjHA0sW8
 RrA9MRWb7uePAHpC6yZxlP1lEwswwLuQnbKsrGvXNRhIB39F8m3JJjoqjVMjDgCTZ7
 U12G/oYCz+sfFk+Qsc2+xeb30mInpL2BJvHza5TFvnBr+EePc4+Ap4XSgPodbRg3xW
 CIUdznBA/A3jQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aZtFewtY
Subject: Re: [Buildroot] [PATCH v4 1/3] package/tinyinit: new package
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
Cc: Damien Le Moal <dlemoal@kernel.org>, linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2024-08-31 14:08 +0200, Dario Binacchi spake thusly:
> This package contains a Linux init script suitable for resource-limited
> systems which can be used as an alternative to the one provided by
> Busybox.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
[--SNIP--]
> diff --git a/package/tinyinit/Config.in b/package/tinyinit/Config.in
> new file mode 100644
> index 000000000000..f68b030e7e0f
> --- /dev/null
> +++ b/package/tinyinit/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_TINYINIT
> +	bool "tinyinit"
> +	depends on BR2_INIT_TINYINIT
> +	imply BR2_PACKAGE_BUSYBOX

As discussed with together with the other maintainers at the dev-days,
we concluded that we do not want to use 'imply', at least not in this
case.

Indeed, imply is a soft requirement, that makes the target enabled by
default, but can still be de-selectable. In our case, busybox is already
enabled by default, so 'imply' has no impact.

Applied to master with 'imply' dropped, thanks!

Regards,
Yann E. MORIN.

> +	help
> +	  A Linux tiny initialization script suitable for resource
> +	  limited systems, which can be used as an alternative to the
> +	  one provided by Busybox.
> diff --git a/package/tinyinit/init b/package/tinyinit/init
> new file mode 100644
> index 000000000000..fbcb481010c2
> --- /dev/null
> +++ b/package/tinyinit/init
> @@ -0,0 +1,32 @@
> +#!/bin/sh
> +
> +# This script replaces the default busybox init process to avoid having that
> +# process staying alive and sleeping in the background, (uselessly) consuming
> +# precious memory.
> +
> +# Mount procfs and sysfs
> +/bin/mount -t proc proc /proc
> +/bin/mount -t sysfs sysfs /sys
> +
> +# When the kernel is directly booted, devtmpfs is not automatically mounted.
> +# Manually mount it if needed.
> +devmnt=$(mount | grep -c devtmpfs)
> +if [ "${devmnt}" -eq 0 ]; then
> +    /bin/mount -t devtmpfs devtmpfs /dev
> +fi
> +
> +# Use the /dev/console device node from devtmpfs if possible to not
> +# confuse glibc's ttyname_r().
> +# This may fail (E.G. booted with console=), and errors from exec will
> +# terminate the shell, so use a subshell for the test
> +if (exec 0</dev/console) 2>/dev/null; then
> +    exec 0</dev/console
> +    exec 1>/dev/console
> +    exec 2>/dev/console
> +fi
> +
> +# Clear memory to reduce page fragmentation
> +echo 3 > /proc/sys/vm/drop_caches
> +
> +# Finally, let's start an interactive shell
> +exec /bin/sh
> diff --git a/package/tinyinit/tinyinit.mk b/package/tinyinit/tinyinit.mk
> new file mode 100644
> index 000000000000..ac1f0f736e38
> --- /dev/null
> +++ b/package/tinyinit/tinyinit.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# tinyinit
> +#
> +################################################################################
> +
> +define TINYINIT_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -D $(TINYINIT_PKGDIR)/init $(TARGET_DIR)/sbin/init
> +	# Downside: In non-initramfs systems the symlink isn't used/needed
> +	(cd $(TARGET_DIR); ln -sf /sbin/init init)
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/system/Config.in b/system/Config.in
> index d7d59db47db7..974152bd23e6 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -165,6 +165,15 @@ config BR2_INIT_TINI
>  
>  	  https://github.com/krallin/tini
>  
> +config BR2_INIT_TINYINIT
> +	bool "tiny init"
> +	select BR2_PACKAGE_TINYINIT
> +	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
> +	help
> +	  A Linux tiny initialization script suitable for resource
> +	  limited systems, which can be used as an alternative to the
> +	  one provided by Busybox.
> +
>  config BR2_INIT_NONE
>  	bool "Custom (none)"
>  	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
> -- 
> 2.43.0
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
