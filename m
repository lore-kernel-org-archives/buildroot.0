Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5B1C10F1E
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 07:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D20AD818BE;
	Tue, 20 Dec 2022 07:21:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D20AD818BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hn9NGfGOEwFi; Tue, 20 Dec 2022 07:21:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34009818A1;
	Tue, 20 Dec 2022 07:21:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34009818A1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 100C61BF300
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 07:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7D83408EE
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 07:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7D83408EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sbazoh6CvcL8 for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 07:21:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C87740889
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C87740889
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 07:21:43 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6758920009;
 Tue, 20 Dec 2022 07:21:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p7WwV-008c9N-EA; Tue, 20 Dec 2022 08:21:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20221212211428.2036144-1-bernd.kuhls@t-online.de>
Date: Tue, 20 Dec 2022 08:21:39 +0100
In-Reply-To: <20221212211428.2036144-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Mon, 12 Dec 2022 22:14:28 +0100")
Message-ID: <878rj2h75o.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1]
 package/x11r7/xdriver_xf86-input-keyboard: remove package
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

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > According to the upstream release notes of version 2.0.0:
 > https://lists.x.org/archives/xorg-announce/2022-July/003180.html

 > "This keyboard driver is primarily used with BSD, GNU Hurd, illumos, &
 >  Solaris systems. Linux systems should instead use either xf86-input-
 >  libinput or xf86-input-evdev.

 >  While versions 1.9.0 and earlier had rudimentary support for Linux as
 >  well, that has been removed in this release."

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  Config.in.legacy                                  |  5 +++++
 >  package/x11r7/Config.in                           |  1 -
 >  .../x11r7/xdriver_xf86-input-keyboard/Config.in   |  5 -----
 >  .../xdriver_xf86-input-keyboard.hash              |  4 ----
 >  .../xdriver_xf86-input-keyboard.mk                | 15 ---------------
 >  5 files changed, 5 insertions(+), 25 deletions(-)
 >  delete mode 100644 package/x11r7/xdriver_xf86-input-keyboard/Config.in
 >  delete mode 100644 package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.hash
 >  delete mode 100644 package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk

 > diff --git a/Config.in.legacy b/Config.in.legacy
 > index 28c6822689..b70d4c7206 100644
 > --- a/Config.in.legacy
 > +++ b/Config.in.legacy
 > @@ -146,6 +146,11 @@ endif
 
 >  comment "Legacy options removed in 2023.02"
 
 > +config BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD
 > +	bool "xf86-input-keyboard removed"
 > +	help
 > +	  The X.org keyboard input driver does not support linux.

I've reworded this to say "no longer support Linux" and committed,
thanks.

Does the same not apply for the input-mouse driver?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
