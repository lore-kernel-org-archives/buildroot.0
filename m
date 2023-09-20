Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9910CC04ABA
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 17:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5132B612BD;
	Wed, 20 Sep 2023 17:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5132B612BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WAq2-IE3483T; Wed, 20 Sep 2023 17:37:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E160613A1;
	Wed, 20 Sep 2023 17:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E160613A1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 067C21BF980
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 17:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1C25612BD
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 17:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1C25612BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id URZaNsrfqhOp for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 17:37:20 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F13126136F
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 17:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F13126136F
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:a117:66c:8b6b:25fb])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 2ABE65FF95;
 Wed, 20 Sep 2023 19:37:16 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 20 Sep 2023 19:37:15 +0200
Date: Wed, 20 Sep 2023 19:37:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230920173715.GG512384@scaer>
References: <20230920043420.37133-2-dalang@gmx.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230920043420.37133-2-dalang@gmx.at>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695231438;
 bh=eWzrfHxpxAgx8SVuswSDhY/lvZV2nSmJN6aVWeRLgLM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bdFNHosty2uTTe0q0P98UUVvzgz/ii0InZtowhz+1a+ZvHpaPRqyypkoe/GTtq4NF
 3br4qGBlx7ttewrubkg3ZDUOCIThCIV3LzV1qLUGj9ono2afo8xX3fcgNkFEdlTeB+
 QLtoHZtY2AKtGmw3olQ+edyJWe20aWM3YbHrJGSVCJFbTcB5jb/BkYUDuau5x8KGNx
 qIdg8SsHT0vfZl7gBvWBBPKQfnJQafePHb7PkEiVRMtlKD3RhWH7sxhrAoDKLb1Sqx
 oi9fCW6Y0YIS6+drQwGR9Zqyg8Ee/rfV0Z+T4JANCq6qD58F5OvJ1jfrfWvheQzWx5
 Gpf2gDVJ3KidA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bdFNHost
Subject: Re: [Buildroot] [PATCH] package/cpio: drop CVE-2021-38185 from
 IGNORE_CVES
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

Daniel, All,

On 2023-09-20 06:34 +0200, Daniel Lang spake thusly:
> CVE-2021-38185 affects cpio <= 2.13.
> The mentioned patches were removed in b0306d94 when bumping to 2.14.
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/cpio/cpio.mk | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
> index 19224000bb..911d16822b 100644
> --- a/package/cpio/cpio.mk
> +++ b/package/cpio/cpio.mk
> @@ -12,10 +12,6 @@ CPIO_LICENSE = GPL-3.0+
>  CPIO_LICENSE_FILES = COPYING
>  CPIO_CPE_ID_VENDOR = gnu
>  
> -# 0002-Rewrite-dynamic-string-support.patch
> -# 0003-Fix-previous-commit.patch
> -CPIO_IGNORE_CVES += CVE-2021-38185
> -
>  # cpio uses argp.h which is not provided by uclibc or musl by default.
>  # Use the argp-standalone package to provide this.
>  ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
> -- 
> 2.42.0
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
