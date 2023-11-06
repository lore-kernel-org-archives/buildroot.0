Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4027AC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E27E961262;
	Mon,  6 Nov 2023 19:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E27E961262
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n9wM-Jk4MKd2; Mon,  6 Nov 2023 19:45:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E6F161288;
	Mon,  6 Nov 2023 19:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E6F161288
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 84A681BF29F
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1936941E45
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1936941E45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mfoSsNIvg0W5 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:44:51 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D00DE41A2A
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D00DE41A2A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15046C0002;
 Mon,  6 Nov 2023 19:44:48 +0000 (UTC)
Date: Mon, 6 Nov 2023 20:44:48 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231106204448.1ddeb111@windsurf>
In-Reply-To: <20231105215221.1602465-1-adam.duskett@amarulasolutions.com>
References: <20231105215221.1602465-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699299889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jE22IW+ElqqCyJ/9DGjNEeuYf4AWJ/erD+d495rgAu0=;
 b=UaFL5SlAs+ahkXosSTKmuW6rHJl7IquGL9iJviIB4z+fqw8YJmCl36NvjnQQeutlGGq4L3
 FeDegeJZAd11OZDj4qtAH2JrHRFEN6HaurQmbeFSFQtaf3FaHSS3KP/mSDf06TOOuDG9Sk
 S8Zs/gznnnt3MtIxVQDl8X60n14/LFkTTNKkL3J489pWdaBYBVI5unqH57L9bBsobKjvrG
 Oddczcrcuka4NbCc19+n1B14T51icWsxkJZZ5Ew5N3DS3yDE8o4UQ+2UDhu8BZBoyaz2Wo
 Jk3LjvgaNDks/4BAfa0/Dqx5r4KP8cz0ItZ8bdLLpKpS7n3uaJzuOWASpKHIPA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UaFL5SlA
Subject: Re: [Buildroot] [PATCH 1/5] support/testing/infra/emulator.py: add
 a timeout argument for the login method
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

On Sun,  5 Nov 2023 14:52:17 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> to override the current value of 60 seconds
> 
> As per a suggestion by Thomas, add a timeout argument to override the current
> value of 60 seconds for the emulator.login method.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  support/testing/infra/emulator.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Series applied. I just did a minor change on PATCH 2/5 and 3/5, I will
comment on PATCH 2/5 as the minor change is the same on both patches. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
