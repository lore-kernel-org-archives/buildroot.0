Return-Path: <SRS0=c1N3=NF=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECB2C4338F
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 13:49:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D6C160EFE
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 13:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D6C160EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC970403B2;
	Sat, 14 Aug 2021 13:49:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FMEFwtD2JjfQ; Sat, 14 Aug 2021 13:49:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B2D040351;
	Sat, 14 Aug 2021 13:49:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4FF481BF599
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 13:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EB6880C87
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 13:49:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gDMYzMTUFsxP for <buildroot@lists.busybox.net>;
 Sat, 14 Aug 2021 13:49:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5876380C4C
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 13:49:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 6FA961BF209;
 Sat, 14 Aug 2021 13:49:34 +0000 (UTC)
Date: Sat, 14 Aug 2021 15:49:33 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20210814154933.022a1bda@windsurf>
In-Reply-To: <CALFsTFUWc=g0X1wJUpc9-DyhwcdoT3DzH1DMiho-hfekmeROug@mail.gmail.com>
References: <20210813073634.389426-1-asafka7@gmail.com>
 <20210813150416.021d688a@windsurf>
 <CALFsTFUWc=g0X1wJUpc9-DyhwcdoT3DzH1DMiho-hfekmeROug@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pymupdf: depend on
 python3
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
Cc: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90?= =?UTF-8?B?dGU=?=
 <raphael.melotte@mind.be>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Asaf,

On Sat, 14 Aug 2021 09:04:39 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> > This dependency should have been propagated to the two Config.in
> > comments in that file, so that they don't appear if Python3 is not
> > used. I fixed that up and applied to master. Thanks!  
> 
> Hmm that's interesting...
> I agree it's needed but from a quick look I think we have packages
> which don't do that (for example - txtorcon. If the toolchain doesn't
> support C++, we will see the "comment" part under the python2 external
> modules menu although python3 is needed).
> Do I miss something or is it a real mistake?

Indeed, python-txtorcon/Config.in is also wrong. Imagine the user: he
has python2 enabled, and see "python-XYZ needs a toolchain w/ C++", so
he goes ahead and enables C++. Back to the Python menu.. the comment
has disappeared, but there is still no option to enable python-XYZ
because the option depends on Python 3.x. It would be very confusing,
so we definitely want to hide the Config.in comment with a "depends on
BR2_PACKAGE_PYTHON3" in this case.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
