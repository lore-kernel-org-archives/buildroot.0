Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543C0C4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 16:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D780441736;
	Wed, 19 Oct 2022 16:17:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D780441736
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IeEyQHpsWNDT; Wed, 19 Oct 2022 16:17:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A2CF401FF;
	Wed, 19 Oct 2022 16:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A2CF401FF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A29D1BF283
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 16:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9423840BE
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 16:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9423840BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sk5w-A30slaU for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 16:17:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79A9D84045
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79A9D84045
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 16:17:09 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 r8-20020a056830120800b00661a0a236efso9784399otp.4
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 09:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oglD/eECueuPCI9GNXzwyqb/js6vSLFtov4X9viWoOE=;
 b=imhRPqlL+ma5JsLG1W2pHWkVE2t3KazvQEiuFVMUYvaSojJBRMx5Oy1UtFoQTxyNL1
 KHqL4AomdiRj2Jo/WUxKVkeAV76axn/s9RhP3ICOJc2nUIgCZV2sLEApfywzL/NJB7kc
 /TfckG8XZCQUSCwXeoABIBh3FkxACX7whKdBU5kWRHdpPzgxA/AnvTMRB7mMKdO+RR6n
 G3MEHtnuDnSY2G0OevrevPX56bWB1L/Qr4c4xU6hmUSKyLozUCc6G8UEY3Agp1WfgCwN
 t1rlHuTmgDaS9gCe8NnOAcZmCJBCoNRk2Em2o1dB6WE++Csl5PV34dFDVDeEn/Y1JRPH
 28Vw==
X-Gm-Message-State: ACrzQf1D6AUDFGl4UYTXWy3EX8xWfT5rAv+PWfSgua5O1A+LHxtzIsYT
 Ep5Dp8C25qVkpzX306FkysBRbr7+/AJAVDmhNviKkydQ25lcSQ==
X-Google-Smtp-Source: AMsMyM4CewxUNb/sKm2vL45ArlGbu8vphXCgymzvWG77H5H5cK83/lEZhMycxdL6tRY+G0pjhWd7bYxjB7n0bwlq29E=
X-Received: by 2002:a9d:7d04:0:b0:661:b65c:63c8 with SMTP id
 v4-20020a9d7d04000000b00661b65c63c8mr4417381otn.384.1666196228350; Wed, 19
 Oct 2022 09:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <20221018234617.225947-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20221018234617.225947-1-giulio.benetti@benettiengineering.com>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed, 19 Oct 2022 18:16:31 +0200
Message-ID: <CA+_SqVa20CoBfekqEMskKzn_u5Ln6Mu-yws_4eCMg+7jDK1JoQ@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oglD/eECueuPCI9GNXzwyqb/js6vSLFtov4X9viWoOE=;
 b=Kw6oBHfpl7AsMx5okxyOApuGOK7nh6NtY9ivfv9YgUZ6NDRK1FuOS27Gf4/ummNNtw
 aQ/Ze5Tw5vgJ4RzagaEutBBydo8bPbsDakdLKxJbgzo/ElFT04ogHFMe0P5XG75WmTz+
 1vJAXyygB7ApUD7MFnD6amXnwy19inM7a9RPY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Kw6oBHfp
Subject: Re: [Buildroot] [PATCH] package/mono: allow to select which folders
 to install to target
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6129866700843511397=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6129866700843511397==
Content-Type: multipart/alternative; boundary="000000000000513e8805eb658a8f"

--000000000000513e8805eb658a8f
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 19, 2022 at 1:46 AM Giulio Benetti <
giulio.benetti@benettiengineering.com> wrote:

> At the moment all APIs folders are copied to target increasing the size of
> rootfs of ~190MB. Allow to select which API folders we want to copy to
> target to shrink rootfs down.
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>
Reviewed-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>

> ---
>

Looks good to me, even if I'm not sure how much this will be used. Mono is
usually run on beefy hardware where you have plenty of space. It's a nice
addition anyway.

 package/mono/Config.in | 16 ++++++++++++++++
