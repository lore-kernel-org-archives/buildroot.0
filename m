Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81BEC433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Apr 2022 13:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58CF3409E2;
	Sat, 16 Apr 2022 13:48:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R6LegDc6K-ZK; Sat, 16 Apr 2022 13:47:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71385409DD;
	Sat, 16 Apr 2022 13:47:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F3AB21BF589
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 13:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1ED260B9C
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 13:47:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2WnUs91djiYt for <buildroot@lists.busybox.net>;
 Sat, 16 Apr 2022 13:47:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 25D9B60B21
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 13:47:38 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 72E97100004;
 Sat, 16 Apr 2022 13:47:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nfilz-00EbDs-G6; Sat, 16 Apr 2022 15:47:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <87sfqd8eo9.fsf@dell.be.48ers.dk>
 <20220416113138.72159-1-Jason@zx2c4.com>
Date: Sat, 16 Apr 2022 15:47:35 +0200
In-Reply-To: <20220416113138.72159-1-Jason@zx2c4.com> (Jason A. Donenfeld's
 message of "Sat, 16 Apr 2022 13:31:38 +0200")
Message-ID: <87bkx187ig.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/urandom-scripts: do not seed if
 initial seed doesn't exist
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
Cc: Eugen Hristev <Eugen.Hristev@microchip.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Jason" == Jason A Donenfeld <Jason@zx2c4.com> writes:

 > By returning a failure in the event that the initial seed doesn't exist,
 > we'd then skip creating a new seed, which means we'd never in fact have
 > an initial seed, and this script is therefore useless. Fix this by
 > checking for the existence of the seed file first, and just returning 0
 > if it's not there.

 > Reported-by: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
 > Reported-by: Eugen Hristev <Eugen.Hristev@microchip.com>
 > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
