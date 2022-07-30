Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF449C19F2A
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 19:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F9B2417CA;
	Sat, 30 Jul 2022 19:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F9B2417CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9AvRZSfWITJ3; Sat, 30 Jul 2022 19:04:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51ACE415B1;
	Sat, 30 Jul 2022 19:04:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51ACE415B1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 84E5C1BF35B
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 19:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B768827A9
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 19:04:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B768827A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i-p9zK5MUd3q for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 19:04:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAEE6827A0
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AAEE6827A0
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 19:04:21 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id 129so7588341vsq.8
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 12:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J5mCWEXxTmrcnRVOY1s8mPwUehrVM/YG53Iuk3yf44c=;
 b=BpK3s55/uyY12FEx0LyE0LUChK0Vb+pthb8NQJHIrXCsDyk3U8kawn0gkVqU/th2IB
 vDBLKQ4/o9+4UDQcehCAuOWxBtI7sl0SvsnNuYas/BhKhtT3cuZ0ftTfRyJv48LgFVsg
 jW+nDCa8a8X5gmwlze8RqNnIcet+DOpcXgMZkm+H0bUOfr2k0djQRpoawhLHltUFdrNs
 tFLe1pcLbLhjMr5ey69N1vnow5OUHJSPk437mJbdertk5yZPtyw1Ir1DE7T9cy5xFg/j
 tJAhC+xsqhi2Y7OolyqgHNxKEnbbL9t1rorFuQZFsUWsnHHilvGPSs1rFa+EOO+mNfn9
 EWrQ==
X-Gm-Message-State: ACgBeo2eKRbGQfdxyQAQ7wp6pZJeIkb67TJvdbMb84GILidhdjZ6NTdt
 INnpoQeQonvLmEFag0cKcHddtGo2tVy8e/LdqWmnYw8zNuI=
X-Google-Smtp-Source: AA6agR7ET7QXbgUF2hp7LAbUPIBp7McsDOIsLcIC1zoFiPc5b22LsGRhl1myT+uUaR34REhM2EhS4jxDohr7I6UN1Rs=
X-Received: by 2002:a67:e107:0:b0:379:2905:54f6 with SMTP id
 d7-20020a67e107000000b00379290554f6mr941235vsl.27.1659207860429; Sat, 30 Jul
 2022 12:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220727221055.1838031-1-james.hilliard1@gmail.com>
 <CADYdroOD6Y7MH3+HAyicL4he60YDnAB15=VP9xpUE08=L_nrUQ@mail.gmail.com>
 <CADvTj4pea-vMNyitS=_B2EEP4WcN8F9aBk1TUikfWGSFJfQPXg@mail.gmail.com>
In-Reply-To: <CADvTj4pea-vMNyitS=_B2EEP4WcN8F9aBk1TUikfWGSFJfQPXg@mail.gmail.com>
From: Norbert Lange <nolange79@gmail.com>
Date: Sat, 30 Jul 2022 21:04:09 +0200
Message-ID: <CADYdroN2Mdgf2u8MSq740SQ638CPMpxh7CUth-FEE2j=NByy=Q@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=J5mCWEXxTmrcnRVOY1s8mPwUehrVM/YG53Iuk3yf44c=;
 b=dk0k182onrG1nmzwr3JG26Q8wL6j/9e+CO8kj7e/H7PMtMoNNgO7eMYqo7k0qgkhIJ
 zb8/0j/pUWYLl4SMAL8Vlzm2Hd0Av9sQ2RlaZC4mi3k6QNoRs2KnXnPijbM6cHg0UGQ3
 NcyJ52qEq06UA3rWfRL2ho9cM/0nHuDnVDC6pF7u1pbkfJx0ovocbnt57bqx92Gbwo80
 qaJvWhGyfFVzde/HR8IXdbMreISAZf/REuFkqfYdViHf/TOojgnEnd7NNAEpNx344Pss
 64vb3hWFn4DtLBZZ7T68oianSJTBLoCh66UlLmGyQQLbdq2JVHVPjAzh2C44+TrYK0tQ
 jilg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dk0k182o
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: use statically linked
 host tools
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
Cc: Sen Hastings <sen@phobosdpl.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============5770719301886783207=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5770719301886783207==
Content-Type: multipart/alternative; boundary="000000000000212fc705e50a6f57"

