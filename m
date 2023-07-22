Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48102EB64DC
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 09:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FFC341906;
	Sat, 22 Jul 2023 09:35:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FFC341906
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fPqMX91-OV7n; Sat, 22 Jul 2023 09:35:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 043FA4190B;
	Sat, 22 Jul 2023 09:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 043FA4190B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C50B41BF37C
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 09:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5CFA401C9
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 09:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5CFA401C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hDi28L6AiEYZ for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 09:35:38 +0000 (UTC)
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 603DF40012
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 09:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 603DF40012
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3a36b309524so2070670b6e.3
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 02:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690018537; x=1690623337;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6J4N/aohoT++1Ee9eueaqn63Pu4hTIKLbAeh8AfDzEU=;
 b=G9vrxXdauvzu0WBdVDAldUWofeUZy/oSLXEFJ0JL7J5U/3zex2VuBdHT8DZ/vQae2z
 wO0tyFKXDexE1Fkgbaq+z0ghL6NIGM8xpOOxrsuuAVBq1msb0+aab0m88bUAIY/FlFLf
 sVG6XUz7t0+vM4MPdFr/67nPapiW2tAiJ+Qo7Dsn8jmD/avYasmzuf+o1NmHmvecdO8d
 IyB3/xPel9Os7rkhzcL7s5UfLWV3vJij1OCyZXernFLMKbCiI5W/LBHKCkx8lZ40PB0v
 l8ClFliLBKo4LtG/faYcS1Ig3gNaGAfW8Kqq9PTqiVQm7jDkNUjNHupGXc3kPJ5/wG/k
 YMVQ==
X-Gm-Message-State: ABy/qLZhWba6fD565sllsMEIZ0zbTyG/l2xg8uDzxMey948Cskb8NIC4
 R12UZm6z7pVd6BgFwHOAkbrS1vnmDZFjn3tGHV+WWZ9udos=
X-Google-Smtp-Source: APBJJlF+lYnUXSCc6O7kRAy2uGE/qganERjdGddOQ+ZdrVgMIKrlQKyb24ysur9NvJk270LrB3PEIxPqB1A5r6D8ltk=
X-Received: by 2002:a05:6808:199:b0:3a1:dd1b:a97a with SMTP id
 w25-20020a056808019900b003a1dd1ba97amr5104202oic.31.1690018537102; Sat, 22
 Jul 2023 02:35:37 -0700 (PDT)
MIME-Version: 1.0
From: Andreas <andreasembbuild@gmail.com>
Date: Sat, 22 Jul 2023 11:35:26 +0200
Message-ID: <CAOLWrZ-zemgtEsJKLJXeA7tiaPCHeR4wZGT01_e0+bkCS0pjuA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690018537; x=1690623337;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6J4N/aohoT++1Ee9eueaqn63Pu4hTIKLbAeh8AfDzEU=;
 b=h2QJeKO9PgyuczKlxsXSTbrNodSLOdlWj1Su8TqXZMINvSinIU8xTR1P+ZIvpzo/rA
 EQ1vPwm+0iKg1sLs8dfQnNnbR0lZn5q0akwQYTe609dOi3r5BhgdosFE4fKQPU0ieOBL
 df0Vwzy8AXIcpv/uX2R3L5xGacAAjky7w+ii6F2DtCQtNArCKk8HENX5GplrseAoEoJ6
 niqyGkkMnWo3dVTu7cuTiSxJTtENHb6migcXLKdNw5UwNYg48MEQdS1BogeK54tIm2Fd
 OSvg0AUrE5eYtpEocjl4qzrzLKrfefA3C2C4U/jRS9Bfeyrm6vmErkRdcz9ZaUCvjf+A
 bZmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=h2QJeKO9
Subject: [Buildroot] Support for package python-rpds-py
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
Content-Type: multipart/mixed; boundary="===============3338937344351684016=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3338937344351684016==
Content-Type: multipart/alternative; boundary="0000000000009160460601101a9d"

--0000000000009160460601101a9d
Content-Type: text/plain; charset="UTF-8"

Hi,

I need the package python-rpds-py that is a dependency of the referencing
package and depends itself on python-maturin.
I configured it as follows:
################################################################################
#
# python-rpds-py
#
################################################################################

PYTHON_RPDS_PY_VERSION = 0.8.10
PYTHON_RPDS_PY_SOURCE = rpds_py-$(PYTHON_RPDS_PY_VERSION).tar.gz
PYTHON_RPDS_PY_SITE =
https://files.pythonhosted.org/packages/e6/fe/7d07bc08cce2ccae2c7e5c96d9b3976c4e1fa5e248989dca0a58bc7628f8
PYTHON_RPDS_PY_SETUP_TYPE = pep517
PYTHON_RPDS_PY_LICENSE = MIT
PYTHON_RPDS_PY_LICENSE_FILES = LICENSE
PYTHON_RPDS_PY_DEPENDENCIES = host-python-maturin

$(eval $(python-package))

The one for maturin looks as follows:

################################################################################
#
# python-maturin
#
################################################################################

