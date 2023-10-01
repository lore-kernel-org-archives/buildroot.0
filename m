Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445C0E748ED
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 09:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFAAD83E97;
	Sun,  1 Oct 2023 09:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFAAD83E97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id miBdIdP4DaWD; Sun,  1 Oct 2023 09:48:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5580583EFE;
	Sun,  1 Oct 2023 09:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5580583EFE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77D0C1BF342
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 09:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E1BA83EFE
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 09:48:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E1BA83EFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ktwsykioDKL for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 09:48:43 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF53583E97
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 09:48:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF53583E97
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8086A240002;
 Sun,  1 Oct 2023 09:48:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qmt42-00GHZQ-Qc; Sun, 01 Oct 2023 11:48:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Jens Maus via buildroot <buildroot@buildroot.org>
References: <20230923100035.1504933-1-mail@jens-maus.de>
Date: Sun, 01 Oct 2023 11:48:38 +0200
In-Reply-To: <20230923100035.1504933-1-mail@jens-maus.de> (Jens Maus via
 buildroot's message of "Sat, 23 Sep 2023 12:00:35 +0200")
Message-ID: <87bkdi7jwp.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/linux-tools: fix SysV init script
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, Jens Maus <mail@jens-maus.de>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Jens" == Jens Maus via buildroot <buildroot@buildroot.org> writes:

 > This commit fixes the S10hyperv SysV init script which expects binaries
 > to be locate in /sbin while they are installed in /usr/sbin. Please
 > note, that the systemd init scripts correctly reference them.
 > Furthermore, the SysV init script did not check for an actual HyperV
 > environment to be present, which is also corrected. In addition, this
 > commit also fixes check-package warnings regarding a missing DAEMON
 > definition.

 > Signed-off-by: Jens Maus <mail@jens-maus.de>
 > ---
 >  package/linux-tools/S10hyperv | 8 ++++++--
 >  1 file changed, 6 insertions(+), 2 deletions(-)

This means we can now drop the entry in .checkpackageignore. Committed
with that included, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
