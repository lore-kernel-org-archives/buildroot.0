Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B567C433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 13:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D300F60655;
	Sun, 30 Jan 2022 13:53:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K4xPE2KD00sW; Sun, 30 Jan 2022 13:53:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F5FF607F9;
	Sun, 30 Jan 2022 13:53:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 691871BF592
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 13:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5656F408A1
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 13:53:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id txcgzkuttOTg for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 13:53:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D108140296
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 13:53:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7AC08E0004;
 Sun, 30 Jan 2022 13:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643550806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bhj2aqMLDIrK2KFDvtvQlOdSr0cl2kxZY07yI1WFFxI=;
 b=lBm7R+2r1s/QNIgW9Lc3CyVHSa2Ywd0Ylzj6BmnD5vFkYlnn8LyiGiJjQ9rifkd1QKs2tZ
 Uwm54dfCCJ4QrLLkQkaCp9TiTRHj0rpEISo0vlzm6g7cxdIG0j4YRJ7vfLIGzskUYRWKhW
 IIqKnxfALxFeOIEFhV7qL90Y2PMoY8Vc0GTxaPoHTgK+2V0dcJlU0b3MB9cIG64jtVxkNE
 qKyZTId+ZAP0MqtnQ7/Y5Eoj6PqG4HucPYl9YvtrhXOnMxylhsm2MqDsHDCquwsWXKOQpn
 ezXwAEOPM50Vn5XIR3IZQdUHdO+p/m5GT82jjl2pdrGHn3YSTqyuhy/C8dZsYg==
Date: Sun, 30 Jan 2022 14:53:25 +0100
To: yegorslists--- via buildroot <buildroot@buildroot.org>
Message-ID: <20220130145325.733f8d3d@windsurf>
In-Reply-To: <20220130105116.18458-1-yegorslists@googlemail.com>
References: <20220130105116.18458-1-yegorslists@googlemail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add entry for hostapd and
 wpa_supplicant to Yegor Yefremov
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 30 Jan 2022 11:51:16 +0100
yegorslists--- via buildroot <buildroot@buildroot.org> wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  DEVELOPERS | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
