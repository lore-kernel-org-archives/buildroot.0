Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD1AC46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 11:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E94B4416D6;
	Sun, 24 Dec 2023 11:11:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E94B4416D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R6_BDb_Y_VgW; Sun, 24 Dec 2023 11:11:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45E9A416D0;
	Sun, 24 Dec 2023 11:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45E9A416D0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0ADBB1BF5D7
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 11:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D66F940137
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 11:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D66F940137
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id slkQV_rQtym7 for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 11:11:24 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 820E2400C4
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 11:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 820E2400C4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 803341BF203;
 Sun, 24 Dec 2023 11:11:22 +0000 (UTC)
Date: Sun, 24 Dec 2023 12:11:21 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231224121121.401724a3@windsurf>
In-Reply-To: <20231202015123.2609353-1-giulio.benetti@benettiengineering.com>
References: <20231202015123.2609353-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703416282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nDNf/GtzP+Ol64qFPjXLBTW51LJr/nbuud4klGgJzcY=;
 b=FnQWoW6h+BEN28TywsOD+NExcA2OFvUb1cBRA1VjnbjCeROq7gkY4I4eTHE8BuDoACGN/k
 WlCxU10u1xwuWdE0qUVabJ/5xdoHvjjlOpkLiemYze8a7Bb4jnfsAcIO24o/RvAtbdVf57
 yr4X91RE+1VIr3XpaMymGAne9+uKAXbZYdCIruNsopY8N/gO4r/9YcjYupFqDA/WVGlqJH
 VlsIoENTe8xFeU0jfIl0AQxZoJUSX6H2lOWS4j5DPFqqRb0QNInvsVp8C9sGoXsowa8yl2
 HI34VKSqBZM3LyXqMAdNPy1gEXSQQzSshjz8BPwZg+NdvWd1yva+Ha7rIq5H+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FnQWoW6h
Subject: Re: [Buildroot] [PATCH] package/swugenerator: add missing
 dependencies
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
Cc: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

On Sat,  2 Dec 2023 02:51:23 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> 
> At the moment swugenerator package lacks host-openssl, host-gzip and
> host-zstd. All their final executables like openssl, gzip and zstd
> can be used by swugenerator if the correct flag is passed so let's
> add these missing dependencies.

Could you clarify whether these are runtime dependencies? If there are
build time dependencies, do we see build failures in the autobuilders?

> diff --git a/package/swugenerator/swugenerator.mk b/package/swugenerator/swugenerator.mk
> index f4ead1d229..141a6a96c5 100644
> --- a/package/swugenerator/swugenerator.mk
> +++ b/package/swugenerator/swugenerator.mk
> @@ -9,6 +9,6 @@ SWUGENERATOR_SITE = $(call github,sbabic,swugenerator,v$(SWUGENERATOR_VERSION))
>  SWUGENERATOR_LICENSE = GPL-3.0
>  SWUGENERATOR_LICENSE_FILES = LICENSE
>  HOST_SWUGENERATOR_SETUP_TYPE = setuptools
> -HOST_SWUGENERATOR_DEPENDENCIES = host-python-libconf
> +HOST_SWUGENERATOR_DEPENDENCIES = host-gzip host-openssl host-python-libconf

In your commit log, you mention host-zstd being needed, but you don't
add it to the dependencies here. Could you clarify this as well?

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
