Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C033EC001DE
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 765C560A9C;
	Sun, 30 Jul 2023 10:25:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 765C560A9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ids41aPjWteD; Sun, 30 Jul 2023 10:25:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABD9960ACA;
	Sun, 30 Jul 2023 10:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABD9960ACA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45F481BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FC3560A8C
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FC3560A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nNMhdD_Jwwg8 for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:25:04 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0944E60736
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:25:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0944E60736
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60E2960002;
 Sun, 30 Jul 2023 10:25:00 +0000 (UTC)
Date: Sun, 30 Jul 2023 12:24:59 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230730122459.77ef4c0e@windsurf>
In-Reply-To: <20230708200447.3919009-1-bernd@kuhls.net>
References: <20230708200447.3919009-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690712700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q55gSAbHdAn1RH7JSzcPf7ByhRnxZDVYDj5EDUJ/iPk=;
 b=OLtSMtYTGmhkR1p7MFz/NVwxfbTmLzY7nzTy/YC3UWKgIuJc5ybYPIFCqHBbPmWxKkrMxV
 xw3AdWS+YPfryO9cDBcCilETpmMSMTIxJPw0mpGn3qrrvhGVccO8+S8zH9u7MBpVoHsZ2/
 tCaFEajI3rn6m+T6bxW1Hj5vEa6CuVxv2NxDUF7kf5f9jzVPiMdNeArU3LHq8JT5ls2pkJ
 7iXAkRFlQ/Q194etsgM0LD0mamG4pBQJnd7dLtgQ7aa6jpvQdkbm1lt8kJdTxDQAjeV6F0
 ccNxACgdty9BpGwGO1v+POwdV/tAENx4WXE4GynCWvY3lyR9v1r+A1Bt4ZXEcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OLtSMtYT
Subject: Re: [Buildroot] [PATCH 1/7] package/libde265: new package
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
Cc: Pieter De Gendt <pieter.degendt@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  8 Jul 2023 22:04:41 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Optional dependency of the upcoming libheif package.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  DEVELOPERS                     |  1 +
>  package/Config.in              |  1 +
>  package/libde265/Config.in     | 12 ++++++++++++
>  package/libde265/libde265.hash |  3 +++
>  package/libde265/libde265.mk   | 13 +++++++++++++
>  5 files changed, 30 insertions(+)
>  create mode 100644 package/libde265/Config.in
>  create mode 100644 package/libde265/libde265.hash
>  create mode 100644 package/libde265/libde265.mk

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
