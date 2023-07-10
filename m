Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86048EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32EE0820F4;
	Mon, 10 Jul 2023 17:46:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32EE0820F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Reds6GWxtXSa; Mon, 10 Jul 2023 17:46:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6251382118;
	Mon, 10 Jul 2023 17:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6251382118
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 936AD1BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A05A60F39
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A05A60F39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x1p884GzX_wm for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:45:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C6D0606E6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C6D0606E6
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:45:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B07760002;
 Mon, 10 Jul 2023 17:45:25 +0000 (UTC)
Date: Mon, 10 Jul 2023 19:45:24 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230710194524.2edcdaa8@windsurf>
In-Reply-To: <20230702070430.6389-1-bernd@kuhls.net>
References: <20230702070430.6389-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689011125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L+73sC+I7Bs6VPoqf68DRtYHIoofge7BLltxdYk3Ru4=;
 b=niV27jda6eROzhK47jn0Ow9yAc6yDoNkVqMLVXQJQdxioMV2kE45B6J8WGxiex8Y/ny3NG
 zNax3dWaN06QlDqiWOzJXYub+LlRIIi/cake3q0RpYCdAu8KILkbzJKxAOB37be03MWTd3
 R3UP1s++tE1cpiFtb9jMNlWqVALvkIA5l2WVOjsbfD4Pomokco8KwUXDAaeW80d6pVo1IF
 4ap2Ey6d79SHQi/LTsC8uebHP28e3SCQAC2nGDh53EinaMNfuFsxpqLxjjwlpqFpVUHfIx
 2IKOAGbUmjwT3fiRtNa82Y+iE4SkRjgZv+btZqyKhCe6wNBZUl/RHmXSQ8Xxaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=niV27jda
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libasplib: remove package
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

On Sun,  2 Jul 2023 09:04:30 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Added in 2015 to be used by Kodi ADSP addons these efforts have stopped:
> https://forum.kodi.tv/showthread.php?tid=252871&pid=3053658#pid3053658
> so this package is no longer needed.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: rebased, removed patch from .checkpackageignore

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
