Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AF7C433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 19:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5961840650;
	Wed,  1 Jun 2022 19:55:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZZdnSnXO_yKU; Wed,  1 Jun 2022 19:55:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 633EF404EC;
	Wed,  1 Jun 2022 19:55:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C061B1BF333
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 19:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 675AF600C9
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 19:55:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T3igmu2l0Hs1 for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 19:55:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1942060E98
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 19:55:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3FFAAE0007;
 Wed,  1 Jun 2022 19:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654113338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NRnJxl3DM9g2zRlQX7T5h8rp/8owVT9Fj3fb/F+bQm8=;
 b=VV4sMtzRYwI0oneOJOZ2AsPnHleyxSOXltW14O75sakeoz2dpMkrmnNqRm0lwqgL/Zxx6+
 DZ7j7Iya6Jc1vazmo2vkLn4HskczNTNzXXwiDtJbjCyiCEf2uUPRFAFqLUPnUvcM2rh73N
 3VGz4UROut3ZwvRD38FZ8rcNY9XZNm1+ojDFBJTpLSUU4exJ8l2PRRbnDVh69EfBwBkSxT
 BrQJqZQi5+0mB6H7dDf7t8OFx7FdytZiy4r0Nbe8hcr2UD03vgZ4UOSnt+PbmZeBwF3Q+O
 lDlXWGCrUgnDJLyySBUHhNVG6NAgKZZKIzHkp+48cXiGOuI2SBkKIUercd4cqw==
Date: Wed, 1 Jun 2022 21:55:37 +0200
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20220601215537.2d9983f9@windsurf>
In-Reply-To: <20220527103335.1968203-5-angelo@amarulasolutions.com>
References: <20220527103335.1968203-1-angelo@amarulasolutions.com>
 <20220527103335.1968203-5-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/4] package/rtl8723ds: new package
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
Cc: jagan@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 27 May 2022 12:33:35 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> This package adds a driver for Realtek RTL8723DS wifi chip.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/Config.in              |  1 +
>  package/rtl8723ds/Config.in    | 10 ++++++++++
>  package/rtl8723ds/rtl8723ds.mk | 23 +++++++++++++++++++++++
>  3 files changed, 34 insertions(+)

This was missing an entry in the DEVELOPERS file.

> diff --git a/package/Config.in b/package/Config.in
> index 8892134133..52671dbf89 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -565,6 +565,7 @@ endmenu
>  	source "package/rtl8189es/Config.in"
>  	source "package/rtl8189fs/Config.in"
>  	source "package/rtl8723bs/Config.in"
> +	source "package/rtl8723ds/Config.in"
>  	source "package/rtl8723bu/Config.in"

Alphabetic ordering was not correct here (reported by check-package),
so I fixed that up.


> +RTL8723DS_VERSION = 76146e85847beb2427b1d4958fa275822f2b04ab
> +RTL8723DS_SITE = $(call github,lwfinger,rtl8723ds,$(RTL8723DS_VERSION))
> +RTL8723DS_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)

There are no firmware files in this Git repository, so it seems like
"proprietary (*.bin firmware blobs)" was copy/pasted from other rtlxxxx
packages. I dropped that, and kept only GPL-2.0.

Of course, if you have some evidence showing that there are some
proprietary firmware files in this package, let me know and we'll fix
things back.

Applied to next with those changes. Thanks!

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
