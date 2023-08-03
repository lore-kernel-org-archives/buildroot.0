Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57BAC04A6A
	for <buildroot@archiver.kernel.org>; Thu,  3 Aug 2023 08:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3CCF80EA2;
	Thu,  3 Aug 2023 08:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3CCF80EA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lpj-He9BBvaF; Thu,  3 Aug 2023 08:36:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0343181368;
	Thu,  3 Aug 2023 08:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0343181368
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 088501BF277
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 08:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 180EA61319
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 08:35:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 180EA61319
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LIuf_J47_KVN for <buildroot@lists.busybox.net>;
 Thu,  3 Aug 2023 08:35:52 +0000 (UTC)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F1B7061361
 for <buildroot@buildroot.org>; Thu,  3 Aug 2023 08:35:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1B7061361
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-26871992645so411525a91.0
 for <buildroot@buildroot.org>; Thu, 03 Aug 2023 01:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691051751; x=1691656551;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AYe9cpYFCQto5OwOy1vFE4SCRQGZ5F0McJI6gjXRrzg=;
 b=W64lndTto+kI1wCVbLUewons3nru+zwdQ4RCVZofFtUMWb3TK+oSh9NEKph4bVfCn5
 em3Chy4MqAohvlhbNVGQ/mtNnfkGgwoWsQcJKsK7F2Z91s1PrQz1Gm+enDER9DNVaTBk
 5QGsbNQtRxbgn7vssCqW1X4ZJ1USNH8no0aq+QJjBLvB4/B+MXi5GX5OaPnPMMUl7Bsd
 PDsNHJ7mMkxjAym90nUVgP3fuzPPaoEsCfd86smmiGXbDD+wvy9ztQ+SvtTdQh1J1MOX
 fQaMe51ayKHVyqcFAUKOQyQ+dqdiDOoeRdyWyIl1JsesWYYyf0oQewiUwGO26FcZ10TR
 /4uw==
X-Gm-Message-State: ABy/qLYXmQ43OzHV7i89fH2UpMaJOKqE7rktEjlxX6fJlhu2aOdGZYN4
 8Na7qy8Rbrla6NNuchdcV2M9oL1xdzCWB1Moo80ELnL8JiA=
X-Google-Smtp-Source: APBJJlH0tbk4gPMbuqGcnxmvwGyOot91Gdo262TP+p3Y7lrC1QYMf3/t3hdxnKQj8TL2hHe6FYImZNkn0zLSbsonb6c=
X-Received: by 2002:a17:90a:4102:b0:25b:c8b7:9e5b with SMTP id
 u2-20020a17090a410200b0025bc8b79e5bmr17612204pjf.31.1691051751254; Thu, 03
 Aug 2023 01:35:51 -0700 (PDT)
MIME-Version: 1.0
From: Andreas <andreasembbuild@gmail.com>
Date: Thu, 3 Aug 2023 10:35:40 +0200
Message-ID: <CAOLWrZ_Fo2c1oaGmzX2J2mu+-5D__5nSFbh_dRcZMnxDORxhyA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691051751; x=1691656551;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=AYe9cpYFCQto5OwOy1vFE4SCRQGZ5F0McJI6gjXRrzg=;
 b=GVDT9RVQ2XdASwUYWfotCBYFPgFHCH8iIOumn3Wbq+f/ASnQTBWTspWQT10e/6W6uP
 kXBLng5FAz9u1MPDOdSb6Coo7FpPo3skSDkeaigUAr6mM/i2fqZU3lUZlEK9KaSBSlUM
 Zz2gVtGv3327of1XA6qDRVpFfVO+1LuZ+1+JJ67DJUFWyTFNa/a/JAVhAEDAkf/44UzA
 pJXaeaFYugMZFtW6rNYJOVMph/b5cHneyBCvaQ0VdoYv80Jv5fCODV8NyaAqQnfk51ja
 tOnQhyQooWzxQ4Cz/e7jiyaAviZwNya0GONtmpAdHo8LSQmNVUHMKR4Pt8cQf869RETf
 MxTQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=GVDT9RVQ
Subject: [Buildroot] python-pandas support in Buildroot
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
Content-Type: multipart/mixed; boundary="===============7902777259258424687=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7902777259258424687==
Content-Type: multipart/alternative; boundary="000000000000ee303d060200aa61"

--000000000000ee303d060200aa61
Content-Type: text/plain; charset="UTF-8"

Hi,

I am trying to add pandas to my build and followed to configuration below.
However, I get the following error not finding Cython despite that it
compiled and installed it before. For Cython I use the current definition
in buildroot/master
  File "/buildroot/output/build/python-pandas-2.0.3/setup.py", line 668, in
<module>
    ext_modules=maybe_cythonize(extensions, compiler_directives=directives),
  File "/buildroot/output/build/python-pandas-2.0.3/setup.py", line 417, in
maybe_cythonize
    raise RuntimeError("Cannot cythonize without Cython installed.")
RuntimeError: Cannot cythonize without Cython installed.
make: *** [package/pkg-generic.mk:293:
/buildroot/output/build/python-pandas-2.0.3/.stamp_built] Error 1

What am I missing?
Cheers,
Andreas


################################################################################
#
# python-pandas
#
################################################################################

PYTHON_PANDAS_VERSION = 2.0.3
PYTHON_PANDAS_SOURCE = pandas-$(PYTHON_PANDAS_VERSION).tar.gz
PYTHON_PANDAS_SITE =
https://files.pythonhosted.org/packages/b1/a7/824332581e258b5aa4f3763ecb2a797e5f9a54269044ba2e50ac19936b32
PYTHON_PANDAS_SETUP_TYPE = flit
PYTHON_PANDAS_LICENSE = BSD
PYTHON_PANDAS_LICENSE_FILES = LICENSE
PYTHON_PANDAS_DEPENDENCIES = host-python-numpy host-python-versioneer
host-python-cython

