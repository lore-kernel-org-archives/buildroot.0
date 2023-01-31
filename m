Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A88C38142
	for <buildroot@archiver.kernel.org>; Tue, 31 Jan 2023 16:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51C7240452;
	Tue, 31 Jan 2023 16:44:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51C7240452
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5bA80rjV-EYR; Tue, 31 Jan 2023 16:44:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 967F740459;
	Tue, 31 Jan 2023 16:44:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 967F740459
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 209BB1BF419
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 16:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3BE840459
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 16:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3BE840459
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ogI9qnWG5EWn for <buildroot@lists.busybox.net>;
 Tue, 31 Jan 2023 16:44:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C06B9403E0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C06B9403E0
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 16:44:44 +0000 (UTC)
Received: (Authenticated sender: maxime.chevallier@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3EC376000C;
 Tue, 31 Jan 2023 16:44:40 +0000 (UTC)
Date: Tue, 31 Jan 2023 17:44:40 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230131174440.227df853@pc-7.home>
In-Reply-To: <95838e6d-1271-b347-61c9-94b5f0cae29f@benettiengineering.com>
References: <20230130144655.1193660-1-maxime.chevallier@bootlin.com>
 <20230130144655.1193660-5-maxime.chevallier@bootlin.com>
 <37a680ce-9213-de60-4d6c-306a787d4bad@benettiengineering.com>
 <20230131161558.5982b380@pc-7.home>
 <51634838-32b7-4ae0-0251-2cd4fc2207ae@benettiengineering.com>
 <ea48dd89-b89f-479d-7df7-a739b66f3101@benettiengineering.com>
 <95838e6d-1271-b347-61c9-94b5f0cae29f@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675183482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M5C9a8y8dCtKM3bncdrJTLKrjKXCrK0BpFnqx5pQ9wo=;
 b=hG7qJHhS+2MMe40MaIAPtiLojOZcrREf2Z6eXMSDc5mWhL2gwe+4f9iNk0RXVmlGGl9uwP
 2+tKt7rCUtAdV/+ZJOscCpQ68IoAUEgMMqggWvThUOz91fE/Ftvro9zMc2v/3a7xAZrsYN
 h6bH1CM5ukNXwItnbv5vIBRbXtSfPr1/fYwta9gnWp5iP3CM2yMFeGlhaVy7fW/cauBLJF
 k1xqgvvBQEshKt83jprzCokI4DheGKD7DHOw2yJsqw0qaC7QYMvg5lu8BB+ExIyud9ao3v
 UwdV3FzjoCLu1SEknsD8CnVUEZ1X9jpA5QarTuoQgxUVDQN7vDQ0PH59xe2rzw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hG7qJHhS
Subject: Re: [Buildroot] [PATCH 4/4] package/trace-cmd: bump to 3.1.5
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
From: Maxime Chevallier via buildroot <buildroot@buildroot.org>
Reply-To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Pierre Floury <pierre.floury@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

On Tue, 31 Jan 2023 17:31:25 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> On 31/01/23 17:07, Giulio Benetti wrote:
> > On 31/01/23 17:05, Giulio Benetti wrote:  
> >> Hi Maxime,
> >>
> >> On 31/01/23 16:15, Maxime Chevallier via buildroot wrote:  
> >>> Hello Giulio,
> >>>
> >>> On Tue, 31 Jan 2023 00:12:47 +0100
> >>> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> >>>  
> >>>> Hi Maxime,
> >>>>
> >>>> I was trying to build trace-cmd but it hangs while calling the
> >>>> first make on building stage.  
> >>>
> >>> Aw ok, do you have some logs of what happens before it hangs ?  
> >>
> >> Sure:
> >> https://pastebin.com/t883KNqZ
> >>
> >> It hangs there forever :-/  
> > 
> > Ah, I've also given a try with -O0 but the behaviour is the same
> >   
> >>  
> >>>> I've tried with both make 4.3 and 4.3.91. Which make version are
> >>>> you using?  
> >>>
> >>> I'm using make 4.3 on my side.  
> >>
> >> So we're aligned
> >>  
> >>> Thanks for giving my patches a try :)  
> >>
> >> Thank you instead for providing the bump!
> >>
> >> Kind regards  
> >   
> 
> This is the log after 20 minutes:
> https://pastebin.com/3saYFn1a
> 
> very strange. And it still hasn't finished. I let it go and see if it
> builds successfully. It sounds like a make problem. All other
> buildings I'm doing works correctly. Just to be sure I've also
> rebooted my PC.

Wow that's strange indeed, I wonder if this is a parallel build problem
in trace-cmd's makefile.

I'll try to reproduce on my side, I've tested that for arm but not
arm64, I'll give it a go and see if I can spot any similar problem.

Thanks again,

Maxime

> CPU usage on the make command is around 6% only, almost 0% of Ram 
> consumption.
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
