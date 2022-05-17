Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB5FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 06:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9554A40C73;
	Tue, 17 May 2022 06:10:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sZZuGiszIl3a; Tue, 17 May 2022 06:10:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7ABCF405AC;
	Tue, 17 May 2022 06:10:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F05C1BF309
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 06:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C866405AC
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 06:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hhgMHGmhWhmg for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 06:09:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F706400F1
 for <buildroot@buildroot.org>; Tue, 17 May 2022 06:09:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5536:e9db:e000:2fa9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 289E6B0056A;
 Tue, 17 May 2022 08:09:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652767795;
 bh=sCuBNvz2SVJ8bD6xFdBYYwQDo3ChUnMZ+dB0bQUiw+U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QsYLuflIycT71NGjlFtQD5lMGaXY/ibQZafJmkL/1hMpXgjCKvl+zMbvTQPgePIX4
 M8YyHUwbI0C6KMxPMxdbypqcM3MRktqp5+B1v5kToudIWxIj53RkOIbmCNGCFGix8b
 /y6fM3sroaM2aE8zeKpVnSSku2DctlHOOiJ0u7sUIcNHbwwCxrZ2iAUuZSfGMZ6XNU
 VMXBVp5ftFT7LWxdJqSdcbKa0YhTsKnSA1vvsPhkE1aUk+J4R/OQbnxBi1bZcD42Jj
 deQkRUiO8url7w1aByCkP3SSFFJVWWar843osyig5RzmgLAzEbMGgTYVYjUQFHBmmN
 rkhUC/E3ZWmrQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 17 May 2022 08:09:52 +0200
Date: Tue, 17 May 2022 08:09:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Linus Kaschulla <linus@cosmos-ink.net>
Message-ID: <20220517060952.GQ1597494@scaer>
References: <20220517032459.3400-1-linus@cosmos-ink.net>
 <20220517032459.3400-2-linus@cosmos-ink.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220517032459.3400-2-linus@cosmos-ink.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/2] fs/squashfs: Add option to compress
 with extreme options
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

Linus, All,

On 2022-05-17 03:24 +0000, Linus Kaschulla via buildroot spake thusly:
> mksquashfs allows to tweak many compressions parameters. Currently they
> can't be changed from kmenu. Leaving out potential space savings.
> 
> This adds the option to enable a set of predetermined compression
> options. This option is enabled by default for lz4 since lz4 currently
> implicitly added the extreme to it in the makefile. So this aids in
> keeping backward compatibility.
> 
> Signed-off-by: Linus Kaschulla <linus@cosmos-ink.net>
> ---
>  fs/squashfs/Config.in   | 26 ++++++++++++++++++++++++++
>  fs/squashfs/squashfs.mk |  6 +++++-
>  2 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
> index 341e50a08c..41c782105d 100644
> --- a/fs/squashfs/Config.in
> +++ b/fs/squashfs/Config.in
> @@ -89,4 +89,30 @@ config BR2_TARGET_ROOTFS_SQUASHFS4_ZSTD
>  
>  endchoice
>  
> +config BR2_TARGET_ROOTFS_SQUASHFS_EXTREME_COMP
> +	bool "extreme compression if possible"
> +	default BR2_TARGET_ROOTFS_SQUASHFS4_LZ4

This is technically correct, but we are not using that code style
anywhere else (that I am aware of), so I tweaked it to the more
tracitional form we use everywhere else. I also added a comment to
explain why it is:
    default y if BR2_TARGET_ROOTFS_SQUASHFS4_LZ4  # legacy

> +	help
> +	  Use options to increase compression ration as much as
> +	  possible, like using architecture-specific options, at
> +	  the cost of time when assembling the filesystem image.
> +
> +	  For example:
> +	   - with gzip and lzo, use -Xcompression-level 9
> +	   - with xz use a architecture specific bjc (branch-call-jump) filter
> +	   - with zstd use -Xcompression-level 22
> +	   - and more

    $ make check-package
    WARNING: fs/squashfs/Config.in:102: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

> +config BR2_TARGET_ROOTFS_SQUASHFS_COMP_OPTS
> +	string
> +	depends on BR2_TARGET_ROOTFS_SQUASHFS_EXTREME_COMP
> +	default "-Xcompression-level 9" if BR2_TARGET_ROOTFS_SQUASHFS4_GZIP
> +	default "-Xcompression-level 9" if BR2_TARGET_ROOTFS_SQUASHFS4_LZO
> +	default "-Xhc" if BR2_TARGET_ROOTFS_SQUASHFS4_LZ4
> +	default "-Xbcj arm,armthumb" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ && (BR2_arm || BR_aarch64)
> +	default "-Xbcj powerpc" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ && (BR2_powerpc || BR2_powerpc64)
> +	default "-Xbcj sparc" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ && (BR2_sparc || BR2_sparc64)
> +	default "-Xbcj x86" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ && (BR2_i386 || BR2_x86_64)
> +	default "-Xcompression-level 22" if BR2_TARGET_ROOTFS_SQUASHFS4_ZSTD

    $ make check-package
    WARNING: fs/squashfs/Config.in:109: attributes order: type, default, depends on, select, help (http://nightly.buildroot.org/#_config_files)

So I fixed that too.

>  endif
> diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
> index 1790773f7e..51f8d0d7c9 100644
> --- a/fs/squashfs/squashfs.mk
> +++ b/fs/squashfs/squashfs.mk
> @@ -25,7 +25,7 @@ ROOTFS_SQUASHFS_ARGS += -nopad
>  endif
>  
>  ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZ4),y)
> -ROOTFS_SQUASHFS_ARGS += -comp lz4 -Xhc
> +ROOTFS_SQUASHFS_ARGS += -comp lz4
>  else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZO),y)
>  ROOTFS_SQUASHFS_ARGS += -comp lzo
>  else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZMA),y)
> @@ -38,6 +38,10 @@ else
>  ROOTFS_SQUASHFS_ARGS += -comp gzip
>  endif
>  
> +ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS_EXTREME_COMP),y)
> +ROOTFS_SQUASHFS_ARGS += $(call qstrip,$(BR2_TARGET_ROOTFS_SQUASHFS_COMP_OPTS))
> +endif

If BR2_TARGET_ROOTFS_SQUASHFS_EXTREME_COMP is not set, or if no
condition match, then BR2_TARGET_ROOTFS_SQUASHFS_COMP_OPTS will be an
empty string, so we can just always expand it unconditionally.

Applied to master with the abov e fixed;
  - fix check-package
  - change the default code-style, add the legacy comment
  - always add the qstriped string, as it's empty when not used

Thanks!

Ditto, a test-case would be awesome!

Regards,
Yann E. MORIN.

>  define ROOTFS_SQUASHFS_CMD
>  	$(HOST_DIR)/bin/mksquashfs $(TARGET_DIR) $@ $(ROOTFS_SQUASHFS_ARGS)
>  endef
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
