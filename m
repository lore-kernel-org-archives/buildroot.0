Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E85C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 20:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D5DC60AC3;
	Wed, 23 Mar 2022 20:25:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tahrbFdAa2Hh; Wed, 23 Mar 2022 20:25:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A05EF60B68;
	Wed, 23 Mar 2022 20:25:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C7E631BF48C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1A7F60B68
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:25:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JsIUL9YaI_D4 for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 20:25:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD6C460AAA
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 20:25:24 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id pv16so5244743ejb.0
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 13:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1lDlI4jm8Oy9BpQu8p/79/JA4xXYYv8p51arzpGXlYo=;
 b=cHtEHjEEQkit2QO8K5VUMc7NW2bxEYC9n9Ao7gMJGhx0eBms53Fi2ln20hthAbEMOg
 sCwEeZUkb/B/uLl/GluvIAo/wL5GYP+GxnqrU67ERdLOsfTXVI5P1oas4N7itGNSEpfu
 F826bugbC6yQkxzHyxupPR3KiUYO95YOEssdd7Rva0AV829bIidoOjOhDPV8//+ZHURU
 ZHCyyoPxpwrfYiQvHFaJvveShvAI6Q9cQDR/5F/BFwBUTtpRFT3+4cqVlukEALKoa+NQ
 yGWurq/fgBLp4/FVkmAS6vVYlcK+ZtDRSZzvlyA7ycdprPk9QUq8ZXBlcNClb4T+8wON
 11pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1lDlI4jm8Oy9BpQu8p/79/JA4xXYYv8p51arzpGXlYo=;
 b=lYQh2ih9uuC64MUxhrxge0eoPosivgEaojGw2ZmlbqoIy3z8sY6FRPU01ni6lElDRE
 g108FNkieztj0wwCJnwFkfOghaihurWXFuQkF8pRnuowZRZBEN9kgCTln4yQpoqduTqw
 0ea3+/EKlyNldbF704ELJYr24Ot0UF69D2Z12pJwSURp0hLUSjaBwGrwzYtCzWbV1w6n
 HU2D9E0ZW/OjTuSX6zOnoAEmcsRXK2yBdCw8EDhAPEdPRpnXZC9uHyjVaE/cnMuw/bsQ
 dBP4BNM9v02gcDidI7zVRbBFc2rAp0r51zBJ5uhfcjCok4qmRFjC3qj0mCi8DWznGTwq
 G5Mg==
X-Gm-Message-State: AOAM5316YzgDx50hnAvc+X/GoH2b5zr6zJfY6paVQ+Q2nXiGMbBgzfbQ
 AMBDPgU6jrPU4x83/7w4fgbZAw==
X-Google-Smtp-Source: ABdhPJyiJ2AyrJ1lG1qr2UVKhZEhIJJEgiR9ncDn0fA6fsjtGYqWhki6TbuMYe+fNrcu/eH+M5Gvzg==
X-Received: by 2002:a17:906:b50:b0:6d6:e503:131c with SMTP id
 v16-20020a1709060b5000b006d6e503131cmr1890440ejg.597.1648067122821; 
 Wed, 23 Mar 2022 13:25:22 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 gq12-20020a170906e24c00b006e067c93e1bsm334106ejb.39.2022.03.23.13.25.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 13:25:22 -0700 (PDT)
Message-ID: <9ce22670-b709-9046-2107-a475e763d43e@mind.be>
Date: Wed, 23 Mar 2022 21:25:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220313111921.1116296-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220313111921.1116296-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5base: fix CVE comments
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/03/2022 12:19, Fabrice Fontaine wrote:
> Commit 5770a645a3a49a3f0f02972131a4ff5283b4c11e forgot to update CVE
> comments
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/qt5/qt5base/qt5base.mk | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index a703481aed..f8edfe0847 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -14,8 +14,7 @@ QT5BASE_DEPENDENCIES = host-pkgconf pcre2 zlib
>   QT5BASE_INSTALL_STAGING = YES
>   QT5BASE_SYNC_QT_HEADERS = YES
>   
> -# 0010-Avoid-processing-intensive-painting-of-high-number-o.patch
> -# 0011-Improve-fix-for-avoiding-huge-number-of-tiny-dashes.patch
> +# 0006-Improve-fix-for-avoiding-huge-number-of-tiny-dashes.patch
>   QT5BASE_IGNORE_CVES += CVE-2021-38593
>   
>   # A few comments:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