>  package/mono/mono.mk   | 12 ++++++++++++
>  2 files changed, 28 insertions(+)
>
> diff --git a/package/mono/Config.in b/package/mono/Config.in
> index 76178bcf9b..8690ee68ef 100644
> --- a/package/mono/Config.in
> +++ b/package/mono/Config.in
> @@ -23,6 +23,22 @@ config BR2_PACKAGE_MONO
>
>           http://download.mono-project.com/sources/mono/
>
> +config BR2_PACKAGE_MONO_SPECIFY_FOLDERS_TO_INSTALL
> +       bool "Specify folders to install to target"
> +       help
> +         Allow to specify which Mono folder to install to target
> +
> +if BR2_PACKAGE_MONO_SPECIFY_FOLDERS_TO_INSTALL
> +
> +config BR2_PACKAGE_MONO_FOLDERS_TO_INSTALL
> +       string "Mono folders to install to target"
> +       help
> +         Paths to Mono folders to install to target /usr/lib/mono/.
> +         Only these folders will be copied to the target and not all
> +         the built ones. You can provide a list of folders separated by
> +         by spaces.
> +
> +endif
>  comment "mono needs a toolchain w/ C++, NPTL, dynamic library"
>         depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
>         depends on !BR2_INSTALL_LIBSTDCPP || \
> diff --git a/package/mono/mono.mk b/package/mono/mono.mk
> index 219effc5d3..8036d23205 100644
> --- a/package/mono/mono.mk
> +++ b/package/mono/mono.mk
> @@ -30,10 +30,22 @@ MONO_CONF_OPTS = $(MONO_COMMON_CONF_OPTS)
> --disable-mcs-build
>
>  # The libraries have been built by the host-mono build. Since they are
>  # architecture-independent, we simply copy them to the target.
> +ifeq ($(BR2_PACKAGE_MONO_SPECIFY_FOLDERS_TO_INSTALL),y)
> +# Copy only selected folders
> +define MONO_INSTALL_LIBS
> +       mkdir -p $(TARGET_DIR)/usr/lib/mono
> +       (for dir in $(call qstrip,$(BR2_PACKAGE_MONO_FOLDERS_TO_INSTALL));
> do \
> +               rsync -av --exclude=*.so --exclude=*.mdb \
> +               $(HOST_DIR)/lib/mono/$${dir} $(TARGET_DIR)/usr/lib/mono; \
> +       done)
> +endef
> +else
> +# Copy all folders
>  define MONO_INSTALL_LIBS
>         rsync -av --exclude=*.so --exclude=*.mdb \
>                 $(HOST_DIR)/lib/mono $(TARGET_DIR)/usr/lib/
>  endef
> +endif
>
>  MONO_POST_INSTALL_TARGET_HOOKS += MONO_INSTALL_LIBS
>
> --
> 2.34.1
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

