Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011E6C001DC
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 08:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F55A81DED;
	Sat, 29 Jul 2023 08:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F55A81DED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7UW7vcLnXrRe; Sat, 29 Jul 2023 08:53:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9DAC81750;
	Sat, 29 Jul 2023 08:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9DAC81750
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B03F01BF3FC
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 08:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 809654011D
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 08:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 809654011D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6BIDZn7zxhx5 for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 08:53:35 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56BB140106
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 08:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56BB140106
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11ADBE0006;
 Sat, 29 Jul 2023 08:53:26 +0000 (UTC)
Date: Sat, 29 Jul 2023 10:53:25 +0200
To: Stefan Mayrhofer <stefan@familie-mayrhofer.net>
Message-ID: <20230729105325.18f803bf@windsurf>
In-Reply-To: <20230524165506.692213-1-stefan@familie-mayrhofer.net>
References: <20230524165506.692213-1-stefan@familie-mayrhofer.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690620812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=669oZTyAEWXTURLh5Pw2WNmnRrr/kgHhPC0JY5V1KH8=;
 b=fxFoGFs2UxXQ97FFjjCLqi3aLhoHUeQr5MHrSFNLwUi5pIPFSPD5x2yLn55aClJc1+6eHh
 DO8j8SVsQpNE9aI2yiktn9cjkiD4O9U+TydNi8hcV6ZnF9328kUWzQIERjakPqBy5Uiadw
 OpHx6rvrMEipBxZp+UXMHCJR4NVX2ydT7mJeVHJ2p1/HN2dTykTdB5k1di+KZEsyvxk1HF
 hXpy9QkfJHQrElIqwKwkMlbgL/H5CiYmPi9sx//HZe9njfdynJyr0+0N92VVz2qYUO87jh
 Z5qyGSt3t1nNz8CQcLNLyi33qNwtSw167StXAZjHYyRPGOw2txfGJwbXPeIOWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fxFoGFs2
Subject: Re: [Buildroot] [PATCH 1/1] package: mono: allow building for
 aarch64 targets
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Stefan,

Sorry for the slow feedback!

On Wed, 24 May 2023 18:55:06 +0200
Stefan Mayrhofer <stefan@familie-mayrhofer.net> wrote:

> Add aarch64 to BR2_PACKAGE_MONO_ARCH_SUPPORTS to allow building for aarch64 targets.
> 
> I have tested that this compiles successfully and runs on the actual target (imx8mp based board)
> 
> Signed-off-by: Stefan Mayrhofer <stefan@familie-mayrhofer.net>

Thanks, I've applied, after doing some very small tweaks:

- Commit title prefix changed from "package: mono:" to "package/mono:"
  which is the standard in Buildroot

- Wrapped lines of the commit logs to a reasonable length

- Reworded to avoid first person sentences ("I have tested ...")

- Modified the Config.in file to preserve alphabetic ordering of
  supported architectures.

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
