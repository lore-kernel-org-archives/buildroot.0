Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534CEC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 18:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E171C4021C;
	Sat,  4 Nov 2023 18:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E171C4021C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6b6Wr3x4ttYE; Sat,  4 Nov 2023 18:18:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE0D840164;
	Sat,  4 Nov 2023 18:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE0D840164
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05FD41BF2A3
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1D0760AF0
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 18:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1D0760AF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L_nRbnhqNUoM for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 18:17:59 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8964F60A8C
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 18:17:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8964F60A8C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9EA4DE0002;
 Sat,  4 Nov 2023 18:17:57 +0000 (UTC)
Date: Sat, 4 Nov 2023 19:17:56 +0100
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20231104191756.02d7847b@windsurf>
In-Reply-To: <20231024184835.3911-1-brandon.maier@collins.com>
References: <20231019203338.6450-1-brandon.maier@collins.com>
 <20231024184835.3911-1-brandon.maier@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699121878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xBKBuaRBYf4PXCwzd3SvgZd20VygECu1iZ1DrMrwf3k=;
 b=de4D+JEjpJ4TcU9moCkrqrzkTY6CGlqKcnKir64SLaEnsO+6rD8XM8gcA/MbNKPNQQ4q3T
 j5nDn99vNYOJOGvyRs2X3jrtu2mFD6FMNN6tZLacOTWWvhyRJsR1vPX4bYJapvD4Aa7Fsc
 2CldPL6ASPFRr6PhBF/N31gMo5A6BVjtCOwBp1Buc8yYzemZvt1yVwUx8DT7FcjRL1QtD5
 Ja7NZsr0BV/W8cnn8B7c7+5nLMzjf6sksMOPKOE1GbBR80k3dMEg36YLxAuToOoy+rmVRL
 n7ycfcaxkeW5nN15G2vCmdneBDi2dUi57agdVEBf5xRV2Gx8tBU45q0x7zEIaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=de4D+JEj
Subject: Re: [Buildroot] [PATCH v2 1/2] package/wireless_tools: make
 'iwconfig' tool optional
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Brandon Maier <brandon.maier@collins.com>, "Neal J.
 Buchmeyer" <neal.buchmeyer@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 24 Oct 2023 18:48:34 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> @@ -7,6 +9,12 @@ config BR2_PACKAGE_WIRELESS_TOOLS
>  
>  if BR2_PACKAGE_WIRELESS_TOOLS
>  
> +config BR2_PACKAGE_WIRELESS_TOOLS_IWCONFIG
> +	bool "Add iwconfig"

Change to:

	bool "Install tools"

because it's really about "installing", and it is more consistent with
the option for the shared library, which is "Install shared library".

I've also added:

	default y

to preserve the existing behavior.

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
