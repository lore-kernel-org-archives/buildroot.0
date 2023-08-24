Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBEEC3DA6F
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 21:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B2C441BD8;
	Thu, 24 Aug 2023 21:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B2C441BD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QSYuT6YcYF5A; Thu, 24 Aug 2023 21:23:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 266B841BD6;
	Thu, 24 Aug 2023 21:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 266B841BD6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 663381BF84C
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CE7860FE2
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CE7860FE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BfM6vuzw1D9r for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 21:23:56 +0000 (UTC)
X-Greylist: delayed 122482 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 24 Aug 2023 21:23:56 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 814EA60FAF
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 814EA60FAF
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 21:23:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F7F040004;
 Thu, 24 Aug 2023 21:23:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qZHo1-002IIX-Jd; Thu, 24 Aug 2023 23:23:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <SY2PR01MB2778500474B41D29E8E7D54C940AA@SY2PR01MB2778.ausprd01.prod.outlook.com>
 <20230801121118.72610acf@windsurf>
 <SY2PR01MB2778DE94AA435DAE575AAFD7940BA@SY2PR01MB2778.ausprd01.prod.outlook.com>
 <87y1i0cfjz.fsf@48ers.dk> <20230824231615.44df3647@windsurf>
Date: Thu, 24 Aug 2023 23:23:53 +0200
In-Reply-To: <20230824231615.44df3647@windsurf> (Thomas Petazzoni's message of
 "Thu, 24 Aug 2023 23:16:15 +0200")
Message-ID: <87ttsocexi.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] Update schedule of sources.buildroot.org
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
Cc: Afshin Pir <Afshin.Pir@gallagher.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> The machine handling s.b.o did not have the IPC::Cmd perl module
 >> installed, so all the source update runs would fail. I've now installed
 >> that and started a s.b.o update.

 > Thanks for fixing this!

 > Do you think the script could somehow be robustified to let us know
 > when it doesn't manage to do its job as expected?

It is unfortunately not right away clear to me how we can do that - Make
source can fail for all kind of reasons.

Any ideas?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
