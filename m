Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A2EC433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 21:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94ADE60C20;
	Tue,  1 Feb 2022 21:55:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gylbKAfepq-7; Tue,  1 Feb 2022 21:55:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE33360767;
	Tue,  1 Feb 2022 21:54:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 845FD1BF424
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 21:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D72C60767
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 21:54:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IDWxj3ukT68F for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 21:54:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F2E3606E7
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 21:54:57 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id j2so57772292ejk.6
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 13:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PiSDQyptjYFK0m6HzPV/p6EmXy5HCCMWMdSHK/v5d+E=;
 b=PyZGZlgg/pgBt7/62JuRnNDVdrFfbiObG5vXPos8oct7wrGftzblBEQOO3IMh20iOI
 D+zZah7CtnxFbZKaqZNnk5ELwMy3Oawpe5QLH3TOEkZy1SXnWcwT3FTry9abBb5Tay+T
 PLWj93OG5Nij/TQZjq4hWEqfvBeWVBA86EqVYYIAQNz1QY8F2mRh0HjEBA8lB/1RPEx1
 aqDUJtqhKBZ74aC6mmQtFZ010AhxYS5Buam+CFIpYl+TkxEZ5tQUgTijj1+nF9CuNi3T
 tmKgoE6UD5uN3znW2aRbVEkqxzavEEe5Iv5U68XvyrsbCEXJkm0jscJKmAkhO/GbJIo6
 KDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PiSDQyptjYFK0m6HzPV/p6EmXy5HCCMWMdSHK/v5d+E=;
 b=tVR35D3GEgfI1rjbCQaE97iJHOarlmuMeLYxdABqnKUSJq47gzdcPBmrJL4LbK4JNV
 /RUNujeNiALgEsngvzZavd7ouFm7DnRmpYO5Ys23YeGNfb0fsXuqpObGO/kQFpSdfewr
 bWgBGqVnHBBeLDOQ+cq63Cb5OlApKcnB+itZ5L3u0yZxHTcdOOGewgy6Ze7Vqvk8/VC3
 5+YTPaN1CR9cVT3OnCYD3ZZDknIFUnY5Rv2+blcHEs5jOVYpx5wgujj56PHMFl3myd/T
 iW4/86nrDOMYGfqEkQiZC4YGuBINW7uETqntYYqy1qyIjWYv437DynDSTac3sAYZDaX2
 MLVg==
X-Gm-Message-State: AOAM5328+WdIOIWdAwFhpFYtkZoSbuEsz0lquxqUL5K1McfIYuP2Su1J
 F7DsSPUW1W/YgkuX41xhHvZ32PqJJPWTOQ==
X-Google-Smtp-Source: ABdhPJz5+OJKJNTv7fF6+kPLTNpXHamUkJzbUgDUDY9l9dyPEneI2+YBPXVHMCPqirBKYvIpiZrA9w==
X-Received: by 2002:a17:906:bc97:: with SMTP id
 lv23mr23135438ejb.154.1643752495438; 
 Tue, 01 Feb 2022 13:54:55 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u19sm15274708ejy.171.2022.02.01.13.54.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 13:54:55 -0800 (PST)
Message-ID: <e5a05cd9-e70b-e111-3eda-0f0b35636f2b@mind.be>
Date: Tue, 1 Feb 2022 22:54:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220125210800.299916-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220125210800.299916-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/netopeer2: disable tests
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/01/2022 22:08, Fabrice Fontaine wrote:
> Disable tests which are enabled since bump to version 2.0.35 in commit
> 13d4856b916d797c3c771669edd3eb883336766f and
> https://github.com/CESNET/netopeer2/commit/466a0b3c268ee319b4f65980404715a2723b4c0a
> to avoid the following build failure if cmocka is built before
> netopeer2:
> 
> In file included from /home/buildroot/autobuild/instance-2/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/stdint.h:20,
>                   from /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/lib/gcc/riscv64-buildroot-linux-musl/10.3.0/include/stdint.h:9,
>                   from /home/buildroot/autobuild/instance-2/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/libyang/libyang.h:18,
>                   from /home/buildroot/autobuild/instance-2/output-1/build/netopeer2-2.0.35/tests/test_sub_ntf.c:27:
> /home/buildroot/autobuild/instance-2/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/bits/alltypes.h:53:24: error: conflicting types for 'uintptr_t'
>     53 | typedef unsigned _Addr uintptr_t;
>        |                        ^~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/0660a4f767d5cdaf07b28a508101b87f0300850f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/netopeer2/netopeer2.mk | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
> index c8b6763313..43f22b7e4c 100644
> --- a/package/netopeer2/netopeer2.mk
> +++ b/package/netopeer2/netopeer2.mk
> @@ -11,7 +11,9 @@ NETOPEER2_LICENSE = BSD-3-Clause
>   NETOPEER2_LICENSE_FILES = LICENSE
>   NETOPEER2_DEPENDENCIES = libnetconf2 libyang sysrepo host-sysrepo
>   
> -NETOPEER2_CONF_OPTS = -DBUILD_CLI=$(if $(BR2_PACKAGE_NETOPEER2_CLI),ON,OFF)
> +NETOPEER2_CONF_OPTS = \
> +	-DBUILD_CLI=$(if $(BR2_PACKAGE_NETOPEER2_CLI),ON,OFF) \
> +	-DENABLE_TESTS=OFF
>   
>   # Set a build specific SYSREPO_SHM_PREFIX to ensure we can safely delete the
>   # files. This also ensures that concurrent parallel builds will not be
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
