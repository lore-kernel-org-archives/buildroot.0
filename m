Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A0AC433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 17:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3A7E41937;
	Thu, 21 Apr 2022 17:58:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pldg5vbUfKHT; Thu, 21 Apr 2022 17:58:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A3A7418F9;
	Thu, 21 Apr 2022 17:58:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BECD71BF406
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 17:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD0FA418F9
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 17:58:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XzK02zilG-Qd for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 17:58:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99643408FF
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 17:58:24 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 17-20020a05600c021100b00393a19f8f98so915574wmi.4
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 10:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Nw2TX36iSgOayHACCqsz9lSfRkb8TFhaIOx3TR9mMmQ=;
 b=Z/DoC7p1wKbAPZezZoPxD/BGfNIeOboZ/1zQplwUMOC9irJNW5hukPKFqUAmGk0CSx
 TkEyFpuNg+CFqYySIvg3yTKPNq34lk61RHZ7s5KKlIhm3XI8HUVp+APPu8NDZwaS3Cw8
 b6rKXKKqbD4kDXCMlRH39U3fWISX1ivmhjfCAW8SDdwKYwkDi0VZDSK2iAW4UdNz8GAi
 Ag6V+48+ReeXs5x+H1WkoSJQw2SwWM6FfMYCZn+NdX3I0GJsOlAIbILnFW2OEP4VEGmz
 TxdIRAJTvY5ZHJWnSmA9+2Ro6PADIoZi4GVsmi6aNemdZtge6jyif47eiga+Bw7v1kW8
 LPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Nw2TX36iSgOayHACCqsz9lSfRkb8TFhaIOx3TR9mMmQ=;
 b=P2WKegYerDjnCCwZYg465vHmbmfPSGFvyGHuU0XTtbOUc/S0bEqokfnH6+xS0zUEGg
 PSssY0TuEDbV01fqhq52WgPFkCgmqyS0gpzHVeR497DxKczACIqvQtpYvSxxy7g5BN4S
 bDv9Ep5fCQb65gAUWLO6zRjqEww96AMEfcX1+unmebWcoDKUHn1oYpYONHf03ODVQHIQ
 wCRRaWhk88kNjdjCD6CN5TdZoCIws6rEn/e5sixRqbjS+CqlVv/P1zyBy00xFvmf1ePl
 LJzzSkbwRCgFze1yEIBFNW3qr1v1FSG0O6fVXqu4IBRluzOOP1WWTw5KMqFVuUdNCwNr
 Nj2Q==
X-Gm-Message-State: AOAM533dQqXjGTmLE1ptvpENCbUkiBTwsvSRPs12KOJemGLNFPTGmbQn
 +dFWJ6QgxmH//ROYopEYxdxr5g==
X-Google-Smtp-Source: ABdhPJwSrHIxqSOcWotYf58LFCAtQr+S0NR22HXz4bD6HbGxTuXIEwGaomuEhuUVaK5T0M4g752klQ==
X-Received: by 2002:a7b:cb55:0:b0:38e:7dc6:40a3 with SMTP id
 v21-20020a7bcb55000000b0038e7dc640a3mr9939620wmj.82.1650563902810; 
 Thu, 21 Apr 2022 10:58:22 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a5d6488000000b002051f1028f6sm3236974wri.111.2022.04.21.10.58.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 10:58:22 -0700 (PDT)
Message-ID: <021eaeb3-9524-4856-b334-29a01a131f47@mind.be>
Date: Thu, 21 Apr 2022 19:58:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220412204844.24228-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220412204844.24228-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/bpftool: needs __sync_*_4
 intrisics
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



On 12/04/2022 22:48, Fabrice Fontaine wrote:
> bpftool needs __sync_*_4 intrisics since its addition in commit
> 3675131e6c654d7536a184db0184fde7a97040e0 and
> https://github.com/libbpf/libbpf/commit/b0c3d7133faa55fbcbc19f76f9cc9e183e178c97:
> 
> /nvmedata/autobuild/instance-26/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-26/output-1/build/bpftool-v6.7.0/src/libbpf/libbpf.a(libbpf.o): in function `bpf_program__attach_kprobe_opts':
> libbpf.c:(.text+0xff88): undefined reference to `__sync_fetch_and_add_4'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/919b8351d3783ca30a860df87ae814d5c4b9fd41
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/bpftool/Config.in | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/bpftool/Config.in b/package/bpftool/Config.in
> index a1ef3843e6..461be9e5b4 100644
> --- a/package/bpftool/Config.in
> +++ b/package/bpftool/Config.in
> @@ -10,6 +10,7 @@ config BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
>   config BR2_PACKAGE_BPFTOOL
>   	bool "bpftool"
>   	depends on BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>   	depends on !BR2_nios2 # binutils
>   	depends on BR2_USE_WCHAR # binutils, elfutils
>   	depends on !BR2_STATIC_LIBS # elfutils
> @@ -24,6 +25,7 @@ config BR2_PACKAGE_BPFTOOL
>   
>   comment "bpftool needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, headers >= 4.12"
>   	depends on BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>   	depends on !BR2_nios2
>   	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
>   		|| !BR2_TOOLCHAIN_HAS_THREADS \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
