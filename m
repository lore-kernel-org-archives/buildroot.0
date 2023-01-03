Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A22C46467
	for <buildroot@archiver.kernel.org>; Tue,  3 Jan 2023 11:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1402180DB9;
	Tue,  3 Jan 2023 11:12:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1402180DB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yrZ_9wXUWV0f; Tue,  3 Jan 2023 11:12:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6095781E7C;
	Tue,  3 Jan 2023 11:12:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6095781E7C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B79A21BF86B
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 11:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92BFB4057F
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 11:12:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92BFB4057F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EXfzBq2A7CL5 for <buildroot@lists.busybox.net>;
 Tue,  3 Jan 2023 11:12:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1593740102
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1593740102
 for <buildroot@buildroot.org>; Tue,  3 Jan 2023 11:12:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.54])
 by smtp4-g21.free.fr (Postfix) with ESMTP id 4B78619F553;
 Tue,  3 Jan 2023 12:12:19 +0100 (CET)
Received: from 37-169-88-47.coucou-networks.fr ([37.169.88.47])
 by webmail.free.fr
MIME-Version: 1.0
Date: Tue, 03 Jan 2023 12:12:19 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20230102205416.817843-2-peter@korsgaard.com>
References: <20230102205416.817843-1-peter@korsgaard.com>
 <20230102205416.817843-2-peter@korsgaard.com>
Message-ID: <8979f17b03f06016741f713598287436@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672744339;
 bh=eiW03pxHXgW6pCi5DHPGcTpW7U/NxCfuLPM2Wnwtabc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IoEDZGNS7n8MjTAsPhtOxBzsZ0qe3Vq5wak1Q7pbozCntpUJb64qdhS0dlCW99xqZ
 +3xl808kPxHhtKDLuAF3QSlqu+J8zlBIDx1vRVJZVmn/3Zf6X+1VXGVgPhZUJKQJQ3
 lpDfiwn+qbIw/5NkJLMDr/C01dvW6wcUAi4RSEpxa14QIJwoUcy503abWL3xbfNUiw
 ZIn+xNBUUDgxQCIHmgCMS9k8PBqIklumLdjahTxk/esLRrNaP7SQM+5zpzqYdCpJKl
 9aPD3dBc0H/5WX+wU8iQoZB2bhMrrkrx8CwwIoGi0bBDMWydoIH3fJ+yIe+TwSj3IU
 DDLdeOIBmZv0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IoEDZGNS
Subject: Re: [Buildroot] [PATCH 2/2] spike_risc64_defconfig: bump opensbi to
 1.1
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

A minor comment: the patch title misses the "v" in 
"spike_riscv64_defconfig:".
By the way, according to the BR manual recommendations,
https://git.buildroot.org/buildroot/tree/docs/manual/contribute.txt?h=2022.11#n202
the patch title prefix should be more "configs/spike_riscv64:" for both 
patches.

I successfully runtime tested this series.

On 02/01/2023 21:54, Peter Korsgaard wrote:
> Instead of the default 0.9 version.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  configs/spike_riscv64_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/configs/spike_riscv64_defconfig 
> b/configs/spike_riscv64_defconfig
> index cd8fd8ee04..26103682f9 100644
> --- a/configs/spike_riscv64_defconfig
> +++ b/configs/spike_riscv64_defconfig
> @@ -8,6 +8,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
>  BR2_TARGET_ROOTFS_CPIO=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_TARGET_OPENSBI=y
> +BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
> +BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.1"

While at it, I also tested with OpenSBI v1.2 recently released:
https://github.com/riscv-software-src/opensbi/releases/tag/v1.2

Unless there is a specific reason for v1.1, maybe you could update to
this newer version?

>  BR2_TARGET_OPENSBI_PLAT="generic"
>  BR2_TARGET_OPENSBI_LINUX_PAYLOAD=y
>  BR2_PACKAGE_HOST_RISCV_ISA_SIM=y

Reviewed-by: Julien Olivain <ju.o@free.fr>
Tested-by: Julien Olivain <ju.o@free.fr>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
