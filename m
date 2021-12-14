Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDC2C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 20:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECDDC8141F;
	Tue, 14 Dec 2021 20:05:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LBARbSAwnMPR; Tue, 14 Dec 2021 20:05:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BDAE81839;
	Tue, 14 Dec 2021 20:05:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CB121BF30E
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AFF881846
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:05:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VLiDHZhSK3Py for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 20:05:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A84128186A
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 20:05:21 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id t5so66793266edd.0
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 12:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=F9aHKyTRbZRL9FdxbqRxNygk/OcART0RVfG7plF5ToA=;
 b=GhddhEVZEUDPd/z+AYKKodTY3mrsCRGCwN9z6D9bvgysejOujn74UHcnR6Xnc+DhAM
 /9RnlELQCFhhHICoNux9C68kNnIiCYG7QE4+C9y9KC18CqmVFD+G8q/N1nme3UvYYWdy
 KSGsyP3dxbktVTim72svCNzvwFPrdXp4BFCax4VRRvtoPZP9aPcj8kkii2Aew/SJTVW+
 ZumlDwjvlQDA8UQQefyycFPIFQmcYsGoEiikj3ayRPW7anmQplwzytE+A3JO3JRwUhzQ
 r0oQt41CNvwH0U32bmlr4pwO2Vh0W2LiqBh/Ox/TNKo1A1hTVtSOGQTlaQnPP3uifFJW
 AxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=F9aHKyTRbZRL9FdxbqRxNygk/OcART0RVfG7plF5ToA=;
 b=6iT9oOx8Q2jyUiu4o20Y6qchwJUbFFjLj9zzAMcZO0S9Dvt5CSCULYbXm4w6n698B9
 qOI96ungdL40RjGKlwsyDfwYLC0wDej+bywJ4mzA1ZB3qJEDU4hb0WQUaYicFUQOXEsT
 tom+DSzl4BfHUnuOYWmxRQdiUfUWpU/yj7srGZNcexB4xKoPO+dLtGPM0tviG8UGlpXU
 uXrLott+DUBYM1x/Dvik0J+Yf+ps6exqLbozCCpLKknWQdbpa8X0RPlU+TAApBoDKuka
 myNg+/4ljRzsHOWhC/N4LxEREI6lejmNFZqy+mgbAeJTajjJnH4/k9ebl5/cG380w7sK
 oQZA==
X-Gm-Message-State: AOAM530CSMUmG51zePQm4WmjkHDHOjL78iq70O5m8cveM1S6fQhyfLU3
 SeITyMhiHb6lCKecjscYVGqMs6xVl+8Ncw==
X-Google-Smtp-Source: ABdhPJw2yzsrrLK+1vFT/z50dz+j7xPcHxkK/jrSZsDxeHHkx7QgzLAAk11M2aa3SBTsB+BUXMrR+Q==
X-Received: by 2002:a17:906:c147:: with SMTP id
 dp7mr7953199ejc.173.1639512319883; 
 Tue, 14 Dec 2021 12:05:19 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e12sm231807ejs.86.2021.12.14.12.05.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 12:05:19 -0800 (PST)
Message-ID: <427af800-4dd9-5ddd-d735-01e185cfbee1@mind.be>
Date: Tue, 14 Dec 2021 21:05:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20211212223452.317122-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211212223452.317122-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump to version 3.2.0
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



On 12/12/2021 23:34, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/harfbuzz/harfbuzz.hash | 2 +-
>   package/harfbuzz/harfbuzz.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
> index d5a376830a..1615933a6e 100644
> --- a/package/harfbuzz/harfbuzz.hash
> +++ b/package/harfbuzz/harfbuzz.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  4056b1541dd8bbd8ec29207fe30e568805c0705515632d7fec53a94399bc7945  harfbuzz-3.1.2.tar.xz
> +sha256  0ada50a1c199bb6f70843ab893c55867743a443b84d087d54df08ad883ebc2cd  harfbuzz-3.2.0.tar.xz
>   sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
> diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
> index 97b28ce236..67eab359c6 100644
> --- a/package/harfbuzz/harfbuzz.mk
> +++ b/package/harfbuzz/harfbuzz.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -HARFBUZZ_VERSION = 3.1.2
> +HARFBUZZ_VERSION = 3.2.0
>   HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
>   HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
>   HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
