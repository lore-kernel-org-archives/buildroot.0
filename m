Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E506CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:08:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D18360FD8
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D18360FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24E9C606DA;
	Sun, 14 Nov 2021 14:08:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o6EsAKiudX_l; Sun, 14 Nov 2021 14:08:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 789B1606D3;
	Sun, 14 Nov 2021 14:08:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E128B1BF3D9
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1AD180E54
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:08:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RuYVaHbAt8_M for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:08:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8FA380E53
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:08:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 15CCC20003;
 Sun, 14 Nov 2021 14:08:06 +0000 (UTC)
Date: Sun, 14 Nov 2021 15:08:06 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20211114150806.2e39e94c@windsurf>
In-Reply-To: <20211108183519.2561478-2-giulio.benetti@benettiengineering.com>
References: <20211106181322.302485-1-giulio.benetti@benettiengineering.com>
 <20211108183519.2561478-1-giulio.benetti@benettiengineering.com>
 <20211108183519.2561478-2-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/harfbuzz: bump to version 3.1.1
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Peter Seiderer <ps.report@gmx.net>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

On Mon,  8 Nov 2021 19:35:19 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Bump to version 3.1.1 by:
> - requiring BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 instead of _4_8 in this
> package taking care of reverse dependencies, since now harfbuzz requires
> gcc 4.9 to be built successfully.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thanks for this patch. Unfortunately, it has one issue: you only took
care of the first-order reverse dependencies of harfbuzz, i.e the
packages that directly select harfbuzz. But you didn't look at the
reverse dependencies of these reverse dependencies. For example, in
this patch, you're changing pango to require gcc >= 4.9. But you didn't
look at the packages that themselves select pango. They also need to be
updated accordingly!


> diff --git a/package/pango/Config.in b/package/pango/Config.in
> index cf5170c8f3..ff529ab0dc 100644
> --- a/package/pango/Config.in
> +++ b/package/pango/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_PANGO
>  	depends on BR2_USE_MMU # glib2
>  	depends on BR2_INSTALL_LIBSTDCPP # freetype support
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # harfbuzz
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz
>  	select BR2_PACKAGE_LIBGLIB2
>  	select BR2_PACKAGE_LIBFRIBIDI
>  	select BR2_PACKAGE_EXPAT

You also forgot to update the Config.in comment in this file.

Could you revisit this and provide an improved version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
