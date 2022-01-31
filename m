Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFC1C433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 19:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1167440900;
	Mon, 31 Jan 2022 19:33:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4PCpR53KVxO8; Mon, 31 Jan 2022 19:33:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D66640621;
	Mon, 31 Jan 2022 19:33:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B6F01BF379
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 19:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26CA640621
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 19:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DW3d9AFkV4nx for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 19:32:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC322405F1
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 19:32:47 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id t199so12101992oie.10
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 11:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PNBSl+phb/DyuJben/jcpNoCb1V3XGcXDlYLLnfGyb8=;
 b=hSWyKSUmIPyDoPZxmuUwUYhKfvyNnydZRrENA264ZiBD6MuwL4z3eXoSaj6XawBt6A
 0qFfhtwksBXvjAZjOLGzouuDEiBNha3kb9bdnMdLoelJ24xMIKsEunfcMg/P1nFj3P3d
 T/xPaoIKPD50R8wtDOFoc5ohA4lO2M+onGTHOh+F2L/6VcwJVxJ8glnPO75iwTVK6diK
 48G/thSVkahFWlvPirCnpTpOOUMNraVna8VaWUFIhlHqfkWENvKe3DlhvVHwUsD1uZrL
 XlxNBSNCqPOfc7OhAetH5lD+kdyq3juaDQhjMgnNNh/E/yaayflUXGhQGt5YJy6VZx1D
 0ipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PNBSl+phb/DyuJben/jcpNoCb1V3XGcXDlYLLnfGyb8=;
 b=kXKxTxY3x5HRcgXej/wSujd6MqrJiQ/mJYLvDobxTJvkVN55C4zc8A9qxTRTeC2D0G
 YCY7b1aoU6Pw6DLcrLW99H0Ee5oDzsI3btpgXIe1I5ft9kByvKTqEBvGwiW1dPNlMMpd
 rpCoo3BDG80XqbpVdhJ6L2GCL2sVkQJe+wihajDey/Qm3UZiLmQH03vZjw5cAx8FXdy9
 XZU3J/CjMOxY2xhj7w2xU68vXekPW6EKTx+rSB3Q5CCF7yOWPuCbcmc1oTNQcOFYhfPI
 tSe64bslJXh2IUMqQ7DHtszwV7K6VGVKiTtRglQ6MIqMGAWTJ3zA34/a7Xx5fYFI/0ie
 JhMw==
X-Gm-Message-State: AOAM533rHUslE57HEc7wzM4zfZiJXw8RcMwhnWs5jVXxWEXCQXpnpMeg
 EK3KYWQzRY1upsDxl77hFtqLk14N5vtBucdTMTs=
X-Google-Smtp-Source: ABdhPJwE6vQfy0psQaW8rCuEnV5tc1BvdP7BwemjxRb1NlFuiwGMkbT4wGfUpsPByhOvMslCUVUo5JrOKc+RH1t5tSs=
X-Received: by 2002:a05:6808:2222:: with SMTP id
 bd34mr18365215oib.256.1643657566889; 
 Mon, 31 Jan 2022 11:32:46 -0800 (PST)
MIME-Version: 1.0
References: <20220116214955.3231899-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20220116214955.3231899-1-fontaine.fabrice@gmail.com>
From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 31 Jan 2022 11:32:36 -0800
Message-ID: <CAFSsvmrMvMMrV4Kt4Gs+r8BZFjRxOvre-EHfoONiJHZD1ub9fQ@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/3] package/qt5/qt5webkit: widgets are
 mandatory
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
Cc: Julien Corjon <corjon.j@ecagroup.com>, Peter Seiderer <ps.report@gmx.net>,
 =?UTF-8?B?R2HDq2wgUG9ydGF5?= <gael.portay@collabora.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Reviewed-by: Adam Duskett <aduskett@gmail.com>
Tested-by: Adam Duskett <aduskett@gmail.com>

On Sun, Jan 16, 2022 at 1:51 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Fix the following build failure raised since bump to version
> 5.212.0-alpha4 in commit df0b0fe6919c0d0f3750f439a3cfa765232bd569:
>
> CMake Error at /home/fabrice/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/cmake/Qt5/Qt5Config.cmake:28 (find_package):
>   Could not find a package configuration file provided by "Qt5Widgets" with
>   any of the following names:
>
>     Qt5WidgetsConfig.cmake
>     qt5widgets-config.cmake
>
>   Add the installation prefix of "Qt5Widgets" to CMAKE_PREFIX_PATH or set
>   "Qt5Widgets_DIR" to a directory containing one of the above files.  If
>   "Qt5Widgets" provides a separate development package or SDK, be sure it has
>   been installed.
> Call Stack (most recent call first):
>   Source/cmake/OptionsQt.cmake:646 (find_package)
>   Source/cmake/WebKitCommon.cmake:51 (include)
>   CMakeLists.txt:137 (include)
>
> Fixes:
>  - No autobuilder failures (yet)
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/qt5/qt5webkit/Config.in | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
> index b7beb2b252..68b679dfcd 100644
> --- a/package/qt5/qt5webkit/Config.in
> +++ b/package/qt5/qt5webkit/Config.in
> @@ -17,6 +17,7 @@ config BR2_PACKAGE_QT5WEBKIT
>         select BR2_PACKAGE_LIBPNG
>         select BR2_PACKAGE_QT5BASE_ICU
>         select BR2_PACKAGE_QT5BASE_GUI
> +       select BR2_PACKAGE_QT5BASE_WIDGETS
>         select BR2_PACKAGE_QT5LOCATION
>         select BR2_PACKAGE_QT5SENSORS
>         select BR2_PACKAGE_QT5WEBCHANNEL
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
