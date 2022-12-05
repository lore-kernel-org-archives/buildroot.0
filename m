Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16126C4332F
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 17:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3E6E813B3;
	Mon,  5 Dec 2022 17:19:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3E6E813B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5VQD7_8o3myp; Mon,  5 Dec 2022 17:19:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC4D78139D;
	Mon,  5 Dec 2022 17:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC4D78139D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 71B481BF2BE
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 17:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C0B460AE7
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 17:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C0B460AE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SL5KSyUaBvq6 for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 17:19:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B417E60A80
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B417E60A80
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 17:19:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7D7234000A;
 Mon,  5 Dec 2022 17:19:08 +0000 (UTC)
Date: Mon, 5 Dec 2022 18:19:07 +0100
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20221205181907.2cbb01e7@windsurf>
In-Reply-To: <20221205125423.13983-1-buildroot@heine.tech>
References: <20221205125423.13983-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670260748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U0uVwsPKUTnI7qq3lr/Njz1D5lMD4qDRZiIxiJLsT98=;
 b=OG6+7Q/TI+ALmtcMTXoPx58M896vk6prcQE+ZkmZtzbcXSRG/QK3s1xNaeaQW4MSXNyeVl
 hZ3qPUOCR5ivctKWbYxfZr6THoE9nrkvcKoprcQ/9q6VrZp83ZsjhSCPRRiIuaivgdDARt
 l4xZDmcNuY7V5qtUTfsyv2Aa86DTTkKvu7dv6z2a4o3oWABn4aFYiVX/V4i105gqmRnC3D
 xTd5x9SK2ams/2wz/NmV0rt/PysrxHIfwJx2Hpax3eVe7xpzPHBD0rScfw8gVHRxeoalPd
 lXnhANyIpNYHiqoeKQq4xP0mYYqL8jfrc4b8VqJq8c5dfKggCMhJUJkemA0A+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OG6+7Q/T
Subject: Re: [Buildroot] [PATCH] [RFC] package/boost: Boost.Atomic needs
 atomic intrinsics
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  5 Dec 2022 13:54:22 +0100
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> From: Michael <buildroot@heine.tech>
> 
> similar to previous problems with nios2 and not-available atomic ints
> the build for Boost.Atomics also fails for ARC Targets which don't
> have the ATOMICS_EXT flag set.
> 
> according to [0] "Boost.Atomic has a hard requirement of the native
> atomic operations on bytes". The same tests mentioned there fail for
> ARC.
> 
> so introduce a dependency on BR2_ARC_ATOMIC_EXT for BR2_arc.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/4ca54a85672d7b9328b1909b457e548c6032a493
> 
> [0] https://github.com/boostorg/atomic/issues/42#issuecomment-734130348
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

I wish it would be this simple, but this new "depends on" needs to be
propagated to all places where BR2_PACKAGE_BOOST_ATOMIC is selected.

Aka:

package/boost/Config.in:        select BR2_PACKAGE_BOOST_ATOMIC
package/boost/Config.in:        select BR2_PACKAGE_BOOST_ATOMIC
package/domoticz/Config.in:     select BR2_PACKAGE_BOOST_ATOMIC
package/gnuradio/Config.in:     select BR2_PACKAGE_BOOST_ATOMIC
package/libcpprestsdk/Config.in:        select BR2_PACKAGE_BOOST_ATOMIC
package/log4cxx/Config.in:      select BR2_PACKAGE_BOOST_ATOMIC if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
package/uhd/Config.in:  select BR2_PACKAGE_BOOST_ATOMIC

And of course, if there's anything that selects those options, the new
depends on should be propagated to them again.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
