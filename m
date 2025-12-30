Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5E0EE4982
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 16:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58BC681C46;
	Tue, 30 Dec 2025 16:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s6On-9fVqc2c; Tue, 30 Dec 2025 16:19:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85F2481D35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767111589;
	bh=PDLZZkXTHW0lNkwbgxkCDspVCSm0JMPoYw0PRaNqW14=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bfxVLphMYcwj5q6mlI9BJ6KHaiMomdINMYHTetgs/TGxKfWCQh4CIoy8TZrY7jcDv
	 dmfLHpVB3te2oJTeJ5YfMIAd2scN48EOsM6nZ4GG//u2+X0etQdCXAfU4xXkrYOx1y
	 NccPv9JlJex75SBA2dovsk9ueNOJNjg4gzN99i5L4hnf8rleH6kvWjcdjrxFLjQn+0
	 yFXhnMTSmYgfByPBfZ1dDYEzf9sLSIqLzfeOiUCdIDnh2SXxBfsxNm/m8brMOM7piN
	 Ywibd3zLLeeQJTsMKE4UiqmZx8D1tZHt1rL1/xyiCRyLLdSbww+EgQLG5gces6Ozr4
	 fOwDQqkOmmwCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85F2481D35;
	Tue, 30 Dec 2025 16:19:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 403C4277
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 16:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3257181C46
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 16:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4yoXdEJm5h3u for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 16:19:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.131;
 helo=smtpcmd12131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C3A10807B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3A10807B7
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3A10807B7
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 16:19:45 +0000 (UTC)
Received: from [192.168.50.134] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id acRYvTbHkP2aDacRYvOEQ4; Tue, 30 Dec 2025 17:19:43 +0100
Message-ID: <768cf8fb-7f94-4081-81e0-08d8192f834d@benettiengineering.com>
Date: Tue, 30 Dec 2025 17:19:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20251220170623.155785-1-bernd@kuhls.net>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20251220170623.155785-1-bernd@kuhls.net>
X-CMAE-Envelope: MS4xfN57xjUKnN2rj67usApZJQ8jwGtX6E3LEnkV5PFfzQPMqaTr4MKKC1DHowCuKdh7HzJeLQvUXuGJfSxf7OBYS1R7eqSBKLpucrED0SY6R5ur5lFyR+eo
 7R7VnYAwtIyAO2MebNHWqwX0H4uFwr2qYqATtoHxFtn6NuuRTG7qfyDW30vl4dQpWEzE4BnfsWhEAwm53xxAsNpukYuXBNN/1HIYSymG0K3Ub592aoytv9CG
 4z5eLhVyFu9c8xuuo1cLpg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1767111583; bh=FIFVasGhMPnEzghnK/wYY/G+wkpLXiJys+ZwuJnV2YU=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=gQK87UgXH8dRYBpv5FVbDEKMpVqahxysge2Skv2jTIiflYlnJjEqPZrlqDFxwjjjK
 L+eU8b8myVp25S20b6rJHno8iraCMJ14LS5rcOku709u2G8dLDBP0pKCj2HlIC8uby
 WfwyatlbuXJb1MuS3fMKA7n9MCBDuG/S0Fya4pd4voVuhO1zx+V5CubnnRcUJ57dC+
 fGsWgJamo/p5i7uVYP9zDr9sdlL0q1x7IkZFM1VBshvKgkoNxp71tjFYWlRZyWf4aa
 K0Is5Fk0fHL+7mJ63eQzUfZ04W447u9KNzVTWGzqZrHpGaai17yqOCwPhHenyGB46p
 e82Symc8+wKUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=gQK87UgX
Subject: Re: [Buildroot] [PATCH 1/4] package/util-linux: Remove -lpthread
 from uuid.pc for non-threaded builds
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

thanks for this patchset,

On 20/12/2025 18:06, Bernd Kuhls wrote:
> Buildroot commit 31af509b4f4fe52f67bd9109b8732a55b8f9cd2d bumped
> util-linux from version 2.40.2 to 2.41.1.
> 
> Upstream release 2.40.3 contains
> https://github.com/util-linux/util-linux/commit/e143539d30fd18afb3ba6d3c6e50a260d4219895
> which unconditionally adds -lpthread to uuid.pc causing build errors for
> other packages using non-threaded toolchains like erofs-utils.
> 
> Upstream was notified:
> https://github.com/util-linux/util-linux/issues/3210#issuecomment-3477915953
> 
> Fixes:
> https://autobuild.buildroot.net/results/582/5827995db2a805e0c8a04fde8498eff6f28aa6d8/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
Giulio

> ---
>   package/util-linux/util-linux.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index 16d086f333..8c98d80adf 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -37,6 +37,13 @@ UTIL_LINUX_LICENSE_FILES = README.licensing \
>   
>   UTIL_LINUX_CPE_ID_VENDOR = kernel
>   
> +define UTIL_LINUX_POST_EXTRACT_FIXUP
> +	$(SED) 's/-lpthread//' $(@D)/libuuid/uuid.pc.in
> +endef
> +ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +UTIL_LINUX_POST_EXTRACT_HOOKS += UTIL_LINUX_POST_EXTRACT_FIXUP
> +endif
> +
>   UTIL_LINUX_INSTALL_STAGING = YES
>   UTIL_LINUX_DEPENDENCIES = \
>   	host-pkgconf \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
