Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69F7EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 17:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 770A280BF1;
	Thu, 20 Jul 2023 17:32:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 770A280BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DC-AwCK2JH75; Thu, 20 Jul 2023 17:32:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27D9582897;
	Thu, 20 Jul 2023 17:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27D9582897
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 168451BF5DA
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 17:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B16D482141
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 17:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B16D482141
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CvDrtu3RclKC for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 17:31:51 +0000 (UTC)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26C148204D
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 17:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26C148204D
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b703caf344so15452531fa.1
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 10:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689874309; x=1690479109;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IPrTonSKqE8ntvoRuFq2EWsTNjPpiDchuUt47eNU1pI=;
 b=FR01NxzM83qYAMd/ZvJPOIl9VoLA55rgjIMmd9MwgXiNEe3NG8FMTAcoliBUxTLkPs
 jtG5t226fUbeDZvKb//LzKZOkvoW31mmeNsKYBT46t6LUzm5+tAtuhDORsloim7Zammb
 6rO0g8OJkFPlhdYkvK/cPOCqP7jw5GVTEBifo/uYDvxUOOlDeftq5MjF0UCCpLdS1Wvh
 lY4Um0wsfpKiLpwYrh8mWhl2R/msR/3cOzPZUnDUJgBaKTRkLnmVa/C8mbmFFtxYnc7H
 uGfmkvaXA+5aQTkb3j/RnmtVC2rvUQ1m/H7mq4lYdr5R2fmHbqF9I+JIMN50A4FfkWW7
 a2Mw==
X-Gm-Message-State: ABy/qLZTfSLQ0h6PSzio8JGRxKm7LiiTSHLjTARwVzm6uVaCwc6+lHqb
 jrVKyhAyy2LUsmIGQ5fXQKCjkexSAj+wwsIiMCw=
X-Google-Smtp-Source: APBJJlGqlmOLbUCdC92KwhXE5xzB1MUwMDAX4oudAligfdQyXvNvd6MCmZW44qR7y9eoUnMWp0/K5LaY8L4UpKKEUX8=
X-Received: by 2002:a2e:9947:0:b0:2b6:9dd5:7a5 with SMTP id
 r7-20020a2e9947000000b002b69dd507a5mr3038207ljj.12.1689874308745; Thu, 20 Jul
 2023 10:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230615134315.494330-1-sebastian.weyer@smile.fr>
 <20230615134315.494330-5-sebastian.weyer@smile.fr>
In-Reply-To: <20230615134315.494330-5-sebastian.weyer@smile.fr>
From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 20 Jul 2023 10:31:37 -0700
Message-ID: <CAFSsvmrWPEVCKY3XtYiCme9u-pQL=omX62=i+NuGVRzEXGiMQw@mail.gmail.com>
To: Sebastian Weyer <sebastian.weyer@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689874309; x=1690479109;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IPrTonSKqE8ntvoRuFq2EWsTNjPpiDchuUt47eNU1pI=;
 b=W5YsgFcE0EaaeZnCFZHoj9tgj+nKg+peOE6z8O5NNA6kk3WLm9bEUBJW0r2qUF55Us
 Ju7rGG6g3OTUBqbsZ3ahRsxlcqd9+/kCyNqFPsUFdL0TYiuiKQU86V+o4c68IBAYLsIv
 uUzo6JfMxuD3lDxM3e9yIjirSnF7SAXhbz0AKfUVjEDEf/lFLbm7MEyYbvTzT6snyG+W
 pdDtGutCRALzAJ7iGQYG3IJoMAdVBWj2XJ/R6Mr2WOjzkdj51rY82iq4Ts7S6Q6g6kmN
 VW9C3PUhhBlFUlea+cUG/FGnJYWIaRO27ttmmqLV9ENyQtyb01TPoWGAFQ22mFw1jh0c
 zrVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=W5YsgFcE
Subject: Re: [Buildroot] [PATCH v4 04/10] package/clang: move to
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Lang Daniel <d.lang@abatec.at>,
 buildroot@buildroot.org, Romain Naour <romain.naour@smile.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: multipart/mixed; boundary="===============5616902910586627583=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5616902910586627583==
Content-Type: multipart/alternative; boundary="000000000000e34bc90600ee8560"

--000000000000e34bc90600ee8560
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>

On Thu, Jun 15, 2023 at 6:45=E2=80=AFAM Sebastian Weyer <sebastian.weyer@sm=
ile.fr>
wrote:

