Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 011EEC43216
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 13:32:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 021386117A
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 13:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 021386117A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97D20403B2;
	Thu,  5 Aug 2021 13:32:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VOLNWb8_Pdz6; Thu,  5 Aug 2021 13:31:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95B32402A6;
	Thu,  5 Aug 2021 13:31:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 007DC1BF471
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 13:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF27E4047E
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 13:31:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BR8zvpOm3QXk for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 13:31:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87CD740357
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 13:31:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 80622240002;
 Thu,  5 Aug 2021 13:31:50 +0000 (UTC)
Date: Thu, 5 Aug 2021 15:31:49 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Pascal de Bruijn <p.debruijn@unilogic.nl>
Message-ID: <20210805153149.3b72eb3f@windsurf>
In-Reply-To: <20210805085353.3457-3-p.debruijn@unilogic.nl>
References: <20210805085353.3457-1-p.debruijn@unilogic.nl>
 <20210805085353.3457-3-p.debruijn@unilogic.nl>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/php: enable opcache jit
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
Cc: aduskett@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Pascal,

On Thu,  5 Aug 2021 10:53:53 +0200
Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  package/php/php.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 6780b6a962..3cb7090502 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -62,7 +62,7 @@ PHP_CXXFLAGS = $(TARGET_CXXFLAGS)
>  # The OPcache extension isn't cross-compile friendly
>  # Throw some defines here to avoid patching heavily
>  ifeq ($(BR2_PACKAGE_PHP_EXT_OPCACHE),y)
> -PHP_CONF_OPTS += --enable-opcache --disable-opcache-jit
> +PHP_CONF_OPTS += --enable-opcache --enable-opcache-jit

Do you have a justification as to why things have changed since commit
469c11c516959375f6caddde178adbdcdc5d9887, which disabled Opcache JIT
support ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
