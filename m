Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D39EB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 16:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDD6C60E1D;
	Sun,  9 Jul 2023 16:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDD6C60E1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fB5xue2hmChz; Sun,  9 Jul 2023 16:30:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDB1A60E07;
	Sun,  9 Jul 2023 16:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDB1A60E07
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC4221BF423
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C099D81882
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:30:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C099D81882
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J-KDrNyp3IO8 for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 16:30:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9381981871
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9381981871
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 16:30:24 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B04031C0004;
 Sun,  9 Jul 2023 16:30:22 +0000 (UTC)
Date: Sun, 9 Jul 2023 18:30:21 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230709183021.35caee94@windsurf>
In-Reply-To: <20230709145118.1163585-1-bernd@kuhls.net>
References: <20230709145118.1163585-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688920222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PMBZhIYeAOVQOcJcxHwolLsXex2Le/f6Apf4cXMtCBI=;
 b=eWS2+5+mo8QMMOiS7GXHP8CDz3icfbwFVcDIJLS1kH5IoCiwLCevLpHzKv2QOjeWImqmP2
 pv28QqpuqTzTDB1Ypkb9+8riClnCvLdwSqvs0FD/mll6VASjqAfIPLnqGKBmZ3wKHkH78+
 agw0Oww8kn8eaGEfexYY8GyiH9zZE96Lmjky2MPyfSnx2u1xcqE1JAwrWQe7U9PUrMnUxp
 ct0jjVpve20qiKSSQSh0Uh+ZUSo5GeC265ACjHqTCiP0VS+nAkvS3/m/xiiRff6RLNgmJw
 NkvfeS49KhWR1BpYa/KmXo6sV9P9w3ixprFBnlts8Wx8iD2DrH8t4Y6V85sstA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eWS2+5+m
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: disable cramfs
 images
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

On Sun,  9 Jul 2023 16:51:18 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes build error:
> 
>   warning: estimate of required size (upper bound) is 1374MB, but
>   maximum image size is 272MB, we might die prematurely
>   mkcramfs: filesystem too big
> 
> Fixes:
> http://autobuild.buildroot.net/results/d47/d47f9b462707dffe1b6665f143701303b04e2adc/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  utils/genrandconfig | 3 +++
>  1 file changed, 3 insertions(+)

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
