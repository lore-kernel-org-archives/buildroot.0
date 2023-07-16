Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD4CEB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 06:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E44AF409DF;
	Sun, 16 Jul 2023 06:09:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E44AF409DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LmnP1lCmiiSI; Sun, 16 Jul 2023 06:09:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C88EC409AD;
	Sun, 16 Jul 2023 06:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C88EC409AD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CDBF11BF322
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A759340576
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A759340576
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UHgbKUFOloyd for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 06:09:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 910A940354
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 910A940354
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 06:09:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90D3E1BF206;
 Sun, 16 Jul 2023 06:09:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qKuwt-008mUN-Fp; Sun, 16 Jul 2023 08:09:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20230625175706.319901-1-bernd@kuhls.net>
 <20230625175706.319901-2-bernd@kuhls.net>
Date: Sun, 16 Jul 2023 08:09:39 +0200
In-Reply-To: <20230625175706.319901-2-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 25 Jun 2023 19:57:06 +0200")
Message-ID: <874jm4e6ak.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package/quickjs: disable on sh*
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > quickjs unconditionally uses FE_{DOWN,UP}WARD and so fails to build on
 > sh* since its addition in commit
 > 5d50793659acb95050c110d5fc05399df20ce30b

 > Fixes:
 > sh4:    http://autobuild.buildroot.net/results/46d/46d7da58a857939ee3a33f60ab64ad278157c3bd/
 > sh4a:   http://autobuild.buildroot.net/results/b1d/b1db05e79e5505c6606524e54e159224b633eac2/
 > sh4aeb: http://autobuild.buildroot.net/results/c30/c307a1b67142405f81c9276056b28bea366f2ccf/
 > sh4eb:  http://autobuild.buildroot.net/results/945/945b508385ba5aa25f982f8a8493628fa828e472/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
