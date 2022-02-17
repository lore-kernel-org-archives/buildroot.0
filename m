Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B850AC433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 16:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41665425A0;
	Thu, 17 Feb 2022 16:35:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jLhMh32kGuh6; Thu, 17 Feb 2022 16:35:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8722142595;
	Thu, 17 Feb 2022 16:35:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2AA151BF8B4
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 16:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26B9B42595
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 16:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bIi-FLC9JRST for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 16:35:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33DE642594
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 16:35:22 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 26BCE240002;
 Thu, 17 Feb 2022 16:35:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nKjkU-0006zx-88; Thu, 17 Feb 2022 17:35:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20211205102010.2834942-1-troglobit@gmail.com>
 <c76bab40-01a1-e4d0-3f04-02745f8ce26a@mind.be>
Date: Thu, 17 Feb 2022 17:35:18 +0100
In-Reply-To: <c76bab40-01a1-e4d0-3f04-02745f8ce26a@mind.be> (Arnout
 Vandecappelle's message of "Sun, 6 Feb 2022 16:37:09 +0100")
Message-ID: <87o835e9ix.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual: add section on start
 script recommendations
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 05/12/2021 11:20, Joachim Wiberg wrote:
 >> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
 >> ---
 >> docs/manual/adding-packages-directory.txt | 96 +++++++++++++++++++++++
 >> docs/manual/configure.txt                 |  1 +
 >> 2 files changed, 97 insertions(+)
 >> 
 >> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
 >> index 4ceb3fd772..72e8dac5ff 100644
 >> --- a/docs/manual/adding-packages-directory.txt
 >> +++ b/docs/manual/adding-packages-directory.txt
 >> @@ -554,3 +554,99 @@ over time. Such patches should not be downloaded, and instead be added
 >> locally to the package folder.
 >> If the +.hash+ file is missing, then no check is done at all.
 >> +
 >> +[[adding-packages-start-script]]
 >> +=== The +SNNfood+ start script
 >> +
 >> +Packages that provide a system daemon usually need to be started somehow
 >> +at boot.  Buildroot comes with support for several init systems, some
 >> +are considered tier one (see xref:init-system[]), while others are also
 >> +available but do not have the same level of integration.  The
 >> +recommended one in Buildroot is the BusyBox init.

 >  I think the intention is that systemd is at the same level as busybox
 > init. And we generally don't distinguish between busybox init and SysV
 > init.

 >  I made a few other small changes to the text and applied to master, thanks.

Committed to 2021.02.x and 2021.11.x with the same changes, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
