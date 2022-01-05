Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0143DC433EF
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 21:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8CA7409BA;
	Wed,  5 Jan 2022 21:02:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vil130mOYxD3; Wed,  5 Jan 2022 21:02:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB7ED410B6;
	Wed,  5 Jan 2022 21:02:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 659BE1BF955
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 21:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 542C681404
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 21:02:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H8N00DJZIXzB for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 21:02:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 777C1813C5
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 21:02:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:91d2:d1c6:5626:51cd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id A79637802CE;
 Wed,  5 Jan 2022 22:02:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641416536;
 bh=EM/pO2jy0xfBb280UrbRmbG5J5ElIxRdEYLgRgA+I3Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pdpWAR2BcXPhsW/I6Uy8yXAceHga4/JnKukxcMoi6NO6XP1kODniUCe3NBewE2rdO
 ERGE1pUhJq+0OKOHUNCutkFu+VbV0zAsFaIcqLA+0iJathe2fTXaXo/QdfkVZxUrOf
 pGUamTaKsCNixeNnURcQInrk26wXyyD8w3gb6oN7uqynIxjk+krPQT4vXUaBafpW4i
 xQ3E3dQmkgMPr5rJmoa3r/j4Zm66TTjHjItxZxKdA+yEOeO/Ono/JwvJJ6UNcAwiS8
 zW9RY2v6wcrxFA4IZgd1Y1mnhVVHeg6EZ5r8lQHvqywmCPeVHIupCNXBJNC4EiJQ1c
 +R1ZkV+y/FfQw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 05 Jan 2022 22:02:08 +0100
Date: Wed, 5 Jan 2022 22:02:08 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220105210208.GJ614810@scaer>
References: <20220105180402.388388-1-fontaine.fabrice@gmail.com>
 <20220105180402.388388-4-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220105180402.388388-4-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 4/4] package/android-tools: add host gcc >=
 5 dependency
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Clayton Shotwell <clayton.shotwell@collins.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-01-05 19:04 +0100, Fabrice Fontaine spake thusly:
> Commit 56d9b887685c86fd4fbadda247cdbe733d499e81 forgot to add host
> gcc >= 5 dependency
> 
> Fixes:
>  - No autobuilder failures (yet)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/android-tools/Config.in.host | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/android-tools/Config.in.host b/package/android-tools/Config.in.host
> index 433f4e384f..576e53e8b5 100644
> --- a/package/android-tools/Config.in.host
> +++ b/package/android-tools/Config.in.host
> @@ -10,12 +10,16 @@ config BR2_PACKAGE_HOST_ANDROID_TOOLS
>  if BR2_PACKAGE_HOST_ANDROID_TOOLS
>  
>  config BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT
> +	depends on BR2_HOST_GCC_AT_LEAST_5 # host-libselinux -> host-libsepol
>  	bool "fastboot"
>  	help
>  	  This option will build and install the fastboot utility for
>  	  the host, which can be used to reflash target devices
>  	  implementing the fastboot protocol.
>  
> +comment "fastboot needs a toolchain w/ host gcc >= 5"
> +	depends on !BR2_HOST_GCC_AT_LEAST_5
> +
>  config BR2_PACKAGE_HOST_ANDROID_TOOLS_ADB
>  	bool "adb"
>  	help
> @@ -24,10 +28,14 @@ config BR2_PACKAGE_HOST_ANDROID_TOOLS_ADB
>  	  implementing the ADB protocol.
>  
>  config BR2_PACKAGE_HOST_ANDROID_TOOLS_EXT4_UTILS
> +	depends on BR2_HOST_GCC_AT_LEAST_5 # host-libselinux -> host-libsepol

    $ make check-package
    package/android-tools/Config.in.host:14: attributes order: type, default, depends on, select, help (http://nightly.buildroot.org/#_config_files)
    package/android-tools/Config.in.host:32: attributes order: type, default, depends on, select, help (http://nightly.buildroot.org/#_config_files)   

Applied to master after fixing this, thanks.

Regards,
Yann E. MORIN.

>  	bool "ext4 utils"
>  	help
>  	  This option will build and install the ext4 utils for the
>  	  host, i.e. make_ext4fs, ext4fixup, ext2simg, img2simg,
>  	  simg2img and simg2simg.
>  
> +comment "ext4 utils needs a toolchain w/ host gcc >= 5"
> +	depends on !BR2_HOST_GCC_AT_LEAST_5
> +
>  endif
> -- 
> 2.34.1
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
