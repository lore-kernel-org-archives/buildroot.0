Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B408CC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 11:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A57A842FB;
	Wed,  1 Nov 2023 11:04:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A57A842FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b2IoaECPafi9; Wed,  1 Nov 2023 11:04:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B4FB8485F;
	Wed,  1 Nov 2023 11:04:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B4FB8485F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C173D1BF2F4
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A62083F09
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:04:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A62083F09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EjSSKOJhEE7k for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 11:03:59 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6282E8485F
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 11:03:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6282E8485F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E3781BF209;
 Wed,  1 Nov 2023 11:03:55 +0000 (UTC)
Date: Wed, 1 Nov 2023 12:03:54 +0100
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20231101120354.4ab3f944@windsurf>
In-Reply-To: <20231030101115.2214402-4-aperez@igalia.com>
References: <20231030101115.2214402-1-aperez@igalia.com>
 <20231030101115.2214402-4-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698836636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wl6i9TBk4I+AHDPTmXyV/xZWQpWbX0UtUwRrJcB3aqY=;
 b=F6bhnEDKpM1curSjIZem96lZMQoHOR6OZl2sPIqYsZzPWnY6zLxuf1OztpLgprAakyHY+P
 zJ5oH2wZ+N2pb5GcYhdZIB+YcHYegMc8JjkXWnpGujmo73xctvkPVUkHW5Lp3NkJOJznlY
 irLrYdYxWxMxlxIPq51s4Xn36ZR5RUao4JDlHB1CKHdqQZ7OloqXReVnGRPBQR2yPgpCTF
 AOouIOeAdX+VBkk+QHISNqjEm3Ps58wfezKjI3Hb2697VX+uASkY6bso86N94D/xDz1vsJ
 hk7iSTl/slKgKg1+OobMyQ7twdgJJJQ2wTIsCom/Q9lYWLYlJET2nnLupkNEOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F6bhnEDK
Subject: Re: [Buildroot] [PATCH 3/3] package/sway: bump to version 1.8.1
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 30 Oct 2023 12:11:07 +0200
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Update Sway to version 1.8.1, which brings a new release series to
> Buildroot and can be built with wlroots 0.16.x
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/sway/sway.hash | 2 +-
>  package/sway/sway.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
