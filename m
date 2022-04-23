Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8406C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 16:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DE8360F6C;
	Sat, 23 Apr 2022 16:30:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UazKVaSbJHqE; Sat, 23 Apr 2022 16:30:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 980AF60D53;
	Sat, 23 Apr 2022 16:30:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 095C31BF5DF
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA7D64048A
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:30:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ILOfLeLLHHn for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 16:30:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C136400DA
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 16:30:50 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id k23so21870046ejd.3
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 09:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=GY6kSenZgScQ5uyUSR4yXhMMoQxT8t+Gib4pRaEeaFQ=;
 b=F64HGEkc2PxNHku7PscEZlZ1SYphUdY5GbyXkhxslCxFQY5Ok1ivCiRvKOXrANjNPV
 UUTSex63lAtxkwL6AxtpaPhB8m032kOs1IYu2jz4iV6O3jdgoUdd8ZdcP4avAlISIXFg
 0LE0TVNlrPQy5xdTS0zR5+PuRg4mM5//LlNJjkXWtGAlAiDKEPkIqdXDYH0+xvArkjy7
 kqOdI152qE3rhvWDxra/S9C1IzdF4Y7pi9MELjLkpnWDLZQ+9GlCxhov8ebecXcLTlnB
 UytYGs7aYCLIutmqyTz8DtIZPzbaXuL/Yf+6I5dZyhpf8MaOEd37Eoaw0IeJpoBH/Ryx
 qwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GY6kSenZgScQ5uyUSR4yXhMMoQxT8t+Gib4pRaEeaFQ=;
 b=dJMTrH7IyaLXS1Wx7CxR26joGtmGSHEJyz5uptig3cj1YNilcDp4S9xJB2sUlSYsjh
 DuLKOpdK3hnllHTaXzJtpqqEqZOTvqah2dP4WmhqzgwtqNGFGVUng35au6Omy+e9PzE0
 t1npWNi7rVXnEfACnlyEDwe+ZH52hoqIJFONY8K4XlkGoE88vZq92eniZcQM1sbMiIGK
 YAL33ArshJJyq9QVmjVdrQFaQBdojvbHSJ0ykDjYumI2HvSTxSkwzffBaDJDmaWz/FPJ
 Rg1pkLBX4RndsNkxM/cFYU6uT9aoqDv1X5967ic1wWekWUuj+go6CmD+RrLTtTK57GTd
 xhOA==
X-Gm-Message-State: AOAM531n1tQwn7eGOFo2tuuYoQlh/lMSPBGZryV1qFTDIr7CPtr7xj2D
 KwcVpl+00/gHmd4oe1dlsd8tuQ==
X-Google-Smtp-Source: ABdhPJwoniOKs1ZrP9BQhcAMMOHfGlmhIcXrDAbBBvdDEVylw0HFSYCjazhhLHQm2/nHLi+jrrZnxg==
X-Received: by 2002:a17:907:608f:b0:6f3:671d:d2f9 with SMTP id
 ht15-20020a170907608f00b006f3671dd2f9mr5196782ejc.675.1650731449075; 
 Sat, 23 Apr 2022 09:30:49 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 la10-20020a170907780a00b006e889ee7741sm1819023ejc.75.2022.04.23.09.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 09:30:48 -0700 (PDT)
Message-ID: <79e52372-031a-2836-b2ab-2f78f629d29f@mind.be>
Date: Sat, 23 Apr 2022 18:30:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220421115529.2625137-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220421115529.2625137-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/arptables: fix build with
 BR2_OPTIMIZE_0
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



On 21/04/2022 13:55, Fabrice Fontaine wrote:
> Fix the following build failure with BR2_OPTIMIZE_0 raised since the
> addition of the package in commit
> efc10eb6b87884f1f7917462d78af6953fcd99e3 and
> https://git.netfilter.org/arptables/commit/?id=369afc14de1d89ff5627ff4c5f72f6f839244b50:
> 
> libarptc/libarptc.c:48:21: error: redefinition of 'arpt_get_target'
>     48 | #define GET_TARGET  arpt_get_target
>        |                     ^~~~~~~~~~~~~~~
> libarptc/libarptc_incl.c:16:1: note: in expansion of macro 'GET_TARGET'
>     16 | GET_TARGET(STRUCT_ENTRY *e)
>        | ^~~~~~~~~~
> In file included from .//include/libarptc/libarptc.h:7,
>                   from libarptc/libarptc.c:26:
> .//include/linux/netfilter_arp/arp_tables.h:196:43: note: previous definition of 'arpt_get_target' was here
>    196 | static __inline__ struct xt_entry_target *arpt_get_target(struct arpt_entry *e)
>        |                                           ^~~~~~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/730dce4101e7afcee233067e2870603cd64b8a48
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   ...tc-libarptc_incl.c-fix-build-with-O0.patch | 49 +++++++++++++++++++
>   1 file changed, 49 insertions(+)
>   create mode 100644 package/arptables/0002-libarptc-libarptc_incl.c-fix-build-with-O0.patch
> 
> diff --git a/package/arptables/0002-libarptc-libarptc_incl.c-fix-build-with-O0.patch b/package/arptables/0002-libarptc-libarptc_incl.c-fix-build-with-O0.patch
> new file mode 100644
> index 0000000000..29f2d714e2
> --- /dev/null
> +++ b/package/arptables/0002-libarptc-libarptc_incl.c-fix-build-with-O0.patch
> @@ -0,0 +1,49 @@
> +From 7d8285ae92253017a15282dd25f76d76eed49518 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Thu, 21 Apr 2022 13:43:23 +0200
> +Subject: [PATCH] libarptc/libarptc_incl.c: fix build with -O0
> +
> +Fix the following build failure with -O0:
> +
> +libarptc/libarptc.c:48:21: error: redefinition of 'arpt_get_target'
> +   48 | #define GET_TARGET  arpt_get_target
> +      |                     ^~~~~~~~~~~~~~~
> +libarptc/libarptc_incl.c:16:1: note: in expansion of macro 'GET_TARGET'
> +   16 | GET_TARGET(STRUCT_ENTRY *e)
> +      | ^~~~~~~~~~
> +In file included from .//include/libarptc/libarptc.h:7,
> +                 from libarptc/libarptc.c:26:
> +.//include/linux/netfilter_arp/arp_tables.h:196:43: note: previous definition of 'arpt_get_target' was here
> +  196 | static __inline__ struct xt_entry_target *arpt_get_target(struct arpt_entry *e)
> +      |                                           ^~~~~~~~~~~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/730dce4101e7afcee233067e2870603cd64b8a48
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  No upstream reference? Is upstream dead?

  Applied to master, thanks.

  Regards,
  Arnout

> +---
> + libarptc/libarptc_incl.c | 8 --------
> + 1 file changed, 8 deletions(-)
> +
> +diff --git a/libarptc/libarptc_incl.c b/libarptc/libarptc_incl.c
> +index c4d5de3..441f2de 100644
> +--- a/libarptc/libarptc_incl.c
> ++++ b/libarptc/libarptc_incl.c
> +@@ -11,14 +11,6 @@
> + /* (C)1999 Paul ``Rusty'' Russell - Placed under the GNU GPL (See
> +    COPYING for details). */
> +
> +-#ifndef __OPTIMIZE__
> +-STRUCT_ENTRY_TARGET *
> +-GET_TARGET(STRUCT_ENTRY *e)
> +-{
> +-	return (void *)e + e->target_offset;
> +-}
> +-#endif
> +-
> + static int sockfd = -1;
> + static void *arptc_fn = NULL;
> +
> +--
> +2.35.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