PYTHON_MATURIN_VERSION = 1.0.0
PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
PYTHON_MATURIN_SITE =
https://files.pythonhosted.org/packages/1c/de/5f56b77179595ba52786eedb081fc6b0f1d0a4496bc77660e8feabd607ec
PYTHON_MATURIN_SETUP_TYPE = setuptools
PYTHON_MATURIN_LICENSE = MIT OR Apache-2.0
PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
HOST_PYTHON_MATURIN_DEPENDENCIES = \
host-python-setuptools-rust \
host-rustc
HOST_PYTHON_MATURIN_ENV = \
$(HOST_PKG_CARGO_ENV) \
PYO3_CROSS_LIB_DIR="$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"
# We need to vendor the Cargo crates at download time
PYTHON_MATURIN_DOWNLOAD_POST_PROCESS = cargo
PYTHON_MATURIN_DOWNLOAD_DEPENDENCIES = host-rustc
HOST_PYTHON_MATURIN_DL_ENV = $(HOST_PKG_CARGO_ENV)

$(eval $(host-python-package))

So far so go. However, I get the following error for installing it on the
target:

ERROR: architecture for "/usr/lib/python3.10/site-packages/rpds/
rpds.cpython-310-arm-linux-gnueabihf.so" is "Advanced Micro Devices
X86-64", should be "ARM".

What could be the cause of the error and how can I prevent it?
For some more overall context I try to compile the package
python-notebook notebook==6.5.4, that itself depends on ipython and
ipykernel which require jupyterlab-widgets and jupyterlab-pygments that
throw a similar error.

Kind Regards,
Andreas

--0000000000009160460601101a9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I need the package python-rpds-py t=
hat is a dependency of the referencing package and depends itself on python=
-maturin.</div><div>I configured it as follows:</div><div>#################=
###############################################################<br>#<br># p=
ython-rpds-py<br>#<br>#####################################################=
###########################<br><br>PYTHON_RPDS_PY_VERSION =3D 0.8.10<br>PYT=
HON_RPDS_PY_SOURCE =3D rpds_py-$(PYTHON_RPDS_PY_VERSION).tar.gz<br>PYTHON_R=
PDS_PY_SITE =3D <a href=3D"https://files.pythonhosted.org/packages/e6/fe/7d=
07bc08cce2ccae2c7e5c96d9b3976c4e1fa5e248989dca0a58bc7628f8" target=3D"_blan=
k">https://files.pythonhosted.org/packages/e6/fe/7d07bc08cce2ccae2c7e5c96d9=
b3976c4e1fa5e248989dca0a58bc7628f8</a><br>PYTHON_RPDS_PY_SETUP_TYPE =3D pep=
517<br>PYTHON_RPDS_PY_LICENSE =3D MIT<br>PYTHON_RPDS_PY_LICENSE_FILES =3D L=
ICENSE<br>PYTHON_RPDS_PY_DEPENDENCIES =3D host-python-maturin<br><br>$(eval=
 $(python-package))<br></div><div><br></div><div>The one for maturin looks =
as follows:</div><div><br></div><div>######################################=
##########################################<br>#<br># python-maturin<br>#<br=
>##########################################################################=
######<br><br>PYTHON_MATURIN_VERSION =3D 1.0.0<br>PYTHON_MATURIN_SOURCE =3D=
 maturin-$(PYTHON_MATURIN_VERSION).tar.gz<br>PYTHON_MATURIN_SITE =3D <a hre=
f=3D"https://files.pythonhosted.org/packages/1c/de/5f56b77179595ba52786eedb=
081fc6b0f1d0a4496bc77660e8feabd607ec" target=3D"_blank">https://files.pytho=
nhosted.org/packages/1c/de/5f56b77179595ba52786eedb081fc6b0f1d0a4496bc77660=
e8feabd607ec</a><br>PYTHON_MATURIN_SETUP_TYPE =3D setuptools<br>PYTHON_MATU=
RIN_LICENSE =3D MIT OR Apache-2.0<br>PYTHON_MATURIN_LICENSE_FILES =3D licen=
se-apache license-mit<br>HOST_PYTHON_MATURIN_DEPENDENCIES =3D \<br>	host-py=
thon-setuptools-rust \<br>	host-rustc<br>HOST_PYTHON_MATURIN_ENV =3D \<br>	=
$(HOST_PKG_CARGO_ENV) \<br>	PYO3_CROSS_LIB_DIR=3D&quot;$(HOST_DIR)/lib/pyth=
on$(PYTHON3_VERSION_MAJOR)&quot;<br># We need to vendor the Cargo crates at=
 download time<br>PYTHON_MATURIN_DOWNLOAD_POST_PROCESS =3D cargo<br>PYTHON_=
MATURIN_DOWNLOAD_DEPENDENCIES =3D host-rustc<br>HOST_PYTHON_MATURIN_DL_ENV =
=3D $(HOST_PKG_CARGO_ENV)<br><br>$(eval $(host-python-package))<br></div><d=
iv><br></div><div>So far so go. However, I get the following error for inst=
alling it on the target:</div><div><br></div><div>ERROR: architecture for &=
quot;/usr/lib/python3.10/site-packages/rpds/<a href=3D"http://rpds.cpython-=
310-arm-linux-gnueabihf.so" target=3D"_blank">rpds.cpython-310-arm-linux-gn=
ueabihf.so</a>&quot; is &quot;Advanced Micro Devices X86-64&quot;, should b=
e &quot;ARM&quot;.=C2=A0<br></div><div><br></div><div>What could be the cau=
se of the error and how can I prevent it?</div><div>For some more overall c=
ontext I try to compile the package python-notebook=C2=A0notebook=3D=3D6.5.=
4, that itself depends on ipython and ipykernel which require jupyterlab-wi=
dgets and jupyterlab-pygments that throw a similar error.</div><div><br></d=
iv><div>Kind Regards,</div><div>Andreas</div></div>

--0000000000009160460601101a9d--

--===============3338937344351684016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3338937344351684016==--
