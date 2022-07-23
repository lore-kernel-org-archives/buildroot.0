Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF0FC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 15:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30D5D84BC7;
	Sat, 23 Jul 2022 15:05:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30D5D84BC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mYwqlRlA53Vd; Sat, 23 Jul 2022 15:05:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1403D83E80;
	Sat, 23 Jul 2022 15:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1403D83E80
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D2DEA1BF46A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD8058403F
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD8058403F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wbLN7QMJXQAQ for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 15:04:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEBB983E58
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EEBB983E58
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 15:04:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8acf:5600:bc2c:46eb:561c:827])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 15C1878050B;
 Sat, 23 Jul 2022 17:04:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Jul 2022 17:04:26 +0200
Date: Sat, 23 Jul 2022 17:04:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20220723150426.GD2641@scaer>
References: <20220723134249.268212-1-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220723134249.268212-1-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658588671;
 bh=Pyzxt5c2GuZ8QseGbNlgg4wwVmbZnGGcnxOxoD9KdZk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M8H/qy7H7Bw3R87SvtenCPTvPi6fk5P1LAqRVmog/XSlZtHAIdk8q+3u1ASoRKuUr
 IEBmR9s2J8mWhRTgcjWiQVnFzQrLRh+4sznZ7gT0dgVTR7YHxcO33KNhK0RRUWuELg
 zSZvBMEKpMj7SiaviSsTSCXspdrqCGRz17nQnCPv0Qhi5RhxF+arxFJ+qHFxVVhmIF
 Oki1uUKiSlwm0tWslsh1k6IYIOo5k4rhZ3ioIu7X4r4Ju+ILKqVmB02BJ5pZgS+vpW
 6YI4TuDBCFfKsWiaOisWyj7zBre0eVszYFaj6skKXATxOYU6lBqY3ejm8dBnvqmzqO
 CCKE9+6gEtXlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M8H/qy7H
Subject: Re: [Buildroot] [PATCH] package/zfs: fix pam support
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
Cc: Michael Zimmermann <sigmaepsilon92@gmail.com>,
 =?utf-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-07-23 15:42 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> The --enable option was added to CONF_ENV instead of CONF_OPTS. For this
> defconfig
> 
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> BR2_PACKAGE_ZFS=y
> BR2_PACKAGE_LINUX_PAM=y
> 
> this yields
> 
> /bin/sh: line 1: --enable-pam=yes: command not found
> 
> While we're at it, also remove the =yes which we usually don't add.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/zfs/zfs.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
> index 07ce3295ec..0a6e4a3cfa 100644
> --- a/package/zfs/zfs.mk
> +++ b/package/zfs/zfs.mk
> @@ -52,7 +52,7 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
>  ZFS_DEPENDENCIES += linux-pam
> -ZFS_CONF_ENV += --enable-pam=yes
> +ZFS_CONF_OPTS += --enable-pam
>  else
>  ZFS_CONF_OPTS += --disable-pam
>  endif
> -- 
> 2.35.3
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
