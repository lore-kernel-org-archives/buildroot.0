Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43C8C433FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 16:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 662464002A;
	Wed, 19 Oct 2022 16:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 662464002A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PaSskvsycWB3; Wed, 19 Oct 2022 16:15:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4C0D4018F;
	Wed, 19 Oct 2022 16:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4C0D4018F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD90F1BF283
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 16:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A77B44020A
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 16:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A77B44020A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RdsamuR-ynnV for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 16:15:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3A244018F
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3A244018F
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 16:15:15 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id p127so19133199oih.9
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 09:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zoi7pHPR1aXkxayYmt7QISShkkjchlWmvb/zRdJhIx4=;
 b=J7UfXXky1eNwIDg0tnqc1mV/D99+ix1ZCM9nbqFjEwhGHJvTuAlFIIYHdt30SUgP9C
 HgJUHuS9bmt5bQQkOU1Zsljc7Tt96opIXt8CUV7r4hArWtuJwzX7kTluR/6AMO7LrK/O
 cPax/ciqIMtzB9s57gRlvJ8AoJhFreANMAz6pPdRsDmwohv1XqUCspyneeec7EY7Qa0b
 pOrcS09dDM4ePMWZQF79Hu4xf+3Lnxz1/LcSsiX6QbBSRr4bzkeELkUnAmF/UG2d4Awh
 CtbZI4ZQL7dSKLV+VbKAOSSvO6mogYN8ng3R8KhINV+C5dxtFAYiSYafLTPWqxMimExL
 vukQ==
X-Gm-Message-State: ACrzQf0u4pPOqxPWfL90s3ryqGCnfk/ZOm/LtsZQeHskCmZ8GVMY/rHw
 bc0ElH7tAkrOt7TqBeX/kD/Q/NS/dVWNp3pDLDDaeBe/RzP6RA==
X-Google-Smtp-Source: AMsMyM5LW1OCtjhy+0R7jOYwzuyatawxgNSvEpA8jfPHoqr2NZpmzF2xosCwNMBUJMGtEVaHZaWYLxo3zdVqyOvLyR4=
X-Received: by 2002:a05:6808:120c:b0:351:6d17:1845 with SMTP id
 a12-20020a056808120c00b003516d171845mr4943932oil.254.1666196114967; Wed, 19
 Oct 2022 09:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20221002150443.159058-1-robimarko@gmail.com>
In-Reply-To: <20221002150443.159058-1-robimarko@gmail.com>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed, 19 Oct 2022 18:14:37 +0200
Message-ID: <CA+_SqVb_myPvacmgT4+hvk09VqxB0zSTWVNMPcfQX7_vjc8paA@mail.gmail.com>
To: Robert Marko <robimarko@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zoi7pHPR1aXkxayYmt7QISShkkjchlWmvb/zRdJhIx4=;
 b=oGzbgWtUCvnC3FQjlVjhh8pyzBcB2AQrADT+NUoDBKItBEoT4U9r37Tsp2zX4AQYSw
 jIhsb4sYGeej6dqIs3/6YH35aqQl9JyQyYrOzitl/choxmsCVD8RViUJObra1k+al22s
 /bQ1A5L2T3aK2lanzsDXKdlsUCI2GNqN+lDXc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=oGzbgWtU
Subject: Re: [Buildroot] [PATCH v2] package/mdio-tools: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4339624853792097642=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4339624853792097642==
Content-Type: multipart/alternative; boundary="0000000000008f244205eb65830c"

--0000000000008f244205eb65830c
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 2, 2022 at 5:05 PM Robert Marko <robimarko@gmail.com> wrote:

