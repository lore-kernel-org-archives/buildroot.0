Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2235FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 22:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E22884269;
	Tue, 15 Mar 2022 22:18:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B2m9CjaBiMl6; Tue, 15 Mar 2022 22:18:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEBCF84272;
	Tue, 15 Mar 2022 22:18:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 747491BF422
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 22:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63C89401B1
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 22:18:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id leoKJHunL2qp for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 22:18:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 101C74019E
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 22:18:00 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AF07620003;
 Tue, 15 Mar 2022 22:17:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nUFUK-00Bdiw-IV; Tue, 15 Mar 2022 23:17:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220302174456.1641125-1-fontaine.fabrice@gmail.com>
Date: Tue, 15 Mar 2022 23:17:56 +0100
In-Reply-To: <20220302174456.1641125-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 2 Mar 2022 18:44:55 +0100")
Message-ID: <87bky6vp0r.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/gdk-pixbuf-xlib: new package
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

 > Deprecated Xlib integration for GdkPixbuf.
 > gdk-pixbuf-xlib has been deprecated and split off of gdk-pixbuf since
 > version 2.42.0 and
 > https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/3362e94c2595440f322798dc4d15f1ed24a4c52c
 > resulting in the following "hidden" warnings with xscreensaver since
 > commit a7b51ed3013c919b293deb95299e33363fb9df70:

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

 > https://gitlab.gnome.org/Archive/gdk-pixbuf-xlib

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
