Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA944EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 21:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47FB04179D;
	Mon, 10 Jul 2023 21:27:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47FB04179D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kkndPLUUFyMZ; Mon, 10 Jul 2023 21:27:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14B7641794;
	Mon, 10 Jul 2023 21:27:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14B7641794
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C9381BF33B
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 21:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 340174179C
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 21:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 340174179C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yvXb8PJT_YAo for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 21:27:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0ADF41805
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0ADF41805
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 21:27:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5FA3A20005;
 Mon, 10 Jul 2023 21:27:11 +0000 (UTC)
Date: Mon, 10 Jul 2023 23:27:09 +0200
To: Thomas Huth <huth@tuxfamily.org>
Message-ID: <20230710232709.5b8a3eca@windsurf>
In-Reply-To: <20221015060411.326933-1-huth@tuxfamily.org>
References: <20221015060411.326933-1-huth@tuxfamily.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689024432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q17wq+XW/tuCN4adzcrDYqzrF89EtPjzHINACLE3mGM=;
 b=fMrFMwUswPp3Elg5twmlHovwJgtlp05MrO1lUoSBYrkxEhM9Sapxyoyp4/MymCSq8JRb94
 s5ER5BNXM+qAIJoTMMXaYAkdi+kGLKRM3Puo4jolVntIGF+9tf4PZY1n2m/VVrLNWpIojw
 cMqkATHrqLM6us8DeCtUPpmrfEY9hCuG57GdxrGojlO+U4f+/ph0wMUnG7K/an2YqwqdZp
 HWGhosJ8mJNNrQyQBHHXIc3XAq8aO6OuKne+0u5cJiKl42FrPKM1rERBnVvJGLzkRbLJMH
 ms8MEhX5SROUG9FY+hjBFFvJWCz8WVBV9N2I4/8xi5kax29JZeKUAvF8No2e0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fMrFMwUs
Subject: Re: [Buildroot] [PATCH] package/frotz: Add a missing dependency to
 the Makefile to fix build problems
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Sat, 15 Oct 2022 08:04:11 +0200
Thomas Huth <huth@tuxfamily.org> wrote:

> There are currently some build jobs failing where blorblib is built before
> hash.h has been created. This patch should hopefully fix these issues.
> 
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>
> ---
>  See e.g. here for a failed build:
>  http://autobuild.buildroot.net/results/9cd213ce2d36f797041c7b21044c2b2c223dd546/build-end.log

I believe this kind of issue dates back from when James was testing
with --shuffle=random. So I tried to reproduce locally by doing several
builds of frotz with "make --shuffle=random", and I was not able to
reproduce. I'm not really keen on adding a patch that "hopefully fix
these issues", without being able to reproduce them and confidently say
that the patch fixes the issue.

So for now, I've marked the patch as Rejected, but we can always
revisit that if we get a way of reproducing the issue, and therefore
confirming that the problem no longer occurs thanks to the patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
