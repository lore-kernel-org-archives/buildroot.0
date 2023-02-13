Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE71CC64EC7
	for <buildroot@archiver.kernel.org>; Mon, 13 Feb 2023 14:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3067A61038;
	Mon, 13 Feb 2023 14:54:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3067A61038
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S25XjY_5yV76; Mon, 13 Feb 2023 14:54:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C043460FE0;
	Mon, 13 Feb 2023 14:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C043460FE0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6CACC1BF349
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 14:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 467EA8140F
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 14:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 467EA8140F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PW75rMwicH0D for <buildroot@lists.busybox.net>;
 Mon, 13 Feb 2023 14:54:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 039F78140D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 039F78140D
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 14:54:03 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 36056240024;
 Mon, 13 Feb 2023 14:53:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pRaDB-002Yk5-7S; Mon, 13 Feb 2023 15:53:45 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
References: <20230124103149.588288-1-fido_max@inbox.ru>
Date: Mon, 13 Feb 2023 15:53:45 +0100
In-Reply-To: <20230124103149.588288-1-fido_max@inbox.ru> (Maxim Kochetkov via
 buildroot's message of "Tue, 24 Jan 2023 13:31:49 +0300")
Message-ID: <873579boqu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gdal: switch to cmake build
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
Cc: dmrauh@posteo.de, Maxim Kochetkov <fido_max@inbox.ru>,
 himaralonso+buildroot@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Maxim" == Maxim Kochetkov via buildroot <buildroot@buildroot.org> writes:

 > GDAL autoconf has wrong libgeotiff detection. It uses host's
 > library if installed instead of buildroot one.
 > Modern versions of gdal have no autoconf build scripts, just cmake only.

 > So move to cmake build variant.

 > Fixes: https://bugs.busybox.net/show_bug.cgi?id=15281
 > Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Committed to 2022.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
