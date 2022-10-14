Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE4BC4332F
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 20:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A12828197D;
	Fri, 14 Oct 2022 20:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A12828197D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ssRaDhWqMIYS; Fri, 14 Oct 2022 20:10:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDD8181959;
	Fri, 14 Oct 2022 20:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDD8181959
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 730E21BF47A
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 20:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D4B341974
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 20:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D4B341974
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kid5d7ySMnAK for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 20:10:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E4B941774
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E4B941774
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 20:10:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:20fb:14f0:36e1:8c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id EAFDD2003EF;
 Fri, 14 Oct 2022 22:10:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 14 Oct 2022 22:10:50 +0200
Date: Fri, 14 Oct 2022 22:10:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Lang Daniel <d.lang@abatec.at>
Message-ID: <20221014201050.GG2503@scaer>
References: <VI1P190MB0493E0B331B7910A594A5A689F259@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VI1P190MB0493E0B331B7910A594A5A689F259@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1665778253;
 bh=aItAt+pXmipfHE9quTeyadc58enPlc/4h5k208xOY7g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EIvwBGw01svwLIh8SlqNsP4Y8ZwJgtYuIKeVIJzmzXzGhEhpoXJCJw87dyAMynguS
 xk2pazDXMNElPv9GABn55/2ERvX4L4GDBKM23+eL74JM2uTBwavxc8HP2clXBNTShL
 /tzxxRtjoDw3iZ1oXAHaPiYFw3+CgQ8ngGs1/prXH/BU/sD7kHHM5Cm+0QE09Q8Bo8
 uWCbP2ejDe0USYecS9DPy63/QKW9/9sAEakmA89PJYXelqXOcdwv4Q/VI+heH/0QTz
 Qylq57aOiMDxv/PHlyx9NnjCpXjVcASsFSqTiNi+BeKednA0axt643i/uLl1kYrR3p
 6ZZ1ByuPJqw8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EIvwBGw0
Subject: Re: [Buildroot] [PATCH 1/2] package/iwd: drop dbus check
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Daniel, All,

On 2022-10-13 15:01 +0000, Lang Daniel via buildroot spake thusly:
> Since 6f5f6bcd8 dbus is selected when iwd is selected.
> 
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> ---
>  package/iwd/iwd.mk | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
> index fc10c5f1d4..8497fd1141 100644
> --- a/package/iwd/iwd.mk
> +++ b/package/iwd/iwd.mk
> @@ -17,15 +17,10 @@ IWD_AUTORECONF = YES
>  
>  IWD_CONF_OPTS = \
>  	--disable-manual-pages \
> -	--enable-external-ell
> -IWD_DEPENDENCIES = ell
> -
> -ifeq ($(BR2_PACKAGE_DBUS),y)
> -IWD_CONF_OPTS += --enable-dbus-policy --with-dbus-datadir=/usr/share
> -IWD_DEPENDENCIES += dbus
> -else
> -IWD_CONF_OPTS += --disable-dbus-policy
> -endif
> +	--enable-external-ell \
> +	--enable-dbus-policy \
> +	--with-dbus-datadir=/usr/share
> +IWD_DEPENDENCIES = ell dbus

Why keep a build-time dependency on dbus, if it really is a runtime
dependency as noted in Config.in ?

Can you double-check that iwd does not end up linked to libdbus?

Then, send an update: either drop the build dependency if it really is a
runtiem one, or fix the Config.in comment if it is still needed at build
time.

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_PACKAGE_READLINE),y)
>  # iwd client depends on readline (GPL-3.0+)
> -- 
> 2.25.1
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
