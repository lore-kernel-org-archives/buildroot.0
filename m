Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8792FC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 19:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A0AE402AA;
	Sat,  8 Jan 2022 19:04:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id im-HZ2MHi51i; Sat,  8 Jan 2022 19:04:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 810FD402A4;
	Sat,  8 Jan 2022 19:04:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 088671BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0362F813BD
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:04:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B66tQuknUFaq for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 19:04:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8DA0813A3
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 19:04:15 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 s21-20020a05683004d500b0058f585672efso10604886otd.3
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 11:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tsMV2w/5jtp/UOav0HRgoU8+mMQBRggTjAd0C+pUYPk=;
 b=n9gawKBtUYtzLBhdL2rIL3YwPs7RVukHJLSVh86fa4Xs5nbqPXp8Q19sXitIpPnZjY
 /EUDh+ztY+zQtVy7JocvYHHjscraZP6Gkxy8XG5dqZSNpztCEN/CL1GDkDZT9TwSNDVA
 0t7Z6WCNfMzcl+5yGDgQu84q+uZnYl3PNMmWsAmWaPA/aOD9M/fwGUnzlMKL0uCc+QSk
 4jnKhJNVvYPnZL1Qy4PHASPVhtMqdixXKxedejmC44nH0D7md8T40IdCipRHviBiLNzm
 imflsdi+7+aa74oHzU2dft/m5h9LYvDoUuw4CU2bznUWAbt2X/C4wCk/d/xX8BdsvCOH
 pyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tsMV2w/5jtp/UOav0HRgoU8+mMQBRggTjAd0C+pUYPk=;
 b=MG8pN2TKfsJDbrhnT/ye1CfXSNnQwMUPhgxvN4Vl+PIDjj5qZ0vZi0Q0B9/qAvAJFQ
 0kEZP5+/mapKk0+BvkgFXxJ0oM26k6jx+e8iCewnJG9RsYuyOat28yld9yHN3BuOnSgP
 RjVoLa8RmxF3hPYWtO5KHo4huFG6L7gdCGibzP/uJMEuF3dTS/BduFsBfAY7eyboLW+i
 6T+c9RWSKheA/V0Cu4ojOYSbyB8Opr1IbI/U212SXlUrVN03XXuahW9bWaP6janrMd7P
 uR8Tmk3+ZLSQkMhyn6I8eADFQaZozc89frl60pMHVJ54jlc9SaYEblAer9t1neYG0+qI
 PWlA==
X-Gm-Message-State: AOAM5327OSgdYA281rMCpio9UD/YFl/dX6WcbpmGSG0X0NOmcD/KQMVF
 xYjXbMQ6ccESEH8dkBrS2OsH/qVu8s3D90REhsw=
X-Google-Smtp-Source: ABdhPJxqV4uZzcdp47b8e9PZYV6b9D80EbCKMvXQn3LZhtwDCvwaLi81TZsgGWnze7r4ODCC2gfA9QYXJJonSZsJgEw=
X-Received: by 2002:a9d:6f91:: with SMTP id h17mr1684120otq.151.1641668654904; 
 Sat, 08 Jan 2022 11:04:14 -0800 (PST)
MIME-Version: 1.0
References: <20201126152832.1115350-1-nolange79@gmail.com>
In-Reply-To: <20201126152832.1115350-1-nolange79@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 8 Jan 2022 12:04:04 -0700
Message-ID: <CADvTj4p=60BwS0f6+UZABNYRw6BYph+qkTU7L9Gv+=LOJewsMQ@mail.gmail.com>
To: Norbert Lange <nolange79@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: Allow extra config
 options
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
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Nov 26, 2020 at 8:28 AM Norbert Lange <nolange79@gmail.com> wrote:
>
> Systemd has very many options, adding a way for the user
> to set custom options can help customizations
> without changing buildroot files.

I'm not sure this is a good idea, if a configuration option needs
customizability it
probably needs a specific kconfig option. Systemd config options tend to require
dependency selection and special handling so this seems likely to cause
spurious errors due to improper usage. Seems to be a pretty big footgun IMO.

What systemd configure option would you want to be using that isn't
currently able to be enabled?

>
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/systemd/Config.in  | 8 ++++++++
>  package/systemd/systemd.mk | 2 ++
>  2 files changed, 10 insertions(+)
>
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 2c89538987..946b2d9905 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -89,6 +89,14 @@ if BR2_PACKAGE_SYSTEMD
>  config BR2_PACKAGE_PROVIDES_UDEV
>         default "systemd"
>
> +config BR2_PACKAGE_SYSTEMD_EXTRA_CONFIG
> +       string "Additional target systemd options"
> +       default ""
> +       help
> +         Any additional systemd configure options you may want to
> +         include. The options are appended to Buildroot generated
> +         options and can override these.
> +
>  config BR2_PACKAGE_SYSTEMD_BOOT
>         bool "systemd-boot"
>         depends on BR2_i386 || BR2_x86_64
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 2f1d898e0d..878e99ed00 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -500,6 +500,8 @@ ifneq ($(SYSTEMD_FALLBACK_HOSTNAME),)
>  SYSTEMD_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
>  endif
>
> +SYSTEMD_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_SYSTEMD_EXTRA_CONFIG))
> +
>  define SYSTEMD_INSTALL_INIT_HOOK
>         ln -fs multi-user.target \
>                 $(TARGET_DIR)/usr/lib/systemd/system/default.target
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
