Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD8AC4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 14:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1C4160DDF;
	Wed, 23 Nov 2022 14:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1C4160DDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h_dCU4bR7TrO; Wed, 23 Nov 2022 14:14:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F4FF607B5;
	Wed, 23 Nov 2022 14:14:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F4FF607B5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4DD251BF3E9
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 14:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24F9E81EDD
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 14:14:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24F9E81EDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lXcfrMB5-7Jy for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 14:14:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7E2F81EE4
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7E2F81EE4
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 14:14:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 71AD5E000B;
 Wed, 23 Nov 2022 14:14:14 +0000 (UTC)
Date: Wed, 23 Nov 2022 15:14:13 +0100
To: Michael Despault <mike@wewearmanyhats.com>
Message-ID: <20221123151413.655df990@windsurf>
In-Reply-To: <CAP_a2zr1FbRNYf12d+42tPZ3xQrthddMc7pajaMC7ZA94aP5qQ@mail.gmail.com>
References: <CAP_a2zr1FbRNYf12d+42tPZ3xQrthddMc7pajaMC7ZA94aP5qQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669212855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1QaK6+d9KRWYyido80xnhN8vFp7GzTO8XET4D2Zucno=;
 b=Ovw+XHtctydWzQWevMt/rT3x5udXK1r2xBd0EcpRPMZ002N7/EuFnVxwHnNgJ7WezOLTsK
 wB+ceGIerNFRg7zv6zLsXDaBWdjqQEfeYvKAdbjjidh0vP2zySOpvilyjPVO/lKL93tPpt
 IwTvuQ0n3kXMCjXCOXGRJo1vvWaQbBfmNbBA2XnNsAfUb4QRviWnAyb9nG6+fqMK9wHLUn
 29oLWwO9y8a8zqX7Jzz7rpI4bJNWn7qvcURZY0IOJT2jLNVz8yQDVAiLzZFBZk1hszCzcQ
 yTcs9Ib/0sOFxwTGYwdNBMC5Om4TyCSK+P47g66VYw7ULlj64sG5gW3TOYHaTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ovw+XHtc
Subject: Re: [Buildroot] defconfig with wayland support?
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

Hello Michael,

On Tue, 22 Nov 2022 16:46:54 -0800
Michael Despault <mike@wewearmanyhats.com> wrote:

> I'm struggling to get a buildroot generated system up and running that has
> working wayland support.  My primary goal is simply to be able to get an
> embedded system that can run and display wayland applications, using the
> buildroot system.  I've found examples of other configs that claim to have
> X11 support, but nothing on wayland.  Poking around in "make menuconfig"
> I've done what I can to enable any wayland/weston related options, but
> currently I'm hitting this build error:
> 
> Run-time dependency libdrm found: NO (tried pkgconfig and cmake)
> output/build/wlroots-0.14.1/meson.build:99:0: ERROR: Dependency "libdrm"
> not found, tried pkgconfig and cmake
> 
> This happens when I try and build meson.  Has anyone had success getting an
> embedded system (via buildroot) going with wayland working out of the box?
> Hoping someone would be able to share their defconfig file with the
> appropriate options, or at least share the essential components to enable
> in make menuconfig.  Barebones is fine and not concerned so much about
> architecture right now, but currently testing on X86_64 with the intent to
> target aarch64 eventually.

There is one critical piece of information that you forgot to provide:
what is your HW platform. Indeed, depending on which GPU it has, the
Buildroot configuration will have to be different to provide the right
OpenGL implementation. It's not possible to provide a "Wayland
configuration" that works everywhere.

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
