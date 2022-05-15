Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEBDC433F5
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 20:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B447A81D02;
	Sun, 15 May 2022 20:52:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zFG-2zcNsz63; Sun, 15 May 2022 20:52:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7227781CEF;
	Sun, 15 May 2022 20:52:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 826EB1BF419
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 20:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7079F4023F
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 20:52:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g9R-T0wqpT5P for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 20:52:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A411D4023C
 for <buildroot@buildroot.org>; Sun, 15 May 2022 20:52:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7435:84c7:aa16:50f0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 89ED15FFA8;
 Sun, 15 May 2022 22:52:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652647957;
 bh=d2ywC6RRIwjBgUrGrLwjAGalh8JKi7DUbFSCbxFy/8A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ShdYAKnkrPit8r5Hhsz6Cq5LqK/cSgZp6secmKbckwLY0L+EHjk3YFvy2btrd+Xq9
 0o6XlR/8tM1tEkfE875+8vgIenl0Nkuc2+3ORwGRD7Zx2x1xD4eP6c5q9LPxbk5JdE
 CljfO9ebRvAdjhVTo1Z3eHCMPbt2aJxBAD8T/7AAq9E/Dn3WcAl1OG/JpYopoGN725
 X4CjIYZJXVYr77wmx62832uZdmbiY3wjCoK7lCOYmHjpLz7Dnz7tYZU/Y+2J4TfBoN
 ts+K4U7NnGrBnlPng9HkRZ2PRnYTtzEjiy3ZgFjHnU5tkXB4IShjjJIH2etr7a+OOp
 +UFPMrLt9mi9A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 15 May 2022 22:52:35 +0200
Date: Sun, 15 May 2022 22:52:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Linus Kaschulla <linus@cosmos-ink.net>
Message-ID: <20220515205235.GG1597494@scaer>
References: <20220515145441.3682-1-linus@cosmos-ink.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220515145441.3682-1-linus@cosmos-ink.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] fs/squashfs: add more options to
 customize creation
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

On 2022-05-15 14:54 +0000, Linus Kaschulla via buildroot spake thusly:
> Squashfs seems to be the best way to shipping a highly compressed
> rootfs that can easily be mounted without any extraction overhead.
> While trying to get the squashfs as small as possible, I found out
> that buildroot only allows rather basic customizations and many
> options to improve the compression ratio are not available.
> 
> Notably, squashfs doesn't use the maximum available blocksize by
> default and compression options offered by `mksquashfs` are not
> changable from buildroot without patching the source code.
> 
> This patch adds 2 new options to fs/squashfs:
> 
>  - Changing the blocksize (e.g. to improve compression ratio)
>  - Appending any custom arguments (e.g. for adding compression options)

Two changes, two patches. ;-)

> Using these options, specifying the max blocksize of 1M and adding
> the arguments `-Xbcj arm` allows for a notably smaller rootfs when
> using xz compression and building for an arm target.

So, I think this is good to have those additional options, however I
think we should restrict them. For example, arbitrary string options is
not very nice.

Instead, here's what I suggest:

  - for the blocksize: add a choice, for the only possible and
    meaningful values (1L is probably too low, maybe 4K should be the
    minimum?)

        choice
            bool "blocksize"
            default BR2_TARGET_ROOTFS_BS_128K

        config BR2_TARGET_ROOTFS_BS_1K
            bool "1k"

        config BR2_TARGET_ROOTFS_BS_2K
            bool "1k"

        [...]

        config BR2_TARGET_ROOTFS_BS_1M
            bool "1k"

        endchoice

        config BR2_TARGET_ROOTFS_BS
            string
            default "1K"   if BR2_TARGET_ROOTFS_BS_1K
            default "2K"   if BR2_TARGET_ROOTFS_BS_2K
            ...
            default "1M"   if BR2_TARGET_ROOTFS_BS_1M

    and in squashfs.mk:

        ROOTFS_SQUASHFS_ARGS += -b $(call qstrip,$(BR2_TARGET_ROOTFS_SQUASHFS4_BLOCKSIZE))

  - for the comnpression options, I think a generic boolean would be
    better:

        config BR2_TARGET_ROOTFS_EXTREME_COMP
            bool "extreme compression if possible"
            help
              Use options to increase compression ration as much as
              possible, like using architecture-specific options, at
              the cost of time when assmebline the filesystem image.

              For example:
                - with gzip, use -Xcompression-level 9
                - with lzo, use -Xcompression-level 9
                - with xz on ARM, use -Xbcj arm.thumb

        config BR2_TARGET_ROOTFS_COMP_OPTS
            string
            default "-Xcompression-level 9" if BR2_TARGET_ROOTFS_SQUASHFS4_GZIP
            default "-Xcompression-level 9" if BR2_TARGET_ROOTFS_SQUASHFS4_LZO
            default "-Xbcj arm,armthumb" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ && (BR2_arm || BR2_armeb)
            default "-Xbcj x86" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ && (BR2_i386 || BR2_x86_64)
            ...

    and in squashfs.mk:

        ROOTFS_SQUASHFS_ARGS += $(call qstrip,$(BR2_TARGET_ROOTFS_COMP_OPTS))

    Also note that lz4 already uses -Xhc unconditionally, and commit
    07e37bcc42f notes that an extra option was dropped, so maybe we
    should just unconditionally enable all those options when possible?

