Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A633ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 07:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5B2D40275;
	Mon, 12 Sep 2022 07:28:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5B2D40275
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sNg_lhGymwBT; Mon, 12 Sep 2022 07:28:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF00D401D2;
	Mon, 12 Sep 2022 07:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF00D401D2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE1881BF2B4
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 07:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6A4981DCB
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 07:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6A4981DCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IESOJ-39mjX7 for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 07:28:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B06281DAB
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B06281DAB
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 07:28:39 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B71E8FF805;
 Mon, 12 Sep 2022 07:28:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oXdrt-002VrU-GK; Mon, 12 Sep 2022 09:28:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
References: <32299_1662967467_631EDEAB_32299_495_1_0abc443c757568e6a02f5bc2bba7d9a71a81c0ce.1662967465.git.yann.morin@orange.com>
Date: Mon, 12 Sep 2022 09:28:33 +0200
In-Reply-To: <32299_1662967467_631EDEAB_32299_495_1_0abc443c757568e6a02f5bc2bba7d9a71a81c0ce.1662967465.git.yann.morin@orange.com>
 (yann morin's message of "Mon, 12 Sep 2022 09:24:25 +0200")
Message-ID: <87bkrlvyou.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/python-paho-mqtt: fix merge from
 next
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
Cc: Marcus Hoffmann <marcus.hoffmann@othermo.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>>   <yann.morin@orange.com> writes:

 > From: "Yann E. MORIN" <yann.morin@orange.com>
 > In master, we backported a patch from upstream, to fix running on python
 > 3.10. But at the same time, on next, we bumped the version, where that
 > change was present.

 > Now, next has been merged back into master, and the patch obviously does
 > not apply anymore.

 > Remove the patch, it is no longer needed.

 > Fixes:
 >     http://autobuild.buildroot.net/results/b76/b76b1ab80bdf1b7731731f2f561c5b64e9716513/
 >     http://autobuild.buildroot.net/results/f9e/f9e07621d345a9bca0be1b0a53bdb21e363d2e90/
 >     ...

 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
 > Cc: Marcus Hoffmann <marcus.hoffmann@othermo.de>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
