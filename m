Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E087BEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 21:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C01D41E75;
	Tue, 11 Jul 2023 21:03:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C01D41E75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QaxAHlMwvdCu; Tue, 11 Jul 2023 21:03:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BA0641E5E;
	Tue, 11 Jul 2023 21:03:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BA0641E5E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD7AF1BF48B
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EE08605B0
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EE08605B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X1ULj_EjJ-qm for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 21:03:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB16F60E38
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB16F60E38
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 21:03:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E81C60003;
 Tue, 11 Jul 2023 21:03:15 +0000 (UTC)
Date: Tue, 11 Jul 2023 23:03:15 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230711230315.5a4f2772@windsurf>
In-Reply-To: <20230705161042.700055-1-bernd@kuhls.net>
References: <20230705161042.700055-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689109397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aVLAcxxW6nZzBghTTK0bmavoDvTKyQMcIS3mJgyjBvk=;
 b=MlBurZHQZuc+MzUDRTZ4elZY4lNJWDC5QfYcVPzsLyc/q6pZmLtZsGIfKAK1eDYeFdsNTV
 yznF+7MSytW5IesdNOLz2KviVMAc+fexVRktDxbod0LZyYlPMBItci8ag7qOhDtynrzXHl
 lSdTZWkf4rffdNOegdfKyoMG/6J30yIecEkml5GTbsM4232Th1lgGQcJAR8rV1eYtVRhGp
 VLJX1v53Bx/13vkRWdS25fRVZI7Z6MIrRUaF0rlzp3zJSVh5F3WcDnsSyZ8j99PiIJkWDr
 p9ouYPWfIVTJLnoxm7UIiNWuif9Xpna9Owuz53drzcHVJtHey1sjt2W9bITfRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MlBurZHQ
Subject: Re: [Buildroot] [PATCH 1/1] package/ffmpeg: mmal is not available
 on aarch64
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
Cc: Guillermo G <ggalan3@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  5 Jul 2023 18:10:42 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/aa5/aa589b38e1591a0ec4d400891bf86f5138cf4542/
> 
> For details see:
> https://lists.buildroot.org/pipermail/buildroot/2023-July/669839.html
> https://github.com/raspberrypi/userland/issues/688
> 
> Reported-by: Guillermo G <ggalan3@gmail.com>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/ffmpeg/ffmpeg.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

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