> mdio-tools are kernel module and accompanying tools for low-level
> debugging of devices attached on MDIO bus like PHY-s, switches etc.
>
> Userspace tools provide C22 or C45 reads and writes, benchmarking
> and even dedicated Marvell Link Street tools via the included
> kernel module.
>
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
> Changes in v2:
> * Correct license
> * Add host-pkgconf to DEPENDENCIES
> * Add minimal required kernel config options
> ---
>  package/Config.in                  |  1 +
>  package/mdio-tools/Config.in       |  9 +++++++++
>  package/mdio-tools/mdio-tools.hash |  3 +++
>  package/mdio-tools/mdio-tools.mk   | 20 ++++++++++++++++++++
>  4 files changed, 33 insertions(+)
>  create mode 100644 package/mdio-tools/Config.in
>  create mode 100644 package/mdio-tools/mdio-tools.hash
>  create mode 100644 package/mdio-tools/mdio-tools.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index e3a34d6e97..ed41e8bdd4 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -536,6 +536,7 @@ endmenu
>         source "package/mbpfan/Config.in"
>         source "package/mdadm/Config.in"
>         source "package/mdevd/Config.in"
> +       source "package/mdio-tools/Config.in"
>         source "package/memtest86/Config.in"
>         source "package/memtester/Config.in"
>         source "package/memtool/Config.in"
> diff --git a/package/mdio-tools/Config.in b/package/mdio-tools/Config.in
> new file mode 100644
> index 0000000000..feb1e825ac
> --- /dev/null
> +++ b/package/mdio-tools/Config.in
> @@ -0,0 +1,9 @@
> +comment "mdio-tools needs a Linux kernel to be built"
> +       depends on !BR2_LINUX_KERNEL
> +
> +config BR2_PACKAGE_MDIO_TOOLS
> +       bool "mdio-tools"
> +       depends on BR2_LINUX_KERNEL
>

depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1

I think you miss this here


> +       select BR2_PACKAGE_LIBMNL
> +       help
> +         Low-level debug tools for MDIO devices
> diff --git a/package/mdio-tools/mdio-tools.hash
> b/package/mdio-tools/mdio-tools.hash
> new file mode 100644
> index 0000000000..0111165f27
> --- /dev/null
> +++ b/package/mdio-tools/mdio-tools.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  c5e17431c62392f6c1da1ba4fb0a6f5918521509a377af74485851f93ff2a106
> mdio-tools-1.2.0.tar.gz
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
> COPYING
> diff --git a/package/mdio-tools/mdio-tools.mk b/package/mdio-tools/
> mdio-tools.mk
> new file mode 100644
> index 0000000000..308a23824b
> --- /dev/null
> +++ b/package/mdio-tools/mdio-tools.mk
> @@ -0,0 +1,20 @@
>
> +################################################################################
> +#
> +# mdio-tools
> +#
>
> +################################################################################
> +
> +MDIO_TOOLS_VERSION = 1.2.0
> +MDIO_TOOLS_SITE =
> https://github.com/wkz/mdio-tools/releases/download/$(MDIO_TOOLS_VERSION)
> +MDIO_TOOLS_LICENSE = GPL-2.0
> +MDIO_TOOLS_LICENSE_FILES = COPYING
> +MDIO_TOOLS_DEPENDENCIES = host-pkgconf libmnl
> +
> +MDIO_TOOLS_MODULE_SUBDIRS = kernel
> +define MDIO_TOOLS_LINUX_CONFIG_FIXUPS
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_NET)
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_MDIO_DEVICE)
> +endef
> +
> +$(eval $(kernel-module))
> +$(eval $(autotools-package))
> --
> 2.37.3
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

--0000000000008f244205eb65830c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Oct 2, 2022 at 5:05 PM Robert=
 Marko &lt;<a href=3D"mailto:robimarko@gmail.com">robimarko@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">mdio-t=
