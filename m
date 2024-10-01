Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617E7CEACDD
	for <buildroot@archiver.kernel.org>; Tue,  1 Oct 2024 15:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DCA16079A;
	Tue,  1 Oct 2024 15:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sI7WuVq9NMnj; Tue,  1 Oct 2024 15:36:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD7F3607B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD7F3607B4;
	Tue,  1 Oct 2024 15:36:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC9CF1BF846
 for <buildroot@lists.busybox.net>; Tue,  1 Oct 2024 15:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB4FB607B4
 for <buildroot@lists.busybox.net>; Tue,  1 Oct 2024 15:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uu3GHQ56xFeF for <buildroot@lists.busybox.net>;
 Tue,  1 Oct 2024 15:36:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92f; helo=mail-ua1-x92f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 154016079A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 154016079A
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 154016079A
 for <buildroot@buildroot.org>; Tue,  1 Oct 2024 15:36:30 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-84e8ca005caso3176512241.1
 for <buildroot@buildroot.org>; Tue, 01 Oct 2024 08:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727796989; x=1728401789;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cOTE/7WFKWDbzegUrERNx5egtE4N2+EBYO94xyRAXpE=;
 b=m6o88z78OUtvRJg4UBX6NnTB/vu1yxx/2O1oEN+70A7A1V5th+KbjxJ9kF2U6zNwKS
 pSoQtfrcMyrXxVo7zwxP8eUEsJL60aWGU2kt0Vv/j/6rNaoFBAMzr+DuWDtRgP2SPuts
 6ll5yb0lrGJzsSjiEZd9GaYdO50gGip9iWT6EU0yWwH38qBPD8Bjkt7Pdpk+NOFi0YBd
 C/Ytcfzrw2Onh82709fN/TTDZl+ouRtl3carGA32k3TggDHt8iwabekRnZzHLCJ/r9c8
 FqN/2NZ8C/FnWdJhqmllxE1hnNE0ExltDO/Yk/txFqZEnGUo0toALjtmWkXBLilYA8cZ
 TZsA==
X-Gm-Message-State: AOJu0Yw+mPMppUwjRvJ6J2aQUeZajEllhEh/ab4JgHu+AvAY+v1STI3+
 W+CuvIdBmjolOz+tdeaNT230F8NGrHOUaowb92w+7t0S6wS8cRlR1yrOF+RAEiNzUVauZDkMSTV
 DuCYt6fIvzr7VzBGFX4edCY1T1vPHHwDU
X-Google-Smtp-Source: AGHT+IHTjziiAMMdgmAOZJFpHTGSsI2ClXgqSSw91SnpzmZVXyExK1e5Uby38AaBsMu5E82SrzOvJr2Wsi4OFmufIiM=
X-Received: by 2002:a05:6122:130a:b0:503:e3b5:36eb with SMTP id
 71dfb90a1353d-50ad3c5db3emr2765030e0c.3.1727796989243; Tue, 01 Oct 2024
 08:36:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240927235259.2046297-1-james.hilliard1@gmail.com>
 <1e9d4998-f628-4ec2-85c6-98d357ce6479@gmx.de>
In-Reply-To: <1e9d4998-f628-4ec2-85c6-98d357ce6479@gmx.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 1 Oct 2024 09:36:17 -0600
Message-ID: <CADvTj4oU=VKxmHhSu0S7mH=5uGnjq0ocsNkm+9kXyM-eMQf_AA@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727796989; x=1728401789; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cOTE/7WFKWDbzegUrERNx5egtE4N2+EBYO94xyRAXpE=;
 b=XcH+SeVwARZ7BVYw1Kc4q26fCL3fGtG+9MsJqCWIUR4uW6SeiOh7p339DkBbk4SC+0
 KKe8nJMorrMCZn5nouFJZDr9VpEMpGz0owVp7kzeF/0ds+aKd9aqaqOfKqDGXOTsF/7x
 Xtu3dOJemb20DaNxpRDgRV4cHn3OS2a9SSu2SxKvx2Y4GjWuuvHuhnO0ztsXqdICpk/e
 MiXHGUcMjBO1wiC8LSBUAimiKhzqMPSgGRAKPmSAbDs6zJomNZS1fmUCqCN9XTPmNp45
 kDpTEyBxciY98LFJDMg6f1K4qZfVTWBfJXImZa/p6xD4o9YtrwDUHUKyEhbbFhKOJXEA
 d7DQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XcH+SeVw
