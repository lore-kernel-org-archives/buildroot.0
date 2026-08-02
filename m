Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBCEC55175
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 15:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81D8B80C7E;
	Sun,  2 Aug 2026 15:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zk6HyHg8qHg2; Sun,  2 Aug 2026 15:33:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DF8180C9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785684795;
	bh=jIl2YTvRJ0kg3PvmMQt7FrXlg8cESXzW6+y8obxlPTE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BW4lA9B+bCnLwPGxU7zHKpIo4dwm4z6GtgM1ssPE2+rp8/FUMNHFnhu3T6NKNgqzh
	 Wc5xQh+TgIIhbylICsFI0oXue1vooVpbC2pJ3f/mCyvv57hfxDbLz2tEkxR5sUyIrw
	 2pxcFORf8X+8iU2l2utJIa8YU8A2K1KSGRsQAztZcLDEs8N8+YpsZf5hLaB5LgmvjB
	 l9/9fpZFePPxpFtOEa/jPLQPNXDTS/nBbDs6k93htYwv181NH7FpRGeRRTfk01Q8vA
	 /bcJuI4CM+CF5ybqaJRcQBkX0GF9rzPW3cfmIrqgX5nGH2DDYx1j+IheFfKziFxC/R
	 B6dThSgavfZXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DF8180C9B;
	Sun,  2 Aug 2026 15:33:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87B202CE
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 15:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E27980C9A
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 15:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bP2WDg7_m_mw for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 15:33:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 692CD80C7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 692CD80C7E
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 692CD80C7E
 for <buildroot@busybox.net>; Sun,  2 Aug 2026 15:33:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 7EBE02003CC;
 Sun,  2 Aug 2026 17:33:10 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Aug 2026 17:33:10 +0200
MIME-Version: 1.0
Date: Sun, 02 Aug 2026 17:33:10 +0200
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
In-Reply-To: <20260721093932.282565-6-francois.perrad.86@gmail.com>
References: <20260721093932.282565-1-francois.perrad.86@gmail.com>
 <20260721093932.282565-6-francois.perrad.86@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <600a34ac3c2ab206346af72a286baab2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785684791;
 bh=RJOgwbb57Vf4I9PTkzKh9kj55CHVh2BJS8dS7iYP0ko=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rH677V4ioFxl+B6NFSsd4Qvfd2OsmQDJt9gcKYTrROGD3915pVHGYS/T5TtXhMp42
 kW14uaxmKEUIMbsCRT4X7fjgStejN5yqoaMB/s0bnKQMqQUexPn7eoWSELFCcJllza
 jj4zOyqp0j//q/7LufhWuw7nUOuW5iAKFw2rDK7wpmxXMKvty9ldTsw0Mqcb3TIjcR
 wna4VGHDq3TBOSuQOqfSu4yD8goD77OYLxv9ruuOJGVIVMDLnLkJaw7hFEiYmza7cA
 gUoHDidt837LCTAaXvCdb3EMt8yzELmr0w9eQDH7t4sm0JGle035al7F2EggLSuI0C
 FXwx4pnv0vVlg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rH677V4i
Subject: Re: [Buildroot] [PATCH v3 5/8] package/pkg-hare.mk: new
 infrastructure
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Francois,

On 21/07/2026 11:39, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
> ---
[...]
> diff --git a/package/pkg-hare.mk b/package/pkg-hare.mk
> new file mode 100644
> index 000000000..e1c1415d0
> --- /dev/null
> +++ b/package/pkg-hare.mk
> @@ -0,0 +1,95 @@
> +################################################################################
> +# Hare package infrastructure
> +# see https://harelang.org/
> +#
> +# This file implements an infrastructure that eases development of
> +# package .mk files for Hare packages.
> +#
> +# See the Buildroot documentation for details on the usage of this
> +# infrastructure
> +#
> +# In terms of implementation, this Hare infrastructure requires
> +# the .mk file to only specify metadata information about the
> +# package: name, version, etc.
> +#
> +################################################################################
> +
> +HARE_RUN_CMD = PATH=$(BR_PATH) 
> HAREPATH="$(HOST_DIR)/usr/src/hare/stdlib:$(STAGING_DIR)/usr/src/hare/third-party" 
> $(HOST_DIR)/bin/hare

