Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93456C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 21:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E2A161546;
	Wed, 20 Dec 2023 21:14:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E2A161546
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DC55QjggsZad; Wed, 20 Dec 2023 21:14:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 782DB6107D;
	Wed, 20 Dec 2023 21:14:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 782DB6107D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E48151BF361
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 21:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B005C83A34
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 21:14:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B005C83A34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xJwb7sdJi3Ar for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 21:14:25 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D62C819D6
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 21:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D62C819D6
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDB8620007;
 Wed, 20 Dec 2023 21:14:23 +0000 (UTC)
Date: Wed, 20 Dec 2023 22:14:23 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231220221423.672adf6a@windsurf>
In-Reply-To: <20231218194001.544887-2-adam.duskett@amarulasolutions.com>
References: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
 <20231218194001.544887-2-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703106864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/FVcRMbxMCgK9hoYm4SZBoNecbnK+L15mIgRKnzuPYc=;
 b=eKGWop5n7+t1/x2WepvMAAGirQokc2TkivbAFY8nFcFcnk32T60p2NvvfDorIL+XNZd04q
 ImimL0vPfZA6eWQUHffUIAsrAUtVRKAzFbs+ZHti/KrabgX6+VX3f9XtAAflsrVACtnGdr
 CkC98ULKxlEVW2r5OSYIB+gKkoCDtrA39WYayXsK+gvayK14Qwd5ZLQ9A5PvnIPTeGttXE
 RHoGsWlEW4Y0YNIoI+2HYBSDw9OZ1I4EaLYkr3F2xTAaZInN5ORERdGuhuGsXrstO5KE94
 AZDI5fBrGr3uKTMdiq+jG/5i9ORLZ/rJQtQTeOZb+LEZ+g58uh0KmTL0ttIILg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eKGWop5n
Subject: Re: [Buildroot] [PATCH v2 02/14] package/sway/Config.in: select
 BR2_PACKAGE_XKEYBOARD_CONFIG
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

On Mon, 18 Dec 2023 12:39:47 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Much like weston, this is a runtime dependency.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/sway/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/sway/Config.in b/package/sway/Config.in
> index 26b5b2ecea..95b19dd464 100644
> --- a/package/sway/Config.in
> +++ b/package/sway/Config.in
> @@ -18,6 +18,7 @@ config BR2_PACKAGE_SWAY
>  	select BR2_PACKAGE_CAIRO
>  	select BR2_PACKAGE_CAIRO_PNG
>  	select BR2_PACKAGE_PANGO
> +	select BR2_PACKAGE_XKEYBOARD_CONFIG # Runtime dependency

We usually just put "# runtime" as the comment, so I've changed it like
this and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
