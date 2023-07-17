Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DB3EB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 11:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0562681E0B;
	Mon, 17 Jul 2023 11:06:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0562681E0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w4yAySr3xZNo; Mon, 17 Jul 2023 11:06:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CC1B81D4D;
	Mon, 17 Jul 2023 11:06:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CC1B81D4D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A7991BF352
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 11:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3445B60B69
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 11:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3445B60B69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1lAvF3jDYwYh for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 11:06:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3076E60B8A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3076E60B8A
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 11:06:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C4A5E240003;
 Mon, 17 Jul 2023 11:06:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qLM3U-00DMWm-OS; Mon, 17 Jul 2023 13:06:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230702150232.3414717-1-bernd@kuhls.net>
 <20230703220244.156783b7@windsurf>
Date: Mon, 17 Jul 2023 13:06:16 +0200
In-Reply-To: <20230703220244.156783b7@windsurf> (Thomas Petazzoni via
 buildroot's message of "Mon, 3 Jul 2023 22:02:44 +0200")
Message-ID: <87351mbxw7.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/sconeserver: re-add dependency
 to pcre
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Sun,  2 Jul 2023 17:02:32 +0200
 > Bernd Kuhls <bernd@kuhls.net> wrote:

 >> While pcre was an optional dependency with autoconf [1] upstream removed
 >> the HAVE_LIBPCRE defines with the introduction of cmake [2] breaking the
 >> build without pcre after buildroot switched to cmake with commit
 >> 8b42bbf30a914b0fd40a4518e61ac7bc511a7deb.
 >> 
 >> Fixes:
 >> http://autobuild.buildroot.net/results/a15/a15db87c8cec195905b6bcc2cbd3da59ad8aa3b9/
 >> 
 >> [1] https://github.com/sconemad/sconeserver/commit/98ec61436c9ea68ffe2d70a818c1175dcafa2a79
 >> [2] https://github.com/sconemad/sconeserver/commit/0cb655721d7f8aa5d6d14fc1dfce18c518ce2419
 >> 
 >> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 >> ---
 >> package/sconeserver/Config.in      | 1 +
 >> package/sconeserver/sconeserver.mk | 2 +-
 >> 2 files changed, 2 insertions(+), 1 deletion(-)

 > Applied to master, thanks.

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
