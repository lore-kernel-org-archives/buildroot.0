Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831FBC4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 13:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15F7E60692;
	Sun, 18 Dec 2022 13:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15F7E60692
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZuzqYhd3O17z; Sun, 18 Dec 2022 13:43:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45AF560B0C;
	Sun, 18 Dec 2022 13:43:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45AF560B0C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11F9F1BF5A7
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 13:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EED204015F
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 13:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EED204015F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i8Mxb4uQyGbt for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 13:43:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08D66400D3
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08D66400D3
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 13:43:10 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 17BBC20007;
 Sun, 18 Dec 2022 13:43:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p6twZ-003rzY-75; Sun, 18 Dec 2022 14:43:07 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Paul Cercueil <paul@crapouillou.net>
References: <20221214171754.178428-1-paul@crapouillou.net>
Date: Sun, 18 Dec 2022 14:43:07 +0100
In-Reply-To: <20221214171754.178428-1-paul@crapouillou.net> (Paul Cercueil's
 message of "Wed, 14 Dec 2022 18:17:54 +0100")
Message-ID: <87bko0omj8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/lightning: bump version to 2.2.0
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

>>>>> "Paul" == Paul Cercueil <paul@crapouillou.net> writes:

 > Notable changes in this new version include support for the Apple
 > Aarch64 ABI, and compare-and-swap atomic instructions.

 > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
 > ---
 >  ...e.am-don-t-install-lightning.h-twice.patch | 38 -------------------
 >  package/lightning/lightning.hash              |  2 +-
 >  package/lightning/lightning.mk                |  2 +-
 >  3 files changed, 2 insertions(+), 40 deletions(-)
 >  delete mode 100644 package/lightning/0001-include-Makefile.am-don-t-install-lightning.h-twice.patch

 > diff --git a/package/lightning/0001-include-Makefile.am-don-t-install-lightning.h-twice.patch b/package/lightning/0001-include-Makefile.am-don-t-install-lightning.h-twice.patch
 > deleted file mode 100644
 > index fb5299c25f..0000000000
 > --- a/package/lightning/0001-include-Makefile.am-don-t-install-lightning.h-twice.patch
 > +++ /dev/null
 > @@ -1,38 +0,0 @@
 > -From 604c931bc673c507254a84c0f423c9ec8ce6e3a1 Mon Sep 17 00:00:00 2001

You drop the patch tweaking include/Makefile.am ..

 > +++ b/package/lightning/lightning.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -LIGHTNING_VERSION = 2.1.3
 > +LIGHTNING_VERSION = 2.2.0
 >  LIGHTNING_SITE = $(BR2_GNU_MIRROR)/lightning
 >  LIGHTNING_LICENSE = LGPL-3.0+
 >  LIGHTNING_LICENSE_FILES = COPYING.LESSER

But you didn't remove LIGHTNING_AUTORECONF = YES

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
