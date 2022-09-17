Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B90DECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 12:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25A7C6111A;
	Sat, 17 Sep 2022 12:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25A7C6111A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SQEJ6mtORZAY; Sat, 17 Sep 2022 12:32:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DF7E6110D;
	Sat, 17 Sep 2022 12:32:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DF7E6110D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E8BEF1BF48C
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC13341DA1
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC13341DA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dXHX-ro_GnzB for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 12:32:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 237A741D9F
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 237A741D9F
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 12:32:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DA2EF100004;
 Sat, 17 Sep 2022 12:32:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZX02-009H77-Ip; Sat, 17 Sep 2022 14:32:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bram Vlerick <bram.vlerick@openpixelsystems.org>
References: <20220816120718.3021545-1-bram.vlerick@openpixelsystems.org>
Date: Sat, 17 Sep 2022 14:32:46 +0200
In-Reply-To: <20220816120718.3021545-1-bram.vlerick@openpixelsystems.org>
 (Bram Vlerick's message of "Tue, 16 Aug 2022 14:07:17 +0200")
Message-ID: <87h7162nbl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] board/freescale/common/imx: align
 u-boot-spl to 4 bytes
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bram" == Bram Vlerick <bram.vlerick@openpixelsystems.org> writes:

 > When enable DM for SPL binary, the DTB part of SPL may not 4 bytes aligned.
 > If u-boot-spl is not aligned, the offset of the DDR firmware is not 4
 > byte aligned when u-boot-spl-ddr.bin is created. This causes the ddr
 > firmware to not be loaded correctly at boot.

 > See imx-mkimage commit bba038d893046b44683182dba540f104dab80fe7 for
 > implementation in imx-mkimage.

 > Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
