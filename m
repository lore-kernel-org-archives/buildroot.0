Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8251C636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 10:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FF9160737;
	Sun,  5 Feb 2023 10:53:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FF9160737
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sKcVr_DG3Kjd; Sun,  5 Feb 2023 10:53:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B866460709;
	Sun,  5 Feb 2023 10:53:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B866460709
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 208C81BF3BE
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 10:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06EF981E8A
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 10:53:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06EF981E8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2xjhszGhor4g for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 10:53:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0895D81E87
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0895D81E87
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 10:53:39 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4D2DEE0008;
 Sun,  5 Feb 2023 10:53:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pOceP-00DWLE-HY; Sun, 05 Feb 2023 11:53:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230205081617.113018-1-bernd.kuhls@t-online.de>
 <20230205081617.113018-3-bernd.kuhls@t-online.de>
 <d57c991e-a8f5-bad2-e25f-7bfa03fa610d@korsgaard.com>
 <20230205101557.GA2960@scaer>
Date: Sun, 05 Feb 2023 11:53:37 +0100
In-Reply-To: <20230205101557.GA2960@scaer> (Yann E. MORIN's message of "Sun, 5
 Feb 2023 11:15:57 +0100")
Message-ID: <87fsbkxu1a.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/freeswitch: security bump
 version to 1.10.9
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

 > Peter, All,
 > On 2023-02-05 10:01 +0100, Peter Korsgaard spake thusly:
 >> On 05/02/2023 09.16, Bernd Kuhls wrote:
 >> >Release notes:
 >> >https://github.com/signalwire/freeswitch/releases/tag/v1.10.9
 >> >
 >> >Upstream removed zrtp support:
 >> >https://github.com/signalwire/freeswitch/pull/1848
 >> >
 >> >Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 >> 
 >> Fixed the checkpatch warning and applied, thanks;

 > You only applied this patch 3/3, but patches 1/3 and 2/3 (likbks and
 > sofia-sip bumps) are marked as being needed first. So I've applied them
 > now.

Ups, thanks for fixing it!

 > Bernd, it would have been nice that the patch bumping freeswitch would
 > mention that it has a dependency on newer libks and sofia-sip versions.
 > Indeed, if the freeswitch bump is backported to a maintenance branch,
 > them the two other bumps will have to be backported too, and if that is
 > not mentioned in the commit log, that will not be obvious to notice.

Yes please!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
