Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5F1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0ECBB40283;
	Sun, 12 Dec 2021 12:16:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7lQojqFI5V_n; Sun, 12 Dec 2021 12:16:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5241540537;
	Sun, 12 Dec 2021 12:16:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B76AE1BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A324740285
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:16:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ljaRKm_U-bhX for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:16:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4615D40283
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:16:52 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id e3so44396770edu.4
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 04:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mfH5dc0g/ozGS9mSSiY31cdCI5IYYnXPG5vNrzondhE=;
 b=FWscBfvP0Tp6Cmrjkv5yxjbFyy6hE3ehGJrZ8AGXnRt1vqk66pA1ouswDXgTW+qeEz
 nk85tcbO2KwlRuboFCLZ9Mo1Yewe+YIS4KAwVGPlYF723usNcGHlRuYuoZP3ds/L3aqr
 OpcdMmM7zLjZsZj9XUxUd0MBr+alvIZ6YBswIOgGIGJmdSrWRBNpGcHNjn8x6ssI/NC+
 Gqbkv28sIfdCItj9wJxiQ3r3bpO4W92rtZJpw+kw7fKOMLsID1oG5j6lC4RiCGnVF3ei
 9xKtP+EfqKag+iFe7UfNV8Ay1NzAhYHDeiTPmS930MRvRte42F4b7HoBH0VfkjPrx1rF
 XAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mfH5dc0g/ozGS9mSSiY31cdCI5IYYnXPG5vNrzondhE=;
 b=pc5FurVIoFCSbmI3Gyapj7VLaDUfe9CsOrUZYDv0u9fc5SF2t8LnFMSIZiUMRTQFhZ
 WyErNhe9YDKbVP3QZdApzgzTDfXTBmtWG51emQLH9HJDCNg3K+nZSPZWuWmxu6Tpp4Iu
 5aQVShJDzW1N36LGWGtG1jj0TCkhChGfRl7Ra6dQjggit5+rmGPAm1NSCE6DHoL+fa5m
 5t4UPwAJ5yqb5DPjGqllZd8u7X8PocNezJYENJFcRFJJIwLk3BCHujUnHHh8mFAx4zlg
 mXVnzbUCHMUKgmT2vkA5PFWbhY/t8WlCqkWn2Y3N+8wY9sC25mriURcuaXqm9oGPSWRD
 KiHQ==
X-Gm-Message-State: AOAM5326ehhgv7HZwxdA9rrLxGKsAiuPaOHDUCk3VeEsVJEXo3nttHO3
 9oY03TCXbFToDlYNaBZ2TFBp1w==
X-Google-Smtp-Source: ABdhPJw1ixuxmsLmiShJlxNx5NG4NGJz+YMTFXR6e9fAUOdelmA4m9ePym4eo1mj/lIKYKrUuGfQKQ==
X-Received: by 2002:a05:6402:5246:: with SMTP id
 t6mr53525062edd.18.1639311410460; 
 Sun, 12 Dec 2021 04:16:50 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z1sm4603026edq.54.2021.12.12.04.16.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 04:16:50 -0800 (PST)
Message-ID: <b0ff2447-22f3-8b9f-44b0-9edaaf769975@mind.be>
Date: Sun, 12 Dec 2021 13:16:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211207171237.2857189-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211207171237.2857189-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libyang: needs __sync_*_4
 intrinsics
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Vadim Kochan <vadim4j@gmail.com>,
 =?UTF-8?Q?Jan_Kundr=c3=a1t?= <jan.kundrat@cesnet.cz>,
 Joris Lijssens <joris.lijssens@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/12/2021 18:12, Fabrice Fontaine wrote:
> libyang needs __sync_*_4 intrinsics since bump to version 2.0.112 in
> commit 2a3edc5e00b38f4f927894d0911990c9060e4415 and
> https://github.com/CESNET/libyang/commit/080064b7906aecd7454e58e1c34c1c2198809e4e:
> 
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: ../../libyang.so.2.13.7: undefined reference to `__sync_fetch_and_sub_4'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/c1f090bde4891ac1cc84e59c51ff9561869d42b9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/frr/Config.in         | 2 +-
>   package/libnetconf2/Config.in | 2 ++
>   package/libyang/Config.in     | 2 ++
>   package/netopeer2/Config.in   | 2 ++
>   package/sysrepo/Config.in     | 2 ++
>   5 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/package/frr/Config.in b/package/frr/Config.in
> index 911913292f..877b75b107 100644
> --- a/package/frr/Config.in
> +++ b/package/frr/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_FRR
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	depends on !BR2_STATIC_LIBS # libyang
>   	depends on BR2_USE_MMU # fork()
> -	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c, libyang
>   	select BR2_PACKAGE_BASH
>   	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
>   	select BR2_PACKAGE_C_ARES
> diff --git a/package/libnetconf2/Config.in b/package/libnetconf2/Config.in
> index 0a735b5ed6..7865f9e487 100644
> --- a/package/libnetconf2/Config.in
> +++ b/package/libnetconf2/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_LIBNETCONF2
>   	bool "libnetconf2"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libyang
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	depends on !BR2_STATIC_LIBS
>   	depends on BR2_USE_MMU
> @@ -12,4 +13,5 @@ config BR2_PACKAGE_LIBNETCONF2
>   
>   comment "libnetconf2 needs a toolchain w/ threads, dynamic libraray"
>   	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>   	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/libyang/Config.in b/package/libyang/Config.in
> index 54df061b58..d08f8fd42f 100644
> --- a/package/libyang/Config.in
> +++ b/package/libyang/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_LIBYANG
>   	bool "libyang"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_*_4 intrinsics
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	depends on !BR2_STATIC_LIBS
>   	select BR2_PACKAGE_PCRE2
> @@ -10,4 +11,5 @@ config BR2_PACKAGE_LIBYANG
>   	  https://github.com/CESNET/libyang
>   
>   comment "libyang needs a toolchain w/ threads, dynamic library"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>   	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> diff --git a/package/netopeer2/Config.in b/package/netopeer2/Config.in
> index 763b1f234b..db31a786a1 100644
> --- a/package/netopeer2/Config.in
> +++ b/package/netopeer2/Config.in
> @@ -1,11 +1,13 @@
>   comment "netopeer2 needs a toolchain w/ gcc >= 4.8, C++, threads, dynamic library"
>   	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>   	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
>   		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>   
>   config BR2_PACKAGE_NETOPEER2
>   	bool "netopeer2"
>   	depends on BR2_USE_MMU # libnetconf2, libssh, sysrepo
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libyang
>   	depends on !BR2_STATIC_LIBS # libnetconf2, libssh, libyang, sysrepo
>   	depends on BR2_INSTALL_LIBSTDCPP # sysrepo
>   	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> diff --git a/package/sysrepo/Config.in b/package/sysrepo/Config.in
> index 52df1bc4c3..b1535bed9f 100644
> --- a/package/sysrepo/Config.in
> +++ b/package/sysrepo/Config.in
> @@ -1,6 +1,7 @@
>   config BR2_PACKAGE_SYSREPO
>   	bool "sysrepo"
>   	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libyang
>   	depends on !BR2_STATIC_LIBS
>   	depends on BR2_INSTALL_LIBSTDCPP
>   	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> @@ -24,5 +25,6 @@ endif
>   
>   comment "sysrepo needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 4.8"
>   	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>   	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
>   		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
