Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1528AEE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 07:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA7DA4058C;
	Mon, 11 Sep 2023 07:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA7DA4058C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id egwPMxggroJW; Mon, 11 Sep 2023 07:23:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5A7B400EA;
	Mon, 11 Sep 2023 07:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5A7B400EA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 035041BF3FB
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 07:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEF39817AE
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 07:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEF39817AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ajJ9yhbSTuIH for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 07:23:22 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D868817AD
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 07:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D868817AD
Received: by mail.gandi.net (Postfix) with ESMTPSA id C88C840008;
 Mon, 11 Sep 2023 07:23:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qfbGP-00DAfC-RF; Mon, 11 Sep 2023 09:23:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Andreas Ziegler <br015@umbiko.net>
References: <20220409160921.GA3547512@scaer>
 <20221005091032.3014-4-br015@umbiko.net>
Date: Mon, 11 Sep 2023 09:23:17 +0200
In-Reply-To: <20221005091032.3014-4-br015@umbiko.net> (Andreas Ziegler's
 message of "Wed, 5 Oct 2022 11:10:31 +0200")
Message-ID: <87leddcgwq.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 3/4] package/mpd: introduce id3tag
 feature dependency
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
Cc: YANN E MORIN <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Andreas" == Andreas Ziegler <br015@umbiko.net> writes:

 > id3tag is a sub-feature that is needed to extract information from mp3 files.
 > It selects the corresponding library and handles config settings. Two other
 > features need this sub-feature, but handle all library selections themselves
 > and omit enabling the id3tag feature. In consequence, users have to remember
 > to select both mp3 library and id3tag, otherwise the mpd executable will not
 > process mp3 files.

 > Reflect feature dependency in mpd Config.in to make id3tag selection automatic.

 > Signed-off-by: Andreas Ziegler <br015@umbiko.net>
 > ---
 > Changes v1 -> v2:
 >  - make this a separate patch 

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
