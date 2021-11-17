Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6791DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 16:06:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B6DF61BE1
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 16:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B6DF61BE1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1725680F7B;
	Wed, 17 Nov 2021 16:06:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zgtIxRK99QC9; Wed, 17 Nov 2021 16:06:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D77080CF9;
	Wed, 17 Nov 2021 16:06:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F1C271BF3F7
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 16:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDB676068A
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 16:06:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IO9miJLJlhir for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 16:06:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8995060679
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 16:06:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 731F0E000B;
 Wed, 17 Nov 2021 16:06:43 +0000 (UTC)
Date: Wed, 17 Nov 2021 17:06:42 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20211117170642.75b555c7@windsurf>
In-Reply-To: <87zgq9yfvv.fsf@dell.be.48ers.dk>
References: <20211110065623.A90DB401FC@smtp2.osuosl.org>
 <87zgq9yfvv.fsf@dell.be.48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2021-11-09
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Nov 2021 08:47:32 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

>  > nezha | https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966167  | ORPH  
> 
> Hmm, why is this listed as ORPH? I don't right away see any mistakes in
> by DEVELOPERS entry.

As explained on IRC, there was an issue in the scripting logic that
runs all this mess, which made the daily-mail script rely on DEVELOPERS
data from the 2021.08.x branch. This should now be fixed.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
