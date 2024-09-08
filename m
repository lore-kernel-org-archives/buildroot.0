Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28660E6FE49
	for <buildroot@archiver.kernel.org>; Sun,  8 Sep 2024 20:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 729064016D;
	Sun,  8 Sep 2024 20:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2-pPZtxbKL07; Sun,  8 Sep 2024 20:11:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 591F3401CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 591F3401CE;
	Sun,  8 Sep 2024 20:11:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E9271BF39A
 for <buildroot@lists.busybox.net>; Sun,  8 Sep 2024 20:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28EC460605
 for <buildroot@lists.busybox.net>; Sun,  8 Sep 2024 20:11:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id scAf0SG2C2V0 for <buildroot@lists.busybox.net>;
 Sun,  8 Sep 2024 20:11:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9B1F5605BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B1F5605BB
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B1F5605BB
 for <buildroot@buildroot.org>; Sun,  8 Sep 2024 20:11:14 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-e0875f1e9edso3421684276.1
 for <buildroot@buildroot.org>; Sun, 08 Sep 2024 13:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725826273; x=1726431073;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8HmkmuuhtNfG8x+9Kvptg1d5qrPUkca9DO0ZdmGU7To=;
 b=JzkEsZ9bzc0v+R3uzOGPf6CjOoJzYP/ANvt7jW46ThjR7Iy5bpyh8Ov+tTqX/gIc0F
 Feg9Qd+a9CYvSP7S6UWiLy07yfJKGw5GctHL592gxuzll6SpKdyN7ztktj9IkAxq+Wvi
 C0kwno0a9CJZgsAJ9Un4PA33MX6u+48d2kEy6aYJ4jamJpi2+id5+m095TWuzdw6qBNe
 JsywB5WQ6vre/4ML6rE0W3rCPvsHibw7cXMcCUkIlrEMU/GJTlJTnDxRsoI2BV7Kt97D
 /oSk5GsAW+wNwaYK5e+3/wS8B+rPZxB3OmXvJ/IJD5FW9sEEgTWJMpe5X50VYMK37qEi
 gyRQ==
X-Gm-Message-State: AOJu0Yy/vKlTqSEOCDDIqx1sStO6Lek61dsrw7ywrHlkGEuLo7c+dtVh
 z2GHBN/VJAatpyrhMB47yvdqUBoReYwrv7BgHzHKHePPYT3MxRazAnjyay/RG6djf6vJwkeXjiE
 pycDjNHVarNDJVQxOmApxNxEV+ANAJw==
X-Google-Smtp-Source: AGHT+IGGnXyfaz4CwxtNJpDCESgXje2ZTHdzB5SIeGi251GTaUB9LSPnEGA7oTAyb1fhLgLvRFqjSksD8CGGb8DXg2M=
X-Received: by 2002:a05:690c:2846:b0:64a:5493:e0bd with SMTP id
 00721157ae682-6db452d5f1fmr71610737b3.40.1725826272938; Sun, 08 Sep 2024
 13:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240906133931.2095292-1-roykollensvendsen@gmail.com>
In-Reply-To: <20240906133931.2095292-1-roykollensvendsen@gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Sun, 8 Sep 2024 22:11:00 +0200
Message-ID: <CA+R_deomP0Gaf0uuMcQQuoRzcoSVFz5Zh_s3u6AOtSs7cC8RUA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725826273; x=1726431073; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8HmkmuuhtNfG8x+9Kvptg1d5qrPUkca9DO0ZdmGU7To=;
 b=jDQo1xGV5k3udiqickWctSIIkvjctKUoo5jaG0vS+WArNTXGNrw2lVjwxRVN/bBB2B
 pbuRl7j5T45yhnB2PCMHOWz6XbtxIpwJ9scdKF20VXlX2jVtewJasM3t7EA09CRypTZ9
 9NkU/dguOMxpv4AXNrvAW1SW0urOmctIjgFN/cumxsuRyhxuk+iBb2Ub3ihvprLagrV9
 eZp7bMzfNTewuICVTSjjLUcRiKe0jo6X3KaFi8f4L5qVOciVG4LjWIUjE563gdO5gOrR
 fAGNGU4Ep/WBpfgvHI6QbN6zxTnXSc+HNurBQIY+ZQUpLDjP3Hr8feXodv63GTA0Pxd1
 /x/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jDQo1xGV
