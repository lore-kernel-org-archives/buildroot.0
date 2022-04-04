Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B064AC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 17:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41ED7410E6;
	Mon,  4 Apr 2022 17:20:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0_i7K_BxgYnz; Mon,  4 Apr 2022 17:20:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE8E540A00;
	Mon,  4 Apr 2022 17:20:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18E251BF35C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00F2440A00
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:20:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wDdIzcX4VFVG for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 17:20:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE20D409FE
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 17:20:34 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id p23so4402417edi.8
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 10:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=NnWdmWisnn52Y2WC4l4/u4GDEjRruTiozgEBh2vn8ho=;
 b=TpevKucTaLVkEjcg48MsHeWqo6qUGXVESiEwupuDr1MNW1TuitXlfT1uC8Zu77LSIk
 n7WhvLvQQqFtVpH2dYDXw1r1I7+b1DYcIxtuDUzx1ap0O1Q0wR5ii5eHHwAhvipxPPT/
 rCLkwOJGRezDneG4xrVQsLLA9ZM3KE7oaxFrRtz42A/rFa2A9leM68BoCGPWF4F/KNfi
 XNnoXyJt9MhtlYPVvWsGjzfS/MfM68j/pHbUCZZGaEaHmqi1qadpFUyfeKILG/7nq+B8
 UU0DpQ8gqUWVBT5udpOQD9f3IAJQAO9gMkoFK4EHwRcVdH2W7RRfmWmdSi3Rqna/g16b
 Vcrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NnWdmWisnn52Y2WC4l4/u4GDEjRruTiozgEBh2vn8ho=;
 b=e2W373rdgtXCFJitY94sZswfXfZ+NXUigVSIVIh2i8Tv3FnP9MNODqkR7Cmbr1FH7g
 zZmcMmY2e6DgWZsuMaXMw8gfkTnW1QdIPAXlCQt8X80XHIrwPT4eq9aOyLhtR4uPTTaQ
 e1UvpUHW52jCXHmshvpZ5iF67ImZNgUwuYvFt5DnLDuKeVfC9eQd6BwJ4lz6Clx/IKhp
 ZGJn+JnQa9igqmXqFd5viARA9ZCIC8Tdml501u7Hyku2vNMnw5Qvv70/X+SjQNAcNAAI
 jex+iIIrzs2YVW9nOEUN/w2ueTjCNx45Lf3GMpc6hbU0n0jKqRFgSf7TG17J8ejl8ckY
 3G0w==
X-Gm-Message-State: AOAM530C/cRI+i96Kkwdl1JDaGAbJcvltVOHiMM6rf/bGiQjZ6ItxNaJ
 xjM2u0m+RgPOdAvndQmCrYazyQ==
X-Google-Smtp-Source: ABdhPJzFKX2lNddgJw6pOnyfuZRziKY1nIXzyNuoS8KEzuMM7a6mqcDMydUeXxdALeUBzpy6RQh9vg==
X-Received: by 2002:a05:6402:1c87:b0:41c:dd9c:2e94 with SMTP id
 cy7-20020a0564021c8700b0041cdd9c2e94mr1318616edb.2.1649092832609; 
 Mon, 04 Apr 2022 10:20:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 b25-20020a056402139900b0041904036ab1sm5640283edv.5.2022.04.04.10.20.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 10:20:31 -0700 (PDT)
Message-ID: <3f55f9b9-ea95-4b25-a9fc-c4c1c12dc792@mind.be>
Date: Mon, 4 Apr 2022 19:20:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220330201009.1459182-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220330201009.1459182-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/stellarium: bump version to
 0.22.0
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



On 30/03/2022 22:10, Bernd Kuhls wrote:
> Release notes:
> http://stellarium.org/release/2022/03/27/stellarium-0.22.0.html
> 
> Added upstream patch to fix build error.
> 
> Added dependency to qt5charts following upstream commit:
> https://github.com/Stellarium/stellarium/commit/5b8fece8d03c64f27f37469f0604efd88d54393d#diff-1e7de1ae2d059d21e1dd75d5812d5a34b0222cef273b7c3a2af62eb747f9d20aR487
> 
> Added configure option to disable qt5webengine support, the package is
> broken: https://bugs.busybox.net/show_bug.cgi?id=14681
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---

[snip]
> diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
> index c3f2e0e8d4..f8185869be 100644
> --- a/package/stellarium/stellarium.hash
> +++ b/package/stellarium/stellarium.hash
> @@ -1,5 +1,5 @@
>   # From https://github.com/Stellarium/stellarium/releases
> -sha1  a3396c403050e073c592da695faeb048c1d5e19b  stellarium-0.21.3.tar.gz
> -sha256  8ac6c054d12f136fe0d5c0deaaa8d7b69dd2a462be1711a187364574aef97e7f  stellarium-0.21.3.tar.gz
> +sha1  c4a00fd756c66fb7df633f496dd3be4300bf1d2b   stellarium-0.22.0.tar.gz
                                                  ^^^
  Separate with two spaces, as reported by check-package.

  Applied to master with that fixed, thanks.

  Regards,
  Arnout

> +sha256  0b4dc23cf9054b5e76cd9bc5ad68e172eb221999e90af37e93667d04fe78c885  stellarium-0.22.0.tar.gz
>   # Locally computed
>   sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
> diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
> index ca5c07b2a7..1226b1190d 100644
> --- a/package/stellarium/stellarium.mk
> +++ b/package/stellarium/stellarium.mk
> @@ -4,18 +4,20 @@
>   #
>   ################################################################################
>   
> -STELLARIUM_VERSION = 0.21.3
> +STELLARIUM_VERSION = 0.22.0
>   STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
>   STELLARIUM_LICENSE = GPL-2.0+
>   STELLARIUM_LICENSE_FILES = COPYING
>   STELLARIUM_DEPENDENCIES = \
>   	qt5base \
> +	qt5charts \
>   	qt5location \
>   	qt5multimedia \
>   	zlib
>   STELLARIUM_CONF_OPTS = \
>   	-DENABLE_MEDIA=ON \
>   	-DENABLE_NLS=OFF \
> +	-DENABLE_QTWEBENGINE=OFF \
>   	-DUSE_SYSTEM_ZLIB=ON
>   
>   ifeq ($(BR2_PACKAGE_QT5SCRIPT),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
