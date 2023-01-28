Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EB8C38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 19:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E45B40620;
	Sat, 28 Jan 2023 19:58:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E45B40620
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I4875H2CDM0H; Sat, 28 Jan 2023 19:58:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E23B340470;
	Sat, 28 Jan 2023 19:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E23B340470
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C2BC1BF48B
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 19:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0263181BFA
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 19:58:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0263181BFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AERv-67NIEBo for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 19:58:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A08C81BBD
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A08C81BBD
 for <buildroot@busybox.net>; Sat, 28 Jan 2023 19:57:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 39E4B40004;
 Sat, 28 Jan 2023 19:57:56 +0000 (UTC)
Date: Sat, 28 Jan 2023 20:57:55 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230128205755.79a0293d@windsurf>
In-Reply-To: <20230127122552.236033-1-francois.perrad@gadz.org>
References: <20230127122552.236033-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674935876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=abmwte2LlsyBRqhk/axZRKevsPc28L5AdDo9eGbkDDY=;
 b=d3H7lqobob13qV/kdRoDs0KZjEX+NaanGGxWOWNJq4J/YojnmCHN48aAm5RUL3JW/PiZBh
 fkJ+a4b1VCZV4DMhmSRoeopgVe1kMc7rO+UYsGtDMerzJHfu7s0GQQNwgZ8YyF9ocB0qWH
 G9e63C259/JOkWuK/qxTH7LTjPE39dJfUJArHB4QkgRFAlO68VstsVBCEQkAyLx3Fs2Vuq
 FwPxRUA2naAN0tAUWDTysFP2XiRdBNSVYKpUq3F1CRDKkDm8y27BiM+TsBHCNAWewzqqkZ
 Bx2WGadg7yW9RPZ7n8QRufRQ1nFpogWUrrAxMHJoBlpafk7yvbR26jdkcd/Bmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d3H7lqob
Subject: Re: [Buildroot] [PATCH] package/janet: bump to version 1.26.0
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 27 Jan 2023 13:25:52 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> diff LICENCE:
> -Copyright (c) 2021 Calvin Rose and contributors
> +Copyright (c) 2023 Calvin Rose and contributors
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/janet/janet.hash | 4 ++--
>  package/janet/janet.mk   | 2 +-
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
