Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE779C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 10:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68ABB408C8;
	Sun, 20 Feb 2022 10:02:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pIZs2zRz0Iwf; Sun, 20 Feb 2022 10:02:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BF1F408C6;
	Sun, 20 Feb 2022 10:02:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E72E1BF3F3
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 10:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A93181836
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 10:02:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9zQPi6mOLF6Y for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 10:02:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 30386813E9
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 10:02:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7478:162b:1cf3:1d5b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 98A365FFAA;
 Sun, 20 Feb 2022 11:02:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645351329;
 bh=uVehA40Q2mvzc88EBOWZMIWxDZJK2/XbyeuuGhLClbE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oFigRTH34t9q+MdVw7Ic/1sI6rys4F+S4Fw3RGoOAAvaBcZbA7YwzEB8n0AvItLZ2
 dLyZRU5dWZJdYmM4j7eIy8G0cjDNAWQDIOKALC8ET1okrMgfzo3m77nl3DTceo3WLg
 XJlPnO/HyoxZzf9r48AzkO5kcIV7M9iIKsXqUUEXeXOWor2SbE5piRXOkfAPhYXctX
 9mE0ldcNfkN7SP9of8kqgLWofeGObBgBxpv46y7NG7rH2T+wEJKjz6gQj6Yu1BLZtU
 j8PFWXCN7jLGBqpftptDB5BX7NElRHBdni617kqTxvhvlmm4ZbAWlcv9C0AZ9jPuL8
 MVr1apAlGJl8g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Feb 2022 11:02:06 +0100
Date: Sun, 20 Feb 2022 11:02:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220220100206.GT522310@scaer>
References: <20220219142027.3753330-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220219142027.3753330-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: drop
 APACHE_FIXUP_APR_LIBTOOL
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

On 2022-02-19 15:20 +0100, Fabrice Fontaine spake thusly:
> Drop APACHE_FIXUP_APR_LIBTOOL which was added by commit
> b747c29c4e8eb89b7b99658dfd34f4a6b6b0744d but is not needed since the
> addition of PPD_FIXUP_PATHS in commit
> b06294e9897e90862656416e8b67fdace15488d7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/apache/apache.mk | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
> index 5fcb887fbc..b280d4dc3a 100644
> --- a/package/apache/apache.mk
> +++ b/package/apache/apache.mk
> @@ -19,14 +19,6 @@ APACHE_INSTALL_STAGING = YES
>  APACHE_AUTORECONF = YES
>  APACHE_DEPENDENCIES = apr apr-util pcre
>  
> -ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> -define APACHE_FIXUP_APR_LIBTOOL
> -	$(SED) "s@$(PER_PACKAGE_DIR)/[^/]\+/@$(PER_PACKAGE_DIR)/apache/@g" \
> -		$(STAGING_DIR)/usr/build-1/libtool
> -endef
> -APACHE_POST_PREPARE_HOOKS += APACHE_FIXUP_APR_LIBTOOL
> -endif
> -
>  APACHE_CONF_ENV= \
>  	ap_cv_void_ptr_lt_long=no \
>  	PCRE_CONFIG=$(STAGING_DIR)/usr/bin/pcre-config
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
