Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A22BC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 08:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C00B540C70;
	Wed, 22 Jun 2022 08:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C00B540C70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xS3mQevFjIZH; Wed, 22 Jun 2022 08:32:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6E9840A09;
	Wed, 22 Jun 2022 08:32:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6E9840A09
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E7B81BF410
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 08:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 368E640A09
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 08:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 368E640A09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CzhNZKmpz6Ga for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 08:31:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9341F409A6
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9341F409A6
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 08:31:57 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 9070BC3898
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 08:29:42 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6EEB5FF810;
 Wed, 22 Jun 2022 08:29:35 +0000 (UTC)
Date: Wed, 22 Jun 2022 10:29:33 +0200
To: Neal Frager <neal.frager@xilinx.com>
Message-ID: <20220622102933.345ead6c@booty>
In-Reply-To: <20220622042439.30423-1-neal.frager@xilinx.com>
References: <20220622042439.30423-1-neal.frager@xilinx.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1655886576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZoY86p40B08yEoEMcK+fHS4LK/TGeWDZCB2BfR1YdwE=;
 b=IJ7F4QAw8Q0z9+c8jlQ83VmtVq0sfloxA3TjJxQwszQe1/oSNtUF5cpWPN26QAswG/ywRd
 acf4CsmJuuIpmeMzPW7NnSFMtJHBLnSkVMILolnAdZskbLv/Eri0N+WiWM+YcFRvwxaHQ+
 nFnkLHWjc7qjnJN5/7fOVhBYa1DAQZAhesp9Uh14YQQq1g+20zJX4No1NHtJ/NrRlFKsQF
 5Ff6/jW2XaK8mZYCUChJfYjFaYwvBWThOE++UH5sZyUyMY1AczBIiwljv6h/ew48bPgYcv
 SlOrCHI6vyGoHBbT1eL4duj7MLLybbgXWciJ4MF2422/Z9DIFnvn+dfxDzNqMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IJ7F4QAw
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/zynqmp_kria_kv260_defconfig:
 fix to u-boot.itb generation
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org, wesley@sonifex.co.uk,
 giulio.benetti@benettiengineering.com, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Tue, 21 Jun 2022 22:24:39 -0600
Neal Frager <neal.frager@xilinx.com> wrote:

> This patch is a temporary fix for the kv260 u-boot.itb generation
> until a proper fix has been implemented within u-boot.
> 
> The problem is u-boot can only be configured to use the kria k26
> som dts configuration at build time, and the kv260 carrier board
> overlay is missing from the build.  Without this, all of the carrier
> board drivers are missing.
> 
> This patch will be removed from buildroot once u-boot can build a
> correct u-boot.itb for the kria kv260 starter kit including the
> carrier board overlay and corresponding drivers.

Adding here the link provided by Michal would have been nice (and also
easy to do...):

https://lore.kernel.org/all/20920b0df6b067aca4040459a9677d7d1d6d766a.1615354376.git.viresh.kumar@linaro.org/

Maybe the BR maintainer wants to add it while applying this patch?

With this possibly added:
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
