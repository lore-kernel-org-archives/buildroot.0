Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C128EE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 22:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 111BE40B56;
	Mon, 21 Aug 2023 22:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 111BE40B56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BmEaM-xR_Jk6; Mon, 21 Aug 2023 22:05:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 662B840A58;
	Mon, 21 Aug 2023 22:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 662B840A58
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 474D41BF35B
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 075EE40917
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:05:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 075EE40917
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o4MuPHsGSyLP for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 22:05:08 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D9444011A
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 22:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D9444011A
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1BD960002;
 Mon, 21 Aug 2023 22:05:04 +0000 (UTC)
Date: Tue, 22 Aug 2023 00:05:02 +0200
To: Ismael Luceno <ismael@iodev.co.uk>
Message-ID: <20230822000502.437da006@windsurf>
In-Reply-To: <20230815203447.25250-1-ismael@iodev.co.uk>
References: <20230815203447.25250-1-ismael@iodev.co.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692655505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hjQ8SFrYp9p7f3DUnW9O7h4M2tch0Q/6W/ewcO34j1Y=;
 b=ZHRBYFYRo8HAz1EQt1kHaV0uNOKZ3HQCSiWOCl8DHkk/pwcAGf20Q4A6w1RseIuKTbpfYV
 +Q5gQNpNnvcOqGyEdXsoSiB+PAfoGmkfPd7rMdrBoMFEI1AneIEOCWHK7dw+s8L5QzkbuL
 igBHzfx9fpvCLlrrUmGFYyNK4FVMbraSMOCMO0W6LxLWQFaYSEoWBP+dCHN9DrahWYIrwE
 QIKjGMQIbNLRlujbkmlyDbF04bxxdtx724LPg63ghT/S4ahHUw4R2xRT3izgBgHSRk8/Fk
 yvZP/MnfhHP/t8hZl7atmQzqCukmngduYChPJd4sneVC0sNiKeQmLNu8K14EgA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZHRBYFYR
Subject: Re: [Buildroot] [PATCH] package/mawk: bump version to 1.3.4-20230808
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

On Tue, 15 Aug 2023 22:34:47 +0200
Ismael Luceno <ismael@iodev.co.uk> wrote:

> Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
> ---
>  package/mawk/mawk.hash | 2 +-
>  package/mawk/mawk.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
