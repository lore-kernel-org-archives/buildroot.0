Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013C0EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 17:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A46D812FA;
	Thu, 20 Jul 2023 17:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A46D812FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FployKV6J98i; Thu, 20 Jul 2023 17:32:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 346C0829A9;
	Thu, 20 Jul 2023 17:32:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 346C0829A9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C53C1BF5DA
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 17:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15EEC416FA
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 17:32:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15EEC416FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YPqXHbCF78b2 for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 17:32:00 +0000 (UTC)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4024416C4
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 17:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4024416C4
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b961822512so16403261fa.2
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 10:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689874318; x=1690479118;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v1zdfMAHhm/5P8yyriCILkE8kjnBFpnpIclPP+MYNR4=;
 b=gLkRUuvjInqFn/anNdcOBgNh+1iil3GQz6JnOvT1vDOr1ez+tX159L3rPuBzexisd4
 59avkKBc28uxhnp7bpuPKHFG9H6Uyiwfl7EKH7xfsRiz5f0vv1LX0IHr6CJN+K2flams
 1qbNGyaL6ULo5pKE2g8YhR7eN65rqurQnUiQ+v8gGPkhDlHGKjaueRthed7yV3qLb3bd
 Xgka7k3c0PLTV6X6LPycifmOUV/D/Vv4MLmMBsMugxoSDzkT3EoefEoG75LYWfmywCkQ
 wMz6OWAEXcjBlPu3yBjlu0bAXgfqol+DxnpyuCQ0eWU0gO4OMzXG94pEkWczhcZf3/sE
 jqtQ==
X-Gm-Message-State: ABy/qLZxbxdHlV5ErHVi8q+OO4Yo99D84cONHZhgjf0HPvO5fdg6Y2Zq
 tgpUHL54U42IaKj0gfuw+GASIB0zUI7cW1n0CXc=
X-Google-Smtp-Source: APBJJlHxyvaII/jOmQPTgcPxx+kFQZ483fUpcIoB9IzW/KkTfAPHwzCn7SPm/vigZ80EzXI6bduqeQ8YFhqaEMU23fc=
X-Received: by 2002:a2e:9108:0:b0:2b6:c8ba:90dc with SMTP id
 m8-20020a2e9108000000b002b6c8ba90dcmr2739154ljg.36.1689874317478; Thu, 20 Jul
 2023 10:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230615134315.494330-1-sebastian.weyer@smile.fr>
 <20230615134315.494330-6-sebastian.weyer@smile.fr>
In-Reply-To: <20230615134315.494330-6-sebastian.weyer@smile.fr>
From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 20 Jul 2023 10:31:46 -0700
Message-ID: <CAFSsvmq7mYGW0L6Bj-b6kihTGF0EQQ9j6Pb67f1xYm1GEy0NFg@mail.gmail.com>
To: Sebastian Weyer <sebastian.weyer@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689874318; x=1690479118;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v1zdfMAHhm/5P8yyriCILkE8kjnBFpnpIclPP+MYNR4=;
 b=M6v+Vju6E9PjzPj3EenUXJCmBcuz/kd3R/apx7b2P16aX5+GrKjl7rdPJQWWVMMR8m
 zOvcnnxNknAbCM9bQzcEi/37bRyQkuS2Yvenr2l83zC+N1Q+MKIkq/VNVhSj6in7PelJ
 Ut1TvGEIY0mkvQNzKGX4uAv+ZerE7yZNLu8p/KyE3r6v1FMlUPd52AgG0f8dur4iR7hH
 lYAje+kEtfGzibAGxghpqZDqJfgIr2pIMKOLUXjdYaOlTDlZ9k1OqKOk+rwctWtqEtGD
 NRVOih6yz0teuEQoEB+UPaYXnBEPTtUje+eU4DntxbfPX94R2FxknVFlFMbP6CrX2XrP
 SpAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=M6v+Vju6
Subject: Re: [Buildroot] [PATCH v4 05/10] package/compiler-rt: move to
 llvm-project subfolder
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
Cc: Lang Daniel <d.lang@abatec.at>, Romain Naour <romain.naour@smile.fr>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7104759790156507652=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7104759790156507652==
Content-Type: multipart/alternative; boundary="000000000000688ede0600ee8690"

--000000000000688ede0600ee8690
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>

On Thu, Jun 15, 2023 at 6:45=E2=80=AFAM Sebastian Weyer <sebastian.weyer@sm=
ile.fr>
wrote:

