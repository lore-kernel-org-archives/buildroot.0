Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D975C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 10:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8F0A40544;
	Wed, 24 Aug 2022 10:39:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8F0A40544
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CJXrTxgOuOHF; Wed, 24 Aug 2022 10:39:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A00340576;
	Wed, 24 Aug 2022 10:39:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A00340576
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C9EA71BF592
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 10:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 971BD40B0E
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 10:38:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 971BD40B0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HCsSsCdGNEu8 for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 10:38:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9E0540105
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9E0540105
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 10:38:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 89AA160003;
 Wed, 24 Aug 2022 10:38:53 +0000 (UTC)
Date: Wed, 24 Aug 2022 12:38:52 +0200
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20220824123852.489214fa@windsurf>
In-Reply-To: <20220824094900.3639681-1-jesseevg@gmail.com>
References: <20220824094900.3639681-1-jesseevg@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661337533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9zwzNE/BTNSWoX+W+zVAVAfWWzjuH8UYUDynFkdqgSY=;
 b=WzyaKtH328tRxCBa5BpUIhIHW78d2+7kNOkOftnFFl4PlmJ3R/X80gulLmqgeryD47Uv1c
 7fI5G+CDDYyBco+AEzcGTB3ry/59Ft0bs0Hd1WCs68/HopVn8zZSS73pjup7ps9yWc2kCX
 4IlNRnPdgqgm0GETGW21cNTekkKVFNzpuWU/4y/Tmv4tX+YdVaUf1y/I0GYzAxiZgDOPT4
 alIuNn0TN7fLHOhP/DVfuGJMaXkXTR1v0hu+r+bRINHlNY3xhnBigsw4agBiko/9WqFdIA
 Das9kIxa53J0srMMpwkCZ9SsWBvMLj+9lQg8TFLbjVPTPlSF8RT6XPvf3wF8OA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WzyaKtH3
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6serialport: add package
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 24 Aug 2022 11:49:00 +0200
Jesse Van Gavere <jesseevg@gmail.com> wrote:

> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>

Wow, great, someone interested in Qt6! I've applied your patch to our
next branch, with some changes. See below.

> ---
>  package/qt6/Config.in                        |  1 +
>  package/qt6/qt6serialport/Config.in          | 11 ++++++
>  package/qt6/qt6serialport/qt6serialport.hash |  9 +++++
>  package/qt6/qt6serialport/qt6serialport.mk   | 41 ++++++++++++++++++++
>  4 files changed, 62 insertions(+)

You forgot to add an entry to the DEVELOPERS file for this new package,
so I've added that. This way you will receive e-mail notifications if
we have build failures on qt6serialport, or if new versions become
available upstream.

> diff --git a/package/qt6/qt6serialport/qt6serialport.mk b/package/qt6/qt6serialport/qt6serialport.mk
> new file mode 100644
> index 0000000000..5bfae1ca0c
> --- /dev/null
> +++ b/package/qt6/qt6serialport/qt6serialport.mk
> @@ -0,0 +1,41 @@
> +################################################################################
> +#
> +# qt6serialport
> +#
> +################################################################################
> +
> +QT6SERIALPORT_VERSION = $(QT6_VERSION)
> +QT6SERIALPORT_SITE = $(QT6_SITE)
> +QT6SERIALPORT_SOURCE = qtserialport-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SERIALPORT_VERSION).tar.xz
> +QT6SERIALPORT_INSTALL_STAGING = YES
> +QT6SERIALPORT_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)

                                                                      ^^^ missing space her

> +QT6SERIALPORT_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
> +QT6SERIALPORT_CONF_OPTS += \

+= was not needed here, a simple = was enough.

> +        -GNinja \

This option was intended with spaces instead of one tab.

> +	-DQT_HOST_PATH=$(HOST_DIR) \
> +	-DBUILD_SHARED_LIBS=ON \

This option is not needed, it's passed by the cmake-package infrastructure already.

> +	-DBUILD_WITH_PCH=OFF \
> +	-DQT_BUILD_EXAMPLES=OFF \
> +	-DQT_BUILD_TESTS=OFF

> +
> +QT6SERIALPORT_DEPENDENCIES = \
> +        host-pkgconf \
> +        host-ninja \

These options were intended with spaces instead of one tab.

> +	qt6base
> +
> +QT6SERIALPORT_INSTALL_STAGING = YES

This was already present earlier in your .mk file.

Again, thanks for this contribution!

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
