Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94445C433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 21:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C5B660EEB;
	Mon,  9 May 2022 21:13:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EGgqyYT34gxE; Mon,  9 May 2022 21:13:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D795860EEA;
	Mon,  9 May 2022 21:13:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB6E71BF2C6
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 21:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0A50409E7
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 21:13:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NwD-UZ1blvuW for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 21:13:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17CDA4000B
 for <buildroot@buildroot.org>; Mon,  9 May 2022 21:13:19 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id t25so25970762lfg.7
 for <buildroot@buildroot.org>; Mon, 09 May 2022 14:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D7v+sCs2RSfaK3Ac+WycIH6j4ol66r5Y61iuW5gu+z8=;
 b=IrqaefaP/KKx6rG6ki9H6qZ8A+JBeJIhiPqkbupmnDptfjV7OLYsqbz6Dm5xSiX5JD
 biZx70f1PXzr2mNuQGNDZL/ILTvywlNa3MHS5R0GaJ3Qyo+cKn/G1rI6wgvZkW2rJGwJ
 DwVVjNG1v4yAcDD3MfS3FIORABEV2hYeUM1lzti6pVxZ70Gs9OTpZyUqi0M3+2i4xiEy
 OoIUjyO24R5nVGlHVETqo+nqsynp4CvWUCWBLsmHDRK+OfHmtOHSbx+1t/GITrFXdl1e
 2+OtZCMV1hVBtcGPLkZD/MMWdSAOFM79GhDt2dWn/EUZnMKzN7IRR9KIZwuV8gK28svm
 aJ0g==
X-Gm-Message-State: AOAM533WtZoVmDi4jBX+thk/fkD2zaXxFa5v+KNLZlE660HA+T7VigHc
 x0Ey7xg9fHgM+L838ChUHcZD/yVpF3VcHemIu11scUvYsq4=
X-Google-Smtp-Source: ABdhPJzlCRW4jjgTxrQP/O0eZzvyRnOrLlz2qWGF5897mp50nZ9wrRjUnz953HXZHunxgdgN7k6drJp4r79UuYmrHo8=
X-Received: by 2002:a05:6512:3da6:b0:473:adcb:c041 with SMTP id
 k38-20020a0565123da600b00473adcbc041mr14615996lfv.144.1652130797606; Mon, 09
 May 2022 14:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220509161258.188861-1-francois.perrad@gadz.org>
 <87pmkm8tlu.fsf@tarshish>
In-Reply-To: <87pmkm8tlu.fsf@tarshish>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 9 May 2022 23:13:06 +0200
Message-ID: <CAB0FRsuRrs__n5OUZVEWo77M+j+oUWfDgKg8B2gzXoWUbX38dQ@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH] package/htop: bump to version 3.2.0
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
Content-Type: multipart/mixed; boundary="===============0005967528369204800=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0005967528369204800==
Content-Type: multipart/alternative; boundary="000000000000506e9005de9aadae"

--000000000000506e9005de9aadae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 9 mai 2022 =C3=A0 20:10, Baruch Siach via buildroot <
buildroot@buildroot.org> a =C3=A9crit :

> Hi Francois,
>
> On Mon, May 09 2022, Francois Perrad wrote:
> > remove merged patch
>
> Is AUTORECONF still needed?
>
>
No.
Good catch.
v2 sent.

Fran=C3=A7ois


