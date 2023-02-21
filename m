Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9349AC6379F
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 08:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 469D78274D;
	Tue, 21 Feb 2023 08:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 469D78274D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kj5H5_xD94l9; Tue, 21 Feb 2023 08:28:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C9B98266A;
	Tue, 21 Feb 2023 08:28:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C9B98266A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60C761BF292
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AC5061089
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AC5061089
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ldypXrZSYS5c for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 08:28:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3BE461030
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3BE461030
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 08:28:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4BDBD1BF20F;
 Tue, 21 Feb 2023 08:28:22 +0000 (UTC)
Date: Tue, 21 Feb 2023 09:28:21 +0100
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20230221092821.2f227afc@windsurf>
In-Reply-To: <20230220124945.1842532-1-buildroot@heine.tech>
References: <20230220124945.1842532-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676968103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RnUxFkq5PZ6JRhluHoPgXesGozQGhZu4ka/XuR/lJw8=;
 b=ggtxAUUbTGIDuX4KBlPpzecYiQINo3RCmfJyMYLv2MT/1Wmvw+wD6F2BkPJvPLM3GPnZjo
 EF1dBcbuiaXfCR0Qw9FsL7zm4dAbZ6Kriq4yh+24d0vfcs26uleVCYjx+tKBE2blXA3WgF
 uVGbQ4fq1WIsVVSNxlK68sDem+o3L6mESIKo11dICcmYBuIhJyowN5Y7ulP/5DB6F/slPt
 ydp/g/oAyn82gctqqvkOupBpXi6oOH7hfR5MBahdwMrR9SleXoxi8yl94SSrzTVrZwM6K8
 djXsPyf7UR77w/gZi/BJIeDIDDf4s2vKQEk+FJ5qDaQuOM4FNNnDlAGgcz2UEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ggtxAUUb
Subject: Re: [Buildroot] [PATCH] package/grpc: bump to version 1.52.1
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, Robert Rose <robertroyrose@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Michael,

Thanks for the new iteration!

On Mon, 20 Feb 2023 13:49:45 +0100
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> +comment "grpc needs a toolchain w/ C++, gcc >= 7.3"

It's a bit annoying that it depends on gcc >= 7.3 and not gcc >= 7,
because technically BR2_TOOLCHAIN_GCC_AT_LEAST_7 only implies >= 7.x,
and not >= 7.3.

Did you check what happens with gcc 7.0, 7.1 or 7.2 ?

https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--bleeding-edge-2017.11-1.tar.bz2
uses gcc 7.2.0 for example. Here is a fragment to use it:
https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/fragments/armv7-eabihf--glibc--bleeding-edge-2017.11-1.frag.

I don't easily find a toolchain with gcc 7.0 or 7.1 unfortunately.

Worst case, we could make this dependency >= 8.0.

But clearly, a comment that says >= 7.3, but with a dependency on
BR2_TOOLCHAIN_GCC_AT_LEAST_7 is going to be very misleading.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
