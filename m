Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59354C28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 20:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6A55828E3;
	Mon, 22 Aug 2022 20:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6A55828E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id doi_-PLiuNmO; Mon, 22 Aug 2022 20:06:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E326982560;
	Mon, 22 Aug 2022 20:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E326982560
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73E921BF417
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 20:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4918E828AF
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 20:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4918E828AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JEm82bm5ZctJ for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 20:06:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B49C981DCB
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B49C981DCB
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 20:06:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:961:575d:b2ff:71eb])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id F0FFB6012E;
 Mon, 22 Aug 2022 22:06:06 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 22 Aug 2022 22:06:06 +0200
Date: Mon, 22 Aug 2022 22:06:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Perrot <thomas.perrot@bootlin.com>
Message-ID: <20220822200606.GF2167049@scaer>
References: <20220422100918.2818811-1-thomas.perrot@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220422100918.2818811-1-thomas.perrot@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661198770;
 bh=v3m2m/i6euQPYqXA3NLEbqBLgBrPr1E9W5Ap+L9H8mo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IELpOMNf0XGLf221OOKKlir+C0RewHXIFlniV7oZX9BKlEb8p2UA7yB8g4ekjhiJK
 lI9mQzeg3fpYfvCo9G48jxyS+jWA8smb0Ywdl6Hn5pQ2vS2Ix5mBuB8uarngrfHdaP
 GClkHbfB1czTmc2Fe+K7PoLAm7D6pz+d1e91z4PCcruRZSc0+GKU/++cmx8RuxxE6h
 NqeuLm3Cl0GvgIbtVhPJXByF7bY7ArKJLbL3cXF0KI06jop8JhXMKpBmuCTKcLAzgw
 oLC82nspK4SqZXZKPOYvLprG3lxWHxWN7PzY6KOLYYc5B2hwwijo7PxDuVhty6/2Yt
 mcA4t9lgFqnlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IELpOMNf
Subject: Re: [Buildroot] [PATCH v3 2/2] package/imx-cst: new package
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-04-22 12:09 +0200, Thomas Perrot via buildroot spake thusly:
> This package provides i.MX Code Signing Tools uses to sign i.MX bootloader
> to enable secure boot (HABv4 and AHAB).
> 
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
[--SNIP--]
> diff --git a/package/imx-cst/Config.in.host b/package/imx-cst/Config.in.host
> new file mode 100644
> index 000000000000..84cb825e59cf
> --- /dev/null
> +++ b/package/imx-cst/Config.in.host

Unlike Heiko, I think this is the proper location. We already have
    package/imx-mkimage/
    package/imx-usb-loader/

> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_HOST_IMX_CST
> +	bool "host imx-cst"
> +	help
> +	  I.MX code signing tool provides software code signing
> +	  support designed that integrate the HABv4 and AHAB
> +	  library.
> +
> +	  https://www.nxp.com/webapp/sps/download/license.jsp?colCode=IMX_CST_TOOL

So, the homepage is on the official NXP site, but...

[--SNIP--]
> diff --git a/package/imx-cst/imx-cst.mk b/package/imx-cst/imx-cst.mk
> new file mode 100644
> index 000000000000..120f9c5575e1
> --- /dev/null
> +++ b/package/imx-cst/imx-cst.mk
> @@ -0,0 +1,43 @@
> +################################################################################
> +#
> +# imx-cst
> +#
> +################################################################################
> +
> +# debian/3.3.1+dfsg-2
> +IMX_CST_SITE = https://gitlab.apertis.org/pkg/imx-code-signing-tool.git

You are using the debian git tree. You need to explain that.

> +IMX_CST_SITE_METHOD = git
> +IMX_CST_VERSION = e2c687a856e6670e753147aacef42d0a3c07891a
> +IMX_CST_LICENSE = BSD-3-Clause
> +IMX_CST_LICENSE_FILES = LICENSE.bsd3
> +
> +HOST_IMX_CST_DEPENDENCIES = host-byacc host-flex host-openssl
> +
> +# We don't use HOST_CONFIGURE_OPTS when building cst, because we need
> +# to preserve the CFLAGS/LDFLAGS used by their Makefile.
> +define HOST_IMX_CST_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) \
> +		OSTYPE=linux64 \

It was my understanding from the previous review, that hard-coding
linux64 was not the proper solution.

Regards,
Yann E. MORIN.

> +		ENCRYPTION=yes \
> +		AR="$(HOSTAR)" \
> +		CC="$(HOSTCC)" \
> +		LD="$(HOSTCC)" \
> +		OBJCOPY="$(HOSTOBJCOPY)" \
> +		RANLIB="$(HOSTRANLIB)" \
> +		EXTRACFLAGS="$(HOST_CFLAGS) $(HOST_CPPFLAGS)" \
> +		EXTRALDFLAGS="$(HOST_LDFLAGS)" \
> +		PWD=$(@D)/code/cst \
> +		-C $(@D)/code/cst \
> +		build
> +	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
> +		COPTS="$(HOST_CFLAGS) $(HOST_CPPFLAGS) $(HOST_LDFLAGS)" \
> +		-C $(@D)/code/hab_csf_parser
> +endef
> +
> +define HOST_IMX_CST_INSTALL_CMDS
> +	$(INSTALL) -D -m 755 $(@D)/code/cst/code/obj.linux64/cst $(HOST_DIR)/bin/cst
> +	$(INSTALL) -D -m 755 $(@D)/code/cst/code/obj.linux64/srktool $(HOST_DIR)/bin/srktool
> +	$(INSTALL) -D -m 755 $(@D)/code/hab_csf_parser/csf_parser $(HOST_DIR)/bin/csf_parser
> +endef
> +
> +$(eval $(host-generic-package))
> --
> 2.35.1
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
