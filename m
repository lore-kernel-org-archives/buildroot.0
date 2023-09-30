Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D3AE7735A
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 06:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74D01421F6;
	Sat, 30 Sep 2023 06:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74D01421F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S6zUn4IXlCYM; Sat, 30 Sep 2023 06:55:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B16742163;
	Sat, 30 Sep 2023 06:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B16742163
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 187781BF82C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 06:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E059D60F36
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 06:55:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E059D60F36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 379x5I96jBXX for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 06:55:38 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D6BE60F2E
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 06:55:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D6BE60F2E
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6F21C0005;
 Sat, 30 Sep 2023 06:55:34 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qmTt0-00AFG1-37; Sat, 30 Sep 2023 08:55:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yanghao Cheng <YanghaoBillCheng@gmail.com>
References: <CAGnyD8udPeWvFXjQGrV2kDhMRLVv9T0aNNAJPTgxjQNLr-BU8w@mail.gmail.com>
Date: Sat, 30 Sep 2023 08:55:34 +0200
In-Reply-To: <CAGnyD8udPeWvFXjQGrV2kDhMRLVv9T0aNNAJPTgxjQNLr-BU8w@mail.gmail.com>
 (Yanghao Cheng's message of "Mon, 25 Sep 2023 15:42:59 -0700")
Message-ID: <87lecocfq1.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] test-pkg failed, then what?
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

>>>>> "Yanghao" == Yanghao Cheng <YanghaoBillCheng@gmail.com> writes:

 > Hello everyone,
 > I am trying to add the wiringpi package back as now that there's a
 > continuation on Github.
 > https://github.com/WiringPi/WiringPi

 > I brought the old config.in and .mk files off the old commit that removed
 > them and adjusted the site.
 > I tested it on my board and it builds. Prior to submission, I also tested
 > the package with test-pkg script. But the tests either failed or were
 > skipped.

 > I've read the section 18.25 of the manual, but there isn't any instruction
 > to go about fixing the failed test.

 > Following is the output

 >> $ utils/test-pkg -c wiringpi.config -p wiringpi
 >> bootlin-armv5-uclibc [1/6]: FAILED
 >> bootlin-armv7-glibc [2/6]: FAILED
 >> bootlin-armv7m-uclibc [3/6]: SKIPPED
 >> bootlin-x86-64-musl [4/6]: FAILED
 >> br-arm-full-static [5/6]: SKIPPED
 >> sourcery-arm [6/6]: FAILED
 >> 6 builds, 2 skipped, 4 build failed, 0 legal-info failed, 0 show-info
 >> failed

test-pkg by default builds under ~/br-test-pkg. After a failed build you
should have a number of subdirs there, each with a logfile explaining
the error.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
