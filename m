Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C14C433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 21:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6527760FAF;
	Mon, 21 Mar 2022 21:17:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id knf9G3Dg10Pr; Mon, 21 Mar 2022 21:17:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5913360FB2;
	Mon, 21 Mar 2022 21:17:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3365D1BF239
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 300AB41529
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:17:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hLyjdiIh_OjI for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 21:17:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C35C41515
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 21:17:17 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id yy13so32465087ejb.2
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 14:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=LkmIStAiCqjYUMmghgVpru/7eGS4aVfNdxbvJmrlUv4=;
 b=F7lOSvJB+OEfVWUWg3L8TYFBqBAsoFHuTyCG4aMO+bwsDBjqQlp3kkKTVSLc4uSUHi
 s1dKoyVPmzPEMXZVLlbIvqaVxM3BfOV/oEEodKorbL+06egXtUdJ+wsWqNhwgJ/6S32c
 HFVguI/l4IYdVFJ24rJS3h/WR5SO5Osyf4FOxbplHi/mB2rmxWe09fnHTPe1B2SwQWeN
 LvgFF1Yo8ps5zBcVVczuvf9X1DmzGBobmLVUtgpFMeujR2BgQcmcdLztNZX641AA7eJw
 KZAsYgH9HoqJe9yJ8T6wQfP8OJQrIBGf8TaWz5KUfEzYQ1DtnK/CU70XtsT8ZBBD5/kb
 sPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LkmIStAiCqjYUMmghgVpru/7eGS4aVfNdxbvJmrlUv4=;
 b=gUbm6kvmA6pFTW6PaRXLvpzIqN041+bN4xZWAWSipqT1ENfT6QclaZ79zR/wJu8jKK
 tij78Ok0l18atvU8oCCHCrliPGI2ySuzkQiwpQiRJ2xFKf2Gby69uMlDwjvTfxaPv0VG
 wvLneqSNm1YfWvXm+fu5kFMZ/g9ZkeupB31yMCKBf5h1+qfgkbfGHrPtyFtUiHsaqaHR
 kJjGXXFbFGSHTBg/pCHSvIsVWnyhuJQKE9U5cPet+qCy7iKmve1jqgD35YiXY91n64kc
 U83ZIalQdMngb3MJJj0lU9vd1dd4SnpDlOIbn+JuJvOIxpil+8AOLjiz6OGwu0Gt3bZx
 X/0w==
X-Gm-Message-State: AOAM532Xj1HC7OnJ+WcXGL3ITDcDuxGLGI1MQV0Lm7KtKPdW+5yu9Odx
 4DNqHQxU2agBCzeG1RJWOEtiKQ==
X-Google-Smtp-Source: ABdhPJx8lP1dCHGreLgfUKotbTg6xKbdSkfBMWCsn3TtrXtH5pfpJ8+4DMhviZl3rcVk92o3YfoiQg==
X-Received: by 2002:a17:907:1dc8:b0:6df:f5fc:f4f9 with SMTP id
 og8-20020a1709071dc800b006dff5fcf4f9mr9319011ejc.739.1647897435838; 
 Mon, 21 Mar 2022 14:17:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 qa44-20020a17090786ac00b006dbcd7c9656sm7334374ejc.172.2022.03.21.14.17.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 14:17:15 -0700 (PDT)
Message-ID: <42a78132-a0d1-b735-db43-10f23dc6407b@mind.be>
Date: Mon, 21 Mar 2022 22:17:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220313090209.161433-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220313090209.161433-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libnetfilter_conntrack: fix
 musl build with headers >= 5.15
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



