Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AB8EB64DA
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A99581FF6;
	Mon, 10 Jul 2023 17:27:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A99581FF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0OvOT36xyeB9; Mon, 10 Jul 2023 17:27:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9735081F7C;
	Mon, 10 Jul 2023 17:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9735081F7C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 266DD1BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6B6281F7C
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6B6281F7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zTEJ0osntC97 for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:27:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB9E681E82
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB9E681E82
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:27:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07F2CE0006;
 Mon, 10 Jul 2023 17:26:57 +0000 (UTC)
Date: Mon, 10 Jul 2023 19:26:56 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230710192656.54dd5f23@windsurf>
In-Reply-To: <20230708163644.710352-1-bernd@kuhls.net>
References: <20230708163644.710352-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689010018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+w0nMOnxV5uoudIlrkZo66FVx+Ucj7EddMpM8F7jlsY=;
 b=Tl+k6TwhOLpfZVLunPiz20tigS4+SatyfLzFLxKtXU9p/UOGly0igVKp77ht4our7INZTr
 1HmITCR7LAwUC9i5xlNzAN7VkeVER60w2/x55OO0dQ/tSjd6T2S2va5+Mi5DH5zVkFW7iV
 2+alwdGzV9loq29IML9JHyn4+sT/qXpS3jA0C5HESNBfX/tbsREyGDRnQ8U9qs6u5tQthG
 IldBtfisipmo0DDPVWxDBuQO+fo/osNpg9Bd1anvmnCHoXiTkmfuJTCvei/MdV5Wzr+eZh
 vAohERdCkgXAW3ioKleOIslP5SgmLJKLFg83ALmnF5T5io9XFZW+O8J4LyhzLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Tl+k6Twh
Subject: Re: [Buildroot] [PATCH 1/1] fs/ubifs: increase logical eraseblock
 size
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

On Sat,  8 Jul 2023 18:36:44 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> This value is unchanged since 2008 and too small for current images.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f72/f72918d63510b170e5da01bfa9c247cf9dcf507f/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> There is no particular reason for the new value, it was just the first
> value I found working for this defconfig while increasing it in steps
> of 0x10000.
> 
>  fs/ubifs/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ubifs/Config.in b/fs/ubifs/Config.in
> index e79ab9a17e..bad26bf99f 100644
> --- a/fs/ubifs/Config.in
> +++ b/fs/ubifs/Config.in
> @@ -7,7 +7,7 @@ if BR2_TARGET_ROOTFS_UBIFS
>  
>  config BR2_TARGET_ROOTFS_UBIFS_LEBSIZE
>  	hex "logical eraseblock size"
> -	default 0x1f800
> +	default 0x3f800

This doesn't make sense, and in fact doesn't really solve the issue at
http://autobuild.buildroot.net/results/f72/f72918d63510b170e5da01bfa9c247cf9dcf507f/build-end.log.

The issue at
http://autobuild.buildroot.net/results/f72/f72918d63510b170e5da01bfa9c247cf9dcf507f/build-end.log
is that the *number* of LEBs in insufficient, i.e the size of the image
is too small to contain the root filesystem contents.

What your patch is doing is changing the size of the LEB, but the size
of the LEB is intimately related to the NAND flash geometry. You can't
just change it randomly. So yes, by extending the LEB size, you're less
likely to encounter the "max_leb_cnt too low" error because with a
larger LEB size, you have more space for a given number of LEBs, but
you're not fixing the real issue, which is bound to happen again with a
larger root filesystem.

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
