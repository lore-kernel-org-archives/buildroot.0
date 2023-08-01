Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C6EC0015E
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 20:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFC5B813D2;
	Tue,  1 Aug 2023 20:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFC5B813D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ABzRmJIy-8qA; Tue,  1 Aug 2023 20:50:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17863813C0;
	Tue,  1 Aug 2023 20:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17863813C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6AB091BF476
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 20:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3473740607
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 20:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3473740607
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nics5HR3s20s for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 20:49:28 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC509400FF
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 20:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC509400FF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 936971C0002;
 Tue,  1 Aug 2023 20:49:24 +0000 (UTC)
Date: Tue, 1 Aug 2023 22:49:23 +0200
To: Robert Marko <robimarko@gmail.com>
Message-ID: <20230801224923.35b6ac96@windsurf>
In-Reply-To: <20230731170504.2769638-1-robimarko@gmail.com>
References: <20230731170504.2769638-1-robimarko@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690922964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FJI+Ew2D+NM7+Ir9/C7KAsaQFis+ZygeliQwBxLg+es=;
 b=YyCIxRknYA3+RmiAnG0tus65VRjWfhuXP/L7RV4s507h4YCQGoTrhQ8Zd3MJ2ld0IXldur
 YOjLO/G4xHS9Tuv1Xvabq/0Gsn2HPnTR2+9bjnEb2MBmOrFZf1mcacm4Sg4vHmS2j8oVnU
 q4eK/V0IW+Tnyr7jy8LZfJKp5bRMyIFo2BZrSKZuA0lDnchdqbkbNStMGExia9daEpgkqP
 ZqEkTQXkDDN4KkUuE1QqlXS/7r0tXdHPlW3Alfvq4/ndhJoJagXhA5TppbfjiP9JgaAe99
 6HJMuAiQfaXxw02iGfQ5k/rC8rMsmjcMGPMtbZmvvkfT269PYWSe56gqX0XviA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YyCIxRkn
Subject: Re: [Buildroot] [PATCH v3] package/mhz: add new package
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

Hello Robert,

On Mon, 31 Jul 2023 19:05:04 +0200
Robert Marko <robimarko@gmail.com> wrote:

> mhz is a tool to mathematically calculate the real running CPU frequency
> and as such has proved as invaluable tool for developing CPUFreq and
> similar features in the kernel.
> 
> Its source finally got a license recently so it can be packaged.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>

I've applied your change, after making a number of tweaks. Many of them
had already been pointed out to you in the review of the previous
versions, but you did not take them into account.


>  package/Config.in     |  1 +
>  package/mhz/Config.in |  6 ++++++
>  package/mhz/mhz.hash  |  3 +++
>  package/mhz/mhz.mk    | 21 +++++++++++++++++++++
>  4 files changed, 31 insertions(+)

Entry in the DEVELOPERS file was missing.

> diff --git a/package/mhz/mhz.hash b/package/mhz/mhz.hash
> new file mode 100644
> index 0000000000..eb66c10d63
> --- /dev/null
> +++ b/package/mhz/mhz.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  1e07bb0d455d63fd33fb87a24f65a803c7c2d920fde4e5b5378b8c1b07de3b47  mhz-11aac2399780a1f7ea9f007b14af0464797d5cf1-br1.tar.gz
> +sha256  9449d373cad921620bb8f1e4f7b39f957e263163ded159c1efc8de27f8997099  LICENSE
> \ No newline at end of file

Missing newline here. This is reported by "make check-package", which
verifies basic coding style details.

> diff --git a/package/mhz/mhz.mk b/package/mhz/mhz.mk
> new file mode 100644
> index 0000000000..36b3754968
> --- /dev/null
> +++ b/package/mhz/mhz.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# mhz
> +#
> +################################################################################
> +
> +MHZ_VERSION = 11aac2399780a1f7ea9f007b14af0464797d5cf1
> +MHZ_SITE = https://github.com/wtarreau/mhz.git
> +MHZ_SITE_METHOD = git

Switched to using the "github" helper to do an HTTP download instead.

> +MHZ_LICENSE = MIT/X11

The license is just MIT. X11 is a slightly difference license, and
MIT/X11 is not a valid SPDX identifier.

> +MHZ_LICENSE_FILES = LICENSE
> +
> +define MHZ_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> +endef
> +
> +define MHZ_INSTALL_TARGET_CMDS
> +	$(INSTALL) $(@D)/mhz $(TARGET_DIR)/usr/bin/mhz

Missing -D -m 0755 options.

As said: I fixed those small details when applying.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
