Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4CEC433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 22:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6063A40A13;
	Tue, 22 Nov 2022 22:41:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6063A40A13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gnG5sdv2Is0w; Tue, 22 Nov 2022 22:41:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 853B3409F8;
	Tue, 22 Nov 2022 22:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 853B3409F8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E3E71BF46D
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27A2E41929
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27A2E41929
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qJJspnzUqH9R for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 22:41:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE47141927
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE47141927
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 22:41:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C0D93E0002;
 Tue, 22 Nov 2022 22:41:24 +0000 (UTC)
Date: Tue, 22 Nov 2022 23:41:23 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221122234123.0933646f@windsurf>
In-Reply-To: <20221031195205.429257-3-bernd.kuhls@t-online.de>
References: <20221031195205.429257-1-bernd.kuhls@t-online.de>
 <20221031195205.429257-3-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669156885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OV9ptbQbJKQV85lrkBuXxgPXPNvd3mvg7InBmlYjgJY=;
 b=GEUbDaPGITHQaqI3T359Dz+H+KONsTUL1/eZiONnrp/dLfBy0LawEAciREWiol6++/7KVV
 4Mv8owtVGhADEXZMMJTkiNrw0h13Xsxv2RGWBhlmnQizFmEN7qEI9kLm3ih8UG5rARL2Xz
 B3CrFRTZJ+vFSjgfjIw3pyoYWHHYdBXaNEYHsTeArpwPXingSAY0R/4Qf6GofJ+st1/SOf
 hNQTxhHhS7M24o31yg+1E4kYz/IQmUk9VvKtE5U3oMk35oTxLTM4cUnvbDazTFi62ymCUS
 r6hig7Zuzd5P8YWt2hmANsiFOxMbjslPoe76lmYmXbRFij78hiFmbRa3xwc/xQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GEUbDaPG
Subject: Re: [Buildroot] [PATCH v2 3/3] package/p2pool: new package
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
Cc: Stefan Ott <stefan@ott.net>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 31 Oct 2022 20:52:05 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: disabled support for BR2_aarch64_be, not supported upstream:
>     https://github.com/tevador/RandomX/pull/257

Same comment as for monero, is this about AArch64 BE, or all BE
architectures?

> diff --git a/package/p2pool/Config.in b/package/p2pool/Config.in
> new file mode 100644
> index 0000000000..53f894e309
> --- /dev/null
> +++ b/package/p2pool/Config.in
> @@ -0,0 +1,27 @@
> +config BR2_PACKAGE_P2POOL
> +	bool "p2pool"
> +	depends on BR2_ARCH_IS_64
> +	depends on !BR2_aarch64_be

This package is not selecting monero, so why should it inherit its
dependencies? Or this RandomX thing is a library that is bundled in
both monero and p2pool?

> +# prevent compiler warnings being treated as errors
> +define P2POOL_REMOVE_WARNING_FLAGS
> +	$(SED) '/set(WARNING_FLAGS/d' $(@D)/cmake/flags.cmake
> +endef
> +P2POOL_POST_PATCH_HOOKS += P2POOL_REMOVE_WARNING_FLAGS

Is an upstreamable patch possible for this?

Thanks

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
