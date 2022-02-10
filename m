Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A714EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 21:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B20881388;
	Thu, 10 Feb 2022 21:18:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R6jxMB_AYIW7; Thu, 10 Feb 2022 21:18:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ADDC812FE;
	Thu, 10 Feb 2022 21:18:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 308DC1BF2EC
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BD82408E0
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:18:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bADvbgr9c4co for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 21:18:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0EEEF408DA
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 21:18:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D7781C0006;
 Thu, 10 Feb 2022 21:18:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nIGpw-0007pU-Kp; Thu, 10 Feb 2022 22:18:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220209165213.4498-1-peter@korsgaard.com>
 <20220209213312.GE2249818@scaer>
 <2cba2cd6-ca70-6336-f2fe-60649a0f1a0d@mind.be>
 <20220210203719.GA3752867@scaer>
Date: Thu, 10 Feb 2022 22:18:44 +0100
In-Reply-To: <20220210203719.GA3752867@scaer> (Yann E. MORIN's message of
 "Thu, 10 Feb 2022 21:37:19 +0100")
Message-ID: <87czjuwhcb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 000/107] Drop python 2.7
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > Arnout, All,
 > On 2022-02-10 18:15 +0100, Arnout Vandecappelle spake thusly:
 >> On 09/02/2022 22:33, Yann E. MORIN wrote:
 >> >On 2022-02-09 17:50 +0100, Peter Korsgaard spake thusly:
 >> >>Python 2.7 is EOL since April 2020 and almost all packages support
 >> >>python 3, so drop it before the 2022.02 release.
 > [--SNIP--]
 >> I did a bit of grepping for leftovers and found these:
 > [--SNIP--]

 > Yeah, I knew we had missed a few things, and Peter had already noticed a
 > few in the cover-letter, but we needed to move forward quick, at the
 > risk of breaking things.

 > After all, the post-rc1 period is actually to fix things we broke! ;-)

Indeed ;)

 >> The ones in gst1-devtools.mk and omniorb.mk look important, the rest is just
 >> cleanup. qt5webengine is also a bit worrisome...

 > For qt5webengine, IIRC James and Adam were working on it, and may have a
 > pending change ready?

 > I was thinking maybe about this:
 >     https://patchwork.ozlabs.org/project/buildroot/list/?series=284619

Yes, I guess we'll need something like that. I did a quick test to see
if the current qt5webengine version works with python3 - But it doesn't
:/

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
