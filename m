Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C6AC4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 08:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE16881970;
	Fri,  9 Dec 2022 08:27:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE16881970
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xUaMS66RW-Yu; Fri,  9 Dec 2022 08:27:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21C8581A99;
	Fri,  9 Dec 2022 08:27:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21C8581A99
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3FF31BF3F4
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 08:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C8B44014B
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 08:27:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C8B44014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fbs_WnWtgT8P for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 08:27:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86C5240127
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86C5240127
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 08:27:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5CAF81C0015;
 Fri,  9 Dec 2022 08:27:25 +0000 (UTC)
Date: Fri, 9 Dec 2022 09:27:24 +0100
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Message-ID: <20221209092724.270a5a11@windsurf>
In-Reply-To: <20221209092215.5dcd9460@x230_1.trabucayre.com>
References: <20221209072525.527FF81ABA@smtp1.osuosl.org>
 <20221209092215.5dcd9460@x230_1.trabucayre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670574445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kfMgNh5Ba50QFrqfmWWhh43OafI+EIRJvB/YhKlFuRg=;
 b=ciRJwLuQowIEZ0afth0kcNIuVBQ1bhkcFmqeYIXQs9iViROTdwiFl/eo3FESSpbvqjtl1W
 VeKoLwhzXIWCA9kfdjlDEx8BET7y0TxvxHPV+wMsGMTy7P4VuZ+hI2FtPJmAbRCkeUInjz
 76WDxA1haFwc53wpT6jfztMtxpkU52z07d7FL5cXXuVecJcP+heytoj/LWu+rbyRRd5lQ3
 SCXMSpuPFl3TUbIe1/iTc3Bpxsr+3JMjZxgXWcnOkXb3dRPF79Wcu/8wNtcsczGdHE6X8e
 5o0Um5pTLfusFhZb+uquss6DVwdu8mVBBmGYG8tyofUvPBlEuFw9s0nzJtgBKA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ciRJwLuQ
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2022-12-08
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
Cc: gwe@trabucayre.com,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Gwenhael,

On Fri, 9 Dec 2022 09:22:15 +0100
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> Weird: volk requires gcc >= 7 as explicitly noted in Config.in;
> depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
> 
> When applying this defconfig this warning is displayed:
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_VOLK
>   Depends on [n]: BR2_INSTALL_LIBSTDCPP [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_GCC_AT_LEAST_7 [=n] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y] && BR2_USE_MMU [=y]
> 
> It make sense because this defconfig for mips uses gcc 5.3.0 and this version has no support for c++17, resulting to this built failure.

It's because BR2_PACKAGE_GNURADIO selects BR2_PACKAGE_VOLK, but does
not have the BR2_TOOLCHAIN_GCC_AT_LEAST_7 dependency.

Essentially, commit 66215faa5237e3704d55ff171537468079dda9c4 from you,
which added the gcc >= 7 dependency on volk is incorrect: it misses
propagating this dependency to gnuradio.

Could you have a look at fixing this?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
