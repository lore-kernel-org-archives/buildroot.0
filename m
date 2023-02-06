Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655EAC61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 13:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE7D881063;
	Mon,  6 Feb 2023 13:35:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE7D881063
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xc8YExFIxFth; Mon,  6 Feb 2023 13:35:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC62481B36;
	Mon,  6 Feb 2023 13:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC62481B36
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE0D81BF2A7
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4CCD81063
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4CCD81063
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MsYByg-mMwGN for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 13:35:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F3C481B36
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F3C481B36
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 13:35:21 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id j21so9722608oie.4
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 05:35:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E3wwaje3u5HcMoXm3uog1Tr8I1oVR1kLFkoOnRsARyE=;
 b=WQJxZ7zu+nOHt7Yx3TsUiERpyu0c0RfVnPGEaWzUk1BCB2Ja4nRkVtPbbHNPpg/KuI
 FR22pVLlXwISdlWNgO9TdDtKWZIBrIvph5ZjGNetIeyj5hggRbsK2ahC6+cGNqqM+5CU
 Sc8TBtc469yih3dkK6482jniX0G4xPHlZL8oU9/MN19bwMKAKuU0lfwyuA3kLD7bEns+
 PHUfAe6+5XryZjR0IGyvLsO/KlB8Sxuu4Ew4bjVpMI0AO5OM5S+NyQdkJbNFawlJar0U
 ZfNcXASToAbMYW31rGQTKXLZXeHpt02xpH31IsSRQ0jGkEPCMA0Iqxf0ONzFQcLBa8SX
 xa3A==
X-Gm-Message-State: AO0yUKXHkT3jxmjVzQABIJNBZ5Xty8AiPS1wO5cFMYGp86KklvAmk1VF
 NFFRmA/8L81ZyA7OU3Y8oR/b5tVoiUWeMDF1j1Ms7A==
X-Google-Smtp-Source: AK7set+NaeWkzV03q7eLMmn+Yu/xI6kJxAo1TZckxZlp6vZFMyPtN5TNqQpBz3m+7UIaQM43Tyra0i13mG8GcaRxvNI=
X-Received: by 2002:a54:4803:0:b0:367:13d9:525e with SMTP id
 j3-20020a544803000000b0036713d9525emr1089424oij.254.1675690520192; Mon, 06
 Feb 2023 05:35:20 -0800 (PST)
MIME-Version: 1.0
References: <20230107153156.26347-1-ps.report@gmx.net>
In-Reply-To: <20230107153156.26347-1-ps.report@gmx.net>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon, 6 Feb 2023 14:34:44 +0100
Message-ID: <CA+_SqVa+RH3fzGci=8LF1teMMRNqG6fEEduGyXTWiSDiBbthRQ@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=E3wwaje3u5HcMoXm3uog1Tr8I1oVR1kLFkoOnRsARyE=;
 b=dC1GLtPi06b2Co2qNkqfqDKBuukeW2Ao7fu+K9Xj/795MN39pYMqkP4NVoHWYhgxkv
 p9Ov6ERmJmG44tvI5TJZG9vby2Rt9f+HMwFMI5jIUcHn5dZbVM/CIrQ/EQLaOXxPpWd7
 UmA+B70YQjEgiVznFty1yn1hU1NYzaS6jZL9U=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=dC1GLtPi
Subject: Re: [Buildroot] [PATCH v1] package/qt6: bump version to 6.4.2
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6913412003933553420=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6913412003933553420==
Content-Type: multipart/alternative; boundary="00000000000035c60405f4081acc"

--00000000000035c60405f4081acc
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 7, 2023 at 4:32 PM Peter Seiderer <ps.report@gmx.net> wrote:

> For details see [1] and [2].
>
> [1]
> https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.4.1/release-note.md
> [2]
> https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.4.2/release-note.md
>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>

