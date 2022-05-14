Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB570C433FE
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 13:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E94641764;
	Sat, 14 May 2022 13:36:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3qNqHnz_bMHo; Sat, 14 May 2022 13:36:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E479F41751;
	Sat, 14 May 2022 13:36:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C3C91BF48C
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 13:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6936660BAB
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 13:36:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hxHhIA9HAipr for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 13:36:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82FDF60AFF
 for <buildroot@buildroot.org>; Sat, 14 May 2022 13:36:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:71f3:9479:94db:16e0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8016F13F88A;
 Sat, 14 May 2022 15:36:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652535404;
 bh=IMa3H7coVkJZi3Y8Gnnu2ayZecBJHlcPaJdTkGnNl70=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AExDmukL2aCzncm1BfC6+toYRWlXZlrd+NyYEWnNRkHlLf1yEET4gPjYSFk3cjXZO
 j1UztolOkbVr0o0vbDlugoXUy456sdF4WzL2l3VH4XGPEw/J43/ubDoLKfJejJcfK2
 w7veIX1DFmhECdJL3t6hW3ySGysZPAYMYxKOCHn2P7vzHyk5e/O/RywmZ6DvKXBzRK
 BIwTBJR10kR3Ee60afMbWfhsG9yGdoKvN9rQetVyudHkGweQMWQAy5tjvev5oUOiDz
 GDXG/0c/+GJpJYaINzUGFvYYU2n52VAstVxRG3kKbIfTNpDNBNIP8bDv5G09etOj9R
 TfaMd6zmOaGNg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 May 2022 15:36:41 +0200
Date: Sat, 14 May 2022 15:36:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220514133641.GZ1597494@scaer>
References: <20220514092152.1625466-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220514092152.1625466-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/v4l2loopback: add
 V4L2LOOPBACK_LINUX_CONFIG_FIXUPS
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
Cc: Alexandre Esse <alexandre.esse.dev@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-05-14 11:21 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure:
> 
> ERROR: modpost: "video_ioctl2" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
> ERROR: modpost: "__video_register_device" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
> ERROR: modpost: "v4l2_ctrl_new_custom" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
> ERROR: modpost: "v4l2_ctrl_handler_init_class" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
> ERROR: modpost: "video_device_alloc" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
> ERROR: modpost: "v4l2_device_register" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
> ERROR: modpost: "video_device_release" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
> ERROR: modpost: "v4l2_ctrl_handler_free" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
> ERROR: modpost: "v4l2_device_unregister" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
> ERROR: modpost: "video_unregister_device" [/nvmedata/autobuild/instance-10/output-1/build/v4l2loopback-0.12.5/./v4l2loopback.ko] undefined!
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/640f8f61c7f433ffe5e9a6759eecc9a03f735569
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/v4l2loopback/v4l2loopback.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/v4l2loopback/v4l2loopback.mk b/package/v4l2loopback/v4l2loopback.mk
> index 7701bc3a30..712088b6b0 100644
> --- a/package/v4l2loopback/v4l2loopback.mk
> +++ b/package/v4l2loopback/v4l2loopback.mk
> @@ -15,5 +15,10 @@ define V4L2LOOPBACK_INSTALL_TARGET_CMDS
>  endef
>  endif
>  
> +define V4L2LOOPBACK_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_MEDIA_SUPPORT)

This one depends on CONFIG_HAS_IOMEM, which is always true, except on
s390x (needs PCI) or uml (but we don't support UML).

> +	$(call KCONFIG_ENABLE_OPT,CONFIG_VIDEO_DEV)

That one also depends on CONFIG_I2C (which has no dependency).

So, maybe:

    define V4L2LOOPBACK_LINUX_CONFIG_FIXUPS
        $(if $(BR2_s390x),$(call KCONFIG_ENABLE_OPT,CONFIG_PCI))
        $(call KCONFIG_ENABLE_OPT,CONFIG_MEDIA_SUPPORT)
        $(call KCONFIG_ENABLE_OPT,CONFIG_I2C)
        $(call KCONFIG_ENABLE_OPT,CONFIG_VIDEO_DEV)
    endef

Cordialement,
Yann E. MORIN.

> +endef
> +
>  $(eval $(kernel-module))
>  $(eval $(generic-package))
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
