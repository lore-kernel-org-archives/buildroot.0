Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1925EEF36E8
	for <buildroot@archiver.kernel.org>; Mon,  9 Mar 2026 07:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D364160756;
	Mon,  9 Mar 2026 07:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xpi-NqC0MY5b; Mon,  9 Mar 2026 07:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74547606B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773040798;
	bh=VtRaFHrQIyJdX9kOwSVW8DNeOJKcS3XK0J5HPV4IJIU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q/u+0m3ix87zZQfb3uWGIPgumGnyBO4YudqJbAAXSNxIlpIu8Q0EmWsmYyH/MFPkC
	 bAwq5+iC73o24oLSJwREbd4df32PFsjAM+NpddGzjQcAKL8rN1UZCr5qvea8Ldkllv
	 Ge3wUH1Q472ihPrpTOVdhYF1IT4e5KLmGjD/7BOxuSYuaeeYliGqdLylLa+n5k79aK
	 P3z1CWSgWMxuLLQInjk0U/Zyg8G60deOg51gOee3nOldeUoeKEV62SHukPW0CJuuuR
	 Vq2CpbUVj6TWe+b3MNpGkmiMvdvkuakUfbAVFuW+wG0A8YBFgFFU+AwGwa8GOVttzH
	 wrBcPdG2LSr1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74547606B6;
	Mon,  9 Mar 2026 07:19:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E21DC119
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 07:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7DB340D55
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 07:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XBMtw_iRZxQj for <buildroot@buildroot.org>;
 Mon,  9 Mar 2026 07:19:55 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6E59240CC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E59240CC3
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E59240CC3
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 07:19:53 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id EF9FDBDE15E4;
 Mon, 09 Mar 2026 08:19:49 +0100 (CET)
MIME-Version: 1.0
Date: Mon, 09 Mar 2026 07:19:49 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Andrew Barnes <umbramalison@gmail.com>
Cc: buildroot <buildroot@buildroot.org>
In-Reply-To: <mailman.8084.1767808015.2009750.buildroot@buildroot.org>
References: <mailman.8084.1767808015.2009750.buildroot@buildroot.org>
Message-ID: <baead927e63d6157abdfdde11153d262@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1773040790; bh=tJRnpjTUbdl2DBrhZYtp0qYAz0FAtYionQRj9vFXqXY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=n8cJZmBj9S/sclx4BOG7YPYXwpsbmJAE4KYYcxQQ/QxMvplp6CmOO0L51E4Hq6PND
 kBBKJzKJt6mA+PqaFu+82rmUm5j92xGTyBrMjq7067ySMfhhkl7eKjffnVMVbFTI32
 rllWM/8/zMZSJjZglODqhn74e0A4RrvwI2zAuKx0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=n8cJZmBj
Subject: Re: [Buildroot] External BR overriding upstream packages
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andy, ALL

Definitely an interesting idea.

On 2026-01-07 13:55, Andrew Barnes wrote:
> 
> External BR projects can curate their own packages, but they can't 
> easily
> modify a package if it already exists upstream.

I use a lot of overlays for existing Buildroot packages. Things like 
checking dependencies, deleting unnecessary files or modifying content 
in the target root filesystem are mostly done from hooks defined in 
these overlays.

> Ideally such modifications should be made to buildroots package and
> upstreamed.
> but if the modification is not to be accepted upstream, then we need
> another way.
> 
> Real examples for just one project i'm working on:
> 1. downgrade libinput version (Touch screen doesn't work with later
> versions, pending investigation)
> 2. mesa3d - enable legacy api for wpewebkit/cog (wpewebkit will be 
> adopting
> the new mesa3d api soon)
> 3. odd fix for getting QT6 to compile (raised already in mailing list,
> could be an upstream patch)
> 4. complete instrumentation of wpewebkit options (unsure if is worth
> upstreaming, will discuss it later)

5. I am currently confronted with a package requiring mbedtls-4.

> All these changes can be managed as patches that are applied ontop of 
> BR,
> once the changes stablise that can work too.
> 
> However, in an IRC discussion, I suggested it could be that BR allows
> duplicate packages, and uses the version from the external project 
> instead
> of the internal one.
> 
> here is a patch to do that:
> 

Ideally, only _complete_ external packages should be filtered, something 
like this:

> diff --git a/Makefile b/Makefile
> index ff25027c13..efb577b2b2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -532,7 +532,11 @@ ifneq ($(PACKAGE_OVERRIDE_FILE),)
>  -include $(PACKAGE_OVERRIDE_FILE)
>  endif
> 
> -include $(sort $(wildcard package/*/*.mk))

+define _is_complete
+	$(shell grep -q '\$$(eval \$$([a-z]*-package))' $(1) && echo $(1))
+endef

> +EXTERNAL_PACKAGE_MKS = $(foreach dir,$(BR2_EXTERNAL_DIRS),$(wildcard
> $(dir)/package/*/*.mk))

+COMPLETE_PACKAGE_MKS = $(foreach file,$(EXTERNAL_PACKAGE_MKS),$(call 
_is_complete,$(file)))

> +EXTERNAL_PROVIDED_PACKAGES = $(sort $(notdir $(patsubst %/,%,$(dir
> $(COMPLETE_PACKAGE_MKS)))))
> +BUILTIN_PACKAGE_MKS = $(filter-out $(addprefix package/,$(addsuffix
> /%,$(EXTERNAL_PROVIDED_PACKAGES))),$(sort $(wildcard package/*/*.mk)))
> +
> +include $(BUILTIN_PACKAGE_MKS)
> 
>  include boot/common.mk
>  include linux/linux.mk
> 
> 
> Happy to turn this into a proper patch email, I haven't done that this 
> time
> because I think it's more for interest than a serious suggestion.
> 
> Kind regards,
> 
> Andy

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
