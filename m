Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE1FC19F2B
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 20:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9560D401CC;
	Wed,  3 Aug 2022 20:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9560D401CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p_bzHD3uguNS; Wed,  3 Aug 2022 20:47:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C1DB40297;
	Wed,  3 Aug 2022 20:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C1DB40297
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 281D71BF3CA
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 022A7410AB
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 022A7410AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XOZmrz67aJ4g for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 20:46:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3500410A4
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3500410A4
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 20:46:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C32A560002;
 Wed,  3 Aug 2022 20:46:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oJLGO-0003gm-L8; Wed, 03 Aug 2022 22:46:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
References: <20220713132908.949744-1-aperez@igalia.com>
Date: Wed, 03 Aug 2022 22:46:44 +0200
In-Reply-To: <20220713132908.949744-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Wed, 13 Jul 2022 16:29:08 +0300")
Message-ID: <87y1w5rr63.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/webkitgtk: security bump to
 version 2.36.4
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

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Bugfix release, fixes a WebKitWebProcess leak, MPRIS/MediaSession
 > support, adds a missing ATSPI a11y interface, and security patches
 > for CVE-2022-22677 and CVE-2022-26710.

 > Release notes:

 >   https://webkitgtk.org/2022/07/05/webkitgtk2.36.4-released.html

 > Accompanying security advisory:

 >   https://webkitgtk.org/security/WSA-2022-0006.html

 > One patch is now included in the packaged release, and another with a
 > build fix imported, which is actually a revert of a patch that made it
 > into the release but can cause linking issues when using LTO.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