Buildroot decided a long time ago to avoid installing
files in "$(HOST_DIR)/usr/".

So the previous line could reflect that. While at it, maybe you could
split this long line. For ex:

HARE_RUN_CMD = \
     PATH=$(BR_PATH) \
     
HAREPATH="$(HOST_DIR)/src/hare/stdlib:$(STAGING_DIR)/usr/src/hare/third-party" 
\
     $(HOST_DIR)/bin/hare

> +HARE_ARCH_OPT = -a $(ARCH)
> +HARE_LIBDIR_OPT = -L $(STAGING_DIR)/usr/lib
> +
> +################################################################################
> +# inner-hare-package -- defines how the configuration, compilation and
> +# installation of a Hare package should be done, implements a few 
> hooks to
> +# tune the build process and calls the generic package infrastructure 
> to
> +# generate the necessary make targets
> +#
> +#  argument 1 is the lowercase package name
> +#  argument 2 is the uppercase package name, including a HOST_ prefix
> +#             for host packages
> +#  argument 3 is the uppercase package name, without the HOST_ prefix
> +#             for host packages
> +#  argument 4 is the type (target or host)
> +################################################################################
> +
> +define inner-hare-package
> +
> +$(2)_DEPENDENCIES += host-hare
> +
> +#
> +# Build step. Only define it if not already defined by the package .mk
> +# file.
> +#
> +ifndef $(2)_BUILD_CMDS
> +# in perfect world, all project follows the conventions described in 
> https://harelang.org/documentation/usage/project-structure.html#makefiles
> +# but in real world, the target "all" is not always the default one
> +define $(2)_BUILD_CMDS
> +	if grep "^all:" $$($(2)_SRCDIR)Makefile > /dev/null; then \
> +		$(MAKE) -C $$($(2)_SRCDIR) HARE="$$(HARE_RUN_CMD)" 
> HAREFLAGS="$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)" all; \
> +	else \
> +		$(MAKE) -C $$($(2)_SRCDIR) HARE="$$(HARE_RUN_CMD)" 
> HAREFLAGS="$$(HARE_ARCH_OPT) $$(HARE_LIBDIR_OPT)"; \
> +	fi
> +endef
> +endif
> +
> +#
> +# Staging installation step. Only define it if not already defined by
> +# the package .mk file.
> +#
> +ifndef $(2)_INSTALL_STAGING_CMDS
> +define $(2)_INSTALL_STAGING_CMDS
> +	$(MAKE) -C $$($(2)_SRCDIR) PREFIX=/usr DESTDIR="$$(STAGING_DIR)" 
> install
> +endef
> +endif
> +
> +#
> +# Target installation step. Only define it if not already defined by
> +# the package .mk file.
> +#
> +ifndef $(2)_INSTALL_TARGET_CMDS
> +define $(2)_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $$($(2)_SRCDIR) PREFIX=/usr DESTDIR="$$(TARGET_DIR)" 
> install
> +endef
> +endif
> +
> +# Call the generic package infrastructure to generate the necessary
> +# make targets
> +$(call inner-generic-package,$(1),$(2),$(3),$(4))
> +
> +endef
> +
> +################################################################################
> +# hare-package -- the target generator macro for Hare packages
> +################################################################################
> +
> +hare-package = $(call inner-hare-package,$(pkgname),$(call 
> UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
> +
> +################################################################################
> +# Cleanup target /usr/src/hare
> +################################################################################
> +
> +define HARE_FINALIZE_TARGET
> +	rm -rf $(TARGET_DIR)/usr/src/hare
> +endef
> +
> +TARGET_FINALIZE_HOOKS += HARE_FINALIZE_TARGET
> --
> 2.43.0

Could you send and updated series addressing this, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
