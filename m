Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F596C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 13:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44B278175B;
	Sat,  8 Jan 2022 13:45:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B98CXJZrQXVz; Sat,  8 Jan 2022 13:45:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E8B4814B5;
	Sat,  8 Jan 2022 13:45:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E89CB1BF301
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0962814B5
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:44:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6lS9HHE2Bckf for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 13:44:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9287A81495
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 13:44:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id B07B660004;
 Sat,  8 Jan 2022 13:44:55 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n6C1e-0001Jz-W7; Sat, 08 Jan 2022 14:44:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20220108102620.1603341-1-bernd.kuhls@t-online.de>
Date: Sat, 08 Jan 2022 14:44:54 +0100
In-Reply-To: <20220108102620.1603341-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 8 Jan 2022 11:26:20 +0100")
Message-ID: <87iluugx49.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: bump version to 0.23.5
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
Cc: Andreas Ziegler <br015@umbiko.net>,
 =?utf-8?Q?J=C3=B6rg?= Krause <joerg.krause@embedded.rocks>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Switched project URL to https.

I added a short explaination why (HTTP redirects to HTTPS)

 > +++ b/package/mpd/mpd.mk
 > @@ -5,7 +5,7 @@
 >  ################################################################################
 
 >  MPD_VERSION_MAJOR = 0.23
 > -MPD_VERSION = $(MPD_VERSION_MAJOR).3
 > +MPD_VERSION = $(MPD_VERSION_MAJOR).5
 >  MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 >  MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)

And also changed it here.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
