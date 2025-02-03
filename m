Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6D5C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 11:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E63460811;
	Mon,  3 Feb 2025 11:49:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ghp7OzkEJ07t; Mon,  3 Feb 2025 11:49:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 343A26083F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 343A26083F;
	Mon,  3 Feb 2025 11:49:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C5A41A1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 851DC81F3D
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:49:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5TQFUdwjuz7N for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 11:49:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 24D8A81EFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24D8A81EFD
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24D8A81EFD
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:49:17 +0000 (UTC)
Received: from L25025.local (unknown [109.89.232.55])
 (Authenticated sender: vjardin@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6626319F738;
 Mon,  3 Feb 2025 12:49:13 +0100 (CET)
Date: Mon, 3 Feb 2025 12:49:12 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <7feul6kncgumhskzwxycuwafzplu3fcc67wc2kd6cwsfnw722c@7fuhy3go2tpn>
References: <20241231185346.180096-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241231185346.180096-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738583354;
 bh=VT+M2fju8kg7sQJ2Fo+aPYtfwtfu9l/93qub+0cUIKs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U1oRtK3n1WPpjkiLzxI9ij+J13Imer5iRqJ/kVI07EizeGjaoTVtzUPNUgFsy5Lhf
 uTY9wOxhyq9vlXStomMizaLOf8Cbble+/hxORPEcvVIoheAwwaySUCdxGWC473tv/P
 64TGxorfppQQEjT/K6iRfqid4LFwbdm4b5dxhxKhJcTkW8AC/SDDydzCdcCkvntV1R
 s/p5OhPuT9e0dYRCH7mWvWPJ8pF9bKUJRfKlxCF2fJxKQo1nFncQvLtxn5dCiLFIBI
 lbRjF+c+lnuzPgyWmI6mkHpdIVCd0mokMkQwl/kaRhbrb+2XEa8VlRW3o3p9j0/CKh
 EORH/B2AFztpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=U1oRtK3n
Subject: Re: [Buildroot] [PATCH 1/1] configs/nvidia_bf3: set BR2_cortex_a78
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Dec 31, 2024 at 07:53:46PM +0100, Julien Olivain wrote:
> The nvidia BlueField-3 DPU includes Arm Cortex-A78 Hercules
> processors. See [1].
> 
> The Cortex-A78 support was added in Buildroot in commit [2].
> 
> This commit adds BR2_cortex_a78=y in nvidia_bf3_defconfig to enable
> optimisations for this processor.
> 
> [1] https://www.nvidia.com/en-us/networking/products/data-processing-unit/
> [2] https://gitlab.com/buildroot.org/buildroot/-/commit/f4690c2bfd7d51c614d09ff470e725c795bab980
> 
> Cc: Vincent Jardin <vjardin@free.fr>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Tested-by: Vincent Jardin <vjardin@free.fr>

Thanks Julien for this suggestion.

FYI, using gcc -dM -E - </dev/null | sort | grep ARM
with both buildroot's gcc and nvidia's bf3 Ubuntu gcc, the diff is:

+#define __ARM_FEATURE_ATOMICS 1
+#define __ARM_FEATURE_CRC32 1
+#define __ARM_FEATURE_DOTPROD 1
+#define __ARM_FEATURE_FP16_SCALAR_ARITHMETIC 1
+#define __ARM_FEATURE_FP16_VECTOR_ARITHMETIC 1
+#define __ARM_FEATURE_QRDMX 1
+#define __ARM_FEATURE_RCPC 1

that are available with buildroot gcc but not the one from Ubuntu's gcc

best regards,
  Vincent

> ---
> Patch tested (compilation only) in:
> https://gitlab.com/jolivain/buildroot/-/jobs/8748400651
> 
> Vincent: if you have access to this board, could you do an actual
> runtime test and add a "Tested-by:", please?
> ---
>  configs/nvidia_bf3_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/nvidia_bf3_defconfig b/configs/nvidia_bf3_defconfig
> index 3f958c0062..e44bb55a3a 100644
> --- a/configs/nvidia_bf3_defconfig
> +++ b/configs/nvidia_bf3_defconfig
> @@ -1,4 +1,5 @@
>  BR2_aarch64=y
> +BR2_cortex_a78=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
>  BR2_GLOBAL_PATCH_DIR="board/nvidia/bf3/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> -- 
> 2.47.1
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
