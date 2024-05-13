Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692E7C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 21:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D8A34060E;
	Mon, 13 May 2024 21:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W7P8sopuQkqt; Mon, 13 May 2024 21:05:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D221940631
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D221940631;
	Mon, 13 May 2024 21:05:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9530C1BF2A4
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F01E8234E
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:05:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CKt1qzyrCs9K for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 21:05:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 464D98232D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 464D98232D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 464D98232D
 for <buildroot@buildroot.org>; Mon, 13 May 2024 21:05:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9DE360002;
 Mon, 13 May 2024 21:05:25 +0000 (UTC)
Date: Mon, 13 May 2024 23:05:25 +0200
To: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>, Javad
 Rahimipetroudi <javad.rahimipetroudi@mind.be>
Message-ID: <20240513230525.287a3124@windsurf>
In-Reply-To: <20240410212834.479ac502@windsurf>
References: <20240328181247.3009506-1-javad.rahimipetroudi@mind.be>
 <20240410212834.479ac502@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715634328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MVZ2igXjtvkJc8nVE6T+CcJikZGuhWujDvrduJhYZhQ=;
 b=IbkuTDut2PHkgcub0zMHujy18lJ14JjpwQkdKTedx6fwlv72/uCXVKABwV/c6hcOMaUSCi
 RNM0Ogr8ZI/TrkUGJJ+eJpxx9ix9F+K+N3CIhjc+l7FPOzCcmv4xbbTkIW2W9J8WfC5ey2
 yPVSzH4PSrYLhYunAIxjZ0B4bNWffsKJ8VpJ9u0YLiVQGQxUYp5NZEwqImhJnqXEP14orv
 JWpmBclK+JFopzjhrcco7WXqqycgo54q3WX/NUOsZU/kpGpej9OXhTmS+dSI61XdFxwvYs
 QIjOPzYWUU2sW5biBG4nOrzJgVQtIBnkLO2OUeJjrEVhmqwYheoIVZgGetTusg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IbkuTDut
Subject: Re: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: add trusted
 boot option
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Javad,

Do you have any feedback on the below questions?

Thanks!

Thomas

On Wed, 10 Apr 2024 21:28:34 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> Hello Javad,
> 
> On Thu, 28 Mar 2024 19:12:47 +0100
> Javad Rahimipetroudi via buildroot <buildroot@buildroot.org> wrote:
> 
> > This patch adds the required fields to enable Trusted Board Boot in
> > TF-A. The users should provide ROT_KEY private key to build the TF-A in
> > this mode. The ROT_KEY is used to sign the FIP image during the TF-A
> > build. Furthermore, the source code of the mbedTLS is also used during
> > the build process.
> > 
> > Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>  
> 
> Thanks for this contribution! It looks good, I only have one
> doubt/issue with it.
> 
> > +ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_TRUSTED_BOOT),y)
> > +ARM_TRUSTED_FIRMWARE_TRUSTED_BOOT_ROT_KEY = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ROT_KEY))
> > +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
> > +	TRUSTED_BOARD_BOOT=1 \
> > +	MBEDTLS_DIR=$(MBEDTLS_SRCDIR) \  
> 
> This re-use of the mbedtls source code, outside of the mbedtls package
> build itself sounded a bit suspicious to me. Indeed, mbedtls being a
> dependency of arm-trusted-firmware, it means that 
> $(MBEDTLS_SRCDIR) will contain an already built mbedtls. Would this be
> a problem?
> 
> Looking at the arm-trusted-firmware build logic, it looks like it
> isn't: the TF-A build system will rebuild in its own folder the mbedtls
> library. However, when I see:
> 
> LIBMBEDTLS_SRCS         += $(addprefix ${MBEDTLS_DIR}/library/,         \
>                                         aes.c                           \
>                                         asn1parse.c                     \
>                                         asn1write.c                     \
>                                         cipher.c                        \
>                                         cipher_wrap.c                   \
>                                         constant_time.c                 \
>                                         hash_info.c                     \
>                                         memory_buffer_alloc.c           \
>                                         oid.c                           \
>                                         platform.c                      \
>                                         platform_util.c                 \
>                                         bignum.c                        \
>                                         bignum_core.c                   \
>                                         gcm.c                           \
>                                         md.c                            \
>                                         pk.c                            \
>                                         pk_wrap.c                       \
>                                         pkparse.c                       \
>                                         pkwrite.c                       \
>                                         sha256.c                        \
>                                         sha512.c                        \
>                                         ecdsa.c                         \
>                                         ecp_curves.c                    \
>                                         ecp.c                           \
>                                         rsa.c                           \
>                                         rsa_alt_helpers.c               \
>                                         x509.c                          \
>                                         x509_crt.c                      \
>                                         )
> 
> in the TF-A build system, I'm a bit scared, because it means that there
> is a pretty tight coupling between the version of TF-A and the version
> of mbedtls. If we update mbedtls to a newer version which has an
> additional source file... TF-A would have to be updated accordingly.
> This looks a bit "meh" to me.
> 
> However, I don't really have a super great alternative to offer. The
> only alternative that I can think of is to have
> boot/arm-trusted-firmware/ download/extract its own copy of mbedtls, so
> that (1) we control its version independently of the mbedtls package
> and (2) we don't poke into the mbedtls source directory.
> 
> Let's see what the other maintainers think of this somewhat special
> situation.
> 
> Thomas



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
