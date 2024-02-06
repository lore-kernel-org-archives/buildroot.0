Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDD9C4829A
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEEAA40977;
	Tue,  6 Feb 2024 10:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEEAA40977
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yVKfo0WQ6D7D; Tue,  6 Feb 2024 10:17:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A6D941E45;
	Tue,  6 Feb 2024 10:17:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A6D941E45
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EAA3A1BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C14BC402B1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C14BC402B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hdBf5o9bACOS for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:17:21 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1D97400FE
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:17:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1D97400FE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A874E0010;
 Tue,  6 Feb 2024 10:17:18 +0000 (UTC)
Date: Tue, 6 Feb 2024 11:17:18 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206111718.413fb415@windsurf>
In-Reply-To: <20240108072652.3496708-1-james.hilliard1@gmail.com>
References: <20240108072652.3496708-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707214639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K8uqh6nbqfbrkQyKapYNo52uF2kTX8xYNbBW/stiWCA=;
 b=XoGDh4o3zFa3rr4w5AlO6xaT4prkHW+w/j9ihMbc78JNhtP0P/m6AW+txyE5hX4C64dAqd
 5aFGBvRdENsyKF3ht0jFjPhGlLw+a2XkFRkr3XvBVQ2ONgkyQi4Rst9ZxdX51i4k0W9OwD
 ub7cVoiJJ3h/nB1qGGuzWRF9UerdiroNwkRpS/ithJPA50yvxjJp0nCqLmLqxasuqHlJas
 5+lUezF/kwHp4EGuSf2PnDGFiZH67hhEpn76CyQNsyVirSxAqnFQBaGCIuLEYr1zifske1
 q2EMZhyuVOTqc8Xfiv+oaxSg2/U5N1FY8fKtPaRZvOgLBvI5gTnqeyJbTATL1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XoGDh4o3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-botocore: bump to
 version 1.34.14
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
Cc: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  8 Jan 2024 00:26:52 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-botocore/python-botocore.hash | 4 ++--
>  package/python-botocore/python-botocore.mk   | 4 ++--
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
