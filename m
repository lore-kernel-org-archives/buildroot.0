Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892B8C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 21:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31AC881417;
	Sun, 11 Dec 2022 21:48:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31AC881417
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VXOJlAcCvWUq; Sun, 11 Dec 2022 21:48:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7769781414;
	Sun, 11 Dec 2022 21:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7769781414
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A9D21BF309
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 21:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D92064088B
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 21:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D92064088B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kjj__L22pPcG for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 21:48:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A174B4054A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A174B4054A
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 21:48:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B6A361C0004;
 Sun, 11 Dec 2022 21:48:25 +0000 (UTC)
Date: Sun, 11 Dec 2022 22:48:24 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221211224824.29e1b459@windsurf>
In-Reply-To: <20221211201758.146018-1-james.hilliard1@gmail.com>
References: <20221211201758.146018-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670795306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RYCBnm4PPtT3fCuuMleYDegbFDlLrQQLoq7QChb9G6o=;
 b=FIX9NEUzMNPs8mrfVv109gQOlfzZeO/HYnU+9CrvHJ980JjLOCZt/gz+IOcdY2ew0W3XDA
 gnIh0ey4j9KVlOXPecmE4N28D3e/mzs3Azz+BNtazhsJJT2CXsH/MuQkCS75MlYmu5Mqw6
 q66KRPu8/99zXx2LADEbc5pLuA9M7VHAi8TTn+rGnNZKA9vvr1b4e7cpvlFGSKHsyOHbQl
 shZFIJO4BJCRQU3zEUea1kyde1anufNKFoBoo2o7NFkcu4y003UbzFNUp8D8A5XZL/zJxy
 nMZh0UEBWkjllsZDpUIZDnPQjKz5KX1q1rewvunFrDRK1VjMc9rO0ZQ+jXYleg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FIX9NEUz
Subject: Re: [Buildroot] [PATCH 1/2] package/python-automat: drop
 host-python-m2r build dependency
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

On Sun, 11 Dec 2022 13:17:57 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> The host-python-m2r package is no longer required to build automat.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-automat/python-automat.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both applied, each time with an extended commit log that explains
precisely since when the problem is occurring.

Having more detailed commit logs would *really* be useful.

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
