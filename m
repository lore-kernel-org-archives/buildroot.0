Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F76C7EE2E
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 17:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B83C440A7F;
	Sun, 11 Jun 2023 17:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B83C440A7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xd-qAy-7_Z1s; Sun, 11 Jun 2023 17:51:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E04B840A0A;
	Sun, 11 Jun 2023 17:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E04B840A0A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D7BE1BF27E
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 17:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43E1D82BE5
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 17:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43E1D82BE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PKDWXgPCOU5W for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 17:51:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8EC582BBA
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8EC582BBA
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 17:51:03 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.109.39])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 8PDQqAqnMgE4H8PDQqw8jF; Sun, 11 Jun 2023 19:51:00 +0200
Message-ID: <7a5ffd30-cbc5-10fe-3e32-a0e04be27aa4@benettiengineering.com>
Date: Sun, 11 Jun 2023 19:51:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20230611075148.327954-1-bernd.kuhls@t-online.de>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230611075148.327954-1-bernd.kuhls@t-online.de>
X-CMAE-Envelope: MS4xfOAtaFbtzDSdvj7jFfUHIf8xCsFq+6SQO//CzYiq0VMHxovvWyoU9Sgj+WMFuX/ES/eul3NhR6Jc0Pco7le3WMZUrd3qk0Ofznbu/rhkX2pIp/KTeNpG
 K366rsp7hzMl2g92BQual59Aj/gtt3TCZBgR/+k2KZjh8sxCqi/uLnpqMHo2O+ge3c8aLXVa6n7UgrXJ9RyjD0Ql8Mbsn0BT7aG+2kKyLanokSvyLmE6kzvR
 joHCF+mBYTM/eCMZDpVHLvllUlWVfUe/IC74iguEm2o=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1686505860; bh=uu8W4w1LlBF6N9e/SYKmrVKT059oQa3THuSb18kB/Gg=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=mNVoCvWBsPgKHnkvO/EytVqIr95PVlC0eKOp8G7BR6ruhXjiUw6SDYV+x6uqUFqIG
 F3YfZUjNyeWe6Bg5XioFmI1MYy/pXw7w0eSrTmA3uGnu13rRFFWRc/GyWdOgxLp9Hu
 GdVFrnWbRvbWbXzqeNfODqOLK5C6686wLyp+rHGZAZw3uF5ko1X/hWaRKpKEFbsW11
 eOBczAe3qwHiVgVUaxm7cAmGb5ktPtPWxw1CiWPszIsXqZInBcFGt6dc6FCM64PIgV
 UNWxV6NWxAaE1TMH/WGk8APa54qonHZ0taTUKmMLFsWKFZbIlfkIHDoqfuh3X8DLeL
 O6T8gz354qrKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=mNVoCvWB
Subject: Re: [Buildroot] [PATCH 1/1] package/nfs-utils: fix static build
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

Hi Bernd,

thanks again,

On 11/06/23 09:51, Bernd Kuhls wrote:
> Fixes:
> http://autobuild.buildroot.net/results/f17/f17a554c86f0b24327b49fdc75612cc133f129ed/
> 
> f9dc4bab9f4576eed3a22ca7517bfc88d9812c34 bumped nfs-utils to version
> 2.6.3 which includes the addition of the two files patched here.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

> ---
> After trying for an hour to register an account upstream I gave up
> because all my public mail accounts were rejected. So I was unable to
> send the patch upstream.

I've sent the patch upstream:
https://marc.info/?l=linux-nfs&m=168650558019402&w=2

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

>   ...-guard-dlfcn.h-include-with-HAVE_DLF.patch | 44 +++++++++++++++++++
>   1 file changed, 44 insertions(+)
>   create mode 100644 package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch
> 
> diff --git a/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch b/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch
> new file mode 100644
> index 0000000000..3af4b75623
> --- /dev/null
> +++ b/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch
> @@ -0,0 +1,44 @@
> +From 274e4d212c30183242e48b639889865819f3ac33 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Sun, 11 Jun 2023 08:57:11 +0200
> +Subject: [PATCH] support/reexport: guard dlfcn.h include with HAVE_DLFCN_H
> +
> +Upstream: pending upload
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
