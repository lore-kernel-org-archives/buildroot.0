Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2919C636D3
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 21:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DC1D40585;
	Mon,  6 Feb 2023 21:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DC1D40585
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nLHkMUc6xr0Z; Mon,  6 Feb 2023 21:23:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CF0740577;
	Mon,  6 Feb 2023 21:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CF0740577
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D13681BF2A4
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABC3E40534
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 21:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABC3E40534
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VSyrIXVwH6Ua for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 21:23:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52FC040531
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52FC040531
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 21:23:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5249820002;
 Mon,  6 Feb 2023 21:23:26 +0000 (UTC)
Date: Mon, 6 Feb 2023 22:23:25 +0100
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Message-ID: <20230206222325.09201d23@windsurf>
In-Reply-To: <20220731193521.1217825-5-ricardo.martincoski@gmail.com>
References: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
 <20220731193521.1217825-5-ricardo.martincoski@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675718606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kNS7YJ27zwxnYo9pTJWzsxhT1HOW1bi+yZwdrw9FQj4=;
 b=DJPJh5MPm1A68hLtx/Wn2Bm3A7ddJ+aQmwRKopFORF57vGWp3q4Jul4s1pz5KQxSdKmQSy
 j2S4JBwBSjuzC6l2EPSLfX+x9YUjPNE11pW9DvXD+kP2Epesf6kpODqbMkxdD0GswdpnaG
 9WNeXDYd31Vw//aElELa826dPaPvBsTfxhkHLhLx4zTlzjvG2iwdGjRfzHY3S4BMezG9dr
 1EF9Fmlkxo/wdjwsaHJS/MDqkz3joE0MxRshEj49VPuGsPShQayhgU+u8GPl+GvN4Pczuy
 Jhio2Pzrr5N8TwtfMDZmeHQoSr/YaPYc6eFnTWzefRqa2GYn6kL8rkJQOiRV8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DJPJh5MP
Subject: Re: [Buildroot] [PATCH v2 04/14] Makefile: make check-package
 assume a git tree
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

On Sun, 31 Jul 2022 16:35:11 -0300
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:

> ... just like check-flake8 already does.
> 
> When a new check_function is added to check-package, often there are
> files in the tree that would generate warnings.
> 
> An example is the Sob check_function for patch files:
> | $ ./utils/check-package --i Sob $(git ls-files) >/dev/null
> | 369301 lines processed
> | 46 warnings generated
> Currently these warnings are listed when calling check-package directly,
> and also at the output of pkg-stats, but the check_function does not run
> on 'make check-package' (that is used to catch regressions on GitLab CI
> 'check-package' job) until all warnings in the tree are fixed.
> This (theoretically) allows new .patch files be added without SoB,
> without the GitLab CI catching it.
> 
> Since now check-package has an ignore file to list all warnings in the
> tree, that will eventually be fixed, there is no need to filter the
> files passed to check-package.
> So test all files in the tree when 'make check-package' is called.
> It brings following advantages;
> - any new check_function added to check-package takes place immediately
>   for new files;
> - adding new check_functions is less traumatic to the developer doing
>   this, since he/she does not need anymore to fix all warnings in the
>   tree before the new check_function takes effect;
> - prevent regressions, e.g. ANY new .patch file must have SoB;
> - as a side-effect, print a single statistics line as output of
>   'make ckeck-package'.
> 
> But just enabling the check would generate many warnings when
> 'make check-package' is called, so update the ignore file by using:
> $ ./utils/docker-run make .checkpackageignore
> 
> Notice: in order to ensure reproducible results, one should run 'make
> check-package' and 'make .checkpackageignore' inside the docker image,
> otherwise a variation in shellcheck version (installed in the host) can
> produce different results.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Applied to master after regenerating the ignore file, as requested,
thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
