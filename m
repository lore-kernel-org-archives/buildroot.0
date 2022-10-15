Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9E1C4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 01:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59A4A40477;
	Sat, 15 Oct 2022 01:16:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59A4A40477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DThz0J5fwWxh; Sat, 15 Oct 2022 01:16:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 287854013A;
	Sat, 15 Oct 2022 01:16:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 287854013A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B7B641BF2BE
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 01:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92E964013A
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 01:16:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92E964013A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yGHaTJVUvXCv for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 01:16:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B2424011A
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B2424011A
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 01:16:26 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id d10so6382510pfh.6
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 18:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AZxjh6eS37sLaDazrfmm7guTLI6VKv6ZcliEHhmyD5M=;
 b=JmzWg6p36WcWPVYPThmYfI5OtXqWy1vZ981MvJK48GYaRgojyJ2X+1bcnDTRuDwKOR
 lK0QCSVeCbwme2ntd/YceiwanGsHxECb+u0kitxpQuEAmbZLZVGkvCDdfpe+TUQXoSX1
 7p4uMQceGQS+oyPDIK8giJryaNk5KOTvv3Pit1ZQEs4p6XUqe3R6LR/IuYH9IkcWze2c
 Pb9ElsMMaQlBUWCQF9yvhKY7tugsWobSmJ0D5NeOtzBCpjBGvsGQpA2gAyRjq7fEzJjA
 CfW3/q7niaL7wBjNIzhFWs8pWGACSmkk/Nd9WNbrH0o+WOO9CZIT8N21KlvIf//CsRFW
 tLgA==
X-Gm-Message-State: ACrzQf0OB+KLIlv/s0PCA1556JTb9bllQGACTsc4x/1iX46Vo7qmvx7s
 fakHqCzBgz5fW1ISVwmBQGecXxxUnqw/TqVYAq+dA1Ym/6QAjg==
X-Google-Smtp-Source: AMsMyM78Zv20DwGVK4Tfe3JEp3S1g/qNj8hCGIWFj5zOjP8qJBElIbSt7oVzUg3tZ4RtG4rb7GW5fTJD5PIyWs7r06c=
X-Received: by 2002:a05:6a00:1410:b0:528:5a5a:d846 with SMTP id
 l16-20020a056a00141000b005285a5ad846mr695982pfu.9.1665796585865; Fri, 14 Oct
 2022 18:16:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221010003515.796446-1-james.hilliard1@gmail.com>
 <20221014202611.GH2503@scaer>
In-Reply-To: <20221014202611.GH2503@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 14 Oct 2022 21:16:14 -0400
Message-ID: <CADvTj4rWAecha_d2D=miLAJu8z1SLy=mKJNJ4GbO5ZVJkS8dcQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AZxjh6eS37sLaDazrfmm7guTLI6VKv6ZcliEHhmyD5M=;
 b=PYP67GyICYXgIrvrPTRa9JUVUi38emzqJG1qLTfmMaebTyidKevB4EXCSPngF46jMK
 aae7a/3hai16I4Qaw5X6ANKJUNQfmnmkTDwFpnKpcbbCjWP9AcvgEyYj3ocG5EOIRW0j
 BWhvnF/3D8y0MG2NI5sovgHnUYJPofvRK/JMW93XO5FJouAW8E/jTuN+PgeAvOs3qMp/
 iXGugSUm7V23t96YmwhrfTIK9vaKhNDC3vKMzcpGIwkrI73gTySh4Mlud+Q424wC6peQ
 5IT/yr/vTQUX49SoaGhpQSc5/fENWuo7Dg7nXjDiH9ZuyAyw2mwM0e0WbQ4jBLj0uv+V
 lI+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PYP67GyI
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

