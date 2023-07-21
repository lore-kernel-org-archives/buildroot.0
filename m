Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AACFEB64DD
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 21:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D90E541895;
	Fri, 21 Jul 2023 21:31:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D90E541895
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hQ3Jn7t1R8cl; Fri, 21 Jul 2023 21:31:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EA454186F;
	Fri, 21 Jul 2023 21:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EA454186F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C16811BF82F
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9ADBF80CE3
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:31:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ADBF80CE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LRQ8Ffeb3SNj for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 21:31:31 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A645F80B5C
 for <buildroot@busybox.net>; Fri, 21 Jul 2023 21:31:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A645F80B5C
Received: from relay4-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::224])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 89E78C0B69
 for <buildroot@busybox.net>; Fri, 21 Jul 2023 21:19:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B59BE0002;
 Fri, 21 Jul 2023 21:19:15 +0000 (UTC)
Date: Fri, 21 Jul 2023 23:19:14 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230721231914.73d7248d@windsurf>
In-Reply-To: <20230721184744.819031-1-francois.perrad@gadz.org>
References: <20230721184744.819031-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689974356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4RdSKdTDuVt1NXJoA+SV5jtEOeC7kHonQgy/768Vwvk=;
 b=pn+RxhvR4ayB+jEQ4iAAYRxKvgEgFkIqtCfZGV1ca0pN9DP3Ab+W+anupsIATqT9ixxz4W
 3OwKL3q/CCA4m4hm0zL9/17D9oQsByFFrzazNE6KN61pvkyLKgyYlaFo1egHQX/f1fpWJd
 EeNxNMMv1U74JVnZ4BZqzLjuzrirT6duGUE1D+uUIS9QgTVTD2oRPM9d+sTeFSDB7aOrMX
 T47R+ZKNc/hxGeck9hKev/2iDfCqGENrvA1zL9w6x2tPnTI2AlOMKNwpXUUkRPvdg6zgnz
 NDV/RtuGWkH9XTemQIvnjo+SVHmIyiQJc1ma7JvBU0GKWfznmOJ/3II+Ssuaxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pn+RxhvR
Subject: Re: [Buildroot] [PATCH] package/janet: bump to version 1.29.1
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 21 Jul 2023 20:47:44 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> remove merged patch
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .../0001-Update-for-more-minimal-builds.patch | 29 -------------------
>  package/janet/janet.hash                      |  2 +-
>  package/janet/janet.mk                        |  2 +-
>  3 files changed, 2 insertions(+), 31 deletions(-)
>  delete mode 100644 package/janet/0001-Update-for-more-minimal-builds.patch

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
