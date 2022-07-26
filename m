Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0803AC43334
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 05:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 770714193E;
	Tue, 26 Jul 2022 05:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 770714193E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8MK86mOww8sq; Tue, 26 Jul 2022 05:05:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA15C41998;
	Tue, 26 Jul 2022 05:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA15C41998
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B694C1BF28E
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 05:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80AF560E7E
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 05:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80AF560E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qZ5JzBVnl1sP for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 05:05:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E85860C12
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E85860C12
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 05:05:46 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-10d6e8990b9so17379842fac.7
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 22:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VTdyiV2G0SkDtT6YsHghX0bB9S2M0LUXMN7O+j0YRbU=;
 b=CrisH1JDQlOeX78XRQlx8mvSGf2Kycrs8kVe0kplsmpOwnOmaNBQeqzB2gGSROCvwC
 XsBbGJ83LjVilfECp3X5MPTp+CHF3eoEIEhond53EMDFjEYGqHldaCTVQ5/dLvzbVLHy
 0f4pHukIs90xsEbAC+GPKxqNgMWkyiFr+lPq/YpTU3Kyd7LsF28HAyMl+R3TkJc6coIu
 hwRGvfLdhxt5+RXWFqUS0R3Mkp9+mRdWGUS5P02h5KFOT1tOkQpYDkyUZViDkZyNqlC0
 HW5K6vyVP8PWKQyQ/vRBZm0HXwU/4uMK5ay6ArN++aoH1lGUXR7UvG7H4O3NtZwDQRfw
 3v7g==
X-Gm-Message-State: AJIora/oRhZhbyD1bUidDSUd+cmKTvx35kiBeh0v5yw3AZkSPnX8liLE
 Rsg35IadIQTTdH3tgQUwOJYVNxI+C2EEJUmxjMk=
X-Google-Smtp-Source: AGRyM1tA7c62K96H9WZlIaE6X2QndFwfucjEDLskoSCMvfOG3KkhaB+7rsUhaXeNFr0i/R1NrJ0Yy41HKDntPiSXm3M=
X-Received: by 2002:a05:6870:8314:b0:10c:cc1a:57fc with SMTP id
 p20-20020a056870831400b0010ccc1a57fcmr16101424oae.153.1658811945157; Mon, 25
 Jul 2022 22:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220722060936.566534-1-james.hilliard1@gmail.com>
 <0d85a216-559f-a4c6-9c6d-0672801ec340@mind.be>
In-Reply-To: <0d85a216-559f-a4c6-9c6d-0672801ec340@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 25 Jul 2022 23:05:32 -0600
Message-ID: <CADvTj4qyrtuVJoT_6gANp5BgJozmiWg6UqyHveU-PfU_fdN5hg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=VTdyiV2G0SkDtT6YsHghX0bB9S2M0LUXMN7O+j0YRbU=;
 b=D2jR2WHtHmZu310HrN/f5eI1cBrTd2j6rqjaE+WWy/rwkDJ11R4Zpf3dnoa8pR5FXf
 aeZAHFe/1yPlvd9lcACTVNFXIEajircHGJWXVpOKl45TOpX9a5B0L65mE5pTMx/llfg9
 St+aY4gDo66mjfGom9K1HsFo0DEzG9IZRZxt60XWbAeCh91+S9XETED0BFeSV2/02rzg
 Ti6OLM5JcUPfBVXy98hhN3Hg3IG6ozdpbobmVuED/ri3uxaB4Ne3NGNWPXEsT3tWER7x
 HE0mlFNiLAgTq/OwvDiiReKO+D5QTrav5qO1+ALfOItXa05xp8PS379V3tgJv9kITGBV
 WeGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=D2jR2WHt
