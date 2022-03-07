Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2424EC433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 19:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D02FD83E60;
	Mon,  7 Mar 2022 19:43:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GmS85ShlnjpN; Mon,  7 Mar 2022 19:43:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7DA083487;
	Mon,  7 Mar 2022 19:43:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 74C4C1BF36D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D65C60EA5
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 19:43:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mKf0Ex3cbLmL for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 19:43:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 438A860B5E
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 19:43:10 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3C097FF805;
 Mon,  7 Mar 2022 19:43:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nRJG8-000z7B-E0; Mon, 07 Mar 2022 20:43:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Andrei Gherghescu via buildroot <buildroot@buildroot.org>
References: <20220224213620.5899-1-andrei.gherghescu@protonmail.com>
Date: Mon, 07 Mar 2022 20:43:08 +0100
In-Reply-To: <20220224213620.5899-1-andrei.gherghescu@protonmail.com> (Andrei
 Gherghescu via buildroot's message of "Thu, 24 Feb 2022 21:36:33
 +0000")
Message-ID: <878rtl7dmb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/directfb: change upstream site
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
Cc: Andrei Gherghescu <andrei.gherghescu@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Andrei" == Andrei Gherghescu via buildroot <buildroot@buildroot.org> writes:

 > The http://www.directfb.org/ has been down since 2015.
 > Use the Buildroot backup download site.

 > Fixes:
 >    - https://bugs.busybox.net/show_bug.cgi?id=13731

That bug is about readline. I guess you mean
https://bugs.busybox.net/show_bug.cgi?id=13126 instead?

Committed, thanks.

 > Signed-off-by: Andrei Gherghescu <andrei.gherghescu@protonmail.com>
 > ---
 >  package/directfb-examples/Config.in            | 6 ++++--
 >  package/directfb-examples/directfb-examples.mk | 2 +-
 >  package/directfb/directfb.mk                   | 2 +-
 >  3 files changed, 6 insertions(+), 4 deletions(-)

 > diff --git a/package/directfb-examples/Config.in b/package/directfb-examples/Config.in
 > index 216e036577..4d5de03068 100644
 > --- a/package/directfb-examples/Config.in
 > +++ b/package/directfb-examples/Config.in
 > @@ -4,6 +4,8 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES
 >  	help
 >  	  The DirectFB-examples package contains a set of simple
 >  	  DirectFB applications that can be used to test and demonstrate
 > -	  various DirectFB features.
 > +	  various DirectFB features. As of 4 October 2015, DirectFB's
 > +	  website http://www.directfb.org/ is down. See alternative site
 > +	  listed below.

 > -	  http://directfb.org/downloads/Extras/README.DirectFB-examples
 > +	  http://elinux.org/DirectFB
 > diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
 > index 46263da733..c8d09b3e33 100644
 > --- a/package/directfb-examples/directfb-examples.mk
 > +++ b/package/directfb-examples/directfb-examples.mk
 > @@ -5,7 +5,7 @@
 >  ################################################################################

 >  DIRECTFB_EXAMPLES_VERSION = 1.7.0
 > -DIRECTFB_EXAMPLES_SITE = http://www.directfb.org/downloads/Extras
 > +DIRECTFB_EXAMPLES_SITE = http://sources.buildroot.net/directfb-examples
 >  DIRECTFB_EXAMPLES_SOURCE = DirectFB-examples-$(DIRECTFB_EXAMPLES_VERSION).tar.gz
 >  DIRECTFB_EXAMPLES_LICENSE = MIT
 >  DIRECTFB_EXAMPLES_LICENSE_FILES = COPYING
 > diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
 > index 0b32162d8f..56a396ab99 100644
 > --- a/package/directfb/directfb.mk
 > +++ b/package/directfb/directfb.mk
 > @@ -6,7 +6,7 @@

 >  DIRECTFB_VERSION_MAJOR = 1.7
 >  DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).7
 > -DIRECTFB_SITE = http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
 > +DIRECTFB_SITE = http://sources.buildroot.net/directfb
 >  DIRECTFB_SOURCE = DirectFB-$(DIRECTFB_VERSION).tar.gz
 >  DIRECTFB_LICENSE = LGPL-2.1+
 >  DIRECTFB_LICENSE_FILES = COPYING
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
