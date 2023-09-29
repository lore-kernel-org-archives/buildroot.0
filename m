Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157A0E743EE
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 07:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD49883C05;
	Fri, 29 Sep 2023 07:14:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD49883C05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0AT5nIV0WBSg; Fri, 29 Sep 2023 07:14:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0257983C09;
	Fri, 29 Sep 2023 07:13:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0257983C09
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 63B321BF2BB
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 07:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D48983C08
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 07:13:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D48983C08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n9sTqew1B9So for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 07:13:53 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6048983C05
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 07:13:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6048983C05
Received: by mail.gandi.net (Postfix) with ESMTPSA id 497ABC0015
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 07:13:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1qm7h7-0067g0-P6
 for buildroot@buildroot.org; Fri, 29 Sep 2023 09:13:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20230705164616.671351-1-peter@korsgaard.com>
 <20230705164616.671351-3-peter@korsgaard.com>
Date: Fri, 29 Sep 2023 09:13:49 +0200
In-Reply-To: <20230705164616.671351-3-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 5 Jul 2023 18:46:16 +0200")
Message-ID: <877co9jvte.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 3/3] board/raspberrypi: drop
 variant-specific genimage files
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Now that we have a template generating an equivalent genimage configuration.
 > The generated genimage is identical to these +/- file ordering and a
 > trailing comma / newline that is ignored by genimage, E.G. for rpi3-64:

 > @@ -8,9 +8,10 @@
 >                         "rpi-firmware/cmdline.txt",
 >                         "rpi-firmware/config.txt",
 >                         "rpi-firmware/fixup.dat",
 > -                       "rpi-firmware/start.elf",
 >                         "rpi-firmware/overlays",
 > -                       "Image"
 > +                       "rpi-firmware/start.elf",
 > +                       "Image",
 > +
 >                 }

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
