Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57041CCF9F8
	for <buildroot@archiver.kernel.org>; Sat,  1 Nov 2025 10:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA1DB61C87;
	Sat,  1 Nov 2025 10:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FTG8bS5UAW6u; Sat,  1 Nov 2025 10:47:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4FDA61C7F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4FDA61C7F;
	Sat,  1 Nov 2025 10:47:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E2543964
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 10:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC7C34229E
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 10:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qcDltZJ0XDB7 for <buildroot@buildroot.org>;
 Sat,  1 Nov 2025 10:47:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A93564184E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A93564184E
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A93564184E
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 10:47:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id AD1B219F54D;
 Sat,  1 Nov 2025 11:47:12 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Nov 2025 11:47:12 +0100
MIME-Version: 1.0
Date: Sat, 01 Nov 2025 11:47:12 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20251031222254.2654876-1-bernd@kuhls.net>
References: <20251031222254.2654876-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <0ec4d47557204fb18c33feeafca36ad5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761994034;
 bh=eiyTnhBDGZrFtRQciGC5niusMF3G0Ixg0ItxUooZH9k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=peoDADTfYBCP6F72BHuSPrp8UTUiZeQS+i0UgN04bUjbwzxBb+2vTl1O+jNIy5Hq1
 b+idPRDl//u6sHmfiEAAydRU6YbFKkjP9pr4H/faYitI4V7SHqtVmKUk7c5RCEEYwA
 XXCzTtneKXPXz+E85xeCh3D8v92JWuZfXYK9rNaQYMyYsiUANxXC0l6X8ocvAdgL+4
 XKPpgzYVBON8vATAlzo7BW0+n4JmNib2lgCJsUlaMXD5JrPX5Memq3UgFxzDKq5eJK
 TfXJlwlhhGU2ZQgQLTPALRWjFhhu2N9ltqtPMKTKJjD+y/26KUfQvQPlbuOUon9AIc
 TBl/K7i6ADqZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=peoDADTf
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: bump version to 4.99
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

Hi Bernd,

Thanks for the patch.

On 31/10/2025 23:22, Bernd Kuhls wrote:
> Release notes:
> https://lists.exim.org/lurker/message/20251028.114149.3bf19800.en.html
> 
> Rebased patch 0001 due to upstream commit
> https://github.com/Exim/exim/commit/cd43f5ee0f7f76f0d624899f892b10eb5f40a37c
> 
> Rebased patch 0004 due to upstream commit
> https://github.com/Exim/exim/commit/834dae55650eb31b893242b9d50b477f5a339bf5
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/exim/0001-Build-buildconfig-for-the-host.patch | 6 +++---
>  package/exim/0004-sieve-fix-build-errors.patch         | 8 ++++----
>  package/exim/exim.hash                                 | 4 ++--
>  package/exim/exim.mk                                   | 2 +-
>  4 files changed, 10 insertions(+), 10 deletions(-)
[...]
> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
> index 3afe553caa..d185571393 100644
> --- a/package/exim/exim.mk
> +++ b/package/exim/exim.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -EXIM_VERSION = 4.98.2
> +EXIM_VERSION = 4.99

This new version is introducing build failures. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2134120759

Could you have a look, please?

>  EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
>  EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
>  EXIM_LICENSE = GPL-2.0+
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
