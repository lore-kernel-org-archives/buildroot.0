Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FDFC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 15:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39AB44057F;
	Sun,  9 Jan 2022 15:40:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DpzER0bz7Tfc; Sun,  9 Jan 2022 15:40:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 536D740567;
	Sun,  9 Jan 2022 15:40:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 134511BF4D5
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1B7581B53
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:40:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bnnTkzOL_K7d for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 15:40:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF07A81B3E
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 15:40:17 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 5826D60003;
 Sun,  9 Jan 2022 15:40:14 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n6aIn-0001M3-NQ; Sun, 09 Jan 2022 16:40:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220109133939.496946-1-fontaine.fabrice@gmail.com>
Date: Sun, 09 Jan 2022 16:40:13 +0100
In-Reply-To: <20220109133939.496946-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 9 Jan 2022 14:39:39 +0100")
Message-ID: <874k6cc3z6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/hiawatha: disable system mbedtls
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > hiawatha needs mbedtls3 since bump to version 11.1 in commit
 > 24e4c888c3d36e3943206ea55894b84344cc8b2e:

 > /home/giuliobenetti/autobuild/run/instance-3/output-1/build/hiawatha-11.1/src/wigwam.c:39:10: fatal error: mbedtls/psa_util.h: No such file or directory
 >    39 | #include "mbedtls/psa_util.h"
 >       |          ^~~~~~~~~~~~~~~~~~~~

 > As mbedtls 3.x is not backward compatible with mbedtls 2.x, disable
 > system mbedtls to let hiawatha uses its own copy (which will be
 > installed in $(TARGET_DIR)/usr/lib/hiawatha)

 > Fixes:
 >  - http://autobuild.buildroot.org/results/064af90aa95c28781d96d7eca0f14841fce0687a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