--000000000000513e8805eb658a8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 19, 2022 at 1:46 AM Giuli=
o Benetti &lt;<a href=3D"mailto:giulio.benetti@benettiengineering.com">giul=
io.benetti@benettiengineering.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">At the moment all APIs folders are copied =
to target increasing the size of<br>
rootfs of ~190MB. Allow to select which API folders we want to copy to<br>
target to shrink rootfs down.<br>
<br>
Signed-off-by: Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettie=
ngineering.com" target=3D"_blank">giulio.benetti@benettiengineering.com</a>=
&gt;<br></blockquote><div>Reviewed-by: Angelo Compagnucci &lt;<a href=3D"ma=
ilto:angelo@amarulasolutions.com">angelo@amarulasolutions.com</a>&gt;<br>Te=
sted-by: Angelo Compagnucci &lt;<a href=3D"mailto:angelo@amarulasolutions.c=
om">angelo@amarulasolutions.com</a>&gt; <br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
---<br></blockquote><div><br></div><div>Looks good to me, even if I&#39;m n=
ot sure how much this will be used. Mono is usually run on beefy hardware w=
here you have plenty of space. It&#39;s a nice addition anyway. <br></div><=
div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0package/mono/Config.in | 16 ++++++++++++++++<br>
=C2=A0package/mono/<a href=3D"http://mono.mk" rel=3D"noreferrer" target=3D"=
_blank">mono.mk</a>=C2=A0 =C2=A0| 12 ++++++++++++<br>
=C2=A02 files changed, 28 insertions(+)<br>
<br>
diff --git a/package/mono/Config.in b/package/mono/Config.in<br>
index 76178bcf9b..8690ee68ef 100644<br>
--- a/package/mono/Config.in<br>
+++ b/package/mono/Config.in<br>
@@ -23,6 +23,22 @@ config BR2_PACKAGE_MONO<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://download.mono-project.=
com/sources/mono/" rel=3D"noreferrer" target=3D"_blank">http://download.mon=
o-project.com/sources/mono/</a><br>
<br>
+config BR2_PACKAGE_MONO_SPECIFY_FOLDERS_TO_INSTALL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Specify folders to install to target=
&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Allow to specify which Mono folder to in=
stall to target<br>
+<br>
+if BR2_PACKAGE_MONO_SPECIFY_FOLDERS_TO_INSTALL<br>
+<br>
+config BR2_PACKAGE_MONO_FOLDERS_TO_INSTALL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0string &quot;Mono folders to install to target&=
quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Paths to Mono folders to install to targ=
et /usr/lib/mono/.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Only these folders will be copied to the=
 target and not all<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the built ones. You can provide a list o=
f folders separated by<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0by spaces.<br>
+<br>
+endif<br>
=C2=A0comment &quot;mono needs a toolchain w/ C++, NPTL, dynamic library&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on !BR2_INSTALL_LIBSTDCPP || \<br>
diff --git a/package/mono/<a href=3D"http://mono.mk" rel=3D"noreferrer" tar=
get=3D"_blank">mono.mk</a> b/package/mono/<a href=3D"http://mono.mk" rel=3D=
"noreferrer" target=3D"_blank">mono.mk</a><br>
index 219effc5d3..8036d23205 100644<br>
--- a/package/mono/<a href=3D"http://mono.mk" rel=3D"noreferrer" target=3D"=
_blank">mono.mk</a><br>
+++ b/package/mono/<a href=3D"http://mono.mk" rel=3D"noreferrer" target=3D"=
_blank">mono.mk</a><br>
@@ -30,10 +30,22 @@ MONO_CONF_OPTS =3D $(MONO_COMMON_CONF_OPTS) --disable-m=
cs-build<br>
<br>
=C2=A0# The libraries have been built by the host-mono build. Since they ar=
e<br>
=C2=A0# architecture-independent, we simply copy them to the target.<br>
+ifeq ($(BR2_PACKAGE_MONO_SPECIFY_FOLDERS_TO_INSTALL),y)<br>
+# Copy only selected folders<br>
+define MONO_INSTALL_LIBS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p $(TARGET_DIR)/usr/lib/mono<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(for dir in $(call qstrip,$(BR2_PACKAGE_MONO_FO=
LDERS_TO_INSTALL)); do \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rsync -av --exclude=
=3D*.so --exclude=3D*.mdb \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(HOST_DIR)/lib/mon=
o/$${dir} $(TARGET_DIR)/usr/lib/mono; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done)<br>
+endef<br>
+else<br>
+# Copy all folders<br>
=C2=A0define MONO_INSTALL_LIBS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rsync -av --exclude=3D*.so --exclude=3D*.mdb \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(HOST_DIR)/lib/mon=
o $(TARGET_DIR)/usr/lib/<br>
=C2=A0endef<br>
+endif<br>
<br>
=C2=A0MONO_POST_INSTALL_TARGET_HOOKS +=3D MONO_INSTALL_LIBS<br>
<br>
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

--000000000000513e8805eb658a8f--

--===============6129866700843511397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6129866700843511397==--
