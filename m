Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0626C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 15:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A58E360D64;
	Sun, 10 Apr 2022 15:06:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vEt-tofo4Jen; Sun, 10 Apr 2022 15:06:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F17C60C31;
	Sun, 10 Apr 2022 15:06:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9EE691BF869
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C0064017A
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:06:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X7itr585m_dx for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 15:06:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87A7840119
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 15:06:24 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id lc2so5552776ejb.12
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 08:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=on+rn5BG9K2hSNPbHBb0FINIMswgIjP5hrGc9epOc0g=;
 b=ekyTZc2Bdbqjd6Uq5g2xfenVW9Tbd8lCMuiDyOmxXtJ+06OtVT8rSAzN4ZieviO2yP
 WltTb48twNW6pkjQyi7oJU3ZjmC2iPl14Ps2nLWMPC+W0nY7/A435kMw2QjMIU9k93BD
 4wliIG5goeOePqDOYudyXC+VPQs8gj+Ep4Q4eZ1TqJ1eb/GGEWb2vb5DygG/sv4WTzhM
 aXuY/xkgwMYt7pbhpeEr+v99tP3/Kvw5YxXFei2OQnmOemg4XFoz/6P7hIE1/P0+qXxs
 KZd7HmMoLxFwg4pjCjirrQkJCDVsKEcF+FulVJNL7ewK+8j9kjoPBDzPajgJXfzaFSES
 iB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=on+rn5BG9K2hSNPbHBb0FINIMswgIjP5hrGc9epOc0g=;
 b=VEUvOLlrD8xRw3SkvvzidCI+Nmr32hsdh8J6l+MiUEE/Eh0AGd0dZB3NVZ2VyaEa4L
 0UiHXN3TCjPm7O9qLYixAJotlB7mnRNT8ZmKL+O9Fxsf1jrtOpABMAERL1wbWZSV8z4I
 C27gEZWnDYPYAHJWx936Bp3gIIZUP7gQFF4dcHJqJxqEF/u8f6fWf+yUSaVLOtqRvGxM
 QniwlyAwtL8KQ1pvARMaB0L5fbPEIyf4OwYlMoI3AYUjrcGi/qFayg0QnI+fnYTWpEc5
 oZ7L2lvxVYrOF/nib5T5FfCoxfb9Deld2s+IJrCgD6MiW09A0kNXqkuoUIvJ+bx1vN1P
 2cqg==
X-Gm-Message-State: AOAM530OA2uJyuOR5McPzbqCQ83U63KhtjNL2+p8aDl4DXNE5R3nXfho
 mGlLzCp2RmOX1nzFA6++GB/Hiw==
X-Google-Smtp-Source: ABdhPJwaO0KbVyeeTQ2wQKQ7j7IJtjbO8CVCg3IQU9QNWleCvPvbRUY89CgK9cMjQWzt7XXAfT4A0A==
X-Received: by 2002:a17:907:97cc:b0:6da:a8fb:d1db with SMTP id
 js12-20020a17090797cc00b006daa8fbd1dbmr26928491ejc.267.1649603182721; 
 Sun, 10 Apr 2022 08:06:22 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a50ec9a000000b004193fe50151sm13983515edr.9.2022.04.10.08.06.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 08:06:22 -0700 (PDT)
Message-ID: <d9f69c65-0395-e4f6-9839-acfe4a0743c6@mind.be>
Date: Sun, 10 Apr 2022 17:06:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
References: <20220405132929.823106-1-aperez@igalia.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220405132929.823106-1-aperez@igalia.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/webkitgtk: bump to version
 2.36.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/04/2022 15:29, Adrian Perez de Castro wrote:
