Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F57C4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 22:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C4654086E;
	Mon, 14 Nov 2022 22:14:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C4654086E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l8IsAiVHlyRw; Mon, 14 Nov 2022 22:14:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 321474086B;
	Mon, 14 Nov 2022 22:14:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 321474086B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD2C41BF36D
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A464E40155
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:14:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A464E40155
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JTsXB4aYPrjT for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 22:14:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 976F940012
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 976F940012
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 22:14:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6DF7D40007;
 Mon, 14 Nov 2022 22:14:17 +0000 (UTC)
Date: Mon, 14 Nov 2022 23:14:16 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221114231416.7e012568@windsurf>
In-Reply-To: <20221111195115.3918675-1-james.hilliard1@gmail.com>
References: <20221111195115.3918675-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668464057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=79hVoOYbCoVxsTkn4jtp7w2lnGJt15qJPHb6VbKHhxk=;
 b=DLYp7k92VhR/SncQsUZLzld1/V0sSMioMR/gjcHxHreAvZzc5cPWKkfMr1EOXAZwG2sSZH
 +rB6JcVCKkGtF0eTR63uzqxxluz7NKWgLkhLBDY9VvIS6bztrDFVeSBxUVgde7cI+bLks3
 afPO6q8OW2RIdnSnfWk8Ro3wRVphYwn2g0C2d4rbKMFHeHzqBQZyvNJe59vtiszquIgZQ7
 rTKQQBXfps0pg4OS/xvvi3z/JXV+KkKm56VhWltuUffWTi1qP+8ZT7yVd0pz/+gM3HcihS
 2KxdpCM/6YBrSe16Jds7YSCVyteEgUm0RD4+D/Vfv/B1J+TObYP6ciMeKCBmVg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DLYp7k92
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.60
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

On Fri, 11 Nov 2022 12:51:15 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add support for new optional bluez5-backend-native-mm and readline
> config options.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/pipewire/pipewire.hash |  2 +-
>  package/pipewire/pipewire.mk   | 11 ++++++++++-
>  2 files changed, 11 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
