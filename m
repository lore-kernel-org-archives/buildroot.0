Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B2EC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 15:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C09CC40C66;
	Tue, 19 Jul 2022 15:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C09CC40C66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oTwBIObIQq69; Tue, 19 Jul 2022 15:41:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2A9540C5E;
	Tue, 19 Jul 2022 15:41:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2A9540C5E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C10C1BF4D7
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13C3260AF2
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13C3260AF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IouX8Tz2InmV for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 15:41:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD3636080A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD3636080A
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 15:41:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5d47:1bcb:9db:ce0f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6B25913FA49;
 Tue, 19 Jul 2022 17:41:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 19 Jul 2022 17:41:20 +0200
Date: Tue, 19 Jul 2022 17:41:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <20220719154120.GI2249625@scaer>
References: <20220719131605.337057-1-nolange79@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220719131605.337057-1-nolange79@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658245283;
 bh=xeCd5RqETwTsrJSqgQiM6rYtvT80M3oduyQoJL45R3w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=muVRPvvRXMuR6VE0dYcFoW/4hsmtI9qjLe6T/POjglXmHgXuG/3eXtJfOox+pxfop
 /lsoSe/NunOl5Ht1Gb+EiQIwtIV6J/ZkNRNG567xqBkxXaM5C8yoCyvne3wYz/8yqH
 qidWxE6HQQkfzwqHJIWNuA8Ct4X38k4x0lntxlulvO+2F+CkfGTfBiTZiCce6lH2PI
 hk/pdYutFwR2ifpsdovmg02rZbWGHnQ94qdSiryoW0hsjwARQLOUiHSithQKdmx/5X
 NuPBY0ohgMPrn4E6FMYFN/V4hfCxWGRjEbUlkzJX3bewb0c+9dmbQhWjglx2JOdft1
 FzVzgi106TxzQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=muVRPvvR
Subject: Re: [Buildroot] [PATCH 1/2] package/systemd: allow empty
 SYSTEMD_DEFAULT_TARGET
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

Norbert, All,

On 2022-07-19 15:16 +0200, Norbert Lange spake thusly:
> Once you allow systemd to be build while not using it as init
> system, the variable will be mpty and the build fails.

A better commit log would be:

    Currently, we forcefully require that a default target be specified.
    However, systemd does install a default target, but it's not
    possible to just use that target.

    Allow the user to blank-out the config setting to not override
    whatever systemd installed and keep that.

(I don't think we want to be able to build systemd when it is not
selected as an init system, so we should not refer to that in the commit
log; see my reply to your next patch...)

> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/systemd/systemd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index b6fffc553f..1510437617 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -586,7 +586,7 @@ SYSTEMD_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
>  endif
>  
>  define SYSTEMD_INSTALL_INIT_HOOK
> -	ln -fs "$(call qstrip,$(BR2_PACKAGE_SYSTEMD_DEFAULT_TARGET))" \
> +	ln -fs "$(or $(call qstrip,$(BR2_PACKAGE_SYSTEMD_DEFAULT_TARGET)),multi-user.target)" \
>  		$(TARGET_DIR)/usr/lib/systemd/system/default.target
>  endef

Instead, the whole hook should be made conditional to whether the default
target is to be overriden:

    SYSTEMD_DEFAULT_TARGET = $(call qstrip,$(BR2_PACKAGE_SYSTEMD_DEFAULT_TARGET))
    ifneq ($(SYSTEMD_DEFAULT_TARGET),)
    define SYSTEMD_INSTALL_FORCE_TARGET
        ln -fs $(SYSTEMD_DEFAULT_TARGET) \
            $(TARGET_DIR)/usr/lib/systemd/system/default.target
    endef
    SYSTEMD_POST_INSTALL_TARGET_HOOKS += SYSTEMD_INSTALL_FORCE_TARGET
    endif

... and drop the assignment a few lines later, of course.

Regards,
Yann E. MORIN.

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
