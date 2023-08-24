Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94896C3DA6F
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 21:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AB8740316;
	Thu, 24 Aug 2023 21:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AB8740316
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8mDQh9ErVClx; Thu, 24 Aug 2023 21:18:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 104DA40356;
	Thu, 24 Aug 2023 21:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 104DA40356
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CAA341BF84C
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEC98835A9
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEC98835A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rBMRnRj1dCr2 for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 21:17:49 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59863835A6
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 21:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59863835A6
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ced9:48d:9640:c8a7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 0AF8419F5AB;
 Thu, 24 Aug 2023 23:17:43 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 24 Aug 2023 23:17:43 +0200
Date: Thu, 24 Aug 2023 23:17:43 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230824211743.GH3722679@scaer>
References: <20230824210800.1589677-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230824210800.1589677-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692911866;
 bh=2TZTCu8Ya2KAaplyFLahs0qCeNruFGvsMDje4WxMmfs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iSUzb3eW3175kpgDgtFEGAaIldJCQRzJvXVD5s8vBw+WRXMkVowR3nq3/hXp6igzf
 JCE/c+/rxw0isncerVJ/9EMZQZXXOrVBEJrstG6a9tkQlEwEvL6p3S/hWE73tD9YMj
 qx/74hVYkMoUxHscoTXCESKaRfOWEhH2V38YjHiATdzkGHQ/7f2jF23PNnxydPaeNb
 QKFd/z9gHJdnxoW0u/bcbkFnmkbcY8Z2OOFBRlbwvjSv6B3oM6tWn4CB1izoxCjYNM
 l7VzESIbf4dp2IQxFqfNPwkYB9metE6+dwnh5di2GCI4IBqeQ62Q8DJU3gW+iV5U95
 I+/JBCIFVMs2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iSUzb3eW
Subject: Re: [Buildroot] [PATCH] Makefile: remove $(TARGET_DIR)/usr/mkspecs
 in target-finalize
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

On 2023-08-24 23:08 +0200, Thomas Petazzoni via buildroot spake thusly:
> qt6base installs things in /usr/mkspecs, but also the soon to be added
> qt6core5compat, and the existing package qwt as well. So let's move
> the removal of /usr/mkspecs in target-finalize, where we already
> remove lots of development-related directories.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  Makefile           | 1 +
>  package/qwt/qwt.mk | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index da52a51716..f255b1e443 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -747,6 +747,7 @@ endif
>  	rm -rf $(TARGET_DIR)/usr/info $(TARGET_DIR)/usr/share/info
>  	rm -rf $(TARGET_DIR)/usr/doc $(TARGET_DIR)/usr/share/doc
>  	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
> +	rm -rf $(TARGET_DIR)/usr/mkspecs

Why don't you make that a QT6BASE_TARGET_FINALIZE_HOOKS ?

I'm warry of adding package-specific cleanup in the generic code, and we
introduced FOO_TARGET_FINALIZE_HOOKS specifically for such use-cases.

Regards,
Yann E. MORIN.

>  	rmdir $(TARGET_DIR)/usr/share 2>/dev/null || true
>  ifneq ($(BR2_ENABLE_DEBUG):$(BR2_STRIP_strip),y:)
>  	rm -rf $(TARGET_DIR)/lib/debug $(TARGET_DIR)/usr/lib/debug
> diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
> index 9f0b78655f..f344ca4e3a 100644
> --- a/package/qwt/qwt.mk
> +++ b/package/qwt/qwt.mk
> @@ -58,7 +58,6 @@ endef
>  
>  define QWT_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install INSTALL_ROOT=$(TARGET_DIR)
> -	rm -Rf $(TARGET_DIR)/usr/mkspecs
>  endef
>  
>  $(eval $(qmake-package))
> -- 
> 2.41.0
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
