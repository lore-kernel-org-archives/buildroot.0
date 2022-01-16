Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB92C433EF
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 10:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A994D826FB;
	Sun, 16 Jan 2022 10:38:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jaX9bZXNMiW2; Sun, 16 Jan 2022 10:38:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDCAE826D5;
	Sun, 16 Jan 2022 10:38:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89A6D1BF426
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 10:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85541826D5
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 10:38:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5zCy2nG42Xb9 for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 10:38:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3CE5481BFA
 for <buildroot@busybox.net>; Sun, 16 Jan 2022 10:38:29 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id g205so19230852oif.5
 for <buildroot@busybox.net>; Sun, 16 Jan 2022 02:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jNtxpDxqgCWZOZwJIyMQhaBs8HfI6NOQ85I2GzyVMmE=;
 b=M2yOZWWmCBAodwfE5Sb+0pvgRSI93RO38Sw4HG2aYH5PEa/lrFHAw6GXbDqWeQfmH9
 RdSWaUtXqM3LaHP6aU+Cye4BET0dEU2AndO9onoYv7EZ6T00e6UyjYjSn3yefJ2yV7O2
 YOioO3+3xcQl2QNtEzxFelnusk+nGVuGCytvBVdxeULSA8YBMOaPH3wRAxTRn0plM8gB
 7KttyEcIYozHclI+/IBSyaVtG4qvNOMNrBan/dN8GFZOEFVrd5RhrMvsstYo/q8wnwbs
 aVasJzYMcJX0odB74sW5CWj8ioAd28JjsjuxPenpgZzWfP8m/odxGBXZoEA1UOIs2UbY
 vMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jNtxpDxqgCWZOZwJIyMQhaBs8HfI6NOQ85I2GzyVMmE=;
 b=B5cjPEO/po2g5/bikzOtV7uEliIK0fdLC1uqWwtf5mon0xy3CiHluP5hrUtGDaLySi
 WuR2UBB0Yu9uHjXgG/7NgNnPVFiWDIX95gFJzENx+EhaLSqzQ4lYxhh6XQaIIhhnNjp9
 unJdLx6sxa6+ZdRch/5WdSI3JDrVs3J7VkZQm6k+dCi+HOgNW3Vhqqp4brDuIHwDdR1e
 IPWjNMRxD47bFyviOgGnhWLYgl/eYP9XaOnvQ1bsGTyjbzqJEt8cIHsdprxEZW594Xcj
 qcvdmy9Lfw5P4VDvy5UJirMV66yoZhyIkYj8B0urGYpjxcOe4ARaZ8nZZsQzD1Xhn9yO
 IuNA==
X-Gm-Message-State: AOAM530RxgfpbYKzEobqKZyadGvpWg/UhfwwJOd8/LV9/kzkrGUNIa3n
 Hpe+JlNVrQYVvb1hlijYwwmZzUvnE5NMS7DhEVU=
X-Google-Smtp-Source: ABdhPJxmRYGe/0QLsAZ2Wtw/xRl8PxyqJJOlLvXRn0ferEet74oMRpLyChe9njPfOLVxzt6eNZFQ60P2XqVCEgwu9So=
X-Received: by 2002:a05:6808:118b:: with SMTP id
 j11mr13571955oil.65.1642329508191; 
 Sun, 16 Jan 2022 02:38:28 -0800 (PST)
MIME-Version: 1.0
References: <20201221203952.22168-1-ps.report@gmx.net>
 <20201221203952.22168-3-ps.report@gmx.net>
In-Reply-To: <20201221203952.22168-3-ps.report@gmx.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 16 Jan 2022 03:38:17 -0700
Message-ID: <CADvTj4oC2aojVqzacG3sR=-WCbbeFgAGk+QvSVfz3czC+AVx=w@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1] package/qt5webengine: add optional
 host-freetype/host-libjpeg dependency
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
Cc: Arthur Courtel <arthur.courtel@smile.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 =?UTF-8?B?R2HDq2wgUG9ydGF5?= <gael.portay@collabora.com>,
 Julien Corjon <corjon.j@ecagroup.com>, Buildroot <buildroot@busybox.net>,
 Martin Bark <martin@barkynet.com>,
 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Dec 21, 2020 at 1:40 PM Peter Seiderer <ps.report@gmx.net> wrote:
>
> - add optional host-freetype dependency
>
> Fixes:
>
>   Command: .../host/bin/python2 .../build/qt5webengine-5.15.2/src/3rdparty/chromium/build/config/linux/pkg-config.py -p .../build/qt5webengine-5.15.2/host-bin/host-pkg-config freetype2
>   Returned 1.
>   stderr:
>
>   Package freetype2 was not found in the pkg-config search path.
>   Perhaps you should add the directory containing `freetype2.pc'
>   to the PKG_CONFIG_PATH environment variable
>   Package 'freetype2', required by 'virtual:world', not found
>   Could not run pkg-config.
>
>   See //build/linux/BUILD.gn:24:3: whence it was called.
>     pkg_config("freetype_from_pkgconfig") {
>     ^--------------------------------------
>   See //build/config/freetype/BUILD.gn:10:24: which caused the file to be included.
>       public_configs = [ "//build/linux:freetype_from_pkgconfig" ]
>                          ^--------------------------------------
>   Project ERROR: GN run error!
>   make[4]: *** [Makefile:82: sub-gn_run-pro-make_first] Error 3
>   make[3]: *** [Makefile:79: sub-core-make_first] Error 2
>   make[2]: *** [Makefile:49: sub-src-make_first] Error 2
>
> - add optiobal hist-libjpeg dependency
>
> Fixes:
>
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/917539230
>
>   Command: .../host/bin/python2 .../build/qt5webengine-5.15.2/src/3rdparty/chromium/build/config/linux/pkg-config.py -p .../build/qt5webengine-5.15.2/host-bin/host-pkg-config libjpeg
>   Returned 1.
>   stderr:
>   Package libjpeg was not found in the pkg-config search path.
>   Perhaps you should add the directory containing `libjpeg.pc'
>   to the PKG_CONFIG_PATH environment variable
>   Package 'libjpeg', required by 'virtual:world', not found
>   Could not run pkg-config.
>   See //third_party/BUILD.gn:17:3: whence it was called.
>     pkg_config("system_libjpeg") {
>     ^-----------------------------
>   See //third_party/blink/renderer/platform/BUILD.gn:159:5: which caused the file to be included.
>       "//third_party:jpeg",
>       ^-------------------
>   Project ERROR: GN run error!
>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Tested-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/qt5/qt5webengine/qt5webengine.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
> index 64c9c96cc2..8ab50a0fbf 100644
> --- a/package/qt5/qt5webengine/qt5webengine.mk
> +++ b/package/qt5/qt5webengine/qt5webengine.mk
> @@ -29,6 +29,14 @@ endif
>
>  QT5WEBENGINE_DEPENDENCIES += host-libpng host-libnss libnss
>
> +ifeq ($(BR2_PACKAGE_QT5BASE_FONTCONFIG),y)
> +QT5WEBENGINE_DEPENDENCIES += host-freetype
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5BASE_JPEG),y)
> +QT5WEBENGINE_DEPENDENCIES += host-libjpeg
> +endif
> +
>  QT5WEBENGINE_CONF_OPTS += WEBENGINE_CONFIG+=use_system_ffmpeg
>
>  ifeq ($(BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS),y)
> --
> 2.29.2
>
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
