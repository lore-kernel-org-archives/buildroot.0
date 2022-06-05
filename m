Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D41C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 21:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D72B040D77;
	Sun,  5 Jun 2022 21:11:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OpWiXfJo7K2w; Sun,  5 Jun 2022 21:11:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF1E44060C;
	Sun,  5 Jun 2022 21:11:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F40571BF290
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3D18840C7
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:11:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bpNs-85Ry-YM for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 21:11:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E03F840BF
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 21:11:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2850C200002;
 Sun,  5 Jun 2022 21:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654463470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CaPEoQVoWDRmGWLXUr8XEPa5NgVcuVc1lBAWc93PR18=;
 b=RH6JUP1kPqdWPyejF0JMjvlMtfb+5uqSsdkcz3KPdLrNw8FOgaoc0cLHAcIHentO8Safk/
 iCAdTavLF+ebdAZX/VkE/fVxOkubQzb2DeGZGFQ4I+1laFj39Gjo+LUZb1OLrpQMraZaij
 SGFoHaYGLMHdug9Ca3WjSGj1tI1Mno/ewmlcVRRax4SLf3wjir/EpUj61DvVNnHQOsdwlD
 K7pIp7bQifBxz7s1FPF/lgHfnAYhSH8qjoxTX7hxSQhVaQ8IK3Mjhlma9v3tizTZtRrAiE
 XsVgznEl1IrXOSQR+CpOe5c4ZP32j/bpTzxKoER7RY8qf/x+JQqIS5DHK51RjQ==
Date: Sun, 5 Jun 2022 23:11:09 +0200
To: Grzegorz Blach <grzegorz@blach.pl>
Message-ID: <20220605231109.213d1526@windsurf>
In-Reply-To: <20220529223248.51556-1-grzegorz@blach.pl>
References: <20220529223248.51556-1-grzegorz@blach.pl>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/5] package/python-rpi-ws281x: Bump to
 version 4.3.4
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 30 May 2022 00:32:43 +0200
Grzegorz Blach <grzegorz@blach.pl> wrote:

> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
>  package/python-rpi-ws281x/python-rpi-ws281x.hash | 4 ++--
>  package/python-rpi-ws281x/python-rpi-ws281x.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
