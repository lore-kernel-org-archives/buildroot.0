Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34180C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 08:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB88A41976;
	Wed, 27 Apr 2022 08:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PPQiW60q-sSm; Wed, 27 Apr 2022 08:31:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8719C41938;
	Wed, 27 Apr 2022 08:31:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E7E91BF947
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 08:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97A5860E0B
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 08:31:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lv_rGFXH1IbI for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 08:31:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C42060B70
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 08:31:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6B8DB240011;
 Wed, 27 Apr 2022 08:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651048276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FUJDyYcl6Cb6Ss9VseQ3Vlrmsmf2/35UTv7mFEmpjS0=;
 b=fgPUWN3GIWX0TiCAf9XlLFPLqZl8kCKXv6Z2TS7XY1PDIXzM4KW7cMJmA2etg0CoQGvU10
 OFku7qs7fODABKaWToBiuBTD2mS/sq7goSYhTziuSMlBrtgonUtvvIyTcQ8RPHV4ODNaMO
 bSB0lCf3CIUFNfGVpQKMzHkwY9c4bTTk6XlrUXgJyReXL70YY8g8oVu/XmRE3wyF2XYZeJ
 1GxACdDQOyo4zW/6tE1yu8HYisfJp771vVKy9/AyJYxYdzrzbXDGnw9xVIqSTso69uL7sU
 ldm2Q/1B1E5gABWZiXQLWqQE1qXhmS2gtMaa5A9QDhX3S+5Nm6brLG5YnllGRg==
Date: Wed, 27 Apr 2022 10:31:02 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220427103102.7f934c1f@windsurf>
In-Reply-To: <20220427035039.1664864-1-james.hilliard1@gmail.com>
References: <20220427035039.1664864-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: drop libressl support
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Tue, 26 Apr 2022 21:50:39 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Libressl is no longer supported as of python 3.10.
> 
> See: https://peps.python.org/pep-0644/#libressl
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/a16/a160cfdc9dfc036c4dc41af1c796f8838d91c573
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Thanks for your patch. I think it raises one question: is libressl
still relevant? Should we still support it?

My understanding was that it is not really a successful fork, and in
the end, openssl has mostly caught up and remains the de-facto standard
implementation. See https://lwn.net/Articles/841664/.

I don't have a very well-informed opinion, but perhaps we should think
about this?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
