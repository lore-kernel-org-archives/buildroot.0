Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC84CEB64D9
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 11:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4943D4195F;
	Wed, 14 Jun 2023 11:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4943D4195F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RkDirjt8UYuB; Wed, 14 Jun 2023 11:51:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3482B41BF4;
	Wed, 14 Jun 2023 11:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3482B41BF4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0EC4A1BF2CA
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 11:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB5EA831CA
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 11:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB5EA831CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q7LGdORlGvy4 for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 11:51:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB0F18204D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB0F18204D
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 11:51:13 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1FF53240007;
 Wed, 14 Jun 2023 11:51:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q9P1r-005qLi-Er; Wed, 14 Jun 2023 13:51:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
References: <20230524131642.88902-1-romain.naour@smile.fr>
Date: Wed, 14 Jun 2023 13:51:11 +0200
In-Reply-To: <20230524131642.88902-1-romain.naour@smile.fr> (Romain Naour's
 message of "Wed, 24 May 2023 15:16:42 +0200")
Message-ID: <87a5x2qn2o.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] support/testing: test_clang: update to the
 next LTS kernel (4.19.x)
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

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > The kernel 4.16.7 curently used by the test doesn't build with host
 > bison (GNU Bison 3.7.5) probably due a missing fix [1] in 4.16.x branch.

 > Since kernel 4.16 is EOL, bump to the next LTS kernel (4.19.x) in order
 > to ease backport to previous Buildroot releases.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/4114986744

 > [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=d59fbbd09d5d6bdf4ea1f0b4090d175e081ff421

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
