Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7726FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 13:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9A3E60E11;
	Mon, 25 Jul 2022 13:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9A3E60E11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 00ozCCmunHjF; Mon, 25 Jul 2022 13:00:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17E296101B;
	Mon, 25 Jul 2022 13:00:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17E296101B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F9CD1BF35F
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 13:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F341584C89
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 13:00:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F341584C89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ez1oZj3TAhqt for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 13:00:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98C2884C88
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98C2884C88
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 13:00:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 312DB1BF209;
 Mon, 25 Jul 2022 13:00:26 +0000 (UTC)
Date: Mon, 25 Jul 2022 15:00:25 +0200
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220725150025.12ee53e7@windsurf>
In-Reply-To: <20210510195352.13205-1-ps.report@gmx.net>
References: <20210510195352.13205-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658754026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GF8et0hxK0BX7Ag1C/3c6RMVLZ5K8gBMmKwbm69h2is=;
 b=RTAzvCDVyBlADzPkYqpY1qaOD04HsbbDT5svvViNbjhPBhpReGfBCG4uEFfBXtiE44OkbU
 TdEP3uFw9ktVJ03RVGVdldQfRVAGcSCi7nhALnoK6kjrcAzZjhMSUk3IxQFzTnLWd1flXE
 Cgo0q3+A2Z7j21t02CfQ4Qa1XO4VBQpYb5JsvmdkCcESwSLiq36Z92uMcUbNoC1zzQn1ze
 eoRcFoAj8rsmfLLSWZbk2mwDKAxLlnquiyIp1SBCXIvtYPYz6IjmfJr+udATGIZlnbU7Ar
 8K/pUkPsRJPZ0o14kW3RckojRDb8X48M3aM+Ngi5B5Vvyp6wtNabZERAcBUiVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RTAzvCDV
Subject: Re: [Buildroot] [RFC v1] package/rpi-userland: add GLint64,
 GLuint64 and GLsync typedefs to GLES2/gl2ext.h
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
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Peter,

On Mon, 10 May 2021 21:53:52 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> The problem is that gstreamer sees the original gl2ext.h file from
> rpi-userland (rpi-userland-093b30bbc2fd083d68cc3ee07e6e555c6e592d11/interface/khronos/include/GLES2/gl2ext.h)
> without the additional GLint64, GLuint64 and GLsync typedef definitions but
> checks for existance and if not found enables its own versions in gstgl_compat.h,
> incompatible with the later ones used from Qt (qopengles2ext.h).
> 
> Fix this by adding the same typedef definitions already to the
> rpi-userland header version.

Romain and I finally had a look at this. I was a bit confused by your
explanation, so after doing our investigation, I rewrote it this way:

    The problem is that rpi-userland doesn't define GLsync, and both
    GStreamer and Qt have their own definition of GLsync in this case, but
    they are not the same.
    
    We reported this issue to:
    
     * rpi-userland, to get the headers updated:
       https://github.com/raspberrypi/userland/issues/469#issuecomment-1193864294
    
     * gstreamer, to get their bogus definition of GLsync fixed:
       https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/issues/973
    
    In the mean time, fix this by adding the missing definitions to
    rpi-userland, so that GStreamer and Qt don't try to provide their own.
    
As you can see, I also reported the issue back to rpi-userland (more
precisely pinged in an existing issue) and to GStreamer.

But for now, what you proposed is the most immediate fix, so I've
applied your patch to master with an updated commit log and patch
description.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
