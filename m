Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79319C001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 11:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DEF281E0B;
	Sun,  6 Aug 2023 11:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DEF281E0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ldl9hX6hCMmY; Sun,  6 Aug 2023 11:45:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63F07813C7;
	Sun,  6 Aug 2023 11:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63F07813C7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 468A21BF47E
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 11:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D6D1600B6
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 11:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D6D1600B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hW3vxjcKs3iU for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 11:45:18 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E864B60672
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 11:45:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E864B60672
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85E8F20003;
 Sun,  6 Aug 2023 11:45:14 +0000 (UTC)
Date: Sun, 6 Aug 2023 13:45:13 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230806134513.7477f865@windsurf>
In-Reply-To: <20230804205401.3975960-1-dario.binacchi@amarulasolutions.com>
References: <20230804205401.3975960-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691322315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gXHZ6i6SznKFpT7ToS4dL8JVy5tuEWAW8xZsmx5NtgA=;
 b=SHBICnr1I9ulhdrg0J6Lh15FG+gXxakn9Q5pQPxqWEMjMihQR9NXCRaCLVaEI3/SQY1EQi
 NNXp/5E1BMFmbO0rFiHRCY+Nc7kILZig85bN651AZGlsk9Fa6nVPwwBxumBCrqAiwUxBWs
 YLUMygrf0NOgW839ANMynhj3+vJxn/03I1h9YBDZi6+u5zgkiXYpXBU2khJVgTis/NVrmH
 3vzAOyBZUbSMHZyrXvy13UHCV96ahAO5S3Q4jmwgcj20+aJzIdRMFNye47mzrzj26RzT5G
 NjU2dHFPh5pWCEMkpltD6tWJI0nj+AwWeNcqaMe8DxTc2pYMn1l8ByktjgLV9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SHBICnr1
Subject: Re: [Buildroot] [PATCH v2 1/1] package/arp-scan: allow to not
 install package data
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, "Yann E .
 MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  4 Aug 2023 22:54:01 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The patch adds an option that allows you to not install the data along
> with the binaries (less than 100kb), saving 1.4Mb of rootfs data.
> 
> By default, the data is installed for backward compatibility.
> 
> Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
