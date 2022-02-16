Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B8BC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 20:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21DFB41776;
	Wed, 16 Feb 2022 20:45:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6zJZilZJ4r2e; Wed, 16 Feb 2022 20:45:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 570A34176F;
	Wed, 16 Feb 2022 20:45:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C24561BF425
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 20:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE42F60B4B
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 20:45:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5_QUDDoyP7WQ for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 20:45:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7737D60ACC
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 20:45:25 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9EEB1C0003
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 20:45:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1nKRAw-0005S0-0W
 for buildroot@buildroot.org; Wed, 16 Feb 2022 21:45:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20220205124414.D529182293@busybox.osuosl.org>
Date: Wed, 16 Feb 2022 21:45:21 +0100
In-Reply-To: <20220205124414.D529182293@busybox.osuosl.org> (Peter Korsgaard's
 message of "Sat, 5 Feb 2022 13:51:09 +0100")
Message-ID: <87pmnmh76m.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/{glibc,
 localedef}: security bump for additional post-2.34.x fixes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=1983d2e6a30fb6ca1d81f47798467bb0ac4401e6
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fixes the following security issues:

 >   CVE-2022-23219: Passing an overlong file name to the clnt_create
 >   legacy function could result in a stack-based buffer overflow when
 >   using the "unix" protocol.  Reported by Martin Sebor.

 >   CVE-2022-23218: Passing an overlong file name to the svcunix_create
 >   legacy function could result in a stack-based buffer overflow.

 >   CVE-2021-3998: Passing a path longer than PATH_MAX to the realpath
 >   function could result in a memory leak and potential access of
 >   uninitialized memory.  Reported by Qualys.

 >   CVE-2021-3999: Passing a buffer of size exactly 1 byte to the getcwd
 >   function may result in an off-by-one buffer underflow and overflow
 >   when the current working directory is longer than PATH_MAX and also
 >   corresponds to the / directory through an unprivileged mount
 >   namespace.  Reported by Qualys.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > Reviewed-by: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
