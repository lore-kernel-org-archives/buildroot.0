Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B1CCA0FF8
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 07:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD79C40579;
	Sat,  2 Sep 2023 07:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD79C40579
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bt8ybqKtWGcT; Sat,  2 Sep 2023 07:40:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E031C405BE;
	Sat,  2 Sep 2023 07:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E031C405BE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1218F1BF3CB
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E00C181272
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:39:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E00C181272
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GQKgN55d27Uk for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 07:39:01 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABB4D8124F
 for <buildroot@busybox.net>; Sat,  2 Sep 2023 07:39:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABB4D8124F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C94BE0002;
 Sat,  2 Sep 2023 07:38:56 +0000 (UTC)
Date: Sat, 2 Sep 2023 09:38:56 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230902093856.00883ba3@windsurf>
In-Reply-To: <20230902072610.737589-1-francois.perrad@gadz.org>
References: <20230902072610.737589-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693640337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=exBRwliAgrSc69a2DKeq3e5DIH64xgx3e9ICPIwznXo=;
 b=CtN7j7RijTy55dg04udBPsyadtJl2yAhuD+HDxJOt3GOVEgZAG3p0SThAhtoZLs9hUZ699
 Jqd2kso+gkCWNhTKN9oOdRZHVFRUCdG6KAZq8MeLkhfjBOO3xSe59zFGFCazBbPaVdn8Db
 eh28iziXo5Va7nwi+1aUbXAo8jgBoH08hcz9F6RisTMFT9qvOVx5RoDfkFaT65cCPM+wpc
 QP4S0p1b+g+7fLeukOloKben0HPfLRa2B8Sj7hoPeHTQFtOL1rGPqdC71jLDwXwpWptz+C
 vFzXjzVRJ/iAp5eEQLr5qTZSRkVqv60E/KteyZsgCUzNLkpy9VGLARviVyzynQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CtN7j7Ri
Subject: Re: [Buildroot] [PATCH] package/libgpiod: bump to version 1.6.4
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  2 Sep 2023 09:26:09 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  ...build-add-a-configure-switch-for-building-examples.patch | 6 +++---
>  package/libgpiod/libgpiod.hash                              | 2 +-
>  package/libgpiod/libgpiod.mk                                | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)

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
