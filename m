Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C78C433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 18:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D60216F4A4;
	Fri, 27 May 2022 18:54:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rrMAliHvHArN; Fri, 27 May 2022 18:54:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 004696F4A1;
	Fri, 27 May 2022 18:54:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F21C21BF255
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 18:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDA2184BC5
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 18:54:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f-Q2pnlfNX1s for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 18:54:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9532384BC4
 for <buildroot@buildroot.org>; Fri, 27 May 2022 18:54:16 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3F8CFE0003;
 Fri, 27 May 2022 18:54:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nuf6B-002FKd-SH; Fri, 27 May 2022 20:54:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220428175447.983405-1-fontaine.fabrice@gmail.com>
Date: Fri, 27 May 2022 20:54:11 +0200
In-Reply-To: <20220428175447.983405-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 28 Apr 2022 19:54:47 +0200")
Message-ID: <87fskuiz70.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl2_ttf: disable builtin
 harfbuzz
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
Cc: Peter Thompson <peter.macleod.thompson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Disable builtin harfbuzz which is enabled by default since bump to
 > version 2.0.18 in commit f4da031a77f200515bcc5b2e0fe665a7b4f2a780 and
 > https://github.com/libsdl-org/SDL_ttf/commit/834ec54127dc9c2a12928f5fe32cf110ec4c7a7f
 > resulting in the following build failure without threads:

 > In file included from external/harfbuzz-2.8.0/src/hb.hh:470,
 >                  from external/harfbuzz-2.8.0/src/hb-aat-layout.cc:28:
 > external/harfbuzz-2.8.0/src/hb-mutex.hh:53:10: fatal error: pthread.h: No such file or directory
 >    53 | #include <pthread.h>
 >       |          ^~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/ac8b366558bec61ada84ec15cf27652fde2b63b2

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
