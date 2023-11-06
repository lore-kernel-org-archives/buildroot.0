Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AEEC4167D
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B16916126D;
	Mon,  6 Nov 2023 19:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B16916126D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BASwV29CDb4T; Mon,  6 Nov 2023 19:45:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF050612BC;
	Mon,  6 Nov 2023 19:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF050612BC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26B031BF29F
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C60D41B93
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C60D41B93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N2_0D7g-8ZQo for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:45:25 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A9EBA41821
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:45:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9EBA41821
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E3DD1C0005;
 Mon,  6 Nov 2023 19:45:21 +0000 (UTC)
Date: Mon, 6 Nov 2023 20:45:20 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231106204520.00ec35d1@windsurf>
In-Reply-To: <20231105215221.1602465-2-adam.duskett@amarulasolutions.com>
References: <20231105215221.1602465-1-adam.duskett@amarulasolutions.com>
 <20231105215221.1602465-2-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699299921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h6WAx79EDZ9ib6zJf0RtrWFrL242mjZAOQGvhJo/CY0=;
 b=JxF6D/8U+1l7e9wl7alHUO4zM1hpqUpAB7EmyJ0ogn4Rk31uv9lEjs5KdnXejqTAaUdBoz
 Z0s92i3lJUdc8UeEaZ2kTg8wKhBcS9SrAlBaJJnqb+9xzmFvyYOkdd7u9xSMKcW7ovKHMG
 7/2LUckerx9gSEqI9vYIG/NSWyqKieRUY68pQkEEpNmuURkb1ststRgZMV+PjjXSU+rK1z
 zu0fjVOrvvMgveblvwAPX9LxMWCQV72n9XI4aNlTNEIhKZXpZKho+dZI9xggMXmUJaTsBg
 jkGM6TmkxPDRLCyhiVr9NMeSQQnVgooi7Xa+ySRu4bZciNf9DkbkmulLN012jA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JxF6D/8U
Subject: Re: [Buildroot] [PATCH 2/5] test_systemd_selinux.py: use timeout
 argument for emulator.login
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

On Sun,  5 Nov 2023 14:52:18 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> self.emulator.timeout_multiplier *= 10 is equivilent to 60 * 10 or 600.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  support/testing/tests/init/test_systemd_selinux.py | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/support/testing/tests/init/test_systemd_selinux.py b/support/testing/tests/init/test_systemd_selinux.py
> index fab23e3330..d463f91669 100644
> --- a/support/testing/tests/init/test_systemd_selinux.py
> +++ b/support/testing/tests/init/test_systemd_selinux.py
> @@ -21,9 +21,8 @@ class TestSELinuxSystemd(infra.basetest.BRTest):
>          """
>  
>      def wait_boot(self):
> -        # The complete boot with systemd takes more time than what the default multipler permits
> -        self.emulator.timeout_multiplier *= 10
> -        self.emulator.login()
> +        # The complete boot with systemd takes more time than what the default multiplier permits

I think the wording of the comment no longer made sense, since we're no
longer tweaking the multiplier. So I've reworded the comment a bit
(likewise for PATCH 3/5).

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