Subject: Re: [Buildroot] [PATCH 1/1] package/gobject-introspection: fix
 build with latest setuptools
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1565976823998424855=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1565976823998424855==
Content-Type: multipart/alternative; boundary="000000000000c9ba9a06236c15cb"

--000000000000c9ba9a06236c15cb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 4:33=E2=80=AFAM Fiona Klute <fiona.klute@gmx.de> wr=
ote:

> Am 28.09.24 um 01:52 schrieb James Hilliard:
> > When setuptools was updated to version 75.1.0 in buildroot commit
> > f01897aa6ceca00831c9b2c14f3ae90faaefce68 it broke gobject
> > introspection builds which relied on a deprecated MSVCCompiler
> > distutils module.
> >
> > Backport an upstream patch removing this module dependency.
>
> I'd prefer to see the update to gobject-introspection 1.82.0 merged
> instead, which already includes the patch. Though the backport could be
> a stop-gap measure if the update series needs any lengthy fixes. :-)
>

Yeah, probably best to just use the updated gobject-introspection if
it's not too problematic to merge.


>
> See:
>
> https://patchwork.ozlabs.org/project/buildroot/patch/20240925090526.34622=
17-4-fiona.klute@gmx.de/
> Series: https://patchwork.ozlabs.org/project/buildroot/list/?series=3D425=
356
>
> Best regards,
> Fiona
>
> > Fixes:
> >   -
> http://autobuild.buildroot.net/results/8e0/8e020d65509181148c597997280f19=
6c33b28574
> >   -
> http://autobuild.buildroot.net/results/2db/2db8ce60917b66030286da936c1f1f=
3aa657b6b7
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   ...-dependency-on-distutils.msvccompile.patch | 104 +++++++++++++++++=
+
> >   1 file changed, 104 insertions(+)
> >   create mode 100644
> package/gobject-introspection/0003-giscanner-remove-dependency-on-distuti=
ls.msvccompile.patch
> >
> > diff --git
> a/package/gobject-introspection/0003-giscanner-remove-dependency-on-distu=
tils.msvccompile.patch
> b/package/gobject-introspection/0003-giscanner-remove-dependency-on-distu=
tils.msvccompile.patch
> > new file mode 100644
> > index 0000000000..a3231a5ad6
> > --- /dev/null
> > +++
> b/package/gobject-introspection/0003-giscanner-remove-dependency-on-distu=
tils.msvccompile.patch
> > @@ -0,0 +1,104 @@
> > +From c8310afa42dfa598097eb0e003cef7965b5ed7be Mon Sep 17 00:00:00 2001
> > +From: Christoph Reiter <reiter.christoph@gmail.com>
> > +Date: Wed, 28 Aug 2024 21:26:02 +0200
> > +Subject: [PATCH] giscanner: remove dependency on distutils.msvccompile=
r
> > +
> > +It was removed with setuptools 74.0.0. Since we still depend on the
> > +MSVCCompiler class use new_compiler() to get it some other way.
> > +
> > +Remove any reference to MSVC9Compiler, which was for Visual Studio 200=
8
> > +which we no longer support anyway.
> > +
> > +Fixes #515
> > +
> > +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > +Upstream:
> https://gitlab.gnome.org/GNOME/gobject-introspection/-/commit/a2139dba59e=
ac283a7f543ed737f038deebddc19
> > +---
> > + giscanner/ccompiler.py    |  7 +++----
> > + giscanner/msvccompiler.py | 14 +++++++-------
> > + 2 files changed, 10 insertions(+), 11 deletions(-)
> > +
> > +diff --git a/giscanner/ccompiler.py b/giscanner/ccompiler.py
> > +index 2912fe0e..766c9a36 100644
> > +--- a/giscanner/ccompiler.py
> > ++++ b/giscanner/ccompiler.py
> > +@@ -26,7 +26,6 @@ import tempfile
> > + import sys
> > + import distutils
> > +
> > +-from distutils.msvccompiler import MSVCCompiler
> > + from distutils.unixccompiler import UnixCCompiler
> > + from distutils.cygwinccompiler import Mingw32CCompiler
> > + from distutils.sysconfig import get_config_vars
> > +@@ -167,7 +166,7 @@ class CCompiler(object):
> > +         # Now, create the distutils ccompiler instance based on the
> info we have.
> > +         if compiler_name =3D=3D 'msvc':
> > +             # For MSVC, we need to create a instance of a subclass of
> distutil's
> > +-            # MSVC9Compiler class, as it does not provide a
> preprocess()
> > ++            # MSVCCompiler class, as it does not provide a preprocess=
()
> > +             # implementation
> > +             from . import msvccompiler
> > +             self.compiler =3D msvccompiler.get_msvc_compiler()
> > +@@ -453,7 +452,7 @@ class CCompiler(object):
> > +             return self.compiler.linker_exe
> > +
> > +     def check_is_msvc(self):
> > +-        return isinstance(self.compiler, MSVCCompiler)
> > ++        return self.compiler.compiler_type =3D=3D "msvc"
> > +
> > +     # Private APIs
> > +     def _set_cpp_options(self, options):
> > +@@ -479,7 +478,7 @@ class CCompiler(object):
> > +                     # macros for compiling using distutils
> > +                     # get dropped for MSVC builds, so
> > +                     # escape the escape character.
> > +-                    if isinstance(self.compiler, MSVCCompiler):
> > ++                    if self.check_is_msvc():
> > +                         macro_value =3D macro_value.replace('\"', '\\=
\"')
> > +                 macros.append((macro_name, macro_value))
> > +             elif option.startswith('-U'):
> > +diff --git a/giscanner/msvccompiler.py b/giscanner/msvccompiler.py
> > +index 0a543982..e333a80f 100644
> > +--- a/giscanner/msvccompiler.py
> > ++++ b/giscanner/msvccompiler.py
> > +@@ -19,30 +19,30 @@
> > + #
> > +
> > + import os
> > +-import distutils
> > ++from typing import Type
> > +
> > + from distutils.errors import DistutilsExecError, CompileError
> > +-from distutils.ccompiler import CCompiler, gen_preprocess_options
> > ++from distutils.ccompiler import CCompiler, gen_preprocess_options,
> new_compiler
> > + from distutils.dep_util import newer
> > +
> > + # Distutil's MSVCCompiler does not provide a preprocess()
> > + # Implementation, so do our own here.
> > +
> > +
> > ++DistutilsMSVCCompiler: Type =3D type(new_compiler(compiler=3D"msvc"))
> > ++
> > ++
> > + def get_msvc_compiler():
> > +     return MSVCCompiler()
> > +
> > +
> > +-class MSVCCompiler(distutils.msvccompiler.MSVCCompiler):
> > ++class MSVCCompiler(DistutilsMSVCCompiler):
> > +
> > +     def __init__(self, verbose=3D0, dry_run=3D0, force=3D0):
> > +-        super(distutils.msvccompiler.MSVCCompiler, self).__init__()
> > ++        super(DistutilsMSVCCompiler, self).__init__()
> > +         CCompiler.__init__(self, verbose, dry_run, force)
> > +         self.__paths =3D []
> > +         self.__arch =3D None  # deprecated name
> > +-        if os.name =3D=3D 'nt':
> > +-            if isinstance(self, distutils.msvc9compiler.MSVCCompiler)=
:
> > +-                self.__version =3D distutils.msvc9compiler.VERSION
> > +         self.initialized =3D False
> > +         self.preprocess_options =3D None
> > +         if self.check_is_clang_cl():
> > +--
> > +2.34.1
> > +
>
>

--000000000000c9ba9a06236c15cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Sep 30, 2024 at 4:33=E2=80=AFAM F=
iona Klute &lt;<a href=3D"mailto:fiona.klute@gmx.de">fiona.klute@gmx.de</a>=
&gt; wrote:</div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Am 28.09.24 um 01:52 schrieb James Hilliard:<br>
&gt; When setuptools was updated to version 75.1.0 in buildroot commit<br>
&gt; f01897aa6ceca00831c9b2c14f3ae90faaefce68 it broke gobject<br>
&gt; introspection builds which relied on a deprecated MSVCCompiler<br>
&gt; distutils module.<br>
&gt;<br>
&gt; Backport an upstream patch removing this module dependency.<br>
<br>
I&#39;d prefer to see the update to gobject-introspection 1.82.0 merged<br>
instead, which already includes the patch. Though the backport could be<br>
a stop-gap measure if the update series needs any lengthy fixes. :-)<br></b=
lockquote><div><br></div><div>Yeah, probably best to just use the updated g=
object-introspection if</div><div>it&#39;s not too problematic to merge.<br=
></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
See:<br>
<a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/20240925090=
526.3462217-4-fiona.klute@gmx.de/" rel=3D"noreferrer" target=3D"_blank">htt=
ps://patchwork.ozlabs.org/project/buildroot/patch/20240925090526.3462217-4-=
fiona.klute@gmx.de/</a><br>
Series: <a href=3D"https://patchwork.ozlabs.org/project/buildroot/list/?ser=
ies=3D425356" rel=3D"noreferrer" target=3D"_blank">https://patchwork.ozlabs=
.org/project/buildroot/list/?series=3D425356</a><br>
<br>
Best regards,<br>
Fiona<br>
<br>
&gt; Fixes:<br>
&gt;=C2=A0 =C2=A0- <a href=3D"http://autobuild.buildroot.net/results/8e0/8e=
020d65509181148c597997280f196c33b28574" rel=3D"noreferrer" target=3D"_blank=
">http://autobuild.buildroot.net/results/8e0/8e020d65509181148c597997280f19=
6c33b28574</a><br>
&gt;=C2=A0 =C2=A0- <a href=3D"http://autobuild.buildroot.net/results/2db/2d=
b8ce60917b66030286da936c1f1f3aa657b6b7" rel=3D"noreferrer" target=3D"_blank=
">http://autobuild.buildroot.net/results/2db/2db8ce60917b66030286da936c1f1f=
3aa657b6b7</a><br>
&gt;<br>
&gt; Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gm=
ail.com" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0...-dependency-on-distutils.msvccompile.patch | 104 ++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 104 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 package/gobject-introspection/0003-gisc=
anner-remove-dependency-on-distutils.msvccompile.patch<br>
&gt;<br>
&gt; diff --git a/package/gobject-introspection/0003-giscanner-remove-depen=
dency-on-distutils.msvccompile.patch b/package/gobject-introspection/0003-g=
iscanner-remove-dependency-on-distutils.msvccompile.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a3231a5ad6<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/gobject-introspection/0003-giscanner-remove-dependency-o=
n-distutils.msvccompile.patch<br>
&gt; @@ -0,0 +1,104 @@<br>
&gt; +From c8310afa42dfa598097eb0e003cef7965b5ed7be Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Christoph Reiter &lt;<a href=3D"mailto:reiter.christoph@gmail.c=
om" target=3D"_blank">reiter.christoph@gmail.com</a>&gt;<br>
&gt; +Date: Wed, 28 Aug 2024 21:26:02 +0200<br>
&gt; +Subject: [PATCH] giscanner: remove dependency on distutils.msvccompil=
er<br>
&gt; +<br>
&gt; +It was removed with setuptools 74.0.0. Since we still depend on the<b=
r>
&gt; +MSVCCompiler class use new_compiler() to get it some other way.<br>
&gt; +<br>
&gt; +Remove any reference to MSVC9Compiler, which was for Visual Studio 20=
08<br>
&gt; +which we no longer support anyway.<br>
&gt; +<br>
&gt; +Fixes #515<br>
&gt; +<br>
&gt; +Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@g=
mail.com" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
&gt; +Upstream: <a href=3D"https://gitlab.gnome.org/GNOME/gobject-introspec=
tion/-/commit/a2139dba59eac283a7f543ed737f038deebddc19" rel=3D"noreferrer" =
target=3D"_blank">https://gitlab.gnome.org/GNOME/gobject-introspection/-/co=
mmit/a2139dba59eac283a7f543ed737f038deebddc19</a><br>
&gt; +---<br>
&gt; + giscanner/ccompiler.py=C2=A0 =C2=A0 |=C2=A0 7 +++----<br>
&gt; + giscanner/msvccompiler.py | 14 +++++++-------<br>
&gt; + 2 files changed, 10 insertions(+), 11 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/giscanner/ccompiler.py b/giscanner/ccompiler.py<br>
&gt; +index 2912fe0e..766c9a36 100644<br>
&gt; +--- a/giscanner/ccompiler.py<br>
&gt; ++++ b/giscanner/ccompiler.py<br>
&gt; +@@ -26,7 +26,6 @@ import tempfile<br>
&gt; + import sys<br>
&gt; + import distutils<br>
&gt; +<br>
&gt; +-from distutils.msvccompiler import MSVCCompiler<br>
&gt; + from distutils.unixccompiler import UnixCCompiler<br>
&gt; + from distutils.cygwinccompiler import Mingw32CCompiler<br>
&gt; + from distutils.sysconfig import get_config_vars<br>
&gt; +@@ -167,7 +166,7 @@ class CCompiler(object):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Now, create the distutils ccompil=
er instance based on the info we have.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if compiler_name =3D=3D &#39;msvc&#=
39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# For MSVC, we need t=
o create a instance of a subclass of distutil&#39;s<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # MSVC9Compiler class, as =
it does not provide a preprocess()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # MSVCCompiler class, as i=
t does not provide a preprocess()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# implementation<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from . import msvccom=
piler<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.compiler =3D msv=
ccompiler.get_msvc_compiler()<br>
&gt; +@@ -453,7 +452,7 @@ class CCompiler(object):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return self.compiler.=
linker_exe<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0def check_is_msvc(self):<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return isinstance(self.compiler, MSVCCom=
piler)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.compiler.compiler_type =3D=
=3D &quot;msvc&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# Private APIs<br>
&gt; +=C2=A0 =C2=A0 =C2=A0def _set_cpp_options(self, options):<br>
&gt; +@@ -479,7 +478,7 @@ class CCompiler(object):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0# macros for compiling using distutils<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0# get dropped for MSVC builds, so<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0# escape the escape character.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if isinstance(self.compiler, MSVCCompiler):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if self.check_is_msvc():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0macro_value =3D macro_value.replace(&#39;\&quot;&#39;,=
 &#39;\\\&quot;&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0macros.=
