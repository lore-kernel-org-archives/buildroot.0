Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D992EB64DA
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 10:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37E0C6144A;
	Fri, 14 Jul 2023 10:28:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37E0C6144A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0mod745IEvVo; Fri, 14 Jul 2023 10:28:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F7D061426;
	Fri, 14 Jul 2023 10:28:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F7D061426
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA7A91BF313
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 857A6405FB
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:28:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 857A6405FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3QrCFMmd0YX2 for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 10:28:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F5E640510
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F5E640510
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 10:28:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6342440002;
 Fri, 14 Jul 2023 10:28:13 +0000 (UTC)
Date: Fri, 14 Jul 2023 12:28:12 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230714122812.2daf5921@windsurf>
In-Reply-To: <20230611175142.5235-1-bernd.kuhls@t-online.de>
References: <20230611175142.5235-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689330493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jgkYNAJrwhCQxf68uhcPKwXx3BCqvEKxU7KeCIIav+8=;
 b=LFz/pRUnCfHy1bH18l/J3PVsTL/0p9FEF9wp5Nju6Iq+D0JtCI6gYkSpEWtN7kpfBesyo2
 bt12MaCPhk0CcgtLH7bD7iYNZwEXwJfpwHN2ZkRf8oByljP6MKjGMhs4zmuURqOSO9ACnx
 7C9lZu0t2Oun6SBCojSzKFzETgsDRgPbfH072RV7CBX6Qoftm3yLb3E/eFuW1fP+kHte76
 u1wHxec6yJf2nKf9KxyCD+yJLlfSwuF+Z4Horv11QLVPz1Az8o+fpe5SKdE7pfTfOJJ29Q
 oxdoBDGSB8CS67glbhN2Gm4jxbCWzizSw+45tW+/leWgUNvgztIOMAlDS42DmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LFz/pRUn
Subject: Re: [Buildroot] [PATCH v2 1/1] package/nfs-utils: fix static build
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Sun, 11 Jun 2023 19:51:42 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/f17/f17a554c86f0b24327b49fdc75612cc133f129ed/
> 
> f9dc4bab9f4576eed3a22ca7517bfc88d9812c34 bumped nfs-utils to version
> 2.6.3 which includes the addition of the two files patched here.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: added upstream URL
> 
>  ...-guard-dlfcn.h-include-with-HAVE_DLF.patch | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch
> 
> diff --git a/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch b/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch
> new file mode 100644
> index 0000000000..5ffb15d86d
> --- /dev/null
> +++ b/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch
> @@ -0,0 +1,44 @@
> +From 274e4d212c30183242e48b639889865819f3ac33 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Sun, 11 Jun 2023 08:57:11 +0200
> +Subject: [PATCH] support/reexport: guard dlfcn.h include with HAVE_DLFCN_H
> +
> +Upstream: https://marc.info/?l=linux-nfs&m=168650558019402&w=2

I've changed this to the URL of the final commit that has been applied
upstream, and applied your patch.

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
