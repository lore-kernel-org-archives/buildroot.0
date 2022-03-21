Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2193FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 21:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE43484139;
	Mon, 21 Mar 2022 21:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nrSNsctU5I3P; Mon, 21 Mar 2022 21:09:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7A8082531;
	Mon, 21 Mar 2022 21:09:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF21A1BF239
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBCF582531
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5GP-AzjZ7xHF for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 21:09:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B012D82438
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 21:09:55 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id bg10so32402359ejb.4
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 14:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SLdhzSoOb64h6GyQnYwpILgAeEac/jwAgzSL3QtM9QQ=;
 b=XevZOQmoNQkmopzSUZwf0M+L32AxFMcOBe9sLV+QDDtCsFaSyUjaUxV1AYVEMGiHZA
 iCRKYuQTgqUxiTis2zAJHZmi3+T071259BFmv/9WTCORZgMlXsazu45Mrk03H6mYwW0b
 lUP1dvku2dEczB/lb28Yl8AxUvl0jR7+nvI1AS6Xfyemx+18y/6ufrutlArwnA7jKW1B
 458qwfRRKMGEJBeFg35/8uPkai14+2Nfv7/E0zkJ7L+1g82E/+Ph/GbdD0vTxCDWbZq6
 qpOIKmQRaJlpZ4b1kOTm14DlZbueue3F5p5np39WC5omb4Dkf4wzZsz48ikna3SJ+kpo
 ERhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SLdhzSoOb64h6GyQnYwpILgAeEac/jwAgzSL3QtM9QQ=;
 b=CjwxcYu/cpKZS6NE/rrwaCgk6MHxcC3jEO6Kp1+gqA7z1L6zkQWekeUQXzUDy+ZAn8
 Z80j7kOy8FFX8/JjkXeaYpl2hPISLtoUgRMXcbIOR0V4/5N4Ixfp0H5M2GnkxeCOSCLU
 9ZNinZqBYPQrgbtahWNFsJWi8VWxMAxPTmaTtDb4hxzHY+gHS8f37H6pUaYM33FWIjd5
 1xSEo3aqHDB7Ha67/tchPKbICRv2FFWwCdOBnBLaeK8DFzTaOED42joU6G08Gvu9Hh5b
 qXFpt9JOuN8PCoSU7/puHeoNpvsdot/yHm9jTXJh/gcs6csczkbQ9Zg/x+Mqeoeisliw
 ohdw==
X-Gm-Message-State: AOAM530BSGBAWUnYgHQQOoB2R6+1kFVsLsuhemkOXN5fvNTA9X3YnkRU
 TL8C/cY0+A7Q3GSv99LOqvFlBQ==
X-Google-Smtp-Source: ABdhPJyVnkXdRLAnHgU21piF2gRUD2hSXdtjgoEm05UX5vKwW1wlhZqSIsxPbq1aF3NO7QUaerKDZw==
X-Received: by 2002:a17:906:7944:b0:6da:b834:2f3e with SMTP id
 l4-20020a170906794400b006dab8342f3emr23300993ejo.353.1647896993776; 
 Mon, 21 Mar 2022 14:09:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 j18-20020a170906535200b006e007fa9d0fsm1906914ejo.149.2022.03.21.14.09.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 14:09:53 -0700 (PDT)
Message-ID: <3223aa54-91c0-c5f6-fda6-b4c6c781d426@mind.be>
Date: Mon, 21 Mar 2022 22:09:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220309220018.786891-1-fontaine.fabrice@gmail.com>
 <20220309220018.786891-3-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220309220018.786891-3-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2,
 3/3] package/gerbera: bump to version 1.10.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/03/2022 23:00, Fabrice Fontaine wrote:
> Drop patch (already in version)
> 
> https://github.com/gerbera/gerbera/releases/tag/v1.10.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  I applied [1] instead, which also updates the config.xml file.

  Regards,
  Arnout

[1] 
https://patchwork.ozlabs.org/project/buildroot/patch/20220320185144.10894-1-joerg.krause@embedded.rocks/


> ---
> Changes v1 -> v2:
>   - Add cmake patches to the serie
> 
>   package/gerbera/0001-Fix-for-fmt-8-0.patch | 44 ----------------------
>   package/gerbera/gerbera.hash               |  2 +-
>   package/gerbera/gerbera.mk                 |  2 +-
>   3 files changed, 2 insertions(+), 46 deletions(-)
>   delete mode 100644 package/gerbera/0001-Fix-for-fmt-8-0.patch
> 
> diff --git a/package/gerbera/0001-Fix-for-fmt-8-0.patch b/package/gerbera/0001-Fix-for-fmt-8-0.patch
> deleted file mode 100644
> index c4419209a5..0000000000
> --- a/package/gerbera/0001-Fix-for-fmt-8-0.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From 82d84ac5e62c23e717198fc7b2ef190ff95e70d1 Mon Sep 17 00:00:00 2001
> -From: kyak <bas@bmail.ru>
> -Date: Wed, 12 Jan 2022 19:41:37 +0300
> -Subject: [PATCH] Fix for fmt > 8.0
> -
> -[Retrieved from:
> -https://github.com/gerbera/gerbera/commit/82d84ac5e62c23e717198fc7b2ef190ff95e70d1]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - src/util/logger.h | 15 +++++++++++++++
> - 1 file changed, 15 insertions(+)
> -
> -diff --git a/src/util/logger.h b/src/util/logger.h
> -index 58696e52f..ba64afa79 100644
> ---- a/src/util/logger.h
> -+++ b/src/util/logger.h
> -@@ -32,7 +32,9 @@
> - #ifndef __LOGGER_H__
> - #define __LOGGER_H__
> -
> -+#include <fmt/format.h>
> - #include <spdlog/spdlog.h>
> -+#include <type_traits>
> -
> - #define log_debug SPDLOG_DEBUG
> - #define log_info SPDLOG_INFO
> -@@ -40,4 +42,17 @@
> - #define log_error SPDLOG_ERROR
> - #define log_js SPDLOG_INFO
> -
> -+#if FMT_VERSION >= 80100
> -+template <typename T>
> -+struct fmt::formatter<T, std::enable_if_t<std::is_enum_v<T>, char>>
> -+    : formatter<std::underlying_type_t<T>> {
> -+    template <typename FormatContext>
> -+    auto format(const T& value, FormatContext& ctx) -> decltype(ctx.out())
> -+    {
> -+        return fmt::formatter<std::underlying_type_t<T>>::format(
> -+            static_cast<std::underlying_type_t<T>>(value), ctx);
> -+    }
> -+};
> -+#endif
> -+
> - #endif // __LOGGER_H__
> diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
> index 5dcd364c33..89ac9ad55a 100644
> --- a/package/gerbera/gerbera.hash
> +++ b/package/gerbera/gerbera.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  dee562cc5d22e8442e2fe1620b073bda612c80f9c4a8333311c647db06c1c4cd  gerbera-1.9.2.tar.gz
> +sha256  bd6c7b2c6380e2e265a998bbc0df9eec14b9c6a65bc91e7f2c0ae0b67fd0c9cf  gerbera-1.10.0.tar.gz
>   sha256  cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6  LICENSE.md
> diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
> index ab49f661ac..6acdfb86ac 100644
> --- a/package/gerbera/gerbera.mk
> +++ b/package/gerbera/gerbera.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GERBERA_VERSION = 1.9.2
> +GERBERA_VERSION = 1.10.0
>   GERBERA_SITE = $(call github,gerbera,gerbera,v$(GERBERA_VERSION))
>   GERBERA_LICENSE = GPL-2.0
>   GERBERA_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