append((macro_name, macro_value))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif option.startswit=
h(&#39;-U&#39;):<br>
&gt; +diff --git a/giscanner/msvccompiler.py b/giscanner/msvccompiler.py<br=
>
&gt; +index 0a543982..e333a80f 100644<br>
&gt; +--- a/giscanner/msvccompiler.py<br>
&gt; ++++ b/giscanner/msvccompiler.py<br>
&gt; +@@ -19,30 +19,30 @@<br>
&gt; + #<br>
&gt; +<br>
&gt; + import os<br>
&gt; +-import distutils<br>
&gt; ++from typing import Type<br>
&gt; +<br>
&gt; + from distutils.errors import DistutilsExecError, CompileError<br>
&gt; +-from distutils.ccompiler import CCompiler, gen_preprocess_options<br=
>
&gt; ++from distutils.ccompiler import CCompiler, gen_preprocess_options, n=
ew_compiler<br>
&gt; + from distutils.dep_util import newer<br>
&gt; +<br>
&gt; + # Distutil&#39;s MSVCCompiler does not provide a preprocess()<br>
&gt; + # Implementation, so do our own here.<br>
&gt; +<br>
&gt; +<br>
&gt; ++DistutilsMSVCCompiler: Type =3D type(new_compiler(compiler=3D&quot;m=
svc&quot;))<br>
&gt; ++<br>
&gt; ++<br>
&gt; + def get_msvc_compiler():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return MSVCCompiler()<br>
&gt; +<br>
&gt; +<br>
&gt; +-class MSVCCompiler(distutils.msvccompiler.MSVCCompiler):<br>
&gt; ++class MSVCCompiler(DistutilsMSVCCompiler):<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0def __init__(self, verbose=3D0, dry_run=3D0, forc=
e=3D0):<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 super(distutils.msvccompiler.MSVCCompile=
r, self).__init__()<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 super(DistutilsMSVCCompiler, self).__ini=
t__()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CCompiler.__init__(self, verbose, d=
ry_run, force)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.__paths =3D []<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.__arch =3D None=C2=A0 # deprec=
ated name<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://os.name" rel=3D"nor=
eferrer" target=3D"_blank">os.name</a> =3D=3D &#39;nt&#39;:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(self, distut=
ils.msvc9compiler.MSVCCompiler):<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.__versi=
on =3D distutils.msvc9compiler.VERSION<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.initialized =3D False<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.preprocess_options =3D None<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.check_is_clang_cl():<br>
&gt; +--<br>
&gt; +2.34.1<br>
&gt; +<br>
<br>
</blockquote></div></div>

--000000000000c9ba9a06236c15cb--

--===============1565976823998424855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1565976823998424855==--
