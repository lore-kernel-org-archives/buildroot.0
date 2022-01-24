Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42975C433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 17:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0D414053F;
	Mon, 24 Jan 2022 17:36:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1jlOEujx_hUR; Mon, 24 Jan 2022 17:36:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A6FB401CA;
	Mon, 24 Jan 2022 17:36:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DEF281BF487
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBA846009C
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:36:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p3DAk96456ek for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 17:36:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7215360A79
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 17:36:07 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 82B1760010;
 Mon, 24 Jan 2022 17:36:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nC3G6-0000Tn-Dq; Mon, 24 Jan 2022 18:36:02 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Max Filippov <jcmvbkbc@gmail.com>
References: <20211227072344.16697-1-jcmvbkbc@gmail.com>
Date: Mon, 24 Jan 2022 18:36:02 +0100
In-Reply-To: <20211227072344.16697-1-jcmvbkbc@gmail.com> (Max Filippov's
 message of "Sun, 26 Dec 2021 23:23:44 -0800")
Message-ID: <87zgnlqbnh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/coreutils: drop
 gl_cv_func_fstatat_zero_flag=no from config env
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > Configuring coreutils with gl_cv_func_fstatat_zero_flag=no results in
 > non-functional lchmod library function which causes 'mkfifo -m' to
 > always complete with the message 'cannot set permissions of ...: Invalid
 > argument' and an error exit code. gl_cv_func_fstatat_zero_flag=no is not
 > needed when building coreutils-9.0 for linux and its setting should be
 > correctly determined by the configure script.
 > Drop gl_cv_func_fstatat_zero_flag=no from the coreutils configure
 > environment.

 > For more details see
 > https://lists.buildroot.org/pipermail/buildroot/2021-December/631388.html

 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
