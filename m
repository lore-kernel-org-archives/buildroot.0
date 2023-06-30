Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACB5EB64DA
	for <buildroot@archiver.kernel.org>; Fri, 30 Jun 2023 20:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74A1F41B66;
	Fri, 30 Jun 2023 20:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74A1F41B66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cvfXFPVyPu7X; Fri, 30 Jun 2023 20:55:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AD1441F21;
	Fri, 30 Jun 2023 20:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AD1441F21
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E33581BF2BB
 for <buildroot@lists.busybox.net>; Fri, 30 Jun 2023 20:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9EB3404DD
 for <buildroot@lists.busybox.net>; Fri, 30 Jun 2023 20:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9EB3404DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K8BBjuySjAMU for <buildroot@lists.busybox.net>;
 Fri, 30 Jun 2023 20:55:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 607E9400C8
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 607E9400C8
 for <buildroot@buildroot.org>; Fri, 30 Jun 2023 20:55:14 +0000 (UTC)
Received: from [192.168.50.162] ([146.241.103.123])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FL95qFwrPTdWxFL95q5dfM; Fri, 30 Jun 2023 22:55:12 +0200
Message-ID: <3405acea-9f0e-b15b-16de-27689d1733a4@benettiengineering.com>
Date: Fri, 30 Jun 2023 22:55:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: buildroot@buildroot.org
References: <pan22fc181d07f22343b4@ID-313208.user.individual.net>
 <20230611181106.3454549-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230611181106.3454549-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfGYpUjV3j9YU8RnKVgvqHWG2i4uKtvCBBrTdbHxyDHv5FBlBWSixiiYw4tJ7hqVj/GQLfZUR3EsBDYZRvd/S4ZKnbT7A/wNku+dUNHPumRhz9fh+acpo
 V6Cl4Ie5vCYaBZY+1YPGG+K6F8gkSS0Un8ckWilLuH1E4eWT65RgHKKjN1N0hNRRxPUyejKP8LEiFah+PdkInnQtM8ZgvP9vUYBhOm9Wlz6EaZJZ/7TzEiW0
 b+0CAa2pS5CVIrP0D3WCOOyaxnxvHd760Yxd0T4whsoRoGZ59gDHRHu65scmrlaJ
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1688158512; bh=w04BYFBtnpgxgrl4XPDdqnk8cnUWRQu/oj1ovrxkDeg=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Cv3xMMjHyHuRyrLbomH5BcfI2oC0M1r8Ccc34lPiGIYL8CzCRPOs+J6ByYb3puyOT
 o13Gr3/D6v9h0Sk5Jfmi4tOxL055tJfD59zhKjbiSbQRARFZjDgVdd8hAePUItBf+K
 VGEEMfni9Tvl/4g7MpcHDbRDBedGO61NpBPXMCLI1qSYCstRd4XnKXYxUr9bY9lQor
 L1DZ+Bn1qTv1uEnoieoyR8Pnoy0KfaVavDy5zTP4Csdtg0Le+z04JbhT1MA0neR9N3
 IkHxgMxCcojBKVnTjRTiMhap6XTwE0qn0MNG823NYxeep1l+2N5ON4q/v9ThYsILp6
 K2Emu4iA41xXA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Cv3xMMjH
Subject: Re: [Buildroot] [PATCH v2] package/libnss: bump version to 3.90
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch has been superseded by this:
https://patchwork.ozlabs.org/project/buildroot/patch/20230630205346.404448-1-giulio.benetti@benettiengineering.com/

So please reject it. Thank you

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

On 11/06/23 20:11, Giulio Benetti wrote:
> Add local patch to fix build failure due to CURVE25519 used on non
> x86_64 architectures.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * Add local patch to avoid build failure as suggested by Bernd Kuhls
> ---
>   ...bling-ASM-C25519-for-A-but-X86_64-r-.patch | 36 +++++++++++++++++++
>   package/libnss/libnss.hash                    |  4 +--
>   package/libnss/libnss.mk                      |  2 +-
>   3 files changed, 39 insertions(+), 3 deletions(-)
>   create mode 100644 package/libnss/0002-Bug-1836781-Disabling-ASM-C25519-for-A-but-X86_64-r-.patch
> 
> diff --git a/package/libnss/0002-Bug-1836781-Disabling-ASM-C25519-for-A-but-X86_64-r-.patch b/package/libnss/0002-Bug-1836781-Disabling-ASM-C25519-for-A-but-X86_64-r-.patch
> new file mode 100644
> index 0000000000..957dc8f624
> --- /dev/null
> +++ b/package/libnss/0002-Bug-1836781-Disabling-ASM-C25519-for-A-but-X86_64-r-.patch
> @@ -0,0 +1,36 @@
> +From c07c4e073d95a25343cbf56b4a830a71e432869e Mon Sep 17 00:00:00 2001
> +From: Natalia Kulatova <nkulatova@mozilla.com>
> +Date: Mon, 5 Jun 2023 16:09:58 +0000
> +Subject: [PATCH] Bug 1836781 - Disabling ASM C25519 for A but X86_64
> + r=bbeurdouche,nss-reviewers
> +
> +Differential Revision: https://phabricator.services.mozilla.com/D179969
> +
> +--HG--
> +extra : moz-landing-system : lando
> +
> +Upstream: https://hg.mozilla.org/projects/nss/rev/52a5d8fe37410d940e7d3ca244146ebc46a7d52a
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + nss/lib/freebl/Makefile | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
> +index 74e8e6545..ba7d83c4e 100644
> +--- a/nss/lib/freebl/Makefile
> ++++ b/nss/lib/freebl/Makefile
> +@@ -568,7 +568,9 @@ ifneq ($(shell $(CC) -? 2>&1 >/dev/null </dev/null | sed -e 's/:.*//;1q'),lcc)
> +             HAVE_INT128_SUPPORT = 1
> +             DEFINES += -DHAVE_INT128_SUPPORT
> +     else ifeq (1,$(CC_IS_GCC))
> +-        SUPPORTS_VALE_CURVE25519 = 1
> ++        ifeq ($(CPU_ARCH),x86_64)
> ++            SUPPORTS_VALE_CURVE25519 = 1
> ++        endif
> +         ifneq (,$(filter 4.6 4.7 4.8 4.9,$(word 1,$(GCC_VERSION)).$(word 2,$(GCC_VERSION))))
> +             HAVE_INT128_SUPPORT = 1
> +             DEFINES += -DHAVE_INT128_SUPPORT
> +--
> +2.34.1
> +
> diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
> index 63a35285d7..7252c0f254 100644
> --- a/package/libnss/libnss.hash
> +++ b/package/libnss/libnss.hash
> @@ -1,4 +1,4 @@
> -# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_89_1_RTM/src/SHA256SUMS
> -sha256  3adaedb9e70c3c5f40603bf60a01e336190a6dbe01929d395f16b01fe84a0156  nss-3.89.1.tar.gz
> +# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_90_RTM/src/SHA256SUMS
> +sha256  9acd6534c41d8ead19fca6fcb3fffed2f9f09c437c3d79fee6a4ee668aaa93b6  nss-3.90.tar.gz
>   # Locally calculated
>   sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index d3f227e909..1f8d1c0d31 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBNSS_VERSION = 3.89.1
> +LIBNSS_VERSION = 3.90
>   LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
>   LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
>   LIBNSS_DISTDIR = dist

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
