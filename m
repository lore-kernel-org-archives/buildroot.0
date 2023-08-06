Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3D4C001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0DB340220;
	Sun,  6 Aug 2023 14:27:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0DB340220
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I4eCynybrrFy; Sun,  6 Aug 2023 14:27:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D751E409A5;
	Sun,  6 Aug 2023 14:27:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D751E409A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 145D61BF340
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38BDF80E34
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38BDF80E34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JoVlWfzkoZi2 for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:26:21 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8BE080DD0
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8BE080DD0
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0DA140004;
 Sun,  6 Aug 2023 14:26:17 +0000 (UTC)
Date: Sun, 6 Aug 2023 16:26:16 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230806162616.5e7a6131@windsurf>
In-Reply-To: <20230802120150.564860-1-thomas@devoogdt.com>
References: <20230802120150.564860-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691331979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hgnw6mqy16SdJ2kzy/km2A/ZvB3hWQEu0hH8yfG6XYo=;
 b=G0MNqKQVNHjlmg0UqBkkqk7d2Y4Ncno6V9Qu5GXSA39/fA0+OzNW+CpkZwEnCekCTcn8e0
 qXPIeLbWYoxzbAth76QCobFhbmcOn9d4LgMBshTr8aMoq8eGx4Hjy7cGxjZoXGFHQ1MexE
 vv4WEHfWPffTlPHIj0Gi9NkNlLTEea9ZntAWyowmiyp/elYFcEShJ0FgcjS1xfXXU24rzK
 RxWWk7dwf6kOnrqGjdh9bhRz7z12P+7HM06k2Go6Ov4HeO9/nUQqAeJ0z6ieKSr2IbTnIe
 gr2A1+SXNOzEZmDO/TVD+IDgAZog+TPXJSkKoyy6+eLvTpnKyUHVBZszuXOAvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G0MNqKQV
Subject: Re: [Buildroot] [PATCH v2 1/3] package/libsoup3: new package
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Wed,  2 Aug 2023 14:01:48 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> Libsoup3 has a new API [1], packages using libsoup may not
> compile with libsoup3 or may crash at runtime in unexpected
> ways. So add a new package.
> 
> This replaces my original commit that was sent to the buildroot
> mailing list a long time ago: [2]

This paragraph is a changelog, it should not be part of the commit log,
but be mentioned below the --- sign that follows your Signed-off-by.

> diff --git a/package/libsoup3/Config.in b/package/libsoup3/Config.in
> new file mode 100644
> index 0000000000..8a6cbc1e67
> --- /dev/null
> +++ b/package/libsoup3/Config.in
> @@ -0,0 +1,40 @@
> +config BR2_PACKAGE_LIBSOUP3
> +	bool "libsoup3"
> +	depends on BR2_USE_WCHAR # glib2, gnutls and libpsl
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> +	depends on BR2_USE_MMU # glib2
> +	select BR2_PACKAGE_NGHTTP2
> +	select BR2_PACKAGE_LIBXML2

Actually libxml2 isn't needed. Also I have fixed alphabetic ordering,
as NGHTTP2 goes after LIBGLIB2/LIBSPL.

> +config BR2_PACKAGE_LIBSOUP3_GNOME
> +	bool "libsoup3-gnome"
> +	help
> +	  Build libsoup3-gnome library.

This option was not used anywhere, so I dropped it.

> +LIBSOUP3_DEPENDENCIES = \
> +	host-intltool \
> +	host-libglib2 \
> +	host-pkgconf \
> +	libglib2 \
> +	libpsl \
> +	libxml2 \

Dropped this line, of course.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
