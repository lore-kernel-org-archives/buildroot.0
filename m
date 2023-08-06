Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A18C001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 21:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9E5D60008;
	Sun,  6 Aug 2023 21:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9E5D60008
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VXBfy1plgfCw; Sun,  6 Aug 2023 21:37:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3E8560769;
	Sun,  6 Aug 2023 21:37:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3E8560769
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F5161BF909
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 514C180C35
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 514C180C35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 91FU9aewKGQb for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 21:36:46 +0000 (UTC)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51FC081854
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 21:36:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51FC081854
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-26837895fbbso2741910a91.3
 for <buildroot@buildroot.org>; Sun, 06 Aug 2023 14:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691357806; x=1691962606;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+maw012WV5WRF9STW/UFwbnT6l8OV7D/cqDJUPInCug=;
 b=BpCXdyDkAyNA7uWXRH70AjNHx61Yo5u/1CrOjNpCLRNMNK2pnzTJx89LvRbzUj7iE+
 4+p+B1Y+bWXUv2DCje5dleHTar2WJOZTkwCMsVrgKmthN4kSC25hNpp2z1729hmOghrO
 hW/Gx7l/ksztVSdgVYmQJWOZsdTPUBlMF5YESuwtHBdvVf7FFN1+kxA601u6aDAz5sM7
 be1v/iRW9OQy2DynK70KzZ1QfU8uyQgzDp/hpycby4KoP1LMo6M0wv3NP/rBG4nkZi+p
 h6D+G9vr+WOx4R2QS1/5FYmJ56tMfkPHBG+GvY+sQJwcMQPRyY63ezoH9mhOrOk002z8
 uxKw==
X-Gm-Message-State: AOJu0YxyRFHU8BlZcqfqtt+LUhehNxNdxwlAKWlScMEge8aCpvtZcYSM
 V41HG6HaBUYkHsOLibFA6eQdF14XvaljGMsUs23p23E0hXM=
X-Google-Smtp-Source: AGHT+IE0jZ61JueDfB1BsCwktPMcHAEMZW5ZbtdWqoRYw0OE+Xanqcn/xrdFaDbavMjLKhmTx6lsw1VtgZeRNCQ25t0=
X-Received: by 2002:a17:90b:3b8a:b0:268:576d:a831 with SMTP id
 pc10-20020a17090b3b8a00b00268576da831mr7600119pjb.45.1691357805548; Sun, 06
 Aug 2023 14:36:45 -0700 (PDT)
MIME-Version: 1.0
From: Andreas <andreasembbuild@gmail.com>
Date: Sun, 6 Aug 2023 23:36:34 +0200
Message-ID: <CAOLWrZ8O-mF6RnuX80SmS7Mn5Op=o0OJMp6-wbhjUfRBiqfnXg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691357806; x=1691962606;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+maw012WV5WRF9STW/UFwbnT6l8OV7D/cqDJUPInCug=;
 b=YMddKN23RTl3Jok2lsmb4UdF0m9yxDNJpcgVMwvrez6AtJAdfVkNmseFnfwpJGpk47
 P2WV9WtaZMBXQ3aTUq7kyZTvGyefGngGJsQ7hG+Ta6kT/GmprVN5Z16U/hVgjm+Zh6nT
 xqOI824FcTp7wMk3wg63jxAHLGVeSJk2952mYs7AjzGt7pdhjAsIQ/G+g6af054g+cAp
 0eFN5Wbov11zMUqHGt13MhpVjHLgo5ftS/rSHXNxpyufUQNgKb5YPGicbjIxRo++SXv/
 stT93nDZC6s4gUYbFqbUOWCVyx23jTaUHpmyklGlOBxFo70weUWnBYgPJZwdWfaSV/cJ
 /Nlg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=YMddKN23
Subject: [Buildroot] Support for lapack
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
Content-Type: multipart/mixed; boundary="===============5106991459643358749=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5106991459643358749==
Content-Type: multipart/alternative; boundary="000000000000301b18060247edca"

