Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB0DC433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA3E683332;
	Tue,  1 Feb 2022 22:04:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x8Y_d-OATY2F; Tue,  1 Feb 2022 22:04:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7D9C82F49;
	Tue,  1 Feb 2022 22:04:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 91B051BF3BE
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8088260B3A
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:04:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VchBoNqfc4MQ for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:04:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90A4360D54
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:04:55 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id j23so37334970edp.5
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 14:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=jmYhtpDPFeqY4Exs54nJAf68FfERyuVzi6QfuzDHvM8=;
 b=Hi3uvWa0sCgZBhB8a2w/qCUfa9arrtGbrdH5fshs/zWsBXn6F/JHY9M77LBHCXkjJr
 /BaeVBECbcj31unyLuNeo+OOzxAVdZvpiikQgpP8KxnTaq39N1EIvPjccERVW9CEU5/1
 5SvR0NCwpDE6MdRe7YSjPBimjjpMqlLpAE0MUGK7736mK60zVXmGoWIVGR8OGB7ewwVK
 1ulbiGwrzfhM4VkdjHXFjVCB2p4wbPdRGY22Lm8tzkIyFNoiibXTmL7N3dfK5gH+qro5
 7aErqX8IMSr5Jo+s5lUSlk6xT+RoDMalup+VN0YSl7RWsp/9fBsgZx9JCoGgbDJwYAqo
 mc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jmYhtpDPFeqY4Exs54nJAf68FfERyuVzi6QfuzDHvM8=;
 b=YKRWqyDpVTT/EES2E4KCK32DMAdvE8ZQrn0vf59J4V/LneoiBW0/hM6N5vUKLe6ICk
 vOs1kzOcg+LnDH7SvH9MHEYXiDiwmk27g0RhRWqX8VwpkXI7LI1trUpRVrxI23b8GPXs
 NTEqed9stadFyC9a6DIxRMUdKN+HgBVOfKzS1cH915DIKDbH6yPdzr1hxCaIz4Uw6CYI
 UZYn4jeAJPo3dMW/PmtP5QpROBANuz4JDYM3IcRwD/ZQV7diqOOEDWtspiN07togmFPE
 kf8CGX1MspYMOuMhMcBMRSJBNTnEtTXkwEIhL7jBEAn87HA/b3MOscwXJtm15lD2AW6j
 hieQ==
X-Gm-Message-State: AOAM5314KZ2Ql44OpA+aob0KDmH3DQQT0pB5eg6xhLTypVpr+hq2coVE
 G95kFXdiYbmI6sCB606KQISnng==
X-Google-Smtp-Source: ABdhPJw89Fnrp7j1o8L/4U/7wC9wKm1oDRfxMo+K9tX8LUrq3zX+f3ymQmiCEZOG+DMucMEDCnOMGw==
X-Received: by 2002:aa7:cd0b:: with SMTP id b11mr27075366edw.412.1643753093894; 
 Tue, 01 Feb 2022 14:04:53 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m12sm5391381ejr.218.2022.02.01.14.04.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 14:04:53 -0800 (PST)
Message-ID: <8e7905ab-b882-a363-8fd3-d5e8c2d7b00b@mind.be>
Date: Tue, 1 Feb 2022 23:04:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220131230015.181368-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220131230015.181368-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: fix musl build
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



On 01/02/2022 00:00, Fabrice Fontaine wrote:
> Fix the following musl build failure raised since bump to version 5.16.0
> in commit 8f54d6d7859c0eabf303a44b26e6fafb1cb50143:
> 
> ax25_ntop.c:5:10: fatal error: netax25/ax25.h: No such file or directory
>      5 | #include <netax25/ax25.h>
>        |          ^~~~~~~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/455840288bbe13ed585b0e2dc7b20a294dd1eee1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...0001-lib-fix-ax25-h-include-for-musl.patch | 37 +++++++++++++++++++
>   1 file changed, 37 insertions(+)
>   create mode 100644 package/iproute2/0001-lib-fix-ax25-h-include-for-musl.patch
> 
> diff --git a/package/iproute2/0001-lib-fix-ax25-h-include-for-musl.patch b/package/iproute2/0001-lib-fix-ax25-h-include-for-musl.patch
> new file mode 100644
> index 0000000000..1f8860c5d8
> --- /dev/null
> +++ b/package/iproute2/0001-lib-fix-ax25-h-include-for-musl.patch
> @@ -0,0 +1,37 @@
> +From 8bced38a941a181f1468fa39541e872e51b6022f Mon Sep 17 00:00:00 2001
> +From: Sam James <sam@gentoo.org>
> +Date: Thu, 13 Jan 2022 08:14:13 +0000
> +Subject: [PATCH] lib: fix ax25.h include for musl
> +
> +ax25.h isn't guaranteed to be avilable in netax25/*;
> +it's dependent on our choice of libc (it's not available
> +on musl at least) [0].
> +
> +Let's use the version from linux-headers.
> +
> +[0] https://sourceware.org/glibc/wiki/Synchronizing_Headers
> +Bug: https://bugs.gentoo.org/831102
> +
> +Signed-off-by: Sam James <sam@gentoo.org>
> +Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
> +
> +[Retrieved from:
> +https://github.com/shemminger/iproute2/commit/8bced38a941a181f1468fa39541e872e51b6022f]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + lib/ax25_ntop.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/ax25_ntop.c b/lib/ax25_ntop.c
> +index cfd0e04b0..3a72a43e9 100644
> +--- a/lib/ax25_ntop.c
> ++++ b/lib/ax25_ntop.c
> +@@ -2,7 +2,7 @@
> +
> + #include <errno.h>
> + #include <sys/socket.h>
> +-#include <netax25/ax25.h>
> ++#include <linux/ax25.h>
> +
> + #include "utils.h"
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
