Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912F2C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 19:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12FE541A00;
	Thu,  6 Oct 2022 19:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12FE541A00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K8J5u73B0hsr; Thu,  6 Oct 2022 19:46:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E358A419FD;
	Thu,  6 Oct 2022 19:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E358A419FD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 80CAD1BF3C8
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DB98419FD
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DB98419FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WKIOpiju-ByF for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 19:46:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC0B1419F9
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC0B1419F9
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 19:46:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ADD1E24000B;
 Thu,  6 Oct 2022 19:46:19 +0000 (UTC)
Date: Thu, 6 Oct 2022 21:46:18 +0200
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20221006214618.5c2e8a00@windsurf>
In-Reply-To: <20221005212150.1384370-4-aduskett@gmail.com>
References: <20221005212150.1384370-1-aduskett@gmail.com>
 <20221005212150.1384370-4-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665085579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VEImGcQfc2vyyTGxbNPMpNZmZztffwQu69YAL32RRYQ=;
 b=cw7akiNiKC3sCJC8MP2zmwl15O757Xs3mrDtF/OOh9+0RSt+UCdc6ljyn6l9DxYPt/uH6H
 8vWbgfXeC3RPZ9dA1t6QkvBp/L2Xcsz0TwlaDhv0UdY9QtB/AxEcblKwVzwLdRZAFF+fil
 V6CFWwIbFd6h0llzWGs/VowqW7yfZbNGxOvTjr3L8Xcas3KPae46fg2G0p779Ds1L52gGL
 FIE1HDyEldUZajzdLWVQFxRmHVuthUzYnaEV2oMn5mGbLyjnhxmYFQFwFEvHO78DALKRS0
 v8za2pCc/OBPXp0lfUpZc5QhS/cNjiuDr2Y7RLmogh1hw+PLKtbrC5T1QkqcgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cw7akiNi
Subject: Re: [Buildroot] [PATCH 4/4] package/mender-grubenv: bump version to
 2ac898f5924d5870f8394ad8ecd3ef1ab1422e3b
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  5 Oct 2022 14:21:50 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> diff --git a/board/mender/x86_64/genimage-efi.cfg b/board/mender/x86_64/genimage-efi.cfg
> index 10cefe2380..4ed064c498 100644
> --- a/board/mender/x86_64/genimage-efi.cfg
> +++ b/board/mender/x86_64/genimage-efi.cfg
> @@ -3,6 +3,9 @@ image efi-part.vfat {
>  		file EFI {
>  			image = "efi-part/EFI"
>  		}
> +		file grub-mender-grubenv {
> +		  image = "efi-part/grub-mender-grubenv"

Indentation here was not correct. I fixed that small nit and applied to
master. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
