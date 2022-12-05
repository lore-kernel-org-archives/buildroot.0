Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30189C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 21:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAC1140289;
	Mon,  5 Dec 2022 21:56:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAC1140289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eHluA6NvQlYs; Mon,  5 Dec 2022 21:56:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACEDB40484;
	Mon,  5 Dec 2022 21:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACEDB40484
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E0221BF3E8
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 21:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4277460F69
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 21:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4277460F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 67T7EYuCPZwl for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 21:56:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A33260D53
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A33260D53
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 21:56:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:3834:9ccb:80f2:4b42])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0E0E2200417;
 Mon,  5 Dec 2022 22:55:59 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 05 Dec 2022 22:55:58 +0100
Date: Mon, 5 Dec 2022 22:55:58 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Message-ID: <20221205215558.GI2855@scaer>
References: <20221013163432.18545-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221013163432.18545-1-raphael.pavlidis@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670277363;
 bh=7HHmHDIwD3kyYrHvnvDDFn4EY+mYMnK7SdT4CUlkL4U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kJYB51s8o7JkCqSw9e1B3U2nmgMb1tukOH23VkRStFIQ+9kRUI5GaQZWN5fnfSwuj
 QQr51pb0SK7sPtO3h0iSiG6rDEnGi1h+1zvbUqBXH2Wr/P3siuK/ntAi1Xyr0Q6Hr0
 F0ghwEL+pcZ0PVCKmKhZhUsRdSiaftaAgtQFWWzScN20d/lhfFOQUCEmu28TXUvTfe
 LKyW4bd8v0+bD1R3apAIYMB0tf0WhLeojRwsG94GoqwexPTWqZlRo2uuSQf7u2c8ab
 i6MKEn2yKMky+YQYri4hjawDXurWvBAe6XJGXoOeaxVo8/8oFulbL1PSr5r0tk6vMj
 reB6QHy38sTRA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kJYB51s8
Subject: Re: [Buildroot] [PATCH v3 1/1] package/shadow: new package
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

Raphael, All,

On 2022-10-13 18:34 +0200, Raphael Pavlidis spake thusly:
> shadow provides utilities to deal with user accounts.
> 
> The shadow package includes the necessary programs for converting UNIX
> password files to the shadow password format, plus programs for managing
> user and group accounts. Especially it is useful if rootless podman
> container should be used, which requires newuidmap and newgidmap.
> 
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

I was about to apply this, after fixing the minor issues (see below),
but there is a rather major blocker, see below too...

> ---
[--SNIP--]
> diff --git a/package/shadow/Config.in b/package/shadow/Config.in
> new file mode 100644
> index 0000000000..6b1fe0a61f
> --- /dev/null
> +++ b/package/shadow/Config.in
> @@ -0,0 +1,61 @@
[--SNIP--]
> +config BR2_PACKAGE_SHADOW_ACCOUNT_TOOLS_SETUID
> +	bool "account-tools-setuid"
> +	depends on BR2_USE_MMU  # linux-pam
> +	depends on BR2_ENABLE_LOCALE  # linux-pam
> +	depends on BR2_USE_WCHAR  # linux-pam
> +	depends on !BR2_STATIC_LIBS  # linux-pam
> +	select BR2_PACKAGE_LINUX_PAM
> +	help
> +	  Install the user and group management tools (e.g. groupadd) with setuid and

    $ make check-package
    package/shadow/Config.in:24: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

[--SNIP--]
> +config BR2_PACKAGE_SHADOW_SUBORDINATE_IDS
> +	bool "subordinate-ids"
> +	help
> +	  Support subordinate ids. Helpful to use container solution like podman

    $ make check-package
    package/shadow/Config.in:39: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

[--SNIP--]
> diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
> new file mode 100644
> index 0000000000..261f28dd28
> --- /dev/null
> +++ b/package/shadow/shadow.mk
> @@ -0,0 +1,133 @@
> +################################################################################
> +#
> +# shadow
> +#
> +################################################################################
> +
> +SHADOW_VERSION = 4.11.1

