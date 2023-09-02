Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECE1CA0FF8
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 07:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A5A3416D2;
	Sat,  2 Sep 2023 07:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A5A3416D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6NMfX3qzP-CB; Sat,  2 Sep 2023 07:44:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2A024012B;
	Sat,  2 Sep 2023 07:44:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2A024012B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 39E951BF3CB
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1380341020
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1380341020
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TgO_i0a4o3iT for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 07:44:13 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3308405D1
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 07:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3308405D1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67053C0003;
 Sat,  2 Sep 2023 07:44:09 +0000 (UTC)
Date: Sat, 2 Sep 2023 09:44:08 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230902094408.34b74b6c@windsurf>
In-Reply-To: <20230831173736.84288-1-ju.o@free.fr>
References: <20230831173736.84288-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693640649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JjyRz4YRBDkcTsRVkfSct6qXrtGoMG6aAY0pvdbdhM8=;
 b=DXWJye2dVT/R8gDvVDUPgzr8Ee04+OUSpGh2VVK8xGBUC5VDgzu4ReKA+Xc1EW/DH53DmK
 LCtFLro2epDKYhhqIZA0PdtvTm33+D/CtsH+4kstlY0ak5mnPUt5mXDo3ASux6FDCjEcuh
 2qvarwx6hhBY74Q3tKx3279qyfo60K66IRb7GoZ9SgTtTYvuYQIE1JRZqUKnxlt53awhPE
 dm4MV5HxjwX3OsAWlFviYAg4BtBkdCFsbA3+KwNlxRqPYYnI60X3fn5M+n9h253TXpck+m
 tDT5OahE+D+wNQkr/zivWjEzScj4ov4ENc91S7O6vDoXlRlzNKiRsglWC7fZKw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DXWJye2d
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: python-magic-wormhole:
 fix random failures
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 31 Aug 2023 19:37:36 +0200
Julien Olivain <ju.o@free.fr> wrote:

> The magic-wormhole "receive" command can output "waiting" messages
> when key receival or verification are longer than a predefined
> timeout:
> https://github.com/magic-wormhole/magic-wormhole/blob/0.13.0/src/wormhole/cli/cmd_receive.py#L135
> 
> The intent is to have an interactive user experience.
> 
> This behavior makes the runtime test unreliable as the test always
> expect the sent message as the exact output. When the test execution
> is slower, it sometimes get the "waiting" message instead of the
> expected message.
> 
> Some test jobs are succeeding:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4968059737
> while some other are failing.
> 
> magic-wormhole can override those timers with environment variables.
> See:
> https://github.com/magic-wormhole/magic-wormhole/blob/0.13.0/src/wormhole/cli/cmd_receive.py#L26
> 
> This commit sets those environment variable to larger values
> (100 seconds instread of 1 by default), to make sure the test will
> always pass.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4962923235
> 
> Reported-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  support/testing/tests/package/test_python_magic_wormhole.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

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