--000000000000301b18060247edca
Content-Type: text/plain; charset="UTF-8"

Hi,

How do I configure Fortran properly for lapack? I need it on host for the
python-scikit-learn package. I get the following error.

-- The Fortran compiler identification is unknown
-- The C compiler identification is GNU 8.3.0
CMake Error at CMakeLists.txt:3 (project):
  No CMAKE_Fortran_COMPILER could be found.

  Tell CMake where to find the compiler by setting either the environment
  variable "FC" or the CMake cache entry CMAKE_Fortran_COMPILER to the full
  path to the compiler, or to the compiler name if it is in the PATH.


-- Check for working C compiler: /usr/bin/gcc
-- Check for working C compiler: /usr/bin/gcc -- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
-- Configuring incomplete, errors occurred!
See also
"/buildroot/output/build/host-lapack-3.10.1/buildroot-build/CMakeFiles/CMakeOutput.log".
See also
"/buildroot/output/build/host-lapack-3.10.1/buildroot-build/CMakeFiles/CMakeError.log".

################################################################################
#
# python-scikit-learn
#
################################################################################

PYTHON_SCIKIT_LEARN_VERSION = 1.3.0
PYTHON_SCIKIT_LEARN_SOURCE =
scikit-learn-$(PYTHON_SCIKIT_LEARN_VERSION).tar.gz
PYTHON_SCIKIT_LEARN_SITE =
https://files.pythonhosted.org/packages/72/cd/4761675df1b3dd93072c89697278f3ed3dc004a60c034cd2603c43ff64b5
PYTHON_SCIKIT_LEARN_SETUP_TYPE = setuptools
PYTHON_SCIKIT_LEARN_LICENSE = BSD-3-Clause
PYTHON_SCIKIT_LEARN_LICENSE_FILES = COPYING
PYTHON_SCIKIT_LEARN_DEPENDENCIES = \
host-python-cython \
host-python-scipy \
python-joblib \
python-threadpoolctl

# disable test execution when cross compiling
PYTHON_SCIKIT_LEARN_ENV = PYTHON_CROSSENV=1

$(eval $(python-package))

################################################################################
#
# lapack
#
################################################################################

LAPACK_VERSION = 3.10.1
LAPACK_LICENSE = BSD-3-Clause
LAPACK_LICENSE_FILES = LICENSE
LAPACK_SITE = $(call github,Reference-LAPACK,lapack,v$(LAPACK_VERSION))
LAPACK_CPE_ID_VENDOR = lapack_project
LAPACK_INSTALL_STAGING = YES
LAPACK_SUPPORTS_IN_SOURCE_BUILD = NO
LAPACK_CONF_OPTS = -DLAPACKE=ON -DCBLAS=ON

ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)
LAPACK_CONF_OPTS += \
-DBUILD_COMPLEX=ON \
-DBUILD_COMPLEX16=ON \
-DLAPACKE_BUILD_COMPLEX=ON \
-DLAPACKE_BUILD_COMPLEX16=ON
else
LAPACK_CONF_OPTS += \
-DBUILD_COMPLEX=OFF \
-DBUILD_COMPLEX16=OFF \
-DLAPACKE_BUILD_COMPLEX=OFF \
-DLAPACKE_BUILD_COMPLEX16=OFF
endif

$(eval $(cmake-package))
$(eval $(host-cmake-package))

Andreas

--000000000000301b18060247edca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>How do I configure Fortran properly=
 for lapack? I need it on host for the python-scikit-learn package. I get t=
he following error.</div><div><br></div><div>-- The Fortran compiler identi=
fication is unknown<br>-- The C compiler identification is GNU 8.3.0<br>CMa=
ke Error at CMakeLists.txt:3 (project):<br>=C2=A0 No CMAKE_Fortran_COMPILER=
 could be found.<br><br>=C2=A0 Tell CMake where to find the compiler by set=