Why 4.11.1? It was released in 2022-01-03, and is affected by
CVE-2013-4235, with version 4.12.2 being the first to include the fix
for it, and there is now 4.13:

    https://www.cve.org/CVERecord?id=CVE-2013-4235
    https://github.com/shadow-maint/shadow/releases/tag/4.12.2
    https://github.com/shadow-maint/shadow/pull/545

> +SHADOW_SITE = https://github.com/shadow-maint/shadow/releases/download/v$(SHADOW_VERSION)
> +SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
> +SHADOW_LICENSE = BSD-3-Clause
> +SHADOW_LICENSE_FILES = COPYING

And:

    SHADOW_CPE_ID_VENDOR = debian

=> https://nvd.nist.gov/products/cpe/detail/11DE0412-97D8-4ABC-9807-101628A40DBE?namingFormat=2.3&orderBy=CPEURI&keyword=shadow&status=FINAL

> +SHADOW_CONF_OPTS = \
> +	--disable-man \
> +    --without-btrfs \
> +    --without-nscd \
> +    --without-skey \
> +    --without-sssd \
> +    --without-su \
> +    --without-tcb

    $ make check-package
    package/shadow/shadow.mk:15: expected indent with tabs
    package/shadow/shadow.mk:16: expected indent with tabs
    package/shadow/shadow.mk:17: expected indent with tabs
    package/shadow/shadow.mk:18: expected indent with tabs
    package/shadow/shadow.mk:19: expected indent with tabs
    package/shadow/shadow.mk:20: expected indent with tabs

> +ifeq ($(BR2_PACKAGE_SHADOW_SHADOWGRP),y)
> +SHADOW_CONF_OPTS += --enable-shadowgrp
> +else
> +SHADOW_CONF_OPTS += --disable-shadowgrp
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SHADOW_ACCOUNT_TOOLS_SETUID),y)
> +SHADOW_CONF_OPTS += --enable-account-tools-setuid
> +define SHADOW_ACCOUNT_TOOLS_SETUID_PERMISSIONS

This is named SHADOW_ACCOUNT_TOOLS_SETUID_PERMISSIONS, but [0]...

> +	/usr/sbin/chgpasswd f 4755 0 0 - - - - -
> +	/usr/sbin/chpasswd f 4755 0 0 - - - - -
> +	/usr/sbin/groupadd f 4755 0 0 - - - - -
> +	/usr/sbin/groupdel f 4755 0 0 - - - - -
> +	/usr/sbin/groupmod f 4755 0 0 - - - - -
> +	/usr/sbin/newusers f 4755 0 0 - - - - -
> +	/usr/sbin/useradd f 4755 0 0 - - - - -
> +	/usr/sbin/usermod f 4755 0 0 - - - - -

What about userdel?

[--SNIP--]
> +define SHADOW_PERMISSIONS
> +	/usr/bin/chage f 4755 0 0 - - - - -
> +	/usr/bin/chfn f 4755 0 0 - - - - -
> +	/usr/bin/chsh f 4755 0 0 - - - - -
> +	/usr/bin/expiry f 4755 0 0 - - - - -
> +	/usr/bin/gpasswd f 4755 0 0 - - - - -
> +	/usr/bin/newgrp f 4755 0 0 - - - - -
> +	/usr/bin/passwd f 4755 0 0 - - - - -
> +	$(SHADOW_ACCOUNT_TOOLS_SETUID)

... [0] here the expansion uses the wrong name...

So, I had fixed all the minor issues, but the version bump will require
a bit more testing that I can do locally. Nicolas (in Cc) who reviewed
this patch, said he had a runtime test; maybe you can both sync to get
that test part of the series when you respin?

Regards,
Yann E. MORIN.

> +	$(SHADOW_SUBORDINATE_IDS_PERMISSIONS)
> +endef
> +
> +$(eval $(autotools-package))
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
