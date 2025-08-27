Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64720CA0EFF
	for <buildroot@archiver.kernel.org>; Wed, 27 Aug 2025 21:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04639811B9;
	Wed, 27 Aug 2025 21:49:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h2AvEPOqRjPJ; Wed, 27 Aug 2025 21:49:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15A4E810D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15A4E810D5;
	Wed, 27 Aug 2025 21:49:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 608CBB8C
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 21:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C35D80DAB
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 21:49:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q_0Z-JvI1qAO for <buildroot@buildroot.org>;
 Wed, 27 Aug 2025 21:49:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6D27380F51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D27380F51
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D27380F51
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 21:49:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 6664219F54D;
 Wed, 27 Aug 2025 23:49:35 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 27 Aug 2025 23:49:35 +0200
MIME-Version: 1.0
Date: Wed, 27 Aug 2025 23:49:35 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250827071752.1760654-1-thomas@devoogdt.com>
References: <20250827071752.1760654-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <6e3994b190d42c3e8f45481e7f3438c9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756331376;
 bh=x4UAafiRIBa48s6axmWzDvvTPtb+a6/8MmVveiSebl0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lq5keWbNecUYVw9mL1j+gAzn1utCwO6jBPKO4ajSQNRhEOSoXnNE3GF+9TIlYmkf9
 GjRT77UENJQWzhLnf7Z2profchom0bN+FdpJtMwuHNg9xa4lkiy1vb9/XQc5diiya6
 SPEHAWlrGZC0+MdwF3f1SWDfugsrPl30mEgIxdCMiKpUOsjyLDqyXF20avZNsJzDI2
 SQxwq9fycKjloelMas6fTKkjtmlGxgvlpsz8dwY1F5ZFNgtw5KuLVSqIONxYzOYgfO
 WWPU9bCRaeQqlWcqvel/GUH/RnAOigSolkShtLXNVSe+EJxjtbebR+WOizPOULH4Du
 KSmFblhessqew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lq5keWbN
Subject: Re: [Buildroot] [PATCH v1] package/lighttpd: bump to 1.4.81
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

Hi Thomas,

Thanks for the patch. I have a comment, see below.

On 27/08/2025 09:17, Thomas Devoogdt wrote:
> News:
> - https://www.lighttpd.net/2025/8/13/1.4.80/
> - https://www.lighttpd.net/2025/8/17/1.4.81/
> 
> See Changes from 1.4.79:
> 
> [build] remove references to libev; no longer used
> 
> So drop here as well.
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---
>  package/lighttpd/lighttpd.hash | 8 ++++----
>  package/lighttpd/lighttpd.mk   | 9 +--------
>  2 files changed, 5 insertions(+), 12 deletions(-)
> 
[...]
> diff --git a/package/lighttpd/lighttpd.mk 
> b/package/lighttpd/lighttpd.mk
> index 5337042340..71c860a31a 100644
> --- a/package/lighttpd/lighttpd.mk
> +++ b/package/lighttpd/lighttpd.mk
> @@ -5,7 +5,7 @@
>  
> ################################################################################
> 
>  LIGHTTPD_VERSION_MAJOR = 1.4
> -LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).79
> +LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).81
>  LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
>  LIGHTTPD_SITE = 
> http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
>  LIGHTTPD_LICENSE = BSD-3-Clause
> @@ -76,13 +76,6 @@ else
>  LIGHTTPD_CONF_OPTS += -Dwith_ldap=disabled
>  endif
> 
> -ifeq ($(BR2_PACKAGE_LIGHTTPD_LIBEV),y)

If you remove the use of BR2_PACKAGE_LIGHTTPD_LIBEV here,
you should also remove the option from Config.in too, and
add an entry in the Config.in.legacy.

Could you do so for the branch "next" please?

> -LIGHTTPD_DEPENDENCIES += libev
> -LIGHTTPD_CONF_OPTS += -Dwith_libev=enabled
> -else
> -LIGHTTPD_CONF_OPTS += -Dwith_libev=disabled
> -endif
> -
>  ifeq ($(BR2_PACKAGE_LIGHTTPD_LUA),y)
>  LIGHTTPD_DEPENDENCIES += lua
>  LIGHTTPD_CONF_OPTS += -Dwith_lua=true
> --
> 2.43.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
