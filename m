Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017CFC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 17:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 993CA84C0B;
	Sat, 23 Jul 2022 17:16:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 993CA84C0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id od8H6MDfFnoi; Sat, 23 Jul 2022 17:16:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD6C284C07;
	Sat, 23 Jul 2022 17:16:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD6C284C07
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D6F81BF5DE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0458A42446
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:16:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0458A42446
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PM9oglfppM4V for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 17:16:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46260418CE
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46260418CE
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 17:15:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9107060004;
 Sat, 23 Jul 2022 17:15:57 +0000 (UTC)
Date: Sat, 23 Jul 2022 19:15:56 +0200
To: Joel Stanley <joel@jms.id.au>
Message-ID: <20220723191556.452e4eec@windsurf>
In-Reply-To: <20220606085108.1628288-3-joel@jms.id.au>
References: <20220606085108.1628288-1-joel@jms.id.au>
 <20220606085108.1628288-3-joel@jms.id.au>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658596558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yK38/lgS/W97U1S6qgDSxCUI/hG87CigY6ST8IUOqLE=;
 b=azT5t5OzJjwGomrfShnmPXp3Efd/Bw8IPxHbIc0jI6Oxf3kfmRVfvZL/6QxSqkxRft7dpY
 RzVnVQIRPzA62+NWk2WCRd96RaXKGjpp3MQR6c8Tqu+6T5zfWmYoKhOJTa/Fs/NYwNwDjb
 m8Kml/1cdWMPYSZ0fEzJNVtMEhjkX6bzwOVDy5fgHjh90efZg8CPiwXwyRTa5BtbcwZNul
 mNb50XO4gbS30uJ481wt8Z/P4+TzBTg7ZXacmsliVmJfUV3OsTrWpwdvissyeRn1OxJwxH
 Y9UpDDAlahi/t7bNG56VbJ7le33g3DhI2sZClpyK5+JYtkJwXqL1vTP/T2feSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=azT5t5Oz
Subject: Re: [Buildroot] [PATCH 2/2] package/powerpc-utils: Bump to v1.3.10
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

On Mon,  6 Jun 2022 18:21:08 +0930
Joel Stanley <joel@jms.id.au> wrote:

> Since v1.3.9 the package requires numa.h from numctl, so add this as a
> dependency.
> 
> This bump fixes a missing limits.h for PATH_MAX when building with musl
> as detected by the autobuilder.
> 
> librtas now builds fine with musl too, so remove the glibc restriction
> for enabling that support.
> 
> Fixes:
> 
>  http://autobuild.buildroot.net/results/613ec647e251ac52a01f222044bd675ce36c1b5b/
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  package/powerpc-utils/Config.in          | 5 +----
>  package/powerpc-utils/powerpc-utils.hash | 2 +-
>  package/powerpc-utils/powerpc-utils.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 7 deletions(-)

So, as Arnout suggested, I split this into two commits:

 - One backporting the musl fix, and just that, so that it can be
   backported to our LTS branch.

 - One doing the bump to 1.3.10, which obviously removes the patch as
   it is upstream.

Note that you had forgotten to propagate the numactl Config.in
dependencies to powerpc-utils, so I did that as well.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
