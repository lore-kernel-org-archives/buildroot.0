Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FBCCDB46E
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 16:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D999182139;
	Thu, 12 Oct 2023 16:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D999182139
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HgYx62K8lHwP; Thu, 12 Oct 2023 16:33:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 331BB821B1;
	Thu, 12 Oct 2023 16:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 331BB821B1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7500D1BF2F8
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 16:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E6F6821B1
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 16:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E6F6821B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f9pkWOxPK4xD for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 16:33:38 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1836582139
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 16:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1836582139
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1BB0F1C0002;
 Thu, 12 Oct 2023 16:33:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qqycr-003g3i-QI; Thu, 12 Oct 2023 18:33:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <ZNWRcJrlXwFFkUtG@waldemar-brodkorb.de>
 <20230930112539.5dc62e1d@windsurf>
Date: Thu, 12 Oct 2023 18:33:29 +0200
In-Reply-To: <20230930112539.5dc62e1d@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sat, 30 Sep 2023 11:25:39 +0200")
Message-ID: <87y1g794x2.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/batman-adv: update to 2023.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Fri, 11 Aug 2023 03:40:00 +0200
 > Waldemar Brodkorb <wbx@openadk.org> wrote:

 >> Older Batman-adv versions fail to build with kernel 6.4.x
 >> with following error message:
 >> bat_iv_ogm.c:283:18: error: implicit declaration of function 'prandom_u32_max'; did you mean 'prandom_u32_state'? [-Werror=implicit-function-declaration]
 >> 
 >> prandom_u32_max got removed in commit 3c202d14a9d73fb63c3dccb18feac5618c21e1c4
 >> from the Linux kernel.
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.net/results/205/2055ac3805d1941c148f1681a224570055dd83cd
 >> 
 >> For other changes in this release, see:
 >> https://www.open-mesh.org/news/112
 >> 
 >> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 >> ---
 >> v1 -> v2:
 >> - move locally computed sha256 hash to the right place, mentioned
 >> by Thomas Petazzoni
 >> ---
 >> package/batman-adv/batman-adv.hash | 7 ++++---
 >> package/batman-adv/batman-adv.mk   | 2 +-
 >> 2 files changed, 5 insertions(+), 4 deletions(-)

 > Applied to master, thanks.

Committed to 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
