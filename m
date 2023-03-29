Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5FEC6FD18
	for <buildroot@archiver.kernel.org>; Wed, 29 Mar 2023 06:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25C3D404AB;
	Wed, 29 Mar 2023 06:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25C3D404AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TnOL-85t7kWU; Wed, 29 Mar 2023 06:44:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7985F402A8;
	Wed, 29 Mar 2023 06:43:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7985F402A8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5221F1BF966
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 06:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CEFF41C4D
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 06:43:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CEFF41C4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3nzhK6VyZ6FK for <buildroot@lists.busybox.net>;
 Wed, 29 Mar 2023 06:43:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6B1E41C46
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6B1E41C46
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 06:43:56 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4B3AB240005;
 Wed, 29 Mar 2023 06:43:53 +0000 (UTC)
Date: Wed, 29 Mar 2023 08:43:51 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230329084351.57721a85@booty>
In-Reply-To: <20230328195659.GC3204460@scaer>
References: <20230327135948.90710-1-luca.ceresoli@bootlin.com>
 <20230328195659.GC3204460@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1680072233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ce1IMVo2Avktd0L/EoGJpzfL1lDMinOImJl1fcavQTQ=;
 b=TkB3eYplKdP05qmShArSGCoFatPRbhbCK8reM/ojJLJT2seQS4bn7sX/MpTs3ktW5VXWFd
 BGDJ3fHUbD3znvrta4+0/XU0RFdlSHdocfZizPOBDYF6bV3LhzQedBIk8dl2OEehLA4yTy
 oXL8cSSYGrqf/I6yg65toWeJUTv+dqk6HYgPmTxn66QkUPwDGpXa6x6CyLJdgXVQsGh3ju
 f2wY8+lhSjehpDfjvmkhXONbzNN8kzQ4e9Ym7Zh9RK2yvvQCFeZR8sgeLod8g3k3x8IANX
 sphIjGDbxj7K5Pjpt18ov2ea5ucgf5Zm9vViFYqzhJCIrQ9SRijOq7DVIrcxqA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TkB3eYpl
Subject: Re: [Buildroot] [PATCH v2] package/linux-tools: add USB tools
 (testusb and ffs-test)
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
Cc: Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Tue, 28 Mar 2023 21:56:59 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Luca, All,
> 
> On 2023-03-27 15:59 +0200, Luca Ceresoli spake thusly:
> > Extend the linux-tools package to also build the userspace USB tools, which
> > currently include testusb and ffs-test.
> > 
> > These tools are in the kernel tree since a long time, but a Makefile was
> > added only in 5.9 to allow building in the same way as other tools provided  
> 
> That is not entirely correct.
> 
> The Makefile itself has been present since 2.6.39, but indeed only
> gained an install rule for 5.9:
> 
>     4f22ce7045c1  2011-02-17  USB: tools: Add a Makefile
>     9ca325ffcac4  2020-08-19  tools: usb: move to tools buildsystem
> 
> So I've tweaked the commit log accordingly.

I think the original sentence somehow had the same meaning, even though
it would possibly take a lawyer to prove that... Your rewrite is way
more clear (and fun). Thanks!

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