ools are kernel module and accompanying tools for low-level<br>
debugging of devices attached on MDIO bus like PHY-s, switches etc.<br>
<br>
Userspace tools provide C22 or C45 reads and writes, benchmarking<br>
and even dedicated Marvell Link Street tools via the included<br>
kernel module.<br>
<br>
Signed-off-by: Robert Marko &lt;<a href=3D"mailto:robimarko@gmail.com" targ=
et=3D"_blank">robimarko@gmail.com</a>&gt;<br>
---<br>
Changes in v2:<br>
* Correct license<br>
* Add host-pkgconf to DEPENDENCIES<br>
* Add minimal required kernel config options<br>
---<br>
=C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0package/mdio-tools/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9 ++++=
+++++<br>
=C2=A0package/mdio-tools/mdio-tools.hash |=C2=A0 3 +++<br>
=C2=A0package/mdio-tools/<a href=3D"http://mdio-tools.mk" rel=3D"noreferrer=
" target=3D"_blank">mdio-tools.mk</a>=C2=A0 =C2=A0| 20 ++++++++++++++++++++=
<br>
=C2=A04 files changed, 33 insertions(+)<br>
=C2=A0create mode 100644 package/mdio-tools/Config.in<br>
=C2=A0create mode 100644 package/mdio-tools/mdio-tools.hash<br>
=C2=A0create mode 100644 package/mdio-tools/<a href=3D"http://mdio-tools.mk=
" rel=3D"noreferrer" target=3D"_blank">mdio-tools.mk</a><br>
<br>
diff --git a/package/Config.in b/package/Config.in<br>
index e3a34d6e97..ed41e8bdd4 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -536,6 +536,7 @@ endmenu<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/mbpfan/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/mdadm/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/mdevd/Config.in&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/mdio-tools/Config.in&quot;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/memtest86/Config.in&quot;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/memtester/Config.in&quot;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/memtool/Config.in&quot;<br=
>
diff --git a/package/mdio-tools/Config.in b/package/mdio-tools/Config.in<br=
>
new file mode 100644<br>
index 0000000000..feb1e825ac<br>
--- /dev/null<br>
+++ b/package/mdio-tools/Config.in<br>
@@ -0,0 +1,9 @@<br>
+comment &quot;mdio-tools needs a Linux kernel to be built&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_LINUX_KERNEL<br>
+<br>
+config BR2_PACKAGE_MDIO_TOOLS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;mdio-tools&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_LINUX_KERNEL<br></blockquote><di=
v>=C2=A0</div><div>depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1</div><div>=
<br></div><div>I think you miss this here<br></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0sele=
ct BR2_PACKAGE_LIBMNL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Low-level debug tools for MDIO devices<b=
r>
diff --git a/package/mdio-tools/mdio-tools.hash b/package/mdio-tools/mdio-t=
ools.hash<br>
new file mode 100644<br>
index 0000000000..0111165f27<br>
--- /dev/null<br>
+++ b/package/mdio-tools/mdio-tools.hash<br>
@@ -0,0 +1,3 @@<br>
+# Locally computed<br>
+sha256=C2=A0 c5e17431c62392f6c1da1ba4fb0a6f5918521509a377af74485851f93ff2a=
106=C2=A0 mdio-tools-1.2.0.tar.gz<br>
+sha256=C2=A0 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880=
643=C2=A0 COPYING<br>
diff --git a/package/mdio-tools/<a href=3D"http://mdio-tools.mk" rel=3D"nor=
eferrer" target=3D"_blank">mdio-tools.mk</a> b/package/mdio-tools/<a href=
=3D"http://mdio-tools.mk" rel=3D"noreferrer" target=3D"_blank">mdio-tools.m=
k</a><br>
new file mode 100644<br>
index 0000000000..308a23824b<br>
--- /dev/null<br>
+++ b/package/mdio-tools/<a href=3D"http://mdio-tools.mk" rel=3D"noreferrer=
" target=3D"_blank">mdio-tools.mk</a><br>
@@ -0,0 +1,20 @@<br>
+##########################################################################=
######<br>
+#<br>
+# mdio-tools<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+MDIO_TOOLS_VERSION =3D 1.2.0<br>
+MDIO_TOOLS_SITE =3D <a href=3D"https://github.com/wkz/mdio-tools/releases/=
download/$(MDIO_TOOLS_VERSION)" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/wkz/mdio-tools/releases/download/$(MDIO_TOOLS_VERSION)</a><br>
+MDIO_TOOLS_LICENSE =3D GPL-2.0<br>
+MDIO_TOOLS_LICENSE_FILES =3D COPYING<br>
+MDIO_TOOLS_DEPENDENCIES =3D host-pkgconf libmnl<br>
+<br>
+MDIO_TOOLS_MODULE_SUBDIRS =3D kernel<br>
+define MDIO_TOOLS_LINUX_CONFIG_FIXUPS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NET)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_MDIO_DEVICE)<b=
r>
+endef<br>
+<br>
+$(eval $(kernel-module))<br>
+$(eval $(autotools-package))<br>
-- <br>
2.37.3<br>
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

--0000000000008f244205eb65830c--

--===============4339624853792097642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4339624853792097642==--
