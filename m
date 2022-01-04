Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E72C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 08:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74D8A408EC;
	Tue,  4 Jan 2022 08:30:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id THokpO5ZaP8b; Tue,  4 Jan 2022 08:30:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5198408E5;
	Tue,  4 Jan 2022 08:30:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 53B8D1BF28B
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 08:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 427B7408E5
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 08:30:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QPcXoi2-F6OQ for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 08:30:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C501400AA
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 08:30:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6d4f:8674:7dd0:6c06])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C984413F8A7;
 Tue,  4 Jan 2022 09:30:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641285015;
 bh=pzrMKTBZIfMCa0v6Ulq4WdR5T9uze3MjCf5vEAt6ZZs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rGLCSE7aQoyR/uIZf1Kg5ZMSnGim4sXzMYKI3Rt5PEmWEBSEMDS4aid2uELtbFNe+
 S50QOX5gYlQuBkeaTN61X3mj9V2Syg5iBKVCD5oshO1uFKwgS6TWuv8HymoXialExY
 p7eK/2hsd/FTlQGH4UQEsZh0Kug21Hy/aZ/smyc5QbJXG2GBN2wb1Yc7eAZBUezZ59
 0nybNnVzTcMppwIOp7mSElDGWY3LX8dcPgSIebcd0ZlA/SU9M8oa5X2l99fj+O4Xjv
 1SdWR3xnZMNu+5DIbA69FwvkA4UDJjW5+9Rqs217cTtdXhvLY7Yaj3jV/qSIu6loll
 sGPnfFRAtaexw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 04 Jan 2022 09:30:11 +0100
Date: Tue, 4 Jan 2022 09:30:11 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220104083011.GR69135@scaer>
References: <20220103210048.7879-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220103210048.7879-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/3] package/qemu: reorder enable/disable
 options alphabetically
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

On 2022-01-03 22:00 +0100, Romain Naour spake thusly:
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Series of three patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/qemu/qemu.mk | 44 ++++++++++++++++++++++----------------------
>  1 file changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 97f9f885a1..43450a6649 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -187,39 +187,39 @@ define QEMU_CONFIGURE_CMDS
>  			--audio-drv-list= \
>  			--meson=$(HOST_DIR)/bin/meson \
>  			--ninja=$(HOST_DIR)/bin/ninja \
> -			--enable-kvm \
> -			--enable-attr \
> -			--enable-vhost-net \
>  			--disable-bpf \
> +			--disable-brlapi \
>  			--disable-bsd-user \
> +			--disable-cap-ng \
> +			--disable-capstone \
>  			--disable-containers \
> -			--disable-xen \
> -			--disable-virtfs \
> -			--disable-brlapi \
> -			--disable-curses \
>  			--disable-curl \
> -			--disable-vde \
> -			--disable-linux-aio \
> -			--disable-linux-io-uring \
> -			--disable-cap-ng \
> +			--disable-curses \
>  			--disable-docs \
> -			--disable-rbd \
> -			--disable-libiscsi \
> -			--disable-strip \
> -			--disable-sparse \
> -			--disable-mpath \
> -			--disable-sanitizers \
>  			--disable-hvf \
> -			--disable-whpx \
> +			--disable-libiscsi \
> +			--disable-libxml2 \
> +			--disable-linux-aio \
> +			--disable-linux-io-uring \
>  			--disable-malloc-trim \
>  			--disable-membarrier \
> -			--disable-vhost-crypto \
> -			--disable-libxml2 \
> -			--disable-capstone \
> -			--with-git-submodules=ignore \
> +			--disable-mpath \
>  			--disable-opengl \
> +			--disable-rbd \
> +			--disable-sanitizers \
> +			--disable-sparse \
> +			--disable-strip \
> +			--disable-vde \
> +			--disable-vhost-crypto \
>  			--disable-vhost-user-blk-server \
> +			--disable-virtfs \
>  			--disable-virtiofsd \
> +			--disable-whpx \
> +			--disable-xen \
> +			--enable-attr \
> +			--enable-kvm \
> +			--enable-vhost-net \
> +			--with-git-submodules=ignore \
>  			$(QEMU_OPTS)
>  endef
>  
> -- 
> 2.31.1
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
