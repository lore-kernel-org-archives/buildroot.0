Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7299C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 22:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EE47847D8;
	Thu, 10 Mar 2022 22:32:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0hSiY8kDV5NE; Thu, 10 Mar 2022 22:32:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92109847D2;
	Thu, 10 Mar 2022 22:32:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A49451BF34D
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 22:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F51561281
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 22:31:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y022O-W2KA-n for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 22:31:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5826961287
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 22:31:36 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8FC2C200004;
 Thu, 10 Mar 2022 22:31:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nSRJl-004Fxg-NO; Thu, 10 Mar 2022 23:31:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20220221215702.8461-1-romain.naour@gmail.com>
Date: Thu, 10 Mar 2022 23:31:33 +0100
In-Reply-To: <20220221215702.8461-1-romain.naour@gmail.com> (Romain Naour's
 message of "Mon, 21 Feb 2022 22:57:02 +0100")
Message-ID: <871qz9zbga.fsf@dell.be.48ers.dk>
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

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
