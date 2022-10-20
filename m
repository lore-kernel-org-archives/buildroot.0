Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BF0C43217
	for <buildroot@archiver.kernel.org>; Thu, 20 Oct 2022 17:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7173A60C19;
	Thu, 20 Oct 2022 17:41:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7173A60C19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fFWHDqD7ll1V; Thu, 20 Oct 2022 17:41:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E5D360AEF;
	Thu, 20 Oct 2022 17:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E5D360AEF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D3281BF346
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 17:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6594360AEF
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 17:41:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6594360AEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OzPc95JjOZ7q for <buildroot@lists.busybox.net>;
 Thu, 20 Oct 2022 17:41:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 161CB60AD5
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp3.osuosl.org (Postfix) with ESMTP id 161CB60AD5
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 17:41:49 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id lZYCof68gIAT1lZYCoxl5b; Thu, 20 Oct 2022 19:41:48 +0200
Message-ID: <5715fff8-3bee-58ac-4b1c-0a902a3bc64a@benettiengineering.com>
Date: Thu, 20 Oct 2022 19:41:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: buildroot@buildroot.org
References: <20221010181148.18858-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221010181148.18858-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfAcHhwcwRjKsSEWgoObSlHVsdOUKqCjhHmq0q03LONYWwNmPf0ckfc+E74vGgT8aBIsmwfa81BBt3BS/OU0fNPVcnT9FXVL3vkDkZ49tmNAy2DzL8lKf
 qtQXTtkr2T86ITKUwUiWhyaVNeypLZmbxyQyLtI74lUx/l7mLa7rNJ41QKnkh91Q6LwrifuZumd0lxe7cS1jDvxdM0/ZHEoQ6qjQNSGDvLtsevKBYu9Kgvnu
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666287708; bh=dnk3gspeHc+pWfiOqAwYa2uonp92XVM3dqkCxU6epVc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=jQCFqUE4K8f/QP0DaxcRjsa1OY4Eoz6XyLzh+jvc4JiTdXBXmfuj6ecA5bSggBGcm
 6SyyyFw31ZMsRpaqP4WvK2wqpfFNdKq3S4lpFhnPsHZoK1eJuB68Y+Rq92SNQ4tVMX
 wBI/4TVFrstXkXMq3Cln380wmL+eZb3cOu7lt3zDmjyY44uM96ZME0y1YgVT7cEWds
 qEqW8QZMf3rQHzJNuZ+gH0j4ZgablIjKHgLI4SIpZxRYQsZxn5AmjZd2e3qZifmf1o
 rpcmI8ZbMDgoswkxtbD3tKoadHcoVXaNblJ+Q/JOGwYHykI2uDMx/vwCz86ANdkY+R
 9n3k2GQqC2KJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=jQCFqUE4
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump version to 5.3.0
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

Hi All,

On 10/10/22 20:11, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/harfbuzz/harfbuzz.hash | 2 +-
>   package/harfbuzz/harfbuzz.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
> index 9ec5c63f55..3582de2f30 100644
> --- a/package/harfbuzz/harfbuzz.hash
> +++ b/package/harfbuzz/harfbuzz.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  2edb95db668781aaa8d60959d21be2ff80085f31b12053cdd660d9a50ce84f05  harfbuzz-5.1.0.tar.xz
> +sha256  a05e19e3f52da24ed071522f0fddf872157d7d25e869cfd156cd6f1e81c42152  harfbuzz-5.3.0.tar.xz
>   sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
> diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
> index 75d55106ea..8ef41d3952 100644
> --- a/package/harfbuzz/harfbuzz.mk
> +++ b/package/harfbuzz/harfbuzz.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -HARFBUZZ_VERSION = 5.1.0
> +HARFBUZZ_VERSION = 5.3.0
>   HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
>   HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
>   HARFBUZZ_LICENSE = MIT, ISC (ucdn library)

This is superseded by:
https://patchwork.ozlabs.org/project/buildroot/patch/20221020174031.335520-1-giulio.benetti@benettiengineering.com/

Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
