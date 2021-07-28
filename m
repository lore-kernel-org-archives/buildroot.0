Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B13EC4338F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 21:37:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E059E61039
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 21:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E059E61039
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A87FF82FD5;
	Wed, 28 Jul 2021 21:36:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zXBfFELRnpvV; Wed, 28 Jul 2021 21:36:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08D9C82D0C;
	Wed, 28 Jul 2021 21:36:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 625A51BF5B4
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 21:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5575A4062C
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 21:36:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id idHX2jPZ9I1o for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 21:36:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 532B14061A
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 21:36:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C56CDFF802;
 Wed, 28 Jul 2021 21:36:52 +0000 (UTC)
Date: Wed, 28 Jul 2021 23:36:43 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20210728233643.1f38f1b3@windsurf>
In-Reply-To: <c211cc8e-badf-5382-fc9f-f49edd247746@mind.be>
References: <20210406022940.14488-1-pluhuxc@163.com>
 <c211cc8e-badf-5382-fc9f-f49edd247746@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package: add libtsm
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: pluhuxc@163.com, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello,

On Wed, 2 Jun 2021 22:44:42 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>  I was going to apply to next, however:
> 
> On 06/04/2021 04:29, pluhuxc@163.com wrote:
> > From: luhui <pluhuxc@163.com>
> > 
> > Signed-off-by: luhui <pluhuxc@163.com>  
> 
>  We need a real name here. Signed-off-by is a legal statement, therefore it
> needs a real name. Itis a short way for you to  assert that you are entitled to
> contribute the patch under buildroot's  GPL license.  See
> http://elinux.org/Developer_Certificate_Of_Origin for more details.
> 
>  You can simply reply to this mail with the Signed-off-by and we will pick it up
> from there. Or feel free to resend the patch of course.
> 
>  Meanwhile, I'll already add my
> 
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Unfortunately, there was never any reply to this patch, so I marked it
as Rejected.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
