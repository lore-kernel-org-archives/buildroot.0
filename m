Return-Path: <SRS0=xEd5=PS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800A6C433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 23:00:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF73C60ED5
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 23:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF73C60ED5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C214880D32;
	Sat, 30 Oct 2021 23:00:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d7uY2s24AuFG; Sat, 30 Oct 2021 23:00:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F7D280D31;
	Sat, 30 Oct 2021 23:00:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B945C1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 23:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A81B960763
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 23:00:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GntI8UZjlX6O for <buildroot@lists.busybox.net>;
 Sat, 30 Oct 2021 23:00:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp3.osuosl.org (Postfix) with ESMTP id 925B7605FE
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 23:00:28 +0000 (UTC)
Received: from [192.168.153.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id gxKtmoPu6rIRlgxKtm6qi9; Sun, 31 Oct 2021 01:00:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1635634827; bh=ibEfJPyAGtv9XEVbFrITiYnidjSxV+U8JHSPgLBDBok=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=b+G+QiGCkxFblVMPe9Xkt13KVhMsgTsh5JcjLGA80wyVZ8gFu3DJ2q7HUgZ/HAPRU
 tcta0/kFnrFXoxbkAXCqUPhtVNKxT203+WYxg/d1oPjGWy6qm5cdbkxfnEMyl6D8KB
 D3vQ6LZLYcaINEicSBmoDNLYJZWsaSO7kN7QYgIMHhk9nZf7XY1Ytctjo1+b0/Q9dC
 RSZjvYQysZR6sNeNk+JxO8zVFboYIt87T6Gt0IirhviBFvadi6ES8+p04bIJ/Mlb1u
 k+gQKiweuZApP/MRDvZTnWVgmWsQx6stjR6xaulrSOE3/0cTje4x53Q5s1nyH6h4Cz
 +24WIupHWg3iw==
To: buildroot@buildroot.org
References: <20211030192416.4012437-1-giulio.benetti@benettiengineering.com>
 <20211030192416.4012437-2-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <11c99146-cc9a-dbf5-daf9-cd3292eceaa7@benettiengineering.com>
Date: Sun, 31 Oct 2021 01:00:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211030192416.4012437-2-giulio.benetti@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfNviYkYMsD/wVI1uVP0yfPuH/bLdLETYHvF7cGjYmcrujfwB2iAaFZEeVqWkQ55N/ajjlslioy27v4pur0TOfNTc5QsQrtbYhNTp3nh++9bb3NQDTmoT
 JtTtCQ4Gem7x23DreE3bLF6OoI5JeJHxGkMvtKvNBJ+5EgiUGaMd/DUphvQaZ4HAhk5b4wC7/2DQICL+Vxioy1cb3eTRwlHSRLoLhgnkSmNmARY1d6iOJ2Zc
 aXtZrrIevyaARqvLS37dcg==
Subject: Re: [Buildroot] [PATCH 2/2] configs/asus_tinker_rk3288_defconfig:
 u-boot 2021.10 needs python3
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
Cc: Jagan Teki <jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Please drop this patch, I'm going to reword it and send the v2.

Sorry for the noise.

-- 
Giulio Benetti
Benetti Engineering sas

On 10/30/21 9:24 PM, Giulio Benetti wrote:
> U-boot 2021.10 requires pylibfdt and consequently Python3, so let's
> enable BR2_TARGET_UBOOT_NEEDS_PYLIBFDT
> and BR2_TARGET_UBOOT_NEEDS_PYTHON3. This fix CI failure:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729725
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   configs/asus_tinker_rk3288_defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/configs/asus_tinker_rk3288_defconfig b/configs/asus_tinker_rk3288_defconfig
> index 609d061b61..6963fa939f 100644
> --- a/configs/asus_tinker_rk3288_defconfig
> +++ b/configs/asus_tinker_rk3288_defconfig
> @@ -13,6 +13,8 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="tinker-rk3288"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>   BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>   BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
>   BR2_TARGET_UBOOT_FORMAT_DTB_BIN=y
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
