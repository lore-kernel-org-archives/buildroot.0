Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A2EC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 22:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C553682172;
	Sat,  4 Nov 2023 22:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C553682172
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m_AJdKnIo5U0; Sat,  4 Nov 2023 22:07:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18FA98217A;
	Sat,  4 Nov 2023 22:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18FA98217A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 67A221BF267
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 22:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31C8060C17
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 22:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31C8060C17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LfsYVoV0QGYd for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 22:07:35 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A61A60B5A
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 22:07:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A61A60B5A
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3D0160004;
 Sat,  4 Nov 2023 22:07:32 +0000 (UTC)
Date: Sat, 4 Nov 2023 23:07:31 +0100
To: Takumi Takahashi <takumiiinn@gmail.com>
Message-ID: <20231104230731.0f7591a7@windsurf>
In-Reply-To: <20231003124004.983018-1-takumiiinn@gmail.com>
References: <20231003124004.983018-1-takumiiinn@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699135653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r3LaAsiSrNvwwCCuwUq8qiIv/wWNsEFuZwp3h6dwblI=;
 b=D1Vf3Yi8h7mJde5k1mL4K5pVnPZ95Qap7SV6CZWasa8EiFOxrjMYAeKkpkWJyofemVmqNc
 9hOuikCH3pOQbS+QVwc9o60ub/iu1NMtPiQO/m8AuSj+Q7CPBWW7IclajTN+ynrhlP6Ezu
 JLdgY0fXuquyAKJLjHiG0IhqZoLzUkrcUS12rx11TN7JYuSkB3whsnjRCKm/o3AQXAT1Q3
 AHgw1syZ2eZ7sdjFoQM4BFRbwuEGtRVsyg1dRy5XqDx88qx8rUfPdSHevz1UJy9yrzYKm2
 3IHlSOVu/Pzu8gBbM5POR1m78jjkSFgjCXkSz48NgFGd820A02oqZPIPgC5pXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D1Vf3Yi8
Subject: Re: [Buildroot] [PATCH] package/libcanberra: new package
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

Hello,

Thanks for your contribution! I applied it, after adjusting a few
things, see below.

On Tue,  3 Oct 2023 21:40:03 +0900
Takumi Takahashi <takumiiinn@gmail.com> wrote:

> This package defines a simple abstract interface for playing event sounds.
> It is mainly used by desktop applications such as GDM and GNOME Session.
> 
> http://0pointer.de/lennart/projects/libcanberra/
> 
> Signed-off-by: Takumi Takahashi <takumiiinn@gmail.com>
> ---
>  package/Config.in                    |  1 +
>  package/libcanberra/Config.in        | 17 ++++++++
>  package/libcanberra/libcanberra.hash |  3 ++
>  package/libcanberra/libcanberra.mk   | 59 ++++++++++++++++++++++++++++
>  4 files changed, 80 insertions(+)

An entry in the DEVELOPERS file was missing.


> +comment "libcanberra needs a alsa-lib or pulseaudio or gstreamer"
> +	depends on !BR2_PACKAGE_ALSA_LIB && !BR2_PACKAGE_PULSEAUDIO && !BR2_PACKAGE_GSTREAMER1

This is not really useful, as it doesn't prevent a build failure. So
instead, I've added...

> +
> +config BR2_PACKAGE_LIBCANBERRA
> +	bool "libcanberra"
> +	depends on BR2_USE_WCHAR
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_STATIC_LIBS

This:

+       # We need at least one audio backend
+       select BR2_PACKAGE_ALSA_LIB if \
+              !BR2_PACKAGE_PULSEAUDIO && \
+              !BR2_PACKAGE_GSTREAMER1

> +sha256  c2b671e67e0c288a69fc33dc1b6f1b534d07882c2aceed37004bf48c601afa72  libcanberra-0.30.tar.xz
> +sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LGPL
> diff --git a/package/libcanberra/libcanberra.mk b/package/libcanberra/libcanberra.mk
> new file mode 100644
> index 0000000000..1eadcb571b
> --- /dev/null
> +++ b/package/libcanberra/libcanberra.mk
> @@ -0,0 +1,59 @@
> +################################################################################
> +#
> +# libcanberra
> +#
> +################################################################################
> +
> +LIBCANBERRA_VERSION = 0.30
> +LIBCANBERRA_SOURCE = libcanberra-$(LIBCANBERRA_VERSION).tar.xz
> +LIBCANBERRA_SITE = http://0pointer.de/lennart/projects/libcanberra
> +LIBCANBERRA_LICENSE = LGPL-2.1+
> +LIBCANBERRA_LICENSE_FILES = LICENSE

This was incorrect: the file is named "LGPL". I only realized this
after pushing, so I fixed up in a follow-up commit.

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
