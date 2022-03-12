Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBDEC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 20:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88EFE82668;
	Sat, 12 Mar 2022 20:51:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JF2pKvff0U3r; Sat, 12 Mar 2022 20:51:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98B9182656;
	Sat, 12 Mar 2022 20:51:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F0B51BF3DD
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C207410B9
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:51:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hcQKNlriNrQq for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 20:51:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 813C3410B8
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 20:51:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:91a3:d0c0:1a06:f60f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 87EDC7802BE;
 Sat, 12 Mar 2022 21:50:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647118258;
 bh=VOjZwWnQOpa87TMbwwIKLJzBupkCNks/pku6c1oa3lw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IkK4ENBa4Z83ZwBuDF3uW3iTldi9e9oB3Wqruc6gG6OIR0kfqhkuF37sX7QerDw63
 qLi1Yi3HzXrOCVsXDRlBaXFM/UkiJicwlB8qCpLh35vdxP3h17Il8IWuWF9JbqXIZH
 L/tgj0u4r3D4XO9WKOOVp36oLdd066aG2EJ0fFZ5bFtCg6zAYu6bXjLXEHtuEIyJ8n
 h3OAAmfaXd2s74ODkFTXQJCJnW3lEVUHR/t6fcmfYJLQ8ySmesOQskwNXERUwwzla1
 yEhoZsaaLJonNwVyy/GOEbRonhrBu95+aEADfzv/lV5KhBNmushAainEfAE5hygPUD
 VtfYALqwEho1g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 12 Mar 2022 21:50:55 +0100
Date: Sat, 12 Mar 2022 21:50:55 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20220312205055.GO283544@scaer>
References: <200a0dbe075eee7e2c6d309e8a00d68f74b671c7.1646217112.git.stefan@agner.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200a0dbe075eee7e2c6d309e8a00d68f74b671c7.1646217112.git.stefan@agner.ch>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: Add Intel WiFi
 22000 series
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

On 2022-03-02 11:32 +0100, Stefan Agner spake thusly:
> Add Intel WiFi 22000 series firmware. This firmware supports WiFi 6
> models like AX200/AX201/AX210.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  package/linux-firmware/Config.in         | 6 ++++++
>  package/linux-firmware/linux-firmware.mk | 5 +++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
> index c94ffe24de..c9294956cc 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -175,6 +175,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_CYPRESS_CYW54XXX
>  	help
>  	  Firmware files for the Cypress cyw54xxx FullMAC.
>  
> +config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000
> +	bool "Intel Wireless 22000 series"

I've changed this to more closely match the other iwlwifi prompts that
follow.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +	help
> +	  Firmware files for the Intel Wifi 22000 devices supported by
> +	  the iwlwifi kernel driver.
> +
>  config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22260
>  	bool "Intel iwlwifi 22260"
>  	help
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index 2d103df05c..6502b90e2d 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -437,6 +437,11 @@ LINUX_FIRMWARE_FILES += wil6210.*
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000),y)
> +LINUX_FIRMWARE_FILES += iwlwifi-QuZ-*.ucode iwlwifi-Qu-*.ucode
> +LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22260),y)
>  LINUX_FIRMWARE_FILES += iwlwifi-cc-a0-*.ucode
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
