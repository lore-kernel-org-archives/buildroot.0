Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F2BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 22:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41001416E9;
	Tue, 15 Mar 2022 22:18:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YWNArttMJjyH; Tue, 15 Mar 2022 22:18:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D5BC416D9;
	Tue, 15 Mar 2022 22:18:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FFC31BF422
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 22:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C3FA60E30
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 22:18:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fz4tBM1Bb84O for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 22:18:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C47B60B79
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 22:18:05 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8C9DC100003;
 Tue, 15 Mar 2022 22:18:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nUFUP-00Bdj0-DY; Tue, 15 Mar 2022 23:18:01 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220302174456.1641125-1-fontaine.fabrice@gmail.com>
 <20220302174456.1641125-2-fontaine.fabrice@gmail.com>
Date: Tue, 15 Mar 2022 23:18:01 +0100
In-Reply-To: <20220302174456.1641125-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 2 Mar 2022 18:44:56 +0100")
Message-ID: <877d8uvp0m.fsf@dell.be.48ers.dk>
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

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
