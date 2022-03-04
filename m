Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01252C433EF
	for <buildroot@archiver.kernel.org>; Fri,  4 Mar 2022 08:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AF0E83E60;
	Fri,  4 Mar 2022 08:52:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B58NdoNX70QK; Fri,  4 Mar 2022 08:52:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BFDD83DF9;
	Fri,  4 Mar 2022 08:52:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B6451BF324
 for <buildroot@lists.busybox.net>; Fri,  4 Mar 2022 08:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 530D483DF9
 for <buildroot@lists.busybox.net>; Fri,  4 Mar 2022 08:51:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1512HeGupvQx for <buildroot@lists.busybox.net>;
 Fri,  4 Mar 2022 08:51:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2AD16831F5
 for <buildroot@buildroot.org>; Fri,  4 Mar 2022 08:51:57 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id hw13so15951396ejc.9
 for <buildroot@buildroot.org>; Fri, 04 Mar 2022 00:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a+xWKjVZXDoBTrIxzhdgtCLYCglUVEXp4za64ZEVr5M=;
 b=hquCMMpcX/0Cj2z05OFGrl9fnISxtNQSwE6qZUcRLrD+h8qCw9GJo1cM0VzHxRJX8L
 Ruqqqr2zsGLv1rDfA1apgBU14+ApkTVk03gdX47vLsGD4GHTgRBFuAxuEjQptcfbcHJB
 hT7e0QHpvfIO53gHfhLTLrZEwBquGmlBJ/5JUxt6DuRBm7CKpYRf7ZtaXcDRHqYlG59e
 WUdAA4Y3ZOMH02UEzQ/LA7qZsfMZv3YBM/FZdUmLjccVRk2qTmR4KltM8wbr1eBWmEBt
 TmceowL7Dh7oxNE2jF6ACed1mvFPbB54DIfVlTaGGHngxac9cXOsoNev/8UmjoMP3N7W
 Rxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a+xWKjVZXDoBTrIxzhdgtCLYCglUVEXp4za64ZEVr5M=;
 b=FvKYQC1/uewyBCsOemL1NrWDcyuNKarLqlBia62SrJwTE/3+bZXOd+xE1RLke2F7Gt
 Ztg5i6FkDW5UWFqV2TV/KFnOOhzAbnFqsndVYRT911uC1wma7IxVhB0hNg6gEcZyaWVc
 PrHg2NL+srmDIYJg6OYNQ7xehpreZ0n+DGuKc5r/U7/TP8JnwKO766yN2CyQffEPbwS6
 hyXUDO8mnZ44UplwoJQhajIaa7oirWAuUBoUU9iYhEDCXMry4nKXJ536altknYUXCxpl
 vN4WOzTCZZXUxiGgjnfzzauMv8P6/4ASr7n1KzVqGqfGeJjC79Wdgb1WTEiU12wu6ALz
 qgxA==
X-Gm-Message-State: AOAM530rioh8fGCwcFG6QOBrfgdRxX71VhmTvo8cRUrp1sdxS/E04rcy
 KWqxll4vO67e2oeqIOm0XCaX6JIYXFAANmCwwWfZGOpJd9A=
X-Google-Smtp-Source: ABdhPJxL5Y0tcbIG8Raxga/LMekIvnFbpLZhqTHOyo73q9FzPCKT0RN/EL20xyG1spEmvyasdL9f0yVvuE+iVs6esnU=
X-Received: by 2002:a17:906:1f11:b0:685:d50e:3bf9 with SMTP id
 w17-20020a1709061f1100b00685d50e3bf9mr30879508ejj.275.1646383915147; Fri, 04
 Mar 2022 00:51:55 -0800 (PST)
MIME-Version: 1.0
References: <20220303191945.3952450-1-geomatsi@gmail.com>
In-Reply-To: <20220303191945.3952450-1-geomatsi@gmail.com>
Date: Fri, 4 Mar 2022 09:48:48 +0100
Message-ID: <CAGm1_kv17p_mufChk5ffbJFKuO_GnjYb=qq-PvdQbhiszKffBQ@mail.gmail.com>
To: Sergey Matyukevich <geomatsi@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/wpa_supplicant: fix
 libwpa_client.so build
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Matt Weber <matthew.weber@collins.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Sergey, all,

