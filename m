Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14990C0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 21:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 897EF60073;
	Sun,  6 Aug 2023 21:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 897EF60073
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ajlI-PWHqzXo; Sun,  6 Aug 2023 21:16:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57A0D60AC3;
	Sun,  6 Aug 2023 21:16:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57A0D60AC3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 617D11BF30C
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 826B940412
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 826B940412
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ycuxzOp34F7L for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 21:15:09 +0000 (UTC)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 40E64400C5
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 21:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40E64400C5
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-267f870e6ffso2091871a91.0
 for <buildroot@buildroot.org>; Sun, 06 Aug 2023 14:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691356508; x=1691961308;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZqIljCgTnBwtKw4m5fLyCCaMZIp/IeNHW7Y4cO5tjr4=;
 b=NL5nPJ+GTU/2YCr4Eh8PD204GdpmFadluiqNkEVl8DKQhXltxBxTnsfMzmeX06nEdH
 WQoFV1Vyvpxg2ckS81b2X8pTqNdoCO7k+m9Kw1csD/4fHzDEDApY2b9LexEc+NrkMDOS
 wyEM6HnCzxgfaNDijZrQ4TxX26AkRB/PCQUOAJI0KMTuyLv8Q++dYkufWOsVbYessmEf
 h9DtChAUkXD8b7Av/6aRuPVTn/n0D91s1eDN70xlvsFgxPv3zm+Gf+ysTLl2Y7VTMOsI
 bVTeQ1xIzsJkuYzaSeNkqolcd6DX/JEHEyb16eXpBde/jAkY3eTq2bFzFepUE5zufJIM
 HoiA==
X-Gm-Message-State: AOJu0Yzzqm6OfesEG42dmwFWVJn3DSK4MOcDl/zTLkXdhKwjKD5mHXnZ
 qGDmQppPyB6A+IkbMAaz/TG9k+b5jrZnmOcTGX1TRJAcB9E=
X-Google-Smtp-Source: AGHT+IHremCJa3zAAQwROM2xL+8XEezPptXYbRIJk+Gm1uSWxBxCEdfLsmHTEg99x5HbYgcT0aCvayc/XrJzQeLPZGE=
X-Received: by 2002:a17:90a:989:b0:263:e133:b9c9 with SMTP id
 9-20020a17090a098900b00263e133b9c9mr6116514pjo.34.1691356508513; Sun, 06 Aug
 2023 14:15:08 -0700 (PDT)
MIME-Version: 1.0
From: Andreas <andreasembbuild@gmail.com>
Date: Sun, 6 Aug 2023 23:14:57 +0200
Message-ID: <CAOLWrZ-hn6Ad9nLHiCtP+yW9xyigV+Ejr1KTV+xfOYbEpPvubg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691356508; x=1691961308;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ZqIljCgTnBwtKw4m5fLyCCaMZIp/IeNHW7Y4cO5tjr4=;
 b=YNOQ05HIbjpv/sZTAB9Zk7HfUdDb20OouxmsqIkFOV9aVZGuvTAGdJ3H7Y7LuNL6mX
 x0rFZQAMsWs3gkJrEG0wKsixGlDqLVLaEjd5Ta7DwPvGlXM6USQKnyJMRW369/fqpiXZ
 RGzE5k9FnxrUJwtehf/4ZoNP2/WjuoFxiQ5rBm/T4apmT9WqjreH/dzOS80DZUhFcodU
 ILf4/JvupFxz3FJSEuALDHwaMoNE/K0vqQmLo7sMu3nXohUyqmC+tZwb/9ybN9q0Yo7I
 DCYFPDCYDEvxLfWT13KM4kPbrlnYl3sLwymdj+Hlqj4VWzAK7RYh1MPk8tdODRDaYWoK
 xSqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=YNOQ05HI
