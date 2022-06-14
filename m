Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9586C43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 16:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76F1940B84;
	Tue, 14 Jun 2022 16:56:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A1XpvXatFnJP; Tue, 14 Jun 2022 16:56:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F7BB40A88;
	Tue, 14 Jun 2022 16:56:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2053B1BF37A
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10042832B3
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:55:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H3tEmPE18jva for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 16:55:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1ED108330B
 for <buildroot@busybox.net>; Tue, 14 Jun 2022 16:55:21 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id g25so18351458ejh.9
 for <buildroot@busybox.net>; Tue, 14 Jun 2022 09:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=+NlS0Jh0JUsu+q0vkSA3AkkS+Y6iYmfDPvBqYanlzcQ=;
 b=YYx+vQFXZVtuZvDf5nvzwrbbGIYzrHY8H/qciaqRvpiMNnsNQOrV8CUCCN6TbIajiU
 reW6qJOPGYDTGEoVl6GHlIPJ901qu/6Mv0qXPsaoj4freYQ4u8tQupwNUDNEwm1hR7S6
 JI8FQsbCovCqzIJ0EaTLJee4TMXFQTEPUSyV1FkSFCldoaM8Fnnt/DaHGL/2Z0wpqjNr
 G1na9QtwLNXf3hGN2AePOEBxV2LCe6h6PEc/5iRb8pu9Zu97TnChw7ONrechWzjyoOCY
 NjILzMcJ99Gqlmi5bqI00hFYlsLvThBmQvew1jpXdUDJWyFjBm/yySLZKVzhKVtHbyqk
 9vKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+NlS0Jh0JUsu+q0vkSA3AkkS+Y6iYmfDPvBqYanlzcQ=;
 b=cwnoOM0HRD3yCx7Y8u8iuwBkho3eXsCLABZOTVjzIUaP9f5QazY4T24Iq2gf9H1/vN
 qPXXwV6idUip5Nisyp1h3ZYUVuMtr304aU+apGSpJZh0L35VlD1wVvDcmbS3AUgYy0VZ
 qwUx67lREGrYuZQzBW2x2WAQqcI14LojtnR2EoMln8bfR1wzpcdTt2oBqCy1Kju28qVm
 v9m509wXWsVsALjER29KP24Vh4QvzdeINLylEELOSYwg4444TfsfR/dd2buanRP4Qqaz
 +VhmcUfi/Z1Szu3lBWzcUrC0rWn9uWhuFAhaay+q9SFlcpyQYqtOl4PPMzLOLtKo1ITz
 ALdQ==
X-Gm-Message-State: AJIora8mJZ5usZ5rXKsIAXCxb4I/z5+RfFmeTgoX+3Bdx5cztU7tx5z0
 CS7UHzP/imBchZnyJbYmQQygow==
X-Google-Smtp-Source: AGRyM1s8KgXTZqJwqv35a+7qtHnzvCPyok7/i/PhoH+Axt5Fhnvh/Gci7V8QRztaahCZjnwJTK8HHQ==
X-Received: by 2002:a17:906:7315:b0:711:db45:af4c with SMTP id
 di21-20020a170906731500b00711db45af4cmr5053868ejc.412.1655225719293; 
 Tue, 14 Jun 2022 09:55:19 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 l9-20020a170906414900b006ffa19b7782sm5235090ejk.74.2022.06.14.09.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 09:55:18 -0700 (PDT)
Message-ID: <15d6fdad-b31c-f54f-5355-b74161dde6d3@mind.be>
Date: Tue, 14 Jun 2022 18:48:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220610165707.2574471-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220610165707.2574471-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/libgtk3: bump to version 3.24.34
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



On 10/06/2022 18:57, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libgtk3/libgtk3.hash | 4 ++--
>   package/libgtk3/libgtk3.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
> index 23ce1f42b..c68c6e90f 100644
> --- a/package/libgtk3/libgtk3.hash
> +++ b/package/libgtk3/libgtk3.hash
> @@ -1,5 +1,5 @@
> -# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.33.sha256sum
> -sha256  588b06522e25d1579e989b6f9d8a1bdbf2fe13cde01a04e904ff346a225e7801  gtk+-3.24.33.tar.xz
> +# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.34.sha256sum
> +sha256  dbc69f90ddc821b8d1441f00374dc1da4323a2eafa9078e61edbe5eeefa852ec  gtk+-3.24.34.tar.xz
>   
>   # Hash for license file:
>   sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
> diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
> index cd0a75eb2..53d7f6898 100644
> --- a/package/libgtk3/libgtk3.mk
> +++ b/package/libgtk3/libgtk3.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   LIBGTK3_VERSION_MAJOR = 3.24
> -LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).33
> +LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).34
>   LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
>   LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
>   LIBGTK3_LICENSE = LGPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
