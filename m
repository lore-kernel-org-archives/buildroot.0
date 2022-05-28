Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B604C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 09:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A97A1419AD;
	Sat, 28 May 2022 09:06:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ip3UMLYQYRjw; Sat, 28 May 2022 09:06:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F80140B1A;
	Sat, 28 May 2022 09:06:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6EF441BF5DA
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 09:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B3C2845F8
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 09:06:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vXKB_MEJa84e for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 09:06:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8079C845F3
 for <buildroot@buildroot.org>; Sat, 28 May 2022 09:06:06 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5E67B1BF208;
 Sat, 28 May 2022 09:06:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nusOY-0030LD-HD; Sat, 28 May 2022 11:06:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yannick Brosseau <yannick.brosseau@gmail.com>
References: <20220504205413.1219619-1-yannick.brosseau@gmail.com>
Date: Sat, 28 May 2022 11:06:02 +0200
In-Reply-To: <20220504205413.1219619-1-yannick.brosseau@gmail.com> (Yannick
 Brosseau's message of "Wed, 4 May 2022 16:54:13 -0400")
Message-ID: <878rqmc9hh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/openocd: Fix segfault when using
 ST-Link driver
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

>>>>> "Yannick" == Yannick Brosseau <yannick.brosseau@gmail.com> writes:

 > Recent changes in libusb have exposed a bug in OpenOCD which now crash when trying
 > to use the ST-Link driver.

 > Upstream has a fix as commit cff0e417da58adef1ceef9a63a99412c2cc87ff3. This add the commit
 > as a stand alone patch. The crash also happen on Linux, which was not mentionned in that
 > commit message.

 > Should be removed when OpenOCD is updated to a release newer than 0.11

 > Signed-off-by: Yannick Brosseau <yannick.brosseau@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
