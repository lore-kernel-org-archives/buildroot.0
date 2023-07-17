Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F15EB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 12:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27951405A7;
	Mon, 17 Jul 2023 12:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27951405A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Fl7g15Mbz7P; Mon, 17 Jul 2023 12:06:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78FEC404B5;
	Mon, 17 Jul 2023 12:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78FEC404B5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4BD191BF34C
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 12:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2421440861
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 12:06:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2421440861
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xSIkQGgHgOtg for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 12:06:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5A5E4085B
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5A5E4085B
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 12:06:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 153AB240009;
 Mon, 17 Jul 2023 12:06:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qLMzY-00DNh3-9a; Mon, 17 Jul 2023 14:06:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20230704205218.46D2186623@busybox.osuosl.org>
Date: Mon, 17 Jul 2023 14:06:16 +0200
In-Reply-To: <20230704205218.46D2186623@busybox.osuosl.org> (Arnout
 Vandecappelle via buildroot's message of "Tue, 4 Jul 2023 22:44:08
 +0200")
Message-ID: <87mszuagjr.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [git commit] package/gnuradio: fix build with
 python-pybind > 2.10.0
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

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=11aa7ac8fa3a21dc2476dd09539ea3cf3e48f03d
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Since commit 0e82c360942907f5a2f379e64e0d211aaff80774 (and since release
 > 2.10.1), a new variable called PYBIND11_PYTHONLIBS_OVERWRITE was introduced
 > and set to ON by default.

 > According to comment before this option:
 > "Overwrite cached values read from Python library (classic search). Turn off if
 > cross-compiling and manually setting these values."

 > In buildroot's context this option must be disabled to keep variables
 > provided by buildroot and lib/app.

 > Fixes:
 > - http://autobuild.buildroot.net/results/7423df5db5237d94bb49e32698828d4fe470e39b/

 > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 > Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
