Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294F3C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 19:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C992941608;
	Mon, 25 Apr 2022 19:34:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0PE-4X__qzDn; Mon, 25 Apr 2022 19:34:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9910A41545;
	Mon, 25 Apr 2022 19:34:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 051B51BF2CD
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0283F41545
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:34:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 56Jq-F02fz-r for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 19:34:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E7DA41520
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 19:34:54 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id u15so31565752ejf.11
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 12:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=jsS370ay67XPlTkMjmxzclijd6lSVh1UqRA8GwBsNyE=;
 b=CGbVGGV6REYSHmLuG2Gle+AugPb9sxHg+1rNGPRqtE9rHfHpLMnJyO80Fa7v/4phJ4
 3ZX9OaLBv/GeX6k5VSJwrZPlDBosq88X9GcS2uIwnCipktXjAJnc//N6DQoDmdXztrhT
 pGyz54hOdzkgwAz16E2qKBib4HQVu0wi5jaFVL8+MLtJ/c1VmsGXEjVSSda9pWwR/9lK
 D9LlmMLOvWfLYl8y2uIBB4rsRFHypiUtssW3omviEQb9QJ7lDNqyZX/H8+bbQAkW4pzs
 qO1F60kv23SaxWlIPLHFi2FJ3OwVBYoXZ0giCNCrB5WNTEQSYz5gcCd6ffHiS/3HsmA6
 SUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jsS370ay67XPlTkMjmxzclijd6lSVh1UqRA8GwBsNyE=;
 b=GmSbZ60JkwBg0o+roISmjgqND4Y3o4c+vOSG0absfJTJhdTio+BotP1FVNytNK5aKx
 xPy6cE+bAwHwcstBn973HQXSL2WBVoJBP0xOw5sVDtg3uMLBGtMB3VC9kkm/IJ+CRhz4
 1lZLdlR5zuuBtfN2xSgtM0usu2Y4F1ReCgY5gS3EHpBqh9b0nGRzt1IzLwK3akXs7MVU
 Fyag+iansfiMmc9MIqsCJD/2qP3luuU11AKoOFBW/AfJCgLahIoFOzUdeQuJhObBCD8T
 DXI9fraDfG/y4GPvBpa8wJTZR7qzwIw7zCDl5MRINgNg0lebgMg+0nKiYePwl6cIS8R+
 jtEg==
X-Gm-Message-State: AOAM5326b1EEkGl1fyd3DSgu5Bq+JNRZcc4ZM7hpnZ/JNu1Wbx1lap5y
 8M++Qb0xGG8cx1MMMzVjYghptDCg+LR+Nw==
X-Google-Smtp-Source: ABdhPJx0ukT5vFuuUU/z1SNq0Pk727AmZWj9206ypZQMjbf7EBR6AcAqfScD93QQ3LIKoKIUpZ3MkQ==
X-Received: by 2002:a17:907:3e13:b0:6f3:8e47:4b44 with SMTP id
 hp19-20020a1709073e1300b006f38e474b44mr7819381ejc.571.1650915292673; 
 Mon, 25 Apr 2022 12:34:52 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a056402231100b0041d98ed7ad8sm5055672eda.46.2022.04.25.12.34.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 12:34:51 -0700 (PDT)
Message-ID: <efb82515-66c4-67ec-dd71-e9c10d8920ab@mind.be>
Date: Mon, 25 Apr 2022 21:34:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220422215931.2712013-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220422215931.2712013-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-good:
 fix build with gcc 4.8
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



On 22/04/2022 23:59, Fabrice Fontaine wrote:
> Fix the following build failure with gcc 4.8 raised since bump to
> version 1.20.0 in commit 34317969278d7b6d923d4889fb4235f112b2b201:
> 
> ../ext/soup/gstsouploader.c: In function 'gst_soup_load_library':
> ../ext/soup/gstsouploader.c:219:3: error: 'for' loop initial declarations are only allowed in C99 mode
>     for (guint i = 0; i < len; i++) {
>     ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/21792a9839d9722815075569123df8747fc450e3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> index 1168feb293..2b6cf769aa 100644
> --- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> +++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
> @@ -10,6 +10,7 @@ GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
>   GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
>   GST1_PLUGINS_GOOD_LICENSE = LGPL-2.1+
>   
> +GST1_PLUGINS_GOOD_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
>   GST1_PLUGINS_GOOD_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
>   
>   GST1_PLUGINS_GOOD_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
