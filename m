Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D819BC3A5A7
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 13:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3302E402F4;
	Thu,  8 Dec 2022 13:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3302E402F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r_PdPmbVCj76; Thu,  8 Dec 2022 13:16:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 636E740496;
	Thu,  8 Dec 2022 13:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 636E740496
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 760621BF3EB
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 13:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3979441775
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 13:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3979441775
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B0dCDjtuH3OS for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 13:16:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9291C41773
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9291C41773
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 13:16:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6A8081BF20A;
 Thu,  8 Dec 2022 13:16:48 +0000 (UTC)
Date: Thu, 8 Dec 2022 14:16:47 +0100
To: Danilo Bargen <mail@dbrgn.ch>
Message-ID: <20221208141647.0ca26b3c@windsurf>
In-Reply-To: <20221208110247.7002c3ca@c3po>
References: <20221208110247.7002c3ca@c3po>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670505408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CKPqNs4CyNugFYm+aChiRwiDfvY6n2eEF2BSYoMpZPE=;
 b=SCUy/xPXM6V1/AMzMtVrohLCWbny+tpaQLru1eZSJxOgfle3V1sHOFSfCWQJ+KZA7FwXkH
 YyBK+cdARGNzbdm8BwectsPhFlYTyvBWhhsKtt2zLUyoKKmiaLjng7EmETCB0IsJbY3d8h
 wVCyRr3/HgsgDsElFK9jzZwITtwSkihD9C8TrsHSDFTeu3aUcI5QeadNxwY4+buz8h4DKr
 Ofd93U+V7CYkPyYQp9nXpPL+sz/N5O0F2qxB1uSX2yM+/1qjt/Xj/2zWmaCz7yepA4QzcK
 KPtMrXvKhCS28C1efbSAm+XnRGhNPqFbMMQIK90dBNVzBIalACfeyX9WadZsDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SCUy/xPX
Subject: Re: [Buildroot] [PATCH 1/1] package/tealdeer: exclude unsupported
 targets
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Danilo,

On Thu, 8 Dec 2022 11:02:47 +0100
Danilo Bargen <mail@dbrgn.ch> wrote:

> Not all target architectures are supported by the "ring" dependency.
> 
> Signed-off-by: Danilo Bargen <mail@dbrgn.ch>

Thanks for working on this. Your patch is badly line-wrapped by your
e-mail client. You can disable wrapping in Claws Mail, or better you
can use "git send-email". See below for another comment.

> diff --git a/package/tealdeer/Config.in b/package/tealdeer/Config.in
> index 96ed81614b..a61a59f3ee 100644
> --- a/package/tealdeer/Config.in
> +++ b/package/tealdeer/Config.in
> @@ -1,6 +1,14 @@
>  config BR2_PACKAGE_TEALDEER
>  	bool "tealdeer"
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +    # Crypto dependency (ring) not available for mips:
> https://github.com/briansmith/ring/issues/562
> +    depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el)
> +    # Crypto dependency (ring) not available for PowerPC:
> https://github.com/briansmith/ring/issues/389
> +    depends on !(BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le)
> +    # Crypto dependency (ring) not available for Sparc:
> https://github.com/briansmith/ring/issues/1512
> +    depends on !(BR2_sparc || BR2_sparc64)
> +    # Crypto dependency (ring) not available for s390x:
> https://github.com/briansmith/ring/commit/4d2e1a8fb80398f7c3c0137ea8fdd512f82d37a0
> +    depends on !BR2_s390x

We normally handle this kind of situation using a
BR2_PACKAGE_TEALDEER_ARCH_SUPPORTS variable, like this:

config BR2_PACKAGE_TEALDEER_ARCH_SUPPORTS
	bool
	default y if ...
	depends on ...

config BR2_PACKAGE_TEALDEER
	bool "tealdeer"
	depends on BR2_PACKAGE_TEALDEER_ARCH_SUPPORTS

Also, in this kind of case, we prefer to use "positive" logic: instead
of excluding the architectures that are not supported, it is better to
list the ones that are supported.

Side note: overall, if you take a step back, it is absolutely
mind-blowing that a simple application showing tldr pages has a
dependency on architecture-specific things. There is really no sane
reason to have such dependencies, but apparently the Rust ecosystem is
not completely sane... :-/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