Subject: Re: [Buildroot] [PATCH 1/1] package/dlib: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============2579070012305107173=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2579070012305107173==
Content-Type: multipart/alternative; boundary="000000000000f153800621a13d62"

--000000000000f153800621a13d62
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

In some cases here I allow (implicitly)
selecting between system libraries and and dlib internal copy of the same
libraries. Should I enforce using the system version?

If so, should i remove the code for the internal versions of the libraries?

I have probably also added more license information than necessary. Is
BSL-1.0 enough?

What about the license files/hashes for examples, internal libraries and
tools we don't use, should I drop those?

In any case I've found some bugs related to the optional dependencies on
ffmpeg and lapack. I'm going to fix these in a v3 and add my self for this
package to the DEVELOPERS file.

Regards
Roy

fre. 6. sep. 2024, 15:39 skrev Roy Kollen Svendsen <
roykollensvendsen@gmail.com>:

> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> ---
>  package/Config.in      |  1 +
>  package/dlib/Config.in | 13 +++++++
>  package/dlib/dlib.hash | 12 ++++++
>  package/dlib/dlib.mk   | 88 ++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 114 insertions(+)
>  create mode 100644 package/dlib/Config.in
>  create mode 100644 package/dlib/dlib.hash
>  create mode 100644 package/dlib/dlib.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index f33c4780f8..2893849961 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2150,6 +2150,7 @@ menu "Other"
>         source "package/ding-libs/Config.in"
>         source "package/dotconf/Config.in"
>         source "package/double-conversion/Config.in"
> +       source "package/dlib/Config.in"
>         source "package/eigen/Config.in"
>         source "package/elfutils/Config.in"
>         source "package/ell/Config.in"
> diff --git a/package/dlib/Config.in b/package/dlib/Config.in
> new file mode 100644
> index 0000000000..3d43bdb41b
> --- /dev/null
> +++ b/package/dlib/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_DLIB
> +       bool "dlib"
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       help
> +         Dlib is a modern C++ toolkit containing machine learning
> +         algorithms and tools for creating complex software in C++ to
> +         solve real world problems.
> +
> +         http://dlib.net
> +
> +comment "dlib needs C++, threads"
> +       depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/dlib/dlib.hash b/package/dlib/dlib.hash
> new file mode 100644
> index 0000000000..3bb5a540d0
> --- /dev/null
> +++ b/package/dlib/dlib.hash
> @@ -0,0 +1,12 @@
> +sha256  22513c353ec9c153300c394050c96ca9d088e02966ac0f639e989e50318c82d6
> dlib-19.24.6.tar.gz
> +
> +# Hashes for license files:
> +sha256  50c1c5978d490c7f13062d91c4b89affc83774f87bc4568a714f748b62a5b216
> dlib/external/libjpeg/README
> +sha256  debfae299fa4118b0a586af4cf7ac8d38aae81ac4e9995c935862aaee6eb0362
> dlib/external/libpng/LICENSE
> +sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb
> dlib/external/pybind11/LICENSE
> +sha256  8d8291caf1cee26d23acf3eb67c9f9a2d58f1c681b16a4fbe8cbfb9e3c0b5a9b
> dlib/LICENSE.txt
> +sha256  908b0b565ae9bf61b7b41447cb0b83564f320375723bcc884ec30e5537a0d5dc
> dlib/test/ffmpeg_data/LICENSE.TXT
> +sha256  78515536a4b0d896745b6483fccc561987e8e2f2d014dc81d7c2e97c497a0a69
> examples/LICENSE_FOR_EXAMPLE_PROGRAMS.txt
> +sha256  a0e7b40719ba74630debe9fae1cb847ee436215451123254a690171d09fb036e
> examples/video_frames/license.txt
> +sha256  8d8291caf1cee26d23acf3eb67c9f9a2d58f1c681b16a4fbe8cbfb9e3c0b5a9b
> LICENSE.txt
> +sha256  8acb12b218fdb5e071f25eda9ac990d04888388b65095867d9007c278a9f993b
> python_examples/LICENSE_FOR_EXAMPLE_PROGRAMS.txt
> diff --git a/package/dlib/dlib.mk b/package/dlib/dlib.mk
> new file mode 100644
> index 0000000000..cc21bdae1c
> --- /dev/null
> +++ b/package/dlib/dlib.mk
> @@ -0,0 +1,88 @@
>
> +################################################################################
> +#
> +# dlib
> +#
>
> +################################################################################
> +
> +DLIB_VERSION = 19.24.6
> +DLIB_SITE = $(call github,davisking,dlib,v$(DLIB_VERSION))
> +DLIB_INSTALL_STAGING = NO
> +DLIB_CMAKE_BACKEND = ninja
> +DLIB_SUPPORTS_IN_SOURCE_BUILD = NO
> +
> +DLIB_LICENSE = \
> +       BSD-3-Clause (kissfft, pybind11) \
> +       BSL-1.0 (dlib, tools) \
> +       CC0-1.0 (examples) \
> +       libpng-2.0 (libpng) \
> +       MIT OR CC0-1.0 (JoinPaths.cmake)
> +
> +DLIB_LICENSE_FILES = \
> +       dlib/external/libjpeg/README \
> +       dlib/external/libpng/LICENSE \
> +       dlib/external/pybind11/LICENSE \
> +       dlib/LICENSE.txt \
> +       dlib/test/ffmpeg_data/LICENSE.TXT \
> +       examples/LICENSE_FOR_EXAMPLE_PROGRAMS.txt \
> +       examples/video_frames/license.txt \
> +       LICENSE.txt \
> +       python_examples/LICENSE_FOR_EXAMPLE_PROGRAMS.txt
> +
> +DLIB_CONF_OPTS = \
> +       -DDLIB_USE_CUDA=OFF \
> +       -DLIB_USE_MKL_FFT=OFF
> +
> +# ffmpeg is optional
> +ifeq ($(BR2_PACKAGE_FFMPEG),y)
> +DLIB_DEPENDENCIES += ffmpeg
> +endif
> +
> +# gif support is optional
> +ifeq ($(BR2_PACKAGE_GIFLIB),y)
> +DLIB_DEPENDENCIES += giflib
> +endif
> +
> +# jpeg support is optional
> +ifeq ($(BR2_PACKAGE_HAS_JPEG),y)
> +
> +ifeq ($(BR2_PACKAGE_JPEG_TURBO),y)
> +DLIB_DEPENDENCIES += jpeg-turbo
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBJPEG),y)
> +DLIB_DEPENDENCIES += libjpeg
> +endif
> +
> +endif
> +
> +# lapack is optional
> +ifeq ($(BR2_PACKAGE_LAPACK),y)
> +DLIB_DEPENDENCIES += lapack
> +endif
> +
> +# jxl support is optional
> +ifeq ($(BR2_PACKAGE_LIBJXL),y)
> +DLIB_DEPENDENCIES += libjxl
> +endif
> +
> +# png support is optional
> +ifeq ($(BR2_PACKAGE_LIBPNG),y)
> +DLIB_DEPENDENCIES += libpng
> +endif
> +
> +# openblas is optional
> +ifeq ($(BR2_PACKAGE_OPENBLAS),y)
> +DLIB_DEPENDENCIES += openblas
> +endif
> +
> +# webp support is optional
> +ifeq ($(BR2_PACKAGE_WEBP),y)
> +DLIB_DEPENDENCIES += webp
> +endif
> +
> +# libX11 is optional (required for GUI support)
> +ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
> +DLIB_DEPENDENCIES += xlib_libX11
> +endif
> +
> +$(eval $(cmake-package))
> --
> 2.46.0
>
>

