Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB25C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E36382425;
	Mon, 15 Aug 2022 09:29:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E36382425
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B0vuUSRZOmnI; Mon, 15 Aug 2022 09:29:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A145823E2;
	Mon, 15 Aug 2022 09:29:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A145823E2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D8F81BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA5AA409A2
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA5AA409A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0fFP-hcNs7eu for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:29:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1123840994
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1123840994
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:29:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E1FC020002;
 Mon, 15 Aug 2022 09:29:41 +0000 (UTC)
Date: Mon, 15 Aug 2022 11:29:40 +0200
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Message-ID: <20220815112940.1e659ea2@windsurf>
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660555782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+G8xI2HHERIA74tORc6j67KFP0dslXn2XCovUX0LJdg=;
 b=HQqFr22WvV7T3gPc906U8zG/XB86q8HLXcJa60djxdPUXwd/C7VhXCjVUTpNCSUBHRahQu
 0zudAlK5bx9FuWdyaDeffSihxzc/teoaRe1yQtn9Co6n5Kws9DOxHNwBDC0qrIrc7Evhiy
 qdaybegRDJVmA5LQWPmY3a+x8w82tabFiWf5HKQYBe1kXmpr2L4rswrcxIb4cTVyI5WA5/
 Ed/2EaFtogvCHW1Fc8fasek+iXZc5NGuEQjvhUW58DhNp5CfMrnyUIZxPH4nyaQ4vLpRmi
 h+fWnPrXrSt8JlpvLZpWTDNspxxmJDIjV6Dvc23z5hz6WZKjAka1jWlqaBu3lA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HQqFr22W
Subject: Re: [Buildroot] [PATCH 00/33] fix typos
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ricardo,

On Sun, 14 Aug 2022 20:38:12 -0300
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:

> Ricardo Martincoski (33):
> 1) typos on help and internal variables, found by code inspection:
>   package/tclap: fix typo on help
>   package/ti-gfx: fix typo on help
>   package/gcnano-binaries: fix typo on help
>   package/ace: fix typo on variable names
> 2) for consistency:
>   package/c-capnproto: use space after depends on
>   package/kvm-unit-tests: do not use "select...if SYMBOL=y"
>   Config.in.legacy: add missing select
> 3) typos on symbols used by packages:
>   package/libvncserver: fix typo on BR2_nios2
>   package/libgpg-error: fix typo for BR2_aarch64_be
>   package/freeswitch: fix typo on BR2_powerpc64le
>   package/uclibc: drop old SPARC symbols
>   package/tcf-agent: drop bogus BR2_powerpcle
>   package/qemu: fix typo on STAGING_DIR
>   package/tesseract-ocr: fix typo on BR2_PACKAGE_TESSERACT_OCR_LANG_GER
>   package/wolftpm: fix typo on BR2_PACKAGE_WOLFTPM_NUVOTON
>   package/kodi: fix typo on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11
>   package/sconeserver: fix typo on BR2_STATIC_LIBS
>   package/libglvnd: fix typo on BR2_PACKAGE_XORGPROTO
>   boot/optee-os: fix typo on BR2_TARGET_OPTEE_OS_LATEST
>   package/busybox: fix typo on BR2_PACKAGE_NETCAT_OPENBSD
>   package/jquery-ui-themes: fix typo on
>     BR2_PACKAGE_JQUERY_UI_THEMES_VADER
>   package/gstreamer1/gst1-plugins-bad: fix typo on
>     BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
>   package/pcsc-lite: fix typo on BR2_PACKAGE_PCSC_LITE_*
> 4) bogus symbols referenced by packages
>   package/zeek: drop bogus PYTHON3_HASHLIB
>   package/cups: drop bogus libpaper dependency
>   package/ranger: drop bogus BR2_PACKAGE_PYTHON_PYC_ONLY
>   package/openocd: drop bogus BR2_PACKAGE_OPENOCD_ZY1000*
>   package/directfb: drop bogus BR2_PACKAGE_DIRECTFB_CYBER5K
>   package/x11r7/xserver_xorg-server: drop bogus
>     BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
>   package/gstreamer1/gst1-plugins-good: drop bogus
>     BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB
>   package/libsepol: drop bogus BR2_TOOLCHAIN_HEADERS_AT_LEAST_2_6
>   package/python-pygame: drop bogus
>     BR2_PACKAGE_PYTHON_PYGAME_MIXER_MUSIC

Thanks a lot, this is amazing work! I have applied all those 32 patches
to the master branch.

Really great work!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
