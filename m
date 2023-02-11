Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C31BC61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 15:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D064E40360;
	Sat, 11 Feb 2023 15:02:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D064E40360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XVar-BFDaIvv; Sat, 11 Feb 2023 15:02:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0626403E7;
	Sat, 11 Feb 2023 15:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0626403E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B27851BF369
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 15:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98DEE81F45
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 15:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98DEE81F45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pd_chwYokz_E for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 15:02:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DD9281F2C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DD9281F2C
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 15:02:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 39C405FF9E;
 Sat, 11 Feb 2023 16:01:58 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 Feb 2023 16:01:57 +0100
Date: Sat, 11 Feb 2023 16:01:57 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230211150157.GG2796@scaer>
References: <20230208182731.15752-1-james.kent@orchestrated-technology.com>
 <8fe20693-4bf1-4378-d7c4-d81bcd9cf7ed@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8fe20693-4bf1-4378-d7c4-d81bcd9cf7ed@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676127721;
 bh=atudIYDUQrpYHm8JGcItNtNRDt+5sIdWQCiMH45IxGc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P0ux5sDY4BBuVcdlQfpPEIEn5X8WdW03+G+YQ5WIFNm8SxEmvmkiHjO1XQclheh/D
 XCgzBIcsbLZRO9GgvPXtcsw/U4j/WhKKBy5/6unVYHB0Tig4yCNcm9iIoGeIbC5lV+
 lfCXTB7lAGyuzp70AXjTeTyBnaRfIIL8x24y0OGnp8YIgmBG+s8WN2XFfeV4YhxwUe
 w3TMs6/FxhEiw/hexQFd+/b75wnYzzZMBpgCZMi4idbT3qhRuhnydwvEdWyri3OnOi
 B5ip8Bl91Vn1otfTWLzv3ZAKRBKbKWKljnSb664a7H+in+O/Wuf9v/M+51HXGYrlxh
 uyFVpoK7fgdzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=P0ux5sDY
Subject: Re: [Buildroot] [PATCH v2] package/chrony: add default unprivileged
 user option
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
Cc: James Kent <james.kent@orchestrated-technology.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, James, All,

On 2023-02-09 21:22 +0100, Arnout Vandecappelle spake thusly:
> On 08/02/2023 19:27, James Kent wrote:
> >Configurable option to define and enable by default an unprivileged
> >user which the Chrony daemon will assume once initialised. The
> >functionality requires libcap which is selected as necessary.
> >
> >This option supports the good security practice of dropping elevated
> >privileges for daemon runtime.
> >
> >The package configuration layout has been updated to current working
> >practice.
> >
> >Signed-off-by: James Kent <james.kent@orchestrated-technology.com>
> >---
[--SNIP--]
> >+config BR2_PACKAGE_CHRONY_USER
> >+	bool "chrony default unprivileged user"
>  Is there any reason to do this conditionally? For all other packages, we do
> it unconditionally.

From what I read, there are three situation to run chrony:
  - start as root and stay running as root;
  - start as root, setuid to a user either with a commandline option, or
    a configuration directive;
  - start as root, and setuid to a user defined at build-time (which can
    still be overriden on the commandline or a configuration directive).

What this patch does, is to allow for the third option.

As it was previously already possible to run as non-root, by just
enabling libcap in Buildroot's config, and adding the user configuration
directive in chrony's config file (or run it with -u), some people may
already do that in their setups, and we do not want to break that. So
those people do have eithe the config directive or the -u option, which
both take precendence over the build-time configuration.

As for those that do run as root, switching to a non-root user should
not have any impact in functionality.

So, we can safely unconditionally default to a compile-time non-root
user. Except, a linux kernel may only have the root user, see
CONFIG_MULTIUSER. But in that case we'd have tons of other packages that
are gonna whine...

Applied to master without the condition, thanks.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> >+	select BR2_PACKAGE_LIBCAP
> >+	help
> >+	  Define and enable default unprivileged user for the Chrony
> >+	  daemon to run as.
> >+
> >+endif
> >diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
> >index 379e95a778..16f8f082a3 100644
> >--- a/package/chrony/chrony.mk
> >+++ b/package/chrony/chrony.mk
> >@@ -21,6 +21,14 @@ CHRONY_CONF_OPTS = \
> >  ifeq ($(BR2_PACKAGE_LIBCAP),y)
> >  CHRONY_DEPENDENCIES += libcap
> >+
> >+ifeq ($(BR2_PACKAGE_CHRONY_USER),y)
> >+CHRONY_CONF_OPTS += --with-user=chrony
> >+define CHRONY_USERS
> >+	chrony -1 chrony -1 * /run/chrony - - Time daemon
> >+endef
> >+endif
> >+
> >  else
> >  CHRONY_CONF_OPTS += --without-libcap
> >  endif

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