Subject: [Buildroot] Support for python-simplejpeg
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
Content-Type: multipart/mixed; boundary="===============1209799809022229502=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1209799809022229502==
Content-Type: multipart/alternative; boundary="000000000000e0e8cf0602479faf"

--000000000000e0e8cf0602479faf
Content-Type: text/plain; charset="UTF-8"

Hi,

I am trying to add python-simplejpeg. During the build it has a hash
missmatch and does not manage to download the source. Manually following
the link does find the sources and I can download them. Any idea how to fix
this?

buildroot/output/build/host-python-cmake-3.27.1/setup.py:6:
DeprecationWarning: The distutils package is deprecated and slated for
removal in Python 3.12. Use setuptools or check PEP 632 for potential
alternatives
  from distutils.text_file import TextFile
[0/26] Performing download step (download, verify and extract) for
'CMakeProject-src-download'
-- verifying file...

 file='/buildroot/output/build/host-python-cmake-3.27.1/_skbuild/linux-x86_64-3.10/cmake-build/cmake-3.27.1.tar.gz'
-- SHA256 hash of

/buildroot/output/build/host-python-cmake-3.27.1/_skbuild/linux-x86_64-3.10/cmake-build/cmake-3.27.1.tar.gz
  does not match expected value
    expected:
'b1a6b0135fa11b94476e90f5b32c4c8fad480bf91cf22d0ded98ce22c5132004'
      actual:
'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
-- File already exists but hash mismatch. Removing...
-- Downloading...

 dst='/buildroot/output/build/host-python-cmake-3.27.1/_skbuild/linux-x86_64-3.10/cmake-build/cmake-3.27.1.tar.gz'
   timeout='none'