On Fri, Oct 14, 2022 at 4:26 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2022-10-09 18:35 -0600, James Hilliard spake thusly:
> > Backport a patch fixing compatibility with upcoming make 4.4.
> >
> > Fixes:
> >  - http://autobuild.buildroot.net/results/5a3/5a3f6414d75fbc8a272258bf3bdb6f4fe7e6da34
> >  - http://autobuild.buildroot.net/results/481/481c4617813da031beddaf00b97440071f646809
> >  - http://autobuild.buildroot.net/results/cf1/cf152e7a95bec3b6ebd0209dd716cbec56f9d477
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> Applied to master, thanks.
>
> I'm afraid we'll get more packages that will suffer from that, but it
> at least looks like our own Makefile is immune to it:
>
>     QUIET := $(if $(findstring s,$(filter-out --%,$(MAKEFLAGS))),-q)
>
> which seems to be the only place we act on MAKEFLAGS.
>
> Hmm Or maybe not, after all. Can we have somthing like:
>
>     --some-option=some-string
> which can be written as:
>     --some-option some-string
>
> in which case our code would hit the "some-string" and interpret it as
> silent...

This should fix any issues with QUIET:
https://patchwork.ozlabs.org/project/buildroot/patch/20221014230905.3091021-1-james.hilliard1@gmail.com/

Also MAKE1 is broken, this should fix it:
https://patchwork.ozlabs.org/project/buildroot/patch/20221015005611.4054933-1-james.hilliard1@gmail.com/

