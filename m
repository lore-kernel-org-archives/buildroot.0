Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BA3EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 21:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C803D4034A;
	Tue, 11 Jul 2023 21:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C803D4034A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z9cd--RfWW9W; Tue, 11 Jul 2023 21:03:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9F464088F;
	Tue, 11 Jul 2023 21:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9F464088F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B88FB1BF48B
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F8EE83A8E
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F8EE83A8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yv7pICk5u83D for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 21:03:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AC4E83A89
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2AC4E83A89
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 21:03:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB80C1C0004;
 Tue, 11 Jul 2023 21:03:05 +0000 (UTC)
Date: Tue, 11 Jul 2023 23:03:04 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230711230304.399ff43c@windsurf>
In-Reply-To: <20230706190102.10901-1-ju.o@free.fr>
References: <20230706190102.10901-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689109386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TOHo9fy33pgsnhzleYHV84+7zgLjaKZkv03eOXyttbg=;
 b=NLsRkK6jo5Lml5ryJiInMsGdYFIMgbfPWDptdIXfJiVuHq+J5NLPqfj3Q7+fuI6dMeGjes
 BycpXLf3/85rDhB57uJCIcM4UqrLZU5NqIuXwPrs1GwzoKPB0GQTVpMIqwUEBal1IezjWd
 Cw4EGKmBsRDNIgXVXu5vHWfDq8BG4yE59K5jP0mp/JsOSLfQOQmv2cqe617y0hpSc1+t+T
 8u0iWvbdJvp1rx4GrjIUp4DDQl9bqsXeLbzPaD5ZGtjN+bstWEXEWdxueoj+B7ZtaMIIo4
 mR4w+C/AH/T+XPladbhxv38XPdvHEGaxQs0NkHO9YEmFrFaybkB6uVm31039ug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NLsRkK6j
Subject: Re: [Buildroot] [PATCH 1/4]
 support/testing/tests/package/test_compressor_base.py: new helper class
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

On Thu,  6 Jul 2023 21:00:59 +0200
Julien Olivain <ju.o@free.fr> wrote:

> This is a helper class providing a template for testing data
> compressor and decompressor programs such as gzip, bzip2, xz...
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                    |   1 +
>  .../tests/package/test_compressor_base.py     | 126 ++++++++++++++++++
>  2 files changed, 127 insertions(+)
>  create mode 100644 support/testing/tests/package/test_compressor_base.py

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
