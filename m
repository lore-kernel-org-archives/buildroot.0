Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0F7C2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 18:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D26EB60AF2;
	Sat, 18 Nov 2023 18:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D26EB60AF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rx4v5gUgEHT7; Sat, 18 Nov 2023 18:35:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D33B160D6B;
	Sat, 18 Nov 2023 18:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D33B160D6B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 06B591BF25F
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 18:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D178B81756
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 18:35:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D178B81756
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SSp8YlIlACXu for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 18:35:06 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73CFB8164B
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 18:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73CFB8164B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4173:7e62:c00c:757b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 86D557804FD;
 Sat, 18 Nov 2023 19:34:58 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Nov 2023 19:34:58 +0100
Date: Sat, 18 Nov 2023 19:34:58 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Brandon Maier <brandon.maier@collins.com>
Message-ID: <20231118183458.GK996011@scaer>
References: <20231110210001.58405-1-brandon.maier@collins.com>
 <20231110210001.58405-2-brandon.maier@collins.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231110210001.58405-2-brandon.maier@collins.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700332504;
 bh=l/rRqBw/f8VoaBJPua3UZxFukmxxrj8c4w/aUSF+kCU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HVHyxRtJU8eShOrPVpM75cshk4LKdtypEDZ9/L2YMVGLEDCkcl0o/Bfb6s69vYzEp
 JPURhWCn6mZLt9a+eXFMmMbQmV6sU8p2p3/vrgU8OpA7UVbUpudbYle5+tlSlVVt8F
 6k9RvUhwjhe+QMlXe1GdHZZgCODhtDZQSrusKuglEirzrE0SRRaBtPfqdGeOD96d3H
 RjocOsE9JryPdkVBGfpKyQJGPCV4TnRquxmPhMbCiphOjPFgeZD6gg34mw86PAM5hQ
 7vaUZa0ZWXb2nq7/g1vROqrTTWvPjGj30FhWo9av769NeMPx6Pu8m/8M9Q8J88kNXG
 Na6qgcj1LPzfA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HVHyxRtJ
Subject: Re: [Buildroot] [PATCH 2/2] package/memtest86: rename package to
 memtest86plus
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
Cc: Steve Kenton <skenton@ou.edu>, Abhishek Anand <abhishek.anand@collins.com>,
 Kalpesh Panchal <kalpesh.panchal2@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Kalpesh, Brandon, All,