>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  ...KEFLAGS-assignment-for-upcoming-make.patch | 117 ++++++++++++++++++
> >  1 file changed, 117 insertions(+)
> >  create mode 100644 package/glibc/0002-Makerules-fix-MAKEFLAGS-assignment-for-upcoming-make.patch
> >
> > diff --git a/package/glibc/0002-Makerules-fix-MAKEFLAGS-assignment-for-upcoming-make.patch b/package/glibc/0002-Makerules-fix-MAKEFLAGS-assignment-for-upcoming-make.patch
> > new file mode 100644
> > index 0000000000..0c82d7abbe
> > --- /dev/null
> > +++ b/package/glibc/0002-Makerules-fix-MAKEFLAGS-assignment-for-upcoming-make.patch
> > @@ -0,0 +1,117 @@
> > +From 2d7ed98add14f75041499ac189696c9bd3d757fe Mon Sep 17 00:00:00 2001
> > +From: Sergei Trofimovich <slyich@gmail.com>
> > +Date: Tue, 13 Sep 2022 13:39:13 -0400
> > +Subject: [PATCH] Makerules: fix MAKEFLAGS assignment for upcoming make-4.4
> > + [BZ# 29564]
> > +
> > +make-4.4 will add long flags to MAKEFLAGS variable:
> > +
> > +    * WARNING: Backward-incompatibility!
> > +      Previously only simple (one-letter) options were added to the MAKEFLAGS
> > +      variable that was visible while parsing makefiles.  Now, all options
> > +      are available in MAKEFLAGS.
> > +
> > +This causes locale builds to fail when long options are used:
> > +
> > +    $ make --shuffle
> > +    ...
> > +    make  -C localedata install-locales
> > +    make: invalid shuffle mode: '1662724426r'
> > +
> > +The change fixes it by passing eash option via whitespace and dashes.
> > +That way option is appended to both single-word form and whitespace
> > +separated form.
> > +
> > +While at it fixed --silent mode detection in $(MAKEFLAGS) by filtering
> > +out --long-options. Otherwise options like --shuffle flag enable silent
> > +mode unintentionally. $(silent-make) variable consolidates the checks.
> > +
> > +Resolves: BZ# 29564
> > +
> > +CC: Paul Smith <psmith@gnu.org>
> > +CC: Siddhesh Poyarekar <siddhesh@gotplt.org>
> > +Signed-off-by: Sergei Trofimovich <slyich@gmail.com>
> > +Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
> > +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > +[james.hilliard1@gmail.com: backport from upstream commit
> > +2d7ed98add14f75041499ac189696c9bd3d757fe]
> > +---
> > + Makeconfig     | 18 +++++++++++++++++-
> > + Makerules      |  4 ++--
> > + elf/rtld-Rules |  2 +-
> > + 3 files changed, 20 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/Makeconfig b/Makeconfig
> > +index f8164a0025..842f49eb58 100644
> > +--- a/Makeconfig
> > ++++ b/Makeconfig
> > +@@ -43,6 +43,22 @@ else
> > + $(error objdir must be defined by the build-directory Makefile)
> > + endif
> > +
> > ++# Did we request 'make -s' run? "yes" or "no".
> > ++# Starting from make-4.4 MAKEFLAGS now contains long
> > ++# options like '--shuffle'. To detect presence of 's'
> > ++# we pick first word with short options. Long options
> > ++# are guaranteed to come after whitespace. We use '-'
> > ++# prefix to always have a word before long options
> > ++# even if no short options were passed.
> > ++# Typical MAKEFLAGS values to watch for:
> > ++#   "rs --shuffle=42" (silent)
> > ++#   " --shuffle" (not silent)
> > ++ifeq ($(findstring s, $(firstword -$(MAKEFLAGS))),)
> > ++silent-make := no
> > ++else
> > ++silent-make := yes
> > ++endif
> > ++
> > + # Root of the sysdeps tree.
> > + sysdep_dir := $(..)sysdeps
> > + export sysdep_dir := $(sysdep_dir)
> > +@@ -917,7 +933,7 @@ endif
> > + # umpteen zillion filenames along with it (we use `...' instead)
> > + # but we don't want this echoing done when the user has said
> > + # he doesn't want to see commands echoed by using -s.
> > +-ifneq       "$(findstring s,$(MAKEFLAGS))" ""       # if -s
> > ++ifeq ($(silent-make),yes)                   # if -s
> > + +cmdecho    := echo >/dev/null
> > + else                                                # not -s
> > + +cmdecho    := echo
> > +diff --git a/Makerules b/Makerules
> > +index d1e139d03c..09c0cf8357 100644
> > +--- a/Makerules
> > ++++ b/Makerules
> > +@@ -794,7 +794,7 @@ endif
> > + # Maximize efficiency by minimizing the number of rules.
> > + .SUFFIXES:  # Clear the suffix list.  We don't use suffix rules.
> > + # Don't define any builtin rules.
> > +-MAKEFLAGS := $(MAKEFLAGS)r
> > ++MAKEFLAGS := $(MAKEFLAGS) -r
> > +
> > + # Generic rule for making directories.
> > + %/:
> > +@@ -811,7 +811,7 @@ MAKEFLAGS := $(MAKEFLAGS)r
> > + .PRECIOUS: $(foreach l,$(libtypes),$(patsubst %,$(common-objpfx)$l,c))
> > +
> > + # Use the verbose option of ar and tar when not running silently.
> > +-ifeq        "$(findstring s,$(MAKEFLAGS))" ""       # if not -s
> > ++ifeq ($(silent-make),no)                    # if not -s
> > + verbose := v
> > + else                                                # -s
> > + verbose     :=
> > +diff --git a/elf/rtld-Rules b/elf/rtld-Rules
> > +index ca00dd1fe2..3c5e273f2b 100644
> > +--- a/elf/rtld-Rules
> > ++++ b/elf/rtld-Rules
> > +@@ -52,7 +52,7 @@ $(objpfx)rtld-libc.a: $(foreach dir,$(rtld-subdirs),\
> > +     mv -f $@T $@
> > +
> > + # Use the verbose option of ar and tar when not running silently.
> > +-ifeq        "$(findstring s,$(MAKEFLAGS))" ""       # if not -s
> > ++ifeq ($(silent-make),no)                    # if not -s
> > + verbose := v
> > + else                                                # -s
> > + verbose     :=
> > +--
> > +2.34.1
> > +
> > --
> > 2.34.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
