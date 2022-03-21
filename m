Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE46C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 21:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBDC841681;
	Mon, 21 Mar 2022 21:56:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pk9JF7UsYfJZ; Mon, 21 Mar 2022 21:56:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8A9A4167F;
	Mon, 21 Mar 2022 21:56:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03FBD1BF239
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 013D14167F
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:56:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ohWT1fubyPiG for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 21:56:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00DBD41678
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 21:56:39 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 g5-20020a4ae885000000b003240bc9b2afso20740867ooe.10
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 14:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rBTqkjD69A9qJgZtyKwn8iTkICn6dXAj0nqTMK0W7I4=;
 b=Emh4WOYCKSjYYaWmQmLnywskPlvpIm55Fgos2McWt0YUeW7bkje1TBCwrNKiMJi5Bz
 REn5JmTEtkBH3an3v9QiI0GnXNqXUL0LY4NGiLN3nJ79sTiEWuBIpHf/1IR6GAwycnqF
 OHzfXglllAzN2aD/iwwTqX6vf4VPkMixGBJvDLUiMCuytDdpo4BDGH3UvPCNINAgfQNc
 5t3B/+6wkPOxf8K9tcBKvzFA0LMdHp90vX986vy893YfIhJIs0K50/BM0VvRK4ca94Dr
 kUpcT3FX1mgFNe0FKnbRepG+FsrTKEMia3zq2y5cTqK66fSqtGqE+1E78qm/r5WqGgpD
 /daw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rBTqkjD69A9qJgZtyKwn8iTkICn6dXAj0nqTMK0W7I4=;
 b=K7QFFLUK4ukeNusstlk9xGd+K7UYWqbIsFdNzWzgT28WSBy0wsl2IIwmdAtLDBiwdo
 xEYAr8kKRSmwP18RofZNPsDTJ5e360VWib2rsVubGe0pOKd9/nI3YTdDJJwPaSfyn5GH
 p9ZdNQXxanR7Bj08H736DkNHtRB4OSYsKQF3vKO4W08f9S6u/HleQ633FOvkMYsxPj3W
 kdfcqVLk8jxwV2pQ13qlSBaQ4vRm2HnN7dI5GbZ8QFFTN3JQelienu9Zp967W2izr18Z
 yJi6MZuLuUt0RmccyqezJxIKcvjlH3WwxE86z6rMFyMtkCCnlemgB84X5fG4z5bD0FM8
 L74Q==
X-Gm-Message-State: AOAM531TRZCTrqnJTIgl8Nz777chICwLWEJNr/nmRLGDlzG314P+3v44
 TbWEk1FQzYaaaowPRTao9QDbGzCMcpKyXMnPDeE=
X-Google-Smtp-Source: ABdhPJz9bBQoU+Q3+Ul4RwCwSmT/lu4ERX9HJpRlfzHspW1u69MB8JzbdWqQolUkSZRqmOxCXUDjlbiKAuqeYUqR1s8=
X-Received: by 2002:a05:6871:8ab:b0:dd:b74b:409a with SMTP id
 r43-20020a05687108ab00b000ddb74b409amr457081oaq.200.1647899798902; Mon, 21
 Mar 2022 14:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220316060219.3448648-1-james.hilliard1@gmail.com>
 <bc8efa1c-2b83-1c88-104f-bb48aa05f4b2@mind.be>
