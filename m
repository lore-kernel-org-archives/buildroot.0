Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6683CAC597
	for <buildroot@archiver.kernel.org>; Thu, 18 Sep 2025 06:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 886C860DDF;
	Thu, 18 Sep 2025 06:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SV-GZxcIMxgJ; Thu, 18 Sep 2025 06:59:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9937B60DEC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9937B60DEC;
	Thu, 18 Sep 2025 06:59:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 60C221E3
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 06:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46D6A81DFE
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 06:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9dDb0eaLdA51 for <buildroot@buildroot.org>;
 Thu, 18 Sep 2025 06:59:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4620F81769
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4620F81769
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4620F81769
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 06:59:35 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 680B331E0A42; Thu, 18 Sep 2025 08:59:33 +0200 (CEST)
Date: Thu, 18 Sep 2025 08:59:33 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <aMut1SuRSaMGqS24@waldemar-brodkorb.de>
References: <aMuoZp7b7IWmRRXs@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aMuoZp7b7IWmRRXs@waldemar-brodkorb.de>
X-Operating-System: Linux 6.12.43+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1758178773; bh=n+8dTMcr59+DVvZDU4+627dAq6OtjWy8UcEg7LwVMe8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lw+dEmn5RH5o7Gf6ugjrBjZEPK5/9ya2nZcGbOUV3AAees6wdBCNqy6iZYIzQ/Wdd
 0VwmhS6iVztHmGKehd8F3kCs1YPJti3maWnySfz3VeRjdUjFYaF4gOpl16HVOL/BCE
 oD4hOesWiRa2I2aXmHiB1KCpDvCo3/ptTOcSeHfOEF+O+Qnzlh2MmPeun6KKGI9u5N
 MSjIzwAXDZYcYCQnETk7zHieGIYr7Ei7PPV8bztCF285Pyb8V78k9vkCxwTl4vrL91
 ylM4up2A0IpRkYJjbR0zY+5LSi9qJKIHOONWOAv8RJ/J/a3P20q61kf0QYwieV4iBU
 X3lvkXEjNuoWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=lw+dEmn5
Subject: Re: [Buildroot] [PATCH] package/x11r7/xapp_xdm: needs libxcrypt
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

I forgot to mention, this is a candidate for stable branches.

best regards
 Waldemar

Waldemar Brodkorb wrote,

> While doing a per-package build the package is failing to
> compile with this error (gcc 13.x glibc toochain):
> make[3]: Entering directory
> '/home/wbx/buildroot-2025.02.3/output/build/xapp_xdm-1.1.14/xdm'   CC
> session.o session.c:146:11: fatal error: crypt.h: No such file or
> directory   146 | # include <crypt.h>       |           ^~~~~~~~~
> compilation terminated.
> 
> Fix this error by providing the needed glibc dependencies.
> 
> Fixes:
>  https://autobuild.buildroot.org/results/b75/b75ad8f1159613656dce482992c800545d60ae69/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/x11r7/xapp_xdm/Config.in   | 1 +
>  package/x11r7/xapp_xdm/xapp_xdm.mk | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/x11r7/xapp_xdm/Config.in b/package/x11r7/xapp_xdm/Config.in
> index 1ac15ce368..adeb3ce0c0 100644
> --- a/package/x11r7/xapp_xdm/Config.in
> +++ b/package/x11r7/xapp_xdm/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_XAPP_XDM
>  	depends on BR2_USE_MMU # fork()
>  	# Runtime dependency: can't start an X server unless there is one
>  	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
> +	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
>  	select BR2_PACKAGE_XAPP_SESSREG
>  	select BR2_PACKAGE_XAPP_XRDB
>  	select BR2_PACKAGE_XLIB_LIBX11
> diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
> index 035f2e9484..2a343b55e2 100644
> --- a/package/x11r7/xapp_xdm/xapp_xdm.mk
> +++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
> @@ -30,6 +30,10 @@ else
>  XAPP_XDM_CONF_OPTS += --without-xinerama
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
> +XAPP_XDM_DEPENDENCIES += libxcrypt
> +endif
> +
>  define XAPP_XDM_INSTALL_INIT_SYSV
>  	$(INSTALL) -m 0755 -D package/x11r7/xapp_xdm/S99xdm \
>  		$(TARGET_DIR)/etc/init.d/S99xdm
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
