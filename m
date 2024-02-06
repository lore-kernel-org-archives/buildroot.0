Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303D0C4829A
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0C8941E81;
	Tue,  6 Feb 2024 10:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0C8941E81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id drYyRIK6STCX; Tue,  6 Feb 2024 10:39:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40B624086A;
	Tue,  6 Feb 2024 10:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40B624086A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 67EFE1BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 347B1403CA
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:35:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 347B1403CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vRZzO7E_6Y5a for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:35:55 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 054B9400FE
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 054B9400FE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 75ADC240004;
 Tue,  6 Feb 2024 10:35:53 +0000 (UTC)
Date: Tue, 6 Feb 2024 11:35:52 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206113552.410a7350@windsurf>
In-Reply-To: <20240109081438.4068105-1-james.hilliard1@gmail.com>
References: <20240109081438.4068105-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707215753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ODGqCPIOamQS4mX6cJluq3LnE0U64RMygwHUgwhMmxA=;
 b=leqebgyKCr2scWYAHkOmSGue/VYLwBQWQ/Tx0cOGzOd17RXEa7Df+IUW8QHCKKvzLmCzms
 dLdtBjcQzzz/MBgbH0o2ODPJ9MruhgKOooe0XgSvkQjW1sUb1lRm3wcRevZ695BdpWFOSY
 HcgJpFvvcIOWPgVKmDbwdcBYd0AsBJgTLpFgDWsJcgBUFPFeNjd3WoUGJUhgDfEwNLOOfy
 FdPFYq1j92kNM3gN+++gFs1vwFb6XW7Hv/bBS3WQ9fPY56H9MNPKcKbUDiTrSJ3S3u2ti/
 dUZlCHH3NETVdvhOkyk3++EsckpPzCU3XU/CS6UKOtoyQyeWgRbAp80q5wJKuQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=leqebgyK
Subject: Re: [Buildroot] [PATCH 1/1] package/python-httpx: bump to version
 0.26.0
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

On Tue,  9 Jan 2024 01:14:38 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-httpx/python-httpx.hash | 4 ++--
>  package/python-httpx/python-httpx.mk   | 4 ++--
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
