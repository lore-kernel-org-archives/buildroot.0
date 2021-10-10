Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F2D9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 20:55:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AC6960F38
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 20:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6AC6960F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 005BF401C6;
	Sun, 10 Oct 2021 20:55:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oC1Z0YnRys-O; Sun, 10 Oct 2021 20:55:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3B30401D7;
	Sun, 10 Oct 2021 20:55:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B44D51BF41E
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 20:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3357403AC
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 20:55:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wVz71gITm03r for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 20:55:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E4B4403AB
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 20:55:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:74c0:e1ec:fabc:9152])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 2E5CE19F553;
 Sun, 10 Oct 2021 22:55:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633899337;
 bh=krWKdDIUeKmGrtHNWEPryoVm+0ALrtb+m5zpJ0UzWuI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aN6CKZEySREUFK3lF0mkmYL9DS4Gv0xk25532CHQQilc68kGn/0VwhpdGr+PjLZ8P
 YgYGRVDiyQwz//4h7ATKeKWg9rj+HSZYUz0iiLE7Wkjk2VrOZ0DWNiVo3I9wrBsQs6
 tL5u9+Z+cvDhlpjCsyvJsE4l6IrJoOgSU1U1sVWTnK7gEl+DESlF/8S814aT8sOXdo
 lwA97v4CFfmuMkTeJthmJXRrdoaA7qbq3P1UTk1ECNhfwtz1zL1FEWAsdnKASud4Hz
 72NvrFFM2LcaoammdFcNe+aAbKKoGVPVxUne/3Jt8EBMBBl7qrjv0nfyEL1a5ZHw5B
 3Y5hZOshsswVA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 10 Oct 2021 22:55:30 +0200
Date: Sun, 10 Oct 2021 22:55:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211010205530.GR2081069@scaer>
References: <20211010194937.1419893-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211010194937.1419893-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] package/knock: bump to version 0.8
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
Cc: Michael Rommel <rommel@layer-7.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-10-10 21:49 +0200, Fabrice Fontaine spake thusly:
> Use official tarball and so drop autoreconf

This is not very nice, in fact, because that tarball is a complete git
working copy... :-/

Even though this is reproducible (it's a tarball. after all, I do not
like it much that we carry a complete git tree.

I would prefer that we do explicitly use a git tree, or that we use the
github download helper instead. We just lose the upstream-provided
sha256sum of the archive...

Thoughts?

> https://github.com/jvinet/knock/blob/v0.8/ChangeLog

Since we had a commit hash, we don't really know where we're updating
from. That commit was from almost 6 years ago, and was already marked
as a 0.7.8 version. Meh...

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/knock/knock.hash | 4 +++-
>  package/knock/knock.mk   | 5 ++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/knock/knock.hash b/package/knock/knock.hash
> index 0b9a0918fc..3dc971b4a1 100644
> --- a/package/knock/knock.hash
> +++ b/package/knock/knock.hash
> @@ -1,3 +1,5 @@
> +# Hash from: https://zeroflux.org/projects/knock
> +sha256  698d8c965624ea2ecb1e3df4524ed05afe387f6d20ded1e8a231209ad48169c7  knock-0.8.tar.gz
> +
>  # locally computed hash
> -sha256  940a8de61b4b3530560805c3b9310a077c28c99173c2ccb07ff96720b0e93c58  knock-258a27e5a47809f97c2b9f2751a88c2f94aae891.tar.gz
>  sha256  d747e19206e41702e40822dd91d37cbf40edd86f364ea416d667a0e3013f7189  COPYING
> diff --git a/package/knock/knock.mk b/package/knock/knock.mk
> index 55f5bfdf36..02811540bf 100644
> --- a/package/knock/knock.mk
> +++ b/package/knock/knock.mk
> @@ -4,9 +4,8 @@
>  #
>  ################################################################################
>  
> -KNOCK_VERSION = 258a27e5a47809f97c2b9f2751a88c2f94aae891
> -KNOCK_SITE = $(call github,jvinet,knock,$(KNOCK_VERSION))
> -KNOCK_AUTORECONF = YES
> +KNOCK_VERSION = 0.8
> +KNOCK_SITE = http://www.zeroflux.org/proj/knock/files
>  KNOCK_LICENSE = GPL-2.0+
>  KNOCK_LICENSE_FILES = COPYING
>  KNOCK_DEPENDENCIES = libpcap
> -- 
> 2.33.0
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
