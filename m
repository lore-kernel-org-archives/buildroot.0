Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E93D116F3
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 15:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C2264099B;
	Sun, 30 Nov 2025 15:17:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UMco30dBsSDI; Sun, 30 Nov 2025 15:17:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82ACB4099D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82ACB4099D;
	Sun, 30 Nov 2025 15:17:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2821C219
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 15:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 079D38205E
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 15:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Qk3f5P_jWuQ for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 15:17:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2CF9C80B75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CF9C80B75
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CF9C80B75
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 15:17:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8A95920039E;
 Sun, 30 Nov 2025 16:17:32 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 30 Nov 2025 16:17:32 +0100
MIME-Version: 1.0
Date: Sun, 30 Nov 2025 16:17:32 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251130132444.3048554-1-bernd@kuhls.net>
References: <20251130132444.3048554-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <41bbbf7aa078bf5437ca60b13c0e2d22@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764515853;
 bh=ejCf5mbcUsdzax6wQx7UnzZQ2PyKPyM0KD6Whe/4AbU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Uvn/u0avTBX4ucFDwlsoJGiXhV4i11oc9sTKXAyclgh9U5YNAjd45mV3R+FAF+QFx
 aay217lU6D5yMGTw+gDFxBqYluIeKeNIeaS2Mq09u1hF5Gn/oUdoGz/Pwf2zpLf9Wm
 ZIXzCGCE58OdIG8B4Dee4pK79s0XWZXl1ynNDz2RLpu1+WLe2BCNcyNiykiwclbxaT
 79IRFKEoM8tkmvQ33TRUro1aB61LU85ophCbaFThOZGv14lZGWX5e6e23CqDKxXvRb
 jdKiSDoHnCruVcSKFsRHU1fj24heldlIPWhb4xSeJL2yAWg9NqY00yZHEOOcjKK/pX
 MpyfVV7ubMVPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Uvn/u0av
Subject: Re: [Buildroot] [PATCH/next 1/1] package/unionfs: bump version to
 3.7
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

Thanks for the patch. I have few comments. See below.

On 30/11/2025 14:24, Bernd Kuhls wrote:
> Release notes:
> https://github.com/rpodgorny/unionfs-fuse/blob/master/NEWS
> 
> Version 3.0 added support for libfuse3.
> 
> Updated license hash due to copyright year bump:
> https://github.com/rpodgorny/unionfs-fuse/commit/3fcbd11f78b9a9e02ea0e861d741840fe45dc9c8
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/unionfs/Config.in    |  8 ++++----
>  package/unionfs/unionfs.hash |  4 ++--
>  package/unionfs/unionfs.mk   | 11 +++++++++--
>  3 files changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/package/unionfs/Config.in b/package/unionfs/Config.in
> index fe03b95f20..9bf902e48a 100644
> --- a/package/unionfs/Config.in
> +++ b/package/unionfs/Config.in
> @@ -1,9 +1,9 @@
>  config BR2_PACKAGE_UNIONFS
>  	bool "unionfs (FUSE)"
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
> -	depends on BR2_USE_MMU # libfuse
> -	depends on !BR2_STATIC_LIBS # libfuse
> -	select BR2_PACKAGE_LIBFUSE
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse, libfuse3
> +	depends on BR2_USE_MMU # libfuse, libfuse3
> +	depends on !BR2_STATIC_LIBS # libfuse, libfuse3
> +	select BR2_PACKAGE_LIBFUSE if !BR2_PACKAGE_LIBFUSE3

This line generates a kconfig error:

package/libfuse/Config.in:1:error: recursive dependency detected!
package/libfuse/Config.in:1:	symbol BR2_PACKAGE_LIBFUSE is selected by 
BR2_PACKAGE_LIBFUSE3
package/libfuse3/Config.in:1:	symbol BR2_PACKAGE_LIBFUSE3 is selected by 
BR2_PACKAGE_LIBFUSE

Could you have a look please?

>  	help
>  	  A userspace unionfs implementation.
> 
[...]
> diff --git a/package/unionfs/unionfs.mk b/package/unionfs/unionfs.mk
> index 12cd368fe3..2fcf073565 100644
> --- a/package/unionfs/unionfs.mk
> +++ b/package/unionfs/unionfs.mk
> @@ -4,10 +4,17 @@
>  #
>  
> ################################################################################
> 
> -UNIONFS_VERSION = 2.1
> +UNIONFS_VERSION = 3.7
>  UNIONFS_SITE = $(call 
> github,rpodgorny,unionfs-fuse,v$(UNIONFS_VERSION))
> -UNIONFS_DEPENDENCIES = libfuse host-pkgconf

If you remove the libfuse dependency here...

> +UNIONFS_DEPENDENCIES = host-pkgconf
>  UNIONFS_LICENSE = BSD-3-Clause
>  UNIONFS_LICENSE_FILES = LICENSE
> 
> +ifeq ($(BR2_PACKAGE_LIBFUSE3),y)
> +UNIONFS_CONF_OPTS += -DWITH_LIBFUSE3=TRUE
> +UNIONFS_DEPENDENCIES += libfuse3
> +else
> +UNIONFS_CONF_OPTS += -DWITH_LIBFUSE3=FALSE

...you should probably add it back here with:
UNIONFS_DEPENDENCIES += libfuse

It currently fails at configure time with error:

-- Checking for module 'fuse'
--   Package 'fuse' not found


> +endif
> +
>  $(eval $(cmake-package))
> --
> 2.47.3

Could you have a look, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
