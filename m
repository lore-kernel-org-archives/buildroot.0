Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF22DC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 13:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BBC640A79;
	Mon, 15 Aug 2022 13:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BBC640A79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YBTyrucKCHvt; Mon, 15 Aug 2022 13:05:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E36E408E5;
	Mon, 15 Aug 2022 13:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E36E408E5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 41C541BF31B
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 13:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B7DB410E0
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 13:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B7DB410E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aYIOCwlPfOXG for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 13:05:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C20D1409A2
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C20D1409A2
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 13:05:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c91d:14e3:a117:34c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1B0EB6012C;
 Mon, 15 Aug 2022 15:05:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 Aug 2022 15:05:13 +0200
Date: Mon, 15 Aug 2022 15:05:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20220815130513.GX2854108@scaer>
References: <20220815111710.1459820-1-arnout@mind.be>
 <20220815111710.1459820-2-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815111710.1459820-2-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660568718;
 bh=E8jNwIleDIFJvdaKlYLlb8WvK0ZbIcSryYYCg41IezE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eeumJrNlKzevQuBXMiVkYJdTUI4LGvNM8gizO8rwv16D2ozBommc4pANKdiSEcfN8
 ieo9gOvR+U4xBNVIaojBDVNfvv0IBKTyvtP6qJm+N3mE1OVw8A3o7LyvCULhRsdsvl
 lVfLzOCSmIwIHYegoGMoJvOOO2T1amFftWvDx/xo4QanblqzU/pIM7eeTyn4FhpC9l
 niA6eniwttXzsIjCzEu9Ab9WEAMiEQjIDbS7I5TAWNaaiTO8zRK31mdLBwdJNsYqvB
 JzIne137z0VdPk3Rec6ot7D9KKe/z8JfMcpTjhy95tcSO32WMw0wvY/MJeTi03trgq
 QB+D9wOvxNQow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eeumJrNl
Subject: Re: [Buildroot] [PATCH next v5 2/3] fs/cpio: new option to use
 dracut tool
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
Cc: Adam Duskett <aduskett@gmail.com>,
 Thierry Bultel <thierry.bultel@linatsea.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-08-15 13:17 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> From: Thierry Bultel <thierry.bultel@linatsea.fr>
> 
> Adds an option to invoke the dracut host tool, providing
> a configuration file, instead of having a full cpio archive
> of the whole target directory.
[--SNIP--]
> diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
> index c1151a2881..de83aaad65 100644
> --- a/fs/cpio/Config.in
> +++ b/fs/cpio/Config.in
> @@ -7,6 +7,40 @@ config BR2_TARGET_ROOTFS_CPIO
>  
>  if BR2_TARGET_ROOTFS_CPIO
>  
> +choice
> +	prompt "cpio type"
> +	default BR2_TARGET_ROOTFS_CPIO_FULL
> +
> +config BR2_TARGET_ROOTFS_CPIO_FULL
> +	bool "cpio the whole root filesystem"
> +	help
> +	  Build a cpio archive containing the whole the root filesystem.
> +
> +config BR2_TARGET_ROOTFS_CPIO_DRACUT
> +	bool "Invoke dracut to make a partial initramfs"
> +	select BR2_PACKAGE_HOST_DRACUT
> +	select BR2_PACKAGE_HOST_UBOOT_TOOLS

As seen on IRC, host-uboot-tools are not required just for dracut.

> +if BR2_TARGET_ROOTFS_CPIO_DRACUT

Empty line after an 'if'...

> +config BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE
> +	string "dracut configuration file"
> +	default "fs/cpio/dracut.conf"
> +	help
> +	  Dracut configuration file. It determines which parts of the
> +	  rootfs get included in the cpio image. See dracut.conf(5) or
> +	  https://github.com/dracutdevs/dracut/blob/master/man/dracut.conf.5.asc
> +
> +	  The default configuration file is suitable for busybox init.
> +	  It doesn't, however, pivot_root into a full rootfs.

... and before an 'endif'.

> +endif
> +
>  choice
>  	prompt "Compression method"
>  	default BR2_TARGET_ROOTFS_CPIO_NONE
> diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
> index 81f8c393d1..b62d804ad8 100644
> --- a/fs/cpio/cpio.mk
> +++ b/fs/cpio/cpio.mk
> @@ -36,6 +36,8 @@ ROOTFS_CPIO_DEPENDENCIES += host-cpio
>  ROOTFS_CPIO_OPTS += --reproducible
>  endif
>  
> +ifeq ($(BR2_TARGET_ROOTFS_CPIO_FULL),y)
> +
>  define ROOTFS_CPIO_CMD

We customarily do not define the _CMD (or _CMDS) conditionally. Instead,
we define conditional macros, and we expand them all in an unconditional
_CMD (or _CMDS) macro.

>  	cd $(TARGET_DIR) && \
>  	find . \
> @@ -44,6 +46,37 @@ define ROOTFS_CPIO_CMD
>  	> $@
>  endef
>  
> +else ifeq ($(BR2_TARGET_ROOTFS_CPIO_DRACUT),y)
> +
> +ROOTFS_CPIO_DEPENDENCIES += host-dracut
> +
> +ifeq ($(BR_BUILDING):$(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE),y:)
> +$(error No dracut config file name specified, check your BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE setting)
> +endif
> +
> +ifeq ($(BR2_LINUX_KERNEL),y)
> +ROOTFS_CPIO_DEPENDENCIES += linux
> +ROOTFS_CPIO_OPTS += --kver $(LINUX_VERSION_PROBED)
> +else
> +ROOTFS_CPIO_OPTS += --no-kernel
> +endif
> +
> +define ROOTFS_CPIO_CMD
> +	mkdir -p $(ROOTFS_CPIO_DIR)/tmp
> +
> +	$(HOST_DIR)/bin/dracut \
> +		$(ROOTFS_CPIO_OPTS) \
> +		-c $(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE) \
> +		--sysroot $(TARGET_DIR) \

Hrmm.. --sysroot is misleading in our situation. Also, it can be spelt
-r so our wrapper must also cope with it (in case it is called from a
post-image script).

[--SNIP--]
> diff --git a/fs/cpio/dracut.conf b/fs/cpio/dracut.conf
> new file mode 100644
> index 0000000000..6184457723
> --- /dev/null
> +++ b/fs/cpio/dracut.conf
> @@ -0,0 +1,93 @@
[--SNIP--]
> +"
> +

Spurious emoty line at EOF.

Regards,
Yann E. MORIN.

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
