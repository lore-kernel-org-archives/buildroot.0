Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308DBC433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 18:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B860560EDA;
	Mon,  7 Mar 2022 18:42:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NOlsm31CcQ1G; Mon,  7 Mar 2022 18:42:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEE3960EDB;
	Mon,  7 Mar 2022 18:42:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A77B1BF2F6
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 18:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 462BB40A7E
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 18:42:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id psvDBVjXWCTY for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 18:42:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com
 [IPv6:2607:f8b0:4864:20::92d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 532254047C
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 18:42:41 +0000 (UTC)
Received: by mail-ua1-x92d.google.com with SMTP id y1so6911110uap.4
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 10:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U8SVgB3dtFa7JklgMyER1XkzhfilRsLsH7eQ21YZ19w=;
 b=LaXRAPgNjLhNnOt6eau3k/7PIUiAGgQGtNcjwTODD41sslT7xJG0rZ+BdeNcWBMNjG
 ap7H1yHBi76h3UmtupvqKFKgZkHjYCDYQOlj8TUQvgGRxu2CX9q7sW76YB+qaQJ1R0eo
 mUd+RGoxrXAEzZANiuNkWkpQnTg7BQlbOrchFqQDf4vxYe8tDb/8AsjYRGUYb3KwltUb
 Pn2pyS1XpH5U03Ufhd9iyRaaefIRONqZa2bN3HKelHw6tByRNNXrug0JdMDIiU6nvKll
 tCpKTviIjB8UZckWWNaFYRNpwKY8W7T5R/ZA1ILLEsl+Atue8eqPkobrJ2f6QjXOXX1y
 coPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U8SVgB3dtFa7JklgMyER1XkzhfilRsLsH7eQ21YZ19w=;
 b=iXVQOG1EhvLyeYaX8Ks1GCjdcI0/GiqsY0EjUMyb7Z49ZHBgD0o7bTNFcUSN1zNmsP
 pVLWy85em1W09SXeKxvG2P66JrGH3PHmvNak1kIxbsGWl3yXhk5+/qLMt7czkOR+VNEu
 gzXpPHDWFKnXsb4ph/leIkK4ytvyjj1siSvTVzDmQgfCl79qsIrS9Y67BI/3YCj8s8Qt
 NBUaENSU9a9CWGFlKWfgX4SVzUR7vjFruznILy6FIdvVlzly3qxX6SCdfGmQI71LwWwE
 cFj6O1Llt7rYMUiqBa9ElBGVp3ZhepKAuiLmP3x4WBBikF+w6nlv9RNTsdd0fGxIObDc
 kaBQ==
X-Gm-Message-State: AOAM532ymJZZEARmlNv7NdGeiMmEHmDWtj9o98RFgya24+wNiz6VuVMd
 YOGgkbp4K44SynmVX3CvT9ZNnkduqrk3WQ==
X-Google-Smtp-Source: ABdhPJwAVxd3T4DwrzY0XaIysEovR7o9Ik+uDUjYgoKtMwFOTDD/QX6Kg1ogI1RvGj45K281V3hkJg==
X-Received: by 2002:ab0:2603:0:b0:34b:ca85:bc2f with SMTP id
 c3-20020ab02603000000b0034bca85bc2fmr2407044uao.30.1646678559923; 
 Mon, 07 Mar 2022 10:42:39 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com.
 [209.85.222.42]) by smtp.gmail.com with ESMTPSA id
 d68-20020a1fcd47000000b0032db22e6d18sm1972215vkg.50.2022.03.07.10.42.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 10:42:39 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id f7so6897122uab.8
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 10:42:39 -0800 (PST)
X-Received: by 2002:ab0:7149:0:b0:34b:6c41:6caa with SMTP id
 k9-20020ab07149000000b0034b6c416caamr4074334uao.27.1646678559222; Mon, 07 Mar
 2022 10:42:39 -0800 (PST)
MIME-Version: 1.0
References: <817_1646667779_62262803_817_313_1_9705b574ea82a36b8f676e04876817b58ebb6e3c.1646667776.git.yann.morin@orange.com>
In-Reply-To: <817_1646667779_62262803_817_313_1_9705b574ea82a36b8f676e04876817b58ebb6e3c.1646667776.git.yann.morin@orange.com>
Date: Mon, 7 Mar 2022 10:42:28 -0800
X-Gmail-Original-Message-ID: <CA+h8R2p3EAfdYfmK899x3-n4J6J6kTmGx=Soq5cjNSp-nhC8Ng@mail.gmail.com>
Message-ID: <CA+h8R2p3EAfdYfmK899x3-n4J6J6kTmGx=Soq5cjNSp-nhC8Ng@mail.gmail.com>
To: yann.morin@orange.com
Subject: Re: [Buildroot] [PATCH] package/pkg-golang: fix build with
 per-package directories
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Mon, Mar 7, 2022 at 7:43 AM <yann.morin@orange.com> wrote:
> We want to have it expanded at the time the recipe is run, so like all
> other variables, we need to $$-expand it.
>
> At the same time, also $$-expand two other variables (even though those
> are benign, it is better for consistency that they be $$-expanded).
>
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Anisse Astier <anisse@astier.eu>
> Cc: Christian Stewart <christian@paral.in>
> ---
>  package/pkg-golang.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index ddefdf1214..f1c5cfd350 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -45,7 +45,7 @@ $(2)_BUILD_OPTS += \
>         -modcacherw \
>         -tags "$$($(2)_TAGS)" \
>         -trimpath \
> -       -p $(PARALLEL_JOBS)
> +       -p $$(PARALLEL_JOBS)
>
>  # Target packages need the Go compiler on the host at download time (for
>  # vendoring), and at build and install time.
> @@ -86,7 +86,7 @@ $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
>
>  $(2)_DOWNLOAD_POST_PROCESS = go
>  $(2)_DL_ENV += \
> -       $(HOST_GO_COMMON_ENV) \
> +       $$(HOST_GO_COMMON_ENV) \
>         GOPROXY=direct \
>         BR_GOMOD=$$($(2)_GOMOD)
>
> @@ -134,7 +134,7 @@ endif
>  ifndef $(2)_INSTALL_TARGET_CMDS
>  define $(2)_INSTALL_TARGET_CMDS
>         $$(foreach d,$$($(2)_INSTALL_BINS),\
> -               $(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $$(TARGET_DIR)/usr/bin/$$(d)
> +               $$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $$(TARGET_DIR)/usr/bin/$$(d)
>         )
>  endef
>  endif
> @@ -143,7 +143,7 @@ endif
>  ifndef $(2)_INSTALL_CMDS
>  define $(2)_INSTALL_CMDS
>         $$(foreach d,$$($(2)_INSTALL_BINS),\
> -               $(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $$(HOST_DIR)/bin/$$(d)
> +               $$(INSTALL) -D -m 0755 $$(@D)/bin/$$(d) $$(HOST_DIR)/bin/$$(d)
>         )

Reviewed-by: Christian Stewart <christian@paral.in>

Thanks,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
