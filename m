Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3FEC433FE
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 20:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0D0681BB0;
	Fri, 14 Oct 2022 20:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0D0681BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uRMKdeubpidC; Fri, 14 Oct 2022 20:26:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9301381B70;
	Fri, 14 Oct 2022 20:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9301381B70
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 722661BF47A
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 20:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5ACE681B70
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 20:26:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ACE681B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rZeOZZGY_rwE for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 20:26:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4AFD81B60
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4AFD81B60
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 20:26:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:20fb:14f0:36e1:8c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id CCCEB2003DA;
 Fri, 14 Oct 2022 22:26:11 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 14 Oct 2022 22:26:11 +0200
Date: Fri, 14 Oct 2022 22:26:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221014202611.GH2503@scaer>
References: <20221010003515.796446-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221010003515.796446-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1665779175;
 bh=14jWHKAx8kL6HbraUBu41rNuxGAtW2MI1NHr6AIQ0iQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SKtURHgWWZkcrROa9SUYY7p2KjRYIFQXzmszlno/6KFjOnnY0qkIpYv/7nm3NaBV2
 2Kw8bk9JOX9v3jVsQtcJgOy4k2GRLyIEtEKDYHqt7mM6pZppQeMRzi2TyytYSUhq0A
 YovlEX+RjGeH6s0pbtVnymhS9oOgRkX8of9pRrvVhELHt4l2GaKdKRtuO7BuHr25OF
 5BOBODcn9AbeCWyeprp9bEmi/jbX7YxYDmZaTlfbfNFjQ/j5Zz4gr/CeASJluFPkXj
 Y9IHRKHcGrHavFzhBkla9tMJbitjPJkJuCQiTj9bV6M4IMmasNUaQjE4NlThB6wXQh
 NB3bFwlCp246w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SKtURHgW
Subject: Re: [Buildroot] [PATCH 1/1] package/glibc: fix make-4.4
 compatibility
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-10-09 18:35 -0600, James Hilliard spake thusly:
> Backport a patch fixing compatibility with upcoming make 4.4.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/5a3/5a3f6414d75fbc8a272258bf3bdb6f4fe7e6da34
>  - http://autobuild.buildroot.net/results/481/481c4617813da031beddaf00b97440071f646809
>  - http://autobuild.buildroot.net/results/cf1/cf152e7a95bec3b6ebd0209dd716cbec56f9d477
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

I'm afraid we'll get more packages that will suffer from that, but it
at least looks like our own Makefile is immune to it:

    QUIET := $(if $(findstring s,$(filter-out --%,$(MAKEFLAGS))),-q)

which seems to be the only place we act on MAKEFLAGS.

Hmm Or maybe not, after all. Can we have somthing like:

    --some-option=some-string
which can be written as:
    --some-option some-string

in which case our code would hit the "some-string" and interpret it as
silent...

Regards,
Yann E. MORIN.

