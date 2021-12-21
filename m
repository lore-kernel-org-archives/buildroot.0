Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE114C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Dec 2021 21:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AF7B40124;
	Tue, 21 Dec 2021 21:58:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gywbURwpf25k; Tue, 21 Dec 2021 21:58:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 523E740605;
	Tue, 21 Dec 2021 21:58:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3E741BF40B
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 21:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F56B40605
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 21:58:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cm8NhDVSNmBE for <buildroot@lists.busybox.net>;
 Tue, 21 Dec 2021 21:58:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D9B840124
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 21:58:32 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id m21so1879374edc.0
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 13:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QTvR60rr1d7wJr8pu55v1kaJtaMEMUKwZOC20YI5L1s=;
 b=O7qc0tgt/gdtKuslY4m9p5jTtZ4j3e6WFc+zCkbeklFFIKl/i9nh1nLe0zhFVgg2Pm
 tUj+2LYOWZTI52CWzG3OaAEdV8dH6FuPQcLXR2ivF13yL7wZazhxq3m450ojGHyewAZT
 bM82Nimp6DOF3c+0+yXN7ZuGWXi+HkAxA61FCHYtZesUGzg6Xj3+7skVjpPKhBLfKvRW
 OdbqBguVTmvswG8Fh89EWRc0GkqpUSmYOViuYw0uY6c4H/F4vLaL2CviPALLcZVmvpY0
 asL/slNwZqK2JEdMHr+4z8Qva7hRTlLN+YMO5JQLW6E8AnHE7eDKlUhJKEYXlaYicw/c
 W5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QTvR60rr1d7wJr8pu55v1kaJtaMEMUKwZOC20YI5L1s=;
 b=fgl0orsCT51FUBhQ+u7gFFiayYWFnhXQ6VE/qGSFkicLMz1JuaTfF/EIKegjqo3Q8a
 nuD8yk8AxXzpTu36I+6oA8/E0EC/BUjo1ZBNxJdFka75zX+h1UQ1EwIgeKm8rJHaflj6
 8q6BSARgv57UsLPIXhyrno9X1XE4BzPoVLnxkqqkFCOpFcoJZu6hVOz15syWNVB0Wvpq
 lvzAxK64o/GlbIFabk/NytWMG13CActldk29tbFW9FRtMXm337DNCBMHI4r8GBkA99hV
 jGk+0axtKe6BMU2JHu87lTqpSZ72dC1CPnBau5wF+7CN2K/G0DHScHeb95lVKBqX0VxL
 oTXg==
X-Gm-Message-State: AOAM530LXJcp7330/m2UyM5x6ClLUwcSX13R1BcTWmICjPpl3jU2xoHU
 T558mqhPqgwqoMPiVdWRyeUZ2g==
X-Google-Smtp-Source: ABdhPJwSg2r00OIgZWpvJTe3Iq/B/biBEPACFQVmygH8bnTQz6gc6g/aY1rHA78LAAm3w01P+gFfmA==
X-Received: by 2002:a05:6402:42d5:: with SMTP id
 i21mr235191edc.27.1640123910551; 
 Tue, 21 Dec 2021 13:58:30 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id hq29sm36145ejc.141.2021.12.21.13.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 13:58:30 -0800 (PST)
Message-ID: <4646c759-075f-e103-c690-6a6a576b8887@mind.be>
Date: Tue, 21 Dec 2021 22:58:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Francis Laniel <flaniel@linux.microsoft.com>, buildroot@buildroot.org
References: <20211221145428.43829-1-flaniel@linux.microsoft.com>
 <20211221145428.43829-3-flaniel@linux.microsoft.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211221145428.43829-3-flaniel@linux.microsoft.com>
Subject: Re: [Buildroot] [RFC PATCH v1 2/2] linux: Add host-pahole as linux
 dependencies if selected by user.
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/12/2021 15:54, Francis Laniel wrote:
> If user set BR2_PACKAGE_HOST_PAHOLE, we add host-pahole to linux dependencies in
> case the user also wants to compile the kernel with CONFIG_DEBUG_BTF_INFO which
> relies on pahole to generate BTF information used by CO-RE BPF tools.
> 
> Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> ---
>   linux/linux.mk                | 6 ++++++
>   package/pahole/Config.in.host | 2 ++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 61fdc0c76c..057d898c86 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -120,6 +120,12 @@ ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS),y)
>   LINUX_DEPENDENCIES += host-uboot-tools
>   endif
>   
> +# If host-pahole is selected by the user, assume it is needed to create a custom
> +# kernel with CONFIG_DEBUG_INFO_BTF.
> +ifeq ($(BR2_PACKAGE_HOST_PAHOLE),y)
> +LINUX_DEPENDENCIES += host-pahole
  This is not a super user-friendly way to do it, but it's hard to do better.

  One way would be to make an explicit Config.in option for it (similar to 
openssl). Or an option that also sets CONFIG_DEBUG_INFO_BTF. But I think that 
adds too much complexity to Buildroot for relatively little gain.

  Perhaps a better improvement would be to add a check if the config option is 
set and print a warning if not.

else
define LINUX_FIXUP_CONFIG_PAHOLE_CHECK
	if grep -q "^CONFIG_DEBUG_INFO_BTF=y" $(KCONFIG_DOT_CONFIG); then \
		echo "To use CONFIG_DEBUG_INFO_BTF, enable host-pahole 
(BR2_PACKAGE_HOST_PAHOLE)" 1>&2; \
		return 1; \
	fi
endef

(and add LINUX_FIXUP_CONFIG_PAHOLE_CHECK to the end of LINUX_KCONFIG_FIXUP_CMDS).

  It's still pretty clunky though, so maybe not that much of an improvement...

  Anyway, I'd merge this patch without that change (but no time today).

  Regards,
  Arnout

> +endif
> +
>   ifneq ($(ARCH_XTENSA_OVERLAY_FILE),)
>   define LINUX_XTENSA_OVERLAY_EXTRACT
>   	$(call arch-xtensa-overlay-extract,$(@D),linux)
> diff --git a/package/pahole/Config.in.host b/package/pahole/Config.in.host
> index e427629632..521874961b 100644
> --- a/package/pahole/Config.in.host
> +++ b/package/pahole/Config.in.host
> @@ -3,4 +3,6 @@ config BR2_PACKAGE_HOST_PAHOLE
>   	help
>   	  Pahole and other DWARF utils.
>   
> +	  Select this if you want to build a kernel with CONFIG_DEBUG_INFO_BTF set.
> +
>   	  https://git.kernel.org/pub/scm/devel/pahole/pahole.git
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
