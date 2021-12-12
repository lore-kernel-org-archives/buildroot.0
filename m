Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DA2C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E95561CE7;
	Sun, 12 Dec 2021 14:52:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gyceSHaY7bQq; Sun, 12 Dec 2021 14:52:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 997D561CD9;
	Sun, 12 Dec 2021 14:52:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FF751BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EAAF61CD9
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:52:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4kTWxsg9s_7d for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:52:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08E3860E7E
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:52:43 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id l25so44835002eda.11
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 06:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=zM2gxu690Gh2a/1tND17WqpHfFlGISc08og6zE719y8=;
 b=ZjCtw2PgLMH9Z/9kdPo0hvBgQT5uIowgw3EQE07Cy7VWPg3yZQFlPxSSabZHX6fN+w
 COrDNvKWSY7vL+JPBm8+FsXMSeq1INlt8uqTLnVyDZnQAg/i27tB19rXqaPYUG2Sw6t3
 wDFi/79k9gBIgX5bIWclbq42xpeD+KRx0rW04UgRqRcYyp8mZidg9xNdIU4WAXzZ2XU8
 3SdOf5R9MhMP+x4YtlbwftAXcx2Lol+vw5ccKKY4ihDWUzqcQCfZOxNDVliimhknpAj8
 PQPHtG/M0EYS54ZISKKtU92wVi5akL+CqezASupbWLQM8MzjOqKdDKCR1ayEw0dj69HM
 TWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zM2gxu690Gh2a/1tND17WqpHfFlGISc08og6zE719y8=;
 b=A7UkdRAbTALsfNM4mhnfLPzO3MtpUTitquF3NiKqcs4YLsbIzuvlaVlBwPzdACfLZ6
 LkVcqVNLVQdx8ZN0hPZVlgLmANwwpxn0cgbWTepfSJrpLPKj5L3vPNVOycfyOpoafC8j
 MAn6jS5gU0AgKp8B5XXL3AyGTerDgGWo/vt8HcMB3Ec1JBDgT58P6GQ8LmwAPWOXfGFy
 oezbhJnZUoFbftFvNWqsctOW/Bc0WQ9qvg05lSUQl2HHTjNBVn1NsIWS5ht0yitR3Jgk
 blFTtCAvp9dyKzlhzHVJkRaG6p6LwkJ5kbS6RHwr/OYvyN+va0msGJt5GigDNO7sMLaZ
 5GoQ==
X-Gm-Message-State: AOAM530HwzQ5CJNZxFUn3Bu4bOkLUOarUiOZ3I4Z46OHlqV8vBC/8/X3
 7G0I0A+Fctukk9jD8Ff/OjuYKX2KCuTFnw==
X-Google-Smtp-Source: ABdhPJzhBiSa4/H1vp5J48K5LtamwVCdkbefe9onMesORP05ALkshlfyqyDclpAMGknCwg/8Far7Iw==
X-Received: by 2002:a05:6402:26c8:: with SMTP id
 x8mr56357388edd.156.1639320762290; 
 Sun, 12 Dec 2021 06:52:42 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e19sm4787140edu.47.2021.12.12.06.52.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 06:52:42 -0800 (PST)
Message-ID: <d0f8d94b-f293-535b-f9f9-0bf2a9c9a1f5@mind.be>
Date: Sun, 12 Dec 2021 15:52:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211211211234.233209-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211211211234.233209-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/rp-pppoe: fix musl build
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



On 11/12/2021 22:12, Fabrice Fontaine wrote:
> Fix the following musl build failure raised since bump of pppd to
> version 2.4.9 in commit 075b01f2f7b5a9241b4bfe76db8f14af0284060c:
> 
> In file included from pppoe.h:133,
>                   from debug.c:19:
> /home/giuliobenetti/autobuild/run/instance-0/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/netinet/if_ether.h:116:8: error: redefinition of 'struct ethhdr'
>    116 | struct ethhdr {
>        |        ^~~~~~
> In file included from pppoe.h:121,
>                   from debug.c:19:
> /home/giuliobenetti/autobuild/run/instance-0/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/linux/if_ether.h:163:8: note: originally defined here
>    163 | struct ethhdr {
>        |        ^~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/ccca18fcbcde65cb6784f5559eac68ca17ab14a3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...src-pppoe.h-fix-build-with-musl-libc.patch | 60 +++++++++++++++++++
>   1 file changed, 60 insertions(+)
>   create mode 100644 package/rp-pppoe/0002-src-pppoe.h-fix-build-with-musl-libc.patch
> 
> diff --git a/package/rp-pppoe/0002-src-pppoe.h-fix-build-with-musl-libc.patch b/package/rp-pppoe/0002-src-pppoe.h-fix-build-with-musl-libc.patch
> new file mode 100644
> index 0000000000..29ba72be4f
> --- /dev/null
> +++ b/package/rp-pppoe/0002-src-pppoe.h-fix-build-with-musl-libc.patch
> @@ -0,0 +1,60 @@
> +From bbf5b2759cff0c65b47fd6dbe5fe7341f205ad03 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 11 Dec 2021 22:03:16 +0100
> +Subject: [PATCH] src/pppoe.h: fix build with musl libc
> +
> +musl libc defines its own struct ethhdr that conflicts with the kernel
> +define one. The kernel headers provide a way to suppress its struct
> +ethhdr. For that to work the libc headers must precede the kernel. Move
> +the kernel linux/if_ether.h include below libc netinet/if_ether.h. That
> +fixes the following build failure:
> +
> +In file included from pppoe.h:133,
> +                 from debug.c:19:
> +/home/giuliobenetti/autobuild/run/instance-0/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/netinet/if_ether.h:116:8: error: redefinition of 'struct ethhdr'
> +  116 | struct ethhdr {
> +      |        ^~~~~~
> +In file included from pppoe.h:121,
> +                 from debug.c:19:
> +/home/giuliobenetti/autobuild/run/instance-0/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/linux/if_ether.h:163:8: note: originally defined here
> +  163 | struct ethhdr {
> +      |        ^~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/ccca18fcbcde65cb6784f5559eac68ca17ab14a3
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/dfskoll/rp-pppoe/pull/4]
> +---
> + src/pppoe.h | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/pppoe.h b/src/pppoe.h
> +index 4780092..2b08111 100644
> +--- a/src/pppoe.h
> ++++ b/src/pppoe.h
> +@@ -117,10 +117,6 @@ typedef unsigned long UINT32_t;
> + #error Could not find a 32-bit integer type
> + #endif
> +
> +-#ifdef HAVE_LINUX_IF_ETHER_H
> +-#include <linux/if_ether.h>
> +-#endif
> +-
> + #include <netinet/in.h>
> +
> + #ifdef HAVE_NETINET_IF_ETHER_H
> +@@ -134,6 +130,10 @@ typedef unsigned long UINT32_t;
> + #endif
> + #endif
> +
> ++#ifdef HAVE_LINUX_IF_ETHER_H
> ++#include <linux/if_ether.h>
> ++#endif
> ++
> +
> +
> + /* Ethernet frame types according to RFC 2516 */
> +--
> +2.33.0
> +
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
