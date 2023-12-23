Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C64AC3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 10:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D51B68386F;
	Sat, 23 Dec 2023 10:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D51B68386F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nfr1cOqDqeTJ; Sat, 23 Dec 2023 10:45:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 037CE835C6;
	Sat, 23 Dec 2023 10:45:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 037CE835C6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ADEF91BF408
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 10:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92B79401F1
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 10:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92B79401F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jwYD4XTGBUh7 for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 10:45:51 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15C3E400CE
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 10:45:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15C3E400CE
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 231B7B00565;
 Sat, 23 Dec 2023 11:45:46 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Dec 2023 11:45:45 +0100
Date: Sat, 23 Dec 2023 11:45:45 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Grant Nichol <me@grantnichol.com>
Message-ID: <ZYa6WSx5hDT5O7U_@landeda>
References: <f76c97b6-857a-45d3-b690-5ebe3caba4ef@grantnichol.com>
 <20231223070730.2417463-1-me@grantnichol.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231223070730.2417463-1-me@grantnichol.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703328348;
 bh=eEy23z8Mg5bhfJsXyMtdPKNetkXNSk2Ez84t7T4Jgg8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tsm8qyfn+UHoW/7PGBQ9q32aOR1yzdH5vElYVsjrR9WnLVYNPvtDLawKsdSIVVaQJ
 ivAgjiK8MUTEusB3tRpH2AsUVDulGlIzjyggvUn0aOEtnpSwqYf9J63ClC/4I34j5X
 Gi8Kuh0VYIffyn1f+BXFTMCqt+GfAfsX1mcyNmCbKIu5SKcmx3LtamPN53b6FLyetd
 tS/FA4EXwXgeZLkLKc4qDxgwh/0fIUU8Q+P0/DcX0r+Y70yXBDg5jkXz13tTCOGmeg
 1IKOLOOE7VKPFySVwp5VnQeHlfMVXhaYsUG2S4jO4iyl3Yv7208ENchYrnTOHQdHVe
 BBLsZ2r6fJjDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tsm8qyfn
Subject: Re: [Buildroot] [PATCH v2 2/2] package/libopenssl: Patch for
 riscv32 builds
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Grant, All,

On 2023-12-23 01:07 -0600, Grant Nichol spake thusly:
> Fixes a mispelling in upstream causing builds for riscv32 to fail when
> linking.

This whould have been submitted in the same patch that adds the riscv
specific target. Otherwise, if we only applied the first, the build
would be known-broken; furthermore, that also breaks bisectability.

So, I squashed the two changes together, and applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Grant Nichol <me@grantnichol.com>
> ---
> Changes v1 -> v2:
>   - Adding missing signoff in the patch file.
> 
>  ...x-mispelling-of-extension-test-macro.patch | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/libopenssl/0004-riscv-Fix-mispelling-of-extension-test-macro.patch
> 
> diff --git a/package/libopenssl/0004-riscv-Fix-mispelling-of-extension-test-macro.patch b/package/libopenssl/0004-riscv-Fix-mispelling-of-extension-test-macro.patch
> new file mode 100644
> index 0000000000..93b191a61c
> --- /dev/null
> +++ b/package/libopenssl/0004-riscv-Fix-mispelling-of-extension-test-macro.patch
> @@ -0,0 +1,30 @@
> +From 68c549df05892c16b99603b9a831c79c540f268c Mon Sep 17 00:00:00 2001
> +From: Grant Nichol <me@grantnichol.com>
> +Date: Fri, 22 Dec 2023 23:46:39 -0600
> +Subject: [PATCH] riscv: Fix mispelling of extension test macro
> +
> +When refactoring the riscv extension test macros,
> +RISCV_HAS_ZKND_AND_ZKNE was mispelled.
> +
> +Upstream: https://github.com/openssl/openssl/pull/23139
> +Signed-off-by: Grant Nichol <me@grantnichol.com>
> +---
> + providers/implementations/ciphers/cipher_aes_xts_hw.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/providers/implementations/ciphers/cipher_aes_xts_hw.c b/providers/implementations/ciphers/cipher_aes_xts_hw.c
> +index b35b71020e..65adc47d1f 100644
> +--- a/providers/implementations/ciphers/cipher_aes_xts_hw.c
> ++++ b/providers/implementations/ciphers/cipher_aes_xts_hw.c
> +@@ -285,7 +285,7 @@ static const PROV_CIPHER_HW aes_xts_rv32i_zbkb_zknd_zkne = {                   \
> + # define PROV_CIPHER_HW_select_xts()                                           \
> + if (RISCV_HAS_ZBKB_AND_ZKND_AND_ZKNE())                                        \
> +     return &aes_xts_rv32i_zbkb_zknd_zkne;                                      \
> +-if (RISCV_HAS_ZKND_ZKNE())                                                     \
> ++if (RISCV_HAS_ZKND_AND_ZKNE())                                                     \
> +     return &aes_xts_rv32i_zknd_zkne;
> + # else
> + /* The generic case */
> +--
> +2.43.0
> +
> --
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
