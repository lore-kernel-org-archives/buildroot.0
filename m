Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBAA0C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 22:12:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41B9061073
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 22:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 41B9061073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12ACC82C38;
	Thu, 14 Oct 2021 22:12:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OFcwPYQ6aetX; Thu, 14 Oct 2021 22:12:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 670A882C18;
	Thu, 14 Oct 2021 22:12:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 80F3D1BF37B
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D11060830
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GjsyZRRusaUo for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 22:12:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E0916081F
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 22:12:41 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id b8xsmxCJ3XRKtb8xsmFppC; Fri, 15 Oct 2021 00:12:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634249560; bh=Ph4QhhPN/KPikllXjbO9C9AgN38bPhywyYgb4wzcK84=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=PSqZl7W+SH3Pk1e7he8fHBvJUJFhojYB0MknDK/ymyod2b6qcu2OPTky5eF0Jc6fG
 FaEOnoWArh0XtCm0DkiOL03Hb/ZtYbubuHmffbmgkj//pj2NGIH6gdEs6k7GMAJLxP
 GAcIsQRzr/9vkcpesv5D4VDzl2iqDtjKvoAVx2rPG4Uw2Sl8I4InXOjelyaLyWQGvU
 G5/P7G0vxU491aT0fcQmeE5eXWkcS/0PyxVifx2nOX15z5BvouHhY0GQxoXuA5UvrT
 YWMl2z/D+GpNAHbMOzx7er5jkudOkktyVinijS1IrLXAvjy3rTfsYN/F/QWisxRUtO
 73rC/GKk+QOrw==
To: buildroot@buildroot.org
References: <20211014204643.2433721-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <be4f2e4a-4068-6467-27fa-df96969f1049@benettiengineering.com>
Date: Fri, 15 Oct 2021 00:12:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211014204643.2433721-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfF3DSfH4fAtgXkfSTEyrwimIn0Pio/q0XIyYXdacgA+BYZEQgynSaFrJBMwS3SQqc27GKcGeEhokCa9aDU1x81q2fyoyPistlooHiM6+aoRpS0KjHfKA
 4Kn7KWi88TDWzBED9sh2PVWepN15j2sAFNxhQG0uNBHaV7sNHrx5FpaYv1zS+M7DgnoP/TaGoJVH/XbaZF3+8bHlzRpjTgUBoac=
Subject: Re: [Buildroot] [PATCH] package/sunxi-mali-mainline-driver: update
 help section to make it work on Linux >= 4.20
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/14/21 10:46 PM, Giulio Benetti wrote:
> On Linux version >= 4.20 we need to pass
> drm_kms_helper.drm_leak_fbdev_smem=1 to make this driver to work.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/sunxi-mali-mainline-driver/Config.in | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/package/sunxi-mali-mainline-driver/Config.in b/package/sunxi-mali-mainline-driver/Config.in
> index 5db66c5bf6..9bc80944fb 100644
> --- a/package/sunxi-mali-mainline-driver/Config.in
> +++ b/package/sunxi-mali-mainline-driver/Config.in
> @@ -25,5 +25,8 @@ config BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER
>   	  starting from Linux Kernel >= 4.20 following options must be
>   	  enabled:
>   	  - CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM
> +	  and following kernel command-line must be passed:
> +	  `drm_kms_helper.drm_leak_fbdev_smem=1`
> +	  since drm_kms_helper.drm_leak_fbdev_smem is set to 0 by default
>   
>   	  https://github.com/mripard/sunxi-mali/blob/master/README.md

This also needs drm_kms_helper.drm_fbdev_overalloc=200 at least too as 
olinuxino patch:
https://patchwork.ozlabs.org/project/buildroot/patch/20211014213630.2436055-1-giulio.benetti@benettiengineering.com/
I'm going to send a v2 patch for this.

Sorry again for the noise
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
