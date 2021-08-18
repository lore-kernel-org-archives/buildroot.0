Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D28C7C4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 22:05:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85D9061106
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 22:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85D9061106
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5583F4023F;
	Wed, 18 Aug 2021 22:05:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x63AbhwEYSV4; Wed, 18 Aug 2021 22:05:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 751AA40246;
	Wed, 18 Aug 2021 22:05:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A370A1BF869
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 22:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91D9B4019A
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 22:05:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RWHdc_oh1GJd for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 22:05:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5785B400E0
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 22:05:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 4D91BE0003;
 Wed, 18 Aug 2021 22:05:12 +0000 (UTC)
Date: Thu, 19 Aug 2021 00:05:11 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Illia Bitkov <illia.bitkov@mind.be>
Message-ID: <20210819000511.401a2bc1@windsurf>
In-Reply-To: <20210818190345.2081421-1-illia.bitkov@mind.be>
References: <20210818190345.2081421-1-illia.bitkov@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mono: force internal
 libatomic-ops for some arm variants
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Illia,

On Wed, 18 Aug 2021 21:03:45 +0200
Illia Bitkov <illia.bitkov@mind.be> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/18b017dd5b9c1d8d6c91303ea4f1fdd3e1b086e0/
> http://autobuild.buildroot.net/results/1d262e9ad5bf8bf437bc3f2a709d84acf854d298/
> Signed-off-by: Illia Bitkov <illia.bitkov@mind.be>

Thanks a lot, but this needs more explanation. Why is libatomic_ops not
working for those platforms ?

> ---
>  package/mono/Config.in |  2 +-
>  package/mono/mono.mk   | 10 ++++++++--
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mono/Config.in b/package/mono/Config.in
> index 44b8cf8581..3f26bd4092 100644
> --- a/package/mono/Config.in
> +++ b/package/mono/Config.in
> @@ -16,7 +16,7 @@ config BR2_PACKAGE_MONO
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_PACKAGE_LIBATOMIC_OPS
> +	select BR2_PACKAGE_LIBATOMIC_OPS if !BR2_xscale && !BR2_arm926t
>  	help
>  	  An open source, cross-platform, implementation of C#
>  	  and the CLR that is binary compatible with Microsoft.NET.
> diff --git a/package/mono/mono.mk b/package/mono/mono.mk
> index 27f7886224..e697ed7ea2 100644
> --- a/package/mono/mono.mk
> +++ b/package/mono/mono.mk
> @@ -43,8 +43,14 @@ endif
>  
>  MONO_DEPENDENCIES += \
>  	host-mono \
> -	$(if $(BR2_PACKAGE_LIBUNWIND),libunwind) \
> -	libatomic_ops
> +	$(if $(BR2_PACKAGE_LIBUNWIND),libunwind)
> +
> +ifeq ($(BR2_xscale)$(BR2_arm926t),nn)

This is wrong, options never have the value "n"

> +MONO_DEPENDENCIES += libatomic_ops
> +else
> +#force use of internal libatomic-ops
> +MONO_CONF_OPTS += --with-libatomic-ops=no
> +endif

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
