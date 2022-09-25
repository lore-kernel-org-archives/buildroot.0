Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905F5C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 21:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08BB4416EE;
	Sun, 25 Sep 2022 21:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08BB4416EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HFlyUeXr-dgL; Sun, 25 Sep 2022 21:11:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10F25416E9;
	Sun, 25 Sep 2022 21:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10F25416E9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 629B01BF2B7
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 21:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C8D2416E9
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 21:11:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C8D2416E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L7hC7U0yvImv for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 21:11:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A00BC416E7
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A00BC416E7
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 21:11:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 630E6E0005;
 Sun, 25 Sep 2022 21:11:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ocYuf-005K69-98; Sun, 25 Sep 2022 23:11:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220915183359.481550-1-christian@paral.in>
 <20220917175339.31113c9e@windsurf>
Date: Sun, 25 Sep 2022 23:11:45 +0200
In-Reply-To: <20220917175339.31113c9e@windsurf> (Thomas Petazzoni's message of
 "Sat, 17 Sep 2022 17:53:39 +0200")
Message-ID: <874jwvb1m6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/docker-engine: bump to version
 20.10.18
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Thu, 15 Sep 2022 11:33:58 -0700
 > Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

 >> https://github.com/moby/moby/releases/tag/v20.10.18
 >> 
 >> Signed-off-by: Christian Stewart <christian@paral.in>
 >> ---
 >> package/docker-engine/docker-engine.hash | 2 +-
 >> package/docker-engine/docker-engine.mk   | 2 +-
 >> 2 files changed, 2 insertions(+), 2 deletions(-)

 > Both applied to master, thanks!

This fixes CVE-2022-36109, so this should have been marked as a security
bump:
https://github.com/moby/moby/security/advisories/GHSA-rc4r-wh2q-q6c4

Committed (both patches) to 2022.02.x, 2022.05.x and 2022.08.x after
fixing that, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
