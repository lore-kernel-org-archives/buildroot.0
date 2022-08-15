Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E31FC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 12:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9329940AD5;
	Mon, 15 Aug 2022 12:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9329940AD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7yHIE5df4ps6; Mon, 15 Aug 2022 12:35:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A08B340AD9;
	Mon, 15 Aug 2022 12:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A08B340AD9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B12BB1BF3B9
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 12:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 985B281A95
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 12:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 985B281A95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 93gc1KN33nPn for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 12:35:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 225EA81B0A
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 225EA81B0A
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 12:35:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CEA7760005;
 Mon, 15 Aug 2022 12:35:39 +0000 (UTC)
Date: Mon, 15 Aug 2022 14:35:38 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220815143538.19dbf4a4@windsurf>
In-Reply-To: <20220807222529.1501004-3-giulio.benetti@benettiengineering.com>
References: <20220807222529.1501004-1-giulio.benetti@benettiengineering.com>
 <20220807222529.1501004-3-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660566940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WTn9NQJwsFTg9t8oho+/EewOIENIQZcAZjr3Uag7Mzs=;
 b=BJMZZJca6bT6H+vrn7mYsgHkkzz7mVlL0NG+tVTOyp76awiEoSLDsDA54azJvYOaxomp/D
 wmVk7rh5hvZ4kbWsjwhW81wS4T9gmI4R/drk9y/ykeE6wUgY4w4eeuuUDHqd9PHJ0N+NkC
 +AzDf48ng0HjHayJc63bHpCcEqH6IfO/qaxihcBeT2XhfMiJ24KC3Nuqw03e2gbk7q8f6b
 6TcGNBn1GbxOVef42e64NPDUv6PZOVgGcpstyG2Ut5XIak+yde+SaAy6IABg2KwrrqZJWu
 2tN1w2iVr/T+qLlNFAa9Je87bN/OCdlTTarwlvg5d1m34fNHnXRgaSFvGCb33Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BJMZZJca
Subject: Re: [Buildroot] [PATCH 2/2] package/opencv4:
 BR2_PACKAGE_OPENCV4_LIB_OBJDETECT requires BR2_PACKAGE_OPENCV4_LIB_DNN
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
Cc: Stefano Cottafavi <stefano.cottafavi@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  8 Aug 2022 00:25:29 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Opencv4 library objdetect needs library dnn, otherwise it throws:
> ```
> -- Module opencv_objdetect disabled because opencv_dnn dependency can't be resolved!
> ```
> So let's "select BR2_PACKAGE_OPENCV4_LIB_DNN" if
> BR2_PACKAGE_OPENCV4_LIB_OBJDETECT is enabled.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/opencv4/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
> index bdeddcc089..4991b4252b 100644
> --- a/package/opencv4/Config.in
> +++ b/package/opencv4/Config.in
> @@ -155,6 +155,7 @@ config BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
>  	select BR2_PACKAGE_OPENCV4_LIB_CALIB3D
>  	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC
>  	select BR2_PACKAGE_OPENCV4_LIB_ML
> +	select BR2_PACKAGE_OPENCV4_LIB_DNN

Alphabetic ordering was not correct, and it also lacked the propagation
of the "depends on" of select BR2_PACKAGE_OPENCV4_LIB_DNN.

The final patch is at:

  https://git.buildroot.org/buildroot/commit/?id=e229943785534e0884c62c7346a8c6df8d565e1e

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
