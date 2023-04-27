Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A4FC77B73
	for <buildroot@archiver.kernel.org>; Thu, 27 Apr 2023 20:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AACAB400BF;
	Thu, 27 Apr 2023 20:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AACAB400BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y3YzihDHFdsS; Thu, 27 Apr 2023 20:46:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D29F740184;
	Thu, 27 Apr 2023 20:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D29F740184
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74BCD1BF291
 for <buildroot@lists.busybox.net>; Thu, 27 Apr 2023 20:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AB8D40184
 for <buildroot@lists.busybox.net>; Thu, 27 Apr 2023 20:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AB8D40184
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RHf-HI2GAs27 for <buildroot@lists.busybox.net>;
 Thu, 27 Apr 2023 20:46:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E715A400BF
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E715A400BF
 for <buildroot@buildroot.org>; Thu, 27 Apr 2023 20:46:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.88]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8QS8-1pwWDa29Oi-004QCy; Thu, 27
 Apr 2023 22:46:18 +0200
Date: Thu, 27 Apr 2023 22:46:17 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: James Knight <james.d.knight@live.com>
Message-ID: <20230427224617.623ce0bb@gmx.net>
In-Reply-To: <SN4P221MB068281FE13C893DCE2F2ACCAA06A9@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
References: <SN4P221MB068281FE13C893DCE2F2ACCAA06A9@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:ic/qrL+bV5QpPPXrbdHd2mq5/qjMPJxgtmSBQZjVLdczpjWBi3y
 UNSHfz3PF8Ue+/i75efNaAW2nO279YK8w6W/bMx6YZhroYURTNa95exCcUGFqX9hDHWt96M
 VZu3qsGVKAzRt04QJ/vgdt9d/DGhG0DoFdAFWCRAZs8REGCaKKqJyhMBoPhFDyx/tG5yVch
 wB8i9XYimhEqvw6Ua9Sdg==
UI-OutboundReport: notjunk:1;M01:P0:5MtApy+DsMM=;PiVin0JLw2CM/tXYSI9uPE1xb4v
 /gReJ71XC3Vc4GIFNrEWHWggPh2phGWlwQcS/zVwVZxAWcY/7orBvnNaKJJwoSt18nTZUQjS7
 m+JpUuOL7oBoKAdkdWE6xRKSGgnCsj5gX6+pJTC7MFvLWGIrTHyF9MBzoKxonqxla/cGhiuPS
 xPWe6RxJbLl0UYBX5b8RlW2RxUoLArYR46eguwFlQbfiGUmznSrq3lVChj64msZ84NgQyqk44
 gEtLTgOYA5wzuPoYrnF85HqIPnJLiheYKJ+hJDrYJFguS8Ym9VFv3F86Zl6FGhUxVH8SJcgaH
 jZwh0b+zNqsYtcqLEjJdSxXpLiWPu51VCowhXOniGoiTQIQH+FrCf/ebEfe0ahLIo0hLjocj8
 9kn/adnZJ8BxdYmbmcVdANRhKwAsJM38IxXjvYPA13BQc0kFATG62Ttu/wUpqUjp1Is+zpxKF
 0NltFhLKZ+ZuTUze6vJNvcPGwOUNFIlhqNHNLluNYlE0Iyt764vL1ORR2rdstfSv65AKvGwAR
 6mxf5GhFByyNSs9fhYo5FXqIgV3J8u6o7PgNa6mUlMMi/TylqsllP6d4JPVyu1JQZKAcQNN+M
 cgZAUGcPueZZNZG7D9InPTZg3EPrYr22Oyq6zefVnAOyyFh/49NCBbeXFREQabv+Uo7VMngDT
 U6P2TUf3P/DWpwfv5meAVUxef7xDkmvAj9lLtSyGzIdJqBN4ncg4K6nj8gY5AehCaZls6hvmv
 uP88YmLZo4emxIZd/s37uVjQnu2pW9u1Htub1Zkf5ZX93WlPWc2bEAfvbpmZd0ZxSFA6CvLif
 Zs+FKT8AIjSPdBAFqAug/xDM+h/jGaif0eUOL8SCHvY0gwYj9DGO8teXjUALx8orvYEPXHrpp
 QvNuj4VelFrizyD2DFdA/kTk2aAyTstjWGQJl7B1qNIvbJYToAnK3u8wt9lBbabH0VLK/yM92
 kGxwMUX9zhvXfyw1WJaY+lHcx/o=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1682628378; i=ps.report@gmx.net;
 bh=DbkuBSNxxsKjqUhN/e681oRQh6kYEWJTFmAD4ba3g5c=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=QZH/AjN4Q9GpRtosUB2NZwJ/P71a+svU/OjJcl8YbJLhttmzi0U/ttsunTYOFOJAd
 XGikaLtxh4Gzd1F2uP0ipcSkZw7tPDWToPv2sG5gtOpVDtNWuMfjaLlMxIe+VCF/06
 UfJVrAdscGucUCz2ZVLdsjpGh/P29Kqn5p/GfHQMmdi2mYP5/LvCzQltP8J7zFKeHR
 rH4Lrk7rd6y5LeimaSoG/petLwcySh2GYEk+v5X6rIi4BzoMitDDoqtouINfr2oP6b
 G2TxFjNehHLVzgRmyCTLjTS0mZJvquMCvdXFXGs278GDUF3KY+usLzRYyaJ6CpMPBg
 O3+c9ibcSi4Ag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=QZH/AjN4
