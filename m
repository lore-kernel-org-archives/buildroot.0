Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79735C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF64D4020B;
	Sun, 27 Mar 2022 15:35:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rCtNbq6KNu3D; Sun, 27 Mar 2022 15:35:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 911F240104;
	Sun, 27 Mar 2022 15:35:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FBFD1BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEF636068D
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QLRPE0sctN2c for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:35:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CACAA605E3
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:35:24 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id b24so14319880edu.10
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 08:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=2c2FAoaJkghgruBuZwMB95gwEX4JsinnlOMrL/u3UUA=;
 b=ECZabnr8f7aEu8oDe8BaOy6nLVnzDksp1e6boKmIAqX3asjMTwjlVaz8DWnGux+jSC
 crFVsoIV/BPoYmx1p+68IjPlQcmhWamqi/0HpCiY2sENcjIKC6PgwMGXEX+5mAMk5nlG
 Uct2P0jtlU/KwOvJ9bWWu2P8DjmsDXvKTxINWYnJ4jhxKQKMHKi02O68kstrX3uwXRRN
 wLIVD8Aq6JwjAeX3fWv1N6sUrMvHS1C72H9FcUNXug/N0/4qOnWu9RpEYM3Ch+D9oFWb
 EULvTYubDwWyiFWVd2OVAEw8kGSx8U9IR2ybedAiSsva8gRtUfVu701S2P1DnV3WiBa2
 s6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2c2FAoaJkghgruBuZwMB95gwEX4JsinnlOMrL/u3UUA=;
 b=zCFq50WLifQttQ+4VpJhwD8J+V3/SWgVwPr0Q9wEq8ekoNP+e016MN1j5wMAHGXKDG
 x2gUjJOWT4EzA2hvrl4/1B1iPMZRDTUTpMFOq2PogBuJX5hfL1+LtppGlea0vQzThqoh
 cQa5TdC8EkMtDe9POiiZ+75c9fIgCOpfQ43rW4r82o30+WkYgag+M3fd+kXY1ZatcHZv
 IHH8Uao52qahSBBulDsW1nH54MLS+gjzl+kN2+eRs0Uc+hmpVuJOXHeiq1wY8YRIQYoc
 HKsJvUvaFWHdHGPRdyBWr2d5HLbEdCIPxz2GZvgzyLWkQLk4lIbP6rtj03216PBSA/Qz
 i/ng==
X-Gm-Message-State: AOAM532C7wzPQDmyHJu5gFJCIgdb9jf/iUerZut2tmq9K0b+fzwGQA5B
 BcIRZ35AW1tkH1nod/e2CBxvpA==
X-Google-Smtp-Source: ABdhPJyhYFjhx082HpSAEXLeusifi/xZeqMX8vbiLQ7IuCfnr9NY+Fs1wxTaqDtmazoqk0/0ENl/lQ==
X-Received: by 2002:a05:6402:5202:b0:419:2b9f:7dd3 with SMTP id
 s2-20020a056402520200b004192b9f7dd3mr10895044edd.224.1648395322977; 
 Sun, 27 Mar 2022 08:35:22 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a056402274600b004194fc1b7casm5945085edd.48.2022.03.27.08.35.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 08:35:22 -0700 (PDT)
Message-ID: <d14b6b23-3ca4-0ab9-a6f7-6dd59c3a8cdc@mind.be>
Date: Sun, 27 Mar 2022 17:35:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220317190027.183976-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220317190027.183976-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libgee: needs gcc >= 4.9
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



On 17/03/2022 20:00, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump to version 0.20.5
> in commit 10780e8d6df83d7a92b6dd3282e91fdc0ba369af and
> https://gitlab.gnome.org/GNOME/libgee/-/commit/f0ccfe94ff731929e93601a38f931a12d52e5c2e:
> 
> task.c:59:1: error: initializer element is not constant
>   static GOnce gee_task_data_async_pool = (GOnce) G_ONCE_INIT;
>   ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/8354ea4192bcf2eb9c3be74d93b640db52ced10a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/granite/Config.in | 6 ++++--
>   package/libgee/Config.in  | 6 ++++--
>   2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/package/granite/Config.in b/package/granite/Config.in
> index 726bde1b2d..9519e16d45 100644
> --- a/package/granite/Config.in
> +++ b/package/granite/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_GRANITE
>   	depends on BR2_USE_WCHAR
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgee
>   	depends on BR2_PACKAGE_LIBGTK3
>   	select BR2_PACKAGE_LIBGEE
>   	select BR2_PACKAGE_LIBGLIB2
> @@ -12,7 +13,8 @@ config BR2_PACKAGE_GRANITE
>   
>   	  https://github.com/elementary/granite
>   
> -comment "granite needs libgtk3 and a toolchain w/ wchar, threads"
> +comment "granite needs libgtk3 and a toolchain w/ wchar, threads, gcc >= 4.9"
>   	depends on BR2_USE_MMU
>   	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_USE_WCHAR \
> -		|| !BR2_TOOLCHAIN_HAS_THREADS
> +		|| !BR2_TOOLCHAIN_HAS_THREADS \
> +		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> diff --git a/package/libgee/Config.in b/package/libgee/Config.in
> index 07c387c985..cb33ec9ec2 100644
> --- a/package/libgee/Config.in
> +++ b/package/libgee/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBGEE
>   	depends on BR2_USE_WCHAR
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>   	select BR2_PACKAGE_LIBGLIB2
>   	help
>   	  Libgee is an utility library providing GObject-based
> @@ -10,6 +11,7 @@ config BR2_PACKAGE_LIBGEE
>   
>   	  https://wiki.gnome.org/Projects/Libgee
>   
> -comment "libgee needs a toolchain w/ wchar, threads"
> +comment "libgee needs a toolchain w/ wchar, threads, gcc >= 4.9"
>   	depends on BR2_USE_MMU
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
