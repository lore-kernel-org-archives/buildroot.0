Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2121AC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 19:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0AE84093D;
	Sun,  3 Apr 2022 19:13:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n5bHG0o7U7rT; Sun,  3 Apr 2022 19:13:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A449408BB;
	Sun,  3 Apr 2022 19:13:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 73A921BF36B
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 19:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 581AF416D8
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 19:12:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i33ILxGlZTTG for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 19:12:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13BAA416D5
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 19:12:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:314c:79b0:cf44:9021])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2ECC813F895;
 Sun,  3 Apr 2022 21:12:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649013166;
 bh=Jt5EJ1PmuXeEt8yKvx0EmL5fQnuZnsUUPUBznfyOssY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rKdfo0JGjINgz0cIC9ejORAVZWxMZu0zabbcUmHKwt8+TNRTH+2DmIfNe0M2MrRE9
 VQpJ0BKyPMY9bxqrHwT1wpn1HVJrmtRcwz80Ph8IX8KXSwaVUGGAWK/6KzT3wO71rD
 gUZitIdmxZ3B1PFR+jSh/64X1whsUUB646cJMWCPr500oT+oqXbgV3VFFp1Wy3uu1k
 X+Vv6yqovzNgFpIkXow8srTXz0ThSWzf0FaYRZvs6ZabaN6DMksF/yCzCQeyj7IZYq
 SzWdygO5W6T+yujbdZHACq4CxnkxjqdMnYBzgW3s5rNVs4KnMN//xKtP/Kd2bzF7bf
 gSujxmzG/jzIg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Apr 2022 21:12:43 +0200
Date: Sun, 3 Apr 2022 21:12:43 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20220403191243.GJ1811301@scaer>
References: <e73a57b032c8683fa6f9f45a0cec62468742f5a5.1648829237.git.stefan@agner.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e73a57b032c8683fa6f9f45a0cec62468742f5a5.1648829237.git.stefan@agner.ch>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: Add Intel WiFi
 3945ABG/BG/4965AGN
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Stefan, All,

On 2022-04-01 18:07 +0200, Stefan Agner spake thusly:
> Add Intel WiFi 3945ABG/BG and 4965AGN firmware. This firmware is
> required for the iwl4965 and iwl3945 kernel driver.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  package/linux-firmware/Config.in         | 12 ++++++++++++
>  package/linux-firmware/linux-firmware.mk | 10 ++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
> index 4a44d4a2b6..a9a7e914cf 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -199,6 +199,18 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3168
>  	  Firmware files for the Intel Wifi 3168 devices supported by
>  	  the iwlwifi kernel driver.
>  
> +config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3945
> +	bool "Intel iwlwifi 3945"
> +	help
> +	  Firmware files for the Intel Wifi 3945 devices supported by
> +	  the iwl4965 kernel driver.
             ^^^^
Here...

> +config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_4965
> +	bool "Intel iwlwifi 4965"
> +	help
> +	  Firmware files for the Intel Wifi 4965 devices supported by
> +	  the iwl3945 kernel driver.
             ^^^^
... and here, I guess there is an issue with the drivers names.

I've switched the two, and applied to master, thanks.

And I had to do a follow-up commit because I improperly fixed them...

Regards,
Yann E. MORIN.

> +
>  config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000
>  	bool "Intel iwlwifi 5000"
>  	help
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index 2eec8a291a..0c725737d0 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -457,6 +457,16 @@ LINUX_FIRMWARE_FILES += iwlwifi-3168-*.ucode
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3945),y)
> +LINUX_FIRMWARE_FILES += iwlwifi-3945-2.ucode
> +LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_4965),y)
> +LINUX_FIRMWARE_FILES += iwlwifi-4965-2.ucode
> +LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
> +endif
> +
>  # iwlwifi 5000. Multiple files are available (iwlwifi-5000-1.ucode,
>  # iwlwifi-5000-2.ucode, iwlwifi-5000-5.ucode), corresponding to
>  # different versions of the firmware API. For now, we only install the
> -- 
> 2.35.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
