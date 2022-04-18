Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50D8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Apr 2022 20:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DB2860BF8;
	Mon, 18 Apr 2022 20:50:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MHSev7x16cEU; Mon, 18 Apr 2022 20:50:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9682B61260;
	Mon, 18 Apr 2022 20:50:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 775631BF28C
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 20:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D1F4410D6
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 20:50:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cMlItnRuRO7c for <buildroot@lists.busybox.net>;
 Mon, 18 Apr 2022 20:50:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0ADDE410C1
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 20:50:13 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 835ABFF807;
 Mon, 18 Apr 2022 20:50:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ngYK1-00Gw5p-Ar; Mon, 18 Apr 2022 22:50:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: <Eugen.Hristev@microchip.com>
References: <87sfqd8eo9.fsf@dell.be.48ers.dk>
 <20220416113138.72159-1-Jason@zx2c4.com>
 <87bkx187ig.fsf@dell.be.48ers.dk>
 <0f4e63a3-6b82-aaf0-47af-54102e91ccfb@microchip.com>
Date: Mon, 18 Apr 2022 22:50:09 +0200
In-Reply-To: <0f4e63a3-6b82-aaf0-47af-54102e91ccfb@microchip.com> (Eugen
 Hristev's message of "Mon, 18 Apr 2022 20:19:13 +0000")
Message-ID: <874k2q6rr2.fsf@dell.be.48ers.dk>
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
Cc: Jason@zx2c4.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>>   <Eugen.Hristev@microchip.com> writes:

 > On 4/16/22 4:47 PM, Peter Korsgaard wrote:
 >>>>>>> "Jason" == Jason A Donenfeld <Jason@zx2c4.com> writes:
 >> 
 >> > By returning a failure in the event that the initial seed doesn't exist,
 >> > we'd then skip creating a new seed, which means we'd never in fact have
 >> > an initial seed, and this script is therefore useless. Fix this by
 >> > checking for the existence of the seed file first, and just returning 0
 >> > if it's not there.
 >> 
 >> > Reported-by: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
 >> > Reported-by: Eugen Hristev <Eugen.Hristev@microchip.com>
 >> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
 >> 
 >> Committed, thanks.
 >> 
 >> --
 >> Bye, Peter Korsgaard
 >> 


 > Hi Jason,

 > I cherry-picked this patch to my 2022.02.1 tree, and rebuilt my images.
 > I still see this message at boot time :

 > "Initializing random number generator: FAIL"

 > Any ideas about what I could try ?

Not really. If you see the message, then that must mean that
/var/lib/random-seed exists in your rootfs. Can you provide some more
details about your setup, E.G. what kind of rootfs file system, is it
mounted R/W, what platform, kernel version?

What error message do you get from dd if you run the dd to /dev/urandom
statement manually?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
