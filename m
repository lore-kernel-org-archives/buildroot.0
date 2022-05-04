Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0B0C433EF
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 09:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B9A64185F;
	Wed,  4 May 2022 09:46:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mj3WR8ik6Q5r; Wed,  4 May 2022 09:46:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EF6241858;
	Wed,  4 May 2022 09:46:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A4C871BF239
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 09:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A132260E02
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 09:46:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SDM-qvbH6dkQ for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 09:46:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EED9C60AAA
 for <buildroot@buildroot.org>; Wed,  4 May 2022 09:46:03 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 478C444044E;
 Wed,  4 May 2022 12:45:07 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1651657507;
 bh=VLtrTw9Q9r7khU6BrH2FjHMWXbc4bSRWoegU7WXB7kk=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=l8UPdBQkqdW4N1h2ttef91GukMqEmpWnHn3mBQXlfOjCL+VPM93JmmKQVlRYAlovI
 teEqwPFCCD70B1Wa4G3hOqiTldCKBL52Vtl1Ih3rSMrVZldOfBjZxh5FqOmpmzCnsk
 BhVmndAQzzDaRQY2cwtTwlEUhqpcXJY+zYKhVzjk7K0ai+y/2ijdJFGQENiKrzUgAG
 bN/qvitOTNTIrQuxWmvP9Yc/o7QE4NEAbLh+Bd2LbLos2m3kUXv8k1xa72fLUzZog6
 FOdI2BePLG4uhCTFWmunXtZ0t1rcPjrbmb96j5XRqtSeI7SW2D7nTXuVigHpZoHY+s
 F5P8h/O0rm/mQ==
References: <20220504094006.1541643-1-c.leger@borea-dental.com>
User-agent: mu4e 1.6.10; emacs 27.1
To: Leger Charlie <c.leger@borea-dental.com>
Date: Wed, 04 May 2022 12:43:12 +0300
In-reply-to: <20220504094006.1541643-1-c.leger@borea-dental.com>
Message-ID: <875ymly6js.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] linux:linux.mk: Add "firmware-imx"
 dependency if needed
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Leger,

On Wed, May 04 2022, Leger Charlie wrote:
> Since SDMA firmwares for imx[6,7,8] are now provided only by firmware-imx package and not linux-firmware package [1].
> Linux build can failed if depending on firmware imx, so add firmware-imx dependency on linux if package is checked.

What build failure do you see when firmware-imx does not install before
kernel build? As far as I can see firmware files are only used at
run-time.

baruch

> [1] http://lists.busybox.net/pipermail/buildroot/2021-January/603807.html
>
> Signed-off-by: Leger Charlie <c.leger@borea-dental.com>
> ---
>  linux/linux.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 7ff7b05042..e40672ceca 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -73,6 +73,7 @@ LINUX_INSTALL_IMAGES = YES
>  LINUX_DEPENDENCIES = host-kmod \
>  	$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode) \
>  	$(if $(BR2_PACKAGE_LINUX_FIRMWARE),linux-firmware) \
> +	$(if $(BR2_PACKAGE_FREESCALE_IMX),firmware-imx) \
>  	$(if $(BR2_PACKAGE_WIRELESS_REGDB),wireless-regdb)
>  
>  # Starting with 4.16, the generated kconfig paser code is no longer

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
