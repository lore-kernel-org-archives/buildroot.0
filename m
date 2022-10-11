Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472F0C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Oct 2022 19:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0E5940C03;
	Tue, 11 Oct 2022 19:23:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0E5940C03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KgMg0L4Ie61c; Tue, 11 Oct 2022 19:23:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09A3D40BFD;
	Tue, 11 Oct 2022 19:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09A3D40BFD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 544E61BF855
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 19:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AC2641911
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 19:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AC2641911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m__jSX7DmD_E for <buildroot@lists.busybox.net>;
 Tue, 11 Oct 2022 19:23:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9C85417BD
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9C85417BD
 for <buildroot@buildroot.org>; Tue, 11 Oct 2022 19:23:11 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 42713FF809;
 Tue, 11 Oct 2022 19:23:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oiKqJ-00CAxX-8h; Tue, 11 Oct 2022 21:23:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220926101724.1989377-1-titouanchristophe@gmail.com>
 <20220926140252.2f775240@windsurf>
Date: Tue, 11 Oct 2022 21:23:07 +0200
In-Reply-To: <20220926140252.2f775240@windsurf> (Thomas Petazzoni's message of
 "Mon, 26 Sep 2022 14:02:52 +0200")
Message-ID: <87y1tmnp0k.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/redis: security bump to v7.0.5
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Daniel Price <daniel.price@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Mon, 26 Sep 2022 12:17:24 +0200
 > Titouan Christophe <titouanchristophe@gmail.com> wrote:

 >> From the release notes:
 >> (https://github.com/redis/redis/blob/7.0.5/00-RELEASENOTES)
 >> 
 >> ================================================================================
 >> Redis 7.0.5 Released Wed Sep 21 20:00:00 IST 2022
 >> ================================================================================
 >> 
 >> Upgrade urgency: SECURITY, contains fixes to security issues.
 >> 
 >> Security Fixes:
 >> * (CVE-2022-35951) Executing a XAUTOCLAIM command on a stream key in a specific
 >> state, with a specially crafted COUNT argument, may cause an integer overflow,
 >> a subsequent heap overflow, and potentially lead to remote code execution.
 >> The problem affects Redis versions 7.0.0 or newer
 >> [reported by Xion (SeungHyun Lee) of KAIST GoN].
 >> 
 >> Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
 >> ---
 >> package/redis/redis.hash | 2 +-
 >> package/redis/redis.mk   | 2 +-
 >> 2 files changed, 2 insertions(+), 2 deletions(-)

 > Applied to master, thanks.

Committed to 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
