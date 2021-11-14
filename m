Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC48AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 20:38:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1778E60FE8
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 20:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1778E60FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93A6740001;
	Sun, 14 Nov 2021 20:38:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gnqvepmnWgT7; Sun, 14 Nov 2021 20:38:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AC92400B9;
	Sun, 14 Nov 2021 20:38:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACF361BF3C1
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 20:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D6AC80AFB
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 20:38:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hn2w2K9GGvVu for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 20:38:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B955B80A9C
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 20:38:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:588e:4f72:56a8:ef3a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D1D557802BE;
 Sun, 14 Nov 2021 21:38:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636922315;
 bh=ia/4Z38TiVXNuoUSblHl+F/xToRLFb0xM47n86l5L+k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YF2JSGyDFn1sqWpQgIaPcP2nw5QDT6VlfNiDqQHPJ9QLPDJG2oVmMZh98gEusYVBA
 wdTEVvV26FNtCKVlkKaiHVjzIYFp7hBGRHumYGEIpQEBvwSPJmDoF4fvSba+Fk4lTW
 ynPzWoz8mVnlzYa0bBEvVE933P7pE0M9PoYk/eXocmYFGcZ6lZ5zR618ClNyexIf1J
 bTg3Qt7mK1lmlWCccA/BuhsHZCwYhzT55TMt9RpINdOTLBeuLp9wHdWK/kg/izTbbE
 b6Ug0BoD6jRTU01kgIIzI+YYk85bgvs41vw81XsQi3h2qFZ/YmStvW5/wtE40WEK03
 5+xPiE2traKIg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Nov 2021 21:38:31 +0100
Date: Sun, 14 Nov 2021 21:38:31 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211114203831.GZ247986@scaer>
References: <20211114194756.3137351-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211114194756.3137351-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/luajit: fix LUAJIT_XCFLAGS
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

On 2021-11-14 20:47 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since commit
> d4e6e1b53b07b05d51ebfb70979608c144ac155a:
> 
> /usr/bin/make: invalid option -- 'D'
> /usr/bin/make: invalid option -- 'U'
> /usr/bin/make: invalid option -- 'A'
> /usr/bin/make: invalid option -- 'J'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/92a5188ef7f9dda3e417d3853b0c4067415f5970
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/luajit/luajit.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
> index 89b164c96d..3367336899 100644
> --- a/package/luajit/luajit.mk
> +++ b/package/luajit/luajit.mk
> @@ -47,7 +47,7 @@ define LUAJIT_BUILD_CMDS
>  		HOST_CFLAGS="$(HOST_CFLAGS)" \
>  		HOST_LDFLAGS="$(HOST_LDFLAGS)" \
>  		BUILDMODE=dynamic \
> -		XCFLAGS=$(LUAJIT_XCFLAGS) \
> +		XCFLAGS="$(LUAJIT_XCFLAGS)" \

I just noticed that we'll also have the issue with the host variant, and
I forgot to update before pushing... I'll do that locally and push a new
commit...

Regards,
Yann E. MORIN.

>  		-C $(@D) amalg
>  endef
>  
> -- 
> 2.33.0
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
