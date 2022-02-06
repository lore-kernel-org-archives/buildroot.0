Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE15C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 11:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 506F160D77;
	Sun,  6 Feb 2022 11:17:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kDaeWeXCSw5H; Sun,  6 Feb 2022 11:17:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A1A060D68;
	Sun,  6 Feb 2022 11:17:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 926541BF5F8
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 11:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 787C9401ED
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 11:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FAmjV4aQf633 for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 11:17:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 414D2400A8
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 11:17:11 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 18EBC60004;
 Sun,  6 Feb 2022 11:17:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nGfXY-0001Z9-BE; Sun, 06 Feb 2022 12:17:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20220206094504.11415-1-peter@korsgaard.com>
 <20220206094504.11415-2-peter@korsgaard.com>
 <89d065e4-5745-8b6a-4aed-d03b26c112f2@mind.be>
Date: Sun, 06 Feb 2022 12:17:08 +0100
In-Reply-To: <89d065e4-5745-8b6a-4aed-d03b26c112f2@mind.be> (Arnout
 Vandecappelle's message of "Sun, 6 Feb 2022 12:05:42 +0100")
Message-ID: <87pmo0qm6j.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/avahi: add pygobject support,
 move to python3
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

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 06/02/2022 10:45, Peter Korsgaard wrote:
 >> The python support in avahi needs pygobjet to do anything:
 >> 
 >> Building avahi-python:              no   (You need python, pygobject and python-dbus!)

 >  So, doesn't that mean that...

 >> -ifeq ($(BR2_PACKAGE_PYTHON),y)
 >> +ifeq ($(BR2_PACKAGE_PYTHON3),y)

 > ... this condition should be

 > ifeq ($(BR2_PACKAGE_PYTHON_GOBJECT)$(BR2_PACKAGE_PYTHON_DBUS_NEXT),yy)

 > (python3 is implied by python-gobject).

Well, it could - But there is no harm in passing --enable-python without
dbus/gobject, it will just not do anything.

Notice that it is dbus-python, not python-dbus-next.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
