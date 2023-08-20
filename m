Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C89EE49A4
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 21:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95EEA41687;
	Sun, 20 Aug 2023 21:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95EEA41687
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id svEu5yogG_86; Sun, 20 Aug 2023 21:23:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 153C34098B;
	Sun, 20 Aug 2023 21:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 153C34098B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF7771BF38D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A87E0401EB
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A87E0401EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qzy8Ta8uihK5 for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 21:23:13 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D96A4098B
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 21:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D96A4098B
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDFD620003;
 Sun, 20 Aug 2023 21:23:10 +0000 (UTC)
Date: Sun, 20 Aug 2023 23:23:09 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230820232309.6a51f2fc@windsurf>
In-Reply-To: <20230820163029.2720609-1-yann.morin.1998@free.fr>
References: <20230820163029.2720609-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692566591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pqek7YgFfSC+vMURCX9zUPweKkZxohWGFhkr/40fU2s=;
 b=T8jZ/3lfaGXGyN2b/UeTEL0WueNRU7D9uytRiNTHxa7xxShDo6bU4B36xFI6uU7ZbYdBJi
 bgaap065rG8xlETFC2zuQDG6TIP2iuMrUvtwq8SkiacrJmIn7z1BOqL6teeIAhI+Avgrm2
 oQ7qoLz+LalUNEzL3oY2MdmW/d8MESNeAqQy2LnRfuSF0kBho9rgIKass9/XvhgXTyqv74
 x2oVPJN+RE7NaSZwjdwu4J0qBxHVGutnDwxQWdCOuQdY50JAE+W87fdsZNjmm7SJF61wN3
 jTzC8k8aDB4VlNGHedLJRYwRjnfJKp3SVpYXnLJubYcylfy8ZfhZJsScSL5R4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T8jZ/3lf
Subject: Re: [Buildroot] [PATCH] arch/powerpc: drop ABI selection
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
Cc: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 20 Aug 2023 18:30:29 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Since it was introduced in 5a6087d62e5c (toolchain: add powerpc SPE ABI
> support), the CLASSIC vs. SPE choice for the ABI was never really a
> choice: CPU without SPE could only use the CLASSIC ABI, while CPUs with
> SPE could only use the SPE ABI.
> 
> Commit b4c824562bb1 (powerpc: add BR2_POWERPC_CPU_HAS_SPE to replace
> adhoc deps/checks) added a blind option that CPUs with SPE would select
> rather than duplicate the ad-hoc dependencies in both CLASSIC and SPE
> ABI options. Since then, it was even more obvious that the ABI choice
> was really not a choice, as the two options have mutually exclusive
> conditions.
> 
> Drop the useless choice, and directly use the blind option as selected
> by the specific CPUs.
> 
> We don't need legacy handling, because the situation fixes itself.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Joel Stanley <joel@jms.id.au>
> ---
>  arch/Config.in.powerpc     | 15 ---------------
>  package/Makefile.in        |  2 +-
>  package/gcc/Config.in.host | 10 +++++-----
>  package/gcc/gcc.mk         |  2 +-
>  package/glibc/Config.in    |  2 +-
>  package/musl/Config.in     |  2 +-
>  6 files changed, 9 insertions(+), 24 deletions(-)

Applied to next, thanks. To be honest, I think we should drop support
for SPE PowerPC platforms. This requires keeping a gcc 8.x around,
which is really annoying.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
