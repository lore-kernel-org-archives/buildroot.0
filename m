Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B935BCCD1BB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 909AF6121B;
	Wed, 22 Oct 2025 16:42:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8JQjs5zzUWoe; Wed, 22 Oct 2025 16:42:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B757161233
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B757161233;
	Wed, 22 Oct 2025 16:42:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 456BFDE
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3731C40B5B
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id afNsqMiW1Ixl for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:42:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3E22940400
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E22940400
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E22940400
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:42:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D794EB979192; Wed, 22 Oct 2025 18:42:45 +0200 (CEST)
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:42:44 +0200
Message-ID: <20251022164244.285575-1-arnout@rnout.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006083326.889345-1-aperez@igalia.com>
References: <20251006083326.889345-1-aperez@igalia.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1761151366; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=ELFhJC5jH7b/HgXsp5PEjRIjuEu+HQ7XbknfU1M5/Qc=;
 b=Wr+XPafNi1ea+sa4mwunQJEGE0t86X5Y1oYyQwpUD7U5iHCheDP6/uIGi2hNxCLVtBz3rF
 EJyA6DABIFCLVgsSjKeGuBBA3hyfdEd7MxKoZVOfJKxel5xgpWUIBEBwsXlgiwTcMwZzW8
 zA5kxtjH/MjOeglxtDYQ/2jcH43h15eJ7RYNakjgGkRABmzaBetp7w+f4VHNkXgCsVqbDh
 qDCW1YYFpPI4bHM1PHKxEpGsz/fhg3Csz4anISD6zpT79SN7mQFtCr322+XKD1cqjIjdKr
 wJ2Mkgz5p7+ZB/0DNbIN6GFSjCSvPMJ3Jhyfaf9fNM3CC6gVnJhrRfbK4TDenA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Wr+XPafN
Subject: Re: [Buildroot] [PATCH] package/libwpe: bump to version 1.16.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The main fix is being able to compile with CMake 4.x.
> 
> Release notes:
> https://wpewebkit.org/release/libwpe-1.16.3.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  package/libwpe/libwpe.hash | 8 ++++----
>  package/libwpe/libwpe.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/libwpe/libwpe.hash b/package/libwpe/libwpe.hash
> index 45bba04d35..1c88105e48 100644
> --- a/package/libwpe/libwpe.hash
> +++ b/package/libwpe/libwpe.hash
> @@ -1,7 +1,7 @@
> -# From https://wpewebkit.org/releases/libwpe-1.16.2.tar.xz.sums
> -md5  689306c9baf6f8d6844146a5c84fc932  libwpe-1.16.2.tar.xz
> -sha1  499b62ddd3c1becaffc3b344ff5131c37d527144  libwpe-1.16.2.tar.xz
> -sha256  960bdd11c3f2cf5bd91569603ed6d2aa42fd4000ed7cac930a804eac367888d7  libwpe-1.16.2.tar.xz
> +# From https://wpewebkit.org/releases/libwpe-1.16.3.tar.xz.sums
> +md5  a26e3703d2a35ba3e57436cd6b76a656  libwpe-1.16.3.tar.xz
> +sha1  969897ea9b908f92ef0b4f6feaaec74f23425c39  libwpe-1.16.3.tar.xz
> +sha256  c880fa8d607b2aa6eadde7d6d6302b1396ebc38368fe2332fa20e193c7ee1420  libwpe-1.16.3.tar.xz
>  
>  # Hashes for license files:
>  sha256  35bef295cedbbf179eaee14328002587a0e7dc08ebf3f15ea080a6f2815f0d7b  COPYING
> diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
> index 5721b83784..d8d2caa08a 100644
> --- a/package/libwpe/libwpe.mk
> +++ b/package/libwpe/libwpe.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  # The middle number is even for stable releases, odd for development ones.
> -LIBWPE_VERSION = 1.16.2
> +LIBWPE_VERSION = 1.16.3
>  LIBWPE_SITE = https://wpewebkit.org/releases
>  LIBWPE_SOURCE = libwpe-$(LIBWPE_VERSION).tar.xz
>  LIBWPE_INSTALL_STAGING = YES
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
