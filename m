Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B715C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 12:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C98FA83955;
	Fri, 10 Nov 2023 12:26:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C98FA83955
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xrDhJEWy1sUv; Fri, 10 Nov 2023 12:26:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 318F6821F6;
	Fri, 10 Nov 2023 12:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 318F6821F6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BD4B1BF37C
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 12:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 021C941937
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 12:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 021C941937
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NSLvYKa_rzqP for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 12:26:12 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35D8841EE7
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 12:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35D8841EE7
Received: by mail.gandi.net (Postfix) with ESMTPSA id 71E2620003
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 12:26:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r1QaP-003wgZ-31
 for buildroot@buildroot.org; Fri, 10 Nov 2023 13:26:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20231105183719.3811015-1-peter@korsgaard.com>
 <20231105183719.3811015-4-peter@korsgaard.com>
Date: Fri, 10 Nov 2023 13:26:09 +0100
In-Reply-To: <20231105183719.3811015-4-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 5 Nov 2023 19:37:19 +0100")
Message-ID: <87h6ltlrq6.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 4/4] configs/avenger96_defconfig: downgrade
 to TF-A v2.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Commit 27bf08e4addb78 (configs/avenger96_defconfig: bump ATF version to 2.9
 > for binutils 2.39+ support) bumped TF-A, but it unfortunately does not boot
 > and instead dies with a panic:

 > NOTICE:  CPU: STM32MP157AAC Rev.B
 > NOTICE:  Model: Arrow Electronics STM32MP157A Avenger96 board
 > ERROR:   nvmem node board_id not found
 > INFO:    PMIC version = 0x10
 > ERROR:   Product_below_2v5=1:
 > ERROR:          HSLVEN update is destructive,
 > ERROR:          no update as VDD > 2.7V
 > PANIC at PC : 0x2fff086f

 > Exception mode=0x00000016 at: 0x2fff086f

 > Instead use v2.5 to match the other stm32mp1 boards and use the same E=0
 > -Werror workaround.  The avenger95 support is unfortunately broken since
 > v2.3 with the introduction of authentication support, so add a patch to the
 > DTS to fix that.

 > Notice that the authentication support was reworked in v2.7 so it is skipped
 > for the mp157a variant used on the avenger96, so the patch is not upstreamable.

 > While we're at it, also drop the debug option for consistency with the other
 > boards.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
