Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5A7C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 12:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F01F40492;
	Mon,  4 Apr 2022 12:30:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5u0cpeZlXrGT; Mon,  4 Apr 2022 12:30:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87F7F403E7;
	Mon,  4 Apr 2022 12:30:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 01C231BF3D1
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E49B2403E7
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:30:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7754Ll6OFUtl for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 12:30:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB2FA401F2
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 12:30:26 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DAD9F100009;
 Mon,  4 Apr 2022 12:30:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nbLqe-005rVg-IB; Mon, 04 Apr 2022 14:30:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Quentin Schulz <foss+buildroot@0leil.net>
References: <20220328111413.1618964-1-foss+buildroot@0leil.net>
 <20220328111413.1618964-2-foss+buildroot@0leil.net>
Date: Mon, 04 Apr 2022 14:30:20 +0200
In-Reply-To: <20220328111413.1618964-2-foss+buildroot@0leil.net> (Quentin
 Schulz's message of "Mon, 28 Mar 2022 13:14:13 +0200")
Message-ID: <87h779115v.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/qt5wayland: fix compilation
 when libxkbcommon is disabled
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Quentin" == Quentin Schulz <foss+buildroot@0leil.net> writes:

 > From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
 > When libxkbcommon is disabled, QT_CONFIG(xkbcommon) is not defined which
 > means the variable and function pointer in this patch are compiled out
 > from the header, but the cpp code actually still made use of it. This
 > patch fixes the build issue when libxkbcommon package is not to be
 > built.

 > This patch was taken from (merged):
 > https://codereview.qt-project.org/c/qt/qtwayland/+/344916

 > Cc: Quentin Schulz <foss+buildroot@0leil.net>
 > Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