> baruch
>
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >  ...igure.ac-fix-static-build-with-hwloc.patch | 54 -------------------
> >  package/htop/htop.hash                        |  4 +-
> >  package/htop/htop.mk                          |  2 +-
> >  3 files changed, 3 insertions(+), 57 deletions(-)
> >  delete mode 100644
> package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch
> >
> > diff --git
> a/package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch
> > b/package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch
> > deleted file mode 100644
> > index 0ac79766c..000000000
> > --- a/package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch
> > +++ /dev/null
> > @@ -1,54 +0,0 @@
> > -From 4ccad4604586c921b4ad831b254496c2cdece9fc Mon Sep 17 00:00:00 2001
> > -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > -Date: Sat, 2 Apr 2022 17:27:01 +0200
> > -Subject: [PATCH] configure.ac: fix static build with hwloc
> > -
> > -Retrieve hwloc dependencies through pkg-config to avoid the following
> > -static build failure:
> > -
> > -checking for hwloc_get_proc_cpubind in -lhwloc... no
> > -configure: error: can not find required library libhwloc
> > -
> > -This build failure is raised because without pkg-config, hwloc
> > -dependencies such as libxml2 are not retrieved:
> > -
> > -configure:8999: checking for hwloc_get_proc_cpubind in -lhwloc
> > -configure:9022:
> >
> /home/autobuild/autobuild/instance-0/output-1/host/bin/powerpc-buildroot-=
linux-uclibc-gcc
> > -o conftest -D_GNU_SOURCE
> >
> -I/home/autobuild/autobuild/instance-0/output-1/host/powerpc-buildroot-li=
nux-uclibc/sysroot/usr/bin/../../usr/include
> > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -Og =
-g0
> > -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=
=3D64
> > -static conftest.c -lhwloc -llzma
> >
> -L/home/autobuild/autobuild/instance-0/output-1/host/powerpc-buildroot-li=
nux-uclibc/sysroot/usr/bin/../../usr/lib
> > -lncurses -lm >&5
> >
> -/home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/powerpc-build=
root-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld:
> >
> /home/autobuild/autobuild/instance-0/output-1/host/powerpc-buildroot-linu=
x-uclibc/sysroot/usr/bin/../../usr/lib/libhwloc.a(topology-xml-libxml.o):
> > in function `hwloc_libxml_free_buffer':
> > -topology-xml-libxml.c:(.text+0x6a): undefined reference to `xmlFree'
> > -
> > -Fixes:
> > - -
> http://autobuild.buildroot.org/results/5d815ec08c580005a863df6ac9ac29deff=
7d4128
> > -
> > -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > -[Retrieved from:
> > -
> https://github.com/htop-dev/htop/commit/4ccad4604586c921b4ad831b254496c2c=
dece9fc
> ]
> > ----
> > - configure.ac | 14 ++++++++++++--
> > - 1 file changed, 12 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/configure.ac b/configure.ac
> > -index 4ecac1ecf..6bb7eb69f 100644
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -456,8 +456,18 @@ case "$enable_hwloc" in
> > -    no)
> > -       ;;
> > -    yes)
> > --      AC_CHECK_LIB([hwloc], [hwloc_get_proc_cpubind], [],
> [AC_MSG_ERROR([can not find required library libhwloc])])
> > --      AC_CHECK_HEADERS([hwloc.h], [], [AC_MSG_ERROR([can not find
> require header file hwloc.h])])
> > -+      m4_ifdef([PKG_PROG_PKG_CONFIG], [
> > -+         PKG_PROG_PKG_CONFIG()
> > -+         PKG_CHECK_MODULES(HWLOC, hwloc, [
> > -+               CFLAGS=3D"$CFLAGS $HWLOC_CFLAGS" LIBS=3D"$LIBS $HWLOC_=
LIBS"
> > -+            ], [
> > -+ AC_CHECK_LIB([hwloc], [hwloc_get_proc_cpubind], [],
> [AC_MSG_ERROR([can not
> > find required library libhwloc])])
> > -+               AC_CHECK_HEADERS([hwloc.h], [], [AC_MSG_ERROR([can not
> find require header file hwloc.h])])
> > -+            ])
> > -+         ], [
> > -+ AC_CHECK_LIB([hwloc], [hwloc_get_proc_cpubind], [],
> [AC_MSG_ERROR([can not
> > find required library libhwloc])])
> > -+            AC_CHECK_HEADERS([hwloc.h], [], [AC_MSG_ERROR([can not
> find require header file hwloc.h])])
> > -+         ])
> > -       ;;
> > -    *)
> > -       AC_MSG_ERROR([bad value '$enable_hwloc' for --enable-hwloc])
> > diff --git a/package/htop/htop.hash b/package/htop/htop.hash
> > index d7c39be4d..908dd32c4 100644
> > --- a/package/htop/htop.hash
> > +++ b/package/htop/htop.hash
> > @@ -1,5 +1,5 @@
> > -# From
> https://github.com/htop-dev/htop/releases/download/3.1.2/htop-3.1.2.tar.x=
z.sha256
> > -sha256
> 884bce5b58cb113127860b9e368609019e92416a81550fdf0752052f3a64b388
> htop-3.1.2.tar.xz
> > +# From
> https://github.com/htop-dev/htop/releases/download/3.2.0/htop-3.2.0.tar.x=
z.sha256
> > +sha256
> e0f645d4ac324f2c4c48aaa7a3a96d007b95516559550be0b56e423fc5b6d783
> htop-3.2.0.tar.xz
> >
> >  # Locally calculated
> >  sha256
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> > diff --git a/package/htop/htop.mk b/package/htop/htop.mk
> > index 1e7b171a1..e1aba23b3 100644
> > --- a/package/htop/htop.mk
> > +++ b/package/htop/htop.mk
> > @@ -4,7 +4,7 @@
> >  #
> >
> #########################################################################=
#######
> >
> > -HTOP_VERSION =3D 3.1.2
> > +HTOP_VERSION =3D 3.2.0
> >  HTOP_SOURCE =3D htop-$(HTOP_VERSION).tar.xz
> >  HTOP_SITE =3D
> https://github.com/htop-dev/htop/releases/download/$(HTOP_VERSION)
> >  HTOP_DEPENDENCIES =3D ncurses
>
>
> --
>                                                      ~. .~   Tk Open
> Systems
> =3D}------------------------------------------------ooO--U--Ooo----------=
--{=3D
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000506e9005de9aadae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 9 mai 2022 =C3=A0=C2=A02=
0:10, Baruch Siach via buildroot &lt;<a href=3D"mailto:buildroot@buildroot.=
org">buildroot@buildroot.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Hi Francois,<br>
<br>
On Mon, May 09 2022, Francois Perrad wrote:<br>
&gt; remove merged patch<br>
<br>
Is AUTORECONF still needed?<br>
<br></blockquote><div><br></div><div>No.</div><div>Good catch.</div><div>v2=
 sent.<br></div><div><br></div><div>Fran=C3=A7ois<br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
baruch<br>
<br>
&gt; Signed-off-by: Francois Perrad &lt;<a href=3D"mailto:francois.perrad@g=
adz.org" target=3D"_blank">francois.perrad@gadz.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...igure.ac-fix-static-build-with-hwloc.patch | 54 -------------=
------<br>
&gt;=C2=A0 package/htop/htop.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
&gt;=C2=A0 package/htop/<a href=3D"http://htop.mk" rel=3D"noreferrer" targe=
t=3D"_blank">htop.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 3 files changed, 3 insertions(+), 57 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 package/htop/0001-configure.ac-fix-static-bui=
ld-with-hwloc.patch<br>
&gt;<br>
&gt; diff --git a/package/htop/0001-configure.ac-fix-static-build-with-hwlo=
c.patch<br>
&gt; b/package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 0ac79766c..000000000<br>
&gt; --- a/package/htop/0001-configure.ac-fix-static-build-with-hwloc.patch=
<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,54 +0,0 @@<br>
&gt; -From 4ccad4604586c921b4ad831b254496c2cdece9fc Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.c=
om" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; -Date: Sat, 2 Apr 2022 17:27:01 +0200<br>
&gt; -Subject: [PATCH] <a href=3D"http://configure.ac" rel=3D"noreferrer" t=
arget=3D"_blank">configure.ac</a>: fix static build with hwloc<br>
&gt; -<br>
&gt; -Retrieve hwloc dependencies through pkg-config to avoid the following=
<br>
&gt; -static build failure:<br>
&gt; -<br>
&gt; -checking for hwloc_get_proc_cpubind in -lhwloc... no<br>
&gt; -configure: error: can not find required library libhwloc<br>
&gt; -<br>
&gt; -This build failure is raised because without pkg-config, hwloc<br>
&gt; -dependencies such as libxml2 are not retrieved:<br>
&gt; -<br>
&gt; -configure:8999: checking for hwloc_get_proc_cpubind in -lhwloc<br>
&gt; -configure:9022:<br>
&gt; /home/autobuild/autobuild/instance-0/output-1/host/bin/powerpc-buildro=
ot-linux-uclibc-gcc<br>
&gt; -o conftest -D_GNU_SOURCE<br>
&gt; -I/home/autobuild/autobuild/instance-0/output-1/host/powerpc-buildroot=
-linux-uclibc/sysroot/usr/bin/../../usr/include<br>
&gt; -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -Og=
 -g0<br>
&gt; -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=
=3D64<br>
&gt; -static conftest.c -lhwloc -llzma<br>
&gt; -L/home/autobuild/autobuild/instance-0/output-1/host/powerpc-buildroot=
-linux-uclibc/sysroot/usr/bin/../../usr/lib<br>
&gt; -lncurses -lm &gt;&amp;5<br>
&gt; -/home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/powerpc-bu=
ildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/=
ld:<br>
&gt; /home/autobuild/autobuild/instance-0/output-1/host/powerpc-buildroot-l=
inux-uclibc/sysroot/usr/bin/../../usr/lib/libhwloc.a(topology-xml-libxml.o)=
:<br>
&gt; in function `hwloc_libxml_free_buffer&#39;:<br>
&gt; -topology-xml-libxml.c:(.text+0x6a): undefined reference to `xmlFree&#=
39;<br>
&gt; -<br>
&gt; -Fixes:<br>
&gt; - - <a href=3D"http://autobuild.buildroot.org/results/5d815ec08c580005=
a863df6ac9ac29deff7d4128" rel=3D"noreferrer" target=3D"_blank">http://autob=
uild.buildroot.org/results/5d815ec08c580005a863df6ac9ac29deff7d4128</a><br>
&gt; -<br>
&gt; -Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabric=
e@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; -[Retrieved from:<br>
&gt; -<a href=3D"https://github.com/htop-dev/htop/commit/4ccad4604586c921b4=
ad831b254496c2cdece9fc" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/htop-dev/htop/commit/4ccad4604586c921b4ad831b254496c2cdece9fc</a>]<br>
&gt; ----<br>
&gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> | 14 ++++++++++++--<br>
&gt; - 1 file changed, 12 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index 4ecac1ecf..6bb7eb69f 100644<br>
&gt; ---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -@@ -456,8 +456,18 @@ case &quot;$enable_hwloc&quot; in<br>
&gt; -=C2=A0 =C2=A0 no)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; -=C2=A0 =C2=A0 yes)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 AC_CHECK_LIB([hwloc], [hwloc_get_proc_cpubind],=
 [], [AC_MSG_ERROR([can not find required library libhwloc])])<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 AC_CHECK_HEADERS([hwloc.h], [], [AC_MSG_ERROR([=
can not find require header file hwloc.h])])<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 m4_ifdef([PKG_PROG_PKG_CONFIG], [<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PKG_PROG_PKG_CONFIG()<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PKG_CHECK_MODULES(HWLOC, hwloc, [<=
br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quo=
t;$CFLAGS $HWLOC_CFLAGS&quot; LIBS=3D&quot;$LIBS $HWLOC_LIBS&quot;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ], [<br>
&gt; -+ AC_CHECK_LIB([hwloc], [hwloc_get_proc_cpubind], [], [AC_MSG_ERROR([=
can not<br>
&gt; find required library libhwloc])])<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_CHECK_HEAD=
ERS([hwloc.h], [], [AC_MSG_ERROR([can not find require header file hwloc.h]=
)])<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0], [<br>
&gt; -+ AC_CHECK_LIB([hwloc], [hwloc_get_proc_cpubind], [], [AC_MSG_ERROR([=
can not<br>
&gt; find required library libhwloc])])<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_CHECK_HEADERS([hwloc.h]=
, [], [AC_MSG_ERROR([can not find require header file hwloc.h])])<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0])<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; -=C2=A0 =C2=A0 *)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_MSG_ERROR([bad value &#39;$enable_hwloc=
&#39; for --enable-hwloc])<br>
&gt; diff --git a/package/htop/htop.hash b/package/htop/htop.hash<br>
&gt; index d7c39be4d..908dd32c4 100644<br>
&gt; --- a/package/htop/htop.hash<br>
&gt; +++ b/package/htop/htop.hash<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt; -# From <a href=3D"https://github.com/htop-dev/htop/releases/download/=
3.1.2/htop-3.1.2.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/htop-dev/htop/releases/download/3.1.2/htop-3.1.2.tar.xz.sha256=
</a><br>
&gt; -sha256=C2=A0 884bce5b58cb113127860b9e368609019e92416a81550fdf0752052f=
3a64b388=C2=A0 htop-3.1.2.tar.xz<br>
&gt; +# From <a href=3D"https://github.com/htop-dev/htop/releases/download/=
3.2.0/htop-3.2.0.tar.xz.sha256" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/htop-dev/htop/releases/download/3.2.0/htop-3.2.0.tar.xz.sha256=
</a><br>
&gt; +sha256=C2=A0 e0f645d4ac324f2c4c48aaa7a3a96d007b95516559550be0b56e423f=
c5b6d783=C2=A0 htop-3.2.0.tar.xz<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Locally calculated<br>
&gt;=C2=A0 sha256=C2=A0 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404=
010521b880643=C2=A0 COPYING<br>
&gt; diff --git a/package/htop/<a href=3D"http://htop.mk" rel=3D"noreferrer=
" target=3D"_blank">htop.mk</a> b/package/htop/<a href=3D"http://htop.mk" r=
el=3D"noreferrer" target=3D"_blank">htop.mk</a><br>
&gt; index 1e7b171a1..e1aba23b3 100644<br>
&gt; --- a/package/htop/<a href=3D"http://htop.mk" rel=3D"noreferrer" targe=
t=3D"_blank">htop.mk</a><br>
&gt; +++ b/package/htop/<a href=3D"http://htop.mk" rel=3D"noreferrer" targe=
t=3D"_blank">htop.mk</a><br>
&gt; @@ -4,7 +4,7 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 ################################################################=
################<br>
&gt;=C2=A0 <br>
&gt; -HTOP_VERSION =3D 3.1.2<br>
&gt; +HTOP_VERSION =3D 3.2.0<br>
&gt;=C2=A0 HTOP_SOURCE =3D htop-$(HTOP_VERSION).tar.xz<br>
&gt;=C2=A0 HTOP_SITE =3D <a href=3D"https://github.com/htop-dev/htop/releas=
es/download/$(HTOP_VERSION)" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/htop-dev/htop/releases/download/$(HTOP_VERSION)</a><br>
&gt;=C2=A0 HTOP_DEPENDENCIES =3D ncurses<br>
<br>
<br>
-- <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~. .~=C2=A0 =C2=A0Tk Open Systems<=
br>
=3D}------------------------------------------------ooO--U--Ooo------------=
{=3D<br>
=C2=A0 =C2=A0- <a href=3D"mailto:baruch@tkos.co.il" target=3D"_blank">baruc=
h@tkos.co.il</a> - tel: +972.52.368.4656, <a href=3D"http://www.tkos.co.il"=
 rel=3D"noreferrer" target=3D"_blank">http://www.tkos.co.il</a> -<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--000000000000506e9005de9aadae--

--===============0005967528369204800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0005967528369204800==--
