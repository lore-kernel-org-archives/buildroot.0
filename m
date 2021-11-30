Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269DCC433F5
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 16:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D51A461BAB;
	Tue, 30 Nov 2021 16:25:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BODb-W8cDyzD; Tue, 30 Nov 2021 16:25:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42F316070E;
	Tue, 30 Nov 2021 16:25:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA5861BF995
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 16:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8B4F6070E
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 16:25:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AH29hjTfpc14 for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 16:25:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9D256070A
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 16:25:02 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id D10B2240008;
 Tue, 30 Nov 2021 16:25:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1ms5wC-0005YU-85; Tue, 30 Nov 2021 17:25:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211127083004.1515239-1-fontaine.fabrice@gmail.com>
Date: Tue, 30 Nov 2021 17:25:00 +0100
In-Reply-To: <20211127083004.1515239-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 27 Nov 2021 09:30:04 +0100")
Message-ID: <87pmqhfw6b.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/xscreensaver: add xdg SELinux
 module
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
Cc: Simon Dawson <spdawson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > xdg SELinux module is needed to avoid the following build failure raised
 > since commit 62b4fa2d7b543cfbacbc8fa112a88fa575b23eb3:

 >  Compiling targeted policy.31
 >  env LD_LIBRARY_PATH="/home/buildroot/autobuild/instance-2/output-1/host/lib:/home/buildroot/autobuild/instance-2/output-1/host/usr/lib" /home/buildroot/autobuild/instance-2/output-1/host/usr/bin/checkpolicy -c 31 -U deny -S -O -E policy.conf -o policy.31
 >  policy/modules/services/xserver.te:116:ERROR 'attribute xdg_cache_type is not declared' at token ';' on line 656367:
 >  #line 116
 > 	typeattribute user_fonts_cache_t xdg_cache_type;
 >  checkpolicy:  error(s) encountered while parsing configuration

 > Fixes:
 >  - http://autobuild.buildroot.org/results/610484c288fa1923d9ee28a3cb780dcb67579eee

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
