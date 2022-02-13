Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCBDC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 16:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA874403CF;
	Sun, 13 Feb 2022 16:59:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ex3977oB1VB4; Sun, 13 Feb 2022 16:59:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC826403B3;
	Sun, 13 Feb 2022 16:59:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C1A21BF20B
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 16:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1874760B56
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 16:59:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0up_3f2P06Zg for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 16:59:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B72AE60B50
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 16:59:15 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F38B4FF805;
 Sun, 13 Feb 2022 16:59:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nJIDN-0003hZ-4u; Sun, 13 Feb 2022 17:59:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220205201837.3324085-1-james.hilliard1@gmail.com>
 <20220205201837.3324085-3-james.hilliard1@gmail.com>
 <20220213150051.GB4462@scaer>
Date: Sun, 13 Feb 2022 17:59:09 +0100
In-Reply-To: <20220213150051.GB4462@scaer> (Yann E. MORIN's message of "Sun,
 13 Feb 2022 16:00:51 +0100")
Message-ID: <87iltiln36.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v6 3/8] package/icu: don't disable renaming
 for host build
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Gilles Talis <gilles.talis@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Martin Bark <martin@barkynet.com>,
 =?utf-8?Q?Ga=C3=ABl?= Portay <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > James, All,
 > On 2022-02-05 13:18 -0700, James Hilliard spake thusly:
 >> Using a different renaming option for the icu host build can cause
 >> issues for packages such as qt5webengine which expect target and
 >> host packages to be built with the same options.

 > This little hand-waving is not explaning the actual error that those
 > packages encounter, nor the root cause for that error.

 > A package that needs both host and target to have the same options is
 > most probably doing somethig wrong, like linking a host program and
 > taking the result as valid for the target...

 > However, our adding the --disable-renaming in the first place in
 > 3911e67151b (icu: security bump to version 51.2) did not provide any
 > explanations why it was needed to begin with.

 > So it is not much uglier to remove it without further explanations
 > either.

 > Yet, a reference to the original commit would be nice, like the little
 > blurb I wrote above maybe...

Committed with the commit message extended, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