On 13/03/2022 10:02, Fabrice Fontaine wrote:
> Fix the following build failure with musl and headers >= 5.15 raised
> since bump to version 1.0.9 in commit
> 9af9dfa543907c46091c706b0f3a0eb89445ae74:
> 
> In file included from /home/buildroot/autobuild/instance-3/output-1/host/arm-buildroot-linux-musleabihf/sysroot/usr/include/arpa/inet.h:9,
>                   from ../../include/internal/internal.h:14,
>                   from proto.c:2:
> /home/buildroot/autobuild/instance-3/output-1/host/arm-buildroot-linux-musleabihf/sysroot/usr/include/netinet/in.h:23:8: error: redefinition of 'struct in6_addr'
>     23 | struct in6_addr {
>        |        ^~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/19931aba8bee8867a53130ca4a53cfadbc4c5bfd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-fix-build-with-kernel-5-15-and-musl.patch | 60 +++++++++++++++++++
>   1 file changed, 60 insertions(+)
>   create mode 100644 package/libnetfilter_conntrack/0001-conntrack-fix-build-with-kernel-5-15-and-musl.patch
> 
> diff --git a/package/libnetfilter_conntrack/0001-conntrack-fix-build-with-kernel-5-15-and-musl.patch b/package/libnetfilter_conntrack/0001-conntrack-fix-build-with-kernel-5-15-and-musl.patch
> new file mode 100644
> index 0000000000..9e96594120
> --- /dev/null
> +++ b/package/libnetfilter_conntrack/0001-conntrack-fix-build-with-kernel-5-15-and-musl.patch
> @@ -0,0 +1,60 @@
> +From 21ee35dde73aec5eba35290587d479218c6dd824 Mon Sep 17 00:00:00 2001
> +From: Robert Marko <robimarko@gmail.com>
> +Date: Thu, 24 Feb 2022 15:01:11 +0100
> +Subject: conntrack: fix build with kernel 5.15 and musl
> +
> +Currently, with kernel 5.15 headers and musl building is failing with
> +redefinition errors due to a conflict between the kernel and musl headers.
> +
> +Musl is able to suppres the conflicting kernel header definitions if they
> +are included after the standard libc ones, however since ICMP definitions
> +were moved into a separate internal header to avoid duplication this has
> +stopped working and is breaking the builds.
> +
> +It seems that the issue is that <netinet/in.h> which contains the UAPI
> +suppression defines is included in the internal.h header and not in the
> +proto.h which actually includes the kernel ICMP headers and thus UAPI
> +supression defines are not present.
> +
> +Solve this by moving the <netinet/in.h> include before the ICMP kernel
> +includes in the proto.h
> +
> +Fixes: bc1cb4b11403 ("conntrack: Move icmp request>reply type mapping to common file")
> +Signed-off-by: Robert Marko <robimarko@gmail.com>
> +Signed-off-by: Florian Westphal <fw@strlen.de>
> +
> +[Retrieved from:
> +https://git.netfilter.org/libnetfilter_conntrack/commit/?id=21ee35dde73aec5eba35290587d479218c6dd824]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + include/internal/internal.h | 1 -
> + include/internal/proto.h    | 1 +
> + 2 files changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/include/internal/internal.h b/include/internal/internal.h
> +index 2ef8a90..7cd7c44 100644
> +--- a/include/internal/internal.h
> ++++ b/include/internal/internal.h
> +@@ -14,7 +14,6 @@
> + #include <arpa/inet.h>
> + #include <time.h>
> + #include <errno.h>
> +-#include <netinet/in.h>
> +
> + #include <libnfnetlink/libnfnetlink.h>
> + #include <libnetfilter_conntrack/libnetfilter_conntrack.h>
> +diff --git a/include/internal/proto.h b/include/internal/proto.h
> +index 40e7bfe..60a5f4e 100644
> +--- a/include/internal/proto.h
> ++++ b/include/internal/proto.h
> +@@ -2,6 +2,7 @@
> + #define _NFCT_PROTO_H_
> +
> + #include <stdint.h>
> ++#include <netinet/in.h>
> + #include <linux/icmp.h>
> + #include <linux/icmpv6.h>
> +
> +--
> +cgit v1.2.3
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
