Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D22EE7FF4
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 07:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D992740231;
	Mon, 11 Sep 2023 07:23:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D992740231
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sVUa8Ts1wbSc; Mon, 11 Sep 2023 07:23:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8B11401E7;
	Mon, 11 Sep 2023 07:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8B11401E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED7681BF3FB
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 07:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C662B817AD
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 07:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C662B817AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ibi4ypHlwZto for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 07:23:05 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6695817A8
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 07:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6695817A8
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6546240002;
 Mon, 11 Sep 2023 07:23:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qfbG7-00DAeV-UZ; Mon, 11 Sep 2023 09:22:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220409160921.GA3547512@scaer>
 <20221005091032.3014-2-br015@umbiko.net>
 <20230806214236.72d4cb2d@windsurf>
Date: Mon, 11 Sep 2023 09:22:59 +0200
In-Reply-To: <20230806214236.72d4cb2d@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sun, 6 Aug 2023 21:42:36 +0200")
Message-ID: <87tts1cgx8.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/4] package/mpd: fix reversed logic in
 tcp disable
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
Cc: Andreas Ziegler <br015@umbiko.net>, YANN E MORIN <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Hello Andreas,
 > On Wed,  5 Oct 2022 11:10:29 +0200
 > Andreas Ziegler <br015@umbiko.net> wrote:

 >> Signed-off-by: Andreas Ziegler <br015@umbiko.net>

 > I've extended this explanation with some details on when the issue was
 > introduced:

 >     package/mpd: fix reversed logic in tcp disable
    
 >     In commit 54b9008d482923131191da75f09966483f4ecac1 ("package/mpd: bump
 >     to version 0.21.11"), mpd was migrated from using the autotools build
 >     system to the meson build system.
    
 >     As part of this, the BR2_PACKAGE_MPD_TCP was incorrectly modified,
 >     leading BR2_PACKAGE_MPD_TCP disabled to actually enable TCP, and
 >     BR2_PACKAGE_MPD_TCP enabled to not explicitly enable TCP support.
    
 >     This commit fixes that by handling this option in the common way.
    
 >     Signed-off-by: Andreas Ziegler <br015@umbiko.net>
 >     Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