--000000000000f153800621a13d62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Thomas,<div dir=3D"auto"><br></div><div dir=3D"auto">I=
n some cases here I allow (implicitly)</div><div dir=3D"auto">selecting bet=
ween system libraries and and dlib internal copy of the same libraries. Sho=
uld I enforce using the system version?</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">If so, should i remove the code for the internal versions o=
f the libraries?</div><div dir=3D"auto"><br></div><div dir=3D"auto">I have =
probably also added more license information than necessary. Is BSL-1.0 eno=
ugh?</div><div dir=3D"auto"><br></div><div dir=3D"auto">What about the lice=
nse files/hashes for examples, internal libraries and tools we don&#39;t us=
e, should I drop those?</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
In any case I&#39;ve found some bugs related to the optional dependencies o=
n ffmpeg and lapack. I&#39;m going to fix these in a v3 and add my self for=
 this package to the DEVELOPERS file.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Regards</div><div dir=3D"auto">Roy</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">fre. 6. sep. 2024, 1=
5:39 skrev Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@gmai=
l.com">roykollensvendsen@gmail.com</a>&gt;:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">Signed-off-by: Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollen=
svendsen@gmail.com" target=3D"_blank" rel=3D"noreferrer">roykollensvendsen@=
gmail.com</a>&gt;<br>
---<br>
=C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0package/dlib/Config.in | 13 +++++++<br>
=C2=A0package/dlib/dlib.hash | 12 ++++++<br>
=C2=A0package/dlib/<a href=3D"http://dlib.mk" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">dlib.mk</a>=C2=A0 =C2=A0| 88 +++++++++++++++++++++++++++=
+++++++++++++++<br>
=C2=A04 files changed, 114 insertions(+)<br>
=C2=A0create mode 100644 package/dlib/Config.in<br>
=C2=A0create mode 100644 package/dlib/dlib.hash<br>
=C2=A0create mode 100644 package/dlib/<a href=3D"http://dlib.mk" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">dlib.mk</a><br>
<br>
diff --git a/package/Config.in b/package/Config.in<br>
index f33c4780f8..2893849961 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -2150,6 +2150,7 @@ menu &quot;Other&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/ding-libs/Config.in&quot;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/dotconf/Config.in&quot;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/double-conversion/Config.i=
n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/dlib/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/eigen/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/elfutils/Config.in&quot;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/ell/Config.in&quot;<br>
diff --git a/package/dlib/Config.in b/package/dlib/Config.in<br>
new file mode 100644<br>
index 0000000000..3d43bdb41b<br>
--- /dev/null<br>
+++ b/package/dlib/Config.in<br>
@@ -0,0 +1,13 @@<br>
+config BR2_PACKAGE_DLIB<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;dlib&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_INSTALL_LIBSTDCPP<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Dlib is a modern C++ toolkit containing =
machine learning<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0algorithms and tools for creating comple=
x software in C++ to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0solve real world problems.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://dlib.net" rel=3D"noref=
errer noreferrer" target=3D"_blank">http://dlib.net</a><br>
+<br>
+comment &quot;dlib needs C++, threads&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLC=
HAIN_HAS_THREADS<br>
diff --git a/package/dlib/dlib.hash b/package/dlib/dlib.hash<br>
new file mode 100644<br>
index 0000000000..3bb5a540d0<br>
--- /dev/null<br>
+++ b/package/dlib/dlib.hash<br>
@@ -0,0 +1,12 @@<br>
+sha256=C2=A0 22513c353ec9c153300c394050c96ca9d088e02966ac0f639e989e50318c8=
2d6=C2=A0 dlib-19.24.6.tar.gz<br>
+<br>
+# Hashes for license files:<br>
+sha256=C2=A0 50c1c5978d490c7f13062d91c4b89affc83774f87bc4568a714f748b62a5b=
216=C2=A0 dlib/external/libjpeg/README<br>
+sha256=C2=A0 debfae299fa4118b0a586af4cf7ac8d38aae81ac4e9995c935862aaee6eb0=
362=C2=A0 dlib/external/libpng/LICENSE<br>
+sha256=C2=A0 83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675=
dcb=C2=A0 dlib/external/pybind11/LICENSE<br>
+sha256=C2=A0 8d8291caf1cee26d23acf3eb67c9f9a2d58f1c681b16a4fbe8cbfb9e3c0b5=
a9b=C2=A0 dlib/LICENSE.txt<br>
+sha256=C2=A0 908b0b565ae9bf61b7b41447cb0b83564f320375723bcc884ec30e5537a0d=
5dc=C2=A0 dlib/test/ffmpeg_data/LICENSE.TXT<br>
+sha256=C2=A0 78515536a4b0d896745b6483fccc561987e8e2f2d014dc81d7c2e97c497a0=
a69=C2=A0 examples/LICENSE_FOR_EXAMPLE_PROGRAMS.txt<br>
+sha256=C2=A0 a0e7b40719ba74630debe9fae1cb847ee436215451123254a690171d09fb0=
36e=C2=A0 examples/video_frames/license.txt<br>
+sha256=C2=A0 8d8291caf1cee26d23acf3eb67c9f9a2d58f1c681b16a4fbe8cbfb9e3c0b5=
a9b=C2=A0 LICENSE.txt<br>
+sha256=C2=A0 8acb12b218fdb5e071f25eda9ac990d04888388b65095867d9007c278a9f9=
93b=C2=A0 python_examples/LICENSE_FOR_EXAMPLE_PROGRAMS.txt<br>
diff --git a/package/dlib/<a href=3D"http://dlib.mk" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">dlib.mk</a> b/package/dlib/<a href=3D"http://dlib=
.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">dlib.mk</a><br>
new file mode 100644<br>
index 0000000000..cc21bdae1c<br>
--- /dev/null<br>
+++ b/package/dlib/<a href=3D"http://dlib.mk" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">dlib.mk</a><br>
@@ -0,0 +1,88 @@<br>
+##########################################################################=
######<br>
+#<br>
+# dlib<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+DLIB_VERSION =3D 19.24.6<br>
+DLIB_SITE =3D $(call github,davisking,dlib,v$(DLIB_VERSION))<br>
+DLIB_INSTALL_STAGING =3D NO<br>
+DLIB_CMAKE_BACKEND =3D ninja<br>
+DLIB_SUPPORTS_IN_SOURCE_BUILD =3D NO<br>
+<br>
+DLIB_LICENSE =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0BSD-3-Clause (kissfft, pybind11) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0BSL-1.0 (dlib, tools) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0CC0-1.0 (examples) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0libpng-2.0 (libpng) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MIT OR CC0-1.0 (JoinPaths.cmake)<br>
+<br>
+DLIB_LICENSE_FILES =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dlib/external/libjpeg/README \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dlib/external/libpng/LICENSE \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dlib/external/pybind11/LICENSE \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dlib/LICENSE.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dlib/test/ffmpeg_data/LICENSE.TXT \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0examples/LICENSE_FOR_EXAMPLE_PROGRAMS.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0examples/video_frames/license.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSE.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0python_examples/LICENSE_FOR_EXAMPLE_PROGRAMS.tx=
t<br>
+<br>
+DLIB_CONF_OPTS =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DDLIB_USE_CUDA=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DLIB_USE_MKL_FFT=3DOFF<br>
+<br>
+# ffmpeg is optional<br>
+ifeq ($(BR2_PACKAGE_FFMPEG),y)<br>
+DLIB_DEPENDENCIES +=3D ffmpeg<br>
+endif<br>
+<br>
+# gif support is optional<br>
+ifeq ($(BR2_PACKAGE_GIFLIB),y)<br>
+DLIB_DEPENDENCIES +=3D giflib<br>
+endif<br>
+<br>
+# jpeg support is optional<br>
+ifeq ($(BR2_PACKAGE_HAS_JPEG),y)<br>
+<br>
+ifeq ($(BR2_PACKAGE_JPEG_TURBO),y)<br>
+DLIB_DEPENDENCIES +=3D jpeg-turbo<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_LIBJPEG),y)<br>
+DLIB_DEPENDENCIES +=3D libjpeg<br>
+endif<br>
+<br>
+endif<br>
+<br>
+# lapack is optional<br>
+ifeq ($(BR2_PACKAGE_LAPACK),y)<br>
+DLIB_DEPENDENCIES +=3D lapack<br>
+endif<br>
+<br>
+# jxl support is optional<br>
+ifeq ($(BR2_PACKAGE_LIBJXL),y)<br>
+DLIB_DEPENDENCIES +=3D libjxl<br>
+endif<br>
+<br>
+# png support is optional<br>
+ifeq ($(BR2_PACKAGE_LIBPNG),y)<br>
+DLIB_DEPENDENCIES +=3D libpng<br>
+endif<br>
+<br>
+# openblas is optional<br>
+ifeq ($(BR2_PACKAGE_OPENBLAS),y)<br>
+DLIB_DEPENDENCIES +=3D openblas<br>
+endif<br>
+<br>
+# webp support is optional<br>
+ifeq ($(BR2_PACKAGE_WEBP),y)<br>
+DLIB_DEPENDENCIES +=3D webp<br>
+endif<br>
+<br>
+# libX11 is optional (required for GUI support)<br>
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)<br>
+DLIB_DEPENDENCIES +=3D xlib_libX11<br>
+endif<br>
+<br>
+$(eval $(cmake-package))<br>
-- <br>
2.46.0<br>
<br>
</blockquote></div>

--000000000000f153800621a13d62--

--===============2579070012305107173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2579070012305107173==--