> From: Lang Daniel <d.lang@abatec.at>
>
> To make version bumping easier, move compiler-rt to a new llvm-project
> subfolder and specify site and version for the project.
>
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> Reviewed-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> ---
> v4:
>     - change inaccuracy in commit message (move llvm -> move compiler-rt)
>     - remove change in DEVELOPERS file because the person removed their
>       name from the file
>
> v3: move compiler-rt entry in package/Config.in
> ---
>  package/Config.in                                       | 2 +-
>  package/{ =3D> llvm-project}/compiler-rt/Config.in        | 0
>  package/{ =3D> llvm-project}/compiler-rt/compiler-rt.hash | 0
>  package/{ =3D> llvm-project}/compiler-rt/compiler-rt.mk   | 6 ++----
>  4 files changed, 3 insertions(+), 5 deletions(-)
>  rename package/{ =3D> llvm-project}/compiler-rt/Config.in (100%)
>  rename package/{ =3D> llvm-project}/compiler-rt/compiler-rt.hash (100%)
>  rename package/{ =3D> llvm-project}/compiler-rt/compiler-rt.mk (85%)
>
> diff --git a/package/Config.in b/package/Config.in
> index 7f2f045c87..17343a8e86 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2024,7 +2024,6 @@ menu "Other"
>         source "package/cctz/Config.in"
>         source "package/cereal/Config.in"
>         source "package/cmocka/Config.in"
> -       source "package/compiler-rt/Config.in"
>         source "package/cppcms/Config.in"
>         source "package/cracklib/Config.in"
>         source "package/dawgdic/Config.in"
> @@ -2128,6 +2127,7 @@ comment "linux-pam plugins"
>  endif
>         source "package/liquid-dsp/Config.in"
>         source "package/llvm-project/clang/Config.in"
> +       source "package/llvm-project/compiler-rt/Config.in"
>         source "package/llvm-project/llvm/Config.in"
>         source "package/lttng-libust/Config.in"
>         source "package/matio/Config.in"
> diff --git a/package/compiler-rt/Config.in
> b/package/llvm-project/compiler-rt/Config.in
> similarity index 100%
> rename from package/compiler-rt/Config.in
> rename to package/llvm-project/compiler-rt/Config.in
> diff --git a/package/compiler-rt/compiler-rt.hash
> b/package/llvm-project/compiler-rt/compiler-rt.hash
> similarity index 100%
> rename from package/compiler-rt/compiler-rt.hash
> rename to package/llvm-project/compiler-rt/compiler-rt.hash
> diff --git a/package/compiler-rt/compiler-rt.mk
> b/package/llvm-project/compiler-rt/compiler-rt.mk
> similarity index 85%
> rename from package/compiler-rt/compiler-rt.mk
> rename to package/llvm-project/compiler-rt/compiler-rt.mk
> index c8ea86e899..84add60801 100644
> --- a/package/compiler-rt/compiler-rt.mk
> +++ b/package/llvm-project/compiler-rt/compiler-rt.mk
> @@ -4,11 +4,9 @@
>  #
>
>  ########################################################################=
########
>
> -# Compiler-RT should be bumped together with LLVM and Clang as the
> run-time is
> -# tied to the version of those tools
> -COMPILER_RT_VERSION =3D 11.1.0
> +COMPILER_RT_VERSION =3D $(LLVM_PROJECT_VERSION)
>  COMPILER_RT_SOURCE =3D compiler-rt-$(COMPILER_RT_VERSION).src.tar.xz
> -COMPILER_RT_SITE =3D
> https://github.com/llvm/llvm-project/releases/download/llvmorg-$(COMPILER=
_RT_VERSION)
> +COMPILER_RT_SITE =3D $(LLVM_PROJECT_SITE)
>  COMPILER_RT_LICENSE =3D NCSA MIT
>  COMPILER_RT_LICENSE_FILES =3D LICENSE.TXT
>  COMPILER_RT_DEPENDENCIES =3D host-clang llvm
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000688ede0600ee8690
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Tested-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett=
@amarulasolutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com<=
/a>&gt;<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Thu, Jun 15, 2023 at 6:45=E2=80=AFAM Sebastian Weyer &lt;<a h=
ref=3D"mailto:sebastian.weyer@smile.fr">sebastian.weyer@smile.fr</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Lang =
Daniel &lt;<a href=3D"mailto:d.lang@abatec.at" target=3D"_blank">d.lang@aba=
tec.at</a>&gt;<br>
<br>
To make version bumping easier, move compiler-rt to a new llvm-project<br>
subfolder and specify site and version for the project.<br>
<br>
Signed-off-by: Daniel Lang &lt;<a href=3D"mailto:d.lang@abatec.at" target=
=3D"_blank">d.lang@abatec.at</a>&gt;<br>
Reviewed-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@smile.fr" targ=
et=3D"_blank">romain.naour@smile.fr</a>&gt;<br>
Signed-off-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@smile.fr" ta=
rget=3D"_blank">romain.naour@smile.fr</a>&gt;<br>
Signed-off-by: Sebastian Weyer &lt;<a href=3D"mailto:sebastian.weyer@smile.=
fr" target=3D"_blank">sebastian.weyer@smile.fr</a>&gt;<br>
---<br>
v4:<br>
=C2=A0 =C2=A0 - change inaccuracy in commit message (move llvm -&gt; move c=
ompiler-rt)<br>
=C2=A0 =C2=A0 - remove change in DEVELOPERS file because the person removed=
 their<br>
