Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231EAC433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 10:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE0328146E;
	Sun, 20 Feb 2022 10:01:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NOBAxFx5nvyF; Sun, 20 Feb 2022 10:01:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3409817D3;
	Sun, 20 Feb 2022 10:01:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19DC91BF3F3
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 10:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07F91813E9
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 10:01:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JjTYl09fSyDD for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 10:01:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BA8581404
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 10:01:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7478:162b:1cf3:1d5b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 178CC5FFA7;
 Sun, 20 Feb 2022 11:01:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645351304;
 bh=TPJXc+Wbu3I5/6JaaxMjjjTsjsC+nr8e5krHoZhQrdg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uQzp9ytZJe+2PoxzBzRMVpIynEafqjwWkPL/1pBuCrc90W8BMoN85pc0ellwcN7n3
 d1PADLkHZsQQC1fLzzunopAu6aGdZFhRCPUCJ9m149OZXllqiI/T3ELE9FqcRa2kGa
 0dIN4fZPqOkAKtWYo1+qn13/Cv0h37Lp8mRI8QXGqswvwoMBwzUUt0IVZJsXuQlRom
 4bAq6bY/2Tv/y2PAdOzj5QXGMXbLNMpdwZ163+hL9Mixt2Gi+pNCgAyTy5byfUY/Aq
 OfB3QeY8BKxiFgDOuTMZ0/TuSOCLJrRHvqTJ0YyBws+0AaetMGIiy5ADvAQTJmu9SD
 Z7ngzJPyBfqMg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Feb 2022 11:01:40 +0100
Date: Sun, 20 Feb 2022 11:01:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220220100140.GR522310@scaer>
References: <20220219134104.3403344-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220219134104.3403344-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/dovecot-pigeonhole: drop
 DOVECOT_PIGEONHOLE_FIXUP_DOVECOT_CONFIG
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-02-19 14:41 +0100, Fabrice Fontaine spake thusly:
> Drop DOVECOT_PIGEONHOLE_FIXUP_DOVECOT_CONFIG added by commit
> 0901355c11f051846744a12f9b2044a751faa47a which is not needed since the
> addition of PPD_FIXUP_PATHS in commit
> b06294e9897e90862656416e8b67fdace15488d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks for this further cleanup! :-)

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/dovecot-pigeonhole/dovecot-pigeonhole.mk | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
> index dd533977f4..62d9909cf5 100644
> --- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
> +++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
> @@ -15,12 +15,4 @@ DOVECOT_PIGEONHOLE_DEPENDENCIES = dovecot
>  
>  DOVECOT_PIGEONHOLE_CONF_OPTS = --with-dovecot=$(STAGING_DIR)/usr/lib
>  
> -ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> -define DOVECOT_PIGEONHOLE_FIXUP_DOVECOT_CONFIG
> -	$(SED) 's,$(PER_PACKAGE_DIR)/dovecot/,$(PER_PACKAGE_DIR)/dovecot-pigeonhole/,g' \
> -		$(STAGING_DIR)/usr/lib/dovecot-config
> -endef
> -DOVECOT_PIGEONHOLE_PRE_CONFIGURE_HOOKS = DOVECOT_PIGEONHOLE_FIXUP_DOVECOT_CONFIG
> -endif
> -
>  $(eval $(autotools-package))
> -- 
> 2.34.1
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
