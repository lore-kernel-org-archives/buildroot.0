Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B57ECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 20:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB0BF40C8C;
	Wed, 14 Sep 2022 20:13:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB0BF40C8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jzl_mcG3f8cZ; Wed, 14 Sep 2022 20:13:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 004B2403E2;
	Wed, 14 Sep 2022 20:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 004B2403E2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B9ED1BF28A
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 20:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E717541716
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 20:13:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E717541716
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FRdHMY5FV_Um for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 20:13:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EB2F410E6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4EB2F410E6
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 20:13:46 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 09D40E0007;
 Wed, 14 Sep 2022 20:13:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oYYlR-0069KN-Lz; Wed, 14 Sep 2022 22:13:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220804054736.3221427-1-christian@paral.in>
 <20220806232557.547ee1c8@windsurf>
Date: Wed, 14 Sep 2022 22:13:41 +0200
In-Reply-To: <20220806232557.547ee1c8@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sat, 6 Aug 2022 23:25:57 +0200")
Message-ID: <87pmfxpvd6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: security bump to
 1.6.6
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Wed,  3 Aug 2022 22:47:36 -0700
 > Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

 >> v1.6.2 -> v1.6.6:
 >> 
 >> The third patch release for containerd 1.6 includes various fixes and updates.
 >> 
 >> https://github.com/containerd/containerd/releases/tag/v1.6.3
 >> 
 >> The fourth patch release for containerd 1.6 includes two fixes for CNI and SELinux.
 >> 
 >> https://github.com/containerd/containerd/releases/tag/v1.6.4
 >> 
 >> The fifth patch release for containerd 1.6 includes a few fixes.
 >> 
 >> https://github.com/containerd/containerd/releases/tag/v1.6.5
 >> 
 >> The sixth patch release for containerd 1.6 includes a fix for
 >> CVE-2022-31030.
 >> 
 >> https://github.com/containerd/containerd/releases/tag/v1.6.6
 >> 
 >> Signed-off-by: Christian Stewart <christian@paral.in>
 >> ---
 >> package/containerd/containerd.hash | 2 +-
 >> package/containerd/containerd.mk   | 2 +-
 >> 2 files changed, 2 insertions(+), 2 deletions(-)

Committed to 2022.05.x, thanks.

For 2022.02.x I will instead update to 1.5.13, which contains the same
fix.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
