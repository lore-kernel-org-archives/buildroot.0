Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCF9C433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 19:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD97760EA4;
	Mon, 31 Jan 2022 19:31:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wN23eQ4DXicD; Mon, 31 Jan 2022 19:31:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D463860A73;
	Mon, 31 Jan 2022 19:31:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4BFC51BF379
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 19:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38E43405F1
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 19:31:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kfo2LWk4GSQD for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 19:31:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2668A405A0
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 19:31:28 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id v67so28690094oie.9
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 11:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zyRFIUMCx1REQMq10urO8ashBVjqTx90egLm6nfbaGY=;
 b=RKsO4crdPDelnh+p3I+iv0ZYJ1rRq1C5SuiV+tj3Kr8xni9vsP59OHrvPIBbRRMNSH
 c32NuWVkb2N9Q8Rbn4E0qs0b5iIJwPg3SDoyyv1cr98a8wDDCSVYSZdNVdKz655ck1CI
 TeAf/m8YILYtyjSCQXp1vONghWiKFSwXZ5dXK6Q/ap9yqM/MbsoJD4zfjdYhCgzNbmz/
 VlDSlMZbHTr6XKcZf2dqNJnpgb9Y33oBduid4spMxAB8ugooCZmNaKRj22xKPIHdYt8W
 O6b/H8qi7Ws2ZUNuzwXe2uDvbt3RRQwPSRwfI5GQKCM0Wr4MbWv/v+GEaPSPGlOpPOWj
 iqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zyRFIUMCx1REQMq10urO8ashBVjqTx90egLm6nfbaGY=;
 b=ngwfLS8jjUkMBeRXbrGqkDSW98jue2la7ASVfC6SwmNRydYSYNbXd+v812gDs9iWoo
 70rqcH5BrH3FtB5LQCaHq3oaTVOJB0aRplSF1SQllcL8lrOY5Z7V+BCpd5cZeNvDCzuM
 jZc4Z5veY3uwrWVbmPt3F8pSVjXcIorDvogKnaiXdpmgMleSMHub2dtN//YXpNfy9nKy
 UNv3t/7rPBNAri1UXsullzZ3Ii6L5paVrm9eYKaQkqPXoW98FEd4jgKOtNi/tBfa+ezd
 HyT5n0Tw9pLjLQKgFZvC0gosrdp9OsODGsEq9YY+R1kpm3h6o1DkoUQPMintJ+p5FEBo
 U6Vg==
X-Gm-Message-State: AOAM5311h0nmWKtd7rbBeildOIhOx13kOKpvdRzYna/mrmtd5g2xMVqc
 4c0jWT+pQ9tDdBtqrDwJOmV5RcrxQ/pdLuy5Op0=
X-Google-Smtp-Source: ABdhPJzW2UqY09yW35WTrJZfqUe+yd+MvP02TUZHDvpfFejY4J0hMOC2BHUPCtC1ifhPQVrIynj5ii6SRIbU/ceyW8c=
X-Received: by 2002:a05:6808:2188:: with SMTP id
 be8mr11748640oib.63.1643657487411; 
 Mon, 31 Jan 2022 11:31:27 -0800 (PST)
MIME-Version: 1.0
References: <20220116214955.3231899-1-fontaine.fabrice@gmail.com>
 <20220116214955.3231899-2-fontaine.fabrice@gmail.com>
 <CADvTj4oZCjtb9pNt-UzzJhpK4eqGatW1sGbrJBdJNDop7jys7A@mail.gmail.com>
In-Reply-To: <CADvTj4oZCjtb9pNt-UzzJhpK4eqGatW1sGbrJBdJNDop7jys7A@mail.gmail.com>
From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 31 Jan 2022 11:31:16 -0800
Message-ID: <CAFSsvmoQxXffUMqCRdU1-wFMYXchP=G6LfZUmdp_KViEWmUGig@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/3] package/qt5/qt5webkit: fix build
 without opengl
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot <buildroot@buildroot.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?B?R2HDq2wgUG9ydGF5?= <gael.portay@collabora.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Reviewed-by: Adam Duskett <aduskett@gmail.com>
Tested-by: Adam Duskett <aduskett@gmail.com>

On Fri, Jan 28, 2022 at 4:39 PM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Sun, Jan 16, 2022 at 2:51 PM Fabrice Fontaine
> <fontaine.fabrice@gmail.com> wrote:
> >
> > Fix the following build failure without opengl raised since bump to
> > version 5.212.0-alpha4 in commit
> > df0b0fe6919c0d0f3750f439a3cfa765232bd569:
> >
> > CMake Error at Source/cmake/OptionsQt.cmake:592 (message):
> >   Qt with OpenGL support is required for ENABLE_OPENGL
> >
> > WebKit2 unconditionally depends on TextureMapperGL.h and tools builds
> > QtTestBrowser which unconditionally depends on QtOpenGL
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/5604555279f99ba0221dd8d0baf9ab4d7cca3aed
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/qt5/qt5webkit/qt5webkit.mk | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
> > index 3af1918a46..de3c428fbe 100644
> > --- a/package/qt5/qt5webkit/qt5webkit.mk
> > +++ b/package/qt5/qt5webkit/qt5webkit.mk
> > @@ -20,6 +20,16 @@ QT5WEBKIT_LICENSE = LGPL-2.1+, BSD-3-Clause, BSD-2-Clause
> >  # in the archive.
> >  QT5WEBKIT_LICENSE_FILES += LICENSE.LGPLv21
> >
> > +ifeq ($(BR2_PACKAGE_QT5BASE_OPENGL),y)
> > +QT5WEBKIT_CONF_OPTS += \
> > +       -DENABLE_OPENGL=ON \
> > +       -DENABLE_WEBKIT2=ON
> > +else
> > +QT5WEBKIT_CONF_OPTS += \
> > +       -DENABLE_OPENGL=OFF \
> > +       -DENABLE_WEBKIT2=OFF
> > +endif
> > +
> >  ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
> >  QT5WEBKIT_DEPENDENCIES += xlib_libXcomposite xlib_libXext xlib_libXrender
> >  endif
> > @@ -29,6 +39,7 @@ QT5WEBKIT_DEPENDENCIES += qt5declarative
> >  endif
> >
> >  QT5WEBKIT_CONF_OPTS += \
> > +       -DENABLE_TOOLS=OFF \
> >         -DPORT=Qt \
> >         -DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
> >         -DUSE_LIBHYPHEN=OFF
> > --
> > 2.34.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
