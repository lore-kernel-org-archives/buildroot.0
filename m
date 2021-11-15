Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FCCC433F5
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 22:01:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 313AE61504
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 22:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 313AE61504
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06702607BA;
	Mon, 15 Nov 2021 22:01:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w2-k_LGAxfqe; Mon, 15 Nov 2021 22:01:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56336607A7;
	Mon, 15 Nov 2021 22:01:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A69091BF37B
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 22:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2C9780D00
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 22:01:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uML-O4qC1U9n for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 22:01:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BA0680C8D
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 22:01:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 0216440008;
 Mon, 15 Nov 2021 22:01:06 +0000 (UTC)
Date: Mon, 15 Nov 2021 23:01:06 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20211115230106.4a53ec44@windsurf>
In-Reply-To: <20211115152604.84814-2-kory.maincent@bootlin.com>
References: <20211115152604.84814-1-kory.maincent@bootlin.com>
 <20211115152604.84814-2-kory.maincent@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/2] package/psplash: add support to
 missing configure options
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
Cc: phil.eichinger@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 15 Nov 2021 16:26:04 +0100
Kory Maincent <kory.maincent@bootlin.com> wrote:

> Add support to three configure options:

Here and in the commit title: "Add support *for*" (not to)

> diff --git a/package/psplash/Config.in b/package/psplash/Config.in
> index da99b264e0..e79e9e85c4 100644
> --- a/package/psplash/Config.in
> +++ b/package/psplash/Config.in
> @@ -35,6 +35,21 @@ config BR2_PACKAGE_PSPLASH_IMAGE
>  	  Use a personalized png image as boot splash.
>  	  Let it empty if you want to keep the psplash default image.
>  
> +config BR2_PACKAGE_PSPLASH_FULL_SCREEN
> +	bool "use fullscreen mode"
> +	help
> +	  Enable the psplash image in fullscreen mode.
> +
> +config BR2_PACKAGE_PSPLASH_NO_STARTUP_MSG
> +	bool "disable startup message"
> +	help
> +	  Disable text banner output on startup.

Please use positive logic in options, i.e options should "enable"
something, not "disable" something. If the previous default (when the
option didn't exist) was to have it enabled, add a "default y" in the
Config.in option so that it remains enabled by default.

> +
> +config BR2_PACKAGE_PSPLASH_NO_PROGRESS_BAR
> +	bool "disable progress bar"
> +	help
> +	  Disable the management of the progress bar.

Same.

> +ifeq ($(BR2_PACKAGE_PSPLASH_FULL_SCREEN),y)
> +PSPLASH_CONF_OPTS += --enable-img-fullscreen
> +endif

We like to have both sides of the condition, i.e:

ifeq ($(BR2_PACKAGE_PSPLASH_FULL_SCREEN),y)
PSPLASH_CONF_OPTS += --enable-img-fullscreen
else
PSPLASH_CONF_OPTS += --disable-img-fullscreen
endif

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
