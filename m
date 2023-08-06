Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B983C001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 13:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC42A40322;
	Sun,  6 Aug 2023 13:50:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC42A40322
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tSpvz1R5HXYt; Sun,  6 Aug 2023 13:50:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76EFE41517;
	Sun,  6 Aug 2023 13:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76EFE41517
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C5571BF3C0
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 13:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BB1060B14
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 13:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BB1060B14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6toeOFHgFseC for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 13:49:12 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B53C860A62
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 13:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B53C860A62
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26754240002;
 Sun,  6 Aug 2023 13:49:07 +0000 (UTC)
Date: Sun, 6 Aug 2023 15:49:06 +0200
To: Alistair Francis <alistair23@gmail.com>
Message-ID: <20230806154906.03f6a549@windsurf>
In-Reply-To: <20230724014832.2207166-1-alistair.francis@wdc.com>
References: <20230724014832.2207166-1-alistair.francis@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691329748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lvHi/LOjWyJrrgPjWsPmJP4bpNeJT8AGv3ixM4eTNk8=;
 b=O6byyvAsFBrw9qi3bKuZSlIXNzehEFx01aVvFVCgDPjKXoK1V0O13vvt0zho1g+haxXIZv
 osg+WlOdNBwpY3Gg+AkyKl/7Hl8ksBR0DlBVjD6ahLXt9Kt81BduK5dpYXxDPMX/u4ySuV
 nDLcF21k+AujD46D1PrfVEw+eoLRpP6qbfwWdC4sCbTh+RLcXGwdcGoDnjKfH1yEVmYIpc
 t+v3/R9a1+WpKbPaEPrfrI2ZFCqESxuDVMPHqM7fTmpB4yZAnx8koyWGnmq6b4iDqFkg1T
 okctEYkt5m5Nv4xuyWSAoQeBZMc06PQDF1oLR/CBUEFkP5/0Z4L/Ehv7DcOAMQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O6byyvAs
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libopenssl: Copy the crypto
 include files
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 24 Jul 2023 11:48:31 +1000
Alistair Francis <alistair23@gmail.com> wrote:

> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index 06eac8f3d9..c66a842cdf 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -126,6 +126,10 @@ endef
>  
>  define LIBOPENSSL_INSTALL_STAGING_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
> +	mkdir -p $(STAGING_DIR)/usr/include/crypto
> +	$(INSTALL) -m 644 $(@D)/include/crypto/* $(STAGING_DIR)/usr/include/crypto/
> +	mkdir -p $(STAGING_DIR)/usr/include/internal
> +	$(INSTALL) -m 644 $(@D)/include/internal/* $(STAGING_DIR)/usr/include/internal/

I'm still quite concerned about this. Why the heck does libspdm require
the internal/private headers of OpenSSL, and no other package needs
that? It seems very odd, and potentially very wrong. One can assume
such internal headers expose internal APIs that don't have the same
backward compatibility guarantees as public APIs.

What makes libspdm so special? Is there any potential side effect of
exposing those OpenSSL private/internal headers to the wider world, as
your patch does?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
