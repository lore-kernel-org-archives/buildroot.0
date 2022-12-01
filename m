Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7E2C4321E
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 20:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A46C2610F8;
	Thu,  1 Dec 2022 20:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A46C2610F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4pGQZ75Bf4KA; Thu,  1 Dec 2022 20:55:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D771A610F4;
	Thu,  1 Dec 2022 20:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D771A610F4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 875871BF83C
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 20:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FC3581B52
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 20:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FC3581B52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o4700wMXIcza for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 20:55:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7026681A47
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7026681A47
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 20:55:15 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 33B7B100005;
 Thu,  1 Dec 2022 20:55:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p0qaO-006vSI-9f; Thu, 01 Dec 2022 21:55:12 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20221130212614.1215778-1-bernd.kuhls@t-online.de>
Date: Thu, 01 Dec 2022 21:55:12 +0100
In-Reply-To: <20221130212614.1215778-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Wed, 30 Nov 2022 22:26:14 +0100")
Message-ID: <87iliuc09b.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/vlc: security bump version to
 3.0.18
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

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Removed patch 0010, a different fix was applied upstream:
 > https://code.videolan.org/videolan/vlc/-/commit/05445b74a38d045cb28f71f96ccbe882445a031e

 > Removed patch 0011 which was backported from upstream.
 > Renumbered patch 0012 -> 0010.

 > Release notes:
 > http://www.videolan.org/vlc/releases/3.0.18.html

 > Fixes CVE-2022-41325:
 > http://www.videolan.org/security/sb-vlc3018.html

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 > +++ b/package/vlc/vlc.hash
 > @@ -1,7 +1,7 @@
 > -# From https://get.videolan.org/vlc/3.0.17.4/vlc-3.0.17.4.tar.xz.sha256
 > -sha256  8c5a62d88a4fb45c1b095cf10befef217dfa87aedcec5184b9e7d590b6dd4133  vlc-3.0.17.4.tar.xz
 > -# From https://get.videolan.org/vlc/3.0.17.4/vlc-3.0.17.4.tar.xz.sha1
 > -sha1  ebcd9939103fda141267c5a8f1c603df4533218e  vlc-3.0.17.4.tar.xz
 > +# From https://get.videolan.org/vlc/3.0.18/vlc-3.0.18.tar.xz.sha256
 > +sha256  57094439c365d8aa8b9b41fa3080cc0eef2befe6025bb5cef722accc625aedec  vlc-3.0.18.tar.xz
 > +# From https://get.videolan.org/vlc/3.0.18/vlc-3.0.18.tar.xz.sha1
 > +sha1  b11ccaa0f5ee15a550564817d60458eb0946f80e *vlc-3.0.18.tar.xz

You have a * before the filename, which get flagged by check-package:

Applying: package/vlc: security bump version to 3.0.18
package/vlc/vlc.hash:4: separation does not match expectation (http://nightly.buildroot.org/#adding-packages-hash)

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
