Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B759C001DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 14:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95A8F80E87;
	Mon, 17 Jul 2023 14:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95A8F80E87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yEpBvFKCJxdj; Mon, 17 Jul 2023 14:33:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3C9E80D96;
	Mon, 17 Jul 2023 14:33:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3C9E80D96
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B79911BF304
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 14:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DF5D60634
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 14:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DF5D60634
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9xJ6g6o6ycDr for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 14:33:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67429605B3
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67429605B3
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 14:33:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29EA7C0010;
 Mon, 17 Jul 2023 14:33:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qLPI6-00Ehbe-26; Mon, 17 Jul 2023 16:33:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20230709180249.3839609-1-bernd@kuhls.net>
Date: Mon, 17 Jul 2023 16:33:34 +0200
In-Reply-To: <20230709180249.3839609-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 9 Jul 2023 20:02:49 +0200")
Message-ID: <877cqy8v5t.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/dahdi-linux: fix build with
 kernel < 6.3
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Buildroot commit 840b5527466502f02b86c95f9bf95557d35c8571 added a patch
 > from upstream bug tracker which fixes build with kernel >= 6.3 but broke
 > the build with earlier kernels.

 > This patch adds additional code for compatibility with kernel < 6.3.

 > Fixes:
 > http://autobuild.buildroot.net/results/c8c/c8c51153d3a61842d57a2a4be3dc75ec9964e41c/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed to 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
