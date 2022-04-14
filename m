Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78894C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 19:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14B5183E35;
	Thu, 14 Apr 2022 19:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z63ylxE6vQLU; Thu, 14 Apr 2022 19:25:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 128A683E27;
	Thu, 14 Apr 2022 19:25:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 90FB81BF319
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D8614181E
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:25:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NJIGFo7Rp5zI for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 19:25:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21AC941812
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 19:25:47 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id r13so11902472ejd.5
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 12:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=vdE/WkAl1WY/r05/qF9Ru4VDSdRl1otAKoNK31xOc6I=;
 b=TLf9kqR+tSqxwrOlkvbb/6ipoNg3OwJ7tgCBEKBjYSHvTpjhPu7lZrVxcg+UlGKY9e
 zYK9/IjUarnthiOn2acPzIdlK78TCQgKG1ztIMSBTYGY5oHhv1HPa2otSb4SRtbgLSyk
 nvs9pBfow8th50P/YKyf0SuBzIQhTqDMNy58sIXC442z6o6ZPNiE0GT5ytpu9OSRJ/az
 kCrXIIffXik9JWVlcK+S2qd5Dbv9pm8kEeOAzGotDy3wCzAiHlTwVrVg2GcQI+DoR+jb
 Ua3EK+NW1aAewm3Qw/SAvRhjWBolCODZTKbtgi0xY61dJa0tVVRem1sNSrWxWdaCdHWL
 vK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vdE/WkAl1WY/r05/qF9Ru4VDSdRl1otAKoNK31xOc6I=;
 b=HoLR9n+0ffcsYSYvDmdIebDp//aw1V+g2QY12yPnA7KeKVnU4BUETf1gAf4PZUAqzq
 9rhBus4KjeoQ2AXewQcLSSIQo5W2CN1E/3dbTZb118vd4n/CbzvH324BtRrW2nbD2zyo
 KILDXNLaDXHKTWPXdyOh3bZ30oObUwWuOLnsCHojIslLUaiJJJAE9VBlZOtP0EnYsiAC
 lIMX42XDztqVvHTjPaVkKKWFlxY5KxLuRvj8QqCV/4z9n2wMvlWfxKWnRYcdXCaNT9zG
 jHPTOjis+SAC7oHbd8OraOIgvBB3AdMaMLlE38A37eVKnkP8v/dREbakKnDoUSDfRyvr
 He7g==
X-Gm-Message-State: AOAM530vvm9ogagC7zOqYsTg3RXX3dGIyO61YsXL+csxRijueixGP+/2
 Ia6k642Vd0Qd+KJ79LsSBaRhxQ==
X-Google-Smtp-Source: ABdhPJwFNEjdj7rnqf6jYXco6KLZXYlA6vCVJm2tolCVwn0wOsHa1cVxJqLYdjJPN4B1qHuByO4lwg==
X-Received: by 2002:a17:907:33cc:b0:6e8:81ca:f9e8 with SMTP id
 zk12-20020a17090733cc00b006e881caf9e8mr3557266ejb.51.1649964346288; 
 Thu, 14 Apr 2022 12:25:46 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a1709066d8800b006e09a49a713sm944335ejt.159.2022.04.14.12.25.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 12:25:45 -0700 (PDT)
Message-ID: <510681be-e5b9-1491-005a-75103d438152@mind.be>
Date: Thu, 14 Apr 2022 21:25:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220406163729.4007517-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220406163729.4007517-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux: fix build on kernel
 < 4.11
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



On 06/04/2022 18:37, Fabrice Fontaine wrote:
> lsns unconditionally uses NS_GET_NSTYPE since version 2.38 and
> https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=de72df79d72fa906e71e2ac922d8745ff22deee5
> which is only available since kernel 4.11 and
> https://github.com/torvalds/linux/commit/e5ff5ce6e20ee22511398bb31fb912466cf82a36
> resulting in the following build failure:
> 
> sys-utils/lsns.c: In function 'add_namespace_for_nsfd':
> sys-utils/lsns.c:719:25: error: 'NS_GET_NSTYPE' undeclared (first use in this function)
>    719 |  clone_type = ioctl(fd, NS_GET_NSTYPE);
>        |                         ^~~~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/572ecf8e37ac733a4e4265f4f78f35230337278e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...improve-dependence-on-NS_GET_-ioctls.patch | 34 +++++++++++++++++++
>   1 file changed, 34 insertions(+)
>   create mode 100644 package/util-linux/0001-lsns-improve-dependence-on-NS_GET_-ioctls.patch
> 
> diff --git a/package/util-linux/0001-lsns-improve-dependence-on-NS_GET_-ioctls.patch b/package/util-linux/0001-lsns-improve-dependence-on-NS_GET_-ioctls.patch
> new file mode 100644
> index 0000000000..8e79b8d4d3
> --- /dev/null
> +++ b/package/util-linux/0001-lsns-improve-dependence-on-NS_GET_-ioctls.patch
> @@ -0,0 +1,34 @@
> +From fc686823b008bc95e2ebe904c706a117a03e2754 Mon Sep 17 00:00:00 2001
> +From: Karel Zak <kzak@redhat.com>
> +Date: Wed, 6 Apr 2022 10:38:43 +0200
> +Subject: lsns: improve dependence on NS_GET_ ioctls
> +
> +Fixes: http://autobuild.buildroot.org/results/572ecf8e37ac733a4e4265f4f78f35230337278e
> +Reported-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Signed-off-by: Karel Zak <kzak@redhat.com>
> +
> +[Retrieved from:
> +https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=fc686823b008bc95e2ebe904c706a117a03e2754]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + sys-utils/lsns.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/sys-utils/lsns.c b/sys-utils/lsns.c
> +index 1a7e9f333..75625b3a6 100644
> +--- a/sys-utils/lsns.c
> ++++ b/sys-utils/lsns.c
> +@@ -40,7 +40,9 @@
> +
> + #ifdef HAVE_LINUX_NSFS_H
> + # include <linux/nsfs.h>
> +-# define USE_NS_GET_API	1
> ++# if defined(NS_GET_NSTYPE) && defined(NS_GET_OWNER_UID)
> ++#  define USE_NS_GET_API	1
> ++# endif
> + #endif
> +
> + #include "pathnames.h"
> +--
> +cgit
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
