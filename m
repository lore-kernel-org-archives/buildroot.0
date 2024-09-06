Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0103E6FE41
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 18:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5AE560770;
	Fri,  6 Sep 2024 18:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oV_Lf2BuEY3a; Fri,  6 Sep 2024 18:16:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB55F60664
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB55F60664;
	Fri,  6 Sep 2024 18:16:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 47C261BF309
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35E4C805AD
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:16:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7tTIUV-sUo-t for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 18:16:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6DEEF80581
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DEEF80581
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DEEF80581
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 18:16:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 467AA13F846;
 Fri,  6 Sep 2024 20:16:09 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 06 Sep 2024 20:16:09 +0200
Date: Fri, 6 Sep 2024 20:16:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZttG6RpmwYgxXhkc@landeda>
References: <20240906171503.3495498-1-dario.binacchi@amarulasolutions.com>
 <20240906171503.3495498-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240906171503.3495498-2-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725646575;
 bh=GKn/Ktq4/AL2/qo4ibSdiLfR/NwPDPePshCFnTzjnKI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aUw8ZX49NcqDq+GFLmdLSsvOW/ZSGL1ukQazznP/SBUcW20xuWOq97Pvb3GQGCkJ5
 iyGlLXaPbouLcm9jTtCujTnipDctPznER/svkp2gMezplcbYKBj9lIYUXmhh+GkVTm
 +X8ZVslWbI9UkWsrtPR612HzzRGOWFrqLurobXjHlkAtdH3fsh3fqDykLfg6FzsBE+
 cKKs8EjrkqmvkmiaHwCPqQC4MEMXGxq8KnIuYFAYfOhF9V1Iv04NWRDzaRcjof7Xk3
 ZEb7Cx4xsjTA0FCQ8Kd3rNFzlGMVLEQ1wNHz7TDHwjA2zx9w68YAn+hymQXjFSH8B1
 faAwhU1Mxa/DA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=aUw8ZX49
Subject: Re: [Buildroot] [PATCH v3 2/2] package/ipmitool: use versioned or
 local PEN registry
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All.,

On 2024-09-06 19:15 +0200, Dario Binacchi spake thusly:
> The previous default URL used for the PEN registry was not stable and
> could change at any time, making it unacceptable to have to update its
> hash every time.
> 
> With this patch, ipmitool now uses by default a versioned PEN (Enterprise
> Numbers) registry file from IANA provided by the iana-assignments package.
> Alternatively, it also allows the use of a local file. URL paths for
> downloading such a file are no longer supported.
> 
> Co-Developed-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Co-Developed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
[--SNIP--]
> +choice
> +	prompt "PEN registry"
> +	default BR2_PACKAGE_IPMITOOL_USE_IANA_PEN
> +
> +config BR2_PACKAGE_IPMITOOL_USE_IANA_PEN
> +	bool "Using IANA PEN registry"
> +	select BR2_PACKAGE_IANA_ASSIGNMENTS
> +	select BR2_PACKAGE_IANA_ASSIGNMENTS_PEN_REG
> +
> +config BR2_PACKAGE_IPMITOOL_USE_CUSTOM_PEN
> +	bool "Using a custom PEN registry file"

This is supposed to be covered by the rootfs-overlay feature, in my
opinion.

So, I would really suggest we do like I explained in my previous review:
if the PEN is installed by ieana-assginments, the ipmi-tools uses it.
Otherwise, it is the responsibility of the user to provide one in the
proper location.

Which means the IANADIR must always be set, and a comment in the help
text for ipmitool should explain where th euser can install their custom
PEN in an overlay.

[--SNIP--]
> diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
> index 4f2151904d43..f16500739ce6 100644
> --- a/package/ipmitool/ipmitool.mk
> +++ b/package/ipmitool/ipmitool.mk
> @@ -49,20 +49,20 @@ endef
>  IPMITOOL_POST_INSTALL_TARGET_HOOKS += IPMITOOL_REMOVE_IPMIEVD
>  endif
>  
> -IPMITOOL_PEN_REG_URI = $(call qstrip,$(BR2_PACKAGE_IPMITOOL_PEN_REG_URI))
> -ifneq ($(IPMITOOL_PEN_REG_URI),)
> -ifneq ($(findstring ://,$(IPMITOOL_PEN_REG_URI)),)
> -IPMITOOL_EXTRA_DOWNLOADS += $(IPMITOOL_PEN_REG_URI)
> -BR_NO_CHECK_HASH_FOR += $(notdir $(IPMITOOL_PEN_REG_URI))
> -IPMITOOL_PEN_REG = $(IPMITOOL_DL_DIR)/$(notdir $(IPMITOOL_PEN_REG_URI))
> +ifeq ($(BR2_PACKAGE_IPMITOOL_USE_IANA_PEN),y)
> +IPMITOOL_DEPENDENCIES += iana-assignments

There is no need for a build-time dependency, as the file is only ever
needed at runtime, is there?

Regards,
Yann E. MORIN.

> +IPMITOOL_CONF_ENV += IANADIR=/usr/share/misc/iana
>  else
> -IPMITOOL_PEN_REG = $(IPMITOOL_PEN_REG_URI)
> +IPMITOOL_PEN_FILE = $(call qstrip,$(BR2_PACKAGE_IPMITOOL_USE_CUSTOM_PEN_FILE))
> +ifneq ($(IPMITOOL_PEN_FILE),)
> +ifneq ($(findstring ://,$(IPMITOOL_PEN_FILE)),)
> +$(error "URL paths are no supported")
>  endif #findstring
> -define IPMITOOL_INSTALL_PEN_REG
> -	$(INSTALL) -D -m 0644 $(IPMITOOL_PEN_REG) \
> +define IPMITOOL_INSTALL_PEN_FILE
> +	$(INSTALL) -D -m 0644 $(IPMITOOL_PEN_FILE) \
>  		$(TARGET_DIR)/usr/share/misc/enterprise-numbers
>  endef
> -IPMITOOL_POST_INSTALL_TARGET_HOOKS += IPMITOOL_INSTALL_PEN_REG
> -endif # IPMITOOL_PEN_REG_URI !empty
> -
> +IPMITOOL_POST_INSTALL_TARGET_HOOKS += IPMITOOL_INSTALL_PEN_FILE
> +endif # IPMITOOL_PEN_REG_FILEI !empty
> +endif # BR2_PACKAGE_IPMITOOL_USE_IANA_PEN
>  $(eval $(autotools-package))
> -- 
> 2.43.0
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
