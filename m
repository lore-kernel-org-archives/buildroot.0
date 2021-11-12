Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A021DC433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 13:37:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5869B600CD
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 13:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5869B600CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24AF7400CC;
	Fri, 12 Nov 2021 13:37:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D-fGldN9iGzc; Fri, 12 Nov 2021 13:37:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2974E40148;
	Fri, 12 Nov 2021 13:37:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C19B31BF405
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 13:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B145B82433
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 13:37:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RBLLh24qtyOv for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 13:37:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A91588242D
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 13:37:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.1.143.61])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 1453519F553;
 Fri, 12 Nov 2021 14:36:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636724225;
 bh=0DI2Le9T+oXF8eeMY+/zl4Fp/rZ97uO+1XMMJdewRf4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IdjMnww+7seqh5b66JG5JqXehqFwc0o9Bait2N3OJrkSJHjEX1Ak0nxt+f4dJzuE4
 b9WwDmBQyXfTSfAXPCCsTrZuHvMyd1KB6W7bkDrvVCGSgARd/CkT9x4JCcxGRkV46c
 ei8KGjHZ+kxbp6EkmNgU0Zdikzzs2mfulze7dLFS2j9jkbMey85zXoIxstZCAksi2X
 72KWkPFZ3XqDA5IzeijlPRPZBC09nS5NF0FgZNUHy67BKqCZyKMnyy/qYGuJzsetma
 /gRYYuqSdxFXWXJ5jjPr8QbVuORzLnVYGgu4oTysK5ge7sTD40zXPHdGrJl2xtUl/2
 R/MBoGHGSrN/Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 12 Nov 2021 14:36:58 +0100
Date: Fri, 12 Nov 2021 14:36:58 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211112133658.GN2609@scaer>
References: <20211109171351.456708-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211109171351.456708-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: fix NLS build
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-11-09 18:13 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump to version 0.3.39 in
> commit d9796f2db9866060b916487784b046bb6b76f9b6 and
> https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/ddfbd684e78e2b8b9ad40bedb4612ea0197d231a:
> 
> /home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sh4-buildroot-linux-uclibc/9.3.0/../../../../sh4-buildroot-linux-uclibc/bin/ld: src/pipewire/libpipewire-0.3.so.0.339.0.p/pipewire.c.o: in function `i18n_ntext':
> pipewire.c:(.text+0x3ec): undefined reference to `libintl_dngettext'
> 
> Indeed, since that time, pipewire uses the new meson intl dependency API
> which has been added in version 0.59.0 with
> https://github.com/mesonbuild/meson/commit/2c6ccfe4c40741ae1f15f073f7d7bc8c398a1648
> 
> This new intl dependency API is broken (which is not so surprising based
> on my experience of meson). Don't even try to fix it as meson is not
> very prone to merge our pull requests:
> https://github.com/mesonbuild/meson/issues/6108
> https://github.com/mesonbuild/meson/pull/6629
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/435d59d40209cc1028cee8e2a71a69cd3769ab56
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pipewire/pipewire.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
> index f376f3c276..4cd2e7fcf5 100644
> --- a/package/pipewire/pipewire.mk
> +++ b/package/pipewire/pipewire.mk
> @@ -11,6 +11,7 @@ PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
>  PIPEWIRE_LICENSE_FILES = COPYING LICENSE
>  PIPEWIRE_INSTALL_STAGING = YES
>  PIPEWIRE_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
> +PIPEWIRE_LDFLAGS = $(TARGET_NLS_LIBS)
>  
>  PIPEWIRE_CONF_OPTS += \
>  	-Ddocs=disabled \
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