-- Using src='
https://github.com/Kitware/CMake/releases/download/v3.27.1/cmake-3.27.1.tar.gz
'
-- Retrying...
-- Using src='
https://github.com/Kitware/CMake/releases/download/v3.27.1/cmake-3.27.1.tar.gz
'
-- Retry after 5 seconds (attempt #2) ...
-- Using src='
https://github.com/Kitware/CMake/releases/download/v3.27.1/cmake-3.27.1.tar.gz
'
-- Retry after 5 seconds (attempt #3) ...
-- Using src='
https://github.com/Kitware/CMake/releases/download/v3.27.1/cmake-3.27.1.tar.gz
'
-- Retry after 15 seconds (attempt #4) ...
-- Using src='
https://github.com/Kitware/CMake/releases/download/v3.27.1/cmake-3.27.1.tar.gz
'
-- Retry after 60 seconds (attempt #5) ...

    Python: 3.10.6
    platform: Linux-5.19.0-50-generic-x86_64-with-glibc2.28
    glibc: glibc 2.28
    machine: x86_64
    bits: 64
    pip: n/a
    setuptools: 65.6.3
    scikit-build: 0.17.6



################################################################################
#
# python-simplejpeg
#
################################################################################

PYTHON_SIMPLEJPEG_VERSION = 1.6.6
PYTHON_SIMPLEJPEG_SOURCE = simplejpeg-$(PYTHON_SIMPLEJPEG_VERSION).tar.gz
PYTHON_SIMPLEJPEG_SITE =
https://files.pythonhosted.org/packages/25/50/6a4ea4f14d72d21c0fe0e3ef4c916b162fc6208f7a32c145f690c7c678b0
PYTHON_SIMPLEJPEG_SETUP_TYPE = flit
PYTHON_SIMPLEJPEG_LICENSE = MIT
PYTHON_SIMPLEJPEG_LICENSE_FILES = LICENSE lib/yasm-1.3.0/COPYING
lib/libjpeg-turbo-2.1.5.1/LICENSE.md
PYTHON_SIMPLEJPEG_DEPENDENCIES = host-python-cmake host-python-cython
host-python-setuptools host-python-numpy

$(eval $(python-package))

################################################################################
#
# python-cmake
#
################################################################################

PYTHON_CMAKE_VERSION = 3.27.1
PYTHON_CMAKE_SOURCE = cmake-$(PYTHON_CMAKE_VERSION).tar.gz
PYTHON_CMAKE_SITE =
https://files.pythonhosted.org/packages/42/6f/e7e9badcc357f3aafa7007b3515511137c58b36b782e9147fa75be0eb8b6
PYTHON_CMAKE_SETUP_TYPE = pep517
PYTHON_CMAKE_LICENSE = Apache-2.0, FIXME: please specify the exact BSD
version
PYTHON_CMAKE_DEPENDENCIES = host-python-scikit-build host-python-distro

$(eval $(host-python-package))

Andreas

--000000000000e0e8cf0602479faf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I am trying to add python-simplejpe=
g. During the build it has a hash missmatch and does not manage to download=
 the source. Manually following the link does find the sources and I can do=
wnload them. Any idea how to fix this?</div><div><br></div><div>buildroot/o=
utput/build/host-python-cmake-3.27.1/setup.py:6: DeprecationWarning: The di=
stutils package is deprecated and slated for removal in Python 3.12. Use se=
tuptools or check PEP 632 for potential alternatives<br>=C2=A0 from distuti=
ls.text_file import TextFile<br>[0/26] Performing download step (download, =
verify and extract) for &#39;CMakeProject-src-download&#39;<br>-- verifying=
 file...<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0file=3D&#39;/buildroot/output/build/=
host-python-cmake-3.27.1/_skbuild/linux-x86_64-3.10/cmake-build/cmake-3.27.=
1.tar.gz&#39;<br>-- SHA256 hash of<br>=C2=A0 =C2=A0 /buildroot/output/build=
/host-python-cmake-3.27.1/_skbuild/linux-x86_64-3.10/cmake-build/cmake-3.27=
.1.tar.gz<br>=C2=A0 does not match expected value<br>=C2=A0 =C2=A0 expected=
: &#39;b1a6b0135fa11b94476e90f5b32c4c8fad480bf91cf22d0ded98ce22c5132004&#39=
;<br>=C2=A0 =C2=A0 =C2=A0 actual: &#39;e3b0c44298fc1c149afbf4c8996fb92427ae=
41e4649b934ca495991b7852b855&#39;<br>-- File already exists but hash mismat=
ch. Removing...<br>-- Downloading...<br>=C2=A0 =C2=A0dst=3D&#39;/buildroot/=
output/build/host-python-cmake-3.27.1/_skbuild/linux-x86_64-3.10/cmake-buil=
d/cmake-3.27.1.tar.gz&#39;<br>=C2=A0 =C2=A0timeout=3D&#39;none&#39;<br>-- U=
sing src=3D&#39;<a href=3D"https://github.com/Kitware/CMake/releases/downlo=
ad/v3.27.1/cmake-3.27.1.tar.gz">https://github.com/Kitware/CMake/releases/d=
ownload/v3.27.1/cmake-3.27.1.tar.gz</a>&#39;<br>-- Retrying...<br>-- Using =
src=3D&#39;<a href=3D"https://github.com/Kitware/CMake/releases/download/v3=
.27.1/cmake-3.27.1.tar.gz">https://github.com/Kitware/CMake/releases/downlo=
ad/v3.27.1/cmake-3.27.1.tar.gz</a>&#39;<br>-- Retry after 5 seconds (attemp=
t #2) ...<br>-- Using src=3D&#39;<a href=3D"https://github.com/Kitware/CMak=
e/releases/download/v3.27.1/cmake-3.27.1.tar.gz">https://github.com/Kitware=
/CMake/releases/download/v3.27.1/cmake-3.27.1.tar.gz</a>&#39;<br>-- Retry a=
fter 5 seconds (attempt #3) ...<br>-- Using src=3D&#39;<a href=3D"https://g=
ithub.com/Kitware/CMake/releases/download/v3.27.1/cmake-3.27.1.tar.gz">http=
s://github.com/Kitware/CMake/releases/download/v3.27.1/cmake-3.27.1.tar.gz<=
/a>&#39;<br>-- Retry after 15 seconds (attempt #4) ...<br>-- Using src=3D&#=
39;<a href=3D"https://github.com/Kitware/CMake/releases/download/v3.27.1/cm=
ake-3.27.1.tar.gz">https://github.com/Kitware/CMake/releases/download/v3.27=
.1/cmake-3.27.1.tar.gz</a>&#39;<br>-- Retry after 60 seconds (attempt #5) .=
..<br></div><div><br></div><div>=C2=A0 =C2=A0 Python: 3.10.6<br>=C2=A0 =C2=
=A0 platform: Linux-5.19.0-50-generic-x86_64-with-glibc2.28<br>=C2=A0 =C2=
=A0 glibc: glibc 2.28<br>=C2=A0 =C2=A0 machine: x86_64<br>=C2=A0 =C2=A0 bit=
s: 64<br>=C2=A0 =C2=A0 pip: n/a<br>=C2=A0 =C2=A0 setuptools: 65.6.3<br>=C2=
=A0 =C2=A0 scikit-build: 0.17.6<br></div><div><br></div><div><br></div><div=
><br></div><div>###########################################################=
#####################<br>#<br># python-simplejpeg<br>#<br>#################=
###############################################################<br><br>PYTH=
ON_SIMPLEJPEG_VERSION =3D 1.6.6<br>PYTHON_SIMPLEJPEG_SOURCE =3D simplejpeg-=
$(PYTHON_SIMPLEJPEG_VERSION).tar.gz<br>PYTHON_SIMPLEJPEG_SITE =3D <a href=
=3D"https://files.pythonhosted.org/packages/25/50/6a4ea4f14d72d21c0fe0e3ef4=
c916b162fc6208f7a32c145f690c7c678b0">https://files.pythonhosted.org/package=
s/25/50/6a4ea4f14d72d21c0fe0e3ef4c916b162fc6208f7a32c145f690c7c678b0</a><br=
>PYTHON_SIMPLEJPEG_SETUP_TYPE =3D flit<br>PYTHON_SIMPLEJPEG_LICENSE =3D MIT=
<br>PYTHON_SIMPLEJPEG_LICENSE_FILES =3D LICENSE lib/yasm-1.3.0/COPYING lib/=
libjpeg-turbo-2.1.5.1/LICENSE.md<br>PYTHON_SIMPLEJPEG_DEPENDENCIES =3D host=
-python-cmake host-python-cython host-python-setuptools host-python-numpy<b=
r><br>$(eval $(python-package))</div><div><br></div><div>##################=
##############################################################<br>#<br># py=
thon-cmake<br>#<br>########################################################=
########################<br><br>PYTHON_CMAKE_VERSION =3D 3.27.1<br>PYTHON_C=
MAKE_SOURCE =3D cmake-$(PYTHON_CMAKE_VERSION).tar.gz<br>PYTHON_CMAKE_SITE =
=3D <a href=3D"https://files.pythonhosted.org/packages/42/6f/e7e9badcc357f3=
aafa7007b3515511137c58b36b782e9147fa75be0eb8b6">https://files.pythonhosted.=
org/packages/42/6f/e7e9badcc357f3aafa7007b3515511137c58b36b782e9147fa75be0e=
b8b6</a><br>PYTHON_CMAKE_SETUP_TYPE =3D pep517<br>PYTHON_CMAKE_LICENSE =3D =
Apache-2.0, FIXME: please specify the exact BSD version<br>PYTHON_CMAKE_DEP=
ENDENCIES =3D host-python-scikit-build host-python-distro<br><br>$(eval $(h=
ost-python-package))</div><div><br></div><div>Andreas<br><br></div></div>

--000000000000e0e8cf0602479faf--

--===============1209799809022229502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1209799809022229502==--
