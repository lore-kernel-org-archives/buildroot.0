Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD72C04FE2
	for <buildroot@archiver.kernel.org>; Wed, 16 Aug 2023 18:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FC3C613E2;
	Wed, 16 Aug 2023 18:30:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FC3C613E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oqdpkHacvUcZ; Wed, 16 Aug 2023 18:30:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 553FE613D5;
	Wed, 16 Aug 2023 18:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 553FE613D5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 09E821BF38A
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 18:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4846838C9
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 18:30:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4846838C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fGxgXiOn7XsY for <buildroot@lists.busybox.net>;
 Wed, 16 Aug 2023 18:30:17 +0000 (UTC)
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2C1D838AC
 for <buildroot@buildroot.org>; Wed, 16 Aug 2023 18:30:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2C1D838AC
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3a7d7de894bso4900124b6e.3
 for <buildroot@buildroot.org>; Wed, 16 Aug 2023 11:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692210616; x=1692815416;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CaCbYQgqXAYbgvBJ2z/Uo1YHjCRY2g7tZo8gQGfeUyo=;
 b=YOIzP+naCGbQKtjaIxr2rsZ23iAmUqNSlL/Lm7r5i2S2sfHJY5il4hYLf3i/6kzhzt
 Zdf0NZtvb/79BFGtraLgR8ibk4OeSI1kVHAeg4Yos318FZkTgDKGbN8oIV+p3V47fZpr
 PeZzj46I+pzqPKq0Tvp+38L9WmThJvFRkp6zKBuQZjV0VZFa8Hxnk5ch6Z2KNDdyCk1q
 ly9aGYBd5Wn6Pya6hlu+7Lb5XW9TO20kXwhVwSj13hGFNuhgaVEqsGsu6+SjhFe7IcOM
 5PzboHJ6f2S3OjsBnjqFlsnW9GnK1xK765hK+gZDdVeOY2IZadtqk2mIJoy1bE1YbBm2
 JjeA==
X-Gm-Message-State: AOJu0YwA1VpsvaNcwEGhTtSXG/HluclnGb+0CpKwtrU+HxxrADPj3/ZE
 qmVmEKToJa0L3l1pIE2H3Dd1RIM0jC1DNtc2WFlJGroJzaY=
X-Google-Smtp-Source: AGHT+IHnjEz2eY3AeHtBr13+iWoSQSNa0hOhLRN42+6GWi28uV/i95LzTRxe7dj2L3JyK4ojHtJ5FRXKp7R3IJ6XDPI=
X-Received: by 2002:a05:6808:11c3:b0:3a7:3707:242d with SMTP id
 p3-20020a05680811c300b003a73707242dmr3558142oiv.30.1692210616213; Wed, 16 Aug
 2023 11:30:16 -0700 (PDT)
MIME-Version: 1.0
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Wed, 16 Aug 2023 20:30:04 +0200
Message-ID: <CADYjeStA9j1mKJ3cCaFYg+s69qqRTfeqz0PEz0OZ77vfb3Y6Xg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692210616; x=1692815416;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=CaCbYQgqXAYbgvBJ2z/Uo1YHjCRY2g7tZo8gQGfeUyo=;
 b=aO8xps6iK3PfBrqost1ecGj6UHtMz51C95milLJ7LZzDr6nEHaLkiFM9TP4VnSDb9a
 0Buc5vKiulPFE2Dekcu+qmzjUeccn5uzy6AQKT1G9CdW367BfrR1Gz3EJdcMNrEZ250B
 7NI9wvgHHCXLbxeEMHjzQu5Dj6MX9TZ/y8zQD0uGvrBNeLrdHYQfZoO6YCkQO1dZZx5K
 oHvDKGYILW5UCGnwnVcNShth8OECHU9X97/AQJJnKacOAze0zWwpGyTnqy27cXbp3GEk
 uY58MyUiCoEnxoyVAp5rcDBWDfP0IfOQAOYg72bAyqw7fEI3so+RW1dMTTHq7DG1te9R
 eryw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=aO8xps6i
Subject: [Buildroot] ModuleNotFoundError: No module named 'cppy' | Error
 while building python-kiwisolver
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
Content-Type: multipart/mixed; boundary="===============8458508172237378749=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8458508172237378749==
Content-Type: multipart/alternative; boundary="000000000000aa247f06030e7c2d"

--000000000000aa247f06030e7c2d
Content-Type: text/plain; charset="UTF-8"

Hello All,

After adding python-kiwisolver package in the menuconfig and trying to do
make results in

