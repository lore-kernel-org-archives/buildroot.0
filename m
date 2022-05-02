Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA9DC433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 07:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84E38414E7;
	Mon,  2 May 2022 07:57:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uq613WQacUSv; Mon,  2 May 2022 07:57:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 570E1409D4;
	Mon,  2 May 2022 07:57:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9FAB41BF388
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 07:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C46641508
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 07:57:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fNNot_xS8GWA for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 07:57:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 74F9D414E5
 for <buildroot@buildroot.org>; Mon,  2 May 2022 07:57:47 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3210B1BF20A;
 Mon,  2 May 2022 07:57:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nlQwA-009e2Q-5f; Mon, 02 May 2022 09:57:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <nealf@xilinx.com>
References: <20220408145531.1641356-1-neal.frager@amd.com>
 <23538a24-16fe-5302-0cba-c97e67a8ab97@mind.be>
 <SJ0PR02MB7758E25006ADC3AAA0346C73D7EE9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <299536D8-AC74-4B1B-AF56-FD5BA3619055@xilinx.com>
 <SJ0PR02MB7758B4305ECDB6A7F87B4692D7C19@SJ0PR02MB7758.namprd02.prod.outlook.com>
Date: Mon, 02 May 2022 09:57:42 +0200
In-Reply-To: <SJ0PR02MB7758B4305ECDB6A7F87B4692D7C19@SJ0PR02MB7758.namprd02.prod.outlook.com>
 (Neal Frager's message of "Mon, 2 May 2022 07:43:57 +0000")
Message-ID: <878rrk5pu1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/4] configs/zynq_zc706_defconfig: bump
 to Xilinx 2021.2
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
Cc: Neal Frager <neal.frager@amd.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <nealf@xilinx.com> writes:

 > Hello everyone,
 > As Xilinx has just released our software version 2022.1, I am going to
 > submit a new patch set bumping the zynq defconfigs to 2022.1 instead
 > of 2021.2.

 > Based on the feedback, I will keep the defconfigs using tarballs
 > instead of git cloning.  I plan to migrate the zynqmp defconfigs to
 > tarballs as well.

 > Do not hesitate if you have any additional feedback or questions.

Thanks, sorry I didn't get back to you.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
