Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C999C48BF6
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 22:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44E74400C8;
	Sat, 24 Feb 2024 22:21:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HmTSjDhmgCoV; Sat, 24 Feb 2024 22:21:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D855940525
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D855940525;
	Sat, 24 Feb 2024 22:21:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA49E1BF681
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 22:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B779B81EC2
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 22:21:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0gsbHnn-8w4c for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 22:21:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.117;
 helo=smtpcmd11117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3371981EBE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3371981EBE
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3371981EBE
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 22:21:21 +0000 (UTC)
Received: from [192.168.50.163] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id e0OUrK14HQ6eAe0OUrtsCr; Sat, 24 Feb 2024 23:21:18 +0100
Message-ID: <4adf0b79-816e-45cb-b363-0ed25b59b6d0@benettiengineering.com>
Date: Sat, 24 Feb 2024 23:21:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
References: <20240224105554.17996-1-fancp2007@gmail.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240224105554.17996-1-fancp2007@gmail.com>
X-CMAE-Envelope: MS4xfOWAFXrIXPCKmKm0hNO/Zbr/+v0Zr8pchrH8SaUoqiTVIdd/3aX3KtzT5R/A11A6mcH8pqTH2JuqAZMVQ9KFBjotFPblX1Gs4wNW8+W56eu2BKuKLAG+
 F9DGC84zGdMqwQXeavm2lEZPX4IOwC3afsqEV6UZuWbJ9MOKBuTn372yh9r06+90XGH/VYQi7azeUZS7D4+P/ZrC0uYu2SLnpgANjgA1C/7LRroFPdp2TQkV
 6MjjXFfAQ2Om/X3kFmg2p2HItpYItLIyI41g3SwlRCdbK1dmURK9CUwmBQj2SlPy
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708813278; bh=aMEkZReeKOn0Ai/eH51SedT6qiiFFaX0IuAzMdbZ8S0=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=ChdZILOslVVpV/5E3B0/S41APzR5VpWWK9sA5fwIqXs+Q0boWYKDlnBVvHgrgTjej
 1fIcdZrVIaaWLnfftgFKlUfuEcQDwjTdx583OSZFpfqs6P8/X3qOgDL++dW88VN9ug
 lMzRH8ORFxVtBoPRgoHGVJ64pbbNrF1/80ZzLWycqiY56v1l04DjDxvdIl4cpmB77t
 OZp9fmVOXCxlu+4a3URIHJkE1JMyFmltTLKcsgpo2ndmeJPryLA/ApzzrNjOdZvwPt
 UbS25zmrEFtrzgdGeWvzUcw8sM5UpIZvGJb0/glF/COZ3BgM6H78Si+S8slQgrqt+A
 AILmUP+ywg+1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=ChdZILOs
Subject: Re: [Buildroot] [PATCH] configs/beaglebone_defconfig: bump Linux to
 6.1.69-ti-r25 and U-Boot to 2024.01
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
Cc: Lothar Felten <lothar.felten@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Scott,

On 24/02/24 11:55, Scott Fan wrote:
> Tested on beaglebone black.
> 
> [1] https://github.com/beagleboard/linux/releases/tag/6.1.69-ti-r25
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

It looks good to me and I've built successfully using docker-run so:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> ---
>   configs/beaglebone_defconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
> index e2d67019b1..cdd6591f6d 100644
> --- a/configs/beaglebone_defconfig
> +++ b/configs/beaglebone_defconfig
> @@ -17,7 +17,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglebone/genimage.cfg"
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.1.46-ti-r13)/linux-6.1.46-ti-r13.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.1.69-ti-r25)/linux-6.1.69-ti-r25.tar.gz"
>   BR2_LINUX_KERNEL_DEFCONFIG="bb.org"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless am335x-bonegreen-wireless"
> @@ -31,7 +31,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_OPENSSL=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
