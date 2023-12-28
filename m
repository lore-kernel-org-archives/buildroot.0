Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB46C4706F
	for <buildroot@archiver.kernel.org>; Thu, 28 Dec 2023 09:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AA40610B0;
	Thu, 28 Dec 2023 09:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AA40610B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ak9y4kTo-ZMJ; Thu, 28 Dec 2023 09:03:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89BD9610B3;
	Thu, 28 Dec 2023 09:03:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89BD9610B3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 614701BF41F
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 09:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39DAC404B2
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 09:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39DAC404B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g-8DmQuksSVM for <buildroot@lists.busybox.net>;
 Thu, 28 Dec 2023 09:03:03 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1D73400CB
 for <buildroot@buildroot.org>; Thu, 28 Dec 2023 09:03:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1D73400CB
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95FA81C0003;
 Thu, 28 Dec 2023 09:02:59 +0000 (UTC)
Date: Thu, 28 Dec 2023 10:02:57 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231228100257.20128a04@booty>
In-Reply-To: <20231227181756.156827-2-bernd@kuhls.net>
References: <20231227181756.156827-1-bernd@kuhls.net>
 <20231227181756.156827-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703754179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HqUKaQxXHOnbWcTD1wBRP/y6ZrAJ1eJRpIoFlEHXdBU=;
 b=Q2cwHOcBn55m0XjxaYmrPzzd3W/E1kXvFplA4vFdbMtmTsk4TjQEZpvzy9fSqBCpV8Tqjg
 uGm7/mYLGzEgCxFeLcPGXZ8Qgv1Jhhmu94qlLz1RGYWvnXv6hEeGLAS8vQRGK/6l5gvCoH
 mkoN2GJSFGGAnnjqDdy0tdW61PYviReJFNcJQ72yIWQhNcaw7Sk1Ut04mSTQRISxUKzttU
 gUwhiMcpx6SxeTtfLJZS5h76wJR5Me1q6ghsInepb5EUGSg5W8E8eel4mfhI1jMqppceJP
 3nYVF/UVyX0jPfcpsZQpB8sDo9iAgN+ggGH3y9WE1jhPK1MUju3aRoEIGdKpmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q2cwHOcB
Subject: Re: [Buildroot] [PATCH 2/2] package/exim: do not build perl-based
 utilities
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

[+Cc Yann]

On Wed, 27 Dec 2023 19:17:56 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Upstream added various utilities, for example exim_id_update
> with commit https://github.com/Exim/exim/commit/46a36afae41f63de654269c8a0b7cf5852a85a14
> which is a "Utility for one-time upgrage/downgrade between exim message-
> id formats, around the 4.97 transition" which would add a dependency to
> host-perl/perl so we build only the exim binary.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/exim/exim.mk | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
> index 30b0d78c94..1b3295697e 100644
> --- a/package/exim/exim.mk
> +++ b/package/exim/exim.mk
> @@ -146,16 +146,15 @@ define EXIM_BUILD_CMDS
>  		CFLAGS="-std=c99 $(HOST_CFLAGS)" \
>  		LFLAGS="-fPIC $(HOST_LDFLAGS)"
>  	$(TARGET_MAKE_ENV) build=br $(MAKE) -C $(@D) $(EXIM_STATIC_FLAGS) \
> -		CFLAGS="-std=c99 $(TARGET_CFLAGS) $(EXIM_C_FLAGS)"
> +		CFLAGS="-std=c99 $(TARGET_CFLAGS) $(EXIM_C_FLAGS)" exim
>  endef
>  
>  # Need to replicate the LFLAGS in install, as exim still wants to build
>  # something when installing...
>  define EXIM_INSTALL_TARGET_CMDS
> -	DESTDIR=$(TARGET_DIR) INSTALL_ARG="-no_chown -no_symlink" build=br \
> -	  $(MAKE) -C $(@D) $(EXIM_STATIC_FLAGS) \
> -		CFLAGS="-std=c99 $(TARGET_CFLAGS)" \
> -		install
> +	cd $(@D)/build-br; \
> +	DESTDIR=$(TARGET_DIR) build=br \
> +	../scripts/exim_install -no_chown -no_symlink exim
>  	chmod u+s $(TARGET_DIR)/usr/sbin/exim
>  endef

I like this complete rewrite of the install commands, which get rid of
the utterly complex installation step currently in place. However I'd
have mentioned this in the commit log, including a mention of the
checks done to ensure this is still installing whatever is
actually needed.

Also, the comment about the LFLAGS, added by Yann in [0], should be
removed as it it does not apply anymore.

[0]
https://git.busybox.net/buildroot/commit/?id=bf22cea53fa2af48bde3010673d3babee1ae6873

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