> ---
>  ...KEFLAGS-assignment-for-upcoming-make.patch | 117 ++++++++++++++++++
>  1 file changed, 117 insertions(+)
>  create mode 100644 package/glibc/0002-Makerules-fix-MAKEFLAGS-assignment-for-upcoming-make.patch
> 
> diff --git a/package/glibc/0002-Makerules-fix-MAKEFLAGS-assignment-for-upcoming-make.patch b/package/glibc/0002-Makerules-fix-MAKEFLAGS-assignment-for-upcoming-make.patch
> new file mode 100644
> index 0000000000..0c82d7abbe
> --- /dev/null
> +++ b/package/glibc/0002-Makerules-fix-MAKEFLAGS-assignment-for-upcoming-make.patch
> @@ -0,0 +1,117 @@
> +From 2d7ed98add14f75041499ac189696c9bd3d757fe Mon Sep 17 00:00:00 2001
> +From: Sergei Trofimovich <slyich@gmail.com>
> +Date: Tue, 13 Sep 2022 13:39:13 -0400
> +Subject: [PATCH] Makerules: fix MAKEFLAGS assignment for upcoming make-4.4
> + [BZ# 29564]
> +
> +make-4.4 will add long flags to MAKEFLAGS variable:
> +
> +    * WARNING: Backward-incompatibility!
> +      Previously only simple (one-letter) options were added to the MAKEFLAGS
> +      variable that was visible while parsing makefiles.  Now, all options
> +      are available in MAKEFLAGS.
> +
> +This causes locale builds to fail when long options are used:
> +
> +    $ make --shuffle
> +    ...
> +    make  -C localedata install-locales
> +    make: invalid shuffle mode: '1662724426r'
> +
> +The change fixes it by passing eash option via whitespace and dashes.
> +That way option is appended to both single-word form and whitespace
> +separated form.
> +
> +While at it fixed --silent mode detection in $(MAKEFLAGS) by filtering
> +out --long-options. Otherwise options like --shuffle flag enable silent
> +mode unintentionally. $(silent-make) variable consolidates the checks.
> +
> +Resolves: BZ# 29564
> +
> +CC: Paul Smith <psmith@gnu.org>
> +CC: Siddhesh Poyarekar <siddhesh@gotplt.org>
> +Signed-off-by: Sergei Trofimovich <slyich@gmail.com>
> +Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +[james.hilliard1@gmail.com: backport from upstream commit
> +2d7ed98add14f75041499ac189696c9bd3d757fe]
> +---
> + Makeconfig     | 18 +++++++++++++++++-
> + Makerules      |  4 ++--
> + elf/rtld-Rules |  2 +-
> + 3 files changed, 20 insertions(+), 4 deletions(-)
> +
> +diff --git a/Makeconfig b/Makeconfig
> +index f8164a0025..842f49eb58 100644
> +--- a/Makeconfig
> ++++ b/Makeconfig
> +@@ -43,6 +43,22 @@ else
> + $(error objdir must be defined by the build-directory Makefile)
> + endif
> + 
> ++# Did we request 'make -s' run? "yes" or "no".
> ++# Starting from make-4.4 MAKEFLAGS now contains long
> ++# options like '--shuffle'. To detect presence of 's'
> ++# we pick first word with short options. Long options
> ++# are guaranteed to come after whitespace. We use '-'
> ++# prefix to always have a word before long options
> ++# even if no short options were passed.
> ++# Typical MAKEFLAGS values to watch for:
> ++#   "rs --shuffle=42" (silent)
> ++#   " --shuffle" (not silent)
> ++ifeq ($(findstring s, $(firstword -$(MAKEFLAGS))),)
> ++silent-make := no
> ++else
> ++silent-make := yes
> ++endif
> ++
> + # Root of the sysdeps tree.
> + sysdep_dir := $(..)sysdeps
> + export sysdep_dir := $(sysdep_dir)
> +@@ -917,7 +933,7 @@ endif
> + # umpteen zillion filenames along with it (we use `...' instead)
> + # but we don't want this echoing done when the user has said
> + # he doesn't want to see commands echoed by using -s.
> +-ifneq	"$(findstring s,$(MAKEFLAGS))" ""	# if -s
> ++ifeq ($(silent-make),yes)			# if -s
> + +cmdecho	:= echo >/dev/null
> + else						# not -s
> + +cmdecho	:= echo
> +diff --git a/Makerules b/Makerules
> +index d1e139d03c..09c0cf8357 100644
> +--- a/Makerules
> ++++ b/Makerules
> +@@ -794,7 +794,7 @@ endif
> + # Maximize efficiency by minimizing the number of rules.
> + .SUFFIXES:	# Clear the suffix list.  We don't use suffix rules.
> + # Don't define any builtin rules.
> +-MAKEFLAGS := $(MAKEFLAGS)r
> ++MAKEFLAGS := $(MAKEFLAGS) -r
> + 
> + # Generic rule for making directories.
> + %/:
> +@@ -811,7 +811,7 @@ MAKEFLAGS := $(MAKEFLAGS)r
> + .PRECIOUS: $(foreach l,$(libtypes),$(patsubst %,$(common-objpfx)$l,c))
> + 
> + # Use the verbose option of ar and tar when not running silently.
> +-ifeq	"$(findstring s,$(MAKEFLAGS))" ""	# if not -s
> ++ifeq ($(silent-make),no)			# if not -s
> + verbose := v
> + else	   					# -s
> + verbose	:=
> +diff --git a/elf/rtld-Rules b/elf/rtld-Rules
> +index ca00dd1fe2..3c5e273f2b 100644
> +--- a/elf/rtld-Rules
> ++++ b/elf/rtld-Rules
> +@@ -52,7 +52,7 @@ $(objpfx)rtld-libc.a: $(foreach dir,$(rtld-subdirs),\
> + 	mv -f $@T $@
> + 
> + # Use the verbose option of ar and tar when not running silently.
> +-ifeq	"$(findstring s,$(MAKEFLAGS))" ""	# if not -s
> ++ifeq ($(silent-make),no)			# if not -s
> + verbose := v
> + else						# -s
> + verbose	:=
> +-- 
> +2.34.1
> +
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
