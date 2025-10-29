Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D71CCF9E9
	for <buildroot@archiver.kernel.org>; Wed, 29 Oct 2025 13:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A780F60F0A;
	Wed, 29 Oct 2025 13:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qugwCtx86Y7g; Wed, 29 Oct 2025 13:55:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D28DD60EFC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D28DD60EFC;
	Wed, 29 Oct 2025 13:55:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BFAD6708
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 13:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A20424060C
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 13:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Any8_B6AaCE9 for <buildroot@buildroot.org>;
 Wed, 29 Oct 2025 13:55:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5F3F640099
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F3F640099
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F3F640099
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 13:55:06 +0000 (UTC)
Received: from L25025.local (unknown [213.36.7.12])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 71F585FFBA;
 Wed, 29 Oct 2025 14:54:57 +0100 (CET)
Date: Wed, 29 Oct 2025 14:54:57 +0100
To: Leo Yu-Chi Liang <ycliang@andestech.com>
Cc: buildroot@buildroot.org, tim609@andestech.com
Message-ID: <vqod7vwg76gzuo6bzp5jfb5mltauigzwv4aflzt35lakge6g6u@w6lomwzuua43>
References: <20251027033242.1797230-1-ycliang@andestech.com>
 <20251027033242.1797230-4-ycliang@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251027033242.1797230-4-ycliang@andestech.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761746103;
 bh=Ql6EFvT0PqhDhVuL8YQeCSRoCc4Hs868n//sgEg804M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ACh7NMF3EcraaD9AQMIVj5AGIG76/7PsBKlFZs89shAlLzgsDZcFI/+KN8qefPGnt
 EqfaFF/cFaN+IUBSXe40lABKeUqo4KSGPMd1Pe4A3KnLBdqMNj325b7sAyb6P9Lx7w
 3vHDcr3inDVWbUbhM4NPAhPi+lrlc3ngro3bYnAxItwsfY3SSW/a/OiL7Url14Sk7q
 XRAX4PK9UkTf041NVNhJgHSMsgrXsURCMvKvN897Ht5wTqgTj0YS1RpiO7NutPgPDo
 JlHTK4hkij1NIYBy5XoZv5ZEoOuTBHFTQu7iisJRJ4YT1ho70qNF84uw/sfYOQpXaV
 o9/BC/Csy3PdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ACh7NMF3
Subject: Re: [Buildroot] [PATCH 3/4] configs/andes_ae350_45_defconfig: bump
 to opensbi v1.5
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Leo,

On Mon, Oct 27, 2025 at 11:32:41AM +0100, Leo Yu-Chi Liang wrote:
> This bumps opensbi to v1.5 and add proper hash file.
> 
> -BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,riscv,opensbi,22f38ee6c658a660083aa45c4ec6c72f66a17260)/opensbi-22f38ee6c658a660083aa45c4ec6c72f66a17260.tar.gz"
> -BR2_TARGET_OPENSBI_PLAT="andes/ae350"
> +BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
> +BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.5"

Why using opensbi 1.5 knowing that the latest tag is 1.7 ?
  https://github.com/riscv-software-src/opensbi/tags
that was released last June.

> +BR2_TARGET_OPENSBI_PLAT="generic"

Nice that generic can be used.

Best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
