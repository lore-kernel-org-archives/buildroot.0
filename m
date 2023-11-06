Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C07C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECD574013A;
	Mon,  6 Nov 2023 22:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECD574013A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lrwl4-BOLUQa; Mon,  6 Nov 2023 22:35:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FBD940450;
	Mon,  6 Nov 2023 22:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FBD940450
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A04C1BF951
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE5128234E
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE5128234E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h-8GglV7a3jm for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:26:08 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2C11824DC
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2C11824DC
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3DC4C60002;
 Mon,  6 Nov 2023 22:26:06 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:24:34 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232434.6fddf4aa@windsurf>
In-Reply-To: <20231105051352.2833549-1-james.hilliard1@gmail.com>
References: <20231105051352.2833549-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XlPFris+U3Hnbx/l89x2PqGGRDFaU3brgjd3FFHmjSs=;
 b=k9YnBb4YxMdOJqrrbNYSSjaRNDRK2kQcm+8deZlQskAbID3SXxYoLPiKYOdHP5Sw6GrK4e
 VnQOR9vk9GMyCBetbHG6S8QGWZA9EQagp+bC0u5U8aOwfBZXKNlaPH/5c63ygDGZ8CB37G
 xeX+g05wx+Js+oX7L5iP+uWg+RXkisePCEraHAehYwPlVzPcDPCB+kyTMh3V4sZnyMH3ML
 fV3lFNAhOvJbjldM9y5uaJB7i0ySUQm4ZX0xtjX+eJ/XtUlL5DWPHCeOQfsHvaT5toNIEw
 jkgxirdF9PxIL1KQ6tcC4fbhxhAUhfYeY2wDA3JQaTgyOTEYDRACYTqh2C4NyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=k9YnBb4Y
Subject: Re: [Buildroot] [PATCH 1/1] package/python-esptool: bump to version
 4.6.2
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  4 Nov 2023 23:13:52 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-esptool/python-esptool.hash | 4 ++--
>  package/python-esptool/python-esptool.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
