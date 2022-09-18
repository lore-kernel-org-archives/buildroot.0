Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5843AC32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 11:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C084041C4A;
	Sun, 18 Sep 2022 11:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C084041C4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KOrzpZ5eUBMf; Sun, 18 Sep 2022 11:29:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F3D041A39;
	Sun, 18 Sep 2022 11:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F3D041A39
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 341421BF3EE
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 11:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B1C74011C
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 11:29:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B1C74011C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pu4xjcweLUfe for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 11:29:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1CA740117
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1CA740117
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 11:29:23 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 79E37100007;
 Sun, 18 Sep 2022 11:29:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZsUA-00C3xU-M5; Sun, 18 Sep 2022 13:29:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
References: <20220914063108.3686785-1-thomas.devoogdt@barco.com>
Date: Sun, 18 Sep 2022 13:29:18 +0200
In-Reply-To: <20220914063108.3686785-1-thomas.devoogdt@barco.com> (Thomas
 Devoogdt's message of "Wed, 14 Sep 2022 08:31:08 +0200")
Message-ID: <875yhkhqep.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/gdk-pixbuf: fix test compilation
 (don't build the test suite)
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > Not needed + breaks compilation on some platforms.
 > The compilation error was seen on 2.42.8, but also relevant
 > for 2.42.9 to not compile the test suite.

 > The option was added in 2.42.9:
 > https://github.com/GNOME/gdk-pixbuf/commit/801eef111df624f4377baed9a90c94b6a2d4340c

 > ```
 > [179/246] Generating tests/resources.c with a custom command
 > FAILED: tests/resources.c
 > /buildroot/output/host/bin/python3
 > /buildroot/output/build/host-gdk-pixbuf-2.42.8/build-aux/gen-resources.py
 > --glib-compile-resources=/buildroot/output/host/bin/glib-compile-resources
 > --pixdata=/buildroot/output/build/host-gdk-pixbuf-2.42.8/build/gdk-pixbuf/gdk-pixbuf-pixdata
 > --loaders=/buildroot/output/build/host-gdk-pixbuf-2.42.8/build/gdk-pixbuf/loaders.cache
 > --sourcedir=/buildroot/output/build/host-gdk-pixbuf-2.42.8/tests
 > --source ../tests/resources.gresource.xml tests/resources.c
 > failed to load
 > "/buildroot/output/build/host-gdk-pixbuf-2.42.8/tests/icc-profile.png":
 > Couldn?t recognize the image file format for file
 > ?/buildroot/output/build/host-gdk-pixbuf-2.42.8/tests/icc-profile.png?
 > ../tests/resources.gresource.xml: Child process exited with code 1.
 > ```

 > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
