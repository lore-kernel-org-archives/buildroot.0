Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C47C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 20:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94AD761072;
	Tue, 15 Apr 2025 20:10:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bM3AUYgGH4jw; Tue, 15 Apr 2025 20:10:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D9F560E83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D9F560E83;
	Tue, 15 Apr 2025 20:10:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CE27108
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6238A80BC9
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D1ijYJb9H5y7 for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 20:10:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 46AED80301
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46AED80301
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46AED80301
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 20:10:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 389C419F57B;
 Tue, 15 Apr 2025 22:09:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 15 Apr 2025 22:09:56 +0200
Date: Tue, 15 Apr 2025 22:09:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
Message-ID: <Z_69FJoxJcpxeL7f@landeda>
References: <20250415200047.2256467-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250415200047.2256467-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744747799;
 bh=Hlb2q4okcNlHoHVALhB9KqddQQJg+X8X306f2Z4uHp4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P3rYq/mCUcHTIqn7/q4UGD3VBRporLiaY2emryEXE8VHdTMJtN3xEcJy7cAhXePRX
 XDogGq4RS8H2uQTPVKjd9aii1xcO9k1KMZ4do8kJNRzrd249pVr7XaqZGVEh5ReQL3
 PdwNw/A0zoKjyziUoU6UzDHFtYyOoadZ2SdvR+kcUvNb53H9hjRD1GAMc6SnVCizlX
 /POhjqSuvILLLURmdyJFNpJtwVDB3HxviHF8it2YIukzyRuj/RTxjSQ0Q3+K4QZQ9/
 KszdMiOIWsBnF31bSNY3davXMmTJUJZFX21VUBYNUmNN8JpfUijmep7T2lbgE4MA+q
 xqyeKEI7U2Z3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=P3rYq/mC
Subject: Re: [Buildroot] [PATCH 1/2] package/libopenssl: add (proposed)
 upstream fix for parallel installation
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

Peter, All,

On 2025-04-15 22:00 +0200, Peter Korsgaard spake thusly:
> The openssl developers have proposed a fix for the parallel installation
> issue worked around by commit 27ab880ebb9a (package/libopenssl do not build
> in parallel).
> 
> Add the fix here so the workaround can dropped again.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  ...l-process-to-avoid-multiple-make-dep.patch | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
> 
> diff --git a/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch b/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
> new file mode 100644
> index 0000000000..feb0e21ef7
> --- /dev/null
> +++ b/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
> @@ -0,0 +1,44 @@
> +From 4562b002366535b3d387fae7fa1dbd8e315ae142 Mon Sep 17 00:00:00 2001
> +From: Neil Horman <nhorman@openssl.org>
> +Date: Mon, 14 Apr 2025 12:23:15 -0400
> +Subject: [PATCH] Serialize install process to avoid multiple make depend
> + operations
> +
> +If make install is run with a large -j value (make install -j N , where
> +N > 1)
> +
> +We can run into a situation in which the install fails because multiple
> +make depend operations are running in parallel, which will fail due to
> +makefile rewriting.
> +
> +Serialize the install process to guarantee that those operations don't
> +step on one another
> +
> +Fixes # 27074
> +
> +Upstream: https://github.com/openssl/openssl/pull/27388
> +Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> +---
> + Configurations/unix-Makefile.tmpl | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
> +index e85763ccf8..b671723813 100644
> +--- a/Configurations/unix-Makefile.tmpl
> ++++ b/Configurations/unix-Makefile.tmpl
> +@@ -650,7 +650,11 @@ depend: Makefile
> + # Install helper targets #############################################
> + ##@ Installation
> + 
> +-install: install_sw install_ssldirs {- "install_docs" if !$disabled{docs}; -} {- $disabled{fips} ? "" : "install_fips" -} ## Install software and documentation, create OpenSSL directories
> ++install: Makefile ## Install software and documentation, create OpenSSL directories
> ++	$(MAKE) install_sw
> ++	$(MAKE) install_ssldirs
> ++	{- "\$(MAKE) install_docs" if !$disabled{docs} -}
> ++	{- "\$(MAKE) install_fips" if !$disabled{fips} -}
> + 
> + uninstall: {- "uninstall_docs" if !$disabled{docs}; -} uninstall_sw {- $disabled{fips} ? "" : "uninstall_fips" -} ## Uninstall software and documentation
> + 
> +-- 
> +2.39.5
> +
> -- 
> 2.39.5
> 

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
