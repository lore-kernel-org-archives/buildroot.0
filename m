Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35FDC433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 20:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7182C849D6;
	Wed, 23 Mar 2022 20:26:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qSaPxzekXg1p; Wed, 23 Mar 2022 20:26:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B9F584361;
	Wed, 23 Mar 2022 20:26:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 833E41BF48C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E9BD40CBE
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:26:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w6iluMy8jxUT for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 20:26:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64599400C4
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 20:26:49 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id a17so3232980edm.9
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 13:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=1H5b5Jw5L8d9NXKcZcFLsiQMC51gRbclbuSpNi4Qd7s=;
 b=a47ARrBqgs5ZlIZ3Yi5KYch9+A9xW2nI8eu8nh3CFssMOZ7dDLfzlMljHd2plRc0Zr
 mLAD4oR0SUEg0toYUDNZXt8+v8ufWjbDJuRRFiodSmB/l/KZwEqWgrSaM1HW4RAQt0vz
 7HBa3iZcvvHbMrg3uCB1yaFYPGY0yBhvFzoKr2siScqUkdshSzVEQm8oSawQN56P7G2x
 orw9W5U7ugH4Rcoy9xA9kCD+KfJ1F9yx8xTrCEsRMrqUI7J0xheij+1rJrH543wl/gk9
 cnIuEYSuAufY+xorKfqJwRa02aLd0w6VVRSMUezNSU7MXyy34H655r1Y4U+pYK9aF401
 xTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1H5b5Jw5L8d9NXKcZcFLsiQMC51gRbclbuSpNi4Qd7s=;
 b=njT09JHXJUMqe1q5yGftrtrGYvopULFWG8xH7dbgFxE9raEcpK0U6Ar48miUBrzFeB
 tbV2c8PT1ivLpIWQkfCIz6IGWOBQHs2Bxe+u5nC5G3GDFylLmc3opgXB2fk/t0psw+wr
 hqEfJqG8bvbb00YUvJnp3LWTQsfgK7JpGwxJmVzJanq3Yy5T52XTcAJ8bcsxG7LLNZ0I
 PyRsIEzahb51ktRLdl7c1C+bzTtCjnX/691QhsiY3ROxepfhHIpcrqkVRyaCC088ZJ4k
 g9d9iqk+watiyOhMtS98i4JifGhpYIYapzaTSOAhvXyWBzNgy4TR7FSa9qRqPJS+7Oyh
 hc9Q==
X-Gm-Message-State: AOAM531ZMYEmUvNTOpPxM0kWpI16SplDWJbTpbSGAgjJBqOY3QqoU1K4
 Nbk3CQpT97AAHOKvDRMaf7rFGt1Cs+QISg==
X-Google-Smtp-Source: ABdhPJycKm4Nq0iKAtJ5wOnu1yy8wBpVbMSULeuT2YqeUPh51IY+ctwf/Jb9fWD6VqGP/r0wxgZU1Q==
X-Received: by 2002:a05:6402:84b:b0:419:85:b724 with SMTP id
 b11-20020a056402084b00b004190085b724mr2442368edz.413.1648067207669; 
 Wed, 23 Mar 2022 13:26:47 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a05640240c200b004194b07bbfasm444802edb.10.2022.03.23.13.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 13:26:47 -0700 (PDT)
Message-ID: <bdf0d209-ee63-391e-478c-b435497c96c6@mind.be>
Date: Wed, 23 Mar 2022 21:26:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220313125540.3017299-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220313125540.3017299-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/dovecot: bump version to 2.3.18
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



On 13/03/2022 13:55, Bernd Kuhls wrote:
> Release notes:
> https://dovecot.org/pipermail/dovecot-news/2022-February/000470.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/dovecot/dovecot.hash | 2 +-
>   package/dovecot/dovecot.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
> index 0363b6e922..e70b266d92 100644
> --- a/package/dovecot/dovecot.hash
> +++ b/package/dovecot/dovecot.hash
> @@ -1,5 +1,5 @@
>   # Locally computed after checking signature
> -sha256  1c67ccccdc81a75007c01dedc02ad608c4d856c60a6b89b9cd246e79f72aa2b8  dovecot-2.3.17.1.tar.gz
> +sha256  06e73f668c6c093c45bdeeeb7c20398ab8dc49317234f4b5781ac5e2cc5d6c33  dovecot-2.3.18.tar.gz
>   sha256  319a9830aab406109cd67cb45496587566a8123203d66d037b209ca3e13de02a  COPYING
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
>   sha256  52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
> diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
> index fb299a8e45..053462c6dd 100644
> --- a/package/dovecot/dovecot.mk
> +++ b/package/dovecot/dovecot.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   DOVECOT_VERSION_MAJOR = 2.3
> -DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).17.1
> +DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).18
>   DOVECOT_SITE = https://dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
>   DOVECOT_INSTALL_STAGING = YES
>   DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
