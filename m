Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5ACFC433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 19:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21420849F6;
	Sat, 28 May 2022 19:55:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yfwnIwQZesjb; Sat, 28 May 2022 19:55:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34873849EC;
	Sat, 28 May 2022 19:55:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E0E151BF867
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF2FD40382
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:55:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dizRns7mYpKR for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 19:55:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9EE63402E2
 for <buildroot@buildroot.org>; Sat, 28 May 2022 19:55:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:882a:25de:8723:774f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id ECC1319F574;
 Sat, 28 May 2022 21:55:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653767729;
 bh=ElrTUCPeQSkWjkaM+7WoVB+6CiPgRxfUOkkJn2EgLGk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cIh5XNEwX9FqiduvJEiFNQsZI/MPy1gcK3o7MkGPjd+MeK0u1bwsafm5hCk8yxx2a
 HCAnA46uUUPD9XLFBD6/XActgEC3WHmLe+5wn9RPPYt27OlRdzirMgdWa65ZTlr74+
 +citjVz2DTwxc+urljrXH3WYWwnuBoSfSFpM/H+1XhmWxh1lvqj+sSQYLHM+td4+1M
 K8Eazjkiutvv4JXFBqEFtAI2drylH2x/nOQJv40trRT2GocpmsiLbpwZxMWoOz1bEh
 xP7SeXOD/Hcql2ba5KZ9jtSBx4SPYunjZ5IPNxXpGw0O/fgf651SuI3lqkEJAbR7yp
 NRr2RGYSqLvzQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 May 2022 21:55:26 +0200
Date: Sat, 28 May 2022 21:55:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220528195526.GG301044@scaer>
References: <20220525220202.357390-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220525220202.357390-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: fix build without atomic
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

Fabrice, All,

On 2022-05-26 00:02 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure without atomic raised since commit
> fde21979427ffeb4fe9c0068310be195f2dec5ec:
> 
> /nvmedata/autobuild/instance-25/output-1/host/lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: cannot find -latomic: No such file or directory
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/db6/db6923915e36bcdb2953a3cdd2b450fa10794631
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dhcp/dhcp.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> index cbc95cb152..9628ffbe2a 100644
> --- a/package/dhcp/dhcp.mk
> +++ b/package/dhcp/dhcp.mk
> @@ -62,6 +62,12 @@ else
>  DHCP_BIND_EXTRA_CONFIG += --without-zlib
>  endif
>  
> +ifeq ($(BR2_TOOLCHAIN_HAS_ATOMIC),y)
> +DHCP_BIND_EXTRA_CONFIG += --enable-atomic
> +else
> +DHCP_BIND_EXTRA_CONFIG += --disable-atomic
> +endif
> +
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>  DHCP_CONF_ENV += LIBS=-latomic

It feels very weird that we have the _HAS_LIBATOMIC and the _HAS_ATOMIC
conditional blocks completely independent...

Indeed, BR2_TOOLCHAIN_HAS_LIBATOMIC selects BR2_TOOLCHAIN_HAS_ATOMIC.
So, BR2_TOOLCHAIN_HAS_ATOMIC == y implies BR2_TOOLCHAIN_HAS_ATOMIC == y
too.

So, probably we would want tsoemthing like:

    ifeq ($(BR2_TOOLCHAIN_HAS_ATOMIC),y)
    DHCP_BIND_EXTRA_CONFIG += --enable-atomic
    ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
    DHCP_CONF_ENV += LIBS=-latomic
    endif
    else
    DHCP_BIND_EXTRA_CONFIG += --disable-atomic
    endif

Thoughts?

Regards,
Yann E. MORIN.

>  endif
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
