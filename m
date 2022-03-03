Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5CEC433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Mar 2022 22:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2C6483EC2;
	Thu,  3 Mar 2022 22:10:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s7DuwKDIcyVs; Thu,  3 Mar 2022 22:10:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA631813EC;
	Thu,  3 Mar 2022 22:10:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 336D41BF383
 for <buildroot@lists.busybox.net>; Thu,  3 Mar 2022 22:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2260B607C7
 for <buildroot@lists.busybox.net>; Thu,  3 Mar 2022 22:10:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wJqChebFTzWK for <buildroot@lists.busybox.net>;
 Thu,  3 Mar 2022 22:10:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2245160644
 for <buildroot@buildroot.org>; Thu,  3 Mar 2022 22:10:14 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A6569E0002;
 Thu,  3 Mar 2022 22:10:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nPteG-000eHA-11; Thu, 03 Mar 2022 23:10:12 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220302174456.1641125-1-fontaine.fabrice@gmail.com>
 <20220302174456.1641125-2-fontaine.fabrice@gmail.com>
Date: Thu, 03 Mar 2022 23:10:12 +0100
In-Reply-To: <20220302174456.1641125-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 2 Mar 2022 18:44:56 +0100")
Message-ID: <87fsnyadrv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/xscreensaver: add
 gdk-pixbuf-xlib dependency
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Simon Dawson <spdawson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > gdk-pixbuf-xlib dependency is needed since bump of gdk-pixbuf to version
 > 2.42.0 in commit a7b51ed3013c919b293deb95299e33363fb9df70 to avoid the

2.42.2, not 2.42.0.

> following "hidden" warnings:

 >    Warning: GTK version 2.24.33 was found, but at least one supporting
 >             library (gdk-pixbuf-xlib-2.0) was not, so GTK can't be used.
 >             Perhaps some of the development packages are not installed?

 >    Warning: The GTK libraries do not seem to be available; the
 >             `xscreensaver-demo' program requires them.

 >    Warning: The GDK-Pixbuf library was not found.

 >             The PNG library is being used instead.

 >             Some of the demos will not use images as much as they could.
 >             You should consider installing GDK-Pixbuf and re-running
 >             configure.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
