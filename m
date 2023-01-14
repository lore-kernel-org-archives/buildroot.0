Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F9CC3DA78
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 21:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4F6540342;
	Sat, 14 Jan 2023 21:58:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4F6540342
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J-v-X5I2UpI3; Sat, 14 Jan 2023 21:58:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF93240300;
	Sat, 14 Jan 2023 21:58:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF93240300
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 76E5A1BF3C2
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 21:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CD694063C
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 21:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CD694063C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dp6QjjvWVsg0 for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 21:58:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0953640734
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0953640734
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 21:58:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D623BFF804;
 Sat, 14 Jan 2023 21:58:22 +0000 (UTC)
Date: Sat, 14 Jan 2023 22:58:21 +0100
To: Vincent Fazio <vfazio@gmail.com>
Message-ID: <20230114225821.4edc5530@windsurf>
In-Reply-To: <CAOrEah5_BQzsLnHYkMGvpSR=MxeqTeDkmbKNAQOOJ6eRXreg-g@mail.gmail.com>
References: <20230113225425.3301420-1-vfazio@xes-inc.com>
 <20230114221718.01e97481@windsurf>
 <CAOrEah5_BQzsLnHYkMGvpSR=MxeqTeDkmbKNAQOOJ6eRXreg-g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1673733504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sOR7RhK5VE7rwAxLWi6eEelThQFzxOnITTWNlGU+EW8=;
 b=pW2Zs9JSD/KGoPhQAeDcrn1hjjC7E2gW4JScNDfKV089DKHQjbQE8fo3R2LBXPsb9Ci4uc
 XquOnQWIk3QbV4tkxNW95BhtqAGBdbKVhR0sioOjRpwhtYJs08nsNhClaKKi5aup+UTT0O
 P1RGfYTKrEAqmCrUpRjPsZsj/MD8uddoqMKJf+61yvSQPVG8UI5oOjCDuWq+MYolNJIWHH
 55PrAOymHj+oD/I596p2cTYHy7fjKQy6bU1yMODVAh2LVdNCGz/EfdPPP88PfETAmTSKui
 egRuxA0HHbzUvuNQeOzlNqmWLyMqiA1XwFbFuJl6g8Aj6NzTKWrONQTcpBnIYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pW2Zs9JS
Subject: Re: [Buildroot] [PATCH 1/2] package/ipmitool: backport fixes for
 registry issues
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 14 Jan 2023 15:33:06 -0600
Vincent Fazio <vfazio@gmail.com> wrote:

> replies below (i hope, i haven't tried responding to ML emails in gmail)

It's almost good, except that gmail adds one extra > on the first line
of each paragraph of your replies.

> > So in the current Buildroot situation (before this patch), the registry
> > is always installed, correct?
> >
> > Correct, but with a caveat... as of the version bump to 1.8.19, the file  
> being installed is broken and the tool actually won't work.

So the current ipmitool in Buildroot is broken. Could perhaps separate
a "fix" that could be backported from a large improvement that allows
to not used the registry?

> All upstream patches have been accepted into mainline. The commit hashes  
> in the patches are the mainline commits

Thing is we don't which are "upstream patches". If the patches are
upstream, you can do:

Signed-off-by: John Doe <john.doe@foobar.com>
Upstream: https://github.com/some/where/commit/12456abc

This makes it very clear that it has been accepted upstream, and will
help someone who will do the next ipmitool version bump.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
