Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC27C46CD2
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 17:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDE3481D73;
	Sun, 24 Dec 2023 17:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDE3481D73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZpzRYxItENvK; Sun, 24 Dec 2023 17:55:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DD7481E19;
	Sun, 24 Dec 2023 17:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DD7481E19
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 43D501BF398
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 17:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BC5940481
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 17:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BC5940481
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0OmX6PNvlDw8 for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 17:54:07 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4BF04049A
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 17:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4BF04049A
Received: by mail.gandi.net (Postfix) with ESMTPSA id B51ECE0003;
 Sun, 24 Dec 2023 17:54:04 +0000 (UTC)
Date: Sun, 24 Dec 2023 18:54:04 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231224185404.3a37a016@windsurf>
In-Reply-To: <20231224081901.21761-1-bernd@kuhls.net>
References: <20231224081901.21761-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703440444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fFk+QcWEKXQAolc1Pf7OGm8iAeHD6ZXeD/wZwz7PDf4=;
 b=DL1EHMj1UUtgJgRriK+2JB23mpKLp1kuOiejWHNvi6cx02zyKX7J7AQvGdDtgp18VHYN6X
 NUpDDIJE11pa9bBfGStGs7P/wYd9jCS+yd7LEqkKiHs6ClEkb+Sstgi1Z30FvQcDycjLYc
 G4VQ5/eWcVCxVRKnXRCcWBE1uNtuifWPOjSOz19qUxEFSHA8vQFPb18IuCGJArfmUUr69W
 DHp0rGKL0YneSMTOsnp/QuIOelGjGOPWvqESm/fd29qTS6u/5pirkHZ4IXyK0aM6Ien50b
 USTmqPnIiedqZEPc8q9Hu9TmoFQmRLsfuoPnasWw00Xa5IuYoI53ouVMZoDwMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DL1EHMj1
Subject: Re: [Buildroot] [PATCH 1/1] package/php: bump version to 8.2.14
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

On Sun, 24 Dec 2023 09:19:01 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://www.php.net/ChangeLog-8.php#8.2.14
> Release notes: https://www.php.net/releases/8_2_14.php
> 
> This release fixes build errors with libxml2 2.12.0.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
