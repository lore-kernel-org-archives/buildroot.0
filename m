Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BF4C5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01FC160E50;
	Wed,  4 Jun 2025 18:25:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QiBaE9V5No-S; Wed,  4 Jun 2025 18:25:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12FC860E0B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12FC860E0B;
	Wed,  4 Jun 2025 18:25:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E1FEDA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8CB040084
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:25:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tTJJA58khn9a for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:25:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA9CB40050
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA9CB40050
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA9CB40050
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:25:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C58471C0198; Wed,  4 Jun 2025 20:25:29 +0200 (CEST)
Message-ID: <ae7ca193-9e5b-41ec-859b-5955ee326ede@rnout.be>
Date: Wed, 4 Jun 2025 20:25:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, thomas.perale@mind.be
References: <20250519140042.4019332-1-titouan.christophe@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250519140042.4019332-1-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749061530; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=30SlatGAP9Vl1swzoHqIxQ23MkUSNkaEnX6jHBDn81Y=;
 b=JEj7ckTlndJdFKCEqLBzblYTb6/JccP6bRkC/1ZXd5LSq5ALbl4vDbHvBILC/uTQY6LtVF
 s0pS8CXjNADMNCJaChTjCEQU6l1tQEX8PMQynQUtO1ls7GgakxOrRl+QiNDjU3x4sqiQWQ
 9oEYzLZi9A3O5ZjBCPzPJu9FV8K4wG8GdDcw5FuU5mhpf1w98bG0IWjikNJwXgDz70fT6M
 5gxHgfAXvBkvjS925HfXA2fxU/jucNDKsiOyAa7x4rI3TxuBoOO/4i2CNnSVNUmzX6v2oS
 7tSBUUYSsZfU0VVRE9PPyKpMHGfh/z4nYR35El617oaG9rYZm0+qE4f5Aw6AMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256 header.s=dkim
 header.b=JEj7ckTl
Subject: Re: [Buildroot] [PATCH] package/binutils: apply security patch for
 CVE-2025-3198
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



On 19/05/2025 16:00, Titouan Christophe via buildroot wrote:
> This fixes a memory leaks that affects both binutils 2.43 and 2.44,
> see https://www.cve.org/CVERecord?id=CVE-2025-3198
> 
> Fixes the following CVE:
> - CVE-2025-3198: A vulnerability has been found in GNU Binutils 2.43/2.44
>                   and classified as problematic. Affected by this
>                   vulnerability is the function display_info of the file
>                   binutils/bucomm.c of the component objdump.
>                   The manipulation leads to memory leak.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   .../2.43.1/0003-objdump-memleak.patch         | 31 +++++++++++++++++++
>   .../binutils/2.44/0003-objdump-memleak.patch  | 31 +++++++++++++++++++
>   package/binutils/binutils.mk                  |  3 ++
>   3 files changed, 65 insertions(+)
>   create mode 100644 package/binutils/2.43.1/0003-objdump-memleak.patch
>   create mode 100644 package/binutils/2.44/0003-objdump-memleak.patch
> 
> diff --git a/package/binutils/2.43.1/0003-objdump-memleak.patch b/package/binutils/2.43.1/0003-objdump-memleak.patch
> new file mode 100644
> index 0000000000..1b1632093d
> --- /dev/null
> +++ b/package/binutils/2.43.1/0003-objdump-memleak.patch
> @@ -0,0 +1,31 @@
> +From ba6ad3a18cb26b79e0e3b84c39f707535bbc344d Mon Sep 17 00:00:00 2001
> +From: Alan Modra <amodra@gmail.com>
> +Date: Wed, 19 Feb 2025 07:58:54 +1030
> +Subject: [PATCH] PR32716, objdump -i memory leak
> +
> +PR binutils/32716
> +* bucomm.c (display_info): Free arg.info.
> +
> +Upstream: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ba6ad3a18cb26b79e0e3b84c39f707535bbc344d
> +
> +CVE: CVE-2025-3198
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + binutils/bucomm.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/binutils/bucomm.c b/binutils/bucomm.c
> +index ccf54099154..d4554737db1 100644
> +--- a/binutils/bucomm.c
> ++++ b/binutils/bucomm.c
> +@@ -435,6 +435,7 @@ display_info (void)
> +   if (!arg.error)
> +     display_target_tables (&arg);
> +
> ++  free (arg.info);
> +   return arg.error;
> + }
> + 
> +--
> +2.43.5
> +
> diff --git a/package/binutils/2.44/0003-objdump-memleak.patch b/package/binutils/2.44/0003-objdump-memleak.patch
> new file mode 100644
> index 0000000000..1b1632093d
> --- /dev/null
> +++ b/package/binutils/2.44/0003-objdump-memleak.patch
> @@ -0,0 +1,31 @@
> +From ba6ad3a18cb26b79e0e3b84c39f707535bbc344d Mon Sep 17 00:00:00 2001
> +From: Alan Modra <amodra@gmail.com>
> +Date: Wed, 19 Feb 2025 07:58:54 +1030
> +Subject: [PATCH] PR32716, objdump -i memory leak
> +
> +PR binutils/32716
> +* bucomm.c (display_info): Free arg.info.
> +
> +Upstream: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ba6ad3a18cb26b79e0e3b84c39f707535bbc344d
> +
> +CVE: CVE-2025-3198
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + binutils/bucomm.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/binutils/bucomm.c b/binutils/bucomm.c
> +index ccf54099154..d4554737db1 100644
> +--- a/binutils/bucomm.c
> ++++ b/binutils/bucomm.c
> +@@ -435,6 +435,7 @@ display_info (void)
> +   if (!arg.error)
> +     display_target_tables (&arg);
> +
> ++  free (arg.info);
> +   return arg.error;
> + }
> + 
> +--
> +2.43.5
> +
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index fd6fc3de8d..2b5064d739 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -31,6 +31,9 @@ BINUTILS_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
>   BINUTILS_LICENSE_FILES = COPYING3 COPYING.LIB
>   BINUTILS_CPE_ID_VENDOR = gnu
>   
> +# 0003-objdump-memleak.patch
> +BINUTILS_IGNORE_CVES += CVE-2025-3198
> +
>   ifeq ($(BINUTILS_FROM_GIT),y)
>   BINUTILS_DEPENDENCIES += host-flex host-bison
>   HOST_BINUTILS_DEPENDENCIES += host-flex host-bison

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
