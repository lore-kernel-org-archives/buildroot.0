Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D63C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 21:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89AB64056A;
	Sun, 11 Dec 2022 21:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89AB64056A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zfHPUWigAlVb; Sun, 11 Dec 2022 21:23:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD2DE4047B;
	Sun, 11 Dec 2022 21:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD2DE4047B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA4F51BF309
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 21:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85A19813E8
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 21:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85A19813E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c4fprjUzfQgE for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 21:23:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C5BC813BE
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C5BC813BE
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 21:23:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8AFE8E0006;
 Sun, 11 Dec 2022 21:23:50 +0000 (UTC)
Date: Sun, 11 Dec 2022 22:23:49 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221211222349.2499ab0c@windsurf>
In-Reply-To: <20221211203541.249923-1-james.hilliard1@gmail.com>
References: <20221211203541.249923-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670793830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fuXrikyKk76Tlg+ANRczp9iayK5+qsNBUQksVyaV5og=;
 b=DZ8Skiv/CqQU1HeSIC0MFLcwZOTrj4elWAvhudvT/hre566ynv5wx9wX8+WCnfX+7BwXZy
 YC2Wgk25hQbTEhDAMsa7UvHsizMqeN4gg804dhchqkG/m35VROgE/FQAYQ4+FDseD2rWcE
 Ki4KwbeC6bjZgNSs633b7wdrEOe9bfCfnSs4iLkfoXEa000HTffmo5Cbnaiv+Y7hNVNno6
 ihtToJulsGTg3GOl6yX7Ck4mvbKuu4o2EBZJKuhMd26qEH2RFWyz5IZ6kNgB+zTHhEkmEO
 84uvwQzFICOO0XF3sXcFEBGJ/V8cERmiR3LZtu8HWxuyCxzhRPlVuChE6nGBZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DZ8Skiv/
Subject: Re: [Buildroot] [PATCH 1/1] package/swig: depend on host-pcre2
 instead of host-pcre
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

On Sun, 11 Dec 2022 13:35:41 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Swig now requires host-pcre2 instead of host-pcre.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/3a7/3a70042aad7376bcccf56d639ced93f504f47963
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/swig/swig.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master with an improved commit log that explains since when
the problem exists, so that we know if the patch should be backported
or not. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
