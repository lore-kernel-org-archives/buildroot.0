Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D451C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 15:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF242400D3;
	Sun,  5 Dec 2021 15:59:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X49GHk5z2XZJ; Sun,  5 Dec 2021 15:59:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6EE1401C4;
	Sun,  5 Dec 2021 15:59:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 35BCA1BF275
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 15:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EC9E8274E
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 15:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DOS9hXsydt3p for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 15:59:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10D0F80C97
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 15:59:46 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id e3so32992413edu.4
 for <buildroot@buildroot.org>; Sun, 05 Dec 2021 07:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OdhrcpMkWMMnzeigKYDZLOTxT+DrYwQQZYHD06kyPyI=;
 b=eGwo7TEr5buVTbVS20bAc8e1DIyRDSCAhAWSSeGjpi1RjbYEgmFuVpDvPrgv5qluTx
 dHEOjKE89U0miwNmTEZqRT6HJ8H5YMaF5pSHp9ivCeot2F8DknEczHA0SG1zGCknCSwr
 uA1lJ46WNaB115j+gPvk3/TGTw/eARLMUKvB7v9m04iSdxGAHq8cXCYH5Shl8A88TrK+
 4FG7/cEKe4fNgtzGTaSwdDFtmkmS343Z9A2BTiCEepdQMTMCITU6mFVtaLwQCi2QCSET
 2tCoK87A7CLnjiWDAOiEfIhg5RXCX3LY9f5BNsy88c7EhqVy8e4reDS3If8af6U2By3K
 H03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OdhrcpMkWMMnzeigKYDZLOTxT+DrYwQQZYHD06kyPyI=;
 b=nch69INb+Av2uUvYeXudBsaD5gO5/GjS9EXnCfsuOw4kYuGgwSr+Y/97jLY37PCyOJ
 Rx95AvEMkzBv43wpSuzYbIyiQV/22SNgthFm7VWtuPfdorSch5pzd349/Pz++CAmVq7E
 2yqjdPHhjrFaADI2Q0qr3DpWG0BxgZEjExhqdFAYNV3NbD6UZggKxHIXldt1utjl76qh
 uPNdnBOWPkjwDShSUqH1MYxNYpkdCu6bZTACQA5IOIcH8xhOTVQo7Kj4HeqVWN3Q88Fd
 uDc5nGKU04fmW/RhNNT+YMu3rPey7lHVQTL3qREoDmtJ/yxRFfG956IkBgQYBFWUCnRa
 Xf7A==
X-Gm-Message-State: AOAM532pE/H6hGjI9Pv/vrGxuxmpSuohgXjenF5BWjVe6W8K1ijHK1Fd
 lwMZLWyOeX75o8hkX1cqv8xozQ==
X-Google-Smtp-Source: ABdhPJwoKUsLmO2ZhKT4dgOL8LF2PpL1S6YDjArXzBMaAqVXsWu5IJvBBFs7JYx55Tj5Gaxo0tEnLg==
X-Received: by 2002:a17:907:6d10:: with SMTP id
 sa16mr39795438ejc.532.1638719985216; 
 Sun, 05 Dec 2021 07:59:45 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e1sm6033038edc.27.2021.12.05.07.59.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Dec 2021 07:59:44 -0800 (PST)
Message-ID: <9a10ed5f-5af8-9314-8008-739619a99750@mind.be>
Date: Sun, 5 Dec 2021 16:59:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Markus Mayer <mmayer@broadcom.com>, Peter Korsgaard <peter@korsgaard.com>
References: <20211124180535.574859-1-mmayer@broadcom.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211124180535.574859-1-mmayer@broadcom.com>
Subject: Re: [Buildroot] [PATCH RESEND] package/mkpasswd: define
 _DEFAULT_SOURCE to suppress compiler warning
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/11/2021 19:05, Markus Mayer via buildroot wrote:
> We define _DEFAULT_SOURCE in mkpasswd.c to suppress a compiler warning.
> 
> In file included from /usr/include/x86_64-linux-gnu/bits/libc-header-start.h:33,
>                   from /usr/include/stdio.h:27,
>                   from [...]/buildroot/output/arm64/build/host-mkpasswd/mkpasswd.c:24:
> /usr/include/features.h:187:3:
>    187 | # warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE"
>        |   ^~~~~~~
> 
> As per GLIBC 2.20 release notes[1]:
> 
>      The _BSD_SOURCE and _SVID_SOURCE feature test macros are no longer
>      supported; they now act the same as _DEFAULT_SOURCE (but generate a
>      warning). Except for cases where _BSD_SOURCE enabled BSD interfaces
>      that conflicted with POSIX (support for which was removed in 2.19),
>      the interfaces those macros enabled remain available when compiling
>      with _GNU_SOURCE defined, with _DEFAULT_SOURCE defined, or without
>      any feature test macros defined.
> 
> [1] https://lwn.net/Articles/611162/
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>

  Applied to master, thanks.

> ---
> 
> Originally sent about a month ago:
> https://lists.buildroot.org/pipermail/buildroot/2021-October/627062.html

  You can slightly accelerate this by putting a fixes tag in the commit message. 
E.g. you could have written:

The _BSD_SOURCE macro is deprecated in glibc 2.20. Use _DEFAULT_SOURCE. Keep 
_BSD_SOURCE for compatibility with older glibc.

[... the rest of your explanation ...]

Fixes:

In file included from /usr/include/x86_64-linux-gnu/bits/libc-header-start.h:33,
                  from /usr/include/stdio.h:27,
                  from 
[...]/buildroot/output/arm64/build/host-mkpasswd/mkpasswd.c:24:
/usr/include/features.h:187:3:
   187 | # warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use 
_DEFAULT_SOURCE"
       |   ^~~~~~~


  Anyway, I left the commit message as is.

  Regards,
  Arnout

> 
> Would you mind pulling this in for 2021.11?
> 
> Thanks.
> 
>   package/mkpasswd/mkpasswd.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/package/mkpasswd/mkpasswd.c b/package/mkpasswd/mkpasswd.c
> index fd16230468a4..ae8594061cf6 100644
> --- a/package/mkpasswd/mkpasswd.c
> +++ b/package/mkpasswd/mkpasswd.c
> @@ -18,6 +18,11 @@
>   
>   /* for crypt, snprintf and strcasecmp */
>   #define _XOPEN_SOURCE
> +/*
> + * _BSD_SOURCE is deprecated as of GLIBC 2.20; _DEFAULT_SOURCE should be used
> + * instead. (https://lwn.net/Articles/611162/)
> + */
> +#define _DEFAULT_SOURCE
>   #define _BSD_SOURCE
>   
>   /* System library */
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
