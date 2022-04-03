Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE43AC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 09:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2AC260C21;
	Sun,  3 Apr 2022 09:44:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G1AHIN-og57C; Sun,  3 Apr 2022 09:44:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8C2760C04;
	Sun,  3 Apr 2022 09:44:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF4F71BF599
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 09:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEF92825E8
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 09:44:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m8KWqD2Vl66q for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 09:44:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8EB9982668
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 09:44:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 54E2B60002;
 Sun,  3 Apr 2022 09:44:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nawms-004iYq-At; Sun, 03 Apr 2022 11:44:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20220331201718.728570-1-romain.naour@gmail.com>
Date: Sun, 03 Apr 2022 11:44:46 +0200
In-Reply-To: <20220331201718.728570-1-romain.naour@gmail.com> (Romain Naour's
 message of "Thu, 31 Mar 2022 22:17:18 +0200")
Message-ID: <87pmly1oxd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/python-{treq,
 twisted}: add a comment to use the same version
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > As reported by [1], python-twisted and python-treq must use the same
 > version because its the same project:

 > https://github.com/twisted/twisted
 > https://github.com/twisted/treq

 > We have to update python-treq to version 22.2.0 [2] otherwise we have
 > a runtime issue:

 > Traceback (most recent call last):
 >   File "/root/sample_python_treq.py", line 2, in <module>
 >     import treq
 >   File "/usr/lib/python3.10/site-packages/treq/__init__.py", line 5, in <module>
 >   File "/usr/lib/python3.10/site-packages/treq/api.py", line 5, in <module>
 >   File "/usr/lib/python3.10/site-packages/treq/client.py", line 11, in <module>
 > ImportError: cannot import name '_PY3' from 'twisted.python.compat' (unknown
 > location)

 > The comment should avoid forgeting one of them while upgrading or
 > backporting version bump.

 > [1] http://lists.busybox.net/pipermail/buildroot/2022-February/637505.html
 > [2] https://github.com/twisted/treq/releases/tag/release-22.2.0
 > [3] https://gitlab.com/buildroot.org/buildroot/-/jobs/2179206653

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
