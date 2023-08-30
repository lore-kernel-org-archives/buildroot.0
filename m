Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B295C83F14
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 22:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCD6E41830;
	Wed, 30 Aug 2023 22:28:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCD6E41830
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b_g5lDM41RtT; Wed, 30 Aug 2023 22:28:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27A6541813;
	Wed, 30 Aug 2023 22:28:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27A6541813
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 061E21BF424
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1C4C41765
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1C4C41765
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h404mEA29YKq for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 22:28:40 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B486B41701
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 22:28:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B486B41701
Received: by mail.gandi.net (Postfix) with ESMTPSA id 142CCE0002;
 Wed, 30 Aug 2023 22:28:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qbTfx-000JWg-8V; Thu, 31 Aug 2023 00:28:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230730221257.C357683D5C@busybox.osuosl.org>
Date: Thu, 31 Aug 2023 00:28:37 +0200
In-Reply-To: <20230730221257.C357683D5C@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Mon, 31 Jul 2023 00:12:26 +0200")
Message-ID: <874jkgnp0q.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [git commit] package/cmocka: fix build on Thumb
 classic configurations
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=5622c76bf42fd29f8dfc231d0fccb623960b3542
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The cmocka package checks if a toolchain supports the
 > -fstack-clash-protection compiler flag, and if it does automatically
 > uses it. That flag is not supported by GCC for Thumb1 builds (at least
 > as of both GCC 11 and GCC 12). Let's tell cmocka about this by passing
 > -DWITH_STACK_CLASH_PROTECTION=OFF in this configuration, as suggested
 > by Arnout Vandecappelle.

 > Fixes:
 > http://autobuild.buildroot.net/results/4044b3a71d3130d934c7a7c0c5badfabb2a97030/

 > Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
 > [Thomas: change the initial patch from Joel to use the suggestion from
 > Arnout]
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
