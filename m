Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E73C433EF
	for <buildroot@archiver.kernel.org>; Sat, 26 Feb 2022 10:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89ECF404C9;
	Sat, 26 Feb 2022 10:35:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0vxRhmKurlRy; Sat, 26 Feb 2022 10:35:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71C3E401A3;
	Sat, 26 Feb 2022 10:35:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 528B51BF484
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 10:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4100784044
 for <buildroot@lists.busybox.net>; Sat, 26 Feb 2022 10:35:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ktDEMXmmaMso for <buildroot@lists.busybox.net>;
 Sat, 26 Feb 2022 10:35:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 390AC83FC1
 for <buildroot@buildroot.org>; Sat, 26 Feb 2022 10:35:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 36444C0005;
 Sat, 26 Feb 2022 10:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645871739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CG5WFvJjTreseS+ybYIYNgV7br1LUvPhiFbZJtbouvU=;
 b=ak9WbOJ0L1pTvbbYcvcHwuP8aK4RuhQMPlMexFouNe92+YlBSm2gcSthGNIGz4kRHwnxE/
 r3VWv1ShhF1GfgGxHNqWLQSwrWrrlOgPYqw1N1lA0Hu1z5zPtAvSVO2OqwpuHZP8iAJHZc
 3OhbwjwA9qwM+swHQvbLtffo45DWOhmuYrolSoKvQ+fN2J/nZxeYXQC4EO4au2p9NQ31Tk
 e0Os6/G14uxcORJfwTAqim0BsOKimNR4mFna9fUKcPRqeeA2aL6G4Lm7Vlh8/aL/YhAUNS
 A8qXH/fXf5fFGDMjn5PzIuhu4Hy+BOVGJKA+BZmbHK0AURe58QwmSdjM1SmLZg==
Date: Sat, 26 Feb 2022 11:35:38 +0100
To: Kamel Bouhara via buildroot <buildroot@buildroot.org>
Message-ID: <20220226113538.6def80d0@windsurf>
In-Reply-To: <20220225113400.802049-5-kamel.bouhara@bootlin.com>
References: <20220225113400.802049-1-kamel.bouhara@bootlin.com>
 <20220225113400.802049-5-kamel.bouhara@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/4] package/libodb-boost: add host variant
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
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 25 Feb 2022 12:34:00 +0100
Kamel Bouhara via buildroot <buildroot@buildroot.org> wrote:

> Add host variant of libodb-boost required by host-odb package.

This is a bit short, and I think just like PATCH 3/4, it needs a more
extensive explanation that the ODB compiler needs the libodb-boost
headers at compile time, and therefore installed in $(HOST_DIR).

> diff --git a/package/libodb-boost/libodb-boost.mk b/package/libodb-boost/libodb-boost.mk
> index bac5f1e78f..7f2ad1fe72 100644
> --- a/package/libodb-boost/libodb-boost.mk
> +++ b/package/libodb-boost/libodb-boost.mk
> @@ -11,7 +11,10 @@ LIBODB_BOOST_SITE = https://www.codesynthesis.com/download/odb/$(LIBODB_BOOST_VE
>  LIBODB_BOOST_INSTALL_STAGING = YES
>  LIBODB_BOOST_LICENSE = GPL-2.0
>  LIBODB_BOOST_LICENSE_FILES = LICENSE
> -LIBODB_BOOST_DEPENDENCIES = boost libodb
> +LIBODB_BOOST_DEPENDENCIES = boost libodb \
> +			    host-boost \
> +			    host-libodb

This seems wrong. Why is libodb-boost depending on host-libodb-boost.
At least, this makes the dependencies added in your PATCH 2/4 a bit
irrelevant.

I guess what you need to do instead is:

HOST_LIBODB_BOOST_DEPENDENCIES = hoost-boost host-libodb

And rely on the logic in odb.mk to pull in host-libodb-boost when
BR2_PACKAGE_LIBODB_BOOST=y.

Could you fix your patch series, and send a new iteration?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
