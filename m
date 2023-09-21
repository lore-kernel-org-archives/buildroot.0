Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1B4E71060
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 13:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD4AA8125D;
	Thu, 21 Sep 2023 13:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD4AA8125D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id th623tau7e4i; Thu, 21 Sep 2023 13:00:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E82E81026;
	Thu, 21 Sep 2023 13:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E82E81026
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C8671BF3AD
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 13:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E98C7409BD
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 13:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E98C7409BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rSbU0sBkEc4C for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 13:00:37 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E86594002B
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 13:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E86594002B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30C2C1BF212;
 Thu, 21 Sep 2023 13:00:35 +0000 (UTC)
Date: Thu, 21 Sep 2023 15:00:34 +0200
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20230921150034.473400dc@windsurf>
In-Reply-To: <20230918103035.3022611-1-buildroot@heine.tech>
References: <20230918103035.3022611-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695301235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jRHlJMfcqrLmiErqM7A6lFRaJW/KBjMhYkq4ytWvMbA=;
 b=fW1brHxtmkDRHcupw2jMY8mWHakq+fuHwdFBntjp5CXiiWFxYI6qFyOlucY6ioSEKe0k5+
 z2jqg6iS9vI+eShrrUmx4pE4Kr1vFG8OLEmc1TstdfL4t6J+hCWUJisL9lck+Ki9qGbFY0
 +U0aG+9m+Yqgi8rz5x+n6KdJH6HdIkKmsfY1t5V6pVmViVzdWp7KGDEg0ImJP7Pu79s5KL
 Btv1isf0grx/dS3UnOm/ZBmshL5+WkR01cAUrR2j6mp05w7noSbtELFYI2u8PNoWpXhCZJ
 ylA9N9NQVjG46EBBCxvjNkSEqueZv6fJPvAjUGHSs3gwn8Mz0FEgtmvln/3T7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fW1brHxt
Subject: Re: [Buildroot] [PATCH] package/gtest bump to version 1.14.0
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
Cc: Stephan Hoffmann <sho@relinux.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 18 Sep 2023 12:30:35 +0200
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> - tag prefix changed from 'release-' to 'v'
> - C++14 is now required which gcc5 already provides
>   (tested with bootlin toolchain armv7-eabihf--glibc--stable-2017.05-toolchains-1-1)
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/gtest/Config.in  | 2 +-
>  package/gtest/gtest.hash | 2 +-
>  package/gtest/gtest.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)

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
