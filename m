Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5484E77362
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 09:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97E3C8235E;
	Sat, 30 Sep 2023 09:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97E3C8235E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id goPsAYOgNu-M; Sat, 30 Sep 2023 09:25:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6299A83BF5;
	Sat, 30 Sep 2023 09:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6299A83BF5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE2561BF2F9
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 09:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97F9140180
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 09:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97F9140180
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K3FzNYbhjgMP for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 09:25:43 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3ECDE400F9
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 09:25:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3ECDE400F9
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8D4FFF805;
 Sat, 30 Sep 2023 09:25:39 +0000 (UTC)
Date: Sat, 30 Sep 2023 11:25:39 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230930112539.5dc62e1d@windsurf>
In-Reply-To: <ZNWRcJrlXwFFkUtG@waldemar-brodkorb.de>
References: <ZNWRcJrlXwFFkUtG@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696065940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BG+g2hVwnlT12c/xQeVLxicFe6wboAGbScUjGXTQq2U=;
 b=KEzJ1nG8s68lpvIK+XeXn028iQyBwGkNYvnk6Lgpx9q1j/7zvlDitsLeBxyzp6+NSgDdWE
 HkA/mvPkVp3w/v53sp/YzeUqhdyaw84jNjAZs3po3z3naXuc3gdEMrDL8vLJi2+W63XvFQ
 5uuhAMARUswq2HrmGo50jOW8+QVYMllSqhzBw8SWrx7NlePCprAC6iTG1ff/ce/U0yFJo+
 o3sh94iTQTCxpxg5FEcpIg3LCjxA+xKQm/UWMLWMTwwWw2OXVcjhVq91xy/rrfgu8qVgQx
 f0+bMMhI3JL3Mzj+QD/CuGc9JnCN5ilA7otwSotZ7aoxdBJEd1h6NznzuL+B6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KEzJ1nG8
Subject: Re: [Buildroot] [PATCH v2] package/batman-adv: update to 2023.1
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

On Fri, 11 Aug 2023 03:40:00 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Older Batman-adv versions fail to build with kernel 6.4.x
> with following error message:
> bat_iv_ogm.c:283:18: error: implicit declaration of function 'prandom_u32_max'; did you mean 'prandom_u32_state'? [-Werror=implicit-function-declaration]
> 
> prandom_u32_max got removed in commit 3c202d14a9d73fb63c3dccb18feac5618c21e1c4
> from the Linux kernel.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/205/2055ac3805d1941c148f1681a224570055dd83cd
> 
> For other changes in this release, see:
> https://www.open-mesh.org/news/112
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1 -> v2:
>  - move locally computed sha256 hash to the right place, mentioned
>    by Thomas Petazzoni
> ---
>  package/batman-adv/batman-adv.hash | 7 ++++---
>  package/batman-adv/batman-adv.mk   | 2 +-
>  2 files changed, 5 insertions(+), 4 deletions(-)

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