On 2023-11-10 21:00 +0000, Brandon Maier via buildroot spake thusly:
> From: Kalpesh Panchal <kalpesh.panchal2@collins.com>
> 
> Memtest86+, is a development fork of the original MemTest86.
> But now, MemTest86(https://www.memtest86.com/) and
> Memtest86+(https://memtest.org/) are two different tools and
> maintained separately. The intention of this package is to use
> opensource version Memtest86+. So to avoid confusion the package
> is renamed to memtest86plus like the name on github.

I don't think it makes sense to rename the package as a whole; just
change the prompt to refer to memtest86+:

    # For legacy reasons, the memtest86+ package is just
    # named memtest86.
    config BR2_PACKAGE_MEMTEST86
        bool "memtest86+"

Since we do have a package for memtest86 (old), the renaming is not
necessary.

And even if we were to add a package for memtest86, then it would
conflict with the previous pakcage for memtest86+ anyway, so we could
not introduce it as memtest86; we'd need to itroduce it as
memetest86-old (or -legacy).

So, the renaming is not needed.

Regards,
Yann E. MORIN.

> Signed-off-by: Kalpesh Panchal <kalpesh.panchal2@collins.com>
> Signed-off-by: Abhishek Anand <abhishek.anand@collins.com>
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>  Config.in.legacy                              |  8 +++++
>  DEVELOPERS                                    |  2 +-
>  package/Config.in                             |  2 +-
>  package/memtest86/memtest86.mk                | 30 -------------------
>  .../{memtest86 => memtest86plus}/Config.in    |  8 ++---
>  .../memtest86plus.hash}                       |  2 +-
>  package/memtest86plus/memtest86plus.mk        | 30 +++++++++++++++++++
>  7 files changed, 43 insertions(+), 39 deletions(-)
>  delete mode 100644 package/memtest86/memtest86.mk
>  rename package/{memtest86 => memtest86plus}/Config.in (87%)
>  rename package/{memtest86/memtest86.hash => memtest86plus/memtest86plus.hash} (83%)
>  create mode 100644 package/memtest86plus/memtest86plus.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 312d53943c..620d890b15 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -267,6 +267,14 @@ config BR2_PACAKGE_OPENFPGALOADER_CMSIS
>  
>  comment "Legacy options removed in 2023.02"
>  
> +config BR2_PACKAGE_MEMTEST86
> +	bool "memtest86 has been renamed"
> +	depends on BR2_i386 || BR2_x86_64
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_MEMTEST86PLUS
> +	help
> +	  memtest86 package has been renamed to memtest86plus.
> +
>  config BR2_PACKAGE_PUGIXML_HEADER_ONLY
>  	bool "pugixml header-only removed"
>  	select BR2_LEGACY
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d80931e84a..82fe28551c 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2813,7 +2813,7 @@ F:	package/libcli/
>  N:	Steve Kenton <skenton@ou.edu>
>  F:	package/dvdauthor/
>  F:	package/dvdrw-tools/
> -F:	package/memtest86/
> +F:	package/memtest86plus/
>  F:	package/mjpegtools/
>  F:	package/udftools/
>  F:	package/xorriso/
> diff --git a/package/Config.in b/package/Config.in
> index dac5058bbe..eff6d227db 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -556,7 +556,7 @@ endmenu
>  	source "package/mdadm/Config.in"
>  	source "package/mdevd/Config.in"
>  	source "package/mdio-tools/Config.in"
> -	source "package/memtest86/Config.in"
> +	source "package/memtest86plus/Config.in"
>  	source "package/memtester/Config.in"
>  	source "package/memtool/Config.in"
>  	source "package/mhz/Config.in"
> diff --git a/package/memtest86/memtest86.mk b/package/memtest86/memtest86.mk
> deleted file mode 100644
> index 332157ab26..0000000000
> --- a/package/memtest86/memtest86.mk
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -################################################################################
> -#
> -# memtest86
> -#
> -################################################################################
> -
> -MEMTEST86_VERSION = 6.20
> -MEMTEST86_SITE = $(call github,memtest86plus,memtest86plus,v$(MEMTEST86_VERSION))
> -MEMTEST86_LICENSE = GPL-2.0
> -MEMTEST86_LICENSE_FILES = LICENSE
> -MEMTEST86_INSTALL_IMAGES = YES
> -MEMTEST86_INSTALL_TARGET = NO
> -
> -ifeq ($(BR2_i386),y)
> -MEMTEST86_BUILD_DIR = build32
> -else
> -ifeq ($(BR2_x86_64),y)
> -MEMTEST86_BUILD_DIR = build64
> -endif
> -endif
> -
> -define MEMTEST86_BUILD_CMDS
> -	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$(MEMTEST86_BUILD_DIR)
> -endef
> -
> -define MEMTEST86_INSTALL_IMAGES_CMDS
> -	$(INSTALL) -m 0755 -D $(@D)/$(MEMTEST86_BUILD_DIR)/memtest.* $(BINARIES_DIR)/
> -endef
> -
> -$(eval $(generic-package))
> diff --git a/package/memtest86/Config.in b/package/memtest86plus/Config.in
> similarity index 87%
> rename from package/memtest86/Config.in
> rename to package/memtest86plus/Config.in
> index 81c69e0222..912c4ce2ec 100644
> --- a/package/memtest86/Config.in
> +++ b/package/memtest86plus/Config.in
> @@ -1,13 +1,9 @@
> -config BR2_PACKAGE_MEMTEST86
> -	bool "memtest86"
> +config BR2_PACKAGE_MEMTEST86PLUS
> +	bool "memtest86plus"
>  	depends on BR2_i386 || BR2_x86_64
>  	help
>  	  Memtest86+ is a bootable standalone memory test program.
>  
> -	  Buildroot does not support packages with a '+' sign in their
> -	  name, which explains why it is named memtest86 and not
> -	  memtest86+.
> -
>  	  Memtest86+ is a utility designed to test whether your memory
>  	  is in working order. It repeatedly writes an enormous amount
>  	  of different patterns to all memory locations and reads them
> diff --git a/package/memtest86/memtest86.hash b/package/memtest86plus/memtest86plus.hash
> similarity index 83%
> rename from package/memtest86/memtest86.hash
> rename to package/memtest86plus/memtest86plus.hash
> index df4699c63b..9e42583fcf 100644
> --- a/package/memtest86/memtest86.hash
> +++ b/package/memtest86plus/memtest86plus.hash
> @@ -1,3 +1,3 @@
>  # locally computed using sha256sum
> -sha256  463b2db66128e45c96be76136272e2ee940f1319804b1b88cc2ef04edccd01d8  memtest86+-6.20.tar.gz
> +sha256  463b2db66128e45c96be76136272e2ee940f1319804b1b88cc2ef04edccd01d8  memtest86plus-6.20.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> diff --git a/package/memtest86plus/memtest86plus.mk b/package/memtest86plus/memtest86plus.mk
> new file mode 100644
> index 0000000000..ad3c5c5b4c
> --- /dev/null
> +++ b/package/memtest86plus/memtest86plus.mk
> @@ -0,0 +1,30 @@
> +################################################################################
> +#
> +# memtest86plus
> +#
> +################################################################################
> +
> +MEMTEST86PLUS_VERSION = 6.20
> +MEMTEST86PLUS_SITE = $(call github,memtest86plus,memtest86plus,v$(MEMTEST86PLUS_VERSION))
> +MEMTEST86PLUS_LICENSE = GPL-2.0
> +MEMTEST86PLUS_LICENSE_FILES = LICENSE
> +MEMTEST86PLUS_INSTALL_IMAGES = YES
> +MEMTEST86PLUS_INSTALL_TARGET = NO
> +
> +ifeq ($(BR2_i386),y)
> +MEMTEST86PLUS_BUILD_DIR = build32
> +else
> +ifeq ($(BR2_x86_64),y)
> +MEMTEST86PLUS_BUILD_DIR = build64
> +endif
> +endif
> +
> +define MEMTEST86PLUS_BUILD_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$(MEMTEST86PLUS_BUILD_DIR)
> +endef
> +
> +define MEMTEST86PLUS_INSTALL_IMAGES_CMDS
> +	$(INSTALL) -m 0755 -D $(@D)/$(MEMTEST86PLUS_BUILD_DIR)/memtest.* $(BINARIES_DIR)/
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.41.0
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
