Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125F1C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE23941F10;
	Tue,  6 Feb 2024 10:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE23941F10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GZ8mYPx50Op8; Tue,  6 Feb 2024 10:38:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F6BA41EB1;
	Tue,  6 Feb 2024 10:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F6BA41EB1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1D1851BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA83241E78
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA83241E78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G-g_nV-NXbwk for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:35:18 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2216541E72
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:35:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2216541E72
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65E59240004;
 Tue,  6 Feb 2024 10:35:15 +0000 (UTC)
Date: Tue, 6 Feb 2024 11:35:14 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206113514.0d220c19@windsurf>
In-Reply-To: <20240109074024.4045632-1-james.hilliard1@gmail.com>
References: <20240109074024.4045632-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707215715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o8YUmuK0g12d1KN7RKQwO5csxBV9y9lEHzRHSNuNyxw=;
 b=Dg1jid9HtSlq3nK1nCBtPfOcNJermqBb7Pf87QWq671naXFiGxi/fgL1OYRlcaElEWXcu6
 /cQfuLZm29b5vaLsYZrLp9IRhEep/0uWVygMxB4ccHkuQIDrB33AzZA5NDnbj0H8X25mxC
 P50iqZYCBraZiGJ5SCicm2WQ8h5qq4qWgIQYLTUq/flTNSyZCqbeTDj0g5TuDVkZgcNzXU
 8AWprEkZj1J7xWhgWDkj7ccrPpqngzVrRdakyoIF7BgPbGND6vXN2I7LkwP3DjObvFFLU8
 vK2wZ29qWuA1VmCyXVQGHhsFzEhebFfAJ+7cX6rD7zN1ORjJMBYFZi7YPr3zqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Dg1jid9H
Subject: Re: [Buildroot] [PATCH 1/1] package/python-fonttools: bump to
 version 4.47.0
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

On Tue,  9 Jan 2024 00:40:24 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-fonttools/python-fonttools.hash | 4 ++--
>  package/python-fonttools/python-fonttools.mk   | 4 ++--
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