> Update to a new major release which brings in improvements and a few new
> features. Release notes:
> 
>    https://webkitgtk.org/2022/03/21/webkitgtk2.36.0-released.html
> 
> None of the new features need additional dependencies. The build option
> USE_SYSTEMD has been renamed to ENABLE_JOURNALD_LOG, though.
> 
> While at it, remove setting the ENABLE_PLUGIN_PROCESS_GTK2 option.
> Support for NPAPI plug-ins has been dropped already in 2.32.x and the
> option has been a no-op for a long time, see:
> 
>    https://perezdecastro.org/2020/webkitgtk-npapi-sunsetting.html
>    https://webkitgtk.org/2021/03/26/webkitgtk2.32.0-released.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/webkitgtk/webkitgtk.hash |  8 ++++----
>   package/webkitgtk/webkitgtk.mk   | 13 +++----------
>   2 files changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
> index 82c210c8f9..38068745ee 100644
> --- a/package/webkitgtk/webkitgtk.hash
> +++ b/package/webkitgtk/webkitgtk.hash
> @@ -1,7 +1,7 @@
> -# From https://webkitgtk.org/releases/webkitgtk-2.34.6.tar.xz.sums
> -md5  a5eeedd02f5b4bba8bd891b92dc743d4  webkitgtk-2.34.6.tar.xz
> -sha1  bb82517289baf9c858fa406d1d845274f81e25cb  webkitgtk-2.34.6.tar.xz
> -sha256  6bc8fd034aad0432a2459ce4fc7ee25ad65a4924c618bf8d93b52b0c1a84c1f6  webkitgtk-2.34.6.tar.xz
> +# From https://webkitgtk.org/releases/webkitgtk-2.36.0.tar.xz.sums
> +md5  1e3fe866ab6e41e7ec3deb80bd5b3a85  webkitgtk-2.36.0.tar.xz
> +sha1  5b90bc59c2f442223de1a4d9dc8ff604888abb3c  webkitgtk-2.36.0.tar.xz
> +sha256  b877cca1f105235f5dd57c7ac2b2c2be3c6b691ff444f93925c7254cf156c64d  webkitgtk-2.36.0.tar.xz
>   
>   # Hashes for license files:
>   sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index 36e4b8943b..8d8f083ea2 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -WEBKITGTK_VERSION = 2.34.6
> +WEBKITGTK_VERSION = 2.36.0
>   WEBKITGTK_SITE = https://www.webkitgtk.org/releases
>   WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
>   WEBKITGTK_INSTALL_STAGING = YES
> @@ -84,13 +84,6 @@ WEBKITGTK_CONF_OPTS += \
>   	-DENABLE_X11_TARGET=ON
>   WEBKITGTK_DEPENDENCIES += libgl \
>   	xlib_libXcomposite xlib_libXdamage xlib_libXrender xlib_libXt
> -# It can use libgtk2 for npapi plugins
> -ifeq ($(BR2_PACKAGE_LIBGTK2),y)
> -WEBKITGTK_CONF_OPTS += -DENABLE_PLUGIN_PROCESS_GTK2=ON
> -WEBKITGTK_DEPENDENCIES += libgtk2
> -else
> -WEBKITGTK_CONF_OPTS += -DENABLE_PLUGIN_PROCESS_GTK2=OFF
> -endif
>   else # !X11
>   # GTK3-BROADWAY/WAYLAND needs at least EGL
>   WEBKITGTK_DEPENDENCIES += libegl
> @@ -115,10 +108,10 @@ WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER_GL=OFF
>   endif
>   
>   ifeq ($(BR2_INIT_SYSTEMD),y)
> -WEBKITGTK_CONF_OPTS += -DUSE_SYSTEMD=ON
> +WEBKITGTK_CONF_OPTS += -DENABLE_JOURNALD_LOG=ON
>   WEBKITGTK_DEPENDENCIES += systemd
>   else
> -WEBKITGTK_CONF_OPTS += -DUSE_SYSTEMD=OFF
> +WEBKITGTK_CONF_OPTS += -DENABLE_JOURNALD_LOG=OFF
>   endif
>   
>   # JIT is not supported for MIPS r6, but the WebKit build system does not
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
