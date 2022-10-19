Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B13C4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 14:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BF44611E4;
	Wed, 19 Oct 2022 14:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BF44611E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ycsHNmUMilV0; Wed, 19 Oct 2022 14:56:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E94C60B4E;
	Wed, 19 Oct 2022 14:56:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E94C60B4E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 177441BF403
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 14:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6BC283F68
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 14:56:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6BC283F68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CkFAUY5QHkoG for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 14:56:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9124883F23
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9124883F23
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 14:56:17 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id y72so19533918oia.3
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 07:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CJcvESdB2lEwUzo24UqGENSr/NuUtKxDizSyx8YfZEg=;
 b=CHSs8b/nq/Vf/2aQHkvPshTj7bMcilBgjQvi/BKgUVT04skoLN0ViEDT2hiGFmdAj/
 54ZawTMYuPmmyS0QwMAKqsNQaVevogRD50hgR2A/KRmRb21axolq6Cy40YVjseBP3aBs
 sAsTtMUx1hxar3oTK79NdnwFTir+ONWk9tCwQcSlqeTeQUJ1dOBriAUZS6ex7OoVNYIV
 fofeEcW2Q11cAZ677LajxO4LKH80OtEP3ZLtcpQk2Ev9N4M1fRXqS4MlYtCIEPM0wdsm
 5HTS5pTgMcfDlaPXgcRLeNeKTC/NHj3OJTA19IFaf3ZrbDBs64K/1J9q8zuM2gvus5JL
 1Etw==
X-Gm-Message-State: ACrzQf0ICMrFvDh/kRgZR63BXTmvGjS2tmX5r/4mFVFf1hL1NE0vBWIc
 RybwoW43Hm40X5E8bNxzXcvAvLoRC5LMYzgIwzfD0Q==
X-Google-Smtp-Source: AMsMyM5tTRfV+OHHbHTUTyenem4c7+TlNeM3LUV0L9Qh7Rz6Esdv8rYeN2Z3GQb3bjJ+WqEpfRz/YZ2yTlZlblJzBbc=
X-Received: by 2002:a05:6808:120c:b0:351:6d17:1845 with SMTP id
 a12-20020a056808120c00b003516d171845mr4712113oil.254.1666191376232; Wed, 19
 Oct 2022 07:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <20221019143219.329504-1-eero.aaltonen@vaisala.com>
In-Reply-To: <20221019143219.329504-1-eero.aaltonen@vaisala.com>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed, 19 Oct 2022 16:55:36 +0200
Message-ID: <CA+_SqVbv4KPcGnUryifUEy3RbUn+cw_J=BydTxhJfeMs-RC9Sw@mail.gmail.com>
To: Eero Aaltonen <eero.aaltonen@vaisala.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CJcvESdB2lEwUzo24UqGENSr/NuUtKxDizSyx8YfZEg=;
 b=WkYaIaGK6aUi+FaahfStSOFpRtVtMmP+RZGwqHxaHc0wA6a0k9pL8KQSFasPceeaoO
 ggnuly7+9hclYkLG0HCYMTfmJBY60bxN3+xXlpP/+Wnj1yjRFWP64Jb+2GanqSbpy9v9
 cQbOS3cPQnfLNT6d7udB1UQ6MSqCmkNj/mm0Q=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=WkYaIaGK
Subject: Re: [Buildroot] [PATCH 1/1] package/docopt.cpp: new package
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
Content-Type: multipart/mixed; boundary="===============8393471867399964220=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8393471867399964220==
Content-Type: multipart/alternative; boundary="0000000000001bc96305eb646984"

--0000000000001bc96305eb646984
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 19, 2022 at 4:33 PM Eero Aaltonen via buildroot <
buildroot@buildroot.org> wrote:

> Add docopt.cpp library that can be used to create intuitive command
> line interfaces with very little code by describing the valid calls
> using the (POSIX.1-2017) command line utility argument syntax.
>
> Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
>

Reviewed-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>

---
>
Good to me.

Testing:
* check-package
* legal-info
* compiling from source for an architecture


