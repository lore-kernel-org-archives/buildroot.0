Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A958CD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 14:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C212F60672;
	Mon,  1 Apr 2024 14:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qmw6vUkNPOaE; Mon,  1 Apr 2024 14:30:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C64BA607CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C64BA607CE;
	Mon,  1 Apr 2024 14:30:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A6D21BF33E
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 14:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07AA3607CE
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 14:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H0l1PzewIrMa for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 14:30:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D1A4460672
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1A4460672
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1A4460672
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 14:30:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2C14313F88E;
 Mon,  1 Apr 2024 16:30:04 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Apr 2024 16:30:03 +0200
Date: Mon, 1 Apr 2024 16:30:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZgrE6yGlqlGP7XoG@landeda>
References: <20240331202326.177980-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240331202326.177980-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711981806;
 bh=AiPj6ToJ5xEuG/34BVmhwS8uUTeyQD8TA5C5y3+7Cqc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mSuoajCJzMIoeKTE/tBx+D9eaTPkc6lEJ9CS7QKfLlS41g/A6W/tAUMiXs2Z4XhNa
 EDs9XPjblEeWvem6GgY8bnk5ySEeqtdETQZ+k8Pwv4jNUZ4nA1b+trKkjWWzsaOhul
 fUdwXU9q54vdhNEr14CGYBlUIlzUhsPQDeWjVZ2kh6iiEauOhJRbLPc/OJJV/P9tXn
 fPmvVr481VOyHrUT8aPxTuvjhqAjqxUi1hzZLztIoVziDisebSgaYIWbiRYe5W4hb/
 Y2+SSQr3DsXxRms5b+OJ2Fj/sXOPOLgK1aaHFDkN2W2GZQL/8ay7zrzj+idXlTtxEF
 lys/NX2ILa3sQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mSuoajCJ
Subject: Re: [Buildroot] [PATCH 1/1] package/ed: bump to version 1.20
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

Julien, All,

On 2024-03-31 22:23 +0200, Julien Olivain spake thusly:
> See release announce:
> https://lists.gnu.org/archive/html/bug-ed/2024-01/msg00000.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ed/ed.hash | 4 ++--
>  package/ed/ed.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ed/ed.hash b/package/ed/ed.hash
> index 007f645f513..5deb5e74efc 100644
> --- a/package/ed/ed.hash
> +++ b/package/ed/ed.hash
> @@ -1,4 +1,4 @@
> -# From https://lists.gnu.org/archive/html/bug-ed/2023-01/msg00000.html
> -sha256  ce2f2e5c424790aa96d09dacb93d9bbfdc0b7eb6249c9cb7538452e8ec77cd48  ed-1.19.tar.lz
> +# From https://lists.gnu.org/archive/html/bug-ed/2024-01/msg00000.html
> +sha256  c6030defe6ae172f1687906d7354054c75a6a9130af319d4e73c50a91959c5a6  ed-1.20.tar.lz
>  # Locally calculated
>  sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
> diff --git a/package/ed/ed.mk b/package/ed/ed.mk
> index a90d1f005e9..edfadf02a64 100644
> --- a/package/ed/ed.mk
> +++ b/package/ed/ed.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ED_VERSION = 1.19
> +ED_VERSION = 1.20
>  ED_SITE = $(BR2_GNU_MIRROR)/ed
>  ED_SOURCE = ed-$(ED_VERSION).tar.lz
>  ED_LICENSE = GPL-2.0+
> -- 
> 2.44.0
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
