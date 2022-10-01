Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22C9C433FE
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 20:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4943183E5D;
	Sat,  1 Oct 2022 20:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4943183E5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qzpDBtHAvrST; Sat,  1 Oct 2022 20:55:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F50B82F31;
	Sat,  1 Oct 2022 20:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F50B82F31
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 942711BF330
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 20:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F062403A9
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 20:55:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F062403A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GFsyEojPh1KU for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 20:55:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 528D340179
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 528D340179
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 20:55:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9961:1217:61e8:73cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 7B90B780331;
 Sat,  1 Oct 2022 22:54:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Oct 2022 22:54:59 +0200
Date: Sat, 1 Oct 2022 22:54:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Erico Nunes <nunes.erico@gmail.com>
Message-ID: <20221001205459.GW30794@scaer>
References: <20220927105835.760768-1-nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220927105835.760768-1-nunes.erico@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664657701;
 bh=kNTt3+m5n+UaZqeHoiS4PP6mFx0MeNyi/ZNhRM5Uclo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n7pWoVnkygXC6mu8CdnxmXNzTqm9gfPpTAXmjXk7cCISxaHI25fupuu9Y/YCYc0JG
 0M41tGxYziO0ejpvMj5JCJBVHRcBvVeVSme9fCgYbPGRJgVJRQCpM8CKu5N5PDwP77
 3JV0qQss6/QQ2A9mbjSxNG+G6CojwBmDHpYXQdKWAUU0JvsehHLNx0qgVPD11V57ir
 HYqtU0ScKlmJbcFVqXZ6W4CJLt7BZ9s7lBMhIaZc8mQPGi0Lf9MN9eHB016MS07sXL
 X40PxG1I+pkpmKX9jKXkQdPrGjaT+lniL7eNKRD9ZGldb3K5Uf1X67DJs9kBspT/vU
 kbe4aaDtSYZHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=n7pWoVnk
Subject: Re: [Buildroot] [PATCH] package/efibootmgr: bump to version 18
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

Erico, All,

On 2022-09-27 12:58 +0200, Erico Nunes spake thusly:
> Drop patches which are already applied upstream.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>

Does this change depend on the efivar bump, or can it be applied
independently?

Regards,
Yann E. MORIN.

> ---
>  .../0001-Allow-build-with-uClibc.patch        | 40 -------------------
>  .../efibootmgr/0002-remove-extra-decl.patch   | 28 -------------
>  package/efibootmgr/efibootmgr.hash            |  2 +-
>  package/efibootmgr/efibootmgr.mk              |  2 +-
>  4 files changed, 2 insertions(+), 70 deletions(-)
>  delete mode 100644 package/efibootmgr/0001-Allow-build-with-uClibc.patch
>  delete mode 100644 package/efibootmgr/0002-remove-extra-decl.patch
> 
> diff --git a/package/efibootmgr/0001-Allow-build-with-uClibc.patch b/package/efibootmgr/0001-Allow-build-with-uClibc.patch
> deleted file mode 100644
> index fd29233dc3..0000000000
> --- a/package/efibootmgr/0001-Allow-build-with-uClibc.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From bbfcc60497c326576bb23cb01d90115ef3cf6947 Mon Sep 17 00:00:00 2001
> -From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> -Date: Fri, 25 Nov 2016 20:26:52 +0200
> -Subject: [PATCH] Remove unneeded <uchar.h> include
> -
> -This fixes the build with uClibc.
> -
> -Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ----
> - src/efibootdump.c | 1 -
> - src/eficonman.c   | 1 -
> - 2 files changed, 2 deletions(-)
> -
> -diff --git a/src/efibootdump.c b/src/efibootdump.c
> -index 6ff8360..7c5a1c5 100644
> ---- a/src/efibootdump.c
> -+++ b/src/efibootdump.c
> -@@ -19,7 +19,6 @@
> - #include <stdint.h>
> - #include <stdio.h>
> - #include <stdlib.h>
> --#include <uchar.h>
> - #include <unistd.h>
> - 
> - #include "error.h"
> -diff --git a/src/eficonman.c b/src/eficonman.c
> -index 2c2be38..9bfae79 100644
> ---- a/src/eficonman.c
> -+++ b/src/eficonman.c
> -@@ -17,7 +17,6 @@
> - #include <stdint.h>
> - #include <stdio.h>
> - #include <stdlib.h>
> --#include <uchar.h>
> - #include <unistd.h>
> - 
> - #define  _(String) gettext (String)
> --- 
> -2.10.2
> -
> diff --git a/package/efibootmgr/0002-remove-extra-decl.patch b/package/efibootmgr/0002-remove-extra-decl.patch
> deleted file mode 100644
> index f838d50a20..0000000000
> --- a/package/efibootmgr/0002-remove-extra-decl.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 99b578501643377e0b1994b2a068b790d189d5ad Mon Sep 17 00:00:00 2001
> -From: Peter Jones <pjones@redhat.com>
> -Date: Wed, 13 Jun 2018 09:41:01 -0400
> -Subject: [PATCH] remove extra decl
> -
> -Downloaded from upstream commit
> -https://github.com/rhboot/efibootmgr/commit/99b578501643377e0b1994b2a068b790d189d5ad
> -
> -Signed-off-by: Peter Jones <pjones@redhat.com>
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ----
> - src/efibootmgr.c | 3 ---
> - 1 file changed, 3 deletions(-)
> -
> -diff --git a/src/efibootmgr.c b/src/efibootmgr.c
> -index de38f01..4e1a680 100644
> ---- a/src/efibootmgr.c
> -+++ b/src/efibootmgr.c
> -@@ -1536,9 +1536,6 @@ parse_opts(int argc, char **argv)
> - 					       "invalid numeric value %s\n",
> - 					       optarg);
> - 			}
> --                        /* XXX efivar-36 accidentally doesn't have a public
> --                         * header for this */
> --			extern int efi_set_verbose(int verbosity, FILE *errlog);
> - 			efi_set_verbose(opts.verbose - 2, stderr);
> - 			break;
> - 		case 'V':
> diff --git a/package/efibootmgr/efibootmgr.hash b/package/efibootmgr/efibootmgr.hash
> index fdbc9a2732..71a9826331 100644
> --- a/package/efibootmgr/efibootmgr.hash
> +++ b/package/efibootmgr/efibootmgr.hash
> @@ -1,3 +1,3 @@
>  # locally computed hash
> -sha256  22a95ebe0d5c9fb2915b3a100450f8f37484d1dbb8b296f55b343cc84f10397d  efibootmgr-17.tar.gz
> +sha256  442867d12f8525034a404fc8af3036dba8e1fc970998af2486c3b940dfad0874  efibootmgr-18.tar.gz
>  sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
> diff --git a/package/efibootmgr/efibootmgr.mk b/package/efibootmgr/efibootmgr.mk
> index 7e09b5f659..672a93c282 100644
> --- a/package/efibootmgr/efibootmgr.mk
> +++ b/package/efibootmgr/efibootmgr.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EFIBOOTMGR_VERSION = 17
> +EFIBOOTMGR_VERSION = 18
>  EFIBOOTMGR_SITE = $(call github,rhboot,efibootmgr,$(EFIBOOTMGR_VERSION))
>  EFIBOOTMGR_LICENSE = GPL-2.0+
>  EFIBOOTMGR_LICENSE_FILES = COPYING
> -- 
> 2.37.3
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
