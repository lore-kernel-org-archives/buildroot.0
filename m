Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F527C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 08:47:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D36846113D
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 08:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D36846113D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E71D40264;
	Mon,  8 Nov 2021 08:47:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cds0Ea56isUp; Mon,  8 Nov 2021 08:47:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB9C240187;
	Mon,  8 Nov 2021 08:46:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A0351BF393
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 08:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 885B7606D5
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 08:46:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AyRFzwPTj9Yp for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 08:46:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94825606CB
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 08:46:56 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 6C65C240012;
 Mon,  8 Nov 2021 08:46:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mk0In-0001nj-P6; Mon, 08 Nov 2021 09:46:53 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20211106172956.9193-1-peter@korsgaard.com>
Date: Mon, 08 Nov 2021 09:46:53 +0100
In-Reply-To: <20211106172956.9193-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 6 Nov 2021 18:29:54 +0100")
Message-ID: <8735o7826a.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/2] boot/sun20i-d1-spl: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, samuel@sholland.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > U-Boot does not yet have SPL code to initialize the DDR controller on the
 > Allwinner D1 - So instead package the sun20i-d1-spl bootloader, which is
 > based on boot0 from the Allwinner BSP with some modifications to build it
 > separately from the BSP and boot mainline U-Boot as explained on the
 > linux-sunxi wiki:

 > https://linux-sunxi.org/Allwinner_Nezha

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 >  Changes since v1:
 >  - None

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
