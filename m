Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D32C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 22:11:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E399A610F8
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 22:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E399A610F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE9F3406B9;
	Thu, 14 Oct 2021 22:11:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BhHsPDtJDqUA; Thu, 14 Oct 2021 22:11:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A74740534;
	Thu, 14 Oct 2021 22:11:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 67D611BF37B
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 567FB4046C
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:11:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bkB6HOxflsQb for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 22:11:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp2.osuosl.org (Postfix) with ESMTP id 747E840017
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 22:11:13 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id b8wSmxBDmXRKtb8wSmFpD9; Fri, 15 Oct 2021 00:11:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634249472; bh=yX76QDy6yfVjcJ3fONDMaJ3CM5KjoMoNTsHiqDIyvfY=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=WVxflcGLsvGmUaraLku7BV1h4UQ1xNwX7t5Nvs83xEQmr1Y+lFNQJWMzDqOd/av14
 DbMYnsMSJymdmjpSps0fl7IHVnjSmWYqACErw/e5RfCLeK9QRY/3MIGpLGEQdyRYZQ
 yqiXgNhRiRrPj0eiDBYfelCP4IWCeIgjZr6kMVmsEBEErdG3EibnAVax2AhmPxrqVe
 ZHHokVINF/aQarTfQpxj3iowpHG0n9CkeEhK6siCP2674q1n3IrejmM8N4fIoXP6p5
 HzaVwgJtklXwceFsyf7r7Tnc3zEn4fmE/xT2s5RmmjBpWa9Ily9irbzS+3JMzQLjK5
 Ln3K9kbPu+KKA==
To: buildroot@buildroot.org
References: <20211014213630.2436055-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <e0aa4d38-ef32-8c57-7597-017e86d1ecf8@benettiengineering.com>
Date: Fri, 15 Oct 2021 00:11:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211014213630.2436055-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfMZQsj8TBCfgAuAYPDR1xtVmKXIARNTOeUR08GVnYJfSJaj3vQsw7urnFoKdVpkmUMgebBzr0cIHqbgbVkyfVBSnWj1AvRWnxBfrTvwkFObPTux/aFFT
 3QC1JuXP5ztf+oAGDXvhVuKIg3uxL93q7X686DTSzjPqnECqHaIpbnSLdGzyxwaDw3GjFwPGTGFNvpjjeg4bXVb71TCpcqReAvczQq3JAyStHF9TWYBHKd0e
 2S83J5tXQcEruJij5K3EhxyQxPGP9+tifKwdrPHyzes=
Subject: Re: [Buildroot] [PATCH] configs/olimex_a20_olinuxino: fix mali not
 working because Linux version >= 4.20
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/14/21 11:36 PM, Giulio Benetti wrote:
> Since on olinuxino_lime/lime2 we have a Linux version >= 4.20 we need to
> pass drm_kms_helper.drm_leak_fbdev_smem=1 to kernel command-line that
> really enables DRM_FBDEV_LEAK_PHYS_SMEM. CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM
> only adds the code for this, but drm_leak_fbdev_smem is 0 by default, so we
> need to override it. This fixes both olimex_a20_olinuxino_lime and lime2
> that use extlinux.conf.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   .../a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf b/board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
> index f754da3623..25ee0c349c 100644
> --- a/board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
> +++ b/board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
> @@ -1,4 +1,4 @@
>   label Olinuxino
>       kernel /boot/zImage
>       fdtdir /boot
> -    append console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
> +    append console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 drm_kms_helper.drm_leak_fbdev_smem=1 ${extra}
> 

This lacks drm_kms_helper.drm_fbdev_overalloc=200 too at least. I'm 
going to send a v2 for this.

Sorry for the noise
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
