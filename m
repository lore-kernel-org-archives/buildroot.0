Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95883C433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 10:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42B8B405A8;
	Tue, 22 Feb 2022 10:10:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E5roCPt--kQc; Tue, 22 Feb 2022 10:10:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B98440155;
	Tue, 22 Feb 2022 10:10:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F45A1BF280
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F19A560AB5
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AlScl5b4_ZCM for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 10:10:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26B83608D8
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 10:10:20 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5D9ED2000F;
 Tue, 22 Feb 2022 10:10:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nMS7c-005zoL-EN; Tue, 22 Feb 2022 11:10:16 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20220221215702.8461-1-romain.naour@gmail.com>
Date: Tue, 22 Feb 2022 11:10:16 +0100
In-Reply-To: <20220221215702.8461-1-romain.naour@gmail.com> (Romain Naour's
 message of "Mon, 21 Feb 2022 22:57:02 +0100")
Message-ID: <87y2236wl3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/python-twisted: add missing python
 typing extensions runtime dependency
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

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 >  # python sample_python_txtorcon.py
 >  Traceback (most recent call last):
 >    File "/root/sample_python_txtorcon.py", line 1, in <module>
 >      import txtorcon  # noqa
 >    File "/usr/lib/python3.10/site-packages/txtorcon/__init__.py", line 11, in <module>
 >    File "/usr/lib/python3.10/site-packages/txtorcon/router.py", line 10, in <module>
 >    File "/usr/lib/python3.10/site-packages/txtorcon/util.py", line 17, in <module>
 >    File "/usr/lib/python3.10/site-packages/twisted/internet/defer.py", line 42, in <module>
 >  ModuleNotFoundError: No module named 'typing_extensions'

 > python typing_extensions is required since python-twisted 22.1.0 [1]

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/2116202537

 > [1] https://github.com/twisted/twisted/commit/6e768da0a10c8ab42a57a1c0fa505ebe2d8bfb30

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