Subject: Re: [Buildroot] [PATCH v3 1/1] package/pkg-meson: use meson to
 build/install packages
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>, buildroot <buildroot@buildroot.org>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Jul 24, 2022 at 1:42 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 22/07/2022 08:09, James Hilliard wrote:
> > As of version 0.54.0 meson has had the ability to build and install
> > packages rather than having to run ninja directly as before.
> >
> > This will allow us to use features such as meson install tags in
> > the future which require meson to be used for the installation.
> >
> > It appears we need to ensure the cmake prefix path is set for the
> > meson generated relocatable pkg-config format to work properly.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > Changes v2 -> v3:
> >    - set pkgconfig to relocatable
> >    - set cmake pkg-config prefix path
> > Changes v1 -> v2:
> >    - update docs
> > ---
> >   docs/manual/adding-packages-meson.txt         |  4 +-
> >   .../gobject-introspection.mk                  |  4 +-
> >   package/pkg-cmake.mk                          |  4 ++
> >   package/pkg-meson.mk                          | 61 +++++++++++++------
> >   package/systemd/systemd.mk                    |  4 +-
> >   5 files changed, 53 insertions(+), 24 deletions(-)
> >
> > diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.txt
> > index 029c8c2488..c8aed65c2f 100644
> > --- a/docs/manual/adding-packages-meson.txt
> > +++ b/docs/manual/adding-packages-meson.txt
> > @@ -125,8 +125,8 @@ will therefore only use a few of them.
> >     +c_link_args+, +cpp_args+, +cpp_link_args+, +sys_root+, and
> >     +pkg_config_libdir+.
> >
> > -* +FOO_NINJA_ENV+, to specify additional environment variables to pass to
> > -  +ninja+, meson companion tool in charge of the build operations. By default,
> > +* +FOO_MESON_ENV+, to specify additional environment variables to pass to
>
>   If you're anyway respinning and anyway changing this, I have one more small
> nit: I think it would be better to name this FOO_BUILD_ENV and also add separate
> FOO_INSTALL_TARGET_ENV etc. This is different from how we currently do it in
> other infras, but (some) other infras *do* use e.g. FOO_BUILD_OPTS. The thing
> with FOO_MESON_ENV is that it suggests that it would also (and mainly) be
> applied to the configure step, and that is not the case.

Hmm, maybe we want FOO_MESON_ENV to apply to all steps so that we don't
have to set things separately between build/conf like this?:
https://github.com/buildroot/buildroot/blob/2022.05.1/package/systemd/systemd.mk#L748-L749

