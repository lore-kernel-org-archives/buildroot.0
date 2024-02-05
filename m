Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF8FC48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D432740AFF;
	Mon,  5 Feb 2024 21:29:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D432740AFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l6ld8NjAWsQm; Mon,  5 Feb 2024 21:29:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C79424012F;
	Mon,  5 Feb 2024 21:29:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C79424012F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DD2231BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9B49414C0
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9B49414C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T5cX16tP0nXB for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:28:51 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CB9D4149F
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CB9D4149F
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE6D740005;
 Mon,  5 Feb 2024 21:28:47 +0000 (UTC)
Date: Mon, 5 Feb 2024 22:28:47 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20240205222847.4a492f2f@windsurf>
In-Reply-To: <20240121204252.152952-1-adam.duskett@amarulasolutions.com>
References: <20240121204252.152952-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707168528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wGOQS09Ap4T1mFxiO8GRJ6tfeX5xzXyhJwSjWdOYVc0=;
 b=n+dM+ltkv5b8XQEiV/MIpDuBqSvtlX2edYhYkXgY3sw1MTBn3cVrYPMfXIOHgyRtf3+vB1
 eNBs0VM6yp24IgQZsgsecdLV9PWtn+dxGQZ/g8gmanCi2QJNAOvZrvYF1sIQRItVP22mj4
 O5p0jAqQikPcw3VEGbKe5rvSegvc/nd/qIsDomAGSvAzGF+LG+RrhY1fC/MqJ4MS/NsqBk
 18k27Y7JkN7e0Fb9dVVql+CE0wn87KMVKG2432COFIN8V2K9cfTuh7GSngqgU63BNeFBbA
 bIraMbeFHbZ+ocxxu3a/3YFcgEsfPYLLgezGtoKSAMv8jm7GHVBBVhzioxe8jA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=n+dM+ltk
Subject: Re: [Buildroot] [PATCH 1/2] package/wlroot: vulkan renderer depends
 on vulkan loader
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 21 Jan 2024 13:42:51 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Without the vulkan-loader package present, the configure step fails with the
> following error message:
> ```
> Run-time dependency vulkan found: NO (tried pkgconfig and system)
> Message: Install "vulkan" or pass "-Dvulkan=disabled" to disable it.
> ```
> 
> The above error is due to the lack of the vulkan.pc file provided by the
> vulkan-loader package. A search of autobuild failures containing
> BR2_PACKAGE_WLROOTS=y and BR2_PACKAGE_MESA3D_VULKAN_DRIVER=y shows two build
> failures. However, the failure reasons happened before wlroots could compile.
> One for gerbera-1.10.0 and another for host-rust-1.64.0.
> 
> Add a dependency on the vulkan-loader package to resolve the above issue.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/wlroots/wlroots.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

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
