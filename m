Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35616C678DB
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 14:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE64281AF5;
	Sun,  5 Mar 2023 14:25:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE64281AF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id urdhS75G1bxw; Sun,  5 Mar 2023 14:25:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBF2F81A81;
	Sun,  5 Mar 2023 14:24:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBF2F81A81
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 589891BF41B
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 14:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32BCA60BEB
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 14:24:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32BCA60BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9gWKm8a1f0aZ for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 14:24:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFA8E60644
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BFA8E60644
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 14:24:56 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8801B1C0002;
 Sun,  5 Mar 2023 14:24:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pYpIA-001WMS-IP; Sun, 05 Mar 2023 15:24:50 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
References: <20230304221145.3222530-1-aperez@igalia.com>
 <20230305005158.GC46585@igalia.com>
Date: Sun, 05 Mar 2023 15:24:50 +0100
In-Reply-To: <20230305005158.GC46585@igalia.com> (Adrian Perez de Castro's
 message of "Sun, 5 Mar 2023 00:51:58 +0200")
Message-ID: <87wn3v9sy5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/wpebackend-fdo: bump to version
 1.14.1
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

 > Hi,
 > (Added Peter in CC.)

 > On Sun, 05 Mar 2023 00:11:45 +0200 Adrian Perez de Castro <aperez@igalia.com> wrote:

 >> This is a bugfix release which includes important fixes which solve a
 >> memory leak and hitting a situation where the output no longer gets
 >> updated. Release notes:
 >> 
 >> https://wpewebkit.org/release/wpebackend-fdo-1.14.1.html
 >> 
 >> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
 >> ---
 >> package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
 >> package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
 >> 2 files changed, 5 insertions(+), 5 deletions(-)

 > It would be *very desirable* to have this update in stable branches as well,
 > because this contains bug fixes which make WebKit{GTK,WPE} actually usable
 > in some cases (e.g. long running instances).

With stable branches I guess you mean our (late) upcoming LTS release,
2023.02? 2022.02.x and 2022.11.x use wpebackend-fdo 1.12.1, but they are
almost EOL.

Committed to master (which will become 2023.02), thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
