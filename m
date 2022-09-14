Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910EAC6FA82
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 22:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 365918246F;
	Wed, 14 Sep 2022 22:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 365918246F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4G7J-cxf4SHg; Wed, 14 Sep 2022 22:36:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BA37823CF;
	Wed, 14 Sep 2022 22:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BA37823CF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C870E1BF38C
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A412740124
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A412740124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fCKQg1iblrs5 for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 22:36:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8AD4400C5
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8AD4400C5
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 22:36:13 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C181D20007;
 Wed, 14 Sep 2022 22:36:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oYazK-007sM8-Uj; Thu, 15 Sep 2022 00:36:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Titouan Christophe <titouanchristophe@gmail.com>
References: <20220811185448.1122716-1-titouanchristophe@gmail.com>
Date: Thu, 15 Sep 2022 00:36:10 +0200
In-Reply-To: <20220811185448.1122716-1-titouanchristophe@gmail.com> (Titouan
 Christophe's message of "Thu, 11 Aug 2022 20:54:48 +0200")
Message-ID: <87pmfxmvmt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/redis: security bump to v7.0.4
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
Cc: Daniel Price <daniel.price@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Titouan" == Titouan Christophe <titouanchristophe@gmail.com> writes:

 > From the release notes:
 > ================================================================================
 > Redis 7.0.4 Released Monday Jul 18 12:00:00 IST 2022
 > ================================================================================

 > Upgrade urgency: SECURITY, contains fixes to security issues.

 > Security Fixes:
 > * (CVE-2022-31144) A specially crafted XAUTOCLAIM command on a stream
 >   key in a specific state may result with heap overflow, and potentially
 >   remote code execution. The problem affects Redis versions 7.0.0 or newer.

 > Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>

Committed to 2022.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
