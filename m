Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E51CECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 19:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15EB160AE0;
	Sun, 30 Oct 2022 19:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15EB160AE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iXdPVsy0vcOF; Sun, 30 Oct 2022 19:01:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7FDA60AD6;
	Sun, 30 Oct 2022 19:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7FDA60AD6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 42C611BF473
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BF4940182
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:01:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BF4940182
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HJ4j568juWRP for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 19:01:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CE6940151
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CE6940151
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 19:01:34 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 q1-20020a17090a750100b002139ec1e999so4227841pjk.1
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 12:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fwr1o0/Bq0XJ2ZoZwwU/L/fh/FBp4rrNlDoQw7nK26U=;
 b=P7R1rthqOUr6NwuLizPTkxC8ORHDTyDXj867rDEj1JDvhoo36VAjwr0Jchu1EbxshQ
 zHXhuvaQP3a1RXAn3zizX/cDKCZE+2Vf4WbDAaVA46Kk7oHZpuhsatSvPTCiytthQm9I
 wBo1tZSOsuu6CBTt7yBai6icW0FwXJeiy1vBXT2fs5Skr5hToO6PiXhSjo9bSHDu67EG
 PDhJY/h/pyXhqyMUrUMpReJVFOoouoswaEeEanikCYyysGUOVnVQkLwoMxa1NVbpMth7
 jbLt9CSOpshs7rwBk7MnWtGpXAR0R3tGB5rCO2G1QRBkyCniZYYtUaLUalfqSZp82cvW
 S2xA==
X-Gm-Message-State: ACrzQf0GSI3vRFh06IZ5yrmNp61FV+HiaOJvA3TQFM9vK06LIlWFdWuq
 yZpVoDoZ1UgpIX7rNddlw+W+Q3SCKKLe/wS6sUI=
X-Google-Smtp-Source: AMsMyM6HDjUyMz+6094hf4YWFcqVAhi65SQFApVsNqsUQoiV7WfojqlX4Rhw/cuNkNmI3xggK0zDw7lH1qaM7VMJOg8=
X-Received: by 2002:a17:902:b598:b0:184:e49d:3042 with SMTP id
 a24-20020a170902b59800b00184e49d3042mr10558887pls.16.1667156494444; Sun, 30
 Oct 2022 12:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <20221030164840.BABD7875A8@busybox.osuosl.org>
 <CADvTj4rQSTfOnwo6KJBh_fJygJ4y=WgjK9CU9ThqRzknXdzLRQ@mail.gmail.com>
In-Reply-To: <CADvTj4rQSTfOnwo6KJBh_fJygJ4y=WgjK9CU9ThqRzknXdzLRQ@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 30 Oct 2022 15:01:22 -0400
Message-ID: <CADvTj4ohzEzeX5=j90zufcJergTn+jVZ3LV3cR3eGvOC4ZpZYg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fwr1o0/Bq0XJ2ZoZwwU/L/fh/FBp4rrNlDoQw7nK26U=;
 b=Pnpk9z4IdFt3URVKeePVyyfXOwctUYDUn/MszEXzDcb6ojXY9BnESvcXAvGIaraNUd
 QbftInqGO5SDiUeKuThGINPE0Gjti/JkkUfoeFWTW5BZIn9fWoe0Mo791yBiQVqr0IbC
 JGxOZFR6Nm+Bo/E/+KFrkQIjixZVogdP71Og5qgmqXBnbfmdcIcGeQqFUATBqcUd6qZx
 M6Lm0m8y25D4P9Km1/CP+J3lUAuzS/h42Ii6/PTgJ5OKONuAx8XX+wU41sWT73bS5ME0
 0NkCWs+YLkl8TNzqv2MFdIs2pgUWGHl5nlk9G/UCt/eo+EQV6aLmAYA+B76hoIv21Ar3
 QIHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Pnpk9z4I
Subject: Re: [Buildroot] [git commit] Force cmake packages to use makefiles
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

On Sun, Oct 30, 2022 at 2:53 PM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Sun, Oct 30, 2022 at 12:48 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >
> > commit: https://git.buildroot.net/buildroot/commit/?id=a5d8582e37b8b7440a71d4cad68e85bebc4aec6c
> > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> >
> > Force cmake packages to use the "Unix Makefiles" generator
> > in case CMAKE_GENERATOR is set in the host environment. This
> > patch further isolates the buildroot build environment from
> > the host.
>
> All autobuilders appear to have broken due to this commit:
> http://autobuild.buildroot.net/results/b0c/b0c61adbe7d512d0b5f6850b2fb3aaee14caa9d9/build-end.log
>
> Error seems to be:
> CMake Error: Could not create named generator Unix MakeFiles
>
> Generators
>   Green Hills MULTI            = Generates Green Hills MULTI files
>                                  (experimental, work-in-progress).
> * Unix Makefiles               = Generates standard UNIX makefiles.
>   Ninja                        = Generates build.ninja files.
>   Ninja Multi-Config           = Generates build-<Config>.ninja files.
>   Watcom WMake                 = Generates Watcom WMake makefiles.
>   CodeBlocks - Ninja           = Generates CodeBlocks project files.
>   CodeBlocks - Unix Makefiles  = Generates CodeBlocks project files.
>   CodeLite - Ninja             = Generates CodeLite project files.
>   CodeLite - Unix Makefiles    = Generates CodeLite project files.
>   Eclipse CDT4 - Ninja         = Generates Eclipse CDT 4.0 project files.
>   Eclipse CDT4 - Unix Makefiles= Generates Eclipse CDT 4.0 project files.
>   Kate - Ninja                 = Generates Kate project files.
>   Kate - Unix Makefiles        = Generates Kate project files.
>   Sublime Text 2 - Ninja       = Generates Sublime Text 2 project files.
>   Sublime Text 2 - Unix Makefiles
>                                = Generates Sublime Text 2 project files.
>
> Looks like MakeFiles is spelled wrong.

This should fix it:
https://patchwork.ozlabs.org/project/buildroot/patch/20221030190028.3632333-1-james.hilliard1@gmail.com/

>
> >
> > Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > ---
> >  package/pkg-cmake.mk | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> > index 081960b5bf..db9fdebb8d 100644
> > --- a/package/pkg-cmake.mk
> > +++ b/package/pkg-cmake.mk
> > @@ -88,6 +88,7 @@ define $(2)_CONFIGURE_CMDS
> >         rm -f CMakeCache.txt && \
> >         PATH=$$(BR_PATH) \
> >         $$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> > +               -G"Unix MakeFiles" \
> >                 -DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
> >                 -DCMAKE_INSTALL_PREFIX="/usr" \
> >                 -DCMAKE_INSTALL_RUNSTATEDIR="/run" \
> > @@ -118,6 +119,7 @@ define $(2)_CONFIGURE_CMDS
> >         PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
> >         PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
> >         $$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> > +               -G"Unix MakeFiles" \
> >                 -DCMAKE_INSTALL_SO_NO_EXE=0 \
> >                 -DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
> >                 -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
