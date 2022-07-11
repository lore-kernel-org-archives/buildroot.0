Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F51C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 13:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83F9F40A2B;
	Mon, 11 Jul 2022 13:05:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83F9F40A2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BszVtFTSi5PY; Mon, 11 Jul 2022 13:05:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83B7640A07;
	Mon, 11 Jul 2022 13:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83B7640A07
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B5871BF20F
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 13:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43FCB41701
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 13:05:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43FCB41701
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RRvMDhub7W0e for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 13:05:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 127EF416F2
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 127EF416F2
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 13:05:17 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id t189so6549390oie.8
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 06:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q1Iw74uPGbWoVuBGUD0SSqWI2t1EIUKcyeeUrK2kiIs=;
 b=LzLUs9EKB1xnB8yTlBuyo36d8at6BvzWSP1dNfaoEoyxijrDyzl/knrT+P7cl+ZtPJ
 EVqxjSzDlgnz+XHHOcviKBeAMxW6ZUAoGRDobDc5DqjiEzdNa05CORixRBgnP4zkd1a0
 sRv42e0mF6AxtStRHFJcHdyeuj7L9ITG5xN0QGe0I/ZIntZu2gS7Fwnyq6TbX2agm+6l
 oDqt7RDnAM2tLqok5Vtkz75wPbhNIcDaMrcHKiNWV+4Cvxpnq5To0hqVqTRdtq8j0PCV
 IGe28O3NAZv0AU9jie77HBNLrVZgc/ieq+T8+4go3Sf9Wcx7TGmGPyslVJhhd1mx5dsQ
 RH8A==
X-Gm-Message-State: AJIora94CqigTLQ0mtQBQkrJsh++4RqGzqEhXwQVX6d+iV7UGUtIX6co
 pKrVp/0ceSHcNHj46UJKwDgoZ+EyjCLodX7c+Yw=
X-Google-Smtp-Source: AGRyM1tUE4NiExJcSIZnBns7BrmZKd7N8NxYfE1oIasV6T6+AOr/H0EGBj8p5kpvP7YdXZwjeLFqWM6wP1m5qCzbqo8=
X-Received: by 2002:a05:6808:308f:b0:339:f8af:ea62 with SMTP id
 bl15-20020a056808308f00b00339f8afea62mr3664155oib.99.1657544716936; Mon, 11
 Jul 2022 06:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220711130054.110406-1-foss+buildroot@0leil.net>
In-Reply-To: <20220711130054.110406-1-foss+buildroot@0leil.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 11 Jul 2022 07:05:05 -0600
Message-ID: <CADvTj4rXHbym30M=8wypZSC6GeH++C-h1OHcd_7O44eWC+pUhw@mail.gmail.com>
To: Quentin Schulz <foss+buildroot@0leil.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Q1Iw74uPGbWoVuBGUD0SSqWI2t1EIUKcyeeUrK2kiIs=;
 b=LWfM8d+8jI+wGOTGefkzQI1pORVT2tNEQA1NWjtSNWcVeWmdLyDQ9CPQ9ViAlBy0Jk
 bDxEfWGR8g7ZeMusIsEHKKmpZ6GkiaY2nsHMTWkEfUrlyQwQW2TpGZaawPUCx7Z+VTqz
 xj0Vyhv578EDRDwBaooMRZqZkH2mBgHXi5a0T3mcAPonzhzWxRjKsO8h/GTlX5HHVWL4
 pcfbv52rMwFPTRUx1b3g9CdBhDY8HFESD9XZYXAw170haajGjafx2xEWKOumrDDBixzd
 s5UfmEI/Jaqn/f+Se00q+JXd8KPnDZxcDVWek6YoJbdwTCYMaJiTVn2ft2kFEboEDdUd
 v+gA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LWfM8d+8
Subject: Re: [Buildroot] [PATCH] package/libcamera: add explicit dependency
 on libevent if libevent package to be built
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Jul 11, 2022 at 7:01 AM Quentin Schulz <foss+buildroot@0leil.net> wrote:
>
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>
> The cam application requires libevent. Since there's no Kconfig option
> for it, cam building ability is checked by meson build system by default.
>
> If libevent is present in the sysroot, cam is built.
>
> The issue is that there's no explicit dependency on libevent in
> libcamera package. This means that it is possible for libevent AND
> libcamera to be built, but have libcamera be built before libevent.
> Meaning that even if all requirements seem to be fulfilled, cam still
> won't be enabled in some cases.
>
> This fixes the possible race by expliciting the dependency to libevent
> if the libevent package is enabled. Otherwise, explicitly disable cam
> building as it's already known that it isn't going to build.
>
> Cc: Quentin Schulz <foss+buildroot@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>  package/libcamera/libcamera.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 41d6a5abef..78243add18 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -84,6 +84,12 @@ else
>  LIBCAMERA_CONF_OPTS += -Dqcam=disabled
>  endif
>
> +ifeq ($(BR2_PACKAGE_LIBEVENT),y)
> +LIBCAMERA_DEPENDENCIES += libevent

You should also explicitly add this as autodetection logic may
otherwise mask errors:
LIBCAMERA_CONF_OPTS += -Dcam=enabled

> +else
> +LIBCAMERA_CONF_OPTS += -Dcam=disabled
> +endif
> +
>  ifeq ($(BR2_PACKAGE_TIFF),y)
>  LIBCAMERA_DEPENDENCIES += tiff
>  endif
> --
> 2.36.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