>  DEVELOPERS                         |  3 +++
>  package/Config.in                  |  1 +
>  package/docopt.cpp/Config.in       | 15 +++++++++++++++
>  package/docopt.cpp/docopt.cpp.hash |  6 ++++++
>  package/docopt.cpp/docopt.cpp.mk   | 13 +++++++++++++
>  5 files changed, 38 insertions(+)
>  create mode 100644 package/docopt.cpp/Config.in
>  create mode 100644 package/docopt.cpp/docopt.cpp.hash
>  create mode 100644 package/docopt.cpp/docopt.cpp.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c0e6f8bbef..8972bab2d1 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -777,6 +777,9 @@ F:  board/acmesystems/acqua-a5/
>  F:     configs/acmesystems_acqua_a5_256mb_defconfig
>  F:     configs/acmesystems_acqua_a5_512mb_defconfig
>
> +N:     Eero Aaltonen <eero.aaltonen@vaisala.com>
> +F:     package/docopt.cpp/
> +
>  N:     Eloi Bail <eloi.bail@savoirfairelinux.com>
>  F:     package/bayer2rgb-neon/
>  F:     package/gstreamer1/gst1-plugins-bayer2rgb-neon/
> diff --git a/package/Config.in b/package/Config.in
> index e3a34d6e97..77f86328ce 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2113,6 +2113,7 @@ endmenu
>
>  menu "Text and terminal handling"
>         source "package/augeas/Config.in"
> +       source "package/docopt.cpp/Config.in"
>         source "package/enchant/Config.in"
>         source "package/fmt/Config.in"
>         source "package/fstrcmp/Config.in"
> diff --git a/package/docopt.cpp/Config.in b/package/docopt.cpp/Config.in
> new file mode 100644
> index 0000000000..655a656398
> --- /dev/null
> +++ b/package/docopt.cpp/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_DOCOPT_CPP
> +       bool "docopt.cpp"
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
> +       help
> +         docopt is a library that lets you define a command line
> +         interface with the utility argument syntax that has been
> +         used by command line utilities for decades (POSIX.1-2017).
> +         From the description, docopt automatically generates a parser
> +         for the command line arguments.
> +
> +         docopt Command-line interface description language
> +         http://docopt.org/
> +
> +         docopt C++ port https://github.com/docopt/docopt.cpp
> diff --git a/package/docopt.cpp/docopt.cpp.hash
> b/package/docopt.cpp/docopt.cpp.hash
> new file mode 100644
> index 0000000000..f8a7f8d97b
> --- /dev/null
> +++ b/package/docopt.cpp/docopt.cpp.hash
> @@ -0,0 +1,6 @@
> +# Locally computed:
> +sha256  28af5a0c482c6d508d22b14d588a3b0bd9ff97135f99c2814a5aa3cbff1d6632
> v0.6.3.tar.gz
> +
> +# Hash for license files:
> +sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566
> LICENSE-Boost-1.0
> +sha256  b2959a980bc25f5d5e020d7a31777b7184aace6eb160acc80619f85edf646f19
> LICENSE-MIT
> diff --git a/package/docopt.cpp/docopt.cpp.mk b/package/docopt.cpp/
> docopt.cpp.mk
> new file mode 100644
> index 0000000000..647071243a
> --- /dev/null
> +++ b/package/docopt.cpp/docopt.cpp.mk
> @@ -0,0 +1,13 @@
>
> +################################################################################
> +#
> +# docopt.cpp
> +#
>
> +################################################################################
> +
> +DOCOPT_CPP_VERSION = 0.6.3
> +DOCOPT_CPP_SOURCE = v$(DOCOPT_CPP_VERSION).tar.gz
> +DOCOPT_CPP_SITE = https://github.com/docopt/docopt.cpp/archive/refs/tags
> +DOCOPT_CPP_INSTALL_STAGING = YES
> +DOCOPT_CPP_LICENSE_FILES = LICENSE-Boost-1.0 LICENSE-MIT
> +
> +$(eval $(cmake-package))
> --
> 2.25.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>


-- 

Angelo Compagnucci

Software Engineer

angelo@amarulasolutions.com
__________________________________
Amarula Solutions SRL

