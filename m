Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1B6EE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 13:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 342B441742;
	Mon, 11 Sep 2023 13:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 342B441742
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UfPQV7coQlE7; Mon, 11 Sep 2023 13:52:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3831A41747;
	Mon, 11 Sep 2023 13:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3831A41747
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29C551BF30F
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 13:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 036B040AE2
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 13:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 036B040AE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qpi9Ga1AAO38 for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 13:52:48 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41A60400C5
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 13:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41A60400C5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 78CFD24001E;
 Mon, 11 Sep 2023 13:52:26 +0000 (UTC)
Date: Mon, 11 Sep 2023 15:52:25 +0200
To: Chris Packham <judge.packham@gmail.com>
Message-ID: <20230911155225.0a63879f@windsurf>
In-Reply-To: <20230911085000.559230-1-judge.packham@gmail.com>
References: <20230911085000.559230-1-judge.packham@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694440365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=moZquTTzjUm2APLmeo0XXdlqL+rLmMhp/1aRkDxDTyo=;
 b=EVqCm+xtbgDMKpWJ9lHm+w9KvXNJmJpcyvvtXrZKFl6PEqRhNjnLplub1D2LhwRrS47c1V
 6RwfNBzOz8bt7Pd8gX87zK1Qh+h6+Kr6UDl4DoUdqqIqCQ1pAuadHP2V7K86+S47lPHQrR
 5qiuD0AprfDj1fPefo4CW1WbHMB7vo7gEkatgzkeLrEa9X6t/g0et/AnDGuBXT5iRlyNYc
 5zAUipY6e6v1FM2iKOZ9lGvfS1cOUEX9XxYerTGmXzGh0NmZfpyNybUFuR+A1z0cJO7sAB
 7dKX4l5RjhsVXyGA7000No0yWX1JV3F1wbYYgW2peGBbXiDyaUVvTdOFI+QqPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EVqCm+xt
Subject: Re: [Buildroot] [PATCH 1/2] syslog-ng: bump version to 4.3.1
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

On Mon, 11 Sep 2023 20:49:59 +1200
Chris Packham <judge.packham@gmail.com> wrote:

> Update to latest version. This includes a fix for CVE-2022-38725.

So this is a security bump?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