And of course, this should be in two patches: one to introudce the
blocksize, one to introduce the extreme compression optiopns

Regards,
Yann E. MORIN.

> Signed-off-by: Linus Kaschulla <linus@cosmos-ink.net>
> ---
>  fs/squashfs/Config.in   | 20 ++++++++++++++++++++
>  fs/squashfs/squashfs.mk |  8 ++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
> index 70d4a20cf0..7ae2743961 100644
> --- a/fs/squashfs/Config.in
> +++ b/fs/squashfs/Config.in
> @@ -12,6 +12,16 @@ config BR2_TARGET_ROOTFS_SQUASHFS_PAD
>  	  Say 'y' here (the default) to pad the the filesystem image
>  	  to a 4K boundary. Say 'n' to disable padding.
>  
> +config BR2_TARGET_ROOTFS_SQUASHFS4_BLOCKSIZE
> +	string "block size"
> +	help
> +	  Define a specific block size to use when creating the
> +	  squashfs. Higher values can improve compression ratios.
> +	  The suffixes K and M are supported. The value should not
> +	  be above 1 MiB.
> +
> +	  If unsure, leave this empty to use the default blocksize.
> +
>  choice
>  	prompt "Compression algorithm"
>  	default BR2_TARGET_ROOTFS_SQUASHFS4_GZIP
> @@ -39,4 +49,14 @@ config BR2_TARGET_ROOTFS_SQUASHFS4_ZSTD
>  
>  endchoice
>  
> +config BR2_TARGET_ROOTFS_SQUASHFS4_CUSTOM_ARGS
> +	string "additional arguments to pass to the squashfs creation"
> +	help
> +	  Append extra commandline arguments to the mksquashfs command.
> +	  This can be useful for finetuning a selected compression or
> +	  enable/disable other features of squashfs.
> +	  See "$HOST_DIR/bin/mksquashfs -h" for available arguments.
> +
> +	  If unsure, leave empty.
> +
>  endif
> diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
> index 7a5e3e313e..42343b1b40 100644
> --- a/fs/squashfs/squashfs.mk
> +++ b/fs/squashfs/squashfs.mk
> @@ -12,6 +12,10 @@ ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS_PAD),)
>  ROOTFS_SQUASHFS_ARGS += -nopad
>  endif
>  
> +ifneq ($(BR2_TARGET_ROOTFS_SQUASHFS4_BLOCKSIZE),"")
> +ROOTFS_SQUASHFS_ARGS += -b "$(BR2_TARGET_ROOTFS_SQUASHFS4_BLOCKSIZE)"
> +endif
> +
>  ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZ4),y)
>  ROOTFS_SQUASHFS_ARGS += -comp lz4 -Xhc
>  else ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZO),y)
> @@ -26,6 +30,10 @@ else
>  ROOTFS_SQUASHFS_ARGS += -comp gzip
>  endif
>  
> +ifneq ($(BR2_TARGET_ROOTFS_SQUASHFS4_CUSTOM_ARGS),"")
> +ROOTFS_SQUASHFS_ARGS += $(call qstrip,$(BR2_TARGET_ROOTFS_SQUASHFS4_CUSTOM_ARGS))
> +endif
> +
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
