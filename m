Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B73BC54E68
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 22:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DB35416FC;
	Sat, 16 Mar 2024 22:33:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uHgjqXMSRIkz; Sat, 16 Mar 2024 22:33:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5049A415E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5049A415E4;
	Sat, 16 Mar 2024 22:33:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A13B1BF3D5
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFC67415E2
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:33:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XPdT9VXi5q3J for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 22:33:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 300DE4157C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 300DE4157C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 300DE4157C
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 22:33:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00DC060002;
 Sat, 16 Mar 2024 22:33:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rlcaK-001Xp9-1S;
 Sat, 16 Mar 2024 23:33:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20240221201046.A9D0C87A2B@busybox.osuosl.org>
Date: Sat, 16 Mar 2024 23:33:00 +0100
In-Reply-To: <20240221201046.A9D0C87A2B@busybox.osuosl.org> (Yann E. MORIN's
 message of "Wed, 21 Feb 2024 21:08:23 +0100")
Message-ID: <875xxlkdsz.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/sudo: drop legacy, useless,
 and broken post-configure hook
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=5aade5ced5edc40a4ad848cd276813d273d2d04e
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit b9e89b340e27 (sudo: bump version) introduced the explicit build
 > of mksigname and mksiglist as host tools, as they were required to run
 > on the build machine, to generate C code then used to build the target
 > program.

 > This is now failing to build since the bump to sudo 1.9.15p5 in commit
 > c87746afefe7 (package/sudo: security bump to version 1.9.15p5)
 > (lines manually wrapped and slightly elided for ease of reviewing):

 >     /usr/bin/cpp \
 >         -I/home/ymorin/dev/buildroot/O/master/per-package/sudo/host/include \
 >         -I../../include \
 >         -I../.. \
 >         ./sys_signame.h \
 >     | /usr/bin/sed -e '1,/^int sudo_end_of_headers;/d' -e '/^#/d' > mksigname.h
 >     In file included from /usr/include/features.h:394,
 >                      from /usr/include/sys/types.h:25,
 >                      from ./sys_signame.h:4:
 >     /usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
 >        26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
 >           |     ^~~~~
 >     /usr/bin/gcc -I../../include -I../.. -I. -I. \
 >         -D_PATH_SUDO_CONF=\"/etc/sudo.conf\"
 >         -I/home/ymorin/dev/buildroot/O/master/per-package/sudo/host/include \
 >         -DDEFAULT_TEXT_DOMAIN=\"sudo\" \
 >         -O2 \
 >         -I/home/ymorin/dev/buildroot/O/master/per-package/sudo/host/include \
 >         ./mksigname.c -o mksigname
 >     In file included from /usr/include/features.h:394,
 >                      from /usr/include/bits/libc-header-start.h:33,
 >                      from /usr/include/stdlib.h:26,
 >                      from ./mksigname.c:27:
 >     /usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
 >        26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
 >           |     ^~~~~
 >     make[2]: *** [Makefile:263: mksigname] Error 1

 > The core of the issue has not been really identified, but it turns out
 > that neither mksiglist nor mksignames is used during the build. This has
 > been tested with a minimal sudo with no option, and with a sudo with all
 > options enabled (linux-pam, zlib, opensldap, and openssl), with the
 > three types of C libraries (glibc, musl, and uClibc-ng).

 > Digging in the sudo buildsystem did not reveal an obvious reason when
 > those would be needed either.

 > Drop the hook now it seems it is no longer used and is atually breaking
 > the build.

 > Fixes: http://autobuild.buildroot.org/results/72f/72ff18fb9b41394a29006f881ee1fbea67a66a09/

 > Note that there is a second issue in there: the call to the host cpp
 > fails, but since it is on the LHS of a pipe, the error is lost, as the
 > RHS of the pipe (the sed call) succeeds; a fix for that will be sent
 > in a separate patch.

 > Reported-by: Christian Stewart <christian@aperture.us>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Reviewed-by: Christian Stewart <christian@aperture.us>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