>
>   Regards,
>   Arnout
>
>
> > +  +meson+, meson tool in charge of the build/install operations. By default,
> >     empty.
> >
> >   * +FOO_NINJA_OPTS+, to specify a space-separated list of targets to build. By
> > diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
> > index 41d64171a7..ea5100247d 100644
> > --- a/package/gobject-introspection/gobject-introspection.mk
> > +++ b/package/gobject-introspection/gobject-introspection.mk
> > @@ -30,14 +30,14 @@ HOST_GOBJECT_INTROSPECTION_DEPENDENCIES = \
> >       host-python3
> >
> >   # g-ir-scanner will default to /usr/bin/ld for linking if this is not set.
> > -GOBJECT_INTROSPECTION_NINJA_ENV += \
> > +GOBJECT_INTROSPECTION_MESON_ENV += \
> >       CC="$(TARGET_CC)"
> >
> >   # When building, gobject-introspection uses tools/g-ir-scanner to build several
> >   # .gir and .typelib files. g-ir-scanner does not use LDFLAGS, and by default,
> >   # links to the system-installed libglib2 path. To remedy this issue, defining
> >   # LD_LIBRARY_PATH forces g-ir-scanner to use our host installed libglib2 files.
> > -HOST_GOBJECT_INTROSPECTION_NINJA_ENV += \
> > +HOST_GOBJECT_INTROSPECTION_MESON_ENV += \
> >       LD_LIBRARY_PATH="$(if $(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)$(HOST_DIR)/lib"
> >
> >   # Use the host gi-scanner to prevent the scanner from generating incorrect
> > diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> > index 3b1db35fb6..4fa620080d 100644
> > --- a/package/pkg-cmake.mk
> > +++ b/package/pkg-cmake.mk
> > @@ -90,6 +90,8 @@ define $(2)_CONFIGURE_CMDS
> >       $$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> >               -DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
> >               -DCMAKE_INSTALL_PREFIX="/usr" \
> > +             -DCMAKE_PREFIX_PATH="$$(STAGING_DIR)/usr" \
> > +             -DPKG_CONFIG_USE_CMAKE_PREFIX_PATH=ON \
> >               -DCMAKE_COLOR_MAKEFILE=OFF \
> >               -DBUILD_DOC=OFF \
> >               -DBUILD_DOCS=OFF \
> > @@ -123,6 +125,8 @@ define $(2)_CONFIGURE_CMDS
> >               -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="BOTH" \
> >               -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="BOTH" \
> >               -DCMAKE_INSTALL_PREFIX="$$(HOST_DIR)" \
> > +             -DCMAKE_PREFIX_PATH="$$(HOST_DIR)" \
> > +             -DPKG_CONFIG_USE_CMAKE_PREFIX_PATH=ON \
> >               -DCMAKE_C_FLAGS="$$(HOST_CFLAGS)" \
> >               -DCMAKE_CXX_FLAGS="$$(HOST_CXXFLAGS)" \
> >               -DCMAKE_EXE_LINKER_FLAGS="$$(HOST_LDFLAGS)" \
> > diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> > index 0835e08e3a..de5817d5da 100644
> > --- a/package/pkg-meson.mk
> > +++ b/package/pkg-meson.mk
> > @@ -21,13 +21,13 @@
> >   ################################################################################
> >
> >   #
> > -# Pass PYTHONNOUSERSITE environment variable when invoking Meson or Ninja, so
> > +# Pass PYTHONNOUSERSITE environment variable when invoking Meson, so
> >   # $(HOST_DIR)/bin/python3 will not look for Meson modules in
> >   # $HOME/.local/lib/python3.x/site-packages
> >   #
> > -MESON                = PYTHONNOUSERSITE=y $(HOST_DIR)/bin/meson
> > -NINJA                = PYTHONNOUSERSITE=y $(HOST_DIR)/bin/ninja
> > -NINJA_OPTS   = $(if $(VERBOSE),-v)
> > +MESON              = PYTHONNOUSERSITE=y $(HOST_DIR)/bin/meson
> > +MESON_BUILD_OPTS   = $(if $(VERBOSE),-v)
> > +MESON_INSTALL_OPTS = --no-rebuild
> >
> >   # https://mesonbuild.com/Reference-tables.html#cpu-families
> >   ifeq ($(BR2_arcle)$(BR2_arceb),y)
> > @@ -138,6 +138,7 @@ define $(2)_CONFIGURE_CMDS
> >       $$(MESON) \
> >               --prefix=/usr \
> >               --libdir=lib \
> > +             --pkgconfig.relocatable \
> >               --default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
> >               --buildtype=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
> >               --cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
> > @@ -156,10 +157,11 @@ define $(2)_CONFIGURE_CMDS
> >       mkdir -p $$($$(PKG)_SRCDIR)/build
> >       $$(HOST_CONFIGURE_OPTS) \
> >       $$($$(PKG)_CONF_ENV) $$(MESON) \
> > -             --prefix=$$(HOST_DIR) \
> > +             --prefix=/ \
> >               --libdir=lib \
> > -             --sysconfdir=$$(HOST_DIR)/etc \
> > -             --localstatedir=$$(HOST_DIR)/var \
> > +             --pkgconfig.relocatable \
> > +             --sysconfdir=etc \
> > +             --localstatedir=var \
> >               --default-library=shared \
> >               --buildtype=release \
> >               --wrap-mode=nodownload \
> > @@ -179,13 +181,23 @@ $(2)_DEPENDENCIES += host-meson
> >   ifndef $(2)_BUILD_CMDS
> >   ifeq ($(4),target)
> >   define $(2)_BUILD_CMDS
> > -     $$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> > -             $$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
> > +     $$(TARGET_MAKE_ENV) \
> > +     $$($$(PKG)_MESON_ENV) \
> > +     $$(MESON) \
> > +             compile \
> > +             $$(MESON_BUILD_OPTS) \
> > +             $$(if $$($$(PKG)_NINJA_OPTS),--ninja-args $$($$(PKG)_NINJA_OPTS)) \
> > +             -C $$($$(PKG)_SRCDIR)/build
> >   endef
> >   else
> >   define $(2)_BUILD_CMDS
> > -     $$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> > -             $$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
> > +     $$(HOST_MAKE_ENV) \
> > +     $$($$(PKG)_MESON_ENV) \
> > +     $$(MESON) \
> > +             compile \
> > +             $$(MESON_BUILD_OPTS) \
> > +             $$(if $$($$(PKG)_NINJA_OPTS),--ninja-args $$($$(PKG)_NINJA_OPTS)) \
> > +             -C $$($$(PKG)_SRCDIR)/build
> >   endef
> >   endif
> >   endif
> > @@ -196,8 +208,13 @@ endif
> >   #
> >   ifndef $(2)_INSTALL_CMDS
> >   define $(2)_INSTALL_CMDS
> > -     $$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> > -             $$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
> > +     $$(HOST_MAKE_ENV) \
> > +     $$($$(PKG)_MESON_ENV) \
> > +     $$(MESON) \
> > +             install \
> > +             $$(MESON_INSTALL_OPTS) \
> > +             --destdir $$(HOST_DIR) \
> > +             -C $$($$(PKG)_SRCDIR)/build
> >   endef
> >   endif
> >
> > @@ -207,8 +224,13 @@ endif
> >   #
> >   ifndef $(2)_INSTALL_STAGING_CMDS
> >   define $(2)_INSTALL_STAGING_CMDS
> > -     $$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(STAGING_DIR) \
> > -             $$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
> > +     $$(TARGET_MAKE_ENV) \
> > +     $$($$(PKG)_MESON_ENV) \
> > +     $$(MESON) \
> > +             install \
> > +             $$(MESON_INSTALL_OPTS) \
> > +             --destdir $$(STAGING_DIR) \
> > +             -C $$($$(PKG)_SRCDIR)/build
> >   endef
> >   endif
> >
> > @@ -218,8 +240,13 @@ endif
> >   #
> >   ifndef $(2)_INSTALL_TARGET_CMDS
> >   define $(2)_INSTALL_TARGET_CMDS
> > -     $$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(TARGET_DIR) \
> > -             $$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
> > +     $$(TARGET_MAKE_ENV) \
> > +     $$($$(PKG)_MESON_ENV) \
> > +     $$(MESON) \
> > +             install \
> > +             $$(MESON_INSTALL_OPTS) \
> > +             --destdir $$(TARGET_DIR) \
> > +             -C $$($$(PKG)_SRCDIR)/build
> >   endef
> >   endif
> >
> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index 46a4e8de2c..9bb87f8e39 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> > @@ -746,7 +746,7 @@ endef
> >   SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_PRESET_ALL
> >
> >   SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
> > -SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
> > +SYSTEMD_MESON_ENV = $(HOST_UTF8_LOCALE_ENV)
> >
> >   define SYSTEMD_LINUX_CONFIG_FIXUPS
> >       $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS)
> > @@ -849,8 +849,6 @@ HOST_SYSTEMD_DEPENDENCIES = \
> >       host-gperf \
> >       host-python-jinja2
> >
> > -HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
> > -
> >   # Fix RPATH After installation
> >   # * systemd provides a install_rpath instruction to meson because the binaries
> >   #   need to link with libsystemd which is not in a standard path
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