> ---
>  package/qt6/qt6.mk                           | 2 +-
>  package/qt6/qt6base/qt6base.hash             | 4 ++--
>  package/qt6/qt6serialport/qt6serialport.hash | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
> index 575b2f826c..431bb8c9d3 100644
> --- a/package/qt6/qt6.mk
> +++ b/package/qt6/qt6.mk
> @@ -5,7 +5,7 @@
>
>  ################################################################################
>
>  QT6_VERSION_MAJOR = 6.4
> -QT6_VERSION = $(QT6_VERSION_MAJOR).0
> +QT6_VERSION = $(QT6_VERSION_MAJOR).2
>  QT6_SOURCE_TARBALL_PREFIX = everywhere-src
>  QT6_SITE =
> https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
>
> diff --git a/package/qt6/qt6base/qt6base.hash
> b/package/qt6/qt6base/qt6base.hash
> index 6544a371c6..0c722ccded 100644
> --- a/package/qt6/qt6base/qt6base.hash
> +++ b/package/qt6/qt6base/qt6base.hash
> @@ -1,5 +1,5 @@
> -# Hash from:
> https://download.qt.io/official_releases/qt/6.4/6.4.0/submodules/qtbase-everywhere-src-6.4.0.tar.xz.sha256
> -sha256
> <https://download.qt.io/official_releases/qt/6.4/6.4.0/submodules/qtbase-everywhere-src-6.4.0.tar.xz.sha256-sha256>
> cb6475a0bd8567c49f7ffbb072a05516ee6671171bed55db75b22b94ead9b37d
> qtbase-everywhere-src-6.4.0.tar.xz
> +# Hash from:
> https://download.qt.io/official_releases/qt/6.4/6.4.2/submodules/qtbase-everywhere-src-6.4.2.tar.xz.sha256
> +sha256
> <https://download.qt.io/official_releases/qt/6.4/6.4.2/submodules/qtbase-everywhere-src-6.4.2.tar.xz.sha256+sha256>
> a88bc6cedbb34878a49a622baa79cace78cfbad4f95fdbd3656ddb21c705525d
> qtbase-everywhere-src-6.4.2.tar.xz
>
>  # Hashes for license files
>  sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb
> LICENSES/Apache-2.0.txt
> diff --git a/package/qt6/qt6serialport/qt6serialport.hash
> b/package/qt6/qt6serialport/qt6serialport.hash
> index 54a45681fa..1eaa3d6150 100644
> --- a/package/qt6/qt6serialport/qt6serialport.hash
> +++ b/package/qt6/qt6serialport/qt6serialport.hash
> @@ -1,5 +1,5 @@
> -# Hash from:
> https://download.qt.io/official_releases/qt/6.4/6.4.0/submodules/qtserialport-everywhere-src-6.4.0.tar.xz.sha256
> -sha256
> <https://download.qt.io/official_releases/qt/6.4/6.4.0/submodules/qtserialport-everywhere-src-6.4.0.tar.xz.sha256-sha256>
> f148cc9e87ce2228e82bff7a64d9521339ece66c4c66aa43b91bac614f4a4483
> qtserialport-everywhere-src-6.4.0.tar.xz
> +# Hash from:
> https://download.qt.io/official_releases/qt/6.4/6.4.2/submodules/qtserialport-everywhere-src-6.4.2.tar.xz.sha256
> +sha256
> <https://download.qt.io/official_releases/qt/6.4/6.4.2/submodules/qtserialport-everywhere-src-6.4.2.tar.xz.sha256+sha256>
> 336d95919037800184b3c3de8ccb6f62954b20f3756c05adce8d5010504340fa
> qtserialport-everywhere-src-6.4.2.tar.xz
>
>  # Hashes for license files:
>  sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce
> LICENSES/BSD-3-Clause.txt
> --
> 2.39.0
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

