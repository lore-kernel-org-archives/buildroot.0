Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1D2C0015E
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5787832DC;
	Sat, 22 Jul 2023 21:09:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5787832DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QtH8lVY4nFXI; Sat, 22 Jul 2023 21:09:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95E06832E7;
	Sat, 22 Jul 2023 21:09:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95E06832E7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DAADC1BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B178B60D79
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:09:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B178B60D79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k1m-eTfXNQ3B for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:09:45 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0BE7760D94
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BE7760D94
Received: by mail.gandi.net (Postfix) with ESMTPSA id C599EC0003;
 Sat, 22 Jul 2023 21:09:41 +0000 (UTC)
Date: Sat, 22 Jul 2023 23:09:40 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20230722230940.75971fbe@windsurf>
In-Reply-To: <20230711220849.1702358-3-christian@aperture.us>
References: <20230711220849.1702358-1-christian@aperture.us>
 <20230711220849.1702358-3-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690060182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0z/VP2Xluf5pPbnSJjSCnVWQJastqHTK3V8wppWAvPE=;
 b=oxi5TybD9uLi5WMJW0g6PRaX6zuESt0Y9+eZzcQWcvXrlq9ggprfA/U79Cq7I9G10J+QUh
 +x/ML/n8/pgA/XeZuN+an5osrSyZtT1IU8/YBCO5admc/KJoR52QzkOZknC+987OxK1J1S
 y/1OyXqNZW1bOeAMbQzTjNf8neGjP1nRSvVQzYYpjZb/K0LVdaS9DZviTzZQ0kKYa/ZWh9
 mayvbh+PF3C14tnIKnm7+MStjoX9NaqbKNz9rK5PAfgX/t4p6JN2OpJXxFQP0IJRc6QRHO
 hZbyg1EM1WiTIcmehIz8gGgzeH3x9mPYoGG6zCcxMTXbDDTn0LtT/oVfAyXZIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oxi5TybD
Subject: Re: [Buildroot] [PATCH v7 3/4] package/go: bump to version 1.20.6
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

On Tue, 11 Jul 2023 15:08:48 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> The latest Go release, version 1.20, arrives six months after Go 1.19. Most of
> its changes are in the implementation of the toolchain, runtime, and libraries.
> 
> https://go.dev/doc/go1.20
> https://go.dev/doc/devel/release#go1.20.6
> https://github.com/golang/go/issues?q=milestone%3AGo1.20.6+label%3ACherryPickApproved
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> 
> ---

Applied to master after fixing the minor conflicts due to the bump of
go 1.19 that occurred in the mean time.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
