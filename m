Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E9CC05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 11:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55DDA40308;
	Wed,  8 Feb 2023 11:09:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55DDA40308
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eVv1G7wE6jdf; Wed,  8 Feb 2023 11:09:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63CC440105;
	Wed,  8 Feb 2023 11:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63CC440105
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C8C81BF3A4
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 531EE40105
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 531EE40105
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cupdsPjGT0xS for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 11:09:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D927440099
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D927440099
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 11:09:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BB0051BF207;
 Wed,  8 Feb 2023 11:09:20 +0000 (UTC)
Date: Wed, 8 Feb 2023 12:09:19 +0100
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20230208120919.54ed260e@windsurf>
In-Reply-To: <20230207171721.2973997-5-angelo@amarulasolutions.com>
References: <20230207171721.2973997-1-angelo@amarulasolutions.com>
 <20230207171721.2973997-5-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675854561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dUXMnSn3zqjuD1pjExPA/0RA5CF1ZjpOylKWYHtqRk4=;
 b=TAoFIwKehdbTZTHJOOJD75ViySuNCnZtprW8Nut2KdbUOSAqL1jHOKXhNfzoXm0YqBdwUw
 zHuZw8agCYJfAAdUERvhjpvzRrJDUXJ+TiVSliJ4OTAC9v4Ld9ZhBTq8mk6XJgq3eg7GCQ
 fJMbUWfvgU8vzhb+MlVdCAJlzaCPtM7mbDgGQpBOBej0g6lvjywVOjeKQ9Ob1bJ4pmfk51
 TVMXoMVa+kuJnEgh7qIbp4gdDuA4UFG1mbF3oHAiZU9MCGTVG+LdNWV2PiOnAJFLGNIIES
 M25UPm1a0gYV9zeMir3vBwuRJ3huarAxcB8lHP/+iNvYV57gPcMPYK3F59bLrw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TAoFIwKe
Subject: Re: [Buildroot] [PATCH v6 04/13] package/qt6/qt6base: add support
 for widgets
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
Cc: jesseevg@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  7 Feb 2023 18:17:12 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> +config BR2_PACKAGE_QT6BASE_WIDGETS
> +	bool "widgets module"
> +	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_QT6BASE_XCB

According to my build testing, this dependency is not needed, so I
dropped it.

> +	help
> +	  This option enables the Qt6Widgets library.
> +
>  endif
>  
>  config BR2_PACKAGE_QT6BASE_NETWORK
> diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
> index 06ebbab8e7..cf3c7b1ad1 100644
> --- a/package/qt6/qt6base/qt6base.mk
> +++ b/package/qt6/qt6base/qt6base.mk
> @@ -213,6 +213,10 @@ else
>  QT6BASE_CONF_OPTS += -DFEATURE_fontconfig=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_QT6BASE_WIDGETS),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_widgets=ON

Missing else clause to explicitly disable widgets.

Applied with these two things fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
