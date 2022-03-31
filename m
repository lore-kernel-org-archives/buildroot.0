Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FF9C433EF
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 06:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B97C41D5C;
	Thu, 31 Mar 2022 06:50:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xIhjVkLJxyDY; Thu, 31 Mar 2022 06:50:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4210041D56;
	Thu, 31 Mar 2022 06:50:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DA651BF321
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 06:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C22D60D7F
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 06:50:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pIgSRLA7M2yd for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 06:50:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E704460C0C
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 06:50:29 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E0E14100009;
 Thu, 31 Mar 2022 06:50:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nZodW-000ZFW-UF; Thu, 31 Mar 2022 08:50:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Jan Havran <jan.havran@audified.com>
References: <YiXRxFsrmOttLX0v@jan-lenovo>
Date: Thu, 31 Mar 2022 08:50:26 +0200
In-Reply-To: <YiXRxFsrmOttLX0v@jan-lenovo> (Jan Havran's message of "Mon, 7
 Mar 2022 10:35:00 +0100")
Message-ID: <87czi262fh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/jack2: bump to version 1.9.20
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
Cc: "Wojciech M. Zabolotny" <wzab01@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Jan" == Jan Havran <jan.havran@audified.com> writes:

 > - Fix URL for 'JACK DBus packaging' GitHub Wiki page.
 > https://github.com/jackaudio/jack2/releases/tag/v1.9.18
 > https://github.com/jackaudio/jack2/releases/tag/v1.9.19
 > https://github.com/jackaudio/jack2/releases/tag/v1.9.20

 > Signed-off-by: Jan Havran <jan.havran@audified.com>

Committed to 2022.02.x given the fixes, thanks.

> ---
 >  package/jack2/Config.in  | 4 ++--
 >  package/jack2/jack2.hash | 2 +-
 >  package/jack2/jack2.mk   | 2 +-
 >  3 files changed, 4 insertions(+), 4 deletions(-)

 > diff --git a/package/jack2/Config.in b/package/jack2/Config.in
 > index bc883190d5..8abdda6376 100644
 > --- a/package/jack2/Config.in
 > +++ b/package/jack2/Config.in
 > @@ -30,7 +30,7 @@ config BR2_PACKAGE_JACK2_LEGACY
 >  	help
 >  	  Build and use jackd.
 
 > -	  https://github.com/jackaudio/jackaudio.github.com/wiki/JackDbusPackaging
 > +	  https://github.com/jackaudio/jackaudio.github.com/wiki/JACK-DBus-packaging
 
 >  config BR2_PACKAGE_JACK2_DBUS
 >  	bool "dbus jack2"
 > @@ -42,7 +42,7 @@ config BR2_PACKAGE_JACK2_DBUS
 >  	help
 >  	  Build and use jackdbus.
 
 > -	  https://github.com/jackaudio/jackaudio.github.com/wiki/JackDbusPackaging
 > +	  https://github.com/jackaudio/jackaudio.github.com/wiki/JACK-DBus-packaging
 
 >  endif
 
 > diff --git a/package/jack2/jack2.hash b/package/jack2/jack2.hash
 > index df708f7ca5..6361473cf7 100644
 > --- a/package/jack2/jack2.hash
 > +++ b/package/jack2/jack2.hash
 > @@ -1,3 +1,3 @@
 >  # Locally calculated
 > -sha256  38f674bbc57852a8eb3d9faa1f96a0912d26f7d5df14c11005ad499c8ae352f2  jack2-1.9.17.tar.gz
 > +sha256  915ad2900992159bdb729b9fc4ea134b962ce32b2df0b384fee40a2c5808835d  jack2-1.9.20.tar.gz
 >  sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  COPYING
 > diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
 > index e6a036bac9..2e55169984 100644
 > --- a/package/jack2/jack2.mk
 > +++ b/package/jack2/jack2.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -JACK2_VERSION = 1.9.17
 > +JACK2_VERSION = 1.9.20
 >  JACK2_SITE = $(call github,jackaudio,jack2,v$(JACK2_VERSION))
 >  JACK2_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 >  JACK2_LICENSE_FILES = COPYING
 > -- 

 > 2.35.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
