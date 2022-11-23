Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30088C4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 22:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFFC681EBB;
	Wed, 23 Nov 2022 22:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFFC681EBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b1wL5NlBHFaS; Wed, 23 Nov 2022 22:20:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17B6281EB8;
	Wed, 23 Nov 2022 22:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17B6281EB8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 947041BF32A
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 22:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BA4181EB8
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 22:20:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BA4181EB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aSWzBVBe3P25 for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 22:20:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4526B81A6F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4526B81A6F
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 22:20:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9127C20002;
 Wed, 23 Nov 2022 22:20:41 +0000 (UTC)
Date: Wed, 23 Nov 2022 23:20:40 +0100
To: yegorslists--- via buildroot <buildroot@buildroot.org>
Message-ID: <20221123232040.6e2158ed@windsurf>
In-Reply-To: <20221122145017.6250-1-yegorslists@googlemail.com>
References: <20221122145017.6250-1-yegorslists@googlemail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669242041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pFSRtUG/Of5ST7hgYDbZXUU02Dxa6GY4L4U7UcUi+Kg=;
 b=fedRHSAvjJdQb5+Vp1AjYfRBhEH6HfES7hYs2Pyhif3ayT3hnrltguI6/PnnoOZYQGJHr8
 M/2P1ezBeXO8PVu3E+aLZPlOzPoExwC8v0XQ7RP4xBWZs0aW2Ek/R+ASJ8R2qi78zHp6re
 4yNCm8e1FvB4rirvKoJmEUOBJbZ+dcG81NOFX1uWIGPjHWLQjmtUo4SSqukdefFa1QwiqT
 pztrkBNUXBNsy3rD+5xu/PE1SAdZgUnnMWIrC5Bo5LJko3KlAIO6oVDfp4/AVbMZ4wY2T+
 1XB513Una7Kk/EcFIhobL7rj60xxm7ZskWwJxaFNEOiChnbNItXbPBQrsM4/WQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fedRHSAv
Subject: Re: [Buildroot] [PATCH] utils/scanpypi: add LICENCE.TXT to the list
 of the license files
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 22 Nov 2022 15:50:17 +0100
yegorslists--- via buildroot <buildroot@buildroot.org> wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  utils/scanpypi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
