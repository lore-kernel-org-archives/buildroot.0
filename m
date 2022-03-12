Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C55C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 20:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E63C825DC;
	Sat, 12 Mar 2022 20:24:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jVJGsoR9-oVj; Sat, 12 Mar 2022 20:24:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C99381CFE;
	Sat, 12 Mar 2022 20:24:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D0CB81BF3DD
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0028408F8
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:24:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K2tE1RTHiVXv for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 20:24:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF161408C9
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 20:24:44 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id kt27so26176676ejb.0
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 12:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lIe9IRCNp2BmFo3Tf7IcPECod7IjVzUMMyJMc8imAbs=;
 b=RNTBk0xYqduDXjHqOTuFoUcKutTonWIwGRByjmdnLaIgSmsmdmGLkSjwsXK92U93lt
 wlsbgO6dBTRLjFXo3AblewMgh6asSe+DmI1ZjyiMhJdwnD/6eGYyzwAAPr/qWty/ALR2
 KxIMeWuhP96meG83D6zguBTAhalV+81U7lxlFLtwhvPJ7HTov6vIY/BwFpZFntrVH1sM
 jn/7U/61ZyWQlPBsLHZR3qalj+OyzIIPqG+ZnHDHp+lu5pER0wQLgC4Xzqa8tFD+F3Hi
 6GvIvT1CvIVd7QyV0g/Ad9ochFHu+PpfbkJXPzddJms+QACL5Fi/A/K3nwaF8IjEsMrA
 z5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lIe9IRCNp2BmFo3Tf7IcPECod7IjVzUMMyJMc8imAbs=;
 b=r4IZ4sMA/nEajNMI4WTkG77vUuvZn0KpGdBjCeR4QQGqbw7+Zb93bA5wt8D0PlhbnR
 WJHM3Ya98g4gnvMU9IPIxzxDRwV4HhCSK4jSK82elb3SG7jzViDkrZhNuyfT+Bd2tA/u
 c/qPqZBOHRi8tK3nwsMggFElO5EI+88Eatup8F6Pn5rKdWG+bkcEtPrDlMW4axMF9ldi
 LI3DEhZ35CVAoj0rNGZXDshgU0s/srXlEqVsWYjOflc9rziw1TRbWpWSkqEUx/QoK+fI
 hYmEPCvk2tVBQJHjw5JRHs79fVZK0NK/UGbz2Q1mMGKsrkX6znOJMSA4P+53DtVCme26
 X0bA==
X-Gm-Message-State: AOAM533AK21rfBPgSfA4jDG6kZvEPEi0eRtysRblvNA5o12j003wtGzV
 u59Z0xbW/S5Wnr5htyTp4IDOgA==
X-Google-Smtp-Source: ABdhPJwYcykdgTsshlkOjXVaDP9IJsWOeiYQnoiXoomzS9xBMPlgZofURhJkV7qQR2rOI7uX0Sr5/A==
X-Received: by 2002:a17:906:b1da:b0:6d6:dd9a:3a9b with SMTP id
 bv26-20020a170906b1da00b006d6dd9a3a9bmr13325039ejb.766.1647116682915; 
 Sat, 12 Mar 2022 12:24:42 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 g21-20020a056402115500b00413c824e422sm5094885edw.72.2022.03.12.12.24.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 12:24:42 -0800 (PST)
Message-ID: <978fe72d-8a69-727c-8cf8-ae6b769bed0d@mind.be>
Date: Sat, 12 Mar 2022 21:24:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220224175119.487040-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220224175119.487040-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/bpftool: add
 BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/02/2022 18:51, Fabrice Fontaine wrote:
> bpftool uses its own local copy of libbpf so add
> BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS to avoid the following build failure
> on ARM:
> 
> btf.c: In function 'btf_type_by_id':
> btf.c:461:14: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
>    if (type_id < btf->start_id)
>                ^
> bpf.c:62:4: error: #error __NR_bpf not defined. libbpf does not support your arch.
>   #  error __NR_bpf not defined. libbpf does not support your arch.
>      ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/aae772f1cfb16516a57f310c4f022e80a2a8d65e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/bpftool/Config.in | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/package/bpftool/Config.in b/package/bpftool/Config.in
> index e81d874343..a1ef3843e6 100644
> --- a/package/bpftool/Config.in
> +++ b/package/bpftool/Config.in
> @@ -1,5 +1,15 @@
> +config BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS

  Would it make sense to define this as "default y if 
BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS" instead? Hm, I suppose it's possible that one 
of them gains a new platform before the other one is updated...

> +	bool
> +	# see libbpf/src/bpf.c
> +	default y if BR2_arc
> +	default y if BR2_aarch64 || BR2_aarch64_be
> +	default y if BR2_i386 || BR2_x86_64
> +	default y if BR2_sparc || BR2_sparc64
> +	default y if BR2_s390x
> +
>   config BR2_PACKAGE_BPFTOOL
>   	bool "bpftool"
> +	depends on BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
>   	depends on !BR2_nios2 # binutils

  It's weird to still have this nios2 dependency here, but I guess it's nice to 
simply propagate all dependencies, keeping the redundant ones.

  Applied to master, thanks.

  Regards,
  Arnout

>   	depends on BR2_USE_WCHAR # binutils, elfutils
>   	depends on !BR2_STATIC_LIBS # elfutils
> @@ -13,6 +23,7 @@ config BR2_PACKAGE_BPFTOOL
>   	  of eBPF programs and maps.
>   
>   comment "bpftool needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, headers >= 4.12"
> +	depends on BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
>   	depends on !BR2_nios2
>   	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
>   		|| !BR2_TOOLCHAIN_HAS_THREADS \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
