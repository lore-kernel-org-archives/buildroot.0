Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D748C4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 08:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 300E660AB1;
	Sun, 14 Jan 2024 08:59:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 300E660AB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SHGL-oLVHUD4; Sun, 14 Jan 2024 08:59:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1844160AB2;
	Sun, 14 Jan 2024 08:59:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1844160AB2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF23A1BF267
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 08:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6C1841B41
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 08:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6C1841B41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3pE3tLsqMlDP for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 08:59:21 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D48041B36
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 08:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D48041B36
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7137F13F8A2;
 Sun, 14 Jan 2024 09:59:16 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Jan 2024 09:59:16 +0100
Date: Sun, 14 Jan 2024 09:59:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Yang Li <yang.li@amlogic.com>
Message-ID: <ZaOiZNVvO7OuK3sC@landeda>
References: <20240103073954.3555165-1-yang.li@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240103073954.3555165-1-yang.li@amlogic.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705222759;
 bh=Gn555WynOTqBW/b9A/7CW6+bdDr/8fJVFqqS5ONm4Ek=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VDENrHlh6UAq5xw8UYmL8oCztCzujpQaSjKX6xbvHsxamgqAF8JB4qiDi+OK6F1Zy
 2s/Xw7iFXONM0UCaDQg5AtxwAJcROmbMufqEdAJMwKzGdd3VD/a2En3vp+9eLx0bBK
 SBmmmF+akmP45SuLi5SetvOku+6ImZM08MfP1Bu+ERPXMyqbTUi7jeXh4+NmUPo6bh
 B9f5Bm1LKTKLWF7mYAwkthDfbhBAaVEGwVycTmHv9VVxf1NKzIHgNfbAOI+T54HCO3
 l0MUa8n7ETuH0sS7pIhQ3bbu6X6eqK4Sh4iZuje9p3kH+Fc2UW4N9cWBYhUF7XsWxy
 lt/kDvTeQsUDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VDENrHlh
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: add support of
 Amlogic bluetooth firmware
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yang Li, All,

On 2024-01-03 15:39 +0800, Yang Li spake thusly:
> Add support of Amlogic bluetooth firmware.
> 
> Signed-off-by: Yang Li <yang.li@amlogic.com>
> ---
>  package/linux-firmware/Config.in         | 9 +++++++++
>  package/linux-firmware/linux-firmware.mk | 6 ++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
> index 5befe50122..9b7ead89d9 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -602,4 +602,13 @@ config BR2_PACKAGE_LINUX_FIRMWARE_CX231XX
>  
>  endmenu
>  
> +menu "Amlogic Firmware"

As the commit log states, and the file path implies, it is a Bluetotth
firmware, so there is no need for a new submenu, and I moved the entry
to the Bluettoth submenu.

> +config BR2_PACKAGE_LINUX_FIRMWARE_AMLOGIC
> +	bool "Support Amlogic SOC firmware"
> +	help
> +	  Firmware files for Conexant Amlogic SOC driver.
> +
> +endmenu
> +
>  endif
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index 96905dd909..4d02aeb714 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -811,6 +811,12 @@ LINUX_FIRMWARE_FILES += v4l-cx231xx-avcore-01.fw
>  # which is installed unconditionally
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AMLOGIC),y)
> +LINUX_FIRMWARE_FILES += amlogic/bluetooth/*.bin
> +# No license file; the license is in the file WHENCE
> +# which is installed unconditionally

Actually, there is one, aptly named LICENSE.amlogic, which is also
referred to in the WHENCE file. So I added it, and aded a hash for it
too. Please check on your side that you get the same hash as the one I
added.

Applied to master with the above fixes, thanks.

Regards,
Yann E. MORIN.

> +endif
> +
>  ifneq ($(LINUX_FIRMWARE_FILES)$(LINUX_FIRMWARE_DIRS),)
>  
>  define LINUX_FIRMWARE_BUILD_CMDS
> -- 
> 2.42.0
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
