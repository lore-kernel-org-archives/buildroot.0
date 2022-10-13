Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E509DC4332F
	for <buildroot@archiver.kernel.org>; Thu, 13 Oct 2022 12:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44B7841C66;
	Thu, 13 Oct 2022 12:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44B7841C66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tmbXh0Jw8k6k; Thu, 13 Oct 2022 12:05:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4545B418E8;
	Thu, 13 Oct 2022 12:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4545B418E8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8CB4A1BF473
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 12:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 507FE40391
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 12:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 507FE40391
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hsPu5V68qz4H for <buildroot@lists.busybox.net>;
 Thu, 13 Oct 2022 12:05:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9D1B40390
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9D1B40390
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 12:05:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6B9C2C0019;
 Thu, 13 Oct 2022 12:05:15 +0000 (UTC)
Date: Thu, 13 Oct 2022 14:05:14 +0200
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Message-ID: <20221013140514.7d88a068@windsurf>
In-Reply-To: <aa0c37c9-4a9c-ec68-404e-30c64d4d57c4@opensource.wdc.com>
References: <20221013041616.491620-1-damien.lemoal@opensource.wdc.com>
 <20221013083952.145dbb8f@windsurf>
 <aa0c37c9-4a9c-ec68-404e-30c64d4d57c4@opensource.wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665662717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J1+trLLO4OtZLAE3s1o4Cxu9/oOXa1A2Wfl28OfIT5E=;
 b=TKA+oXyPmpOpID4apUvFglgiQOuFsUmdrcsY5/ZTEbuECI9KBYTMoPbFo+2Ujl1ujb2iQD
 eNogOPlOFAh0SlrUVqElz2D2+7ZrOSou454KDc5TfYoLypwtMQQ1JZb0lCwAX8dnb0rhTe
 xG+qPQDlMsx2khUAMK4qkIFRoe25eqwN0RmR1mNUnxAviEzzhhbJX0F0rFb84h97D73Wpt
 vRy1LOCiQcEJItpc2GsBkOnlSGBwX6knDU6ttzVp5HsQfNQb7BM/sKfPov2Cbkneev4929
 uZr3amIqaqelkQs55+ZFLCbVmWt9n3+m9BVAzRzrtp7fyC198pHwVL24Urbzkw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TKA+oXyP
Subject: Re: [Buildroot] [PATCH] configs/sipeed_*_sdcard: Add dependency on
 host-openssl
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 13 Oct 2022 16:57:58 +0900
Damien Le Moal <damien.lemoal@opensource.wdc.com> wrote:

> Done. I am not sure about the proper format though. I copied similar references
> I saw in git log. Please let me know if this needs a special format.

The format you have used is perfect, it follows what we normally do.
Thanks for the v2!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