python-kiwisolver 1.4.4 Building
2023-08-16T18:24:50 (cd /home/test/build/python-kiwisolver-1.4.4//;
_PYTHON_HOST_PLATFORM="linux-aarch64"
_PYTHON_PROJECT_BASE="/home/test/build/python3-3.10.4"
_PYTHON_SYSCONFIGDATA_NAME="`{ [ -e
/home/test/per-package/python-kiwisolver/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/python3.10//_sysconfigdata__linux_*.py
] && basename
/home/test/per-package/python-kiwisolver/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/python3.10//_sysconfigdata__linux_*.py
.py; } || true`"
PATH="/home/test/per-package/python-kiwisolver/host/bin:/home/test/per-package/python-kiwisolver/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
PATH="/home/test/per-package/python-kiwisolver/host/bin:/home/test/per-package/python-kiwisolver/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
AR="/home/test/per-package/python-kiwisolver/host/bin/aarch64-linux-gcc-ar"
AS="/home/test/per-package/python-kiwisolver/host/bin/aarch64-linux-as"
LD="/home/test/per-package/python-kiwisolver/host/bin/aarch64-linux-ld"
NM="/home/test/per-package/python-kiwisolver/host/bin/aarch64-linux-gcc-nm"
CC="/home/test/per-package/python-kiwisolver/host/bin/aarch64-linux-gcc"
GCC="/home/test/per-package/python-kiwisolver/host/bin/aarch64-linux-gcc"
CPP="/home/test/per-package/python-kiwisolver/host/bin/aarch64-linux-cpp"
CXX="/home/test/per-package/python-kiwisolver/host/bin/aarch64-linux-g++"
FC="/home/test/per-package/python-kiwisolver/host/bin/aarch64-linux-gfortran"
F77="/home/test/per-package/python-kiwisolver/host/bin/aarch64-linux-gfortran"
RANLIB="/home/test/per-package/python-kiwisolver/host/bin/aarch64-linux-gcc-ranlib"
READELF="/home/test/per-package/python-kiwisolver/host/bin/aarch64-linux-readelf"
STRIP="/home/test/per-package/python-kiwisolver/host/bin/aarch64-linux-strip"
OBJCOPY="/home/test/per-package/python-kiwisolver/host/bin/aarch64-linux-objcopy"
OBJDUMP="/home/test/per-package/python-kiwisolver/host/bin/aarch64-linux-objdump"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/home/test/per-package/python-kiwisolver/host/bin/ccache
/usr/bin/gcc"
GCC_FOR_BUILD="/home/test/per-package/python-kiwisolver/host/bin/ccache
/usr/bin/gcc"
CXX_FOR_BUILD="/home/test/per-package/python-kiwisolver/host/bin/ccache
/usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld"
CPPFLAGS_FOR_BUILD="-I/home/test/per-package/python-kiwisolver/host/include"
CFLAGS_FOR_BUILD="-O2
-I/home/test/per-package/python-kiwisolver/host/include"
CXXFLAGS_FOR_BUILD="-O2
-I/home/test/per-package/python-kiwisolver/host/include"
LDFLAGS_FOR_BUILD="-L/home/test/per-package/python-kiwisolver/host/lib
-Wl,-rpath,/home/test/per-package/python-kiwisolver/host/lib"
FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/home/test/per-package/python-kiwisolver/host/bin/aarch64-linux-as"
DEFAULT_LINKER="/home/test/per-package/python-kiwisolver/host/bin/aarch64-linux-ld"
CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 -O3 -g0 -D_FORTIFY_SOURCE=2" CXXFLAGS="-D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g0 -D_FORTIFY_SOURCE=2"
LDFLAGS="" FCFLAGS=" -O3 -g0" FFLAGS=" -O3 -g0"
PKG_CONFIG="/home/test/per-package/python-kiwisolver/host/bin/pkg-config"
STAGING_DIR="/home/test/per-package/python-kiwisolver/host/aarch64-buildroot-linux-gnu/sysroot"
INTLTOOL_PERL=/usr/bin/perl
PYTHONPATH="/home/test/per-package/python-kiwisolver/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/python3.10/"
PYTHONNOUSERSITE=1 SETUPTOOLS_USE_DISTUTILS=stdlib
_python_sysroot=/home/test/per-package/python-kiwisolver/host/aarch64-buildroot-linux-gnu/sysroot
_python_prefix=/usr _python_exec_prefix=/usr
 /home/test/per-package/python-kiwisolver/host/bin/python setup.py build  )
2023-08-16T18:24:50 Traceback (most recent call last):
2023-08-16T18:24:50 File
"/home/test/build/python-kiwisolver-1.4.4/setup.py", line 13, in <module>
2023-08-16T18:24:50 from cppy import CppyBuildExt
2023-08-16T18:24:50 ModuleNotFoundError: No module named 'cppy'
2023-08-16T18:24:50
2023-08-16T18:24:50 The above exception was the direct cause of the
following exception:
2023-08-16T18:24:50
2023-08-16T18:24:50 Traceback (most recent call last):
2023-08-16T18:24:50 File
"/home/test/build/python-kiwisolver-1.4.4/setup.py", line 15, in <module>
2023-08-16T18:24:50 raise RuntimeError(
2023-08-16T18:24:50 RuntimeError: Missing setup required dependencies:
cppy. Installing through pip as recommended ensure one never hits this
issue.
2023-08-16T18:24:50 make[2]: *** [package/pkg-generic.mk:293:
/home/test/build/python-kiwisolver-1.4.4/.stamp_built] Error 1
2023-08-16T18:24:50 make[1]: *** [Makefile:23: _all] Error 2

python-cppy package exists in buildroot/package
Also tried to install on host using pip install cppy

Can anyone please let me know how to resolve it?

Thanks in advance
Sourabh

--000000000000aa247f06030e7c2d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello All,<br><div><br></div><div>After adding python-kiwi=
solver package in the menuconfig and trying to do make results in<br><br></=
div><div>python-kiwisolver 1.4.4 Building<br>2023-08-16T18:24:50 (cd /home/=
test/build/python-kiwisolver-1.4.4//; _PYTHON_HOST_PLATFORM=3D&quot;linux-a=
arch64&quot; _PYTHON_PROJECT_BASE=3D&quot;/home/test/build/python3-3.10.4&q=
uot; _PYTHON_SYSCONFIGDATA_NAME=3D&quot;`{ [ -e /home/test/per-package/pyth=
on-kiwisolver/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/python3.10//=
_sysconfigdata__linux_*.py ] &amp;&amp; basename /home/test/per-package/pyt=
hon-kiwisolver/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/python3.10/=
/_sysconfigdata__linux_*.py .py; } || true`&quot; PATH=3D&quot;/home/test/p=
er-package/python-kiwisolver/host/bin:/home/test/per-package/python-kiwisol=
ver/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin&=
quot; PATH=3D&quot;/home/test/per-package/python-kiwisolver/host/bin:/home/=
test/per-package/python-kiwisolver/host/sbin:/usr/local/sbin:/usr/local/bin=
:/usr/sbin:/usr/bin:/sbin:/bin&quot; AR=3D&quot;/home/test/per-package/pyth=
on-kiwisolver/host/bin/aarch64-linux-gcc-ar&quot; AS=3D&quot;/home/test/per=
-package/python-kiwisolver/host/bin/aarch64-linux-as&quot; LD=3D&quot;/home=
/test/per-package/python-kiwisolver/host/bin/aarch64-linux-ld&quot; NM=3D&q=
uot;/home/test/per-package/python-kiwisolver/host/bin/aarch64-linux-gcc-nm&=
quot; CC=3D&quot;/home/test/per-package/python-kiwisolver/host/bin/aarch64-=
linux-gcc&quot; GCC=3D&quot;/home/test/per-package/python-kiwisolver/host/b=
in/aarch64-linux-gcc&quot; CPP=3D&quot;/home/test/per-package/python-kiwiso=
lver/host/bin/aarch64-linux-cpp&quot; CXX=3D&quot;/home/test/per-package/py=
thon-kiwisolver/host/bin/aarch64-linux-g++&quot; FC=3D&quot;/home/test/per-=
package/python-kiwisolver/host/bin/aarch64-linux-gfortran&quot; F77=3D&quot=
;/home/test/per-package/python-kiwisolver/host/bin/aarch64-linux-gfortran&q=
uot; RANLIB=3D&quot;/home/test/per-package/python-kiwisolver/host/bin/aarch=
64-linux-gcc-ranlib&quot; READELF=3D&quot;/home/test/per-package/python-kiw=
isolver/host/bin/aarch64-linux-readelf&quot; STRIP=3D&quot;/home/test/per-p=
ackage/python-kiwisolver/host/bin/aarch64-linux-strip&quot; OBJCOPY=3D&quot=
;/home/test/per-package/python-kiwisolver/host/bin/aarch64-linux-objcopy&qu=
ot; OBJDUMP=3D&quot;/home/test/per-package/python-kiwisolver/host/bin/aarch=
64-linux-objdump&quot; AR_FOR_BUILD=3D&quot;/usr/bin/ar&quot; AS_FOR_BUILD=
=3D&quot;/usr/bin/as&quot; CC_FOR_BUILD=3D&quot;/home/test/per-package/pyth=
on-kiwisolver/host/bin/ccache /usr/bin/gcc&quot; GCC_FOR_BUILD=3D&quot;/hom=
e/test/per-package/python-kiwisolver/host/bin/ccache /usr/bin/gcc&quot; CXX=
_FOR_BUILD=3D&quot;/home/test/per-package/python-kiwisolver/host/bin/ccache=
 /usr/bin/g++&quot; LD_FOR_BUILD=3D&quot;/usr/bin/ld&quot; CPPFLAGS_FOR_BUI=
LD=3D&quot;-I/home/test/per-package/python-kiwisolver/host/include&quot; CF=
LAGS_FOR_BUILD=3D&quot;-O2 -I/home/test/per-package/python-kiwisolver/host/=
include&quot; CXXFLAGS_FOR_BUILD=3D&quot;-O2 -I/home/test/per-package/pytho=
n-kiwisolver/host/include&quot; LDFLAGS_FOR_BUILD=3D&quot;-L/home/test/per-=
package/python-kiwisolver/host/lib -Wl,-rpath,/home/test/per-package/python=
-kiwisolver/host/lib&quot; FCFLAGS_FOR_BUILD=3D&quot;&quot; DEFAULT_ASSEMBL=
ER=3D&quot;/home/test/per-package/python-kiwisolver/host/bin/aarch64-linux-=
as&quot; DEFAULT_LINKER=3D&quot;/home/test/per-package/python-kiwisolver/ho=
st/bin/aarch64-linux-ld&quot; CPPFLAGS=3D&quot;-D_LARGEFILE_SOURCE -D_LARGE=
FILE64_SOURCE -D_FILE_OFFSET_BITS=3D64&quot; CFLAGS=3D&quot;-D_LARGEFILE_SO=
URCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 =C2=A0-O3 -g0 -D_FORTIF=
Y_SOURCE=3D2&quot; CXXFLAGS=3D&quot;-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOUR=
CE -D_FILE_OFFSET_BITS=3D64 =C2=A0-O3 -g0 -D_FORTIFY_SOURCE=3D2&quot; LDFLA=
GS=3D&quot;&quot; FCFLAGS=3D&quot; -O3 -g0&quot; FFLAGS=3D&quot; -O3 -g0&qu=
ot; PKG_CONFIG=3D&quot;/home/test/per-package/python-kiwisolver/host/bin/pk=
g-config&quot; STAGING_DIR=3D&quot;/home/test/per-package/python-kiwisolver=
/host/aarch64-buildroot-linux-gnu/sysroot&quot; INTLTOOL_PERL=3D/usr/bin/pe=
rl PYTHONPATH=3D&quot;/home/test/per-package/python-kiwisolver/host/aarch64=
-buildroot-linux-gnu/sysroot/usr/lib/python3.10/&quot; PYTHONNOUSERSITE=3D1=
 SETUPTOOLS_USE_DISTUTILS=3Dstdlib _python_sysroot=3D/home/test/per-package=
/python-kiwisolver/host/aarch64-buildroot-linux-gnu/sysroot _python_prefix=
=3D/usr _python_exec_prefix=3D/usr =C2=A0/home/test/per-package/python-kiwi=
solver/host/bin/python setup.py build =C2=A0)<br>2023-08-16T18:24:50 Traceb=
ack (most recent call last):<br>2023-08-16T18:24:50 File &quot;/home/test/b=
uild/python-kiwisolver-1.4.4/setup.py&quot;, line 13, in &lt;module&gt;<br>=
2023-08-16T18:24:50 from cppy import CppyBuildExt<br>2023-08-16T18:24:50 Mo=
duleNotFoundError: No module named &#39;cppy&#39;<br>2023-08-16T18:24:50<br=
>2023-08-16T18:24:50 The above exception was the direct cause of the follow=
ing exception:<br>2023-08-16T18:24:50<br>2023-08-16T18:24:50 Traceback (mos=
t recent call last):<br>2023-08-16T18:24:50 File &quot;/home/test/build/pyt=
hon-kiwisolver-1.4.4/setup.py&quot;, line 15, in &lt;module&gt;<br>2023-08-=
16T18:24:50 raise RuntimeError(<br>2023-08-16T18:24:50 RuntimeError: Missin=
g setup required dependencies: cppy. Installing through pip as recommended =
ensure one never hits this issue.<br>2023-08-16T18:24:50 make[2]: *** [pack=
age/<a href=3D"http://pkg-generic.mk:293">pkg-generic.mk:293</a>: /home/tes=
t/build/python-kiwisolver-1.4.4/.stamp_built] Error 1<br>2023-08-16T18:24:5=
0 make[1]: *** [Makefile:23: _all] Error 2<br></div><div><br></div><div>pyt=
hon-cppy=C2=A0package exists in buildroot/package</div><div>Also tried to i=
nstall on host using pip install cppy</div><div><br></div><div>Can anyone p=
lease let me know how to resolve it?</div><div><br></div><div>Thanks in adv=
ance</div><div>Sourabh</div></div>

--000000000000aa247f06030e7c2d--

--===============8458508172237378749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8458508172237378749==--
