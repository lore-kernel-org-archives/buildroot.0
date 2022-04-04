Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A599C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 12:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 071EE606E6;
	Mon,  4 Apr 2022 12:48:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aRpSpimjjcgc; Mon,  4 Apr 2022 12:48:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15E2060615;
	Mon,  4 Apr 2022 12:48:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0DB711BF3D1
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF2DC4032E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:48:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SbJUuDb8TKYU for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 12:48:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B28040320
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 12:48:23 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7215420011;
 Mon,  4 Apr 2022 12:48:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nbM84-005t0l-Hp; Mon, 04 Apr 2022 14:48:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20220331201718.728570-1-romain.naour@gmail.com>
Date: Mon, 04 Apr 2022 14:48:20 +0200
In-Reply-To: <20220331201718.728570-1-romain.naour@gmail.com> (Romain Naour's
 message of "Thu, 31 Mar 2022 22:17:18 +0200")
Message-ID: <87ee2dypyj.fsf@dell.be.48ers.dk>
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

Committed to 2021.02.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
