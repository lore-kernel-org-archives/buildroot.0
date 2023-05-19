Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B256AC77B7D
	for <buildroot@archiver.kernel.org>; Fri, 19 May 2023 03:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCC934031F;
	Fri, 19 May 2023 03:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCC934031F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZvRHKB-cvwdY; Fri, 19 May 2023 03:23:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B214A4026E;
	Fri, 19 May 2023 03:23:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B214A4026E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C9BD1BF4DA
 for <buildroot@lists.busybox.net>; Fri, 19 May 2023 03:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1105940253
 for <buildroot@lists.busybox.net>; Fri, 19 May 2023 03:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1105940253
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3JvKTqwN7EVi for <buildroot@lists.busybox.net>;
 Fri, 19 May 2023 03:23:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1833B401C3
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1833B401C3
 for <buildroot@buildroot.org>; Fri, 19 May 2023 03:23:13 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 34B9E440F4F;
 Fri, 19 May 2023 06:22:55 +0300 (IDT)
References: <20230518210657.1287204-1-paul@crapouillou.net>
User-agent: mu4e 1.9.21; emacs 28.2
To: Paul Cercueil <paul@crapouillou.net>
Date: Fri, 19 May 2023 06:19:03 +0300
In-reply-to: <20230518210657.1287204-1-paul@crapouillou.net>
Message-ID: <87pm6xvwbm.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1684466575;
 bh=1WIgvcfZVQIm51V9klLHrWz77mAILq8VPetTJsXjeek=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=pNXP3vOWwyJAOCZt+4kXUMEf/KOwht/oqxNz6FE8zfB8pLF6svSM7MImQMMNpjhEO
 9jed/YghFD3uPmtdzdswvMjpjrhVcAGkaqQNyE591h06Ean14s/dnoTvbhbyEvk7Hf
 +nPFf4049JcLYLAhv9TdZCu9XpQN1ej4A1Ead5X/7jmzHEKGjWccCCi8fcFwADkS8V
 pa4n7XN5GpPx7dbK1GaR6wO7J6Wo8NwSY6VYBovvTLZb4oP5alQd01nWiy5kkrPFBH
 8mCeKwFsNl5GJZmX8h5FacUjd4WRb30uQJlIU083Inw1h4XoU1uYIY/emIEgyQMfUW
 5vm1Xo/WRrcQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=pNXP3vOW
Subject: Re: [Buildroot] [PATCH 1/1] package/strace: bump to version 6.3
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Paul,

On Thu, May 18 2023, Paul Cercueil wrote:

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  package/strace/strace.hash | 2 +-
>  package/strace/strace.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/strace/strace.hash b/package/strace/strace.hash
> index d49abf1f16..de2f8c52b9 100644
> --- a/package/strace/strace.hash
> +++ b/package/strace/strace.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
>  # https://strace.io/files/6.2/strace-6.2.tar.xz.asc

This link needs update.

I verified that the signature at
https://strace.io/files/6.3/strace-6.3.tar.xz.asc matches the hash
below.

Thanks,
baruch

> -sha256  0c7d38a449416268d3004029a220a15a77c2206a03cc88120f37f46e949177e8  strace-6.2.tar.xz
> +sha256  e17878e301506c1cc301611118ad14efee7f8bcef63b27ace5d290acce7bb731  strace-6.3.tar.xz
>  sha256  d92f973d08c8466993efff1e500453add0c038c20b4d2cbce3297938a296aea9  COPYING
>  sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
> diff --git a/package/strace/strace.mk b/package/strace/strace.mk
> index 730a91d277..6514bfe354 100644
> --- a/package/strace/strace.mk
> +++ b/package/strace/strace.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -STRACE_VERSION = 6.2
> +STRACE_VERSION = 6.3
>  STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
>  STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
>  STRACE_LICENSE = LGPL-2.1+


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
