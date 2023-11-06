Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9954C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9479D41EF1;
	Mon,  6 Nov 2023 21:11:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9479D41EF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CjbL7U_7fyXv; Mon,  6 Nov 2023 21:11:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D76CA41969;
	Mon,  6 Nov 2023 21:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D76CA41969
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D01281BF336
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AFD56129E
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AFD56129E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id baJ_7nvh2Ph8 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:11:38 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DB0761151
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DB0761151
Received: by mail.gandi.net (Postfix) with ESMTPSA id C3016FF805;
 Mon,  6 Nov 2023 21:11:36 +0000 (UTC)
Date: Mon, 6 Nov 2023 22:11:35 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20231106221135.6ae84287@windsurf>
In-Reply-To: <20231106180304.1835179-1-dario.binacchi@amarulasolutions.com>
References: <20231106180304.1835179-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699305097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DSdhZ8Q6dkGyqjQhhmutjkUmgsQ1jVFEZQgQHNRSeHI=;
 b=ZJ1PA9xVKpqXkMdK7oxyPr7b6R2UdNeI7Qo4/wT2tORIzCUnip8okmeYqqupSpD0Wann78
 ZBFsXMy58D7RJzIswVHQUbFzrN8UcyOGIpzElXIa+9UOiWELMoXJfvsckmrwaiQ9eYUmjR
 Zt9JERN5sH07PBW6Rov8GAzcnTop4GHg3e07AcZueKKJEuxMurtmIQT7+Y4l68yYQZpcJy
 9z3n+8U5wNEIT1nJn1iO2IeO7DUcOlbdaRttPqd5iXUbIVSb8YoIDCAOBKLCXDhF4k2tZh
 2PrwpXm0zwlasiFKPpK2xsYyRul+ZrsO7ifnx2T3R39kKMYSVHmI9K63rHuSWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZJ1PA9xV
Subject: Re: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.139
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

On Mon,  6 Nov 2023 19:03:04 +0100
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> -HOST_UUU_DEPENDENCIES = host-bzip2 host-openssl host-zlib host-libusb host-zstd

                                                   ^^^^^^^^^ We already have host-zlib here

> +HOST_UUU_DEPENDENCIES = host-bzip2 host-openssl host-zlib host-libusb host-zstd \
> +	host-zlib

So do we need one more time?

This change is also not listed in the commit message. Is this just a
spurious mistake?

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
