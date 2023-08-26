Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3A2C83F01
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 18:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80A5941B59;
	Sat, 26 Aug 2023 18:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80A5941B59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NGjeYgk0JeGK; Sat, 26 Aug 2023 18:16:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 596DD416D6;
	Sat, 26 Aug 2023 18:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 596DD416D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA01A1BF37C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A01EF82F03
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:16:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A01EF82F03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4rq409JKTkda for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 18:16:01 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FBA782660
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 18:16:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FBA782660
Received: by mail.gandi.net (Postfix) with ESMTPSA id E784EE0002;
 Sat, 26 Aug 2023 18:15:57 +0000 (UTC)
Date: Sat, 26 Aug 2023 20:15:57 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230826201557.4cc5c277@windsurf>
In-Reply-To: <20230825210419.10192-1-bernd@kuhls.net>
References: <20230825210419.10192-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693073758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9F9biQLw2kACY6AKV5DJ/tfXad/eNP6flCN/f+RfLhQ=;
 b=acKEPEnAB1cgQAuwRmCNcXr5WooU7NWloq9wVXBVJd2rlC5In+SOi2j8A6vgUlf3JMBVgn
 yMHeXXSOQDQlC/dv+V4BYMdSnKTFetOmbuvZhWUBiGfbWMvHRgLonZ/mom1A9X54MW/4X9
 h2mTBBMDcfmTwblOcBKUDiWBf6Vjbkl3xWzadK2FDm82QGuTKd1QI+B4E1g98ir6aQCb5t
 e6oWYvNMUMBUO7y7yoHXQIp5njUwV8PTh9/yKoqibC2xoXXh/oil2Y+T49OGtkoFCK4EzY
 O8bn4TvfMPiIA03dMM+Tx0Bcj7kcOBdZNMTAhNSNACGW4J+RzbhXq8mN6LXJ5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=acKEPEnA
Subject: Re: [Buildroot] [PATCH/next 1/2] package/kodi-peripheral-joystick:
 bump version to 20.1.12-Nexus
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

On Fri, 25 Aug 2023 23:04:18 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash | 2 +-
>  package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