--00000000000035c60405f4081acc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jan 7, 2023 at 4:32 PM Peter =
Seiderer &lt;<a href=3D"mailto:ps.report@gmx.net">ps.report@gmx.net</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">For deta=
ils see [1] and [2].<br>
<br>
[1] <a href=3D"https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.4.1=
/release-note.md" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/c=
git/qt/qtreleasenotes.git/about/qt/6.4.1/release-note.md</a><br>
[2] <a href=3D"https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.4.2=
/release-note.md" rel=3D"noreferrer" target=3D"_blank">https://code.qt.io/c=
git/qt/qtreleasenotes.git/about/qt/6.4.2/release-note.md</a><br>
<br>
Signed-off-by: Peter Seiderer &lt;<a href=3D"mailto:ps.report@gmx.net" targ=
et=3D"_blank">ps.report@gmx.net</a>&gt;<br></blockquote><div>Tested-by: Ang=
elo Compagnucci &lt;<a href=3D"mailto:angelo@amarulasolutions.com">angelo@a=
marulasolutions.com</a>&gt; <br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
---<br>
=C2=A0package/qt6/<a href=3D"http://qt6.mk" rel=3D"noreferrer" target=3D"_b=
lank">qt6.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0package/qt6/qt6base/qt6base.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 4 ++--<br>
=C2=A0package/qt6/qt6serialport/qt6serialport.hash | 4 ++--<br>
=C2=A03 files changed, 5 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/package/qt6/<a href=3D"http://qt6.mk" rel=3D"noreferrer" targe=
t=3D"_blank">qt6.mk</a> b/package/qt6/<a href=3D"http://qt6.mk" rel=3D"nore=
ferrer" target=3D"_blank">qt6.mk</a><br>
index 575b2f826c..431bb8c9d3 100644<br>
--- a/package/qt6/<a href=3D"http://qt6.mk" rel=3D"noreferrer" target=3D"_b=
lank">qt6.mk</a><br>
+++ b/package/qt6/<a href=3D"http://qt6.mk" rel=3D"noreferrer" target=3D"_b=
lank">qt6.mk</a><br>
@@ -5,7 +5,7 @@<br>
=C2=A0#####################################################################=
###########<br>
<br>
=C2=A0QT6_VERSION_MAJOR =3D 6.4<br>
-QT6_VERSION =3D $(QT6_VERSION_MAJOR).0<br>
+QT6_VERSION =3D $(QT6_VERSION_MAJOR).2<br>
=C2=A0QT6_SOURCE_TARBALL_PREFIX =3D everywhere-src<br>
=C2=A0QT6_SITE =3D <a href=3D"https://download.qt.io/archive/qt/$(QT6_VERSI=
ON_MAJOR)/$(QT6_VERSION)/submodules" rel=3D"noreferrer" target=3D"_blank">h=
ttps://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submod=
ules</a><br>
<br>
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base=
.hash<br>
index 6544a371c6..0c722ccded 100644<br>
--- a/package/qt6/qt6base/qt6base.hash<br>
+++ b/package/qt6/qt6base/qt6base.hash<br>
@@ -1,5 +1,5 @@<br>
-# Hash from: <a href=3D"https://download.qt.io/official_releases/qt/6.4/6.=
4.0/submodules/qtbase-everywhere-src-6.4.0.tar.xz.sha256-sha256" rel=3D"nor=
eferrer" target=3D"_blank">https://download.qt.io/official_releases/qt/6.4/=
6.4.0/submodules/qtbase-everywhere-src-6.4.0.tar.xz.sha256<br>
-sha256</a>=C2=A0 cb6475a0bd8567c49f7ffbb072a05516ee6671171bed55db75b22b94e=
ad9b37d=C2=A0 qtbase-everywhere-src-6.4.0.tar.xz<br>
+# Hash from: <a href=3D"https://download.qt.io/official_releases/qt/6.4/6.=
4.2/submodules/qtbase-everywhere-src-6.4.2.tar.xz.sha256+sha256" rel=3D"nor=
eferrer" target=3D"_blank">https://download.qt.io/official_releases/qt/6.4/=
6.4.2/submodules/qtbase-everywhere-src-6.4.2.tar.xz.sha256<br>
+sha256</a>=C2=A0 a88bc6cedbb34878a49a622baa79cace78cfbad4f95fdbd3656ddb21c=
705525d=C2=A0 qtbase-everywhere-src-6.4.2.tar.xz<br>
<br>
=C2=A0# Hashes for license files<br>
=C2=A0sha256=C2=A0 e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff=
9e1c89cb=C2=A0 LICENSES/Apache-2.0.txt<br>
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6=
serialport/qt6serialport.hash<br>
index 54a45681fa..1eaa3d6150 100644<br>
--- a/package/qt6/qt6serialport/qt6serialport.hash<br>
+++ b/package/qt6/qt6serialport/qt6serialport.hash<br>
@@ -1,5 +1,5 @@<br>
-# Hash from: <a href=3D"https://download.qt.io/official_releases/qt/6.4/6.=
4.0/submodules/qtserialport-everywhere-src-6.4.0.tar.xz.sha256-sha256" rel=
=3D"noreferrer" target=3D"_blank">https://download.qt.io/official_releases/=
qt/6.4/6.4.0/submodules/qtserialport-everywhere-src-6.4.0.tar.xz.sha256<br>
-sha256</a>=C2=A0 f148cc9e87ce2228e82bff7a64d9521339ece66c4c66aa43b91bac614=
f4a4483=C2=A0 qtserialport-everywhere-src-6.4.0.tar.xz<br>
+# Hash from: <a href=3D"https://download.qt.io/official_releases/qt/6.4/6.=
4.2/submodules/qtserialport-everywhere-src-6.4.2.tar.xz.sha256+sha256" rel=
=3D"noreferrer" target=3D"_blank">https://download.qt.io/official_releases/=
qt/6.4/6.4.2/submodules/qtserialport-everywhere-src-6.4.2.tar.xz.sha256<br>
+sha256</a>=C2=A0 336d95919037800184b3c3de8ccb6f62954b20f3756c05adce8d50105=
04340fa=C2=A0 qtserialport-everywhere-src-6.4.2.tar.xz<br>
<br>
=C2=A0# Hashes for license files:<br>
=C2=A0sha256=C2=A0 9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb4=
2ed1dcce=C2=A0 LICENSES/BSD-3-Clause.txt<br>
-- <br>
2.39.0<br>
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

--00000000000035c60405f4081acc--

--===============6913412003933553420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6913412003933553420==--