--000000000000212fc705e50a6f57
Content-Type: text/plain; charset="UTF-8"

James Hilliard <james.hilliard1@gmail.com> schrieb am Do., 28. Juli 2022,
11:01:

> On Thu, Jul 28, 2022 at 2:33 AM Norbert Lange <nolange79@gmail.com> wrote:
> >
> > Am Do., 28. Juli 2022 um 00:11 Uhr schrieb James Hilliard
> > <james.hilliard1@gmail.com>:
> > >
> > > This lets us remove the HOST_SYSTEMD_FIX_RPATH hack.
> > >
> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > ---
> > >  ...nalctl-allow-statically-linked-build.patch | 68 +++++++++++++++++++
> > >  package/systemd/systemd.mk                    | 28 +++-----
> > >  2 files changed, 76 insertions(+), 20 deletions(-)
> > >  create mode 100644
> package/systemd/0002-journalctl-allow-statically-linked-build.patch
> > >
> > > diff --git
> a/package/systemd/0002-journalctl-allow-statically-linked-build.patch
> b/package/systemd/0002-journalctl-allow-statically-linked-build.patch
> > > new file mode 100644
> > > index 0000000000..98ffb72cca
> > > --- /dev/null
> > > +++
> b/package/systemd/0002-journalctl-allow-statically-linked-build.patch
> > > @@ -0,0 +1,68 @@
> > > +From d2dadbdc5618776e07e98baf8795cc8adebf05a1 Mon Sep 17 00:00:00 2001
> > > +From: James Hilliard <james.hilliard1@gmail.com>
> > > +Date: Wed, 27 Jul 2022 15:28:09 -0600
> > > +Subject: [PATCH] journalctl: allow statically linked build
> > > +
> > > +The journalctl tool may be needed on cross compilation hosts in order
> > > +to run --update-catalog against a target rootfs.
> > > +
> > > +To avoid reliability issues caused by shared linking allow journalctl
> > > +to be linked statically.
> > > +
> > > +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > +[Upstream status:
> > > +https://github.com/systemd/systemd/pull/24140]
> > > +---
> > > + meson.build       | 11 ++++++++++-
> > > + meson_options.txt |  2 ++
> > > + 2 files changed, 12 insertions(+), 1 deletion(-)
> > > +
> > > +diff --git a/meson.build b/meson.build
> > > +index 692ee1ed4d..8cce19dce6 100644
> > > +--- a/meson.build
> > > ++++ b/meson.build
> > > +@@ -2263,11 +2263,19 @@ public_programs += executable(
> > > +         install_rpath : rootpkglibdir,
> > > +         install : true)
> > > +
> > > ++if get_option('link-journalctl-shared')
> > > ++        journalctl_link_with = [libshared]
> > > ++else
> > > ++        journalctl_link_with = [libsystemd_static,
> > > ++                                libshared_static,
> > > ++                                libbasic_gcrypt]
> > > ++endif
> > > ++
> > > + public_programs += executable(
> > > +         'journalctl',
> > > +         journalctl_sources,
> > > +         include_directories : includes,
> > > +-        link_with : [libshared],
> > > ++        link_with : [journalctl_link_with],
> > > +         dependencies : [threads,
> > > +                         libdl,
> > > +                         libxz,
> > > +@@ -4357,6 +4365,7 @@ foreach tuple : [
> > > +         ['link-systemctl-shared',
> get_option('link-systemctl-shared')],
> > > +         ['link-networkd-shared',
> get_option('link-networkd-shared')],
> > > +         ['link-timesyncd-shared',
> get_option('link-timesyncd-shared')],
> > > ++
> ['link-journalctl-shared',get_option('link-journalctl-shared')],
> > > +         ['link-boot-shared',      get_option('link-boot-shared')],
> > > +         ['first-boot-full-preset'],
> > > +         ['fexecve'],
> > > +diff --git a/meson_options.txt b/meson_options.txt
> > > +index 628ca1d797..d8c0c581c2 100644
> > > +--- a/meson_options.txt
> > > ++++ b/meson_options.txt
> > > +@@ -25,6 +25,8 @@ option('link-networkd-shared', type: 'boolean',
> > > +        description : 'link systemd-networkd and its helpers to
> libsystemd-shared.so')
> > > + option('link-timesyncd-shared', type: 'boolean',
> > > +        description : 'link systemd-timesyncd and its helpers to
> libsystemd-shared.so')
> > > ++option('link-journalctl-shared', type: 'boolean',
> > > ++       description : 'link journalctl against libsystemd-shared.so')
> > > + option('link-boot-shared', type: 'boolean',
> > > +        description : 'link bootctl and systemd-bless-boot against
> libsystemd-shared.so')
> > > + option('first-boot-full-preset', type: 'boolean', value: false,
> > > +--
> > > +2.34.1
> > > +
> > > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > > index 47aaddf849..13348f9358 100644
> > > --- a/package/systemd/systemd.mk
> > > +++ b/package/systemd/systemd.mk
> > > @@ -738,7 +738,7 @@ endef
> > >  SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_CATALOG_UPDATE_SERVICE
> > >
> > >  define SYSTEMD_CREATE_TMPFILES_HOOK
> > > -       HOST_SYSTEMD_TMPFILES=$(HOST_DIR)/bin/systemd-tmpfiles \
> > > +
>  HOST_SYSTEMD_TMPFILES=$(HOST_DIR)/bin/systemd-tmpfiles.standalone \
> > >                 $(SYSTEMD_PKGDIR)/fakeroot_tmpfiles.sh $(TARGET_DIR)
> > >  endef
> > >  SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_CREATE_TMPFILES_HOOK
> > > @@ -781,6 +781,13 @@ HOST_SYSTEMD_CONF_OPTS = \
> > >         --libdir=lib \
> > >         --sysconfdir=/etc \
> > >         --localstatedir=/var \
> > > +       -Dlink-udev-shared=false \
> > > +       -Dlink-systemctl-shared=false \
> > > +       -Dlink-networkd-shared=false \
> > > +       -Dlink-timesyncd-shared=false \
> > > +       -Dlink-journalctl-shared=false \
> > > +       -Dlink-boot-shared=false \
> > > +       -Dstandalone-binaries=true \
> > >         -Dmode=release \
> > >         -Dutmp=false \
> > >         -Dhibernate=false \
> > > @@ -854,24 +861,5 @@ HOST_SYSTEMD_DEPENDENCIES = \
> > >
> > >  HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
> > >
> > > -# Fix RPATH After installation
> > > -# * systemd provides a install_rpath instruction to meson because the
> binaries
> > > -#   need to link with libsystemd which is not in a standard path
> > > -# * meson can only replace the RPATH, not append to it
> > > -# * the original rpath is thus lost.
> > > -# * the original path had been tweaked by buildroot via LDFLAGS to add
> > > -#   $(HOST_DIR)/lib
> > > -# * thus re-tweak rpath after the installation for all binaries that
> need it
> > > -HOST_SYSTEMD_HOST_TOOLS = busctl journalctl systemctl systemd-*
> udevadm
> > > -
> > > -define HOST_SYSTEMD_FIX_RPATH
> > > -       for f in $(addprefix
> $(HOST_DIR)/bin/,$(HOST_SYSTEMD_HOST_TOOLS)); do \
> > > -               [ -e $$f ] || continue; \
> > > -               $(HOST_DIR)/bin/patchelf --set-rpath
> $(HOST_DIR)/lib:$(HOST_DIR)/lib/systemd $${f} \
> > > -               || exit 1; \
> > > -       done
> > > -endef
> > > -HOST_SYSTEMD_POST_INSTALL_HOOKS += HOST_SYSTEMD_FIX_RPATH
> > > -
> > >  $(eval $(meson-package))
> > >  $(eval $(host-meson-package))
> > > --
> > > 2.34.1
> > >
> >
> > Hello James,
> >
> > what issues are you trying to prevent here? buildroot's host tools
> > generally use the rpath to work,
> > static tools will just blow up filesize, and would only make sense if
> > you want to copy a few of them
> > to another location.
>
> We don't normally need to use patchelf for host tools, figured it would
> be nice to drop that hack.
>


The issue is meson not doing the right thing,
Unless you fix or drop meson (whatever is less unlikely), whatever you do
is a workaround.

Size shouldn't really matter much for small host tools like these IMO,
> and we should be able to avoid having to install a host libsystemd-shared
> this way down the line(static binaries are often smaller than shared in
> aggregate if only a subset of the library functions get used).
>

I believe systemctl uses almost the entire shared lib, so there aren't any
savings likely.

As said I don't consider the patchelf step terrible, and way less intrusive.

Norbert

--000000000000212fc705e50a6f57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">James Hilliard &lt;<a href=3D"mailto:james.hilliard1@g=
mail.com">james.hilliard1@gmail.com</a>&gt; schrieb am Do., 28. Juli 2022, =
11:01:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">On Thu, Jul 28, 2022 at 2:33=
 AM Norbert Lange &lt;<a href=3D"mailto:nolange79@gmail.com" target=3D"_bla=
nk" rel=3D"noreferrer">nolange79@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Am Do., 28. Juli 2022 um 00:11 Uhr schrieb James Hilliard<br>
&gt; &lt;<a href=3D"mailto:james.hilliard1@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">james.hilliard1@gmail.com</a>&gt;:<br>
&gt; &gt;<br>
&gt; &gt; This lets us remove the HOST_SYSTEMD_FIX_RPATH hack.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliar=
d1@gmail.com" target=3D"_blank" rel=3D"noreferrer">james.hilliard1@gmail.co=
m</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 ...nalctl-allow-statically-linked-build.patch | 68 ++++++++=
+++++++++++<br>
&gt; &gt;=C2=A0 package/systemd/<a href=3D"http://systemd.mk" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">systemd.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 28 +++-----<br>
&gt; &gt;=C2=A0 2 files changed, 76 insertions(+), 20 deletions(-)<br>
&gt; &gt;=C2=A0 create mode 100644 package/systemd/0002-journalctl-allow-st=
atically-linked-build.patch<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/package/systemd/0002-journalctl-allow-statically-lin=
ked-build.patch b/package/systemd/0002-journalctl-allow-statically-linked-b=
uild.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..98ffb72cca<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/package/systemd/0002-journalctl-allow-statically-linked-bui=
ld.patch<br>
&gt; &gt; @@ -0,0 +1,68 @@<br>
&gt; &gt; +From d2dadbdc5618776e07e98baf8795cc8adebf05a1 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">james.hilliard1@gmail.com</a>&gt=
;<br>
&gt; &gt; +Date: Wed, 27 Jul 2022 15:28:09 -0600<br>
&gt; &gt; +Subject: [PATCH] journalctl: allow statically linked build<br>
&gt; &gt; +<br>
&gt; &gt; +The journalctl tool may be needed on cross compilation hosts in =
order<br>
&gt; &gt; +to run --update-catalog against a target rootfs.<br>
&gt; &gt; +<br>
&gt; &gt; +To avoid reliability issues caused by shared linking allow journ=
alctl<br>
&gt; &gt; +to be linked statically.<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hillia=
rd1@gmail.com" target=3D"_blank" rel=3D"noreferrer">james.hilliard1@gmail.c=
om</a>&gt;<br>
&gt; &gt; +[Upstream status:<br>
&gt; &gt; +<a href=3D"https://github.com/systemd/systemd/pull/24140" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://github.com/systemd/system=
d/pull/24140</a>]<br>
&gt; &gt; +---<br>
&gt; &gt; + meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 ++++++++++-<br>
&gt; &gt; + meson_options.txt |=C2=A0 2 ++<br>
&gt; &gt; + 2 files changed, 12 insertions(+), 1 deletion(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/meson.build b/meson.build<br>
&gt; &gt; +index 692ee1ed4d..8cce19dce6 100644<br>
&gt; &gt; +--- a/meson.build<br>
&gt; &gt; ++++ b/meson.build<br>
&gt; &gt; +@@ -2263,11 +2263,19 @@ public_programs +=3D executable(<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install_rpath : rootpkglibdir,=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install : true)<br>
&gt; &gt; +<br>
&gt; &gt; ++if get_option(&#39;link-journalctl-shared&#39;)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 journalctl_link_with =3D [libshared=
]<br>
&gt; &gt; ++else<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 journalctl_link_with =3D [libsystem=
d_static,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libshared_static,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libbasic_gcrypt]<br>
&gt; &gt; ++endif<br>
&gt; &gt; ++<br>
&gt; &gt; + public_programs +=3D executable(<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;journalctl&#39;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0journalctl_sources,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include_directories : includes=
,<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 link_with : [libshared],<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 link_with : [journalctl_link_with],=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dependencies : [threads,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0libdl,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0libxz,<br>
&gt; &gt; +@@ -4357,6 +4365,7 @@ foreach tuple : [<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;link-systemctl-shared&#3=
9;, get_option(&#39;link-systemctl-shared&#39;)],<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;link-networkd-shared&#39=
;,=C2=A0 get_option(&#39;link-networkd-shared&#39;)],<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;link-timesyncd-shared&#3=
9;, get_option(&#39;link-timesyncd-shared&#39;)],<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 [&#39;link-journalctl-shared&#39;,g=
et_option(&#39;link-journalctl-shared&#39;)],<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;link-boot-shared&#39;,=
=C2=A0 =C2=A0 =C2=A0 get_option(&#39;link-boot-shared&#39;)],<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;first-boot-full-preset&#=
39;],<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;fexecve&#39;],<br>
&gt; &gt; +diff --git a/meson_options.txt b/meson_options.txt<br>
&gt; &gt; +index 628ca1d797..d8c0c581c2 100644<br>
&gt; &gt; +--- a/meson_options.txt<br>
&gt; &gt; ++++ b/meson_options.txt<br>
&gt; &gt; +@@ -25,6 +25,8 @@ option(&#39;link-networkd-shared&#39;, type: &=
#39;boolean&#39;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 description : &#39;link systemd-netw=
orkd and its helpers to libsystemd-shared.so&#39;)<br>
&gt; &gt; + option(&#39;link-timesyncd-shared&#39;, type: &#39;boolean&#39;=
,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 description : &#39;link systemd-time=
syncd and its helpers to libsystemd-shared.so&#39;)<br>
&gt; &gt; ++option(&#39;link-journalctl-shared&#39;, type: &#39;boolean&#39=
;,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0description : &#39;link journalctl a=
gainst libsystemd-shared.so&#39;)<br>
&gt; &gt; + option(&#39;link-boot-shared&#39;, type: &#39;boolean&#39;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 description : &#39;link bootctl and =
systemd-bless-boot against libsystemd-shared.so&#39;)<br>
&gt; &gt; + option(&#39;first-boot-full-preset&#39;, type: &#39;boolean&#39=
;, value: false,<br>
&gt; &gt; +--<br>
&gt; &gt; +2.34.1<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/package/systemd/<a href=3D"http://systemd.mk" rel=3D=
"noreferrer noreferrer" target=3D"_blank">systemd.mk</a> b/package/systemd/=
<a href=3D"http://systemd.mk" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">systemd.mk</a><br>
&gt; &gt; index 47aaddf849..13348f9358 100644<br>
&gt; &gt; --- a/package/systemd/<a href=3D"http://systemd.mk" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">systemd.mk</a><br>
&gt; &gt; +++ b/package/systemd/<a href=3D"http://systemd.mk" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">systemd.mk</a><br>
&gt; &gt; @@ -738,7 +738,7 @@ endef<br>
&gt; &gt;=C2=A0 SYSTEMD_ROOTFS_PRE_CMD_HOOKS +=3D SYSTEMD_RM_CATALOG_UPDATE=
_SERVICE<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 define SYSTEMD_CREATE_TMPFILES_HOOK<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0HOST_SYSTEMD_TMPFILES=3D$(HOST_DIR)/b=
in/systemd-tmpfiles \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0HOST_SYSTEMD_TMPFILES=3D$(HOST_DIR)/b=
in/systemd-tmpfiles.standalone \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(SY=
STEMD_PKGDIR)/fakeroot_tmpfiles.sh $(TARGET_DIR)<br>
&gt; &gt;=C2=A0 endef<br>
&gt; &gt;=C2=A0 SYSTEMD_ROOTFS_PRE_CMD_HOOKS +=3D SYSTEMD_CREATE_TMPFILES_H=
OOK<br>
&gt; &gt; @@ -781,6 +781,13 @@ HOST_SYSTEMD_CONF_OPTS =3D \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--libdir=3Dlib \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--sysconfdir=3D/etc \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--localstatedir=3D/var \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dlink-udev-shared=3Dfalse \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dlink-systemctl-shared=3Dfalse \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dlink-networkd-shared=3Dfalse \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dlink-timesyncd-shared=3Dfalse \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dlink-journalctl-shared=3Dfalse \<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dlink-boot-shared=3Dfalse \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dstandalone-binaries=3Dtrue \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dmode=3Drelease \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dutmp=3Dfalse \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dhibernate=3Dfalse \<br>
&gt; &gt; @@ -854,24 +861,5 @@ HOST_SYSTEMD_DEPENDENCIES =3D \<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 HOST_SYSTEMD_NINJA_ENV =3D DESTDIR=3D$(HOST_DIR)<br>
&gt; &gt;<br>
&gt; &gt; -# Fix RPATH After installation<br>
&gt; &gt; -# * systemd provides a install_rpath instruction to meson becaus=
e the binaries<br>
&gt; &gt; -#=C2=A0 =C2=A0need to link with libsystemd which is not in a sta=
ndard path<br>
&gt; &gt; -# * meson can only replace the RPATH, not append to it<br>
&gt; &gt; -# * the original rpath is thus lost.<br>
&gt; &gt; -# * the original path had been tweaked by buildroot via LDFLAGS =
to add<br>
&gt; &gt; -#=C2=A0 =C2=A0$(HOST_DIR)/lib<br>
&gt; &gt; -# * thus re-tweak rpath after the installation for all binaries =
that need it<br>
&gt; &gt; -HOST_SYSTEMD_HOST_TOOLS =3D busctl journalctl systemctl systemd-=
* udevadm<br>
&gt; &gt; -<br>
&gt; &gt; -define HOST_SYSTEMD_FIX_RPATH<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0for f in $(addprefix $(HOST_DIR)/bin/=
,$(HOST_SYSTEMD_HOST_TOOLS)); do \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ -e $$f =
] || continue; \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(HOST_DI=
R)/bin/patchelf --set-rpath $(HOST_DIR)/lib:$(HOST_DIR)/lib/systemd $${f} \=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| exit 1=
; \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt; &gt; -endef<br>
&gt; &gt; -HOST_SYSTEMD_POST_INSTALL_HOOKS +=3D HOST_SYSTEMD_FIX_RPATH<br>
&gt; &gt; -<br>
&gt; &gt;=C2=A0 $(eval $(meson-package))<br>
&gt; &gt;=C2=A0 $(eval $(host-meson-package))<br>
&gt; &gt; --<br>
&gt; &gt; 2.34.1<br>
&gt; &gt;<br>
&gt;<br>
&gt; Hello James,<br>
&gt;<br>
&gt; what issues are you trying to prevent here? buildroot&#39;s host tools=
<br>
&gt; generally use the rpath to work,<br>
&gt; static tools will just blow up filesize, and would only make sense if<=
br>
&gt; you want to copy a few of them<br>
&gt; to another location.<br>
<br>
We don&#39;t normally need to use patchelf for host tools, figured it would=
<br>
be nice to drop that hack.<br></blockquote></div></div><div dir=3D"auto"><b=
r></div><div dir=3D"auto"><br></div><div dir=3D"auto">The issue is meson no=
t doing the right thing,</div><div dir=3D"auto">Unless you fix or drop meso=
n (whatever is less unlikely), whatever you do is a workaround.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
Size shouldn&#39;t really matter much for small host tools like these IMO,<=
br>
and we should be able to avoid having to install a host libsystemd-shared<b=
r>
this way down the line(static binaries are often smaller than shared in<br>
aggregate if only a subset of the library functions get used).<br></blockqu=
ote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I believe sys=
temctl uses almost the entire shared lib, so there aren&#39;t any savings l=
ikely.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">As said I d=
on&#39;t consider the patchelf step terrible, and way less intrusive.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Norbert</div></div>

--000000000000212fc705e50a6f57--

--===============5770719301886783207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5770719301886783207==--
