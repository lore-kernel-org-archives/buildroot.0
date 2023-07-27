Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35CDC0015E
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 21:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ED1984059;
	Thu, 27 Jul 2023 21:17:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ED1984059
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 31EcNGAi0OHC; Thu, 27 Jul 2023 21:17:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9CF684093;
	Thu, 27 Jul 2023 21:17:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9CF684093
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A38001BF414
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 703EA84074
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 703EA84074
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3EP0Tygo3zYP for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 21:17:28 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E84C84059
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 21:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E84C84059
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE2C760002;
 Thu, 27 Jul 2023 21:17:21 +0000 (UTC)
Date: Thu, 27 Jul 2023 23:17:20 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230727231720.46666b64@windsurf>
In-Reply-To: <20230727175130.2076044-1-james.hilliard1@gmail.com>
References: <20230727175130.2076044-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690492647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+xoCkDyUkX2/IvyfmGHQ5K1oLs1R7BkR9YT25hxhzAo=;
 b=DvzGH7oloW+oIoc6w1DG8zvAxdBUkF4aFmCJo3fRJsAXS01NykcraphyRly4+PNMRBuPje
 SM9iQDdJ/Cs4saKsGngcFqlcqH7TDflJEpNsChJ3zNjBl12VSfOnAU55F5EAyTSb4Qysil
 V1rjwe38GVf8H03dUL3J+2T189QzxvW8hqY3n9fX73HcC6ZQ1bk4Ho7UsLr7+d5MK4FIOa
 WXV+ZNOIiuoDaU5ryvG2fL8XoUMcAO2DjNq/FBpADJrl/ovRbFGbj16wY+qLkmvG01ZfVX
 6GKZk43kQRwbjtjmSXZJ68inJt974R9pQbtKb99v4kLnRJtrGXzKPBl2Nxj0ww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DvzGH7ol
Subject: Re: [Buildroot] [PATCH 1/1] package/seatd: fix seatd group name
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

On Thu, 27 Jul 2023 11:51:30 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> The seatd service was changed to use the "seat" group in version 0.6.0:
> https://git.sr.ht/~kennylevinsen/seatd/commit/5535c2c3b19b42ebfe4c451600059e9418e401a6
> 
> In buildroot we updated seatd past version 0.6.0 in commit:
> c54f85ca0d2ba7b73c899a27e62c67d3389617b8
> 
> However we forgot to fix the group name when doing so.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/seatd/seatd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
