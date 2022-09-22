Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7FBC6FA82
	for <buildroot@archiver.kernel.org>; Thu, 22 Sep 2022 12:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FE8D40BE8;
	Thu, 22 Sep 2022 12:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FE8D40BE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oWrTndmkxLhp; Thu, 22 Sep 2022 12:33:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8A1140B83;
	Thu, 22 Sep 2022 12:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8A1140B83
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B010A1BF2CE
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 12:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98A93812E6
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 12:33:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98A93812E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pDDspF8Y5ECu for <buildroot@lists.busybox.net>;
 Thu, 22 Sep 2022 12:33:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2463E812C0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2463E812C0
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 12:33:37 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C91D9FF812;
 Thu, 22 Sep 2022 12:33:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1obLOX-002rh0-I9; Thu, 22 Sep 2022 14:33:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220917124845.2A95484258@busybox.osuosl.org>
Date: Thu, 22 Sep 2022 14:33:33 +0200
In-Reply-To: <20220917124845.2A95484258@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 17 Sep 2022 14:45:47 +0200")
Message-ID: <87edw3d1wi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit]
 support/config-fragments/autobuild/bootlin-armv7m-uclibc.config: specify
 configuration more precisely
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=43fc826d82acc089991d561ebca37feaf1aa421d
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Due to a bug in the CodeSourcery ARM toolchain packaging, this
 > toolchain currently appears as available even for noMMU
 > configurations, which is obviously wrong. Due to this, the
 > bootlin-armv7m-uclibc.config fragment ends up using the CodeSourcery
 > ARM toolchain, which is obviously wrong for an ARM noMMU
 > configuration, causing a build failure when matching the toolchain
 > capabilities with the configuration.

 > Even though we will separately fix the CodeSourcery ARM toolchain
 > packaging, it makes sense to ensure that the
 > bootlin-armv7m-uclibc.config fragment explicitly selects the Bootlin
 > toolchain.

 > Reported-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2022.02.x, 2022.05.x and 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
