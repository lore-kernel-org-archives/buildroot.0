Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3B0C71153
	for <buildroot@archiver.kernel.org>; Mon,  4 Sep 2023 16:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F38340C2E;
	Mon,  4 Sep 2023 16:26:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F38340C2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I_9mAjCowxhJ; Mon,  4 Sep 2023 16:26:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDB7740B67;
	Mon,  4 Sep 2023 16:26:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDB7740B67
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F0B11BF364
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 16:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B7D640B67
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 16:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B7D640B67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U9CAG_GPwR_x for <buildroot@lists.busybox.net>;
 Mon,  4 Sep 2023 16:26:54 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9B2940025
 for <buildroot@buildroot.org>; Mon,  4 Sep 2023 16:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9B2940025
Received: by mail.gandi.net (Postfix) with ESMTPSA id 75C4A1C0009;
 Mon,  4 Sep 2023 16:26:50 +0000 (UTC)
Date: Mon, 4 Sep 2023 18:26:49 +0200
To: patrick.oppenlander@gmail.com
Message-ID: <20230904182649.51e17f8d@windsurf>
In-Reply-To: <20230903230647.311877-2-patrick.oppenlander@gmail.com>
References: <20230902191549.44efa583@windsurf>
 <20230903230647.311877-2-patrick.oppenlander@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693844810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vw4a2RZdfu4Y3BS5zWIHb6dJkcaAieuoU0f9F2JjjEI=;
 b=gMHn41KlLx9g6y8be8YcJje8La7HTNCzGKr93ODYJX75ObqePbb891kRZge5WrMVbth/Zq
 K7vAHVQWSPA5TENL6F8YuxE013kEdU4ghthjrqikH+zA/zM0hBgA86he5tDU/lJplaR3UO
 xDAHT4jaQij2yFVsFH9tm/1LkyBu2RTWCSe6LIE4L9w2U23XmYswSS49eFzCHpkQqqwN98
 +DlJOzewdLrsCW8ZQa9fESqKtDnbx52qNSNTGInGsguon2QxzThwd92SRaSgsWT6WiXRdf
 FLIWhrdxk5O7RueX2hMl2Rk9K5+gu/sYJCQj1T9TcJG//t2zZ9T4rJ3PaDhTTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gMHn41Kl
Subject: Re: [Buildroot] [PATCH] ti-k3-r5-loader: support devicetree
 customisation
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

On Mon,  4 Sep 2023 09:06:09 +1000
patrick.oppenlander@gmail.com wrote:

> From: Patrick Oppenlander <patrick.oppenlander@gmail.com>
> 
> Hi Thomas,
> 
> sorry about that. Resend below.
> 
> Patrick

This also doesn't work, because now your commit log would be:

=============================================================
Hi Thomas,

sorry about that. Resend below.

Patrick
=============================================================

Your commit log should be a proper commit log, which explains the
change and its rationale.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
