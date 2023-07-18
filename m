Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD847EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 21:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6732D60D64;
	Tue, 18 Jul 2023 21:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6732D60D64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j6_k0JdtUY2P; Tue, 18 Jul 2023 21:01:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B279C60B4C;
	Tue, 18 Jul 2023 21:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B279C60B4C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B60201BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 750BC4058D
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 750BC4058D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D6OVJWklRfyr for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 21:01:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 579F640280
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 579F640280
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 21:01:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 31219240005;
 Tue, 18 Jul 2023 21:01:06 +0000 (UTC)
Date: Tue, 18 Jul 2023 23:01:05 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230718230105.44470675@windsurf>
In-Reply-To: <20230718205910.2667726-1-bernd@kuhls.net>
References: <20230718205910.2667726-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689714067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BEEhIBCHOhr1EC/mBYtnEOyL4TInZ6FFqGOFubGt8DM=;
 b=Rgg2p63rEqA9qTvH4btXNjqS0FtroVZJhq9v7szRHZO0neby6NfFUcHWfd9TCOn3Kv6E2h
 XvJ0WFEkCPyDTS90SlTC1AJ5pw9fhKdRkfGt443A/ioxqBnLv8RR4h7A0EDkdHiMcsZiaz
 9Ze9h+CIo3bgVLAGTzi98wGdohK1OPINaSmWW+JHLitti1Lcg1fJg+awxJIDZ6AUydrnOu
 ueUk4vSkZwY8nyabO+LVDGinNQ0Imx4lU7JnSdh+gJrDEGcPXAHzFfZBHppEHVjnVr00ME
 4xphBkStLCuU6t+liUkYMQAgtWrtp4pSK8Rt8kwo1/ZbNDknBE6/YdCcOoPKPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Rgg2p63r
Subject: Re: [Buildroot] [PATCH v2 1/3] package/cmake: bump version to 3.26.4
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

On Tue, 18 Jul 2023 22:59:08 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

>  # Locally calculated
> -sha256  f1a4326266aada65b307dac05161a9d02d3dba4fb08b50cb26e3c24cc8a86e97  Copyright.txt
> +sha256  4a01ccf2dc580ba570d02bc015bbe0ec92f1f318717aae9540ba841ba7946756  Copyright.txt

You're updating the hash of the license file here, but it is not
explained in your commit log. Could you adjust this?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
