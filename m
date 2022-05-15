Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020A2C433EF
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 18:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B8D98141A;
	Sun, 15 May 2022 18:15:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XFnUnqfl_QGB; Sun, 15 May 2022 18:15:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9926581435;
	Sun, 15 May 2022 18:15:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E80401BF424
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 18:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D71BC813DD
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 18:15:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pT6HvDvQSmNs for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 18:15:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E78E7813D5
 for <buildroot@buildroot.org>; Sun, 15 May 2022 18:15:03 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ECE6320009;
 Sun, 15 May 2022 18:15:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nqIlg-00DrwP-Vo; Sun, 15 May 2022 20:15:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dan Jackson <dan@thejacksons.uk>
References: <AS8PR02MB8662F8E3B170B5ED877B6709DACC9@AS8PR02MB8662.eurprd02.prod.outlook.com>
Date: Sun, 15 May 2022 20:15:00 +0200
In-Reply-To: <AS8PR02MB8662F8E3B170B5ED877B6709DACC9@AS8PR02MB8662.eurprd02.prod.outlook.com>
 (Dan Jackson's message of "Sun, 15 May 2022 16:44:54 +0000")
Message-ID: <87bkvy7jdn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] Any way to configure "nano" to use fallbacks
 instead of terminfo/termcap?
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Dan" == Dan Jackson <dan@thejacksons.uk> writes:

 > Is there a way to enable the configuration options "--disable-database" and "--with-fallbacks" for the "nano" package?
 > I built a "nano" binary using buildroot to make my exploration of my
 > internet router a little easier, however when trying to use it I get
 > an "Error opening terminal" message. I found a Stackoverflow post
 > (https://stackoverflow.com/questions/53320009/error-opening-terminal-vt100-while-running-a-binary-with-ncurses-on-arm)
 > that suggests I need to build "nano" using the above-mentioned options
 > so that terminal information is baked-in to the nano binary instead of
 > it trying to read that from disk.

 > However I don't see an obvious way to do this from buildroot's menuconfig?

Not directly. Notice that this is configure options for ncurses, not for
nano.

For a quick test you can you naturally just adjust
package/ncurses/ncurses.mk.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
