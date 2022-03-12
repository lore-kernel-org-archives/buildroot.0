Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B637C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 16:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DD43410E1;
	Sat, 12 Mar 2022 16:59:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B1ocbolJ88Hn; Sat, 12 Mar 2022 16:59:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3420040886;
	Sat, 12 Mar 2022 16:59:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 672091BF279
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56AF540886
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:59:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KH5UFPAqWztF for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 16:59:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89D9440876
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 16:59:13 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id yy13so25415586ejb.2
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 08:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/1jQp7joVl5k2jlKwjha7+tF6lvTrbVxtIlIG3RA9WY=;
 b=HzVJrIG57wlXS9yGmv9K5Dj0SmofekftcYnRVUjYVBUiIKwE9+ofLW6j/XSqKQuEqb
 OL6OJkTPMZxLk4cnWwo5x84Z+z8dOny5UbZn0JNfLugiEokIF8fRalW4UsfxMc89QRiG
 tIxgOg3hunIdzADPfqzP+3IQo4LAR62bIgFpHJo2c7O7h18jH2ExhBLYTVpSZqvR7sPR
 MVg98s+SovqS+4CdHcLz3HbW7OQWK0VSxOfrI6TS0DrQh3ZUyfoI0djy1hrag9iK7aQX
 Sd2v5vTKg3C+fRfrJeQG6GVljHA+/m80Z0Pf8X8R1ItAPQzjNhND3H4j61FNJ8Mmu2iX
 1zKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/1jQp7joVl5k2jlKwjha7+tF6lvTrbVxtIlIG3RA9WY=;
 b=JpyFRooY++DFKwHPW/c6NYyARLiahlNwtU+Gdx92LkW3wMaMmWRuk+tvLndrHOmzYU
 gaCdwJYxpYmsFj6QRHRwDav1sX+Myd+ldVcDjBFVTuLvDfs1hykgfdDwZDcEZ38g1LVd
 CM5FOT7w7ojMxJJwf8FmrNy1u8be9TngUDz9qQwMcDayxmfDXqjvtavqpJT4KIOiRI/b
 fhvV3qkkv5mw35bTCvmATFLEFIm3x7vYtWaFJ6ScgA42KnBp9YHAuyR68xtnBypYXyqE
 kkrliWgzPmXJYoc7ZTNktasDPV2tb7xdbI0k2ZFawxOvmmkQx+KW9z6TNIthAFBE9X17
 /v7A==
X-Gm-Message-State: AOAM533aGnu7yL4XQ56N9f4z7VZmM/njz0Kf5CAwZSH5wOKa3DijpWJP
 PkykGCWcBTXdQYYoy83Mb+HvYw==
X-Google-Smtp-Source: ABdhPJzw66Ra6H6Inu5e5E3PlTjt7o7WXF5KSKlUuuLrMDsJ7GXm+1j+FSmi7PXZd01YvEiCrmEy/A==
X-Received: by 2002:a17:906:9b94:b0:6db:67b:a6d6 with SMTP id
 dd20-20020a1709069b9400b006db067ba6d6mr12520515ejc.367.1647104351813; 
 Sat, 12 Mar 2022 08:59:11 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a50d94a000000b004131aa2525esm5112154edj.49.2022.03.12.08.59.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 08:59:11 -0800 (PST)
Message-ID: <9d00d702-8cb5-7738-364a-c4c4e967e88a@mind.be>
Date: Sat, 12 Mar 2022 17:59:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220218173613.315794-1-giulio.benetti@benettiengineering.com>
 <20220218173613.315794-2-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220218173613.315794-2-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/trace-cmd: bump to version 2.9.7
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
Cc: Pierre Floury <pierre.floury@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/02/2022 18:36, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/trace-cmd/trace-cmd.hash | 2 +-
>   package/trace-cmd/trace-cmd.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
> index 00cecc7828..4d39e4d5ea 100644
> --- a/package/trace-cmd/trace-cmd.hash
> +++ b/package/trace-cmd/trace-cmd.hash
> @@ -1,5 +1,5 @@
>   # Locally computed
> -sha256  45924a763376a700221f64b4034f87263e4038ec88b120a0abfb5743d051d068  trace-cmd-v2.9.6.tar.gz
> +sha256  a74d9ade2633b88d0ad199360d51996427e23f4835594133e456cd6e3bd3a651  trace-cmd-v2.9.7.tar.gz
>   sha256  b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING
>   sha256  70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
>   sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
> diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
> index fe0cd71ec4..52bb99036c 100644
> --- a/package/trace-cmd/trace-cmd.mk
> +++ b/package/trace-cmd/trace-cmd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -TRACE_CMD_VERSION = 2.9.6
> +TRACE_CMD_VERSION = 2.9.7
>   TRACE_CMD_SOURCE = trace-cmd-v$(TRACE_CMD_VERSION).tar.gz
>   TRACE_CMD_SITE = \
>   	https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/snapshot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
