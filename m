Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A94C61DD6
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 20:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 501124084D;
	Tue,  1 Sep 2026 20:48:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yAGuScyyC1dz; Tue,  1 Sep 2026 20:48:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788295698;
	bh=n7YpFY4kgjjetET8h0bS7RO3ld5Dnjj9XOzMV5LbcUo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Kr77Env1SF5fm6KJz2A13Lx5yN0LqfmbmIrfs2OX5lEm01gWC8wqZYgmujF5nlzh9
	 KEDg6a0vC5zuvD+NYeEfPkU+bHYuKZaCgdAOoeJMAmuyP/hPZC6qnfWwkj0vBlpdFa
	 FSlvGgBqN1ay8D6oq1SuJyyvx8tsm7FzoTdm070Z5SzPqJYkly3/aE85yrI482C1j0
	 JtcAp78OfWV9oRBYQ9othxCBE+YhdK/bFdncVo8hguyxAkLrdMmRBf2Sw2rugwNsUx
	 jAa+Bn5XJiLqK5ozdoesTDOBkfs1TgaS4F3caGW8AfXUroVaB/y2Bvf+0t7tAFqVaq
	 6I2/gkUnoF2Ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A25894077E;
	Tue,  1 Sep 2026 20:48:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CE0B2FD
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 20:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A8EB4077E
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 20:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gcyxJpU4CdUA for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 20:48:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A103140746
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 20:48:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4494D13F86E;
 Tue,  1 Sep 2026 22:48:12 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 01 Sep 2026 22:48:12 +0200
MIME-Version: 1.0
Date: Tue, 01 Sep 2026 22:48:12 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260901192724.1021544-1-peter@korsgaard.com>
References: <20260901192724.1021544-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <ec4ac307d4302d02182457be822cfb6c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/libgcrypt: bump version to 1.2.3
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

Hi Peter,

The commit title says "1.2.3" but should rather be "1.12.3".

On 01/09/2026 21:27, Peter Korsgaard wrote:
> Release notes:
> https://lists.gnu.org/archive/html/info-gnu/2026-08/msg00007.html
> 
> Contains a number of bugfixes, some of which may have (low severity)
> security impact.  As stated by Werner Koch:
> 
>  All in all we received 26 reports alone from ANSSI but as even the 
> reporter
>  mentioned, the real world attack severity is not critical.  Thus we 
> don't
>  consider 1.12.3 a security fix release.  There are some bugs which 
> should
>  be fixed to avoid crashes, and thus may lead to DoS.  However, 16384 
> bit
>  RSA keys can also be used for a practical DoS; it all depends on your 
> use
>  case.
> 
> https://www.openwall.com/lists/oss-security/2026/08/31/11
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
[...]
> diff --git a/package/libgcrypt/libgcrypt.mk 
> b/package/libgcrypt/libgcrypt.mk
> index 0bc281da42..a49897fd4f 100644
> --- a/package/libgcrypt/libgcrypt.mk
> +++ b/package/libgcrypt/libgcrypt.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LIBGCRYPT_VERSION = 1.12.2
> +LIBGCRYPT_VERSION = 1.12.3

Also, this new version introduces build failures:
https://gitlab.com/jolivain/buildroot/-/pipelines/2810830147

For reference, the previous version 1.12.2 passes test-pkg:
https://gitlab.com/jolivain/buildroot/-/pipelines/2810888453

Since those fixes are described as low severity, we should probably
fix those before merging this bump.

>  LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
>  LIBGCRYPT_LICENSE = LGPL-2.1+
>  LIBGCRYPT_LICENSE_FILES = COPYING.LIB
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
