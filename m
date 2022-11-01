Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467CAC4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5C6760E6F;
	Tue,  1 Nov 2022 22:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5C6760E6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3U1odOy6isK1; Tue,  1 Nov 2022 22:26:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BE9C60E4E;
	Tue,  1 Nov 2022 22:26:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BE9C60E4E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B50EE1BF3E8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 903C08190B
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:26:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 903C08190B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 45dPJvj92Cew for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:26:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C1D58146E
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C1D58146E
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:26:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F14BE60006;
 Tue,  1 Nov 2022 22:26:24 +0000 (UTC)
Date: Tue, 1 Nov 2022 23:26:23 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221101232623.16b4d452@windsurf>
In-Reply-To: <20221015191433.1504189-1-james.hilliard1@gmail.com>
References: <20221015191433.1504189-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667341585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tadH+PfYIiu58Lq+XV7GzkpkUU8A6c6wBLFn9rNOTHM=;
 b=CtKMwvbUSs6pq/JFucRpocB1w9hqDcJn82gHRlUN9KhrnQ2uPn+VcFHTQ4LiK6TGvH4qf/
 UjMYYzuAyKgw8czG6ZyfjqrgmKdBnk7qi7taKmeg03tgDDtOOLA9/2pdh2hGNt/2QPbQ34
 Ddn/EUS+gEJb+wonQam2rnA7ftdHkjTRR3S5v+hQfTZnypUEisDbZuPZ8rvRPGQAayezt4
 j+p5dcFRG4B7kPjrF2f+YknswmFzuUQejvu24okm5HY7lPJiG4R0HB/vh6dVKa0gu8tjYp
 EE2ylMEDw3bv6gtbb62L4Df+unEiTvZeWuw5LldpWckXSnTJLkw8A2v12sqSCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CtKMwvbU
Subject: Re: [Buildroot] [PATCH 1/1] package/wayland-protocols: bump to
 version 1.27
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

On Sat, 15 Oct 2022 13:14:33 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/wayland-protocols/wayland-protocols.hash | 7 +++----
>  package/wayland-protocols/wayland-protocols.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 6 deletions(-)

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
