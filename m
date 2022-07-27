Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BC8C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0E53819E6;
	Wed, 27 Jul 2022 07:33:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0E53819E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id exanOge3eH5H; Wed, 27 Jul 2022 07:33:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F17BD81959;
	Wed, 27 Jul 2022 07:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F17BD81959
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C42811BF3A0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91634403E2
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91634403E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y6MQx63-XikV for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:32:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC45B401C5
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC45B401C5
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:32:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4148D24000C;
 Wed, 27 Jul 2022 07:32:51 +0000 (UTC)
Date: Wed, 27 Jul 2022 09:32:50 +0200
To: Gilles Talis <gilles.talis@gmail.com>
Message-ID: <20220727093250.170ef87a@windsurf>
In-Reply-To: <20220116175320.453041-2-gilles.talis@gmail.com>
References: <20220116175320.453041-1-gilles.talis@gmail.com>
 <20220116175320.453041-2-gilles.talis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658907172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rT0qnr+SWxn6Vh1bnqcPG5fQ1AvtZm1mIuH3rKlYA60=;
 b=h8ZmPu96bHXa/dmB2WXPn89PYhKcwAh3id8WtTPTgn7HIXQb8ZdRL/3qBE8t3wfRj8ldV6
 0Vp5W3A5+G5kOGBuQ7ZnWp5q3AJYENHQsLS4NgfDTulPETa+eMLlYfrci8F7rC55gEem2w
 oaPQFS6vyiDIEaD2i8zGR3GRF1uJE3s4OXSgBBZtpsvA9Hrf/CJBt2zpr5c4jevuKmWopM
 iRj0D9+Sd8Bh7iiDZQTINAfNhuq7P1SDUvEH4+l6TqVX8FDNyhyo0xWOV0g+NoR+p1DrdO
 F2oBGRy9sQX2+VoSmsBu77CrBOigqoeZvYKXyGIJ4fk1Bh4B/CMg6QFeeZydSw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h8ZmPu96
Subject: Re: [Buildroot] [PATCH v2 2/2] package/clpeak: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Gilles,

On Sun, 16 Jan 2022 18:53:20 +0100
Gilles Talis <gilles.talis@gmail.com> wrote:

> clpeak is a tool that profiles OpenCL devices to find
> their peak capacities
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> ---
> v2:
>  - Added opencl-clhpp dependency

I have applied after updating to the slightly newer tagged release
1.1.2.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
