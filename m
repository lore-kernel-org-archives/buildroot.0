Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D47AC77B73
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 07:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B77281776;
	Mon,  1 May 2023 07:44:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B77281776
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tfldmvafkPBo; Mon,  1 May 2023 07:44:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75DAE814A0;
	Mon,  1 May 2023 07:44:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75DAE814A0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2AD2F1BF2EF
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 07:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03E59605A9
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 07:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03E59605A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tw-cEK87Qxdg for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 07:44:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCAAC605A3
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BCAAC605A3
 for <buildroot@buildroot.org>; Mon,  1 May 2023 07:44:44 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C280D40006;
 Mon,  1 May 2023 07:44:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ptODB-006YDl-Vy; Mon, 01 May 2023 09:44:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Matt Casperson via buildroot <buildroot@buildroot.org>
References: <CAOSAz36QEnWSGBW__+GanpD4C==z+uQ+4LW7VCKXTpaO-9XBmg@mail.gmail.com>
Date: Mon, 01 May 2023 09:44:41 +0200
In-Reply-To: <CAOSAz36QEnWSGBW__+GanpD4C==z+uQ+4LW7VCKXTpaO-9XBmg@mail.gmail.com>
 (Matt Casperson via buildroot's message of "Fri, 28 Apr 2023 11:25:23
 -0400")
Message-ID: <87fs8gijh2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] libopenssl CVEs
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
Cc: Matt Casperson <matt.casperson@sense.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Matt" == Matt Casperson via buildroot <buildroot@buildroot.org> writes:

Hi,

 > Based on
 > https://lore.kernel.org/buildroot/20230424053608.ADC944058F@smtp2.osuosl.org/
 > I see a few libopenssl vulnerabilities and I was curious if there were any
 > plans to provide a patch in an upcoming release. I did review Chapter 24 in
 > the User Manual and other sections on patches but wasn't able to find
 > anything specific on patching timelines. Or if you have a general approach
 > to libopenssl that would also be good to know for future reference. I'm new
 > to buildroot so apologies if I'm stumbling around here.

I take it you are referring to:

https://security-tracker.debian.org/tracker/CVE-2023-0464
https://security-tracker.debian.org/tracker/CVE-2023-0465
https://security-tracker.debian.org/tracker/CVE-2023-0466

These are all low severity issues - In fact, so low that openssl has not
made new releases with the fixes.

Is there any specific reason you are worried about these issues? If so,
feel free to send patches with the git formatted patches from openssl
git for those:

https://nightly.buildroot.org/manual.html#patch-policy

A bigger issue with openssl is that the 1.1.1 series will go EOL in less
than 6 months, so we should really start moving towards the 3.x series
instead:

https://www.openssl.org/blog/blog/2023/03/28/1.1.1-EOL/

It would be great if people interested in OpenSSL security would help in
that transition.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
