Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E0DC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 20:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E908C40B21;
	Thu, 14 Apr 2022 20:25:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19MWQwni1EMU; Thu, 14 Apr 2022 20:25:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11FAD40A8D;
	Thu, 14 Apr 2022 20:25:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69F861C1189
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5819B83F85
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:25:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Em7MlZYHaMuE for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 20:25:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 733E883EB9
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 20:25:32 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id v15so7741680edb.12
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 13:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=XVvfHXTt0LII8UzJQsv/RgJx4UbCMVfB6VEMNpMcgJA=;
 b=d9rjHuwY/G11f5hrU6hbM0hR70YyyAaO0zc00iCV3dbcHIajY2MsVqmVOJ9WeZPVeJ
 2wHlx+vQYZqgkYBBwJ9XNt08DsItJgfUrEG76bk8KFENEDhu327lT0JFDHmo68u9uZPC
 VeynUfT4aTU1g41z91F5y79bXeEmrd1t3hkeM2v04ui1iVZAqqb3quTUdXVeoNTUNmmU
 1ddbfMNymlZO59pUWrHuiS9KhNROvClb/RRZ7+o9q7ozW7fU7UBlNscLUVZyuQVy8AJz
 Xwi6gedcR7WOx3CQq6YF/Ztnzp9e6DDbvIsrF6D44DyhoOELGy7J4JGuQ8N3/TWIPouf
 w3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=XVvfHXTt0LII8UzJQsv/RgJx4UbCMVfB6VEMNpMcgJA=;
 b=Iq0O+E2mkXu65RCX9IPrtD2Tb+ieqPkpQYUY9uo9Xxlc4hLZ0PoG51hep/WKvrl6M9
 Bd9eyPaKvTlOipSgRRWU0n0QdXEQrty44HHL5cTNnEwS8FCRJB9O40hO3xDjUZxBuxf/
 2NSBUiAHCQcAwyvzIF5okGTriizWugLFNCUJFRR5lCQH+biN122S47W5tpJ6TGTgLaJT
 FEjY8UX0gEQb9Xw1genVt9GGKSoiUDSMLFoGK91B3nA/qJHI+7yyuxR4j9bLygqZsD+x
 q1NLN3lMKxgOGGvrz/gsCXliSqimbmXCgj6Ji7N7Wy3etUONd2VefXh8/HyMNulKmayg
 yTAw==
X-Gm-Message-State: AOAM532KB/VxJ459MboMHTcaa6+f2UCP3UV93pM73Ksyk/s3Qhp9B/0/
 sIabNoJisdjAoaEZEPyLAuU59pvtmWCtYA==
X-Google-Smtp-Source: ABdhPJzCEF1q5bhYdaTjiziTv25XLbV07HXFMoSx3XsbevKLJa6xRwZ/nbK4HsyKK56d7bEPSBUO8g==
X-Received: by 2002:a05:6402:2318:b0:413:7645:fa51 with SMTP id
 l24-20020a056402231800b004137645fa51mr4919182eda.201.1649967930696; 
 Thu, 14 Apr 2022 13:25:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 g9-20020aa7c849000000b00412fc6bf26dsm1523201edt.80.2022.04.14.13.25.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 13:25:30 -0700 (PDT)
Message-ID: <4a82c1bb-5c32-4f2e-e430-6cec79c6eeb9@mind.be>
Date: Thu, 14 Apr 2022 22:25:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220411221248.609465-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220411221248.609465-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/avrdude: spi needs headers >=
 4.8
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/04/2022 00:12, Fabrice Fontaine wrote:
> SPI unconditionally uses GPIOHANDLE_SET_LINE_VALUES_IOCTL which is only
> available since kernel 4.8 and
> https://github.com/torvalds/linux/commit/d7c51b47ac11e66f547b55640405c1c474642d72
> resulting in the following build failure since switch to upstream in
> commit 03fa36df7e6aca0f4a1c8ae2fe691c0cda6ddc7a:
> 
> linuxspi.c: In function 'linuxspi_reset_mcu':
> linuxspi.c:102:28: error: storage size of 'data' isn't known
>       struct gpiohandle_data data;
>                              ^~~~
> linuxspi.c:110:32: error: 'GPIOHANDLE_SET_LINE_VALUES_IOCTL' undeclared (first use in this function)
>       ret = ioctl(fd_linehandle, GPIOHANDLE_SET_LINE_VALUES_IOCTL, &data);
>                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/769021040e5e9293584734e4f461baeaa6dd91cd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/avrdude/Config.in | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
> index 89558a5ff5..cbbd076667 100644
> --- a/package/avrdude/Config.in
> +++ b/package/avrdude/Config.in
> @@ -20,10 +20,10 @@ if BR2_PACKAGE_AVRDUDE
>   config BR2_PACKAGE_AVRDUDE_SPI
>   	bool "SPI support"
>   	default y # Backward compatibility
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
>   
> -comment "SPI support needs a toolchain w/ linux headers >= 4.6"
> -	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
> +comment "SPI support needs a toolchain w/ linux headers >= 4.8"
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
>   
>   endif
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
