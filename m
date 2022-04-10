Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A832EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 14:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6224284077;
	Sun, 10 Apr 2022 14:46:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R4gzXQ0jvIwR; Sun, 10 Apr 2022 14:46:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 703E98401C;
	Sun, 10 Apr 2022 14:46:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D8E1A1BF3B5
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6644415E1
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CiQ2uSRFTxOw for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 14:46:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 946724157B
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 14:46:36 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id c64so3173706edf.11
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 07:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bc6irFdxu7v/wLSJCUDoegpspny9tBSJs7/qg56F658=;
 b=cet6BEuqL4FQCGpnc/ybo7ctuakp4c47s/uN9zF3sSvu7+Bds2wMzwlk0o2brNi1yy
 yvimDwG8L46CqAWLBjr61laQqUHhZNswEufXFvRuwULzPevChA+nXPoK5G//CnZ4A9Xp
 6zOy+Svqa+38r1hxWwRfeGpoAirEtM59wrVNamMR1fNATOvpUKq0JCAdGXKF+Lof2vpR
 32mHJ5qf6owBPsLhbFo+/nr9rigNL0UXr/RHw3OZaA3bP+lt0lAv2QK4AnFLDBJ3PIDS
 j0FB0wc4t0Np33UdiJxvmXhtulMirPgv6EYyYrZKgmAfsoTdZZVIUZ9gYSWKwu6M1sCJ
 5Suw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bc6irFdxu7v/wLSJCUDoegpspny9tBSJs7/qg56F658=;
 b=rXjpyDnoOTRU3H3hPMXXZn8bR1HXm3uXgN/YLgEm8o8PuvxTZmIraoOaDt3K9No4hr
 GaZd9s6uZXMEnzvwy8MmpfW3Kn5IhxXQPvuNs6T8ath/1F3jhqm8JlLQlMS/YTBnEJ8F
 UWNurhWf67C2luYaeYpUSGMhCEPqJ5teJVSGVH2/29tW9RyMh+UhAOcfKYN4gJfwH07V
 n5G4IpV71rAiu/XVU4SKjab/MPdbVoxPf+pTTWp+kequTVXuDiFU8a6E6pP1196PDlu0
 /cn1Z3fZCYQ1HxWmy3WolV6FzrQCwVy0wEkWG0LgMR7p7WICMHUHSd+fXrXOWo+TooRy
 pOIg==
X-Gm-Message-State: AOAM533j0VpBU0ROAFRRNzpLPPjO2VffBPFSNSbMm+TMBckhudvuNuSh
 fVdM9EB5EFp7N5b7vIFu3DEnqg==
X-Google-Smtp-Source: ABdhPJy7L7wPw+HGAJcnVEqJvXsZptAh5vhpWvfYQtModR5+m95ZzEiuL3JyzAyDknD0xEBxdKPtGw==
X-Received: by 2002:a50:9d47:0:b0:40f:9d3d:97b6 with SMTP id
 j7-20020a509d47000000b0040f9d3d97b6mr29039688edk.392.1649601994694; 
 Sun, 10 Apr 2022 07:46:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a1709063a0200b006e05b7ce3efsm10838872eje.107.2022.04.10.07.46.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 07:46:34 -0700 (PDT)
Message-ID: <633b44ef-123c-d0e0-51d4-ae3ab9af36b3@mind.be>
Date: Sun, 10 Apr 2022 16:46:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220404205015.341053-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220404205015.341053-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/trace-cmd: needs NPTL
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
Cc: Pierre Floury <pierre.floury@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/04/2022 22:50, Fabrice Fontaine wrote:
> trace-cmd needs NPTL since bump to version 2.9.1 in commit
> 0e1231a3c0719269ab3546defe4b1fb0f1f5d7d2 and
> https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/commit/?id=08b9d5076455c93c997376c8089ee12b9071785b:
> 
> /nvmedata/autobuild/instance-24/output-1/host/lib/gcc/i586-buildroot-linux-uclibc/10.3.0/../../../../i586-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-24/output-1/build/trace-cmd-2.9.7/lib/trace-cmd/libtracecmd.a(trace-timesync.o): in function `tracecmd_tsync_with_host':
> trace-timesync.c:(.text+0x12e1): undefined reference to `pthread_setaffinity_np'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/9a88aaf92760b34958ef5b1708de83e46ccdb587
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/trace-cmd/Config.in | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/trace-cmd/Config.in b/package/trace-cmd/Config.in
> index 574541c571..2d0accd7ae 100644
> --- a/package/trace-cmd/Config.in
> +++ b/package/trace-cmd/Config.in
> @@ -1,6 +1,7 @@
>   config BR2_PACKAGE_TRACE_CMD
>   	bool "trace-cmd"
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	# pthread_setaffinity_np
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>   	depends on BR2_USE_MMU # fork()
>   	depends on !BR2_STATIC_LIBS # dlopen()
>   	help
> @@ -13,6 +14,6 @@ config BR2_PACKAGE_TRACE_CMD
>   
>   	  http://git.kernel.org/cgit/linux/kernel/git/rostedt/trace-cmd.git
>   
> -comment "trace-cmd needs a toolchain w/ threads, dynamic library"
> +comment "trace-cmd needs a toolchain w/ NPTL, dynamic library"
>   	depends on BR2_USE_MMU
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
