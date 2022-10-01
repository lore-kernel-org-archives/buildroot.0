Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D49C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 20:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B41224051A;
	Sat,  1 Oct 2022 20:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B41224051A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OXVXh3StrB2F; Sat,  1 Oct 2022 20:54:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B028F403A9;
	Sat,  1 Oct 2022 20:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B028F403A9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5ACF31BF330
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 20:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 367B782730
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 20:53:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 367B782730
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Px_7m7_FSf8Y for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 20:53:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CD6381AC4
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CD6381AC4
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 20:53:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9961:1217:61e8:73cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 760CA7802D6;
 Sat,  1 Oct 2022 22:53:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Oct 2022 22:53:54 +0200
Date: Sat, 1 Oct 2022 22:53:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Erico Nunes <nunes.erico@gmail.com>
Message-ID: <20221001205354.GV30794@scaer>
References: <20220927105829.760755-1-nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220927105829.760755-1-nunes.erico@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664657636;
 bh=dZSW3zTWBEin9bjae0RvpmRH+dc/IOhuRu06oFHbSvE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FQmeY8G28Mkcl4XMNn4STUpvUiw4IPoPp/rUAKJACUj0v3VoJX/vh88TLlWb18PO5
 Ap7CHXyP7blJm+TP18rTCBCSqSKqvfAXzfuknSHYZXNQBGqOzbkKIxHPTOW08R6lF0
 x9qInDPIDXa/XIwBlA5ZifstGA0Q4v9WctdiGjbkTGHeK0wHchFOiVGHSLsJRYJEvS
 gfRueY7RM5WwvCWri3wlYnqpjBFDtwmWB+997R6c5VascSaX95aVRAC0Ch87RLAKHY
 TU0ctznBNpshJUs2D6Y0hL7K7re+zCjH6x88XcuPh1EtKe35FxKJx8TZXtiNVLmMy8
 RHJE4ZU7Rk9aw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FQmeY8G2
Subject: Re: [Buildroot] [PATCH] package/efivar: bump to version 38
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

On 2022-09-27 12:58 +0200, Erico Nunes spake thusly:
> Drop backported patches and rebase the ones that are still relevant.
> 
> From version 37 to 38, there is a new build system in place, which is
> still custom Makefiles.
> It is not cross-compilation friendly and includes host tools, so a
> few workarounds are required to prevent things being built or rebuilt
> wrongly for host or target.
[--SNIP--]
> diff --git a/package/efivar/efivar.mk b/package/efivar/efivar.mk
> index 8708057b18..aaea33c01d 100644
> --- a/package/efivar/efivar.mk
> +++ b/package/efivar/efivar.mk
[--SNIP--]
> @@ -21,16 +21,36 @@ define EFIVAR_BUILD_CMDS
>  	# $(HOST_CC), otherwise it gets cross-built.
>  	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) \
>  		CFLAGS="$(HOST_CFLAGS) -std=gnu99" \
> -		$(MAKE) -C $(@D)/src gcc_cflags=  makeguids
> +		TOPDIR=$(@D) CFLAGS_GCC= \
> +		$(MAKE) -C $(@D)/src makeguids
>  
> +	# util.o needs to be rebuilt for target
> +	mv -v $(@D)/src/util.o $(@D)/src/util_host.o

This dual build commands hint at the need for a host-efivar package that
builds makeguids, and patch src/Makefile to use an existing $(MAKEGUIDS)
e.g. (mock diff for the sake of ilustration):

    +MAKEGUIDS ?= makeguids

    -$(MAKEGUIDS_OUTPUT) : makeguids
    -$(MAKEGUIDS_OUTPUT) : guids.txt
    +$(MAKEGUIDS_OUTPUT) : guids.txt $(MAKEGUIDS)

    -./makeguids $(LD_DASH_T) guids.txt ...
    +$(MAKEGUIDS) $(LD_DASH_T) guids.txt ...

(yeah, this is very borked, but it's just to explain what I have in
mind).

> +
> +	# Some workarounds for cross-compilation:
> +	# MAKEGUIDS_SOURCES is undefined so it doesn't pick host flags for
> +	# util.o or attempt to build makeguids again.
> +	# SUBDIRS is redefined so it skips building docs.
> +	# LD_DASH_T is redefined as the linker detection fails with Buildroot.
>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) \
>  		AR=$(TARGET_AR) NM=$(TARGET_NM) RANLIB=$(TARGET_RANLIB) \
>  		$(EFIVAR_MAKE_OPTS) \
> +		TOPDIR=$(@D) \
> +		MAKEGUIDS_SOURCES= \
> +		SUBDIRS=src \
> +		LD_DASH_T=-T \

Those should probably go into EFIVAR_MAKE_OPTS, as EFI_VAR_MAKE_OPTS
is already used for EFIVAR_BUILD_CMDS, EFIVAR_INSTALL_TARGET_CMDS, and
EFIVAR_STAGING_INSTALL_CMDS.

>  		all
> +
> +	# skip 'all' in install so in staging/target installs it won't try
> +	# to build everything again due to the workarounds above
> +	$(SED) 's/install : all/install :/g' $(@D)/src/Makefile

This sed is not conditional, and it munges an existing, static file, so
it should be done with a patch.

Regards,
Yann E. MORIN.

>  endef
>  
>  define EFIVAR_INSTALL_STAGING_CMDS
>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) \
> +		TOPDIR=$(@D) \
> +		MAKEGUIDS_SOURCES= \
> +		SUBDIRS=src \
>  		$(EFIVAR_MAKE_OPTS) \
>  		DESTDIR="$(STAGING_DIR)" \
>  		install
> @@ -38,6 +58,9 @@ endef
>  
>  define EFIVAR_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) \
> +		TOPDIR=$(@D) \
> +		MAKEGUIDS_SOURCES= \
> +		SUBDIRS=src \
>  		$(EFIVAR_MAKE_OPTS) \
>  		DESTDIR="$(TARGET_DIR)" \
>  		install
> -- 
> 2.37.3
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
