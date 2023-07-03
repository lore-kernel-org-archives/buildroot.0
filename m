Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9489EC001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 19:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DFC481EB1;
	Mon,  3 Jul 2023 19:55:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DFC481EB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5WvK5ySLhFhY; Mon,  3 Jul 2023 19:55:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C26081EF7;
	Mon,  3 Jul 2023 19:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C26081EF7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B34E1BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F80D410C7
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F80D410C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TCMN2XJNXMxy for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 19:55:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07672409A3
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07672409A3
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 19:55:34 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6DFC1C0002;
 Mon,  3 Jul 2023 19:55:32 +0000 (UTC)
Date: Mon, 3 Jul 2023 21:55:31 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230703215531.021857e5@windsurf>
In-Reply-To: <20230702164805.3469254-1-bernd@kuhls.net>
References: <20230702164805.3469254-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688414133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NmYhXKGsLklOMB+Ezz1EsnFjJNvVwFyPlwcmq2kohMM=;
 b=YBPT5FTDmNNlVgmmSLSTpIoFOginq30jUbWFovl6ac0rOxU6oHGvqyyVbrjOXfbVGP9bbg
 Ioz0K5N5BZL3385m2J0j16NXVzbKboifar+svbdpZq/TnjNcdDm3Wa5Kl7d0mLSH7hPmqi
 ZFGKXWwEhV36ciTL6UQoU8Yq2H23Eou/MeWPU1EK/QeuxffbRbib6j1te8yXJ+4Vw3VOVt
 WL6uXXrYLlwIjAZChg8Y5qhKHhm7FKHpGlMBij4ppf8c9/DQ252LlrmmxlTKsnBeOwdIsC
 z3wbqCblSm8C1sLkmUrvGhfV3cAXwEuQWPYauGBVWKWV9V/uXsS0Z3a0Bb1NQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YBPT5FTD
Subject: Re: [Buildroot] [PATCH 1/1] package/dos2unix: bump version to 7.5.0
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
Cc: David Bachelart <david.bachelart@bbright.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  2 Jul 2023 18:48:05 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://waterlan.home.xs4all.nl/dos2unix/ChangeLog.txt
> 
> Updated license hash due to upstream commit which update project URLs
> and copyright year:
> https://sourceforge.net/p/dos2unix/dos2unix/ci/c5acfaf73db3686cf49a46705f00ad8eeb3f7151/
> https://sourceforge.net/p/dos2unix/dos2unix/ci/59510e21846bb9c7c2efdf326dd33d573883f611/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/dos2unix/dos2unix.hash | 6 +++---
>  package/dos2unix/dos2unix.mk   | 2 +-
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
