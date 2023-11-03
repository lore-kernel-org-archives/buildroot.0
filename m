Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BEFC4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 20:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B5D082273;
	Fri,  3 Nov 2023 20:16:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B5D082273
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t70LLO3VZsfk; Fri,  3 Nov 2023 20:16:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA386822F7;
	Fri,  3 Nov 2023 20:16:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA386822F7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 86D2C1BF33D
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 20:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55B8782222
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 20:16:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55B8782222
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m8FDlB3FXpJa for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 20:16:12 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E77B18214B
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 20:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E77B18214B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 814A0240003;
 Fri,  3 Nov 2023 20:16:08 +0000 (UTC)
Date: Fri, 3 Nov 2023 21:16:07 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231103211607.04892bc0@windsurf>
In-Reply-To: <20231103000650.195673-1-adam.duskett@amarulasolutions.com>
References: <20231103000650.195673-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699042569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uPm2sDWHEbBHdWRdxmvaLJ5NMlv6b17V7L4p4dE1SCw=;
 b=b0DNHIC51mgxIsSuo5W+HddYY7KziiQl2JhsDrMmkNa5LB0YAf9eOrAp8J/yxuCL6jbC7J
 OR/A5v2asc2G9GgrKp3vY6QlNR2r2v/vtschy7DkNnuKJj6h0lkFq3jcB5yGsRNbtXxvYq
 PloUh1LTiqfbWQg0dJH87spHByjtu25TRuh2zFDsmvx9aFYSp9XA76XjV7lL/rQnPHGj3m
 6C3X1BaWq0MbD/zyaDORhCpU4+PBbH6A1/bk2tSaqBI4tbnLaGwhIsiIBL5kI5iuwGcmK0
 NmGoiJ+EvWxmuIOVOEgNsupTK02Ubb7OroJJmDZqZ0Rgp/81VvmkqqL6GNNQ8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b0DNHIC5
Subject: Re: [Buildroot] [PATCH] Config.in: Introduce
 BR2_HOST_GCC_AT_LEAST_11
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  2 Nov 2023 18:06:49 -0600
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> NodeJS 20 requires gcc >= 10.1. Unfortuantly, the only host gcc that has a
> decimal place is 4.9, and every other HOST_GCC_AT_LEAST is an even release,
> we round up to 11.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  Config.in | 10 ++++++++++
>  Makefile  |  2 +-
>  2 files changed, 11 insertions(+), 1 deletion(-)

Applied to master with an improved commit title and commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
