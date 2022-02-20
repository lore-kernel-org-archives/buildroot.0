Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7A8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 19:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFEDA60C0C;
	Sun, 20 Feb 2022 19:22:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dIrHOkJcGHfK; Sun, 20 Feb 2022 19:22:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B8F860D4B;
	Sun, 20 Feb 2022 19:22:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CEFA31BF476
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 19:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBD144037A
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 19:22:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XX6cnYHOOAc7 for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 19:22:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2E1740348
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 19:22:33 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5CD5DC0005;
 Sun, 20 Feb 2022 19:22:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nLrmv-000xBm-IO; Sun, 20 Feb 2022 20:22:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220217094048.2756293-1-fontaine.fabrice@gmail.com>
Date: Sun, 20 Feb 2022 20:22:29 +0100
In-Reply-To: <20220217094048.2756293-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 17 Feb 2022 10:40:48 +0100")
Message-ID: <875yp9bax6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/luasyslog: bump to version 2.2.1
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This bump contains a single commit which fixes the following build
 > failure with Lua 5.4 raised since commit
 > 4f9a5659023c66fc166de28fd39a6c97a9490667:

 > In file included from lsyslog.c:11:
 > compat-5.3.h:402:4: error: #error "unsupported Lua version (i.e. not Lua 5.1, 5.2, or 5.3)"
 >   402 | #  error "unsupported Lua version (i.e. not Lua 5.1, 5.2, or 5.3)"
 >       |    ^~~~~

 > Also update indentation in hash file (two spaces)

 > Fixes:
 >  - http://autobuild.buildroot.org/results/df2aabcf2ae07cad66b869ec4ac76702d2c32dc5

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
