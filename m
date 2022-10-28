Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F67AC38A02
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 06:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6788410DE;
	Fri, 28 Oct 2022 06:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6788410DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jvZEBP_TUWm9; Fri, 28 Oct 2022 06:54:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E17E5410D7;
	Fri, 28 Oct 2022 06:54:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E17E5410D7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D0CA1BF860
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2523D8142E
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:54:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2523D8142E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w7IPjwT-F9bE for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 06:54:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F219080C11
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F219080C11
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 06:54:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6CA7240005;
 Fri, 28 Oct 2022 06:54:18 +0000 (UTC)
Date: Fri, 28 Oct 2022 08:54:17 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221028085417.4c939fa6@windsurf>
In-Reply-To: <20221023091009.18544-1-fontaine.fabrice@gmail.com>
References: <20221023091009.18544-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666940058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=emJN33CxmyF5t6oMh7tY31RQITvR2vJXhARt3x/WNKQ=;
 b=eERuWklkJmauqOXe1sdH16jqnmlAQQb7x4d4rGYtqKH0GVaMKhd/cF2xYNglLEL2hrfrSF
 8S76fW8rNmNZuz51vTPA6KAd1WUFrxEHsxbLikuZgiXrve+t+qXHZu3rqbm1GnjQvDHU3w
 u+wEJM1sS5+c6k8JjMr1/WB0WDtT1VRH54A5UqtyTETlnbofSgEmmHgzydzoDsf/JpZNCe
 yx94F/2kpjkfBRndU1O/PFldmwlNDW8UPHSXsQSqxpALlR1rtZ6qS62Ees3wuJlxBIr1LA
 06UQXy2jKVW594542MsRrT1NYWeoKkbj9nII+wJIHYRi8PjvFp99+DrgdKcnNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eERuWklk
Subject: Re: [Buildroot] [PATCH 1/2] package/lz4: fix LZ4_CPE_ID_VENDOR
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

On Sun, 23 Oct 2022 11:10:08 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:yann_collet:lz4, which was added by commit
> 63332c33aa0771532807fd2684d4eee4eb952435, was never a valid CPE
> identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ayann_collet%3Alz4
> 
> cpe:2.3:a:lz4_project:lz4 is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alz4_project%3Alz4
> 
> While at it, also drop the note added by commit
> 45db4bb08e3e550db483d8745fe8aaede2fa7e98
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lz4/lz4.mk | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
