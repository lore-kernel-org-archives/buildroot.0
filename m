Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB0DC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 13:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E968F822C7;
	Sat,  4 Nov 2023 13:38:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E968F822C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GM8IEmkssiCN; Sat,  4 Nov 2023 13:38:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 459A28228E;
	Sat,  4 Nov 2023 13:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 459A28228E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B1BB1BF30C
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 13:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30CFA8228E
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 13:38:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30CFA8228E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7rlV37xtMzcA for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 13:38:48 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26B9682014
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 13:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26B9682014
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E68360007;
 Sat,  4 Nov 2023 13:38:45 +0000 (UTC)
Date: Sat, 4 Nov 2023 14:38:45 +0100
To: Javad Rahimipetroudi <javad321javad@gmail.com>
Message-ID: <20231104143845.429624c3@windsurf>
In-Reply-To: <20231104072458.7369-6-javad321javad@gmail.com>
References: <20231104072458.7369-1-javad321javad@gmail.com>
 <20231104072458.7369-6-javad321javad@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699105126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OahtgmjurGlj94CUVM3PC//d4ppqYLjIKQniZfPGGZI=;
 b=OutbMzFbUHaZJoQTEbKeEDhaXv1fJCtyVPdjvCBidg55L9l1NwI8twPMw2L04kSG8v7d+P
 pBzLuY9S0Tnamz+lngAtSAreTdBYoLN0U8o4x738NxiLlpKTQkodU83JPwPm939hAyRK+V
 iF+hMk3DxcWj2E6/Fhb25bj37PBzZkgH03meiFRZWChE4INSK/XpxxarMVq7ECB871U4qV
 B6AphSR/8UDQhN6t/LzYx0VgC9ZwL0y4u/GgwSAhqOREMehkgHGfrraqrx9oRLQRcAkXwN
 3bV/0ecnFje9tqLq2Ti74DsoYaC9CVoK5/1fxdmwBrXA9Z1SscFU2HfTQ4Jcag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OutbMzFb
Subject: Re: [Buildroot] [PATCH 6/7] board/pine64/genimage.cfg: rename uboot
 bin image The generated image name modified according to uboot output
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  4 Nov 2023 10:54:57 +0330
Javad Rahimipetroudi <javad321javad@gmail.com> wrote:

> Signed-off-by: Javad Rahimipetroudi <javad321javad@gmail.com>
> ---
>  board/pine64/pine64/genimage.cfg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/pine64/pine64/genimage.cfg b/board/pine64/pine64/genimage.cfg
> index 06b4ed1056..37ebe5ea6e 100644
> --- a/board/pine64/pine64/genimage.cfg
> +++ b/board/pine64/pine64/genimage.cfg
> @@ -16,7 +16,7 @@ image sdcard.img {
>  
>  	partition spl {
>  		in-partition-table = "no"
> -		image = "sunxi-spl.bin"
> +		image = "u-boot-sunxi-with-spl.bin"

This should go together with the U-Boot update, otherwise your series
is not bisectable.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
