Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DBDC7EE22
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 14:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A565641F40;
	Sun, 14 May 2023 14:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A565641F40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ck9k4uqm-EGK; Sun, 14 May 2023 14:01:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C94341F20;
	Sun, 14 May 2023 14:01:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C94341F20
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E113B1BF5A4
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 14:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C625541F1A
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 14:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C625541F1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MZ6wQeSZV52H for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 14:01:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73F4641F19
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73F4641F19
 for <buildroot@buildroot.org>; Sun, 14 May 2023 14:01:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e91d:2912:5826:9d75])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7A0E0B00535;
 Sun, 14 May 2023 16:01:19 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 May 2023 16:01:19 +0200
Date: Sun, 14 May 2023 16:01:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <20230514140119.GF2582048@scaer>
References: <20230130144655.1193660-1-maxime.chevallier@bootlin.com>
 <20230130144655.1193660-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230130144655.1193660-2-maxime.chevallier@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684072884;
 bh=mCCuFj9flR0jxs1bxENINgBPc4IYNiAYCsFbe+LSUoI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dDxipKzThzSsmhCwib+5x7TpCHkoo+EXQaHuNymt48+ctdPOEj6y3M23AvcWCJ6N0
 FEL3YKtaMJZTmkFnFyhxyVgfz2D5UTE1Xrp5ELEzYGeaPCFvz5XNR21wDnRuqXdCn0
 pmFh1Lg/ruKSrOYX0nGF3K8jwwjD2KjVOkf20/fO8mEXC0KajbPR80bIJmtZC4ESqq
 oQNh6oy+upRQM2fR+ZSfSW/iU/skhmeuugPRGdw1csJNrQT1wMRQwEefdL2uYvs8BI
 VeH/NBfXwj32wrD1CXXmAxCBHnm5G5mCPy9N+pb0KUQHJbal0uEL3amutavyBx6972
 BX+dqwR4hJRYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dDxipKzT
Subject: Re: [Buildroot] [PATCH 1/4] package/libtraceevent: new package
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
Cc: Pierre Floury <pierre.floury@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Maxime, All,

On 2023-01-30 15:46 +0100, Maxime Chevallier via buildroot spake thusly:
> Introduce the libtraceevent library, that used to be bundled with the
> trace-cmd tool. This library is now used by several tools and libraries
> such as trace-cmd, libtracefs and rtla.
> 
> This package tries to install libraries in /usr/local/lib by default,
> hence the redefinition of the "prefix" variable, so that the library
> gets installed in "/usr/lib" instead.
> 
> The same applies to the pkgconfig handling of the proved Makefile, which
> installs the .pc files in the /usr/local area by default, hence the
> redefinition of the pkgconfig_dir to either the correct directory within the
> staging area, or to empty value for the target to avoid installing the .pc
> in that case.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  DEVELOPERS                             |  3 +++
>  package/Config.in                      |  1 +
>  package/libtraceevent/Config.in        |  9 +++++++
>  package/libtraceevent/libtraceevent.mk | 33 ++++++++++++++++++++++++++

Missing hash file, see:
    https://buildroot.org/downloads/manual/manual.html#adding-packages-hash

[--SNIP--]
> diff --git a/package/libtraceevent/libtraceevent.mk b/package/libtraceevent/libtraceevent.mk
> new file mode 100644
> index 0000000000..0125023508
> --- /dev/null
> +++ b/package/libtraceevent/libtraceevent.mk
> @@ -0,0 +1,33 @@
> +################################################################################
> +#
> +# libtraceevent
> +#
> +################################################################################
> +
> +LIBTRACEEVENT_VERSION = 1.7.1
> +LIBTRACEEVENT_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot

Are the snapshots generated by git.kernel.org reproducible? I'd prefer
in this case, that we use the git download method.

> +LIBTRACEEVENT_INSTALL_STAGING = YES
> +LIBTRACEEVENT_LICENSE = GPL-2.0, LGPL-2.1
> +LIBTRACEEVENT_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
> +
> +define LIBTRACEEVENT_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)

Please, try to keep the ordering of common options the same across the
various _CMDS. For example, in _BUILD_CMDS, you have;
    $(TARGET_CONFIGURE_OPTS) -C $(@D)

while in _INSTALL_*_CMDS, you have:
    -C $(@D) $(TARGET_CONFIGURE_OPTS)

> +endef
> +
> +define LIBTRACEEVENT_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
> +	DESTDIR=$(STAGING_DIR) \
> +	pkgconfig_dir="/usr/lib/pkgconfig" \
> +	prefix="/usr" \
> +	install

Addiotnally indent continuation lines, i.e.:

    \t  $(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) \
    \t  \t  $(TARGET_CONFIGURE_OPTS) \
    \t  \t  DESTDIR=$(STAGING_DIR) \
    \t  \t  pkgconfig_dir="/usr/lib/pkgconfig" \
    \t  \t  prefix="/usr" \
    \t  \t  install

Why do we need MAKE1 in the install steps, and not in the build step?

Also, don't we need to also pass prefix=/usr at build time? Hmm, the
Makefile gnerates the .pc file at install time, not at build time (this
is not clean, but explains why we don;t need prefix at build time,
maybe?).

Regards,
Yann E. MORIN.

> +endef
> +
> +define LIBTRACEEVENT_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
> +	DESTDIR=$(TARGET_DIR) \
> +	pkgconfig_dir="" \
> +	prefix="/usr" \
> +	install
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.39.1
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
