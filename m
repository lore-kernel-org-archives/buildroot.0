Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315ABC19F2A
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 15:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D233240C53;
	Thu,  4 Aug 2022 15:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D233240C53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4FfaMR0HyTun; Thu,  4 Aug 2022 15:05:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 023E640C91;
	Thu,  4 Aug 2022 15:05:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 023E640C91
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5FF1E1BF317
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 15:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BAFC610CD
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 15:05:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BAFC610CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hvv9nqgYCefh for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 15:05:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59010610CC
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59010610CC
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 15:05:12 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B5F9260002;
 Thu,  4 Aug 2022 15:05:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oJcPN-0005Le-2R; Thu, 04 Aug 2022 17:05:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Kris Bahnsen via buildroot <buildroot@buildroot.org>
References: <20220715211041.7902-1-kris@embeddedTS.com>
Date: Thu, 04 Aug 2022 17:05:09 +0200
In-Reply-To: <20220715211041.7902-1-kris@embeddedTS.com> (Kris Bahnsen via
 buildroot's message of "Fri, 15 Jul 2022 14:10:41 -0700")
Message-ID: <874jysrqvu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wilc-driver: fix kconfig syntax
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mark Featherston <mark@embeddedTS.com>, Kris Bahnsen <kris@embeddedTS.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Kris" == Kris Bahnsen via buildroot <buildroot@buildroot.org> writes:

 > Sub-options SPI and SDIO weren't rendering as nested options for
 > wilc-driver, instead showing on the same indent level. Move the
 > comment and depends on to bottom of file to correct this.

 > Fixes: 1a47c42b33 ("package/wilc-driver: add missing BR2_LINUX_KERNEL dependency")
 > Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>

Committed to 2022.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
