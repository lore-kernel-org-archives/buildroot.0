Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164DDC433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 21:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8DB660C08;
	Sat, 14 May 2022 21:00:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TuZj6IbVxys5; Sat, 14 May 2022 21:00:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E853660DB2;
	Sat, 14 May 2022 21:00:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 505D91BF681
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 21:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E5294109E
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 21:00:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kI5XffDel26J for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 21:00:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 229CE408E9
 for <buildroot@buildroot.org>; Sat, 14 May 2022 21:00:05 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D12F120000B;
 Sat, 14 May 2022 21:00:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1npyrq-00Cgpi-PJ; Sat, 14 May 2022 23:00:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220513213700.1177636-1-fontaine.fabrice@gmail.com>
Date: Sat, 14 May 2022 23:00:02 +0200
In-Reply-To: <20220513213700.1177636-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 13 May 2022 23:37:00 +0200")
Message-ID: <87wnen7ru5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libks: needs NPTL
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > libks needs NPTL since its addition in commit
 > 5752d18bfcdb060c9d3b8c13330344cbdee74b75:

 > /nvmedata/autobuild/instance-17/output-1/build/libks-1.8.0/src/ks_thread.c:
 > In function 'thread_launch':
 > /nvmedata/autobuild/instance-17/output-1/build/libks-1.8.0/src/ks_thread.c:237:21:
 > error: 'pthread_setname_np' undeclared (first use in this function);
 > did you mean 'pthread_setcanceltype'?
 >   237 |  if (thread->tag && pthread_setname_np)
 >       |                     ^~~~~~~~~~~~~~~~~~
 >       |                     pthread_setcanceltype

 > Fixes:
 >  - http://autobuild.buildroot.org/results/8a93b75ee51e005383eac17aa7577b43eda4cd92

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
