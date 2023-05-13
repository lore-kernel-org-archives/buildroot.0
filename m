Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F5CC77B7C
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 08:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 359E1417D9;
	Sat, 13 May 2023 08:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 359E1417D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b5FA8yoIc870; Sat, 13 May 2023 08:25:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6065417C5;
	Sat, 13 May 2023 08:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6065417C5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 782B01BF5DF
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 08:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EA3984B5E
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 08:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EA3984B5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AWlegFfnDQwr for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 08:25:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65ECC84B5D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65ECC84B5D
 for <buildroot@buildroot.org>; Sat, 13 May 2023 08:25:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 5B6E819F750;
 Sat, 13 May 2023 10:25:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 10:25:26 +0200
Date: Sat, 13 May 2023 10:25:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: unixmania@gmail.com
Message-ID: <20230513082526.GF2582048@scaer>
References: <20230322231511.551442-1-unixmania@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230322231511.551442-1-unixmania@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683966329;
 bh=CmK9CoEAeipvtVGPVml/8IS7/2ZG9XjmjVaxcVmZm7U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XkmXQBdNqfB948wL6W/ArvLF6i9z/lHor3dSZPlOPfJ29oEy8MnMdly+As4XM4Ltv
 V+50W7ubUEQOqBf0XXmoxpQJnYL/g6d8/t2mRTyRvBbfY+VpROujMpolEpODU5U91N
 L9Xu5D1/J19AiznwbHg7gmaoBjm4A356hJybu+WN1Ivy4nmWsR8peqE7fn38ucLTjQ
 PFC5PmnRMRBvPpnRMOtaLleWIRBEbj6XuQmX8Qq8zv4QpJgyafy7tGGZp9QSQlzw0b
 AkQ9wZ4s5VkqghdGpUaKzolLiTl/SXsK4lwP6d4tF2UtCQIGNNF2G6mOYp9MK4wmwS
 NVsEoI5YYRHng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XkmXQBdN
Subject: Re: [Buildroot] [PATCH] package/qemu: allow building only the guest
 agent
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Carlos, All,

On 2023-03-22 20:15 -0300, unixmania@gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
> 
> Most of the tools are useful only on virtualization hosts. After the
> upgrade to QEMU 7.2.0, it is possible to build only quemu-ga, which
> makes more sense when we build guest VM images.
> 
> Also do not build the other tools by default if none of the emulators is
> selected, since the user does not necessarily wants them. Ideally, it
> should not be possible to select qemu without selecting at least one of
> the subcomponents but it is hard to guess what the user wants.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>

I am not very happy that this means we can end up with a cconfiguration
where nothing (meaningful) is installed, but fixing this becomes less
obvious...

So be it...

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> NOTE
> 
> This was also possible on older QEMU versions, but required a trick to
> force compiling the code required to link qemu-ga without building the
> other tools:
> 
>    ./configure --enable-system --target-list="" --disable-tools --enable-guest-agent
> ---
>  package/qemu/Config.in | 8 +++++++-
>  package/qemu/qemu.mk   | 6 ++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> index a446c0cf68..6a9b08648d 100644
> --- a/package/qemu/Config.in
> +++ b/package/qemu/Config.in
> @@ -26,7 +26,6 @@ menuconfig BR2_PACKAGE_QEMU
>  	depends on BR2_USE_MMU # fork()
>  	select BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_ZLIB
> -	select BR2_PACKAGE_QEMU_TOOLS if !BR2_PACKAGE_QEMU_SYSTEM && !BR2_PACKAGE_QEMU_LINUX_USER
>  	help
>  	  QEMU is a generic and open source machine emulator and
>  	  virtualizer.
> @@ -358,4 +357,11 @@ config BR2_PACKAGE_QEMU_TOOLS
>  	  Say 'y' here to include tools packaged with QEMU
>  	  (e.g. qemu-img).
>  
> +config BR2_PACKAGE_QEMU_GUEST_AGENT
> +	bool "Enable guest agent"
> +	help
> +	  Say 'y' here to include an agent to run on guests, which
> +	  communicates with the host over a virtio-serial channel
> +	  named "org.qemu.guest_agent.0".
> +
>  endif # BR2_PACKAGE_QEMU
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 3cbeffe213..4194670bb0 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -165,6 +165,12 @@ else
>  QEMU_OPTS += --disable-tools
>  endif
>  
> +ifeq ($(BR2_PACKAGE_QEMU_GUEST_AGENT),y)
> +QEMU_OPTS += --enable-guest-agent
> +else
> +QEMU_OPTS += --disable-guest-agent
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBFUSE3),y)
>  QEMU_OPTS += --enable-fuse --enable-fuse-lseek
>  QEMU_DEPENDENCIES += libfuse3
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
