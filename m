Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62CAC61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 19:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A7B240914;
	Thu, 12 Jun 2025 19:56:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Am4tMz4M3SiW; Thu, 12 Jun 2025 19:56:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C941408D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C941408D0;
	Thu, 12 Jun 2025 19:56:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A94191BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A4E181B58
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YpP1L_oLZCAH for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 19:56:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9F8F483BE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F8F483BE8
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F8F483BE8
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:56:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2270D1C0D69; Thu, 12 Jun 2025 21:56:36 +0200 (CEST)
Message-ID: <59a05081-92aa-44a0-a3a4-bc6a2a3bf479@rnout.be>
Date: Thu, 12 Jun 2025 21:56:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com
References: <20250526161403.1305438-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250526161403.1305438-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749758196; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Zls/5gGtzaV03INi3EejauNXHZznyLSIjhDcaIC/quQ=;
 b=aescUATBG22W/q6Zc+OS2TG4ZHgaKl8RmfnMVD0u7tM2Yo5o5zlGKzpranuGJQXtCijP2v
 ON35l/ZVZB/hb3yXjZ0WmPXOOpiT4UiT1UCd17u5zjeyBEop66ldtT8hcTHHFwErK81ZcM
 Nd+EcVr7MpS6BpYpy7ZP1x9m2IW4xHVaRC9vbhyO5Z1tiejyqCwmrCvuEQRBovVVIRNl0x
 ESN6tBKrMtQhMu1wnmq9Wtcor/0kaQnrr/APV/Vk4mnHqVnIMKQ5Kva4gEeAhqkahnwWUD
 cnLjjiUrhyFoIxWz4KN+Cqghk6hqok7UgARBJsFiSx8buefcWZA7AxENhU8Ocg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=aescUATB
Subject: Re: [Buildroot] [PATCH 1/1] package/uuu: fix gcc-15 compile errors
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/05/2025 18:14, Dario Binacchi wrote:
> Fix the following compilation errors:
> 
> In file included from /workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.cpp:32:
> /workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.h:52:9: error: 'uint32_t' does not name a type
>     52 |         uint32_t m_offset = 0;
>        |         ^~~~~~~~
> /workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.h:33:1: note: 'uint32_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
>     32 | #include "cmd.h"
>    +++ |+#include <cstdint>
>     33 |
> /workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.h:53:9: error: 'uint64_t' does not name a type
>     53 |         uint64_t m_scan_limited = UINT64_MAX;
>        |         ^~~~~~~~
> /workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.h:53:9: note: 'uint64_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
> /workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.h: In constructor 'SDPSCmd::SDPSCmd(char*)':
> /workdir/instance-0/output-1/build/host-uuu-1.5.201/libuuu/sdps.h:41:47: error: 'm_offset' was not declared in this scope
>     41 |                 insert_param_info("-offset", &m_offset, Param::Type::e_uint32);
> 
> Fixes:
> - https://autobuild.buildroot.org/results/b7b/b7bd052a0137a2e2d5606d66a0dc563789999364/
> - https://autobuild.buildroot.org/results/350/3500f573427545e51bfc4fc708f769966d95bf1e/
> - https://autobuild.buildroot.org/results/6dc/6dc2b0585e8e1900e5a977cd0b9e26b2ee1e90d4/
> - https://autobuild.buildroot.org/results/d1f/d1f82cae003cddefae0c49f673768cd8601449f2/
> - https://autobuild.buildroot.org/results/9ed/9edc245d0a03089812d631708a4294ff293a461d/
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   ...libuuu-sdps-fix-gcc15-compile-errors.patch | 33 +++++++++++++++++++
>   1 file changed, 33 insertions(+)
>   create mode 100644 package/uuu/0001-libuuu-sdps-fix-gcc15-compile-errors.patch
> 
> diff --git a/package/uuu/0001-libuuu-sdps-fix-gcc15-compile-errors.patch b/package/uuu/0001-libuuu-sdps-fix-gcc15-compile-errors.patch
> new file mode 100644
> index 000000000000..a3c1d85fc07d
> --- /dev/null
> +++ b/package/uuu/0001-libuuu-sdps-fix-gcc15-compile-errors.patch
> @@ -0,0 +1,33 @@
> +From 142448e55386b88adf5b1d7e6206df1ca6784708 Mon Sep 17 00:00:00 2001
> +From: Bruno Thomsen <bruno.thomsen@gmail.com>
> +Date: Sat, 1 Mar 2025 14:32:41 +0100
> +Subject: [PATCH] libuuu/sdps: fix gcc15 compile errors
> +
> +This gcc 15 error happens on Fedora 42.
> +
> +error: uint32_t does not name a type
> +
> +error: uint64_t does not name a type
> +
> +Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
> +Upstream: https://github.com/nxp-imx/mfgtools/commit/142448e55386b88adf5b1d7e6206df1ca6784708
> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +---
> + libuuu/sdps.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/libuuu/sdps.h b/libuuu/sdps.h
> +index b82f9d71c981..667a477ee48f 100644
> +--- a/libuuu/sdps.h
> ++++ b/libuuu/sdps.h
> +@@ -30,6 +30,7 @@
> + */
> +
> + #include "cmd.h"
> ++#include <cstdint>
> +
> + class SDPSCmd : public CmdBase
> + {
> +--
> +2.43.0
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