ifneq ($(BR2_PACKAGE_PYTHON_PANDAS_TESTS),y)
define PYTHON_PANDAS_REMOVE_TESTS
   rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pandas/tests
endef
PYTHON_PANDAS_POST_INSTALL_TARGET_HOOKS += PYTHON_PANDAS_REMOVE_TESTS
endif

$(eval $(python-package))

---- Config.in ---

config BR2_PACKAGE_PYTHON_PANDAS
bool "python-pandas"
select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
select BR2_PACKAGE_PYTHON_PYTZ # runtime
select BR2_PACKAGE_PYTHON_NUMPY # runtime
select BR2_PACKAGE_PYTHON3_BZIP2 # runtime
select BR2_PACKAGE_HOST_PYTHON_NUMPY # build time for headers
select BR2_PACKAGE_HOST_PYTHON_CYTHON  # build time for cython compilation
help
 Powerful data structures for data analysis, time series,
 and statistics.

 http://pandas.pydata.org

config BR2_PACKAGE_PYTHON_PANDAS_TESTS
bool "pandas.tests"
help
Include test files.
Selecting this option adds about 7.1 MB to the target file
system.

--000000000000ee303d060200aa61
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,=C2=A0<div><br></div><div>I am trying to add pandas to =
my build and followed to configuration below. However, I get the following =
error not finding Cython despite that it compiled and installed it before. =
For Cython I use the current definition in buildroot/master</div><div>=C2=
=A0 File &quot;/buildroot/output/build/python-pandas-2.0.3/setup.py&quot;, =
line 668, in &lt;module&gt;<br>=C2=A0 =C2=A0 ext_modules=3Dmaybe_cythonize(=
extensions, compiler_directives=3Ddirectives),<br>=C2=A0 File &quot;/buildr=
oot/output/build/python-pandas-2.0.3/setup.py&quot;, line 417, in maybe_cyt=
honize<br>=C2=A0 =C2=A0 raise RuntimeError(&quot;Cannot cythonize without C=
ython installed.&quot;)<br>RuntimeError: Cannot cythonize without Cython in=
stalled.<br>make: *** [package/<a href=3D"http://pkg-generic.mk:293">pkg-ge=
neric.mk:293</a>: /buildroot/output/build/python-pandas-2.0.3/.stamp_built]=
 Error 1</div><div><br></div><div>What am I missing?</div><div>Cheers,</div=
><div>Andreas</div><div><div><br></div><div><br></div><div>################=
################################################################<br>#<br># =
python-pandas<br>#<br>#####################################################=
###########################<br><br>PYTHON_PANDAS_VERSION =3D 2.0.3<br>PYTHO=
N_PANDAS_SOURCE =3D pandas-$(PYTHON_PANDAS_VERSION).tar.gz<br>PYTHON_PANDAS=
_SITE =3D <a href=3D"https://files.pythonhosted.org/packages/b1/a7/82433258=
1e258b5aa4f3763ecb2a797e5f9a54269044ba2e50ac19936b32">https://files.pythonh=
osted.org/packages/b1/a7/824332581e258b5aa4f3763ecb2a797e5f9a54269044ba2e50=
ac19936b32</a><br>PYTHON_PANDAS_SETUP_TYPE =3D flit<br>PYTHON_PANDAS_LICENS=
E =3D BSD<br>PYTHON_PANDAS_LICENSE_FILES =3D LICENSE<br>PYTHON_PANDAS_DEPEN=
DENCIES =3D host-python-numpy host-python-versioneer host-python-cython<br>=
<br>ifneq ($(BR2_PACKAGE_PYTHON_PANDAS_TESTS),y)<br>define PYTHON_PANDAS_RE=
MOVE_TESTS<br>=C2=A0 =C2=A0rm -rf $(TARGET_DIR)/usr/lib/python*/site-packag=
es/pandas/tests<br>endef<br>PYTHON_PANDAS_POST_INSTALL_TARGET_HOOKS +=3D PY=
THON_PANDAS_REMOVE_TESTS<br>endif<br><br>$(eval $(python-package))<br></div=
><div><br></div><div>---- Config.in ---</div><div><br></div><div>config BR2=
_PACKAGE_PYTHON_PANDAS<br>	bool &quot;python-pandas&quot;<br>	select BR2_PA=
CKAGE_PYTHON_DATEUTIL # runtime<br>	select BR2_PACKAGE_PYTHON_PYTZ # runtim=
e<br>	select BR2_PACKAGE_PYTHON_NUMPY # runtime<br>	select BR2_PACKAGE_PYTH=
ON3_BZIP2 # runtime<br>	select BR2_PACKAGE_HOST_PYTHON_NUMPY # build time f=
or headers<br>	select BR2_PACKAGE_HOST_PYTHON_CYTHON =C2=A0# build time for=
 cython compilation<br>	help<br>	 =C2=A0Powerful data structures for data a=
nalysis, time series,<br>	 =C2=A0and statistics.<br><br>	 =C2=A0<a href=3D"=
http://pandas.pydata.org">http://pandas.pydata.org</a><br><br>config BR2_PA=
CKAGE_PYTHON_PANDAS_TESTS<br>	bool &quot;pandas.tests&quot;<br>	help<br>		I=
nclude test files.<br>		Selecting this option adds about 7.1 MB to the targ=
et file<br>		system.<br></div></div></div>

--000000000000ee303d060200aa61--

--===============7902777259258424687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7902777259258424687==--
