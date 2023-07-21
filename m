Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482B0EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 21:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F23194044F;
	Fri, 21 Jul 2023 21:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F23194044F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yANtL4gfqg9J; Fri, 21 Jul 2023 21:32:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2118C418A2;
	Fri, 21 Jul 2023 21:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2118C418A2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 77B741BF82F
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5122540482
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5122540482
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ilO8U85dEgtS for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 21:31:43 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0885D41864
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 21:31:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0885D41864
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1643DE0002;
 Fri, 21 Jul 2023 21:31:40 +0000 (UTC)
Date: Fri, 21 Jul 2023 23:31:39 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230721233139.2c20d41a@windsurf>
In-Reply-To: <20230718221831.3070494-1-bernd@kuhls.net>
References: <20230718221831.3070494-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689975101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tLFZHhkqWatVm2jdia+eoHLv78CEYFtUu0Teq/A5WiA=;
 b=ZpPBMX9gpLTSO96woc5WTdDcyppNKWoFWDhlORl4tIQeFXX80ROs9mY/ED9SPkeaqzB6rf
 DNnr2s2lJKF/mmABq/iLKQDyR9/XhgmNZuzutvUFuQRk+gA7ZttqK4CJpg4CDMcC/iqeoR
 xQ5vPE8dW4afkfNuUctttpL03IDj1WyrVQEMIesGXsukjo/Kf6QbSlse1bOmtV82AOkGGX
 vglUaFO8H9jXEjUEpmAWK6pNiGAL39oducPTPxUZOCSbjjyuythKOmPOklLy+Swz1uejrB
 Rs3u8QDOOeY2NUxxcyTEawAb8xDdatv9cGGWQ+dYqHwyY26//yM7pAAcjMZnVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZpPBMX9g
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi: disable clang support
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

On Wed, 19 Jul 2023 00:18:31 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> When present kodi tries to use the target binary of clang-format
> https://github.com/xbmc/xbmc/blob/master/cmake/modules/buildtools/FindClangFormat.cmake
> causing a build error.
> 
> To fix the problem disable clang-format support.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/kodi/kodi.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
