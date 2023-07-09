Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2F2EB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 16:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3C9760746;
	Sun,  9 Jul 2023 16:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3C9760746
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KdzfVEYA1PCt; Sun,  9 Jul 2023 16:45:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28CD1606F5;
	Sun,  9 Jul 2023 16:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28CD1606F5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4419A1BF423
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D75F4014D
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D75F4014D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xMjioEPGlT0m for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 16:45:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFFD24011C
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFFD24011C
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 16:45:08 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98198240005;
 Sun,  9 Jul 2023 16:45:05 +0000 (UTC)
Date: Sun, 9 Jul 2023 18:45:04 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230709184504.38a22a8c@windsurf>
In-Reply-To: <20230709075543.400474-1-bernd@kuhls.net>
References: <20230709075543.400474-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688921106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EOG+erUHxUHVJHtkVAujaxuTQnj+weNDxmTU3N/j7S4=;
 b=NfC124ENTtCY8VcClLKlkP884YA2LDfFcyaRfBYR0QTz3qmMdirT9MfQ4TuYxqai+U81Ho
 pSeZjdksQTdot0BJBZrGjmiwBa8tDwQrKueMjCUMIx6l2siM1BjIxVAIsXUr/dK/SOC0vF
 U3g8Attm6pfA8ItWKD5H6tiEZlQ7AlGFZPAB/7K11uydVs18SL0abBW24b4QTHgv88No1v
 PCrvj0G6SwTLZU+26PawWD1sYAlD1ifpBpKAON02ojKMZWU0bV5xWjSpsKzbiYeth4S3lY
 QIiujQ2mwDEyYSU/1yNmZmEJv5XmG6xrBvklGIiseIS1I+OB3T4Sgu2ohS+/bw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NfC124EN
Subject: Re: [Buildroot] [PATCH 1/2] package/mesa3d-demos: needs C++
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
Cc: Spenser Gilliland <spenser@gillilanding.com>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  9 Jul 2023 09:55:42 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Reference:
> https://gitlab.freedesktop.org/mesa/demos/-/blob/main/meson.build#L21
> 
> Fixes:
> http://autobuild.buildroot.net/results/90e/90e98fa0f37462cadea0fcbff9feabad5554587d/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/mesa3d-demos/Config.in | 4 ++++
>  package/piglit/Config.in       | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)

Both applied. For the version bump, I see the patch does not have an
Upstream: tag. Has is been submitted upstream? If not, why?

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
