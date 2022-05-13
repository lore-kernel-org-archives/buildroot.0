Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7E2C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 21:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B479D83EF7;
	Fri, 13 May 2022 21:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5_acLzzIcmXl; Fri, 13 May 2022 21:08:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 984EC83EC8;
	Fri, 13 May 2022 21:08:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A8E021BF5A8
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9088D60B45
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:08:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A7MC3rBDgjZb for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 21:08:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 657B560A4F
 for <buildroot@buildroot.org>; Fri, 13 May 2022 21:08:54 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id l18so18430321ejc.7
 for <buildroot@buildroot.org>; Fri, 13 May 2022 14:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=YgKyvL9qw00RrR8dWTPdsjVwaytTfKAd8iMdszgRt4g=;
 b=OLW1DDiuJoG0ovE3PTD8A0znIO2tbqkWIWnH4eqedr/DeTef96abUhpuMYNnPWI1hv
 oyvO3gCi8yiBtnHs3qPnefVb9EtE7XC/M0ZsKHgb8nYrq2EW9Mmyrzcek2L9RZmJDLdf
 yiUYll8HH6SxzQlXjchW+HS1nzvjrLMuiqD2TK2MXzd0yUWpRYJQYCw4G89N9vGHCQRr
 qAT06bQEUJ2rZC8NGem0oSbg+jTE38hs5RJHj3Yc0dZo0Ds3Kbqteq4aAd1HENzdp+8a
 xLvoHtAIU1EjY4m11wu2/sCs1z9ySF0vmYTv3pRPbjsfkvZ+ZU+WW8Lv5zxAKF6rx1AH
 OrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YgKyvL9qw00RrR8dWTPdsjVwaytTfKAd8iMdszgRt4g=;
 b=dCINoYZGIx0NjRoLf+OCUksskY8U6b13TbP5v9ESYNeaRruFet+0712G+bNXY3kvku
 rpuMx/e7TJe8mHBx15qsrelXHNgnN2da1jMO5XsfWws4NzkM350REm4YGEcL2RqfCXgo
 Jxvn638z4JKFNVpBsiKcCnkR5XoVRQyb2S004LywPtnouVuWP5UROyBN5gdRd/g4e0j1
 xWtHobDW+q0gAPs97lXlcu7WwEFRx/PV8JDi60ufUWPU/zl9v2VNNokIpJmHcMo1XyFB
 mLLeJOBVRhIRngoO6B5z1STVpCu69Ybrb41jqGnsz5vjC0R4JY/0e3gS6ASVhzX4tHF6
 8njg==
X-Gm-Message-State: AOAM532/XiGuYlX8mW4R7cQ/hipM5WJnmN6Exc0gquo/XZ2IwyP+rKeh
 6d48rJ3hi1sqFe04+MwFfWm61F6Vq0hupw==
X-Google-Smtp-Source: ABdhPJwRtH76rOs+4nPI/j2YPwHWWsjqqtIXXyYT+YWHad8Z3lDkjqCuxZcVsFYb4bmZucmKO6KPRQ==
X-Received: by 2002:a17:907:a412:b0:6f4:31e5:5ce with SMTP id
 sg18-20020a170907a41200b006f431e505cemr6023807ejc.237.1652476132471; 
 Fri, 13 May 2022 14:08:52 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 hy11-20020a1709068a6b00b006f3ef214de1sm1099393ejc.71.2022.05.13.14.08.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 14:08:52 -0700 (PDT)
Message-ID: <c6028cd1-e6ae-15d8-5744-85c6c47f83e6@mind.be>
Date: Fri, 13 May 2022 23:08:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
References: <20220509060721.2726047-1-geomatsi@gmail.com>
 <20220509060721.2726047-4-geomatsi@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220509060721.2726047-4-geomatsi@gmail.com>
Subject: Re: [Buildroot] [PATCH 3/3] package/rtl8189fs: fix big-endian builds
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



On 09/05/2022 08:07, Sergey Matyukevich wrote:
> Fix rtl8189fs builds for big-endian platforms. For this purpose remove
> default little-endian configuration option from rtl8189fs Makefile.
> Configure proper endianness using USER_EXTRA_CFLAGS instead.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/51e95561103e40ae94f38b9bb944bdfcd4ab50ed/
> - http://autobuild.buildroot.net/results/8ac7921926ab48aeb95dc4ea20f3c9970094c71d/
> - http://autobuild.buildroot.net/results/7f0bdd03c41bcc9e567fe722ed271e5dcf210f44/
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

  Series applied to master. However...

> ---
>   ...1-Makefile-remove-default-endianness.patch | 30 +++++++++++++++++++
>   package/rtl8189fs/rtl8189fs.mk                |  3 +-
>   2 files changed, 32 insertions(+), 1 deletion(-)
>   create mode 100644 package/rtl8189fs/0001-Makefile-remove-default-endianness.patch
> 
> diff --git a/package/rtl8189fs/0001-Makefile-remove-default-endianness.patch b/package/rtl8189fs/0001-Makefile-remove-default-endianness.patch
> new file mode 100644
> index 0000000000..47e42415eb
> --- /dev/null
> +++ b/package/rtl8189fs/0001-Makefile-remove-default-endianness.patch
> @@ -0,0 +1,30 @@
> +From 480d9da302885d9e8b3d1f9c68def569e3c8a8c0 Mon Sep 17 00:00:00 2001
> +From: Sergey Matyukevich <geomatsi@gmail.com>
> +Date: Mon, 9 May 2022 00:17:21 +0300
> +Subject: [PATCH] Makefile: remove default endianness
> +
> +There is no way to remove configuration options from EXTRA_CFLAGS
> +without editing Makefile. So default LE configuration can not be
> +conveniently replaced by BE. Remove default endianness from the
> +Makefile to enable its configuration via USER_EXTRA_CFLAGS.

  I don't know if it works, but if USER_EXTRA_CFLAGS is added _after_ 
EXTRA_CFLAGS, you can still override it with:

USER_EXTRA_CFLAGS="-UCONFIG_LITTLE_ENDIAN -DCONFIG_$(call 
qstrip,$(BR2_ENDIAN))_ENDIAN"

or, simpler:

ifeq ($(BR2_ENDIAN),"BIG")
USER_EXTRA_CFLAGS="-UCONFIG_LITTLE_ENDIAN -DCONFIG_BIG_ENDIAN"
endif

If USER_EXTRA_CFLAGS comes before, then there's indeed nothing you can do. In 
that case, please send the patch upstream.

  Regards,
  Arnout

> +
> +Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> +---
> + Makefile | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index dfca305..fde4e6b 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -22,7 +22,6 @@ endif
> +
> + EXTRA_CFLAGS += -I$(src)/include
> +
> +-EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
> + EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
> +
> + EXTRA_LDFLAGS += --strip-debug
> +--
> +2.35.1
> +
> diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
> index 6031a3072c..1c398919ba 100644
> --- a/package/rtl8189fs/rtl8189fs.mk
> +++ b/package/rtl8189fs/rtl8189fs.mk
> @@ -11,7 +11,8 @@ RTL8189FS_LICENSE = GPL-2.0
>   RTL8189FS_MODULE_MAKE_OPTS = \
>   	CONFIG_RTL8189FS=m \
>   	KVER=$(LINUX_VERSION_PROBED) \
> -	KSRC=$(LINUX_DIR)
> +	KSRC=$(LINUX_DIR) \
> +	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN"
>   
>   define RTL8189FS_LINUX_CONFIG_FIXUPS
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
