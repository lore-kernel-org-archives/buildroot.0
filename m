Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102D6C2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 13:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF558608CC;
	Sun,  4 Jan 2026 13:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Grk50Cm-3bJz; Sun,  4 Jan 2026 13:07:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 539D8607D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767532027;
	bh=IUQ/sKx3//g+J+f1IspS91cx/cRTGpV9415lfnYbJwc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aefm1IOfOQ3yEa3sZF8Bddm5AXIikJ4pocwXlkyQBHVutRkN/UvQWg+eiBu+9nMgc
	 QEHZO9HlsWhW8Tj0284d6LAPTsqFD1F1bRZuFIY7cw3rsxYol8R2yEF7MzYBjmD+dH
	 tuk0iiZQq6CudfTg1lMu8O9wX8BjwU36Tt7JzMtv5psFG5+6Jb762XS4n3mcusAE7L
	 0wLyBuZyfelRNLGgDZCmkTW2sogQpFT+A5pvG/LxIYbAy/vff98jUS/c7vMym1/9K4
	 FN0B8QKeDnHsUPkG3ZXcw79dw5qvYH9qo40N1Q269MRa/B885asFRtdxxRiJdagMCh
	 JWQJq4fLDLF4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 539D8607D0;
	Sun,  4 Jan 2026 13:07:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FDDB2DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0227D80CCA
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VPJtIHJdHe8R for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 13:07:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4067380CB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4067380CB6
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4067380CB6
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:07:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 162727803A2;
 Sun,  4 Jan 2026 14:07:01 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 04 Jan 2026 14:07:00 +0100
MIME-Version: 1.0
Date: Sun, 04 Jan 2026 14:07:00 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Adam Duskett <adam.duskett@amarulasolutions.com>
In-Reply-To: <20260103224330.2933161-1-thomas.petazzoni@bootlin.com>
References: <20260103224330.2933161-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <bb4b6290bb22c20ac163b48c6fd6a534@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767532023;
 bh=/lmqUyunjOj+KIUxQ+0IetxhqWfb4sXbXaszYn//Yps=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NW2mXDvdpr/bkrzAGFCjmCpNK4LkgdO1x7K7mFKl6KGArk9qngz9pxSpa6VXaM0N7
 hcSdHjMmSQkg7oKC7gdMrSj0FW53ql087d1qMrd8J1SRdSjn1CdETkL+n/ShewVM1j
 4VoXZ1aB2ACyinBWjFScg0txzQNNkyzlfo5fMdQ73O4qHGbYpfyAQxnnzCyMVCOZB1
 pkD4axukD5raK5/KlMR61bDxbUjwu88KirMs14+2wRdBVV3LpYrXZzR2BCRFRTyWNG
 L1Df9VM6IOLOI6y2mKr94ZBwBuhEiD5Dc2Syt2QtHjJytn/CDp//DqUFvu+FmnkWNl
 iMckcYRnNShww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NW2mXDvd
Subject: Re: [Buildroot] [PATCH 01/11] package/mender-update-modules: fix
 kernel header dependency
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 03/01/2026 23:43, Thomas Petazzoni via buildroot wrote:
> Commit f933a165e2ee2ee775c7fa0824d2bfcfa9545f88 ("package/podman:
> raise kernel header requirement to v4.14") raised the kernel headers
> dependency of podman from 3.17 to 4.14, but forgot to propagate this
> change to the mender-update-modules podman option, causing the
> following kconfig warning:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_PODMAN
>   Depends on [n]: BR2_USE_MMU [=y] && 
> BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS [=y] && 
> BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=y] && 
> BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS [=y] && 
> BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS [=y] && 
> BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 [=n] && BR2_TOOLCHAIN_HAS_THREADS 
> [=y] && BR2_USE_WCHAR [=y]
>   Selected by [y]:
>   - BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN [=y] && 
> BR2_PACKAGE_MENDER_UPDATE_MODULES [=y] && BR2_USE_MMU [=y] && 
> BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS [=y] && 
> BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=y] && 
> BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS [=y] && 
> BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS [=y] && 
> BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 [=y] && BR2_TOOLCHAIN_HAS_THREADS 
> [=y] && BR2_USE_WCHAR [=y]
> 
> Fix this by properly propagating the dependency.
> 
> Fixes: f933a165e2ee2ee775c7fa0824d2bfcfa9545f88 ("package/podman: raise 
> kernel header requirement to v4.14")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