Via le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 (0)42 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
[`as] https://www.amarulasolutions.com|

--0000000000001bc96305eb646984
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 19, 2022 at 4:33 PM Eero =
Aaltonen via buildroot &lt;<a href=3D"mailto:buildroot@buildroot.org">build=
root@buildroot.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Add docopt.cpp library that can be used to create intuiti=
ve command<br>
line interfaces with very little code by describing the valid calls<br>
using the (POSIX.1-2017) command line utility argument syntax.<br>
<br>
Signed-off-by: Eero Aaltonen &lt;<a href=3D"mailto:eero.aaltonen@vaisala.co=
m" target=3D"_blank">eero.aaltonen@vaisala.com</a>&gt;<br></blockquote><div=
><br></div><div><span class=3D"gmail-term">Reviewed-by: Angelo Compagnucci =
&lt;<a href=3D"mailto:angelo@amarulasolutions.com">angelo@amarulasolutions.=
com</a>&gt;</span></div><div><span class=3D"gmail-term">Tested-by: Angelo C=
ompagnucci &lt;<a href=3D"mailto:angelo@amarulasolutions.com">angelo@amarul=
asolutions.com</a>&gt;</span></div><div><span class=3D"gmail-term"><br></sp=
an></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br></blockquote><div>Good to me.</div><div>=C2=A0<br></div><div>Testing=
:</div><div>* check-package</div><div>* legal-info<br></div><div>* compilin=
g from source for an architecture</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +++<br>
=C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0package/docopt.cpp/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 +++++++++=
++++++<br>
=C2=A0package/docopt.cpp/docopt.cpp.hash |=C2=A0 6 ++++++<br>
=C2=A0package/docopt.cpp/<a href=3D"http://docopt.cpp.mk" rel=3D"noreferrer=
" target=3D"_blank">docopt.cpp.mk</a>=C2=A0 =C2=A0| 13 +++++++++++++<br>
=C2=A05 files changed, 38 insertions(+)<br>
=C2=A0create mode 100644 package/docopt.cpp/Config.in<br>
=C2=A0create mode 100644 package/docopt.cpp/docopt.cpp.hash<br>
=C2=A0create mode 100644 package/docopt.cpp/<a href=3D"http://docopt.cpp.mk=
" rel=3D"noreferrer" target=3D"_blank">docopt.cpp.mk</a><br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index c0e6f8bbef..8972bab2d1 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -777,6 +777,9 @@ F:=C2=A0 board/acmesystems/acqua-a5/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0configs/acmesystems_acqua_a5_256mb_defconfig<br=
>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0configs/acmesystems_acqua_a5_512mb_defconfig<br=
>
<br>
+N:=C2=A0 =C2=A0 =C2=A0Eero Aaltonen &lt;<a href=3D"mailto:eero.aaltonen@va=
isala.com" target=3D"_blank">eero.aaltonen@vaisala.com</a>&gt;<br>
+F:=C2=A0 =C2=A0 =C2=A0package/docopt.cpp/<br>
+<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Eloi Bail &lt;<a href=3D"mailto:eloi.bail@savoi=
rfairelinux.com" target=3D"_blank">eloi.bail@savoirfairelinux.com</a>&gt;<b=
r>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/bayer2rgb-neon/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/gstreamer1/gst1-plugins-bayer2rgb-neon/=
<br>
diff --git a/package/Config.in b/package/Config.in<br>
index e3a34d6e97..77f86328ce 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -2113,6 +2113,7 @@ endmenu<br>
<br>
=C2=A0menu &quot;Text and terminal handling&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/augeas/Config.in&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/docopt.cpp/Config.in&quot;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/enchant/Config.in&quot;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/fmt/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/fstrcmp/Config.in&quot;<br=
>
diff --git a/package/docopt.cpp/Config.in b/package/docopt.cpp/Config.in<br=
>
new file mode 100644<br>
index 0000000000..655a656398<br>
--- /dev/null<br>
+++ b/package/docopt.cpp/Config.in<br>
@@ -0,0 +1,15 @@<br>
+config BR2_PACKAGE_DOCOPT_CPP<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;docopt.cpp&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_INSTALL_LIBSTDCPP<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++=
11<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0docopt is a library that lets you define=
 a command line<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interface with the utility argument synt=
ax that has been<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0used by command line utilities for decad=
es (POSIX.1-2017).<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0From the description, docopt automatical=
ly generates a parser<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for the command line arguments.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0docopt Command-line interface descriptio=
n language<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://docopt.org/" rel=3D"no=
referrer" target=3D"_blank">http://docopt.org/</a><br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0docopt C++ port <a href=3D"https://githu=
b.com/docopt/docopt.cpp" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/docopt/docopt.cpp</a><br>
diff --git a/package/docopt.cpp/docopt.cpp.hash b/package/docopt.cpp/docopt=
.cpp.hash<br>
new file mode 100644<br>
index 0000000000..f8a7f8d97b<br>
--- /dev/null<br>
+++ b/package/docopt.cpp/docopt.cpp.hash<br>
@@ -0,0 +1,6 @@<br>
+# Locally computed:<br>
+sha256=C2=A0 28af5a0c482c6d508d22b14d588a3b0bd9ff97135f99c2814a5aa3cbff1d6=
632=C2=A0 v0.6.3.tar.gz<br>
+<br>
+# Hash for license files:<br>
+sha256=C2=A0 c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad=
566=C2=A0 LICENSE-Boost-1.0<br>
+sha256=C2=A0 b2959a980bc25f5d5e020d7a31777b7184aace6eb160acc80619f85edf646=
f19=C2=A0 LICENSE-MIT<br>
diff --git a/package/docopt.cpp/<a href=3D"http://docopt.cpp.mk" rel=3D"nor=
eferrer" target=3D"_blank">docopt.cpp.mk</a> b/package/docopt.cpp/<a href=
=3D"http://docopt.cpp.mk" rel=3D"noreferrer" target=3D"_blank">docopt.cpp.m=
k</a><br>
new file mode 100644<br>
index 0000000000..647071243a<br>
--- /dev/null<br>
+++ b/package/docopt.cpp/<a href=3D"http://docopt.cpp.mk" rel=3D"noreferrer=
" target=3D"_blank">docopt.cpp.mk</a><br>
@@ -0,0 +1,13 @@<br>
+##########################################################################=
######<br>
+#<br>
+# docopt.cpp<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+DOCOPT_CPP_VERSION =3D 0.6.3<br>
+DOCOPT_CPP_SOURCE =3D v$(DOCOPT_CPP_VERSION).tar.gz<br>
+DOCOPT_CPP_SITE =3D <a href=3D"https://github.com/docopt/docopt.cpp/archiv=
e/refs/tags" rel=3D"noreferrer" target=3D"_blank">https://github.com/docopt=
/docopt.cpp/archive/refs/tags</a><br>
+DOCOPT_CPP_INSTALL_STAGING =3D YES<br>
+DOCOPT_CPP_LICENSE_FILES =3D LICENSE-Boost-1.0 LICENSE-MIT<br>
+<br>
+$(eval $(cmake-package))<br>
-- <br>
2.25.1<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:=
Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-st=
yle:normal;font-variant:normal;text-decoration:none;vertical-align:baseline=
;white-space:pre-wrap"></span><span style=3D"font-size:10pt;font-family:Ubu=
ntu,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:50=
0;font-style:normal;font-variant:normal;text-decoration:none;vertical-align=
:baseline;white-space:pre-wrap">Angelo Compagnucci</span></p><p dir=3D"ltr"=
 style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,=
0);background-color:transparent;font-weight:400;font-style:normal;font-vari=
ant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wra=
p">Software Engineer</span></p><p dir=3D"ltr" style=3D"line-height:1.8;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&qu=
ot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:non=
e;vertical-align:baseline;white-space:pre-wrap"><a href=3D"mailto:angelo@am=
arulasolutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>=C2=A0=
<br></span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot=
;,monospace;color:rgb(241,194,50);background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:none;vertical-ali=
gn:baseline;white-space:pre-wrap">__________________________________</span>=
<span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace=
;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre-wrap"><br></span><span style=3D"font-size:10pt;font-family:Ubun=
tu,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:500=
;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:=
baseline;white-space:pre-wrap">Amarula Solutions SRL</span></p><p dir=3D"lt=
r" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">Via le Canevare 30, 31100 Treviso, Veneto, IT</span></p><p dir=3D"lt=
r" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">T. +39 (0)42 243 5310</span><span style=3D"font-size:10pt;font-famil=
y:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:trans=
parent;font-weight:400;font-style:normal;font-variant:normal;text-decoratio=
n:none;vertical-align:baseline;white-space:pre-wrap"><br></span><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap"><a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@=
amarulasolutions.com</a></span></p><p dir=3D"ltr" style=3D"line-height:1.8;=
margin-top:0pt;margin-bottom:0pt"><a href=3D"http://www.amarulasolutions.co=
m/" style=3D"text-decoration:none" target=3D"_blank"><span style=3D"font-si=
ze:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);back=
ground-color:transparent;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">www.=
amarulasolutions.com</span></a></p><div>[`as] <a href=3D"https://www.amarul=
asolutions.com" target=3D"_blank">https://www.amarulasolutions.com</a>|</di=
v></div></div></div>

--0000000000001bc96305eb646984--

--===============8393471867399964220==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8393471867399964220==--
