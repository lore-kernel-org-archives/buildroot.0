Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA9AC433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 17:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FA1E4039D;
	Sat, 22 Jan 2022 17:32:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VH52w-3GIjq4; Sat, 22 Jan 2022 17:32:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30C59401A3;
	Sat, 22 Jan 2022 17:32:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CC5B1BF3C1
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 17:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 973424003C
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 17:32:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 01_WNz2ql5LN for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 17:32:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31DC740996
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 17:32:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id F21DE200006;
 Sat, 22 Jan 2022 17:32:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nBKFp-0001xi-0a; Sat, 22 Jan 2022 18:32:45 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211216184943.580682-1-fontaine.fabrice@gmail.com>
Date: Sat, 22 Jan 2022 18:32:45 +0100
In-Reply-To: <20211216184943.580682-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 16 Dec 2021 19:49:43 +0100")
Message-ID: <877darzneq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libqmi: fix build with help2man
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure raised with help2man since bump to
 > version 1.30.0 in commit 50c5495f81d3418a0f63fc642dc6beb41cd316e0:

 > FAILED: docs/man/qmicli.1
 > /usr/bin/help2man --output=docs/man/qmicli.1 '--name=Control QMI
 > devices' '--help-option="--help-all"'
 > /home/peko/autobuild/instance-1/output-1/build/libqmi-1.30.2/build/src/qmicli/qmicli
 > help2man: can't get `"--help-all"' info from
 > /home/peko/autobuild/instance-1/output-1/build/libqmi-1.30.2/build/src/qmicli/qmicli
 > Try `--no-discard-stderr' if option outputs to stderr

 > Fixes:
 >  - http://autobuild.buildroot.org/results/15818b6de7378cd75c59b1d6dc732ed9a20c092a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
