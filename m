Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED94C433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 13:35:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 722ED61101
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 13:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 722ED61101
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C3F761591;
	Fri,  5 Nov 2021 13:35:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fVgz7TTgt540; Fri,  5 Nov 2021 13:35:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B82461584;
	Fri,  5 Nov 2021 13:35:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 941E71BF304
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 13:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 904C240487
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 13:35:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hjRyL6Uq18zU for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 13:35:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 580DA4018B
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 13:35:21 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 147791C0013;
 Fri,  5 Nov 2021 13:35:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mizNH-0003V0-Ai; Fri, 05 Nov 2021 14:35:19 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20211105123848.6356-2-peter@korsgaard.com>
 <9DC7B415-F1A7-4D59-968C-EDD367DD2C16@benettiengineering.com>
Date: Fri, 05 Nov 2021 14:35:19 +0100
In-Reply-To: <9DC7B415-F1A7-4D59-968C-EDD367DD2C16@benettiengineering.com>
 (Giulio Benetti's message of "Fri, 5 Nov 2021 14:28:46 +0100")
Message-ID: <87lf22iv3c.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] configs/nezha_defconfig: new defconfig
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
Cc: samuel@sholland.org, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

Hi,

 >> +image sdcard.img {
 >> +    hdimage {
 >> +    }
 >> +
 >> +    partition boot0-1 {
 >> +        in-partition-table = "no"
 >> +        image = "boot0_sdcard_sun20iw1p1.bin"
 >> +        offset = 8192

 > Can you please use 8K here ^^^

 >> +    }
 >> +
 >> +    partition boot0-2 {
 >> +        in-partition-table = "no"
 >> +        image = "boot0_sdcard_sun20iw1p1.bin"
 >> +        offset = 131072

 > 128K here etc.

 > I find it to be easier to read.

Ok. The "documentation" actually lists this in 512b sectors, but I don't
think genimage has something nice to handle this:

https://linux-sunxi.org/Allwinner_Nezha


 > I would go for changing every .cfg file in Buildroot and submit a
 > patchset for this to improve readibility. What do you all think about
 > this?

Fine by me.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
