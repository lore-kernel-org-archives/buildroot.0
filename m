Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F13C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 12:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D026341745;
	Thu, 17 Mar 2022 12:18:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z3vis8M7rKPw; Thu, 17 Mar 2022 12:18:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0916640319;
	Thu, 17 Mar 2022 12:18:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 944831BF36E
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 12:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 826EE60F7B
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 12:18:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mJjfaYfFkDxK for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 12:18:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 205FA60E27
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 12:18:45 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8DB8DC0005;
 Thu, 17 Mar 2022 12:18:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nUp5V-00CxFU-Nh; Thu, 17 Mar 2022 13:18:41 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: John Keeping <john@metanate.com>
References: <20220219154350.1552021-1-john@metanate.com>
Date: Thu, 17 Mar 2022 13:18:41 +0100
In-Reply-To: <20220219154350.1552021-1-john@metanate.com> (John Keeping's
 message of "Sat, 19 Feb 2022 15:43:50 +0000")
Message-ID: <87ee30srfi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/gdb: fix when gmp is installed on
 the host machine
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

>>>>> "John" == John Keeping <john@metanate.com> writes:

 > gdb's AC_LIB_HAVE_LINKFLAGS macro hardcodes a search starting with
 > /usr/lib/ which can lead to libgmp from the wrong architecture with the
 > result that the test fails.  Even if a libgmp is found there it is now
 > the one that should be used.

 > This is the same macro used for expat and lzma for which there are
 > already specific CONF_OPTS flags added here.  Add the same flag for
 > libgmp and move the handling down so that it is logically grouped with
 > the other similar options.

 > Note that there is no --with(out)-gmp flag to configure, as the
 > dependency is mandatory, so only the --with-libgmp-prefix option is
 > specified.

 > Signed-off-by: John Keeping <john@metanate.com>

Committed to 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
