Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FDFECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 05:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D09F83FC7;
	Fri, 16 Sep 2022 05:03:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D09F83FC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RrG0kaIEJ-yM; Fri, 16 Sep 2022 05:03:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35AB783FC3;
	Fri, 16 Sep 2022 05:03:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35AB783FC3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CBBF21BF3BC
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 05:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFDA840256
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 05:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFDA840256
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bS8luwg-vkGK for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 05:03:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B7D040241
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B7D040241
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 05:03:08 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id lc7so46904761ejb.0
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 22:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=qJHVBGtrhjc2wMBKi9Hyez7ZzoW3dgm1w0GZiC5rqKQ=;
 b=b9zCQenaWnujzZIWCv7Z00wIWkPuelVjveISsESqEZUbog6wfLDFdhpEJmm/8CG9cX
 59bjg60GNreAdHtdphXrApWP1+Y6xIRpb1udkdhQHaVLVPzTA4uLanN0tShICk80lwGz
 umT/6Of03X2K18bmcwHnKqRKrb7e5ZC0Urj5cHicS79iMsFSj51A+bWnrRixAxOsjz09
 zI5OC/Z0Qno3yNRcd2YtI0cqs0i1ygoYE63HedoJR/WELiKoXKxHzOG20/mkllaPubBW
 w3SdadI+bQV/sfhSJG7t2uJFf0uSfP4idDRLJ7uYKEmEyR8I6Cm2NrpO3DZ1hC0oYhet
 vXdQ==
X-Gm-Message-State: ACrzQf3T/Aeu4Ggi/EiWr4t/SreT9rguIZJGIHBzzzyOUWLpJ3qLhPbs
 kUPbSRzUaUbiClTPE49dewN+Ir2Goz1suoM7Mnay3FTS+YcXuykj
X-Google-Smtp-Source: AMsMyM5uvCPNROToEp3zhbEitZNkivvsoPu8uKKozBLuXi+NikcZiRVn5t1TL+BaUDDbtv6LV6itrDw+gLcxC9l1jnk=
X-Received: by 2002:a17:907:d07:b0:72e:ec79:ad0f with SMTP id
 gn7-20020a1709070d0700b0072eec79ad0fmr2309890ejc.296.1663304586773; Thu, 15
 Sep 2022 22:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220913072303.1698887-1-joel@jms.id.au>
In-Reply-To: <20220913072303.1698887-1-joel@jms.id.au>
From: Chris Packham <judge.packham@gmail.com>
Date: Fri, 16 Sep 2022 17:02:54 +1200
Message-ID: <CAFOYHZCq7rxRzwAQXT=AjQAeAFY5CROmczWoZ6ZDZk7rWe2-qg@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=qJHVBGtrhjc2wMBKi9Hyez7ZzoW3dgm1w0GZiC5rqKQ=;
 b=UNc74cGYOjpY3iUWmpVvyXjAO8Mtlfek2ZRsB8UZ1gPZOxvl3BLNaUrAk0ee8ZDwcO
 jo1afM6R4phPLVoDHcp6p3L+JFy0u6VEefsFVEhNoz+RNlnL+y2/yVkp8c84Hx24t0Pr
 rpoH1KQhon6rkfkpe156dQQPn+2cQ6EGAh/VyzRypA9AqVkSEPYXauOvjhLgZZdSl55l
 QRxzfgQ3JjfalipbC+/2db9aT4eACR+irb7HGKEcUrFhvj59xz7mKw7g8BDFT8AXXtO8
 1DsZiLKTVehv/jplMwI2MUPGPUcZXSX0HtuUxzQw5kYiXU2uBNqHNnX6HzPlkE14T/Ew
 wCiw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UNc74cGY
Subject: Re: [Buildroot] [PATCH] package/coremark: Set cflags
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Sep 13, 2022 at 7:23 PM Joel Stanley <joel@jms.id.au> wrote:
>
> The coremark build needs to set PORT_CFLAGS explicitly in order to pick
> up the configured optmisation level, and other flags.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Chris Packham <judge.packham@gmail.com>

> ---
>  package/coremark/coremark.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/coremark/coremark.mk b/package/coremark/coremark.mk
> index 418fd5c8d39b..9ea8693e7189 100644
> --- a/package/coremark/coremark.mk
> +++ b/package/coremark/coremark.mk
> @@ -11,6 +11,7 @@ COREMARK_LICENSE_FILES = LICENSE.md
>
>  define COREMARK_BUILD_CMDS
>         $(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D) \
> +               PORT_CFLAGS="$(TARGET_CFLAGS)" \
>                 PORT_DIR=linux$(if $(BR2_ARCH_IS_64),64) EXE= link
>  endef
>
> --
> 2.35.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
