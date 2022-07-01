Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEB6C433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Jul 2022 14:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C87084712;
	Fri,  1 Jul 2022 14:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C87084712
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mamXVGrNtEpg; Fri,  1 Jul 2022 14:27:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4864184725;
	Fri,  1 Jul 2022 14:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4864184725
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 27F101BF59E
 for <buildroot@lists.busybox.net>; Fri,  1 Jul 2022 14:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FF0761351
 for <buildroot@lists.busybox.net>; Fri,  1 Jul 2022 14:27:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FF0761351
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VQspQmmkg_OL for <buildroot@lists.busybox.net>;
 Fri,  1 Jul 2022 14:27:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBC7C61032
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBC7C61032
 for <buildroot@buildroot.org>; Fri,  1 Jul 2022 14:27:11 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A785DFF817;
 Fri,  1 Jul 2022 14:27:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1o7Hbu-00FrOT-Nx; Fri, 01 Jul 2022 16:27:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
References: <20220517183842.1389395-1-neal.frager@amd.com>
Date: Fri, 01 Jul 2022 16:27:06 +0200
In-Reply-To: <20220517183842.1389395-1-neal.frager@amd.com> (Neal Frager's
 message of "Tue, 17 May 2022 12:38:40 -0600")
Message-ID: <87mtds7vt1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v4 1/3] board/zynqmp/kria/readme.txt:
 improve documentation for qspi programming
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
Cc: luca@lucaceresoli.net, giulio.benetti@benettiengineering.com,
 wesley@sonifex.co.uk, michal.simek@amd.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > This patch improves the documentation for kria k26 som qspi programming.
 > Signed-off-by: Neal Frager <neal.frager@amd.com>
 > ---
 V1-> V2:
 V2-> V3:
 >   - fixes boot.bin file name spelling error
 V3-> V4:
 >   - improved documentation to use $filesize
 > ---
 >  board/zynqmp/kria/readme.txt | 28 ++++++++++++++++++++++------
 >  1 file changed, 22 insertions(+), 6 deletions(-)

 > diff --git a/board/zynqmp/kria/readme.txt b/board/zynqmp/kria/readme.txt
 > index a3a4b5e65a..977e88491c 100644
 > --- a/board/zynqmp/kria/readme.txt
 > +++ b/board/zynqmp/kria/readme.txt
 > @@ -56,23 +56,39 @@ Where 'sdX' is the device node of the SD.
 
 >  Eject the SD card, insert it in the board, and power it up.
 
 > -How to write the boot.bn to QSPI boot flash
 > -===========================================
 > +How to write the boot.bin and u-boot.itb to QSPI boot flash
 > +==========================================================

The "the" IMHO sounds odd, so I dropped it.


 >  The Kria SOMs are preconfigured to boot initially from QSPI.
 >  This makes these boards different from other ZynqMP boards
 > -in that the boot.bin needs to be flashed into the QSPI boot
 > -flash such that the U-Boot SPL can then load all of the
 > -remaining images from the SD card.
 > +in that the boot.bin and u-boot.itb files need to be flashed 
 > +into the QSPI boot flash such that U-Boot can then load all 

And the trailing spaces here.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
