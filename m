Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDEBC46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 14:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D61D60BA9;
	Sat,  6 Jan 2024 14:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D61D60BA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BXXYB8AceNHC; Sat,  6 Jan 2024 14:08:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEA6260B4E;
	Sat,  6 Jan 2024 14:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEA6260B4E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A82401BF362
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 14:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F54581462
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 14:08:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F54581462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q3Emu5AUXFQS for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 14:08:45 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7078B8145B
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 14:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7078B8145B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6C4C5B00576;
 Sat,  6 Jan 2024 15:08:37 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 Jan 2024 15:08:37 +0100
Date: Sat, 6 Jan 2024 15:08:37 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <ZZle5axIylYaB8i3@landeda>
References: <20231024144256.2708299-1-giulio.benetti@benettiengineering.com>
 <20231024144256.2708299-4-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231024144256.2708299-4-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704550123;
 bh=8HuMIP7jGVzgr6bAwD/WUbV1xqmSwR29LQhmWZ1VSek=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IURQY5ZiTG44Oy89upUUYm3zZkq5XcvQUmEDePdRE5xu366uiOkZ59zNCyMoCugo9
 RxEQSoMKTZLMhuR4rxdWO+bz6jasQotsbJUOPFAms7pW7bipbzsX53JrzxM/VpwrTO
 WKKTa9+P2LKg/pNxn4xuXi6yP4YiWqdzLPhdOVXTES7qQIsSus0qhpae+23q2HgmOz
 u4UHdOmyjyry4FvBPjq9fW3x9It13tZwFxc5Y7Hb/dDDvZKQxRerTREk2H1gOgdTWJ
 YrtJtoAqYjezctPlhxHkOpOI7mzLveMtY/bFg4XkNfdrbH0rp30t4Sv3oegv9me9S7
 ei8+agZAV0F0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IURQY5Zi
Subject: Re: [Buildroot] [PATCH v5 4/4] package/trace-cmd: bump to 3.1.7
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Pierre Floury <pierre.floury@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andreas Ziegler <br015@umbiko.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2023-10-24 16:42 +0200, Giulio Benetti spake thusly:
> From: Maxime Chevallier <maxime.chevallier@bootlin.com>
> 
> trace-cmd's dependencies 'libtracefs' and 'libtraceevent' were split
> into dedicated projects, maintained outside of trace-cmd.
> 
> This release, on top of bumping the version, adds this new dependencies.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> [Giulio: bump to version 3.1.7]
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
[--SNIP--]
> diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
> index 52bb99036c..3d4d88c964 100644
> --- a/package/trace-cmd/trace-cmd.mk
> +++ b/package/trace-cmd/trace-cmd.mk
> @@ -4,14 +4,14 @@
>  #
>  ################################################################################
>  
> -TRACE_CMD_VERSION = 2.9.7
> +TRACE_CMD_VERSION = 3.1.7
>  TRACE_CMD_SOURCE = trace-cmd-v$(TRACE_CMD_VERSION).tar.gz
>  TRACE_CMD_SITE = \
>  	https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/snapshot
>  TRACE_CMD_LICENSE = GPL-2.0, LGPL-2.1
>  TRACE_CMD_LICENSE_FILES = COPYING COPYING.LIB LICENSES/GPL-2.0 LICENSES/LGPL-2.1
>  
> -TRACE_CMD_DEPENDENCIES = host-pkgconf
> +TRACE_CMD_DEPENDENCIES = host-pkgconf libtracefs libtraceevent

Alphabetical ordering in dependencies.

Applied to master with the order fixed, thanks.

Regards,
Yann E. MORIN.

>  TRACE_CMD_MAKE_OPTS = prefix=/usr etcdir=/etc
>  
>  ifeq ($(BR2_PACKAGE_AUDIT),y)
> @@ -34,6 +34,8 @@ ifeq ($(BR2_sparc64),y)
>  TRACE_CMD_CFLAGS += -fPIC
>  endif
>  
> +TRACE_CMD_CFLAGS += $($(HOST_DIR)/bin/pkg-config --cflags libtracefs)
> +
>  # trace-cmd use CPPFLAGS to add some extra flags.
>  # But like for CFLAGS, $(TARGET_CPPFLAGS) contains _LARGEFILE64_SOURCE
>  # that causes build problems.
> -- 
> 2.34.1
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