ting either the environment<br>=C2=A0 variable &quot;FC&quot; or the CMake =
cache entry CMAKE_Fortran_COMPILER to the full<br>=C2=A0 path to the compil=
er, or to the compiler name if it is in the PATH.<br><br><br>-- Check for w=
orking C compiler: /usr/bin/gcc<br>-- Check for working C compiler: /usr/bi=
n/gcc -- works<br>-- Detecting C compiler ABI info<br>-- Detecting C compil=
er ABI info - done<br>-- Detecting C compile features<br>-- Detecting C com=
pile features - done<br>-- Configuring incomplete, errors occurred!<br>See =
also &quot;/buildroot/output/build/host-lapack-3.10.1/buildroot-build/CMake=
Files/CMakeOutput.log&quot;.<br>See also &quot;/buildroot/output/build/host=
-lapack-3.10.1/buildroot-build/CMakeFiles/CMakeError.log&quot;.<br></div><d=
iv><br></div><div>#########################################################=
#######################<br>#<br># python-scikit-learn<br>#<br>#############=
###################################################################<br><br>=
PYTHON_SCIKIT_LEARN_VERSION =3D 1.3.0<br>PYTHON_SCIKIT_LEARN_SOURCE =3D sci=
kit-learn-$(PYTHON_SCIKIT_LEARN_VERSION).tar.gz<br>PYTHON_SCIKIT_LEARN_SITE=
 =3D <a href=3D"https://files.pythonhosted.org/packages/72/cd/4761675df1b3d=
d93072c89697278f3ed3dc004a60c034cd2603c43ff64b5">https://files.pythonhosted=
.org/packages/72/cd/4761675df1b3dd93072c89697278f3ed3dc004a60c034cd2603c43f=
f64b5</a><br>PYTHON_SCIKIT_LEARN_SETUP_TYPE =3D setuptools<br>PYTHON_SCIKIT=
_LEARN_LICENSE =3D BSD-3-Clause<br>PYTHON_SCIKIT_LEARN_LICENSE_FILES =3D CO=
PYING<br>PYTHON_SCIKIT_LEARN_DEPENDENCIES =3D \<br>	host-python-cython \<br=
>	host-python-scipy \<br>	python-joblib \<br>	python-threadpoolctl<br><br>#=
 disable test execution when cross compiling<br>PYTHON_SCIKIT_LEARN_ENV =3D=
 PYTHON_CROSSENV=3D1<br><br>$(eval $(python-package))<br></div><div><br></d=
iv><div>###################################################################=
#############<br>#<br># lapack<br>#<br>####################################=
############################################<br><br>LAPACK_VERSION =3D 3.10=
.1<br>LAPACK_LICENSE =3D BSD-3-Clause<br>LAPACK_LICENSE_FILES =3D LICENSE<b=
r>LAPACK_SITE =3D $(call github,Reference-LAPACK,lapack,v$(LAPACK_VERSION))=
<br>LAPACK_CPE_ID_VENDOR =3D lapack_project<br>LAPACK_INSTALL_STAGING =3D Y=
ES<br>LAPACK_SUPPORTS_IN_SOURCE_BUILD =3D NO<br>LAPACK_CONF_OPTS =3D -DLAPA=
CKE=3DON -DCBLAS=3DON<br><br>ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)<br>LAPA=
CK_CONF_OPTS +=3D \<br>	-DBUILD_COMPLEX=3DON \<br>	-DBUILD_COMPLEX16=3DON \=
<br>	-DLAPACKE_BUILD_COMPLEX=3DON \<br>	-DLAPACKE_BUILD_COMPLEX16=3DON<br>e=
lse<br>LAPACK_CONF_OPTS +=3D \<br>	-DBUILD_COMPLEX=3DOFF \<br>	-DBUILD_COMP=
LEX16=3DOFF \<br>	-DLAPACKE_BUILD_COMPLEX=3DOFF \<br>	-DLAPACKE_BUILD_COMPL=
EX16=3DOFF<br>endif<br><br>$(eval $(cmake-package))<br>$(eval $(host-cmake-=
package))<br></div><div><br></div><div>Andreas</div></div>

--000000000000301b18060247edca--

--===============5106991459643358749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5106991459643358749==--
