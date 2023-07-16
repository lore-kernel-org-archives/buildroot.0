Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B454CEB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 06:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E1AB409A6;
	Sun, 16 Jul 2023 06:06:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E1AB409A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sUt8iDfA8UHu; Sun, 16 Jul 2023 06:06:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3591C409A7;
	Sun, 16 Jul 2023 06:06:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3591C409A7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 975B21BF322
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 711C860A6F
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 711C860A6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YFGMIzO85_JW for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 06:06:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F65860706
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F65860706
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 06:06:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC0A7FF802;
 Sun, 16 Jul 2023 06:06:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qKutb-008mKh-Sz; Sun, 16 Jul 2023 08:06:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20230625192619.D571E84CA1@busybox.osuosl.org>
Date: Sun, 16 Jul 2023 08:06:15 +0200
In-Reply-To: <20230625192619.D571E84CA1@busybox.osuosl.org> (Arnout
 Vandecappelle via buildroot's message of "Sun, 25 Jun 2023 21:24:32
 +0200")
Message-ID: <87cz0se6g8.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [git commit] package/dbus: security bump to version
 1.2.28
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=52ae2a4e1d10da4ea46bc730db69a40d79eb835a
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fixes the following security issues:

 > - CVE-2023-34969: Fix an assertion failure in dbus-daemon when a privileged
 >   Monitoring connection (dbus-monitor, busctl monitor, gdbus monitor or
 >   similar) is active, and a message from the bus driver cannot be delivered
 >   to a client connection due to <deny> rules or outgoing message quota.
 >   This is a denial of service if triggered maliciously by a local attacker.

 > - Fix an incorrect assertion that could be used to crash dbus-daemon or
 >   other users of DBusServer prior to authentication, if libdbus was compiled
 >   with assertions enabled.

 > For details, see the NEWS file:
 > https://gitlab.freedesktop.org/dbus/dbus/blob/dbus-1.12/NEWS

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
