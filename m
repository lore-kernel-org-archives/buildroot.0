Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457DDC433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 20:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E222E40474;
	Tue,  4 Jan 2022 20:53:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tPO7BthkN_6K; Tue,  4 Jan 2022 20:53:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F091440308;
	Tue,  4 Jan 2022 20:53:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E05B1BF44A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 20:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D42860E47
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 20:53:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fOT3gWLzAHiT for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 20:53:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E89E360B8A
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 20:53:36 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 a23-20020a9d4717000000b0056c15d6d0caso48600228otf.12
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 12:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=up1GOFba1sj9tYF6uMffd3mEWHR3lvmO9ia6ZogpwGY=;
 b=l2Z4061/voTjVw0WTGeUoVo7GjPs1z7+rI33GFkT7S5IZiGtWy0D78eQFCgh1GfOVv
 mA25FH5+SVxJ0CX8oI92T9Tl/oirO9+9tNSeyxaWeU/G8YPoW1JXZ4fINNdHCGOcEjR5
 0PtCsHp58GVplxKohZari3A8GLpjC3jJRm5H+RoDYrrIk3HhSNzsQB5ER7TcX1G9hWDD
 xeG+t4AUINeoXQZBgeAFx0GrheNVVyvc5BzTz3I/rG44+hucgUg5CIjDfdj8VX7XSIGb
 nT1swH6crAQywts0r3oVDp8ECo96/a0KjHoHR6sW2BT2UHNOtN/Esw7LbL354xU4NC55
 dD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=up1GOFba1sj9tYF6uMffd3mEWHR3lvmO9ia6ZogpwGY=;
 b=coH7VPcOGRz11ZKI5iEBNmiTbMwdLUrxnDXUVd6w0gT52EHw7wxXUivIoNkTT1+mKv
 wSF/4HeuOggX439lId5B70aivJol1GiGU/+ZOjCejfGfP6iLsUCzhaSsy8Bl9XX4uyiJ
 IKPLwkMefsulQI8HpHAMNjIxxniWhVi8a2TsFfLQE6ros2D8vobJuXslInfuyN4sH8cS
 n7jb/2/3ijqH5rWrZhf2LC7fBeY2G5etsV/9NZnYWUsUMEf5i8Hy7gB5RF2C0A/nERvQ
 y3RbL1Cc755qxyBGAduzW+/seKXugYR7k+mZiWNsYdxa73KIiWzC03cYkUeOol0M7FRF
 wyJQ==
X-Gm-Message-State: AOAM530E/Ir15bq8ItE63dl1q0W85ot5iHhQ5CsD60LArGBCeBMBq87b
 LSh1qS9bsv6jpXqx7oFjUjT14MHow2U96Fc37N8=
X-Google-Smtp-Source: ABdhPJyNniLIFEFMbzMsiOlXSfFNI88A2masEMpb0H9V3JOYNPiDTG4HoJNyYqFMYzq+DmPTZpzn6vh50VYcouOScOI=
X-Received: by 2002:a05:6830:2aa7:: with SMTP id
 s39mr38058111otu.151.1641329615852; 
 Tue, 04 Jan 2022 12:53:35 -0800 (PST)
MIME-Version: 1.0
References: <20220104074821.1330228-1-james.hilliard1@gmail.com>
 <c4cc70e9-9875-e929-8c10-c764ec0a4a94@mind.be>
In-Reply-To: <c4cc70e9-9875-e929-8c10-c764ec0a4a94@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 4 Jan 2022 14:53:24 -0600
Message-ID: <CADvTj4rS6b+J0bveOcAJ+Xii1fhK58+f8Gs+9UgwTPSQLBqM6g@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5webkit: bump to version
 5.212.0-alpha4
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
Cc: Peter Seiderer <ps.report@gmx.net>, Samuel Martin <s.martin49@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 =?UTF-8?B?R2HDq2wgUG9ydGF5?= <gael.portay@collabora.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Jan 4, 2022 at 12:33 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 04/01/2022 08:48, James Hilliard wrote:
> > Switch to latest release in new active upstream:
> > https://github.com/qtwebkit/qtwebkit
>
>   Perhaps you can push the remaining patch to upstream then?

Oh, it's already upstream, switched to that version here:
https://patchwork.ozlabs.org/project/buildroot/patch/20220104205213.1367539-1-james.hilliard1@gmail.com/

