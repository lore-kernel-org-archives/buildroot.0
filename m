Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB516C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 16:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 538E44060F;
	Sat, 23 Apr 2022 16:27:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4zy-P3XjfHnF; Sat, 23 Apr 2022 16:27:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 519344048A;
	Sat, 23 Apr 2022 16:27:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 47FCB1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 368E883E3A
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:27:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rA7fOFzMHgUQ for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 16:27:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F97083E09
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 16:27:16 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id m20so1096169ejj.10
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 09:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=kfgqhDtRUiqP9E0i/Wx4oaBip8U1MedA4rlxcnnvPy0=;
 b=L6sPt4aZ7yDWMU5G26TZM/hj6/MY2NdAdI0rBL/KVKKgMoxRMMopjNgMNM99itTmgn
 JgnUq8OOV4OJDF285A73CuLfj4lEwTY8WpvKyclmM1PRtrnrtbFpHIePlM3oXFHZCkQr
 nNFPTf0vlusFvCmBKiFUTqD5sH8qa+Rot8crrG6t0o1Lrj6qgHJRMTxXGkahGBYACbGr
 WFrEr79HKAly/zJ41OI8dvRcbPeDeVN+w6E2cwWZIsSGcZDyWnGQzKkfdT9CSNZGKoFx
 Xj6z6s4zQYzwmgtNts7m7LXX7SQKLq9fHje1OjOBzSOalxkYCE0lUINJbPtH8kcEFBME
 CI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=kfgqhDtRUiqP9E0i/Wx4oaBip8U1MedA4rlxcnnvPy0=;
 b=2qGQfDTlsl5gM/7xRMoQ5c/u5a8WweAjgRiP9PsYqmlzOLjJov0AjsN5mTTRGqQcR7
 l6rIlCseYdQAPbTuFjU47umpulutUkONX1rQ/AoVkXEiNQOKLQOAc0ajVpIcCOS+B7GN
 gikBYKYNc7P4J6jc9AILyfxQOTEOGgBadSZwoKbKPAbZvRjCrHZBKP3UUby3TDz8c+4q
 1ZXu7nFayZiarj4r/rrpGQcon+jEKkM35yevaXui+U/edPDBl2XS/v7EffTj7qLxpDfZ
 b1MkWr8MVvkj4WX2nJdSL9BfqWQlNZAUbxDnWNqGFBKSdE/2h0dDo3o37rRJAr3p9XsQ
 7I2w==
X-Gm-Message-State: AOAM531rDVbONl1DJAB7DXoiimaZsiFCUeGdu2/UBLDFNuiBw7RVXKt1
 E/V6zFGvtSZWL+u0j6SHeB2F6XVGgoaGOg==
X-Google-Smtp-Source: ABdhPJyuwKDvPwT1ScMTQxiIi39iiPIJS0ihu2ms3IccETaf9r3VNhqhce68zuaGSNaGMf4o0kvnEQ==
X-Received: by 2002:a17:906:dc93:b0:6e8:8d81:b4bb with SMTP id
 cs19-20020a170906dc9300b006e88d81b4bbmr9115180ejc.32.1650731234476; 
 Sat, 23 Apr 2022 09:27:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a50c102000000b0042423e1328fsm2333792edf.26.2022.04.23.09.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 09:27:14 -0700 (PDT)
Message-ID: <8c47e452-91b6-835e-a3b2-8377aa823896@mind.be>
Date: Sat, 23 Apr 2022 18:27:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220420164319.1114520-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220420164319.1114520-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/tbb: fix nios2 build
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/04/2022 18:43, Fabrice Fontaine wrote:
> Fix the following build failure on nios2 raised since bump to version
> 2021.5.0 in commit 3c66ac07a0783b21f95e699b3762edd15e27bdf9:
> 
> In file included from /home/giuliobenetti/autobuild/run/instance-2/output-1/build/tbb-2021.5.0/src/tbb/tools_api/ittnotify_static.c:17,
>                   from /home/giuliobenetti/autobuild/run/instance-2/output-1/build/tbb-2021.5.0/src/tbb/itt_notify.cpp:43:
> /home/giuliobenetti/autobuild/run/instance-2/output-1/build/tbb-2021.5.0/src/tbb/tools_api/ittnotify_config.h: In function 'long int __itt_interlocked_increment(volatile long int*)':
> /home/giuliobenetti/autobuild/run/instance-2/output-1/build/tbb-2021.5.0/src/tbb/tools_api/ittnotify_config.h:348:12: error: '__TBB_machine_fetchadd4' was not declared in this scope
>    348 |     return __TBB_machine_fetchadd4(ptr, 1) + 1L;
>        |            ^~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/2b55d1d171f21030be8312f984ea02ec8c8348a8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-Define-ITT_ARCH_IA64-when-undefiend.patch | 27 +++++++++++++++++++
>   1 file changed, 27 insertions(+)
>   create mode 100644 package/tbb/0003-Define-ITT_ARCH_IA64-when-undefiend.patch
> 
> diff --git a/package/tbb/0003-Define-ITT_ARCH_IA64-when-undefiend.patch b/package/tbb/0003-Define-ITT_ARCH_IA64-when-undefiend.patch
> new file mode 100644
> index 0000000000..5b7f002499
> --- /dev/null
> +++ b/package/tbb/0003-Define-ITT_ARCH_IA64-when-undefiend.patch
> @@ -0,0 +1,27 @@
> +From 6fad69889da67bc4d4baff4afa94f77da45e006d Mon Sep 17 00:00:00 2001
> +From: Felix Yan <felixonmars@archlinux.org>
> +Date: Thu, 7 Oct 2021 14:16:16 +0800
> +Subject: [PATCH] Define ITT_ARCH_IA64 when undefiend (#550)
> +
> +[Retrieved from:
> +https://github.com/oneapi-src/oneTBB/commit/6fad69889da67bc4d4baff4afa94f77da45e006d]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/tbb/tools_api/ittnotify_config.h | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/tbb/tools_api/ittnotify_config.h b/src/tbb/tools_api/ittnotify_config.h
> +index 8ecc23781..f904a8e9d 100644
> +--- a/src/tbb/tools_api/ittnotify_config.h
> ++++ b/src/tbb/tools_api/ittnotify_config.h
> +@@ -147,6 +147,10 @@
> + #  define ITT_ARCH_IA32E 2
> + #endif /* ITT_ARCH_IA32E */
> +
> ++#ifndef ITT_ARCH_IA64
> ++#  define ITT_ARCH_IA64 3
> ++#endif /* ITT_ARCH_IA64 */
> ++
> + #ifndef ITT_ARCH_ARM
> + #  define ITT_ARCH_ARM  4
> + #endif /* ITT_ARCH_ARM */
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
