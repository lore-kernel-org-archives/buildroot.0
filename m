Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4587CC433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 17:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0B9A84087;
	Wed, 20 Apr 2022 17:36:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vsge8xU3zhBc; Wed, 20 Apr 2022 17:36:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D743784066;
	Wed, 20 Apr 2022 17:36:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C65C31BF4D6
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 17:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEA39417CE
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 17:36:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XOBHT61ooRMF for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 17:36:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D243741749
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 17:36:51 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id CFACA440787;
 Wed, 20 Apr 2022 20:36:07 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1650476168;
 bh=Qr5UbSI4Gn8Hne8ivNdKhRezEVl33rLTgu6zI4r6jIs=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=LoHDWj4uZIFYCuS5eRLl+lP18lH+aypDuor+xgwQvq4SR93ShKFF9sLdCzMLn3rKb
 Jk0oYa2hUVKcZBNJVBEBlb1B2CezQ9iz8tqw/FzpuDNkCweyqDhbovLMQ27oYkyAKl
 D8fbWvXwt+c7pkBdQJen5qTdLWA17wa2Y0ED9SIKwRpS9ceimFnvWFjQTAy6TMi9RM
 1QVnUpoZ4IwL4qKvkzcNWhdiCvEJgM/D47TKWu6iz6Yo7IewZM+n0lEqgKFUD0QRtl
 op228noXluBP233PnAQYG1UorO3VMyClgNJRCX7YGtKissvCE5EBpLNz8i2EJDt0V0
 zQL3WHFaGHQOw==
References: <20220420083923.3875405-1-thomas.perrot@bootlin.com>
 <20220420083923.3875405-2-thomas.perrot@bootlin.com>
User-agent: mu4e 1.6.10; emacs 27.1
To: Thomas Perrot <thomas.perrot@bootlin.com>
Date: Wed, 20 Apr 2022 20:28:06 +0300
In-reply-to: <20220420083923.3875405-2-thomas.perrot@bootlin.com>
Message-ID: <87pmlbr70w.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/imx-cst: new package
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Wed, Apr 20 2022, Thomas Perrot via buildroot wrote:
> This package provides i.MX Code Signing Tools uses to sign i.MX bootloader
> to enable secure boot (HABv4 and AHAB).
>
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---

[...]

> diff --git a/package/imx-cst/imx-cst.mk b/package/imx-cst/imx-cst.mk
> new file mode 100644
> index 000000000000..c91dfb602cbf
> --- /dev/null
> +++ b/package/imx-cst/imx-cst.mk
> @@ -0,0 +1,49 @@
> +################################################################################
> +#
> +# imx-cst
> +#
> +################################################################################
> +
> +# debian/3.3.1+dfsg-2
> +IMX_CST_SITE = https://gitlab.apertis.org/pkg/imx-code-signing-tool.git
> +IMX_CST_SITE_METHOD = git
> +IMX_CST_VERSION = e2c687a856e6670e753147aacef42d0a3c07891a
> +IMX_CST_LICENSE = BSD-3-Clause
> +IMX_CST_LICENSE_FILES = LICENSE.bsd3
> +
> +HOST_IMX_CST_DEPENDENCIES = host-byacc host-flex host-openssl
> +
> +ifneq ($(filter %64,$(HOSTARCH)),)
> +HOST_IMX_CST_OSTYPE = linux64
> +else
> +HOST_IMX_CST_OSTYPE = linux32
> +endif

It looks like the only difference between 64 and 32 is in openssl build
rule, and for x86 (host) targets only. We don't use this openssl rule
since we build host-openssl with our own rules. So maybe we can just
arbitrarily choose hard coded 'linux64'. It seems that debian/Makefile
does that.

baruch

> +
> +# We don't use HOST_CONFIGURE_OPTS when building cst, because we need
> +# to preserve the CFLAGS/LDFLAGS used by their Makefile.
> +define HOST_IMX_CST_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) \
> +		OSTYPE=$(HOST_IMX_CST_OSTYPE) \
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


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
