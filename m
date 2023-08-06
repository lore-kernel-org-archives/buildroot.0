Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667BEC001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 11:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1804A81363;
	Sun,  6 Aug 2023 11:34:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1804A81363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hbE7pNWl5zTV; Sun,  6 Aug 2023 11:34:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CD5481D72;
	Sun,  6 Aug 2023 11:34:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CD5481D72
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66A7A1BF293
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 11:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F8C781DFC
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 11:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F8C781DFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S7PLbXJ17__4 for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 11:33:47 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F233C80546
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 11:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F233C80546
Received: by mail.gandi.net (Postfix) with ESMTPSA id C60191BF207;
 Sun,  6 Aug 2023 11:33:43 +0000 (UTC)
Date: Sun, 6 Aug 2023 13:33:42 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20230806133342.1c5af2d8@windsurf>
In-Reply-To: <20230726202838.1931660-2-christian@aperture.us>
References: <20230726202838.1931660-1-christian@aperture.us>
 <20230726202838.1931660-2-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691321624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mgeD+P/VuVj+C0N2p169tGz0A/jK5rt1AHdyD8id6A0=;
 b=JZnQtyBm0D8NJzPkpR6Dc4lX6fnVmFHbYbUPghFqwKMJzUM3ViUAYf0wSpZpoBXlWR+XX/
 hE8WHkgZ85E9VnuvbnkZS/P+DkFxyoFRP2K8j+lN8JeZ3um/URupkWCyInHD4s/13GIpKn
 zarTNNO8AVwjyYr9ZZ56iHreENvDIicw1yuz8JwNtUYKh1WxV0PJfAI8gScAJUnE7ytuVs
 wvLYKECLOQWSUBDZ1uIDEeSbmEqbfQfUaGRuHT4CnhnXqv+iWZpSljYE5V0I/xR6jrI60Z
 rtyYRfVf3qO7+9fqP7tDw4DsOnYyolKIDWEgDn3Z6omtFYsB+57YUTu/qmVHuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JZnQtyBm
Subject: Re: [Buildroot] [PATCH v1 2/3] package/python-pylibfdt: add host
 python package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 26 Jul 2023 13:28:37 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/python-pylibfdt/python-pylibfdt.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/python-pylibfdt/python-pylibfdt.mk b/package/python-pylibfdt/python-pylibfdt.mk
> index 5511bd12b3..8850b69b30 100644
> --- a/package/python-pylibfdt/python-pylibfdt.mk
> +++ b/package/python-pylibfdt/python-pylibfdt.mk
> @@ -12,4 +12,7 @@ PYTHON_PYLIBFDT_LICENSE = BSD-2-Clause or GPL-2.0+
>  PYTHON_PYLIBFDT_LICENSE_FILES = BSD-2-Clause GPL
>  PYTHON_PYLIBFDT_DEPENDENCIES = host-python-setuptools-scm host-swig
>  
> +HOST_PYTHON_PYLIBFDT_DEPENDENCIES = $(PYTHON_PYLIBFDT_DEPENDENCIES)

Changed to:

HOST_PYTHON_PYLIBFDT_DEPENDENCIES = host-python-setuptools-scm host-swig

We generally don't do HOST_<pkg>_DEPENDENCIES = <pkg>_DEPENDENCIES in
packages.

And applied. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
