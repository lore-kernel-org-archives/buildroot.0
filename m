Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A02C4451B
	for <buildroot@archiver.kernel.org>; Sat, 18 Jul 2026 14:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E10AA80EA1;
	Sat, 18 Jul 2026 14:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rBoAlIAmJ9Is; Sat, 18 Jul 2026 14:31:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B793980D0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784385079;
	bh=QzklA/3UF6961cpFJkBQEVqaBVat3tnqHv9HFylVjlA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FAK4i0M+EgvQBW4ieAeZaX5PI5UoSn0d7WiZcUq0q5Er2YmdOWnS4F+vM7wmqqS2q
	 6iJek1bKaG1lnV7N12XQKDuVgBepR6A9JkKDeVeIYhB/yrhOuM/lNauhYlcQiktDWz
	 fD2Mlf7AlT11lbYOJFRH8VhS0wiwoGWKC6ZOfjKXzZvK7U/tkAu72vBY0WGIsBLFfG
	 aCfteCaNRBqgpHD48jNYQP99jst7KLW4RPeqNfcHQA8LJPd265ZAQ4QADcNeupy68l
	 4fLfSEaaiw9wFJghDwVI2ebpQ2b2dTEZ7n67Ti3eGGzx3xWSwtpSnWH1+bYxpTloEG
	 twPTCFFckF3ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B793980D0B;
	Sat, 18 Jul 2026 14:31:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F1BAC1F6
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 14:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7AD380D0B
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 14:31:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RXASlHaKC1xd for <buildroot@buildroot.org>;
 Sat, 18 Jul 2026 14:31:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 339C580CDE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 339C580CDE
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 339C580CDE
 for <buildroot@busybox.net>; Sat, 18 Jul 2026 14:31:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 77253780502;
 Sat, 18 Jul 2026 16:31:11 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 18 Jul 2026 16:31:11 +0200
MIME-Version: 1.0
Date: Sat, 18 Jul 2026 16:31:11 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20260612205029.269642-6-francois.perrad@gadz.org>
References: <20260612205029.269642-1-francois.perrad@gadz.org>
 <20260612205029.269642-6-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.17
Message-ID: <321ed3822856bbc3274d2a4261c39d56@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784385072;
 bh=tf+yqrfG+x+CP3hQbTbn7gLapDAXzv2yqpqjptr2fiY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nKIQe3wsTNDQxiXaqyMKPJNSy3dkBJAjB5wBsN085XrK1nPk32pi7OdaVVSOxQVPp
 Q3Y2K6iKdyj/1QTN4x/NHwrvLbpNXsgllrO/o5k/PYlXFEZWfxcSPSse+3d8vU+H1y
 qRMfULqpT8cwLaqJgC84jO+e2gaHH+XLUlfMLGfpe04OWqvwiqwHfvam5Tu8GF4GW4
 /wBoAfd5csoZK1uARFoZX/by9CgUGyMUBLnbR18I4yoI76KvtENH7w0i0i3O/xV0Jc
 /BkWjYiSI0cMxMG5+PgbR76hSbzf4MPcxpKsdQjbCOUZVxCBzx/j9wf1vAicYzVmwn
 AQC6FjouBvU/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nKIQe3ws
Subject: Re: [Buildroot] [RFC PATCH 5/9] package/hare: new infrastructure
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

Thanks for the patch.

Could you reword the commit title to:
"package/pkg-hare.mk: new infrastructure"
to avoid confusion with the actual hare package.

I also have another comment, see below.

On 12/06/2026 22:50, Francois Perrad via buildroot wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  DEVELOPERS                            |  1 +
>  docs/manual/adding-packages-hare.adoc | 87 +++++++++++++++++++++++++
>  docs/manual/adding-packages.adoc      |  2 +
>  package/Makefile.in                   |  1 +
>  package/pkg-hare.mk                   | 93 +++++++++++++++++++++++++++
>  5 files changed, 184 insertions(+)
>  create mode 100644 docs/manual/adding-packages-hare.adoc
>  create mode 100644 package/pkg-hare.mk
[...]
> diff --git a/package/pkg-hare.mk b/package/pkg-hare.mk
> new file mode 100644
> index 000000000..9e3aa929f
> --- /dev/null
> +++ b/package/pkg-hare.mk
> @@ -0,0 +1,93 @@
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
> +define $(2)_BUILD_CMDS
> +	if grep "^all:" $$($(2)_SRCDIR)Makefile > /dev/null; then \

Is this grep really needed? Looking at the hare packages (ev, xml,
dbus), there is "build" and "all" targets. They are always at the
first position. So just calling "make" should take the first target
anyways and should be sufficient.

If hare packages can be built without this grep, I would prefer
to remove it. If it's not possible, could you add a comment
explaining why we can avoid it, please?

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

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
