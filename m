Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4EFC7EE2E
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 17:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 090F640A7F;
	Sun, 11 Jun 2023 17:53:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 090F640A7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pn5vAfoJHgnz; Sun, 11 Jun 2023 17:53:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 374E540A0A;
	Sun, 11 Jun 2023 17:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 374E540A0A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D0901BF27E
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 17:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 369E960743
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 17:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 369E960743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W6mgL1y47YB6 for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 17:53:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F2D86070A
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F2D86070A
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 17:53:32 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.109.39])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 8PFqqAs2dgE4H8PFqqw9Yk; Sun, 11 Jun 2023 19:53:30 +0200
Message-ID: <7bbe9b12-46bc-70d2-38a7-f76f5f8118c5@benettiengineering.com>
Date: Sun, 11 Jun 2023 19:53:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20230611175142.5235-1-bernd.kuhls@t-online.de>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230611175142.5235-1-bernd.kuhls@t-online.de>
X-CMAE-Envelope: MS4xfLeepZzqPGKLgD6FKuq9nQAlr4ThhwvPNqjoVSu71yIYm2XzpwgOR3QZh+Cceis8mF3VDro/y8A4lPoZiODjjhS0f23Un9qBMZxKh22pS1MMKdHHcIek
 BUrtm7u0jgXTVouGg8/KYfMBIvOMi82pu11OrSlvIjqhcL1N2edekaWwvAceKPBMR2qZG2C42Pd34CkhUlneRmg+yNcWDm0vGMP+h4+vo8gheSf1NK9GFJj7
 JzoiwINKgFjCeKO51gbJWAdBZ0Jlmjxr06CJeS2xw/pxfWA6EOhp+mLUz1bTNcOm
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1686506010; bh=2uVCXEh2d8Ps6kCmQNrPMeHQsFtZFEsYP0W3+K2xxOc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=JeSIvmO2HVfKpqB7Uu41ZpdPYUilzvAOFOCvwYWfd01+CKbyHQTq4A7N4bVqiCAY1
 dV/0Ztrq3dLJTKBGwKWh44fB0hCnhPaUzyeziKOZIxRynFrikMBCVYlInSO19RXclU
 gciZTY4YlrBFuBcLYUGAo45Cx3h9DTwIRKCtil+lXnTwi3kFksnpocBQQ0JnCDBSVl
 d9/fbm8QxyQRcuqJQBzIK4OnIcL3kqU2BqsJ6e4113U+Pc9WTSPV7hagpt4GgP+hUy
 OdLcjIjDr+F7XGn2vJMMs5a2uLLFsZ9FG0Aimm9PfCXviJUGqi6rCcmV5nAsI/tPRy
 l9R8itx2lewnA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=JeSIvmO2
Subject: Re: [Buildroot] [PATCH v2 1/1] package/nfs-utils: fix static build
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

On 11/06/23 19:51, Bernd Kuhls wrote:
> Fixes:
> http://autobuild.buildroot.net/results/f17/f17a554c86f0b24327b49fdc75612cc133f129ed/
> 
> f9dc4bab9f4576eed3a22ca7517bfc88d9812c34 bumped nfs-utils to version
> 2.6.3 which includes the addition of the two files patched here.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> ---
> v2: added upstream URL
> 
>   ...-guard-dlfcn.h-include-with-HAVE_DLF.patch | 44 +++++++++++++++++++
>   1 file changed, 44 insertions(+)
>   create mode 100644 package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch
> 
> diff --git a/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch b/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch
> new file mode 100644
> index 0000000000..5ffb15d86d
> --- /dev/null
> +++ b/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch
> @@ -0,0 +1,44 @@
> +From 274e4d212c30183242e48b639889865819f3ac33 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Sun, 11 Jun 2023 08:57:11 +0200
> +Subject: [PATCH] support/reexport: guard dlfcn.h include with HAVE_DLFCN_H
> +
> +Upstream: https://marc.info/?l=linux-nfs&m=168650558019402&w=2
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + support/reexport/fsidd.c    | 2 ++
> + support/reexport/reexport.c | 2 ++
> + 2 files changed, 4 insertions(+)
> +
> +diff --git a/support/reexport/fsidd.c b/support/reexport/fsidd.c
> +index 37649d06..d4b245e8 100644
> +--- a/support/reexport/fsidd.c
> ++++ b/support/reexport/fsidd.c
> +@@ -3,7 +3,9 @@
> + #endif
> +
> + #include <assert.h>
> ++#ifdef HAVE_DLFCN_H
> + #include <dlfcn.h>
> ++#endif
> + #include <event2/event.h>
> + #include <limits.h>
> + #include <stdint.h>
> +diff --git a/support/reexport/reexport.c b/support/reexport/reexport.c
> +index d597a2f7..d9a700af 100644
> +--- a/support/reexport/reexport.c
> ++++ b/support/reexport/reexport.c
> +@@ -2,7 +2,9 @@
> + #include <config.h>
> + #endif
> +
> ++#ifdef HAVE_DLFCN_H
> + #include <dlfcn.h>
> ++#endif
> + #include <stdint.h>
> + #include <stdio.h>
> + #include <sys/random.h>
> +--
> +2.39.2
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
