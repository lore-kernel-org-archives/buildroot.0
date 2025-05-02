Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2E9C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5617813E9;
	Fri,  2 May 2025 11:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jkZTaUjTK0C7; Fri,  2 May 2025 11:03:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13E25815C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13E25815C1;
	Fri,  2 May 2025 11:03:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DB64229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B18F60AE6
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:03:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lbk6yRejtBvG for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:03:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 977CC60721
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 977CC60721
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 977CC60721
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:03:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ACC971C0E0A; Fri,  2 May 2025 13:03:25 +0200 (CEST)
Message-ID: <f32c1425-86a3-41bb-bad9-4790fda9787f@rnout.be>
Date: Fri, 2 May 2025 13:03:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Charlie Jenkins <charlie@rivosinc.com>, buildroot@buildroot.org,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250421-fix_linux_tools_parallel-v2-1-301086814e0b@rivosinc.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250421-fix_linux_tools_parallel-v2-1-301086814e0b@rivosinc.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746183805; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=jWzZmzhOUN5Ouwmemt0moWxynS7pos2C/VC7nxNG6V4=;
 b=QxPP/FwRSbjzF1dvPNQ0BPuc7KhYndFau3SLWQ1UeY0A0r/MBcEwEcGQcgw8I3b8ns6mqR
 dcR0zraCqIAR+4pxdpJ4jW/bEH30rwpSSXa99ke0S7A3OFixSgsPEQEQ/iXfli0S3vzp0o
 Lvkbn/E3x6JdcmZV5i0XYTpG33RbP0LY+wJrxMnKsZlwST5R0RXjdsQnmPugk6rktMFfPp
 /9qbAo0zXVj3f8EGsghE/LIzgawEv+YMzZEoUwmllr2DcksKZmu4cWBqQAbm0xjmXrresf
 kcM+obPSdEyVMX7S5OtvUP7yx6nWkj/pBzgP530QDbGHWpV8gpWO+tRg6QR65Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=QxPP/FwR
Subject: Re: [Buildroot] [PATCH v2] package/linux-tools: Fix parallel
 compilation
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



On 22/04/2025 08:36, Charlie Jenkins wrote:
> linux-tools opportunistically set linux as only a patch dependency. This
> unfortunately introduces a race condition in the shared linux scripts
> when using PER_PACKAGE_DIRECTORIES and using top level parallelism. The
> race manifests as the error "/bin/sh: 1: scripts/basic/fixdep:
> Permission denied". This happens when the linux package and the
> linux-tools package are being compiled in parallel.
> 
> The linux-tools currently using fixdep are perf and rtla. When the
> timing is correct, perf, rtla, or the kernel Makefile will try to use
> fixdep while one of the others is compiling fixed, resulting in fixdep
> being briefly not available.
> 
> To fix this, set linux as a build dependency instead of a patch
> dependency.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
> While the timing of this seems like it should very rarely be triggered,
> on my build server I hit this issue nearly 100% of the time.
> ---
> Changes in v2:
> - Added more details to how/why the race occurs
> - Link to v1: https://lore.kernel.org/r/20250409-fix_linux_tools_parallel-v1-1-14135d77acf1@rivosinc.com
> ---
>   package/linux-tools/linux-tools.mk | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/linux-tools/linux-tools.mk b/package/linux-tools/linux-tools.mk
> index 81b1fbc17605d6f003558d113143b64b5af6714d..49e73a9ca4eca91afe7474302c13286f6665762d 100644
> --- a/package/linux-tools/linux-tools.mk
> +++ b/package/linux-tools/linux-tools.mk
> @@ -19,8 +19,12 @@
>   
>   include $(sort $(wildcard package/linux-tools/*.mk.in))
>   
> -# We only need the kernel to be extracted, not actually built
> -LINUX_TOOLS_PATCH_DEPENDENCIES = linux
> +# Prevent the kernel from being compiled in parallel with linux-tools. The
> +# kernel and some linux-tools (such as perf) use fixdep to manage kconfig
> +# dependencies. There is a race condition where the kernel and linux-tools try
> +# to build fixdep while the other tries to use fixdep, resulting in the use of
> +# fixdep failing.
> +LINUX_TOOLS_DEPENDENCIES = linux
>   
>   # Install Linux kernel tools in the staging directory since some tools
>   # may install shared libraries and headers (e.g. cpupower).
> 
> ---
> base-commit: 7336c5fa93a896130511d661f0d42359a046ec9a
> change-id: 20250409-fix_linux_tools_parallel-2323829caf82

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
