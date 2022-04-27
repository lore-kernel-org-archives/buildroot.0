Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A4AC433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 22:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E17CF40B39;
	Wed, 27 Apr 2022 22:56:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CkBhzgfmWUYU; Wed, 27 Apr 2022 22:56:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0972D40ADE;
	Wed, 27 Apr 2022 22:56:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A8041BF844
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 22:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2875140ADE
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 22:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pADIOVsXNwrD for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 22:56:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53582402E8
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 22:56:10 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id r28so4848333iot.1
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 15:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lgcw2yckiyQJ1bbuLWEoUXr67Z0VclV8iYNGJy9yjHE=;
 b=kc/HMCbidD1mcqc2cYreAFV+iVyRgrpbERoB/adNZ2AClEyzmvVOK4TvIe0gjWVo8g
 6ebQ4KcrcffxtNPvpkGYIH3UGCnBO6Qm088C8zepsdrvfp6u+7OZiHf9O0cID6gPVUbi
 XodW66Y+7cvCixDJ8LM3iAGClmnkXbDdsgurOQX9fcSXhXvPTTpdCmbDCeo6+ivM6Pmj
 j0sRUXmkO4izJY5/VpOAxvYFibs3lHgutcOkg1x5htBMve9BKKQFwXBquI/c3/Nazpkz
 oyZ9fzu4CpFhquGJEEB+4BBJdcvhODR/KdksPNgngt+JM4G68TekGISNaeA0Yn/731/5
 CqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lgcw2yckiyQJ1bbuLWEoUXr67Z0VclV8iYNGJy9yjHE=;
 b=ioau+QRs5lVNn9gHQJnqAAwNy2SuSv+9Igrz5/WDjd8BFFo9XkhRBbs8VKTLyw4jDh
 Hs/wHDQTtAcUzKVJm+Jwn7fYQXB9YPXVUpwJe86f6wOuBu9DeSLVRFH706eMBqWwOIf4
 0R7jDOzC2h6cKUYjmxHzeNEkBhAmLCuLZ2U/q83rAMfs5c8Ll4KE3g55HbVNsit4LlPS
 WsVaxwkj9bFhq9lsZ4YMZ2+x94xKN/da7zLvZnlwXiptPYMHkFQd9mVuUGkr9OFqIzq5
 a+FMJioGcUrzr7rwC2f8gEZc2Om4PMyfqrjRQTe+Ba8iSLpi/pcSjrcN4oJ4bDlOC9E0
 8K4w==
X-Gm-Message-State: AOAM533InnAZp/lmc3lhgaYQJ0bLU0/gNCIZLcT1IYn//0Fxgr1cwuJR
 XrL5gI82Q0kt4OM8rejfEqss7FfgVk1fdbz4i4sB5CPF5eR7WBo3
X-Google-Smtp-Source: ABdhPJxHp/vwDwAZ/v0vkTZ5JNdlnwd7Ze3Folq+C6W4sDn910kwz7lnI4PYJ96bocpSv+s76VzsKcfUTqk5iBt9ELQ=
X-Received: by 2002:a05:6638:d06:b0:326:ba0:347 with SMTP id
 q6-20020a0566380d0600b003260ba00347mr12905291jaj.68.1651100169321; Wed, 27
 Apr 2022 15:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220427131400.223113-1-noahhuetter@gmail.com>
In-Reply-To: <20220427131400.223113-1-noahhuetter@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 28 Apr 2022 08:55:43 +1000
Message-ID: <CAKmqyKPcAFNmd5tz=JTZZVcUKKZeTpQsockEDL66pfjJM2FhKQ@mail.gmail.com>
To: Noah Huetter <noahhuetter@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] boot/opensbi: introduce
 BR2_TARGET_OPENSBI_CUSTOM_MAKEOPTS
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
Cc: Alistair Francis <alistair@alistair23.me>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Apr 27, 2022 at 11:14 PM Noah Huetter <noahhuetter@gmail.com> wrote:
>
> Signed-off-by: Noah Huetter <noahhuetter@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  boot/opensbi/Config.in  | 6 ++++++
>  boot/opensbi/opensbi.mk | 3 ++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
> index f1443498d9..ff095ea800 100644
> --- a/boot/opensbi/Config.in
> +++ b/boot/opensbi/Config.in
> @@ -119,4 +119,10 @@ config BR2_TARGET_OPENSBI_FW_FDT_PATH
>           must be set in the U-Boot configuration for this file to be
>           produced.
>
> +config BR2_TARGET_OPENSBI_CUSTOM_MAKEOPTS
> +       string "Custom make options"
> +       help
> +         List of custom make options passed at build time. Can be
> +         used for example to pass a BUILD_INFO= value.
> +
>  endif
> diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
> index 8e055633a8..d007ae1299 100644
> --- a/boot/opensbi/opensbi.mk
> +++ b/boot/opensbi/opensbi.mk
> @@ -31,7 +31,8 @@ BR_NO_CHECK_HASH_FOR += $(OPENSBI_SOURCE)
>  endif
>
>  OPENSBI_MAKE_ENV = \
> -       CROSS_COMPILE=$(TARGET_CROSS)
> +       CROSS_COMPILE=$(TARGET_CROSS) \
> +       $(call qstrip,$(BR2_TARGET_OPENSBI_CUSTOM_MAKEOPTS))
>
>  OPENSBI_PLAT = $(call qstrip,$(BR2_TARGET_OPENSBI_PLAT))
>  ifneq ($(OPENSBI_PLAT),)
> --
> 2.35.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
