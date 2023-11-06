Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB4CC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03C22421BD;
	Mon,  6 Nov 2023 22:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03C22421BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AyG2bCSW0RU0; Mon,  6 Nov 2023 22:34:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4775C421E7;
	Mon,  6 Nov 2023 22:34:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4775C421E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 101221BF951
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52222824D4
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52222824D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y7fK9UlEUdGS for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:26:07 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5143682896
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5143682896
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8ED5E60008;
 Mon,  6 Nov 2023 22:26:05 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:25:37 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232537.71c5188e@windsurf>
In-Reply-To: <20231105032004.2779822-1-james.hilliard1@gmail.com>
References: <20231105032004.2779822-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AmeBaa/L+qtdMidFKOmm/eRzJ0ackYo5T8TeGxfUNCE=;
 b=MkHZThxV0TyV4iGnX6Nz5teLdSeSGZLrX1H4PDMQDCKdRcOldHD2GyVYb7IDYMLnPy1x8B
 aDMHA16tKmuK02wIKMDacIx89tRqQdtnZF/LBkJy8ER3i8BqMEI4h8zUmQZznkjN0vsxwi
 LfYmn0WI/Kkd2EGp6KlZipJ464hM2P/83CQedz5WCk+elwd4fEHvvWe5qEzCjmKiMRf2xV
 JWMq/C+dkwkunuk8h1xhYWLQg5NVu2bjdSvdk3PBb2IaFXNSbs/Z2IqPHxMwqppYJT6bPm
 cPNDI0CJqfA7g04x0UD0CDS9MrCN85tmHnUwJmicNx8AENiMPvUTN2FYLBlZBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MkHZThxV
Subject: Re: [Buildroot] [PATCH 1/1] package/python-construct: bump to
 version 2.10.69
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
Cc: Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  4 Nov 2023 21:20:04 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-construct/python-construct.hash | 6 +++---
>  package/python-construct/python-construct.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
