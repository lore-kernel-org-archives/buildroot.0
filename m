Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56E1C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 19:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C59E60FCC;
	Thu, 21 Apr 2022 19:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7WQ5gN4JG0S7; Thu, 21 Apr 2022 19:10:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B127607F0;
	Thu, 21 Apr 2022 19:10:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E80811BF387
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4B6D40AA3
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:10:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hvNhpG3TXuje for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 19:10:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0455340A8A
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 19:10:30 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id a1so2083937edt.3
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 12:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QQrj+b1lcbLchAbwTMF4U8GhpBOX+qjLlZOtPp4f+FU=;
 b=WX3FFrr0Mz4mQzn3N5pHLmoSzB0HUdSmG7XiIE6Gg8/F2h/7OmiIhGm2hFBUKdErKP
 50xWEQ4FyvnSFkOq2o7Otir/YMDJMkNmYVuVv9jzjkVjpZTBNXk5r2Ocb1EdTT785xVn
 f5X9LncO9/eoGX55jIonECpgfqwVRfZ2CtZFm8yB+pXMxQQgASMlDljpA+3gjt3+2dt9
 6DT9hbts2nTomaMjFUjbXhCzPTP0NHeF/EWVo61Sidy6XMrah9EB1bYjtVwNa0YTysre
 XjhjY12+8BeeadRCNFBI64OVIRvqsG3qSmbAONiEplJ4IlTmubR41tIwEC29kUZFZFmh
 MXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QQrj+b1lcbLchAbwTMF4U8GhpBOX+qjLlZOtPp4f+FU=;
 b=HGuoASPeRFdSV2sGOQ+rj6ySztUkVSWAiE0kSGPSHv9iY2PV5c3Y4iqBiZstdZktL/
 /66CXIubT/4fWnYODKjXw3i1K6mMa/3eeBe9evPN1XMimP6F+UgA4WyKhdEh1Bo6wWar
 RxdEFD+7RfZRTXhlCjJaZBZNUQoSAwRI7M+8RjWFhokbrsfRx8OHPdBtWQk76oZ1Msy/
 Bm8bVLq7AAxcSlXdPlGfkYI6755PvnqhSEZHawgkahOWv7lm1KOBfAevIxMVXBKlApB2
 qvBAnU+GwWWwmtRS3u6wlrMrPGxkI3bZcqHE5Z+80ughGGNCOu9vphopWK9536drWFzN
 n0PA==
X-Gm-Message-State: AOAM531FDyqwdTko4JgoSmEYQJBvCWNCxFQOqyOjRcClgyfWiN3mLpQX
 qiPel5nnS1uo4sHBSfM5btRhdA==
X-Google-Smtp-Source: ABdhPJzhSlUDVenNf6QTOVWU3eQys9MXt5SAWA/FU9xeNkiPjR095VAvnrXRNDLxPao4YpTzS8irSQ==
X-Received: by 2002:a05:6402:d62:b0:41d:79e6:1617 with SMTP id
 ec34-20020a0564020d6200b0041d79e61617mr1089588edb.378.1650568229261; 
 Thu, 21 Apr 2022 12:10:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ec40-20020a0564020d6800b00420916b32c9sm12138339edb.59.2022.04.21.12.10.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 12:10:28 -0700 (PDT)
Message-ID: <fa06bc5b-2d22-a172-78d0-8c2600c4cf8a@mind.be>
Date: Thu, 21 Apr 2022 21:10:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220413192104.889800-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220413192104.889800-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/uftrace: needs NPTL
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/04/2022 21:21, Fabrice Fontaine wrote:
> uftrace needs NPTL since its addition in commit
> 09c97972d9f90b69cfc36f9ffe9e22c13daf9307 and
> https://github.com/namhyung/uftrace/commit/543fe53c256ceaef2d4d7cc44925bf1ad5a068a8:
> 
> buildroot/build/uftrace-0.10/buildroot/build/uftrace-0.10/cmds/record.c:670: undefined reference to `pthread_setname_np'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/8f884efb9d45f9145a4799981157c9226390b423
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/uftrace/Config.in | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/uftrace/Config.in b/package/uftrace/Config.in
> index 98ddb7cbfb..8f8c5d25fd 100644
> --- a/package/uftrace/Config.in
> +++ b/package/uftrace/Config.in
> @@ -8,7 +8,7 @@ config BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
>   config BR2_PACKAGE_UFTRACE
>   	bool "uftrace"
>   	depends on BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_setname_np()
>   	depends on !BR2_STATIC_LIBS
>   	select BR2_PACKAGE_ARGP_STANDALONE if \
>   	       BR2_TOOLCHAIN_USES_UCLIBC || \
> @@ -23,6 +23,6 @@ config BR2_PACKAGE_UFTRACE
>   
>   	  https://github.com/namhyung/uftrace
>   
> -comment "uftrace needs a toolchain w/ threads, dynamic library"
> +comment "uftrace needs a toolchain w/ NPTL, dynamic library"
>   	depends on BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
