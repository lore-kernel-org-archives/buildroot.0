Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B643C001E0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE9D6417A9;
	Wed,  9 Aug 2023 21:38:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE9D6417A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1fhTYdcfJz-W; Wed,  9 Aug 2023 21:38:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9F824012F;
	Wed,  9 Aug 2023 21:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9F824012F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D0DC1BF28A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADD5F4012F
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADD5F4012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id plwIQXjcL69v for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:38:25 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55D47417A6
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55D47417A6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5489FC0003;
 Wed,  9 Aug 2023 21:38:23 +0000 (UTC)
Date: Wed, 9 Aug 2023 23:38:22 +0200
To: Javad Rahimi <javad321javad@gmail.com>
Message-ID: <20230809233822.334dbbb5@windsurf>
In-Reply-To: <20230315091729.1771792-1-javad321javad@gmail.com>
References: <20230315091729.1771792-1-javad321javad@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691617103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gQUwa4VaYh+pMyW31h7liB6HV8+OHokUrl5P4sTybxU=;
 b=Y3qj8dvQT2gExGLHQK4ZYM3e9+kYYXkw7lPaCLw8z9gpZ+dUmHVN8N4U4qrzHln3bx4fDU
 kovjA3+h9abQeEFey1J8v/ExaYQYe/Vr4HuZYXnUyz6sn0pLATDv+7RK6EKlUZLb0dqrNa
 j5VaUJghFPlnRS4ryvbOnlS9/Y3v8Hgwdkbnui2R40Co/Ub02E842yarhSuRB5vgIWeuqT
 Mk0JqL7koqgeITShAzwVkHF9+5puSElzZihLMYIhq+TggN3nFQwLUr2lzMDpF6gOiZnbax
 xHYwKDYCUC++K1CIpE2ax0I1bYR0XtZkRebqp5mHL5tPNlnihaFnGRbKuxcZWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y3qj8dvQ
Subject: Re: [Buildroot] [PATCH 1/3] configs/orangepi_pc2: add board support
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

Hello Javad,

On Wed, 15 Mar 2023 12:47:27 +0330
Javad Rahimi <javad321javad@gmail.com> wrote:

> This patch adds requried configuration for OrangePI PC2 board.
> It was supproted before, however due to problems in
> building Arm Trusted PLatform, it was removed in
>  commit "eeede611f81d8f83b72e4a6671cd7d1e46b266b0"
> 
> Signed-off-by: Javad Rahimi <javad321javad@gmail.com>
> ---
>  configs/orangepi_pc2_defconfig | 36 ++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 configs/orangepi_pc2_defconfig

Sorry for the long delay in getting back to you. I have applied your
patch series, but after squashing the 3 patches together in one commit.
Splitting it into 3 didn't make sense in this case.

However, could you work on updating the version of the components in
the defconfig? Building Linux 5.16, TF-A 2.5 and U-Boot 2022.01 is
quite old. Could you submit a followed-up that updates this defconfig
to newer Linux, newer TF-A and newer U-Boot? Please make sure to base
your patch on our "next" branch, as I merged your contribution into
this "next" branch.

  https://gitlab.com/buildroot.org/buildroot/-/commit/930a6d9470efc5c46bcff358947c050540555a6c

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
