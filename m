Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E450C433F5
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 20:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4F65409EE;
	Wed, 19 Jan 2022 20:45:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CIi_ZvIjq_pE; Wed, 19 Jan 2022 20:45:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0F0241578;
	Wed, 19 Jan 2022 20:45:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 54CFE1BF405
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 20:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FCB441578
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 20:45:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z-bw5DLBvNDO for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 20:45:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FD6F409A6
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 20:45:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7065:fa25:c80a:5e5a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 285D619F595;
 Wed, 19 Jan 2022 21:45:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642625122;
 bh=YEGbQc1OZv/TWvJhHMdryVniVEAoJpjVqyBmnXW6Zv4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mYOW00nnPQNgJ6ddRDJDY/V8+dsKmhXPd8ifsKuN7WWI8lXVwDiVNUY/7vyX/SR6S
 Q425LyqDAjAyGIC5ckwP3VCwkHNJ4ZSk3aM2q5VIo0fWVjxiUFL5jlaLJRGwtcvon/
 WtKHG0j9se+By4yBoNRh7mwximu5gbDQWNOG9icxZ0RbhQugiT/4Wa/EFZFIx2D3wN
 K1zkeeBXMQbbq74Hbkv16PN7qNq/0yYQxHUkxVVr5m/sCdB/gTh8WNArD77T+r//xB
 9vT1uIUS88Pd5xrFMFDjM4EN9xSfVcgXqgiZCyh+dn6KeJy+yQGf9UdxpGS8l5uktL
 A51K3FdTVqD6A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 19 Jan 2022 21:45:18 +0100
Date: Wed, 19 Jan 2022 21:45:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220119204518.GC3095239@scaer>
References: <20220119084545.3642950-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220119084545.3642950-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/re2: switch to generic-package
 make build
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-01-19 01:45 -0700, James Hilliard spake thusly:
> The cmake build appears to be missing features such as pkg-config
> generation support, switch to the regular makefile based build
> which appears to work better.

Can't we just fix the CMakeList.txt and submit a patch upstream,
instead?

Also, see below...

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/re2/re2.mk | 30 ++++++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/package/re2/re2.mk b/package/re2/re2.mk
> index b562d5d7ef..144c82339f 100644
> --- a/package/re2/re2.mk
> +++ b/package/re2/re2.mk
> @@ -10,8 +10,30 @@ RE2_LICENSE = BSD-3-Clause
>  RE2_LICENSE_FILES = LICENSE
>  RE2_INSTALL_STAGING = YES
>  
> -RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF
> -HOST_RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON
> +define RE2_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> +		-C $(@D)
> +endef
>  
> -$(eval $(cmake-package))
> -$(eval $(host-cmake-package))
> +define RE2_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> +		DESTDIR="$(STAGING_DIR)" prefix=/usr -C $(@D) install
> +endef
> +
> +define RE2_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> +		DESTDIR="$(TARGET_DIR)" prefix=/usr -C $(@D) install

The 'install' target will forcibly build and install static and shared
libs:

    https://github.com/google/re2/blob/main/Makefile#L297

    296: .PHONY: install
    297: install: static-install shared-install

So, this is probably going to not play nicely for builds where a shared
build is not possible.

AFAICS, the cmake-based buildsystem got that one correct, though, so it
would be a bit of a shame to regress on that point...

Regards,
Yann E. MORIN.

> +endef
> +
> +define HOST_RE2_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
> +		-C $(@D)
> +endef
> +
> +define HOST_RE2_INSTALL_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
> +		-C $(@D) DESTDIR="$(HOST_DIR)" prefix=/usr install
> +endef
> +
> +$(eval $(generic-package))
> +$(eval $(host-generic-package))
> -- 
> 2.25.1
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
