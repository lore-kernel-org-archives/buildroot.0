Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044D7EE49A4
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 21:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85246404B2;
	Sun, 10 Sep 2023 21:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85246404B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U3eQxdjYtMIS; Sun, 10 Sep 2023 21:40:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E35C340232;
	Sun, 10 Sep 2023 21:40:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E35C340232
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E37D1BF573
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC28E40232
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:40:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC28E40232
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rk-wiXAq21TN for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 21:40:31 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 385BA400DD
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 21:40:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 385BA400DD
Received: by mail.gandi.net (Postfix) with ESMTPSA id D6B1C1BF203;
 Sun, 10 Sep 2023 21:40:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qfSAN-00CuHO-Sc; Sun, 10 Sep 2023 23:40:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230804062006.2398819-1-neal.frager@amd.com>
 <20230806142628.254749aa@windsurf>
Date: Sun, 10 Sep 2023 23:40:27 +0200
In-Reply-To: <20230806142628.254749aa@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sun, 6 Aug 2023 14:26:28 +0200")
Message-ID: <87fs3lemgk.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] board/versal: clean shellcheck issues
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
Cc: michal.simek@amd.com, luca.ceresoli@bootlin.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Fri, 4 Aug 2023 07:20:06 +0100
 > Neal Frager via buildroot <buildroot@buildroot.org> wrote:

 >> This patch cleans up the shellcheck issues in the versal post scripts.
 >> 
 >> Signed-off-by: Neal Frager <neal.frager@amd.com>
 >> ---
 V1-> V2:
 >> - Removed " from lines within the cat command as they are not needed
 >> to clear the shellcheck issues.
 >> ---
 >> .checkpackageignore        |  2 --
 >> board/versal/post-build.sh |  5 ++---
 >> board/versal/post-image.sh | 14 +++++++-------
 >> 3 files changed, 9 insertions(+), 12 deletions(-)

 > Applied to master, thanks.

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
