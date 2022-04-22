Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1941C433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 21:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CBA961389;
	Fri, 22 Apr 2022 21:56:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jD4-CWfqZpMw; Fri, 22 Apr 2022 21:56:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99139610C4;
	Fri, 22 Apr 2022 21:56:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD17E1BF336
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 21:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8C4E40AFB
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 21:56:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hf5wIMfUbS1d for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 21:56:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A38940141
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 21:56:29 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id p18so6794019edr.7
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 14:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KtxIWJBHLKFZXVBTGdQVqJIPmF+afKK5lCB5LpSr514=;
 b=cfERTb1QM2/IFW+/gdmQUlLQ3b6Iq88uPXnOakK9vn9iRp3iCuBuiU2UOqt4xmh0rm
 5JPbOLPQjuzlW+ANB5ipCyfS8StMIuXoIxBPRaeBq7TF1Q88yyWtsqB8xJ/gvcnqUYDh
 nusqIffkxYMw5Bf/0AIPJXnJYDyPDx9PGQEG5NnZZLorVwn+2IRgbF/7I17gJJ88JVUf
 pQl0nR5COaPH639pCpzWQX3MSXwRLDoarh1/cuHV/kqZ0X8ccoL03k+WGPGWh56uL/oR
 rrj/BBVXBipGFu6bnfck8RfcQEwSqIpj+f2/EPyQdDNiZk39efrEp0vk5mwt0c16Gpw7
 A+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KtxIWJBHLKFZXVBTGdQVqJIPmF+afKK5lCB5LpSr514=;
 b=OGgXrmzgSB0Za6rSXJvKhDhZjig2/4DsH8Ek1crUtqZMiFy+6SNNBk0fysFbguGGOt
 x2IhhfDi5WGDN4IZD7on3v2MvheCpHx1RgGoRbWzhzJ3nZFHCFBuBnnAaQvdX0d8vQ9i
 1K4Ppv8sI+4i5N1BsancOeqzyJdyckH9/WSgPON9Hgrwp8VRl6TVim50owxJDM4yvqLF
 bRdPNJiiOt1nG3bt5nSHxF445wrYSdhBkdD1X6iw8jApQXzbYz7y46PIPWZu9RnbbpSm
 oRYjNRFqaueseQoN/AnqvrqLauFNUe9tZYLcbDIDrRJtVaHMUP3tK0aP6oqH81zkSPJ2
 L0eQ==
X-Gm-Message-State: AOAM531kxljtQ2bUXWvtLuXLEarPoakJLKgBV43GGHnWs7KTYbPJXsWY
 rn/0jPHJ7wBR8Nv/xGOfqDe0EQ==
X-Google-Smtp-Source: ABdhPJxA0Lr4k+hOLr8KUFMbHMmbsXx3gR1+aCFk8wAcFX/VpK8jtywwsaRXQq3aDhhv+ZXFFGFFCg==
X-Received: by 2002:a05:6402:2694:b0:423:fd1f:30c2 with SMTP id
 w20-20020a056402269400b00423fd1f30c2mr7035828edd.343.1650664588270; 
 Fri, 22 Apr 2022 14:56:28 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 i26-20020a50d75a000000b0041e84bb406fsm1412711edj.0.2022.04.22.14.56.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 14:56:27 -0700 (PDT)
Message-ID: <5eced090-c6ac-21fb-3206-f3c0ff0f2e74@mind.be>
Date: Fri, 22 Apr 2022 23:56:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
References: <20220422181418.2411463-1-joseph.kogut@gmail.com>
 <20220422181418.2411463-2-joseph.kogut@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220422181418.2411463-2-joseph.kogut@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/libcurl: add host-nghttp2 to
 host deps
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
Cc: Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/04/2022 20:14, Joseph Kogut wrote:
> This fixes building host-libcurl, which otherwise would fail with
> undefined references to nghttp2 symbols.
> 
> /usr/bin/ld: ../lib/.libs/libcurl.so: undefined reference to `nghttp2_pack_settings_payload'
> /usr/bin/ld: ../lib/.libs/libcurl.so: undefined reference to `nghttp2_http2_strerror'
> /usr/bin/ld: ../lib/.libs/libcurl.so: undefined reference to `nghttp2_submit_request'
> /usr/bin/ld: ../lib/.libs/libcurl.so: undefined reference to `nghttp2_submit_rst_stream'

  I guess this happens because it somehow finds libnghttp2 installed on the host 
but then fails to link with it? In any case, we don't actually need host-libcurl 
to be built with nghttp2 I think. So just pass --without-nghttp2.

  Regards,
  Arnout

> <snip>
> collect2: error: ld returned 1 exit status
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>   package/libcurl/libcurl.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 97857954db..d5805a1d32 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -173,7 +173,7 @@ endef
>   LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
>   endif
>   
> -HOST_LIBCURL_DEPENDENCIES = host-openssl
> +HOST_LIBCURL_DEPENDENCIES = host-openssl host-nghttp2
>   HOST_LIBCURL_CONF_OPTS = \
>   	--disable-manual \
>   	--disable-ntlm-wb \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
