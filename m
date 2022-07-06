Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FD9C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 22:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15F3D4033B;
	Wed,  6 Jul 2022 22:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15F3D4033B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fwl_BcEJBD0w; Wed,  6 Jul 2022 22:05:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4C7C402B1;
	Wed,  6 Jul 2022 22:05:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4C7C402B1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D3F9F1BF44A
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 22:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE274402B1
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 22:05:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE274402B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vipmSRU89eyh for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 22:05:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AC3F402A4
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AC3F402A4
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 22:05:32 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.49.253])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9D9GoJ13fr8wy9D9GocIAE; Thu, 07 Jul 2022 00:05:31 +0200
Message-ID: <d44ed12d-bd93-a7af-54cf-950b6908074b@benettiengineering.com>
Date: Thu, 7 Jul 2022 00:05:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220703155356.1356910-1-fontaine.fabrice@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220703155356.1356910-1-fontaine.fabrice@gmail.com>
X-CMAE-Envelope: MS4xfHNWrOR1ZDf3EXhIfGWqab+IZAQ1ftgAp+c7QyithrUrs5t5jgeuxMM8qUmv//5colgbHREyFEgZa8rW6uEYL6hH5vEhp7CxIoZikzsfFJEGnyhD5InW
 t7LOTlJTD/51rppsILuEJpTsM7WhByN/fI4py8fMB8Hp2klHc5FIhFPTL42dllyeCrFFNRPjvHcALw+fnrbf+N5BLyPfjiMBXu6nwfYlZBg94v2mIDmx9jEi
 dJpaTHNs/xgmiAD0fAgvBWONwrQFZwmsLQA8JDTV0CGcnhnhfAXduyPKdPv+5lUeGiGfOcuTF4Qqk49X1/sSKA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1657145131; bh=Mk3XWQ2++XzcnK5qh6i+t67qpIujW/AccMQWir9uo34=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=DUAqtn2RtC41FJWfzd0rierN9Ewqc7qk7eSLRspN1paO2ofMZ9/Zl5yv0tl8+Yrpz
 NFxABMYxdReCCP+4iZBc0mTLTaaompCLeDgAmy5IKghfe1z3HHvzxnTfbL16HEm52F
 KOVrVmXtUc+/h7GOdqhaAp1GGFVh6MC1rsfM//VX+EaQB7pk/rtaKpGJey28MarQen
 HGvAGOHR+nsRQfq3X//RWWsoHJXlPL0MXxi7CAXCre78IHAAZI+sFRk2Q2IHRgACCr
 vRyefc1ZDzBPN0+jqoo/1IQlRreJz+9mOGl5nZja0VLmw8i6XEdjmBTXtbTC7NVsbH
 RVALlCyJdkWCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=DUAqtn2R
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: fix build without
 sched_yield
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

On 03/07/22 17:53, Fabrice Fontaine wrote:
> Fix the following build failure without sched_yield raised since bump to
> version 7.84.0 in commit b034109dd60a429690acf9c5501c6658c53eae13:
> 
> In file included from easy.c:89:
> easy_lock.h: In function 'curl_simple_lock_lock':
> easy_lock.h:56:7: error: implicit declaration of function 'sched_yield' [-Werror=implicit-function-declaration]
>     56 |       sched_yield();
>        |       ^~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/fbc80a0002d640210c81a4c518856c02669059b7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Reviewed-by: Baruch Siach <baruch@tkos.co.il>

Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> ---
>   ...de-sched-h-if-available-to-fix-build.patch | 30 +++++++++++++++++++
>   1 file changed, 30 insertions(+)
>   create mode 100644 package/libcurl/0001-easy_lock-h-include-sched-h-if-available-to-fix-build.patch
> 
> diff --git a/package/libcurl/0001-easy_lock-h-include-sched-h-if-available-to-fix-build.patch b/package/libcurl/0001-easy_lock-h-include-sched-h-if-available-to-fix-build.patch
> new file mode 100644
> index 0000000000..b5f0a87218
> --- /dev/null
> +++ b/package/libcurl/0001-easy_lock-h-include-sched-h-if-available-to-fix-build.patch
> @@ -0,0 +1,30 @@
> +From e2e7f54b7bea521fa8373095d0f43261a720cda0 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Mon, 27 Jun 2022 08:46:21 +0200
> +Subject: [PATCH] easy_lock.h: include sched.h if available to fix build
> +
> +Patched-by: Harry Sintonen
> +
> +Closes #9054
> +
> +[Retrieved from:
> +https://github.com/curl/curl/commit/e2e7f54b7bea521fa8373095d0f43261a720cda0]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + lib/easy_lock.h | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/lib/easy_lock.h b/lib/easy_lock.h
> +index 819f50ce815b8..1f54289ceb2d3 100644
> +--- a/lib/easy_lock.h
> ++++ b/lib/easy_lock.h
> +@@ -36,6 +36,9 @@
> +
> + #elif defined (HAVE_ATOMIC)
> + #include <stdatomic.h>
> ++#if defined(HAVE_SCHED_YIELD)
> ++#include <sched.h>
> ++#endif
> +
> + #define curl_simple_lock atomic_bool
> + #define CURL_SIMPLE_LOCK_INIT false

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
