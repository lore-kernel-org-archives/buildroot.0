Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8394AC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CF5B41E86;
	Tue,  6 Feb 2024 10:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CF5B41E86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4wWV9a4i1HH2; Tue,  6 Feb 2024 10:27:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8058841E83;
	Tue,  6 Feb 2024 10:26:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8058841E83
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 007C51BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA87A41E83
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:26:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA87A41E83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W_cNlF14WLEB for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:26:55 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 816C841E6A
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 816C841E6A
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0B46E0004;
 Tue,  6 Feb 2024 10:26:53 +0000 (UTC)
Date: Tue, 6 Feb 2024 11:26:52 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206112652.52a41aab@windsurf>
In-Reply-To: <20240109060406.3976484-1-james.hilliard1@gmail.com>
References: <20240109060406.3976484-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707215213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=33sY5llDRvN9oSWJflPrqnn/v9VN9HJ+43TIxUBsuuo=;
 b=KjzK6miK2tG+namzxHLZhblOBU2/qhvo5/peucE1Rs/oLBoKGU7/ht4dR3g3nX7QrPXxcS
 zO1in/PXp/yaX8kXmli59b1BEr/74iJjIpnm4NlqkCMCfCp7IEXyKWuyNV97EEp8a19XAR
 4Vk4g1ea5znBGb2Fm3rOQkwYwJ1kGrlQ47Nn5oHGNVkEetVo/EF8VtV9/oWLY1cG4B5rl3
 c1o9Uh5p//J/UHGY4c2LCv55PTzWEnK9BFgulo87JH4OrdeiDMc485WZhsb+gr7Btu0W26
 DMDi3ng8Z5CZb5x7MejTsfPaZCcYVlQyv7smdnf+V0vKOeGVeHd+rD7qujKZJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KjzK6miK
Subject: Re: [Buildroot] [PATCH 1/1] package/python-colorlog: bump to
 version 6.8.0
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
Cc: Joris Offouga <offougajoris@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  8 Jan 2024 23:04:06 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-colorlog/python-colorlog.hash | 4 ++--
>  package/python-colorlog/python-colorlog.mk   | 4 ++--
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
