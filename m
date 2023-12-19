Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E32C41535
	for <buildroot@archiver.kernel.org>; Tue, 19 Dec 2023 16:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4439C40128;
	Tue, 19 Dec 2023 16:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4439C40128
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jJXQIp9GoL6P; Tue, 19 Dec 2023 16:08:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34BC340545;
	Tue, 19 Dec 2023 16:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34BC340545
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C85AC1BF2C0
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 16:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72E2E80897
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 16:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72E2E80897
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id McvcxqGTS0Bg for <buildroot@lists.busybox.net>;
 Tue, 19 Dec 2023 16:08:18 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B89BA82456
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 16:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B89BA82456
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5B63240006;
 Tue, 19 Dec 2023 16:08:14 +0000 (UTC)
Date: Tue, 19 Dec 2023 17:08:13 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231219170813.581a2065@windsurf>
In-Reply-To: <20231218212613.1201821-1-adam.duskett@amarulasolutions.com>
References: <20231218212613.1201821-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703002094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q175xSLzL6ZlWF7GCAApt8VLRbvW1q3Au9qHgUjqG0o=;
 b=cNFdNDC1yjh36egW8Osk4CsE7R4wkTGZpnqEMOVQZQFAy0inhOsh5JDY/Xws/BTf4f10oc
 vPwsuNpeYNbMqQSyrzbZ8W+R54EFug0bbeTwDe4Ox9g7yYHnjRuI1t+qU8aKk8nkx2MPGZ
 GSpqHqImLZUd6Feyi7dypbb/01UvKpwmLf8hhG2KQC0FnBvrrDTszRvLVpCtK0Bk2mC/e8
 wuPr6NM6Ql3NEbAJwI8q5pQ6+RWRF9RIZedqMlslbbKuQWuTYhalWQ4jpJRZfkQEP6+r8Z
 zOrmwExE5cIZivtEsHwTfnec4axZudhJpy2B1xzNp1My6LZkJU/+POj7x8vO/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cNFdNDC1
Subject: Re: [Buildroot] [PATCH v2 1/6] configs/mender_x86_64_efi_defconfig:
 Update kernel to latest LTS version
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

On Mon, 18 Dec 2023 14:26:08 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> 5.18 is not a LTS version. Let's update the kernel to use the LTS 6.1 kernel.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
> v1 -> v2: Bump kernel version from 6.1.58 to 6.1.68
> 
>  configs/mender_x86_64_efi_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
> index 25a463abb3..260cd8a1e2 100644
> --- a/configs/mender_x86_64_efi_defconfig
> +++ b/configs/mender_x86_64_efi_defconfig
> @@ -39,7 +39,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="--data-part-size=32M --device-type=buildroot-x86_64
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18.14"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.68"

You probably also want to change:

BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_18=y

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
