Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE63C0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 08:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63E85835ED;
	Sat, 29 Jul 2023 08:59:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63E85835ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4a8OP6Z80dA2; Sat, 29 Jul 2023 08:59:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BCC583A05;
	Sat, 29 Jul 2023 08:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BCC583A05
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C33F01BF2AF
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 08:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BBBE839DC
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 08:59:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BBBE839DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dx-37qpHqImm for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 08:59:33 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 202A983118
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 08:59:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 202A983118
Received: by mail.gandi.net (Postfix) with ESMTPSA id 090EFFF808;
 Sat, 29 Jul 2023 08:59:30 +0000 (UTC)
Date: Sat, 29 Jul 2023 10:59:29 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230729105929.1f20f0d8@windsurf>
In-Reply-To: <20230729041418.2490902-1-james.hilliard1@gmail.com>
References: <20230729041418.2490902-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690621171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lbddnhj4JIAORr7qgMVxau7L1i+ncLdvKUFsxpBCmUA=;
 b=BVFP8o8R72MLgB4Ml5ZSRTAz2/4XRXFzDxoNIctqzAHd5Q1y2hhEzvVgCTeNFcShk0zPNe
 kTp4OcyEKrbKi357g8PAL1S/8Wl1n/SjJ0QlvPhkJ5gcDI5wa3km337vjYZvR4Nwz3zjhW
 5AdJTtetGQeUFezfHHromXwAdGqQYChkCCqFqBkXLhacQOhak0EWjS5YkhQIYic8UhoH/6
 i219UlLWdhVB+2Vpt1jPWYx3xZpYPKVV3TCbYkdOMB3oxR1CoT6DYmd1mnQpQyAMNL0Nau
 5COclbGgneh1jg4Ye/UMkBOiaxa94StFsXLgDiPwQLtNkqX5j1X6rvdOJBmWAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BVFP8o8R
Subject: Re: [Buildroot] [PATCH 1/1] package/dbus: bump to version 1.14.8
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
Cc: Norbert Lange <nolange79@gmail.com>, "Yann E .
 MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 28 Jul 2023 22:14:18 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Also apply system.conf and session.conf updates to dbus-broker.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/dbus-broker/session.conf | 15 +++++++++++++++
>  package/dbus-broker/system.conf  | 25 ++++++++++++++++++++++---
>  package/dbus/dbus.hash           |  6 +++---
>  package/dbus/dbus.mk             |  3 ++-
>  4 files changed, 42 insertions(+), 7 deletions(-)

The explanation for the licence file hash change was missing, so I
added that and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