On Thu, Mar 3, 2022 at 8:19 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> Build target libwpa_client.so is not built regardless of whether the
> option CONFIG_BUILD_WPA_CLIENT_SO is set or not. Add patch that
> fixes wpa_supplicant build regression.
>
> Fixes:
> http://autobuild.buildroot.net/results/001981339f3b895ecd9208a747a0e47d07c9583a/
> http://autobuild.buildroot.net/results/318f9ecd4060d34cc8385891b56d0a0e6275f2c9/
>
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Tested-by: Yegor Yefremov <yegorslists@googlemail.com>

The patch was already merged upstream.

Yegor

> ---
>
> Hi all,
>
> Note that the patch has been posted to hostapd mailing list
> and discussed, but not yet accepted:
>
> https://patchwork.ozlabs.org/project/hostap/patch/20220222085219.3996729-1-geomatsi@gmail.com/
>
> Regards,
> Sergey
>
>  ...le-options-for-libwpa_client.so-and-.patch | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 package/wpa_supplicant/0001-build-re-enable-options-for-libwpa_client.so-and-.patch
>
> diff --git a/package/wpa_supplicant/0001-build-re-enable-options-for-libwpa_client.so-and-.patch b/package/wpa_supplicant/0001-build-re-enable-options-for-libwpa_client.so-and-.patch
> new file mode 100644
> index 0000000000..156d0e7e2c
> --- /dev/null
> +++ b/package/wpa_supplicant/0001-build-re-enable-options-for-libwpa_client.so-and-.patch
> @@ -0,0 +1,68 @@
> +From e6a6a4e3df52cc60425fcd037d3ec68a38f948ce Mon Sep 17 00:00:00 2001
> +From: Sergey Matyukevich <geomatsi@gmail.com>
> +Date: Sun, 20 Feb 2022 10:12:28 +0300
> +Subject: [PATCH] build: re-enable options for libwpa_client.so and wpa_passphrase
> +
> +Commit a41a29192e5d ("build: Pull common fragments into a build.rules
> +file") introduced regression into wpa_supplicant build process. Build
> +target libwpa_client.so is not built regardless of whether the option
> +CONFIG_BUILD_WPA_CLIENT_SO is set or not. This happens because config
> +option is used before it is imported from the configuration file.
> +Moving its usage after including build.rules does not help: variable
> +ALL is processed by build.rules and further changes are not applied.
> +Similarly, option CONFIG_NO_WPA_PASSPHRASE also does not work as
> +expected: wpa_passphrase is always built regardless of whether the
> +option is set or not.
> +
> +This commit re-enables options adding both build targets to _all
> +dependencies.
> +
> +Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> +---
> + wpa_supplicant/Makefile | 19 ++++++++++++-------
> + 1 file changed, 12 insertions(+), 7 deletions(-)
> +
> +diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
> +index cb66defac..e384cc6b8 100644
> +--- a/wpa_supplicant/Makefile
> ++++ b/wpa_supplicant/Makefile
> +@@ -1,24 +1,29 @@
> + BINALL=wpa_supplicant wpa_cli
> +
> +-ifndef CONFIG_NO_WPA_PASSPHRASE
> +-BINALL += wpa_passphrase
> +-endif
> +-
> + ALL = $(BINALL)
> + ALL += systemd/wpa_supplicant.service
> + ALL += systemd/wpa_supplicant@.service
> + ALL += systemd/wpa_supplicant-nl80211@.service
> + ALL += systemd/wpa_supplicant-wired@.service
> + ALL += dbus/fi.w1.wpa_supplicant1.service
> +-ifdef CONFIG_BUILD_WPA_CLIENT_SO
> +-ALL += libwpa_client.so
> +-endif
> +
> + EXTRA_TARGETS=dynamic_eap_methods
> +
> + CONFIG_FILE=.config
> + include ../src/build.rules
> +
> ++ifdef CONFIG_BUILD_WPA_CLIENT_SO
> ++# add the dependency this way to allow CONFIG_BUILD_WPA_CLIENT_SO
> ++# being set in the config which is read by build.rules
> ++_all: libwpa_client.so
> ++endif
> ++
> ++ifndef CONFIG_NO_WPA_PASSPHRASE
> ++# add the dependency this way to allow CONFIGNO_WPA_PASSPHRASE
> ++# being set in the config which is read by build.rules
> ++_all: wpa_passphrase
> ++endif
> ++
> + ifdef LIBS
> + # If LIBS is set with some global build system defaults, clone those for
> + # LIBS_c and LIBS_p to cover wpa_passphrase and wpa_cli as well.
> +--
> +2.35.1
> +
> --
> 2.35.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
