Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EB8C001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 11:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EE1480DCB;
	Sun,  6 Aug 2023 11:35:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EE1480DCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YeWj3BzKgyqi; Sun,  6 Aug 2023 11:35:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0CCC81DFF;
	Sun,  6 Aug 2023 11:35:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0CCC81DFF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1422C1BF293
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 11:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF6A680B7F
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 11:34:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF6A680B7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WF1xefa2WHUu for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 11:34:56 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C010F80FA1
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 11:34:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C010F80FA1
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA47C60002;
 Sun,  6 Aug 2023 11:34:53 +0000 (UTC)
Date: Sun, 6 Aug 2023 13:34:52 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20230806133452.6d1e78cd@windsurf>
In-Reply-To: <20230726202838.1931660-3-christian@aperture.us>
References: <20230726202838.1931660-1-christian@aperture.us>
 <20230726202838.1931660-3-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691321694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AHRnIOwcTyvUzzMuEfKjsyRc89g0ytbW15GJjvelH4Q=;
 b=eqVrVQB+JVAg/bWHZRfqJDFsLGr/CRr49gsq4MdEfGrYWarYGH9goERE1xj1FJQ1oq7j++
 +quhNVq214XnzEJUaUktbb65iadveTTeueQHWl510qxhAPn/0+0Josa2Y19Cieevf4flyz
 V93+cCjwV53R1LUZPTfVwGDg/kw6LI7WpPN5havOzGQsS25oyg97Zm2yUfc4qk1HHKSa8f
 35qF7d05OMWh7NOOwYryUT4ZA+YzNlG7sfHYdETJO3pBvlhW+cGEHKbz1bS3Jn3wUUAPZy
 IzoDueairG06XnxCfmcff9ssHfDdH784omynrWSRfhbE0tOEgQsUW7jd5ljFrA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eqVrVQB+
Subject: Re: [Buildroot] [PATCH v1 3/3] boot/uboot: add host-python-pylibfdt
 dependency if needed
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 26 Jul 2023 13:28:38 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> If BR2_TARGET_UBOOT_NEEDS_PYLIBFDT is set, add a dependency on
> host-python-pylibfdt.
> 
> Fixes a build failure with uboot 2023.07:
> 
> $ make uboot
> error: pylibfdt does not seem to be available with python3
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

I've completely reworded the commit log to really explain what's going
and since when the problem is occurring.

>  ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)
> -UBOOT_DEPENDENCIES += host-swig
> +UBOOT_DEPENDENCIES += host-swig host-python-pylibfdt

I dropped host-swig from here. Indeed, it was previously needed to
allow U-Boot to build its own pylibfdt copy. Now that we build our own
host-python-pylibfdt, host-swig is no longer needed as a dependency of
U-Boot: it's needed as a dependency of host-python-pylibfdt (which it
already is).

Applied with those changes, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
