Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8102C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 11:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BA7683032;
	Thu, 11 Aug 2022 11:39:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BA7683032
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 02vuZtJ4ENeJ; Thu, 11 Aug 2022 11:39:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9CC78301D;
	Thu, 11 Aug 2022 11:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9CC78301D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B684F1BF38C
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F5194032A
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F5194032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1wQl60pgWGy9 for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 11:39:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B5AB4023B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B5AB4023B
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 11:39:38 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DE20920003;
 Thu, 11 Aug 2022 11:39:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oM6XG-002qk0-0v; Thu, 11 Aug 2022 13:39:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach via buildroot <buildroot@buildroot.org>
References: <4a323dc9772af9a5b5295ae2d1a65f0d314765d3.1658478797.git.baruch@tkos.co.il>
Date: Thu, 11 Aug 2022 13:39:33 +0200
In-Reply-To: <4a323dc9772af9a5b5295ae2d1a65f0d314765d3.1658478797.git.baruch@tkos.co.il>
 (Baruch Siach via buildroot's message of "Fri, 22 Jul 2022 11:33:17
 +0300")
Message-ID: <87bksrm2kq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libcurl: fix dependency symbol typo
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
Cc: buildroot@busybox.net, "Yann E .
 MORIN" <yann.morin.1998@free.fr>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Baruch" == Baruch Siach via buildroot <buildroot@buildroot.org> writes:

 > Commit 6d07e2618c0 ("package/uacme: requires TLS support in libcurl")
 > mistyped the BR2_PACKAGE_LIBCURL_FORCE_TLS dependency making the fix
 > ineffective.

 > Fixes:
 > http://autobuild.buildroot.net/results/56ea6cb146df63d1575da9dae3035b3220de875f/
 > http://autobuild.buildroot.net/results/280b0ed7f9cdb424917373f98c3e4e6b593c6d21/

 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Matt Weber <matthew.weber@collins.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