> From: Lang Daniel <d.lang@abatec.at>
>
> To make version bumping easier, move clang to a new llvm-project subfolde=
r
> and specify site and version for the project.
>
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> ---
> v4: change inaccuracy in commit message (move llvm -> move clang)
>
> v3: move "package/llvm-project/clang/Config.in" entry in package/Config.i=
n
> ---
>  DEVELOPERS                                                 | 6 +++---
>  package/Config.in                                          | 2 +-
>  ...-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch | 0
>  package/{ =3D> llvm-project}/clang/Config.in                 | 0
>  package/{ =3D> llvm-project}/clang/clang.hash                | 0
>  package/{ =3D> llvm-project}/clang/clang.mk                  | 7 +++----
>  6 files changed, 7 insertions(+), 8 deletions(-)
>  rename package/{ =3D>
> llvm-project}/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX=
-in-.patch
> (100%)
>  rename package/{ =3D> llvm-project}/clang/Config.in (100%)
>  rename package/{ =3D> llvm-project}/clang/clang.hash (100%)
>  rename package/{ =3D> llvm-project}/clang/clang.mk (96%)
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index befafff1d0..1fb8295a7a 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1634,10 +1634,10 @@ F:
> support/testing/tests/package/test_python_aexpect.py
>
>  N:     Joseph Kogut <joseph.kogut@gmail.com>
>  F:     package/at-spi2-core/
> -F:     package/clang/
>  F:     package/earlyoom/
>  F:     package/gconf/
>  F:     package/libnss/
> +F:     package/llvm-project/clang/
>  F:     package/llvm-project/lld/
>  F:     package/llvm-project/llvm/
>  F:     package/python-cython/
> @@ -2519,7 +2519,6 @@ F:        package/alure/
>  F:     package/aubio/
>  F:     package/binutils/
>  F:     package/bullet/
> -F:     package/clang/
>  F:     package/clinfo/
>  F:     package/efl/
>  F:     package/enet/
> @@ -2538,6 +2537,7 @@ F:        package/libgta/
>  F:     package/libiec61850/
>  F:     package/libspatialindex/
>  F:     package/linux-syscall-support/
> +F:     package/llvm-project/clang/
>  F:     package/llvm-project/llvm/
>  F:     package/lugaru/
>  F:     package/mcelog/
> @@ -2946,9 +2946,9 @@ F:        package/gettext-tiny/
>  F:     package/tinyssh/
>
>  N:     Valentin Korenblit <valentinkorenblit@gmail.com>
> -F:     package/clang/
>  F:     package/clinfo/
>  F:     package/libclc/
> +F:     package/llvm-project/clang/
>  F:     package/llvm-project/llvm/
>
>  N:     Vanya Sergeev <vsergeev@gmail.com>
> diff --git a/package/Config.in b/package/Config.in
> index dffffc195b..7f2f045c87 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2023,7 +2023,6 @@ menu "Other"
>         source "package/catch2/Config.in"
>         source "package/cctz/Config.in"
>         source "package/cereal/Config.in"
> -       source "package/clang/Config.in"
>         source "package/cmocka/Config.in"
>         source "package/compiler-rt/Config.in"
>         source "package/cppcms/Config.in"
> @@ -2128,6 +2127,7 @@ comment "linux-pam plugins"
>         source "package/libpam-tacplus/Config.in"
>  endif
>         source "package/liquid-dsp/Config.in"
> +       source "package/llvm-project/clang/Config.in"
>         source "package/llvm-project/llvm/Config.in"
>         source "package/lttng-libust/Config.in"
>         source "package/matio/Config.in"
> diff --git
> a/package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-=
.patch
> b/package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTA=
LL_PREFIX-in-.patch
> similarity index 100%
> rename from
> package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.p=
atch
> rename to
> package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL=
_PREFIX-in-.patch
> diff --git a/package/clang/Config.in b/package/llvm-project/clang/Config.=
in
> similarity index 100%
> rename from package/clang/Config.in
> rename to package/llvm-project/clang/Config.in
> diff --git a/package/clang/clang.hash
> b/package/llvm-project/clang/clang.hash
> similarity index 100%
> rename from package/clang/clang.hash
> rename to package/llvm-project/clang/clang.hash
> diff --git a/package/clang/clang.mk b/package/llvm-project/clang/clang.mk
> similarity index 96%
> rename from package/clang/clang.mk
> rename to package/llvm-project/clang/clang.mk
> index 3c75f8d6b1..0943e21a8c 100644
> --- a/package/clang/clang.mk
> +++ b/package/llvm-project/clang/clang.mk
> @@ -4,10 +4,9 @@
>  #
>
>  ########################################################################=
########
>
> -# LLVM, Clang and lld should be version bumped together
> -CLANG_VERSION_MAJOR =3D 11
> -CLANG_VERSION =3D $(CLANG_VERSION_MAJOR).1.0
> -CLANG_SITE =3D
> https://github.com/llvm/llvm-project/releases/download/llvmorg-$(CLANG_VE=
RSION)
> +CLANG_VERSION_MAJOR =3D $(LLVM_PROJECT_VERSION_MAJOR)
> +CLANG_VERSION =3D $(LLVM_PROJECT_VERSION)
> +CLANG_SITE =3D $(LLVM_PROJECT_SITE)
>  CLANG_SOURCE =3D clang-$(CLANG_VERSION).src.tar.xz
>  CLANG_LICENSE =3D Apache-2.0 with exceptions
>  CLANG_LICENSE_FILES =3D LICENSE.TXT
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000e34bc90600ee8560
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
To make version bumping easier, move clang to a new llvm-project subfolder<=
br>
and specify site and version for the project.<br>
<br>
Signed-off-by: Daniel Lang &lt;<a href=3D"mailto:d.lang@abatec.at" target=
=3D"_blank">d.lang@abatec.at</a>&gt;<br>
Signed-off-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@smile.fr" ta=
rget=3D"_blank">romain.naour@smile.fr</a>&gt;<br>
Signed-off-by: Sebastian Weyer &lt;<a href=3D"mailto:sebastian.weyer@smile.=
fr" target=3D"_blank">sebastian.weyer@smile.fr</a>&gt;<br>
---<br>
v4: change inaccuracy in commit message (move llvm -&gt; move clang)<br>
<br>
v3: move &quot;package/llvm-project/clang/Config.in&quot; entry in package/=
Config.in<br>
---<br>
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++---<br>
=C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0...-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch | 0<br>
=C2=A0package/{ =3D&gt; llvm-project}/clang/Config.in=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0package/{ =3D&gt; llvm-project}/clang/clang.hash=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A0package/{ =3D&gt; llvm-project}/clang/<a href=3D"http://clang.mk" rel=
=3D"noreferrer" target=3D"_blank">clang.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 7 +++----<br>
=C2=A06 files changed, 7 insertions(+), 8 deletions(-)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/clang/0001-lib-Driver-ToolChai=
ns-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch (100%)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/clang/Config.in (100%)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/clang/clang.hash (100%)<br>
=C2=A0rename package/{ =3D&gt; llvm-project}/clang/<a href=3D"http://clang.=
mk" rel=3D"noreferrer" target=3D"_blank">clang.mk</a> (96%)<br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index befafff1d0..1fb8295a7a 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -1634,10 +1634,10 @@ F:=C2=A0 =C2=A0 =C2=A0 support/testing/tests/packag=
e/test_python_aexpect.py<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Joseph Kogut &lt;<a href=3D"mailto:joseph.kogut=
@gmail.com" target=3D"_blank">joseph.kogut@gmail.com</a>&gt;<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/at-spi2-core/<br>
-F:=C2=A0 =C2=A0 =C2=A0package/clang/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/earlyoom/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/gconf/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/libnss/<br>
+F:=C2=A0 =C2=A0 =C2=A0package/llvm-project/clang/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/llvm-project/lld/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/llvm-project/llvm/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/python-cython/<br>
@@ -2519,7 +2519,6 @@ F:=C2=A0 =C2=A0 =C2=A0 =C2=A0 package/alure/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/aubio/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/binutils/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/bullet/<br>
-F:=C2=A0 =C2=A0 =C2=A0package/clang/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/clinfo/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/efl/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/enet/<br>
@@ -2538,6 +2537,7 @@ F:=C2=A0 =C2=A0 =C2=A0 =C2=A0 package/libgta/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/libiec61850/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/libspatialindex/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/linux-syscall-support/<br>
+F:=C2=A0 =C2=A0 =C2=A0package/llvm-project/clang/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/llvm-project/llvm/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/lugaru/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/mcelog/<br>
@@ -2946,9 +2946,9 @@ F:=C2=A0 =C2=A0 =C2=A0 =C2=A0 package/gettext-tiny/<b=
r>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/tinyssh/<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Valentin Korenblit &lt;<a href=3D"mailto:valent=
inkorenblit@gmail.com" target=3D"_blank">valentinkorenblit@gmail.com</a>&gt=
;<br>
-F:=C2=A0 =C2=A0 =C2=A0package/clang/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/clinfo/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/libclc/<br>
+F:=C2=A0 =C2=A0 =C2=A0package/llvm-project/clang/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/llvm-project/llvm/<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Vanya Sergeev &lt;<a href=3D"mailto:vsergeev@gm=
ail.com" target=3D"_blank">vsergeev@gmail.com</a>&gt;<br>
diff --git a/package/Config.in b/package/Config.in<br>
index dffffc195b..7f2f045c87 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -2023,7 +2023,6 @@ menu &quot;Other&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/catch2/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/cctz/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/cereal/Config.in&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/clang/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/cmocka/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/compiler-rt/Config.in&quot=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/cppcms/Config.in&quot;<br>
@@ -2128,6 +2127,7 @@ comment &quot;linux-pam plugins&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/libpam-tacplus/Config.in&q=
uot;<br>
=C2=A0endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/liquid-dsp/Config.in&quot;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/llvm-project/clang/Config.=
in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/llvm-project/llvm/Config.i=
n&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/lttng-libust/Config.in&quo=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/matio/Config.in&quot;<br>
diff --git a/package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_P=
REFIX-in-.patch b/package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu=
-Use-GCC_INSTALL_PREFIX-in-.patch<br>
similarity index 100%<br>
rename from package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PR=
EFIX-in-.patch<br>
rename to package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC=
_INSTALL_PREFIX-in-.patch<br>
diff --git a/package/clang/Config.in b/package/llvm-project/clang/Config.in=
<br>
similarity index 100%<br>
rename from package/clang/Config.in<br>
rename to package/llvm-project/clang/Config.in<br>
diff --git a/package/clang/clang.hash b/package/llvm-project/clang/clang.ha=
sh<br>
similarity index 100%<br>
rename from package/clang/clang.hash<br>
rename to package/llvm-project/clang/clang.hash<br>
diff --git a/package/clang/<a href=3D"http://clang.mk" rel=3D"noreferrer" t=
arget=3D"_blank">clang.mk</a> b/package/llvm-project/clang/<a href=3D"http:=
//clang.mk" rel=3D"noreferrer" target=3D"_blank">clang.mk</a><br>
similarity index 96%<br>
rename from package/clang/<a href=3D"http://clang.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">clang.mk</a><br>
rename to package/llvm-project/clang/<a href=3D"http://clang.mk" rel=3D"nor=
eferrer" target=3D"_blank">clang.mk</a><br>
index 3c75f8d6b1..0943e21a8c 100644<br>
--- a/package/clang/<a href=3D"http://clang.mk" rel=3D"noreferrer" target=
=3D"_blank">clang.mk</a><br>
+++ b/package/llvm-project/clang/<a href=3D"http://clang.mk" rel=3D"norefer=
rer" target=3D"_blank">clang.mk</a><br>
@@ -4,10 +4,9 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-# LLVM, Clang and lld should be version bumped together<br>
-CLANG_VERSION_MAJOR =3D 11<br>
-CLANG_VERSION =3D $(CLANG_VERSION_MAJOR).1.0<br>
-CLANG_SITE =3D <a href=3D"https://github.com/llvm/llvm-project/releases/do=
wnload/llvmorg-$(CLANG_VERSION)" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/llvm/llvm-project/releases/download/llvmorg-$(CLANG_VERSION)<=
/a><br>
+CLANG_VERSION_MAJOR =3D $(LLVM_PROJECT_VERSION_MAJOR)<br>
+CLANG_VERSION =3D $(LLVM_PROJECT_VERSION)<br>
+CLANG_SITE =3D $(LLVM_PROJECT_SITE)<br>
=C2=A0CLANG_SOURCE =3D clang-$(CLANG_VERSION).src.tar.xz<br>
=C2=A0CLANG_LICENSE =3D Apache-2.0 with exceptions<br>
=C2=A0CLANG_LICENSE_FILES =3D LICENSE.TXT<br>
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

--000000000000e34bc90600ee8560--

--===============5616902910586627583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5616902910586627583==--
