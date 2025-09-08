Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265ACCA1013
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F252D61436;
	Mon,  8 Sep 2025 10:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSSaWa5yGWAv; Mon,  8 Sep 2025 10:39:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16B1E615A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16B1E615A5;
	Mon,  8 Sep 2025 10:39:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E8FA91D9
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB24884A95
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GZlYM1tFnjQn for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:39:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D8F9F83F0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8F9F83F0E
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8F9F83F0E
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7C9D5B9785B8; Mon,  8 Sep 2025 12:39:41 +0200 (CEST)
Message-ID: <9fc07256-8fa9-4029-b2e2-e04e61f8d582@rnout.be>
Date: Mon, 8 Sep 2025 12:39:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
References: <20250904174539.596715-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250904174539.596715-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1757327981; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=CBrArom+bQU8gJkhBVegsq5gXwB6bsa/4vSdawnxLr4=;
 b=Vxbsk+8FS77jm0l6Yq2nfvGhKp+0gFPvSmzBak1V9VIw5hiK1d0Mx+oJAiUQhjxb2Gi6hv
 5296c8qxkiZhDb9d70/Qry/Tc/KJVX19g+FONOazDuocVRXI5OlQNVwUkiYON1EPQcTFmi
 1Ug5CwNNPFl4T4b6CSotGVkNd1qnIId9CpWaqF8D5FprCB2tSSJ/nh3a4i3OEj5COPD8eZ
 Q8CsAGff+FKPhVKiN8M3vBTY/mXnPsA4QGVqhZtdcUGDt79Dpv2QgYxNPnCSMHF97bLA1W
 YyadZQvRjbEEuhY4odj5FmQge3tkMrP2wdXgbNROrLF7QX1ODvtzuYmeOXm33Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Vxbsk+8F
Subject: Re: [Buildroot] [2025.02.x,
 PATCH 1/1] package/ipset: fix build w/ musl
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



On 04/09/2025 19:45, Thomas Perale via buildroot wrote:
> When building ipset with musl libc the following error appeared on the
> autobuilder in 2025.02.x:
> 
> ```
> ipset.c: In function 'main':
> ipset.c:35:21: error: implicit declaration of function 'basename' [-Wimplicit-function-declaration]
>     35 |         if (!strcmp(basename(argv[0]), "ipset-translate")) {
>        |                     ^~~~~~~~
> ipset.c:35:21: error: passing argument 1 of 'strcmp' makes pointer from integer without a cast [-Wint-conversion]
>     35 |         if (!strcmp(basename(argv[0]), "ipset-translate")) {
>        |                     ^~~~~~~~~~~~~~~~~
>        |                     |
>        |                     int
> In file included from ipset.c:13:
> ```
> 
> This error can be reproduced with:
> 
> ```
> cat >.config <<EOF
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE=y
> BR2_PACKAGE_IPSET=y
> EOF
> make olddefconfig
> make ipset
> ```
> 
> This patch adds the upstream commit [1], that fixes this issue by
> including explicitely `libgen.h`. This patch is part of the master
> branch since commit [2].
> 
> [1] https://git.netfilter.org/ipset/commit/?id=316f592ddc547c28388da4e7cb7c5c8f89cd3591
> [2] 8fdbbefa08 package/ipset: bump to version 7.23
> 
> Fixes: https://autobuild.buildroot.org/results/930/930802ecc324c4cfc697191aa6a68642a4188e7b
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   ...cit-declaration-of-function-basename.patch | 31 +++++++++++++++++++
>   1 file changed, 31 insertions(+)
>   create mode 100644 package/ipset/0001-ipset-fix-implicit-declaration-of-function-basename.patch
> 
> diff --git a/package/ipset/0001-ipset-fix-implicit-declaration-of-function-basename.patch b/package/ipset/0001-ipset-fix-implicit-declaration-of-function-basename.patch
> new file mode 100644
> index 0000000000..c01fdaf671
> --- /dev/null
> +++ b/package/ipset/0001-ipset-fix-implicit-declaration-of-function-basename.patch
> @@ -0,0 +1,31 @@
> +From 316f592ddc547c28388da4e7cb7c5c8f89cd3591 Mon Sep 17 00:00:00 2001
> +From: Mike Pagano <mpagano@gentoo.org>
> +Date: Fri, 30 Aug 2024 11:31:19 -0400
> +Subject: ipset: Fix implicit declaration of function basename
> +
> +basename(3) is defined in libgen.h in MUSL.
> +Include libgen.h where basename(3) is used.
> +
> +Signed-off-by: Mike Pagano <mpagano@gentoo.org>
> +Acked-by: Phil Sutter <phil@nwl.cc>
> +Signed-off-by: Jozsef Kadlecsik <kadlec@netfilter.org>
> +Upstream: https://git.netfilter.org/ipset/commit/?id=316f592ddc547c28388da4e7cb7c5c8f89cd3591
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/ipset.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/ipset.c b/src/ipset.c
> +index 162f477..d7733bf 100644
> +--- a/src/ipset.c
> ++++ b/src/ipset.c
> +@@ -15,6 +15,7 @@
> + #include <config.h>
> + #include <libipset/ipset.h>		/* ipset library */
> + #include <libipset/xlate.h>		/* translate to nftables */
> ++#include <libgen.h>
> +
> + int
> + main(int argc, char *argv[])
> +--
> +cgit v1.2.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
