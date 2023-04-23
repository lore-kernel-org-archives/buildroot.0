Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0F4C77B73
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 10:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0B8240B6F;
	Sun, 23 Apr 2023 10:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0B8240B6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EA0qSZvXGUuE; Sun, 23 Apr 2023 10:43:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 197284059F;
	Sun, 23 Apr 2023 10:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 197284059F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 975BE1C2B5C
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 10:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70A2A4059F
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 10:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70A2A4059F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0NcXeHT1y31n for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 10:43:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E06D400A4
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E06D400A4
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 10:43:00 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 289241BF207;
 Sun, 23 Apr 2023 10:42:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pqXBJ-002bSx-83; Sun, 23 Apr 2023 12:42:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20230422133607.607954-1-dario.binacchi@amarulasolutions.com>
Date: Sun, 23 Apr 2023 12:42:57 +0200
In-Reply-To: <20230422133607.607954-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Sat, 22 Apr 2023 15:36:07 +0200")
Message-ID: <874jp66fri.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/openocd: add the eCos exception
 to the GPL-2.0+ license
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > As noted by Yann E. MORIN in [1] only the src/flash/nand/ecc.c file
 > refers to the eCos license.

 > The SPDX identifier for that file is:
 > SPDX-License-Identifier: GPL-2.0-or-later WITH eCos-exception-2.0

 > The file is part of the openocd executable via libopenocd.la, which being
 > a static library it is not installed.

 > Based on this, becomes more natural to associate the eCos exception with
 > the GPL 2.0+ license, rather than considering it separately as a license.

 > [1] https://patchwork.ozlabs.org/project/buildroot/patch/20230411203930.2455301-1-dario.binacchi@amarulasolutions.com/
 > Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