Subject: Re: [Buildroot] [PATCH] package/libxkbcommon: enable wayland support
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Wed, 26 Apr 2023 21:50:14 -0400, James Knight <james.d.knight@live.com> wrote:

> Tweak the applied configuration options to flag support for Wayland if
> the wayland package is detected. This will allow the generation of the
> `interactive-wayland` utility (when `BR2_PACKAGE_LIBXKBCOMMON_TOOLS` is
> also configured).
>
> Signed-off-by: James Knight <james.d.knight@live.com>
> ---
>  package/libxkbcommon/Config.in       | 1 +
>  package/libxkbcommon/libxkbcommon.mk | 8 +++++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/package/libxkbcommon/Config.in b/package/libxkbcommon/Config.in
> index e9f61227a02b55a0123318f27b296ce2c8b4ad36..c344eb78b6d0cbc72ff382ccf0682811f9a2ecfb 100644
> --- a/package/libxkbcommon/Config.in
> +++ b/package/libxkbcommon/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_LIBXKBCOMMON
>  	bool "libxkbcommon"
>  	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
>  	help
>  	  xkbcommon is a keymap compiler and support library which
>  	  processes a reduced subset of keymaps as defined by the XKB

As stated above (and as used in meson.build) the 'enable-wayland' is only used for
the tools, so I would have expected something like the following:

diff --git a/package/libxkbcommon/Config.in b/package/libxkbcommon/Config.in
index e9f61227a0..c7fe188a0e 100644
--- a/package/libxkbcommon/Config.in
+++ b/package/libxkbcommon/Config.in
@@ -12,6 +12,7 @@ if BR2_PACKAGE_LIBXKBCOMMON

 config BR2_PACKAGE_LIBXKBCOMMON_TOOLS
        bool "tools"
+       select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
        help
          Tools: xkbcli, xkbcli-compile-keymap, xkbcli-how-to-type,
          xkbcli-interactive-evdev, xkbcli-interactive-x11,

> diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
> index 236bf4c5d94d163809056691339ed7660e545195..2bbe349771360d34c0ff73bf871ed5621120b312 100644
> --- a/package/libxkbcommon/libxkbcommon.mk
> +++ b/package/libxkbcommon/libxkbcommon.mk
> @@ -14,7 +14,6 @@ LIBXKBCOMMON_INSTALL_STAGING = YES
>  LIBXKBCOMMON_DEPENDENCIES = host-bison host-flex
>  LIBXKBCOMMON_CONF_OPTS = \
>  	-Denable-docs=false \
> -	-Denable-wayland=false \
>  	-Denable-xkbregistry=false
>
>  ifeq ($(BR2_PACKAGE_XORG7),y)
> @@ -24,6 +23,13 @@ else
>  LIBXKBCOMMON_CONF_OPTS += -Denable-x11=false
>  endif
>
> +ifeq ($(BR2_PACKAGE_WAYLAND),y)
> +LIBXKBCOMMON_CONF_OPTS += -Denable-wayland=true
> +LIBXKBCOMMON_DEPENDENCIES += wayland wayland-protocols
> +else
> +LIBXKBCOMMON_CONF_OPTS += -Denable-wayland=false
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBXKBCOMMON_TOOLS),y)
>  LIBXKBCOMMON_CONF_OPTS += -Denable-tools=true
>  else

And here:

diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index 236bf4c5d9..d89ba47425 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -14,7 +14,6 @@ LIBXKBCOMMON_INSTALL_STAGING = YES
 LIBXKBCOMMON_DEPENDENCIES = host-bison host-flex
 LIBXKBCOMMON_CONF_OPTS = \
        -Denable-docs=false \
-       -Denable-wayland=false \
        -Denable-xkbregistry=false

 ifeq ($(BR2_PACKAGE_XORG7),y)
@@ -26,8 +25,15 @@ endif

 ifeq ($(BR2_PACKAGE_LIBXKBCOMMON_TOOLS),y)
 LIBXKBCOMMON_CONF_OPTS += -Denable-tools=true
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+LIBXKBCOMMON_CONF_OPTS += -Denable-wayland=true
+LIBXKBCOMMON_DEPENDENCIES += wayland wayland-protocols
+else
+LIBXKBCOMMON_CONF_OPTS += -Denable-wayland=false
+endif
 else
 LIBXKBCOMMON_CONF_OPTS += -Denable-tools=false
+LIBXKBCOMMON_CONF_OPTS += -Denable-wayland=false
 endif

 $(eval $(meson-package))

Or (matter of taste) using:

  ifeq ($(BR2_PACKAGE_LIBXKBCOMMON_TOOLS)$(BR2_PACKAGE_WAYLAND),yy)
  [...]
  endif

Regards,
Peter
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
