Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB44C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 22:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3802961546;
	Wed, 20 Dec 2023 22:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3802961546
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D7Uc95KnGstj; Wed, 20 Dec 2023 22:40:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BA95610D4;
	Wed, 20 Dec 2023 22:40:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BA95610D4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 414CD1BF471
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 22:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEB9E610D4
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 22:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEB9E610D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w0HF2F7upv38 for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 22:40:09 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 887C56158D
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 22:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 887C56158D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F3D01BF203;
 Wed, 20 Dec 2023 22:40:06 +0000 (UTC)
Date: Wed, 20 Dec 2023 23:40:05 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231220234005.168dda27@windsurf>
In-Reply-To: <20231218194001.544887-6-adam.duskett@amarulasolutions.com>
References: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
 <20231218194001.544887-6-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703112006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uu/mH/VJxfOccB4igGBUtVvxtbawaxmKiVtsTCM/Yts=;
 b=l/CpN3t/Lt6Y4UBhytCz+9dNkzFOLJELfAd/D299DnOizymQwYf7PMiBuNZ4WreG04/GrR
 NOu0sMesCYgSz510ZbW1zM61QbyyKYi5PMKiOq5F9zJDg4LSfBZwIhsxGTO+cby2YgAkeo
 INDAYzH97R0SaaQL1n7fq0jwHsAM4U43zKwKOHMSOs28TbTB1VjrJPm6D5wWWFw1VgoPlX
 Jie15pep88Z7tvJ40n1pz+yhVnefr5gYAqa/TNH7UP4YV1fvZ8YrBiPMZaErP/4ozNxSow
 SFqEj+g/We8LXF5Iogebf6RKwYA+Yitml78sHaDjH4zsYGNgBNsDrQdmwCKnGw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l/CpN3t/
Subject: Re: [Buildroot] [PATCH v2 06/14] package/libutempter: new package
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

On Mon, 18 Dec 2023 12:39:51 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Applied after fixing two small things, see below. But now that I'm
re-reading, I found another issue.

> diff --git a/package/libutempter/Config.in b/package/libutempter/Config.in
> new file mode 100644
> index 0000000000..a06a240418
> --- /dev/null
> +++ b/package/libutempter/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_LIBUTEMPTER
> +	bool "libutempter"
> +	help
> +	  The libutempter library provides interface for terminal
> +	  emulators such as screen and xterm to record user
> +	  sessions to utmp and wtmp files.
> +
> +	  http://ftp.altlinux.org/pub/people/ldv/utempter/
> +
> +comment "libutempter needs a toolchain w/ headers >= 4.14, dynamic library"
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 || BR2_STATIC_LIBS

Really? The package has no "depends on". Which one is correct? The
Config.in comment, or the absence of "depends on". Could you send a patch to fix this?


> +LIBUTEMPTER_VERSION = 1.2.1
> +LIBUTEMPTER_SITE = ftp.altlinux.org/pub/people/ldv/utempter
> +LIBUTEMPTER_INSTALL_STAGING = YES
> +LIBUTEMPTER_LICENSE = LGPL-2.1

This was LGPL-2.1+

> +LIBUTEMPTER_LICENSE_FILES = COPYING
> +
> +define LIBUTEMPTER_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
> +endef
> +
> +define LIBUTEMPTER_INSTALL_STAGING_CMDS
> +		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
> +			$(MAKE) DESTDIR=$(STAGING_DIR) PREFIX=/usr -C $(@D)/ install

One too many tab of indentation here.

> +endef
> +
> +define LIBUTEMPTER_INSTALL_TARGET_CMDS
> +		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
> +			$(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/ install

And here as well.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
