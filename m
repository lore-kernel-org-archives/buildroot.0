Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E71EC433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 20:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0131881425;
	Tue,  1 Feb 2022 20:04:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qt20HRRVYV7p; Tue,  1 Feb 2022 20:04:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E478813FD;
	Tue,  1 Feb 2022 20:04:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 483141BF293
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 20:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30ECA813FD
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 20:04:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5vb5jMHEhPhT for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 20:04:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61B01813E3
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 20:04:16 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so3784092pjp.0
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 12:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mvQjHZld0YbyHqJF6KKpXs/9uELLFY9AvqOFlclxWJg=;
 b=cEo3geEyrE5A4N9cclfCF5F+s/jAj7K8fq03YKNL/Sg0ltu8BNbayarEVC4Q6NSi4a
 lxSMTIdjdP/1mGjl+h5MrPWx7tb4nI3ySnfRdTujNeCZ8Z/pBqLmKxfaXBmW6IJ565w5
 AZT5f83/fJ8lRfriMyHqTa1PIIk9p83zvEQxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mvQjHZld0YbyHqJF6KKpXs/9uELLFY9AvqOFlclxWJg=;
 b=sNhsLi4mIuOWF6anXvL+j0iIBAynfZtMYSAlxI94UcMnAZ/DSwTNOAmtQwXexh46oX
 7EYtoboV7dytXK7vgA3v4eVhHDnTmFOQZNfmw3gsxsTLSftPa5Rs1C81iQ8KM1k/gM8F
 m/giQ+WcY2yzENzmFSvUANe07azP6SCV/4mhwdcO+WV6np+lE52BMYSDbZJDXkpOo6zW
 0dUwwMZCJWONbhKHkA5F/8cOaacYV/nEmAqlnCyIU9E2Vt0vzpPAjUmQVQ8xCJfuVgB5
 1dRDEpsslvhmWY5OFPxW4VBFuUgIL52g3XZtrdw0nzwME3qpI01Zr51ulx4Uh/OMqv6R
 aC8Q==
X-Gm-Message-State: AOAM533cccBvkkjcG0+e+FGr74xTd09YS63vnE1ii2X5toWq9FHkuitj
 yAc0vHvvWGrGN1sXKOnKDkYc1U9QInw462wRo1XmNg==
X-Google-Smtp-Source: ABdhPJyrQVqjc9/cwi7gcoE/cc/4mtWoPyMZjsLXDkL2jA0hSWJWRXkY+elgbmB/D3TqjyzzmaKdbpRjfyFI21/LvlQ=
X-Received: by 2002:a17:90b:300c:: with SMTP id
 hg12mr4219763pjb.118.1643745855531; 
 Tue, 01 Feb 2022 12:04:15 -0800 (PST)
MIME-Version: 1.0
References: <20220201183331.4009320-1-giulio.benetti@benettiengineering.com>
 <20220201183331.4009320-4-giulio.benetti@benettiengineering.com>
In-Reply-To: <20220201183331.4009320-4-giulio.benetti@benettiengineering.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 1 Feb 2022 21:04:04 +0100
Message-ID: <CAOf5uwk-4AHxxdbzuLYcEUx+NQQDJXfCtg-5_WmGzWPG0vVAsA@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 3/6]
 configs/microchip_sama5d2_icp_mmc_defconfig: linux needs host openssl
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
Cc: Eugen Hristev <eugen.hristev@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio

On Tue, Feb 1, 2022 at 7:34 PM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:
>
> Fixes:
> https://gitlab.com/ymorin/buildroot/-/jobs/2035821094
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  configs/microchip_sama5d2_icp_mmc_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/configs/microchip_sama5d2_icp_mmc_defconfig b/configs/microchip_sama5d2_icp_mmc_defconfig
> index 4bb3625f83..27ea4970f1 100644
> --- a/configs/microchip_sama5d2_icp_mmc_defconfig
> +++ b/configs/microchip_sama5d2_icp_mmc_defconfig
> @@ -12,6 +12,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,li
>  BR2_LINUX_KERNEL_DEFCONFIG="sama5"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d2_icp"
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y

I can see that my submission help on those patches

Reviewed-by: Michael Trimarchi <michael@amarulasolutions.com>

Michael

>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> --
> 2.25.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot



-- 
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
