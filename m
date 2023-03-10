Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D78C6FD1E
	for <buildroot@archiver.kernel.org>; Fri, 10 Mar 2023 20:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B59241709;
	Fri, 10 Mar 2023 20:56:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B59241709
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OSy9YUGzCSU9; Fri, 10 Mar 2023 20:56:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B3CF4170C;
	Fri, 10 Mar 2023 20:56:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B3CF4170C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8DD4D1BF390
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 20:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63BFD41C71
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 20:56:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63BFD41C71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7liRqqKciAkP for <buildroot@lists.busybox.net>;
 Fri, 10 Mar 2023 20:56:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 013C041C6B
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 013C041C6B
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 20:56:49 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so6997754wms.2
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 12:56:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678481808;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W7D2w1XoFc9hKlJKnwkhXH2m32WUh5bAwI4ztZyQ80Q=;
 b=Srgi995UBiwd/Xuhgp3HwC5h3ALdIepivtKQTi0YnR4IZiYR3FBJAE/aDHt7PmokSx
 jatvkTCaiTl74+xYuiEhCdiGQsHtKbwteIV9TIPGfLlnfXPlEksUXSDK+IFJp0c231NX
 Ew4c5VCkw0sMa9l106Y8pHBhqAt2GiOnHvBtn/VMDvDUuNYNV/+lSnmb/QxFqy2p3EZ2
 YKpaeUkVM9KrC0gkdhtCP5qn8CYid2E1EBlmKtCHbnRdkHEhmH8iWGbMrxAF4DzxVFja
 0ZcI+E1i7WoFdXnQjr514rRBi0UwG4T+MSErcVQg3slxrp+f61IVvZBJQJEFb7Mv0gsx
 hzXg==
X-Gm-Message-State: AO0yUKV3KT462IvwPBZnJE9rnC6AlnSHFsnw5mK+Ww3KHD2H1ofilY2O
 5TZPR79BZw5Zx1WPP29dZAQjSg==
X-Google-Smtp-Source: AK7set+eUlIIDzCUiKQexK854YJCsZRX0LqKNAzR0OgokWn8f35nZs5hQU3OUFhBjiykkopTpBb3Vg==
X-Received: by 2002:a05:600c:358d:b0:3df:e6bb:768 with SMTP id
 p13-20020a05600c358d00b003dfe6bb0768mr3919267wmq.24.1678481807923; 
 Fri, 10 Mar 2023 12:56:47 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 l26-20020a1c791a000000b003eb68bb61c8sm913116wme.3.2023.03.10.12.56.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 12:56:47 -0800 (PST)
Message-ID: <b3609fcc-1d5d-bdd7-7f79-2d0c285a0867@mind.be>
Date: Fri, 10 Mar 2023 21:56:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20230221115001.190317-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230221115001.190317-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678481808;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W7D2w1XoFc9hKlJKnwkhXH2m32WUh5bAwI4ztZyQ80Q=;
 b=CmrFpDL3uUG9MlkuM+5QliPAHJwiuk1CpjXcaKH1NB2Ao4X3T1DO6NRErHqcOY01jh
 0d3B85jU2RD7y8IUespe92Wbh4HZCQxou4/1dJpf4YHAdvjBtjcyax9ZgcEBG05pabU9
 CfJc1G2CujwQpno7WZJfv5bWwhLJc5lhPW6Jxn8jkPStNVR3yUMqbd+eO5zvg5DA301a
 OUBLsB3O7iuhqQOQkE9ZVS5hl4KhaYJ/1F2cE9JYsAVtfR5l7ZyKly7g79HPuIh3kMBc
 b4tPL2C7mklGjfayITFik8IRi529vKqIMHwitN7i6lqR6a68NBoP9qt6o9sydj2dnnez
 5NbA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CmrFpDL3
Subject: Re: [Buildroot] [PATCH 1/1] package/pcre2: drop JIT sparc
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



On 21/02/2023 12:50, Fabrice Fontaine wrote:
> JIT sparc support has been dropped since version 10.41 and
> https://github.com/PCRE2Project/pcre2/commit/b67d5682019fd192a615a1d5ed254b564f54126b
> resulting in the following build failure since bump to version 10.42 in
> commit 64a03682cc1a90a311b2331224deac62f8c8940f:
> 
> src/pcre2_jit_compile.c:82:2: error: #error Unsupported architecture
>     82 | #error Unsupported architecture
>        |  ^~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/d8246c9e3e54547cdb7d94dcdbf376d292dfd787
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/pcre2/Config.in | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/package/pcre2/Config.in b/package/pcre2/Config.in
> index f06f1914f3..ba4719dd3d 100644
> --- a/package/pcre2/Config.in
> +++ b/package/pcre2/Config.in
> @@ -29,7 +29,6 @@ config BR2_PACKAGE_PCRE2_JIT_ARCH_SUPPORTS
>   	default y if BR2_i386 || BR2_x86_64
>   	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
>   	default y if BR2_powerpc
> -	default y if BR2_sparc
>   
>   config BR2_PACKAGE_PCRE2_JIT
>   	bool "enable JIT support"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
