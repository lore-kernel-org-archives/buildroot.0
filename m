Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127C9EE49A4
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 21:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39C2140453;
	Sun, 10 Sep 2023 21:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39C2140453
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IrQ58t7teAW9; Sun, 10 Sep 2023 21:36:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A9FC40278;
	Sun, 10 Sep 2023 21:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A9FC40278
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B75B71BF573
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D47660B06
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D47660B06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7V3mv3v0ciuj for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 21:36:29 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95BBD606EC
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 21:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95BBD606EC
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26C16C0002;
 Sun, 10 Sep 2023 21:36:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qfS6T-00Ctji-8f; Sun, 10 Sep 2023 23:36:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230802203146.765631-1-bernd@kuhls.net>
 <20230806141525.3c03a4e0@windsurf>
Date: Sun, 10 Sep 2023 23:36:25 +0200
In-Reply-To: <20230806141525.3c03a4e0@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sun, 6 Aug 2023 14:15:25 +0200")
Message-ID: <87jzsxemna.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] boot/at91dataflashboot: force arm mode
 instead of Thumb mode
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Hello Bernd,
 > On Wed,  2 Aug 2023 22:31:46 +0200
 > Bernd Kuhls <bernd@kuhls.net> wrote:

 >> Fixes:
 >> http://autobuild.buildroot.net/results/68b/68bf2291201ef1882d8e8d3eca2b1a5ad731e4b0/
 >> 
 >> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 >> ---
 >> boot/at91dataflashboot/at91dataflashboot.mk | 7 ++++++-
 >> 1 file changed, 6 insertions(+), 1 deletion(-)

 > You forgot to explain in the commit since when the issue has been
 > occurring. So I've added some explanation about this in the commit log
 > when applying:

 >   https://gitlab.com/buildroot.org/buildroot/-/commit/07acc00add7ac09114f3c01b85d794a31c68229c

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
