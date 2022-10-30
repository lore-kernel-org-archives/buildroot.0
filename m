Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A327CC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 16:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E6A5401BF;
	Sun, 30 Oct 2022 16:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E6A5401BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F0qy-GVvmjm0; Sun, 30 Oct 2022 16:53:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13E6E40196;
	Sun, 30 Oct 2022 16:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13E6E40196
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E9FA1BF479
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4371F40196
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4371F40196
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3WUGlVko_CVt for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 16:53:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FAF340175
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FAF340175
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 16:53:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6ffe:83e9:a65c:45ae])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 58F9A13F8AF;
 Sun, 30 Oct 2022 17:53:16 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 17:53:16 +0100
Date: Sun, 30 Oct 2022 17:53:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030165316.GW1058960@scaer>
References: <20221029083130.77419-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221029083130.77419-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667148798;
 bh=HLTFAsyLQ4XqwRI6CAay87VWBQaEQZh/TglGNQ5hslc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g2EmdkHx08EIO1wc3UzxKQ74s6Rfi7ctY39754QZVM1ldPyW11wiYbj5Yn1ygLG9v
 q6snJeHl/pWd1yUx1s+QnaDXYliYUzkCI3gN5Xf4PsCD2WpqDM8i+S6l5pR41dK+P6
 bpIDukd1jUI73SlGPz3GlWAIvowicscd5h9vz+kjQz72aA/Q8cwt7floYFtyVZOqfF
 CY6p9DFcOMmuAW8dkoJSkchE5BgbW4epu20swpXeQK1pzQMI1eEKSzKjGFDvwppnKG
 uVp799KlLf5x+5/fFkGwtJj0nrzQBD5mByDzy6zEXj9rjVtiXQOP9kEizUUI2Sisvh
 mEsOedYk9fanA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=g2EmdkHx
Subject: Re: [Buildroot] [PATCH 1/1] package/openipmi: bump to version 2.0.33
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

Fabrice, All,

On 2022-10-29 10:31 +0200, Fabrice Fontaine spake thusly:
> Drop patch (already in version) and so also drop autoreconf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[--SNIP--]
> diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
> index 81492ec131..ccf86f93cd 100644
> --- a/package/openipmi/openipmi.mk
> +++ b/package/openipmi/openipmi.mk
> @@ -4,15 +4,13 @@
>  #
>  ################################################################################
>  
> -OPENIPMI_VERSION = 2.0.32
> +OPENIPMI_VERSION = 2.0.33
>  OPENIPMI_SITE = https://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library
>  OPENIPMI_SOURCE = OpenIPMI-$(OPENIPMI_VERSION).tar.gz
>  OPENIPMI_LICENSE = LGPL-2.0+, GPL-2.0+, BSD-3-Clause
>  OPENIPMI_LICENSE_FILES = COPYING.LIB COPYING COPYING.BSD
>  OPENIPMI_DEPENDENCIES = popt ncurses readline host-pkgconf
>  OPENIPMI_INSTALL_STAGING = YES
> -# Patching Makefile.am
> -OPENIPMI_AUTORECONF = YES
>  OPENIPMI_CONF_ENV = ac_cv_path_pkgprog="$(PKG_CONFIG_HOST_BINARY)"
>  OPENIPMI_CONF_OPTS = \
>  	--with-glib=no \

This hunk does not apply, because the _CONF_OPTS are different:

    OPENIPMI_CONF_OPTS = \
        --with-execinfo=no \
        --with-glib=no \
        --with-tcl=no \
        ...

Do you have local changes you forgot?

Regards,
Yann E. MORIN.

> -- 
> 2.35.1
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
