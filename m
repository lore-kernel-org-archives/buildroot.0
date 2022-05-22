Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BBFC433F5
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 10:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6E3460C1D;
	Sun, 22 May 2022 10:04:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DNowbKS-yvb3; Sun, 22 May 2022 10:04:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0088660BE8;
	Sun, 22 May 2022 10:04:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB41A1BF389
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6EFA40578
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:04:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WGR2ZcQ_Khf8 for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 10:04:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3972403B7
 for <buildroot@buildroot.org>; Sun, 22 May 2022 10:04:00 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 49125E0004;
 Sun, 22 May 2022 10:03:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nsiRH-00Bfca-V6; Sun, 22 May 2022 12:03:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220410143413.146915-1-fontaine.fabrice@gmail.com>
Date: Sun, 22 May 2022 12:03:55 +0200
In-Reply-To: <20220410143413.146915-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 10 Apr 2022 16:34:13 +0200")
Message-ID: <87tu9h28ac.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/kompexsqlite: security bump to
 version 1.12.15
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Update site to get latest version
 > - Switch to generic-package and drop patches as upstream doesn't provide
 >   autotools support
 > - License is MIT since version 1.12.15
 > - This bump will fix the following build failure with BR2_OPTIMIZE_FAST:

 > src/sqlite3.c: In function 'sqlite3IsNaN':
 > src/sqlite3.c:21797:3: error: #error SQLite will not work correctly with the -ffast-math option of GCC.
 > 21797 | # error SQLite will not work correctly with the -ffast-math option of GCC.
 >       |   ^~~~~

 > - This bump will also fix security issues by bumping sqlite to 3.36.0
 > - Update indentation in hash file (two spaces)

 > http://sqlitewrapper.kompex-online.com/index.php?content=changelog

 > Fixes:
 >  - http://autobuild.buildroot.org/results/63e07345b97faa6d6239933f1790c6f2e02da77f

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