=C2=A0 =C2=A0 =C2=A0 name from the file<br>
<br>
v3: move compiler-rt entry in package/Config.in<br>
---<br>
=C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 2 +-<br>
=C2=A0package/{ =3D&gt; llvm-project}/compiler-rt/Config.in=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 0<br>
=C2=A0package/{ =3D&gt; llvm-project}/compiler-rt/compiler-rt.hash | 0<br>
=C2=A0package/{ =3D&gt; llvm-project}/compiler-rt/<a href=3D"http://compile=
r-rt.mk" rel=3D"noreferrer" target=3D"_blank">compiler-rt.mk</a>=C2=A0 =C2=
=A0| 6 ++----<br>
=C2=A04 files changed, 3 insertions(+), 5 deletions(-)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/compiler-rt/Config.in (100%)<b=
r>
=C2=A0rename package/{ =3D&gt; llvm-project}/compiler-rt/compiler-rt.hash (=
100%)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/compiler-rt/<a href=3D"http://=
compiler-rt.mk" rel=3D"noreferrer" target=3D"_blank">compiler-rt.mk</a> (85=
%)<br>
<br>
diff --git a/package/Config.in b/package/Config.in<br>
index 7f2f045c87..17343a8e86 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -2024,7 +2024,6 @@ menu &quot;Other&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/cctz/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/cereal/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/cmocka/Config.in&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/compiler-rt/Config.in&quot=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/cppcms/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/cracklib/Config.in&quot;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/dawgdic/Config.in&quot;<br=
>
@@ -2128,6 +2127,7 @@ comment &quot;linux-pam plugins&quot;<br>
=C2=A0endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/liquid-dsp/Config.in&quot;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/llvm-project/clang/Config.=
in&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/llvm-project/compiler-rt/C=
onfig.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/llvm-project/llvm/Config.i=
n&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/lttng-libust/Config.in&quo=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/matio/Config.in&quot;<br>
diff --git a/package/compiler-rt/Config.in b/package/llvm-project/compiler-=
rt/Config.in<br>
similarity index 100%<br>
rename from package/compiler-rt/Config.in<br>
rename to package/llvm-project/compiler-rt/Config.in<br>
diff --git a/package/compiler-rt/compiler-rt.hash b/package/llvm-project/co=
mpiler-rt/compiler-rt.hash<br>
similarity index 100%<br>
rename from package/compiler-rt/compiler-rt.hash<br>
rename to package/llvm-project/compiler-rt/compiler-rt.hash<br>
diff --git a/package/compiler-rt/<a href=3D"http://compiler-rt.mk" rel=3D"n=
oreferrer" target=3D"_blank">compiler-rt.mk</a> b/package/llvm-project/comp=
iler-rt/<a href=3D"http://compiler-rt.mk" rel=3D"noreferrer" target=3D"_bla=
nk">compiler-rt.mk</a><br>
similarity index 85%<br>
rename from package/compiler-rt/<a href=3D"http://compiler-rt.mk" rel=3D"no=
referrer" target=3D"_blank">compiler-rt.mk</a><br>
rename to package/llvm-project/compiler-rt/<a href=3D"http://compiler-rt.mk=
" rel=3D"noreferrer" target=3D"_blank">compiler-rt.mk</a><br>
index c8ea86e899..84add60801 100644<br>
--- a/package/compiler-rt/<a href=3D"http://compiler-rt.mk" rel=3D"noreferr=
er" target=3D"_blank">compiler-rt.mk</a><br>
+++ b/package/llvm-project/compiler-rt/<a href=3D"http://compiler-rt.mk" re=
l=3D"noreferrer" target=3D"_blank">compiler-rt.mk</a><br>
@@ -4,11 +4,9 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-# Compiler-RT should be bumped together with LLVM and Clang as the run-tim=
e is<br>
-# tied to the version of those tools<br>
-COMPILER_RT_VERSION =3D 11.1.0<br>
+COMPILER_RT_VERSION =3D $(LLVM_PROJECT_VERSION)<br>
=C2=A0COMPILER_RT_SOURCE =3D compiler-rt-$(COMPILER_RT_VERSION).src.tar.xz<=
br>
-COMPILER_RT_SITE =3D <a href=3D"https://github.com/llvm/llvm-project/relea=
ses/download/llvmorg-$(COMPILER_RT_VERSION)" rel=3D"noreferrer" target=3D"_=
blank">https://github.com/llvm/llvm-project/releases/download/llvmorg-$(COM=
PILER_RT_VERSION)</a><br>
+COMPILER_RT_SITE =3D $(LLVM_PROJECT_SITE)<br>
=C2=A0COMPILER_RT_LICENSE =3D NCSA MIT<br>
=C2=A0COMPILER_RT_LICENSE_FILES =3D LICENSE.TXT<br>
=C2=A0COMPILER_RT_DEPENDENCIES =3D host-clang llvm<br>
-- <br>
2.34.1<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--000000000000688ede0600ee8690--

--===============7104759790156507652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7104759790156507652==--
