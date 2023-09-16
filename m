Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE160CD37BB
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 12:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5C7140AFF;
	Sat, 16 Sep 2023 12:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5C7140AFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OYr5hwJ866cJ; Sat, 16 Sep 2023 12:09:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E791240AF5;
	Sat, 16 Sep 2023 12:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E791240AF5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 914EB1BF860
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AD8340AF5
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AD8340AF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LC1T0Q5cJacF for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 12:09:00 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 88CCA40AD1
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 12:09:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88CCA40AD1
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id DA0C4200402;
 Sat, 16 Sep 2023 14:08:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Sep 2023 14:08:55 +0200
Date: Sat, 16 Sep 2023 14:08:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alexander Egorenkov <egorenar-dev@posteo.net>
Message-ID: <20230916120855.GU2571@scaer>
References: <20230916091831.13118-1-egorenar-dev@posteo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916091831.13118-1-egorenar-dev@posteo.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694866138;
 bh=XQ0Lfm+gXvAyFRUcJdI53xry8ZeWqsWB0ExH5V5MYvk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C4kp/AtMsPWmv38j54uDtqlnt0+Gs2PD8OGhjK7ZE17yhpe7TJcSVUIbo5rUrQJS5
 rBxnub3VNx6vE1ulQkvuA8jb45uJUwA6LrAUJ1yDudSg1bqJVFskK6+z+6OP/u4jpT
 LVkaeq8LC2wvQStf4qn4bXwz+7goTGyJhrg+y5j/7FpNSOH+1T/ydabJD4E4xikPWg
 DOtXsTGe3y4o+KKTiMbd+Cttv84KWJfQMWPp0OHiAqRh//RUxMb/8s+GcBNwjsWLnh
 xTx9bkvHCVVVp6ZLVvsG5uH7AAiVvDXGDT0U0zZvEK887yOwYemptNMl8yrxQmtzhW
 ZQcCsbaYC4wQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=C4kp/AtM
Subject: Re: [Buildroot] [PATCH 1/2] package/multipath-tools: bump version
 to 0.9.6
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

Alexander, All,

On 2023-09-16 09:18 +0000, Alexander Egorenkov spake thusly:
> Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
> ---
[--SNIP--]
> diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
> index 23b3cc944267..d9d0f959943d 100644
> --- a/package/multipath-tools/multipath-tools.mk
> +++ b/package/multipath-tools/multipath-tools.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MULTIPATH_TOOLS_VERSION = 0.9.4
> +MULTIPATH_TOOLS_VERSION = 0.9.6
>  MULTIPATH_TOOLS_SITE = $(call github,opensvc,multipath-tools,$(MULTIPATH_TOOLS_VERSION))
>  
>  MULTIPATH_TOOLS_LICENSE = \
> @@ -20,7 +20,7 @@ MULTIPATH_TOOLS_LICENSE_FILES = \
>  	README.md
>  MULTIPATH_TOOLS_CPE_ID_VENDOR = opensvc
>  
> -MULTIPATH_TOOLS_DEPENDENCIES = lvm2 json-c readline udev liburcu libaio host-pkgconf
> +MULTIPATH_TOOLS_DEPENDENCIES = lvm2 json-c readline udev liburcu libaio host-pkgconf util-linux-libs

This line was longer than ~80 chars, so I split it into a multi-line
assignment, and took the opportunity to reorder the dependencies
alphabetically.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  MULTIPATH_TOOLS_MAKE_OPTS = \
>  	kernel_incdir=$(STAGING_DIR)/usr/include \
>  	LIB="lib" \
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
