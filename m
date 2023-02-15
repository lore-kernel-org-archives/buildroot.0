Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729D3C636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 06:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0199381ECD;
	Wed, 15 Feb 2023 06:30:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0199381ECD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BN84QH-hKL72; Wed, 15 Feb 2023 06:30:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 284A981ECE;
	Wed, 15 Feb 2023 06:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 284A981ECE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 83A131BF84C
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 06:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AECD60BAA
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 06:30:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AECD60BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IpidAMFF1Fae for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 06:30:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34A1560B8B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34A1560B8B
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 06:30:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A27C85FF67;
 Wed, 15 Feb 2023 07:29:56 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 15 Feb 2023 07:29:56 +0100
Date: Wed, 15 Feb 2023 07:29:56 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230215062956.GA2718518@scaer>
References: <20230210215548.1050371-1-yann.morin.1998@free.fr>
 <4f51a196-e922-1e9e-6fbb-e81b35dc9f73@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4f51a196-e922-1e9e-6fbb-e81b35dc9f73@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676442600;
 bh=4xkMjTB9yVuNbfH/SG9irS9R3+HYWmoGoXktwz8OCRg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WwRotEKe7gpzqVLe3vvp3kGTfm3KEKRZjXqlLfgwHT7f2QDdZvTOfVVqYUosaZJir
 h6RSbbDH5V1oWJAyqTesDr9o6jm1+0Y0a0dNQCSWdjofTuMrPT2Rl9YeTUILG1HtZw
 IkUl2bPneK6Y/Pvpf0CkcVFqD59piderx9+eqa8eYWEgnzBJGHvjVDbdRoeBdOImIt
 cKBDEjgOpKsrlwRgL2s8WwReQ0PodugLfIYIOAnLvqAi2BqnxSEBvJDCExZwYTAsR0
 +KJnb2VqDuRwpSutazZjDKAqPEouMFh6AfQY0Twm5YMU1jlut0aMaQHjd3sHiMokHI
 22nj/l2EjxeHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WwRotEKe
Subject: Re: [Buildroot] [PATCH] package/erlang: do not hard-code the Erlang
 Interface Version (EI_VSN)
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
Cc: Will Newton <will.newton@gmail.com>,
 Johan Oudinet <johan.oudinet@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2023-02-14 22:30 +0100, Arnout Vandecappelle spake thusly:
> On 10/02/2023 22:55, Yann E. MORIN wrote:
[--SNIP--]
> >Although both the host and target erlang are the same, we still look
> >into the corresponding file to extract the version. This is so that it
> >would be easier if in the future we ever manage to rely on a
> >system-installed erlang that could have a EI_VSN different from the
> >target one.

This ^^^ [0] ...

[--SNIP--]
> >@@ -36,9 +36,9 @@ ERLANG_PRE_CONFIGURE_HOOKS += ERLANG_RUN_AUTOCONF
> >  HOST_ERLANG_DEPENDENCIES += host-autoconf
> >  HOST_ERLANG_PRE_CONFIGURE_HOOKS += ERLANG_RUN_AUTOCONF
> >-# Whenever updating Erlang, this value should be updated as well, to the
> >-# value of EI_VSN in the file lib/erl_interface/vsn.mk
> >-ERLANG_EI_VSN = 3.13.2.2
> >+# Return the EIV (Erlang Interface Version, EI_VSN)
> >+# $(1): base directory, i.e. either $(HOST_DIR) or $(STAGING_DIR)/usr
> >+erlang_ei_vsn = `sed -r -e '/^erl_interface-(.+)/!d; s//\1/' $(1)/lib/erlang/releases/$(ERLANG_RELEASE)/installed_application_versions`
>  Since this is only used by rebar-package, I think it should move to pkg-rebar.mk.

I also thought about that, but the knowledge where the file is installed
is in erlang, so it makes sense that erlang exports away its own
version, like the variable was set previously.

That's also what we do for AUTOCONF, AUTORECONF, AUTOMAKE et al: they
are defined in their respective packages, but used in the
autotools-package infra.

> >  # The configure checks for these functions fail incorrectly
> >  ERLANG_CONF_ENV = ac_cv_func_isnan=yes ac_cv_func_isinf=yes
> >diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
> >index e4e3f3bb6c..4b993dd970 100644
> >--- a/package/pkg-rebar.mk
> >+++ b/package/pkg-rebar.mk
> >@@ -32,10 +32,10 @@ REBAR_TARGET_DEPS_DIR = $(STAGING_DIR)/usr/share/rebar/deps
> >  #
> >  REBAR_HOST_DEPS_ENV = \
> >  	ERL_COMPILER_OPTIONS='{i, "$(REBAR_HOST_DEPS_DIR)"}' \
> >-	ERL_EI_LIBDIR=$(HOST_DIR)/lib/erlang/lib/erl_interface-$(ERLANG_EI_VSN)/lib
> >+	ERL_EI_LIBDIR=$(HOST_DIR)/lib/erlang/lib/erl_interface-$(call erlang_ei_vsn,$(HOST_DIR))/lib

... [0] explains this ^^^, and ...

>  Since we support only one erlang version, we could just as well put
> $(wildcard $(HOST_DIR)/lib/erlang/lib/erl_interface-*/lib)

... [0] answers that, I believe. ;-)

> or does that directory not necessarily exist yet after erlang has been installed?

The directory does exist, as erl_interface is installed by erlang (it is
kind of part of its stdlib, I'd say), and thus is registered by erlang
itself.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> 
> >  REBAR_TARGET_DEPS_ENV = \
> >  	ERL_COMPILER_OPTIONS='{i, "$(REBAR_TARGET_DEPS_DIR)"}' \
> >-	ERL_EI_LIBDIR=$(STAGING_DIR)/usr/lib/erlang/lib/erl_interface-$(ERLANG_EI_VSN)/lib
> >+	ERL_EI_LIBDIR=$(STAGING_DIR)/usr/lib/erlang/lib/erl_interface-$(call erlang_ei_vsn,$(STAGING_DIR)/usr)/lib
> >  ################################################################################
> >  # Helper functions

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