>
> >
> > Migrate python2 build to python3.
> >
> > Drop patches that are upstream/no longer needed.
> >
> > Adapt/add patches to fix build issues.
> >
> > Rework build system to use cmake instead of qmake(which does not
> > currently support cross compilation).
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> [snip]
> > diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
> > index dd99661be0..3af1918a46 100644
> > --- a/package/qt5/qt5webkit/qt5webkit.mk
> > +++ b/package/qt5/qt5webkit/qt5webkit.mk
> > @@ -4,12 +4,13 @@
> >   #
> >   ################################################################################
> >
> > -QT5WEBKIT_VERSION = 5.9.1
> > -QT5WEBKIT_SITE = https://download.qt.io/official_releases/qt/5.9/5.9.1/submodules
> > -QT5WEBKIT_SOURCE = qtwebkit-opensource-src-$(QT5WEBKIT_VERSION).tar.xz
> > +QT5WEBKIT_VERSION = 5.212.0-alpha4
> > +QT5WEBKIT_SITE = https://github.com/qtwebkit/qtwebkit/releases/download/qtwebkit-$(QT5WEBKIT_VERSION)
>
>   Upstream README says:
>
> Use the following repository if you need to get latest snapshots of QtWebKit code:
>
> http://code.qt.io/cgit/qt/qtwebkit.git/
>
>   This repo aslo has a 5.212.0-alpha4 tag. Perhaps we should switch to that?

That repo has no recent activity and appears abandoned, the new
upstream is a fork
of that, also I didn't see a release tarball from qt
organization(which seems to no longer
maintain qtwebkit at all).

>
>   Anyway, I applied to master as is.
>
>   Regards,
>   Arnout
>
> > +QT5WEBKIT_SOURCE = qtwebkit-$(QT5WEBKIT_VERSION).tar.xz
> >   QT5WEBKIT_DEPENDENCIES = \
> > -     host-bison host-flex host-gperf host-python host-ruby \
> > -     leveldb sqlite
> > +     host-bison host-flex host-gperf host-python3 host-ruby gstreamer1 \
> > +     gst1-plugins-base icu leveldb jpeg libpng libxml2 libxslt qt5location \
> > +     qt5sensors qt5webchannel sqlite webp woff2
> >   QT5WEBKIT_INSTALL_STAGING = YES
> >
> >   QT5WEBKIT_LICENSE_FILES = Source/WebCore/LICENSE-LGPL-2 Source/WebCore/LICENSE-LGPL-2.1
> > @@ -20,30 +21,16 @@ QT5WEBKIT_LICENSE = LGPL-2.1+, BSD-3-Clause, BSD-2-Clause
> >   QT5WEBKIT_LICENSE_FILES += LICENSE.LGPLv21
> >
> >   ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
> > -QT5WEBKIT_DEPENDENCIES += xlib_libXext xlib_libXrender
> > +QT5WEBKIT_DEPENDENCIES += xlib_libXcomposite xlib_libXext xlib_libXrender
> >   endif
> >
> >   ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
> >   QT5WEBKIT_DEPENDENCIES += qt5declarative
> >   endif
> >
> > -# QtWebkit's build system uses python, but only supports python2. We work
> > -# around this by forcing python2 early in the PATH, via a python->python2
> > -# symlink.
> > -QT5WEBKIT_CONF_ENV = PATH=$(@D)/host-bin:$(BR_PATH)
> > -QT5WEBKIT_MAKE_ENV = PATH=$(@D)/host-bin:$(BR_PATH)
> > -define QT5WEBKIT_PYTHON2_SYMLINK
> > -     mkdir -p $(@D)/host-bin
> > -     ln -sf $(HOST_DIR)/bin/python2 $(@D)/host-bin/python
> > -endef
> > -QT5WEBKIT_PRE_CONFIGURE_HOOKS += QT5WEBKIT_PYTHON2_SYMLINK
> > +QT5WEBKIT_CONF_OPTS += \
> > +     -DPORT=Qt \
> > +     -DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
> > +     -DUSE_LIBHYPHEN=OFF
> >
> > -QT5WEBKIT_CONF_OPTS = WEBKIT_CONFIG+=use_system_leveldb
> > -
> > -define QT5WEBKIT_INSTALL_TARGET_EXTRAS
> > -     cp -dpf $(@D)/bin/* $(TARGET_DIR)/usr/bin/
> > -endef
> > -
> > -QT5WEBKIT_POST_INSTALL_TARGET_HOOKS += QT5WEBKIT_INSTALL_TARGET_EXTRAS
> > -
> > -$(eval $(qmake-package))
> > +$(eval $(cmake-package))
> >
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
