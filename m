Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57DDECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 15:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F79D40BB7;
	Sat, 17 Sep 2022 15:27:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F79D40BB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IyeV7Vr8idim; Sat, 17 Sep 2022 15:27:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86EC340420;
	Sat, 17 Sep 2022 15:27:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86EC340420
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 27DFE1BF388
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F116240420
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F116240420
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RpHKkrz90F4W for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 15:27:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4CF840153
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4CF840153
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 15:27:31 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 10ACF40003;
 Sat, 17 Sep 2022 15:27:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZZj7-009Pbj-1f; Sat, 17 Sep 2022 17:27:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220826214620.75193-1-fontaine.fabrice@gmail.com>
Date: Sat, 17 Sep 2022 17:27:29 +0200
In-Reply-To: <20220826214620.75193-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 26 Aug 2022 23:46:20 +0200")
Message-ID: <87v8pm10ny.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/rsync: security bump to version
 3.2.5
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

 > - Fix CVE-2022-29154: An issue was discovered in rsync before 3.2.5 that
 >   allows malicious remote servers to write arbitrary files inside the
 >   directories of connecting peers. The server chooses which
 >   files/directories are sent to the client. However, the rsync client
 >   performs insufficient validation of file names. A malicious rsync
 >   server (or Man-in-The-Middle attacker) can overwrite arbitrary files
 >   in the rsync client target directory and subdirectories (for example,
 >   overwrite the .ssh/authorized_keys file).
 > - Drop patches (already in version)
 > - Update hash of COPYING (make openssl license exception clearer by
 >   having it at the top and use modern links in COPYING:
 >   https://github.com/WayneD/rsync/commit/dde469513625c0e10216da9b6f6546aa844431f7)

 > https://github.com/WayneD/rsync/blob/v3.2.5/NEWS.md

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
