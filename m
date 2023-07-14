Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F429EB64DA
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 10:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 131566141D;
	Fri, 14 Jul 2023 10:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 131566141D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n59xnnsNalX3; Fri, 14 Jul 2023 10:21:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E58261411;
	Fri, 14 Jul 2023 10:21:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E58261411
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0CC481BF313
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D375F421B4
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:21:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D375F421B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id quX_PkQQgOfv for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 10:21:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1238421A2
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1238421A2
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 10:21:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 91B96240008;
 Fri, 14 Jul 2023 10:21:28 +0000 (UTC)
Date: Fri, 14 Jul 2023 12:21:27 +0200
To: Lang Daniel via buildroot <buildroot@buildroot.org>
Message-ID: <20230714122127.53a89fa2@windsurf>
In-Reply-To: <VI1P190MB0493E124A4F5136F4D451EAE9F34A@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB0493E124A4F5136F4D451EAE9F34A@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689330088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z1Udi7EVtldWkwV2BrOEO4fD/XfZcW79yKXad38eA6U=;
 b=LFEo2FnIN6960N8vi3VTQMbJss2OqYFk40pldaomkCh4rBx5L+m4kawidrfIznnrNWmUlL
 vnEB3QgxvooDW28jvrzcuKJgTaVKCIaXP+vr00H6wjl+MhG4B2AWUxr8fHnvxqQzgIQDeT
 qozWsreFus+DsnPAJgILp26Q2Z+iWuncZpTM4IOkLyDZRo7S4T3R0XvNFK8eguGRj22Qte
 uARaywDQUtFmsa5y4aie+Bjz4EsptB5QxbuKEV6Ddx6D8GJk4kx7iZt5BRTQSDRlt1Rwxt
 RSLXSqUeztGhXlhm9zfDygYBrXqBHSozyYfbPq6rAFOspf831TyTAkTfYvKGjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LFEo2FnI
Subject: Re: [Buildroot] [PATCH v2] DEVELOPERS: update entry for Daniel Lang
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
Cc: Lang Daniel <d.lang@abatec.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 14 Jul 2023 08:13:28 +0000
Lang Daniel via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
> v1 -> v2:
> - resend because tabs got converted into spaces
> ---
>  DEVELOPERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 0918e9f721..32d0a5d0ee 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -649,7 +649,7 @@ F:	package/odroidc2-firmware/
>  N:	Daniel J. Leach <dleach@belcan.com>
>  F:	package/dacapo/
>  
> -N:	Daniel Lang <d.lang@abatec.at>
> +N:	Daniel Lang <dalang@gmx.at>
>  F:	package/atkmm/
>  F:	package/atkmm2_28/
>  F:	package/cairomm/
> @@ -663,6 +663,7 @@ F:	package/libsigc2/
>  F:	package/paho-mqtt-cpp/
>  F:	package/pangomm/
>  F:	package/pangomm2_46/
> +F:	package/sam-ba

This needed a final slash. I fixed that up and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