In-Reply-To: <bc8efa1c-2b83-1c88-104f-bb48aa05f4b2@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Mar 2022 15:56:27 -0600
Message-ID: <CADvTj4oUr8TUjbATPG=qGrxMgdg5VcMyGCCM4VpWyExV9tVs4g@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pillow: fix pkg-config
 search paths
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Mar 21, 2022 at 3:32 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>   Hi James,
>
> On 16/03/2022 07:02, James Hilliard wrote:
> > Currently pillow doesn't correctly search pkg-config system paths
> > for some libraries which can prevent some libraries from being
> > properly detected/enabled in pillow.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   ...Search-pkg-config-system-libs-cflags.patch | 33 +++++++++++++++++++
> >   package/python-pillow/python-pillow.mk        | 23 +++----------
> >   2 files changed, 37 insertions(+), 19 deletions(-)
> >   create mode 100644 package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
> >
> > diff --git a/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch b/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
> > new file mode 100644
> > index 0000000000..9f979b048f
> > --- /dev/null
> > +++ b/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
> > @@ -0,0 +1,33 @@
> > +From 89c9c347bb7437d5ea559930e315f42a0236761f Mon Sep 17 00:00:00 2001
> > +From: James Hilliard <james.hilliard1@gmail.com>
> > +Date: Tue, 15 Mar 2022 23:31:59 -0600
> > +Subject: [PATCH] Search pkg-config system libs/cflags.
> > +
> > +We need to search the system paths as well from pkg-config for
> > +some packages to be found properly.
> > +
> > +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > +[Upstream status:
> > +https://github.com/python-pillow/Pillow/pull/6138]
> > +---
> > + setup.py | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/setup.py b/setup.py
> > +index 3468b260..59d65ce2 100755
> > +--- a/setup.py
> > ++++ b/setup.py
> > +@@ -252,8 +252,8 @@ def _cmd_exists(cmd):
> > + def _pkg_config(name):
> > +     try:
> > +         command = os.environ.get("PKG_CONFIG", "pkg-config")
> > +-        command_libs = [command, "--libs-only-L", name]
> > +-        command_cflags = [command, "--cflags-only-I", name]
> > ++        command_libs = [command, "--libs-only-L", "--keep-system-libs", name]
> > ++        command_cflags = [command, "--cflags-only-I", "--keep-system-cflags", name]
>
>   You gave an additional explanation why this is needed in the upstream PR:
>
> Zlib and anything that has headers in the normal system libs/include folders
> seems to not get their headers picked up without this change.
>
> I think this issue is mostly going to be something people hit when cross
> compiling since the prefix based system libs/include folder would probably work
> in most of the usual cases(searching in sys.prefix will not work when cross
> compiling since it points to the host toolchain prefix rather than the target
> toolchain sysroot prefix):
>
>
>   However, that implies that either we have to make sure that sys.prefix is set
> correctly (i.e. point it to staging instead of host), or pillow is using
> sys.prefix incorrectly.

I think pillow is using sys.prefix in a way that is not really cross compilation
compatible, however using pkg-config with sysm libs/cflags seems to be
sufficient
for it to pass its non-standard header checks.

>
>   Before that, still, I don't understand how this can be an issue. Unless if
> pillow also passes something like -nostdinc, our toolchain wrapper should make
> sure that staging/usr/include is in the search path.

It's due to pillow having custom header checks like this:
https://github.com/python-pillow/Pillow/blob/9.0.1/setup.py#L633

>
>   There also doesn't seem to be an autobuilder failure due to this... But maybe
> it builds successfully, just without some optional dependency? Please provide
> more details about the failure in the commit message.

The failure was getting hidden by the non-standard build/install cmd
overrides it
would appear, it seemed pillow was getting built for the host instead
of the target with
those, I didn't investigate in too much detail as those custom
build/install overrides
are not actually needed.

>
>
>
> > +         if not DEBUG:
> > +             command_libs.append("--silence-errors")
> > +             command_cflags.append("--silence-errors")
> > +--
> > +2.35.1
> > +
> > diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
> > index 901876e0ee..ef677855b2 100644
> > --- a/package/python-pillow/python-pillow.mk
> > +++ b/package/python-pillow/python-pillow.mk
> > @@ -12,7 +12,10 @@ PYTHON_PILLOW_LICENSE_FILES = LICENSE
> >   PYTHON_PILLOW_CPE_ID_VENDOR = python
> >   PYTHON_PILLOW_CPE_ID_PRODUCT = pillow
> >   PYTHON_PILLOW_SETUP_TYPE = setuptools
> > -PYTHON_PILLOW_BUILD_OPTS = --disable-platform-guessing
> > +PYTHON_PILLOW_ENV = MAX_CONCURRENCY="$(PARALLEL_JOBS)"
>
>   This change isn't explained in the commit message, and seems unrelated.
>
> > +
> > +PYTHON_PILLOW_DEPENDENCIES = host-pkgconf
> > +PYTHON_PILLOW_BUILD_OPTS = build_ext --disable-platform-guessing
>
>   The need for these two changes is also not clear at all from the commit message.
>
>
>   I've marked the patch as Changes Requested.
>
>   Regards,
>   Arnout
>
> >
> >   ifeq ($(BR2_PACKAGE_FREETYPE),y)
> >   PYTHON_PILLOW_DEPENDENCIES += freetype
> > @@ -68,22 +71,4 @@ else
> >   PYTHON_PILLOW_BUILD_OPTS += --disable-webp --disable-webpmux
> >   endif
> >
> > -define PYTHON_PILLOW_BUILD_CMDS
> > -     cd $(PYTHON_PILLOW_BUILDDIR); \
> > -             PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
> > -             $(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
> > -             $(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
> > -             $(PYTHON_PILLOW_BASE_BUILD_OPTS) $(PYTHON_PILLOW_BUILD_OPTS)
> > -endef
> > -
> > -define PYTHON_PILLOW_INSTALL_TARGET_CMDS
> > -     cd $(PYTHON_PILLOW_BUILDDIR); \
> > -             PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
> > -             $(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
> > -             $(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
> > -             $(PYTHON_PILLOW_BUILD_OPTS) install \
> > -             $(PYTHON_PILLOW_BASE_INSTALL_TARGET_OPTS) \
> > -             $(PYTHON_PILLOW_INSTALL_TARGET_OPTS)
> > -endef
> > -
> >   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
