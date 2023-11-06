Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA41FC4167D
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8338F42138;
	Mon,  6 Nov 2023 22:28:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8338F42138
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i6iMRyl95htn; Mon,  6 Nov 2023 22:28:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C224342161;
	Mon,  6 Nov 2023 22:28:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C224342161
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CDED1BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3126A415C3
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3126A415C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JS1VZ9gOFgzB for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:25:50 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 087B8414BD
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 087B8414BD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 462F160002;
 Mon,  6 Nov 2023 22:25:48 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:23:34 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232334.47b62715@windsurf>
In-Reply-To: <20231105074023.2885255-1-james.hilliard1@gmail.com>
References: <20231105074023.2885255-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ULrPM4ZS0Z4tlQjMU14ov+U+aGvMt3oFx8Km9JYr04g=;
 b=lXjtcmUGoR46ALAhuvuYQ3Eg0V++H04c2KN/cZ57KgYPH3JK1vxfFYz8dU/+Ha2Z4qgIYv
 iiPLGMdcw6qTltgorFTEnua7txhIUk9+ijCwi2LQO1I1OiwgINwxj+PC+xTSZe1UBstDBl
 GtUAXXTSS7XyQVuIU6/wA2s6bdcsS7Q93rwkT0dEcXb52bL6BGWos9qRy2OUC/M/SowwbD
 7lWGpZv79m59+fptjqpmkVGzyV736LRYYpykGMM2R87VXbbgLCqCxsDgOo4o5cX8tSui9T
 hMplE7Zvr8YzYsQhavmeKEzqVM/G/Lt8/aluZialVP82GQL0EpzAZSp3YYgybw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lXjtcmUG
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ipdb: bump to version
 0.13.13
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

On Sun,  5 Nov 2023 01:40:23 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-ipdb/python-ipdb.hash | 4 ++--
>  package/python-ipdb/python-ipdb.mk   | 4 ++--
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
