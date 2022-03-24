Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E00C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 04:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A659A419AC;
	Thu, 24 Mar 2022 04:50:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NiSwovlUwMk2; Thu, 24 Mar 2022 04:50:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7775418EE;
	Thu, 24 Mar 2022 04:50:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C46BE1BF681
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 04:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B166081409
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 04:49:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fo_KkDMUVA07 for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 04:49:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6A2D81404
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 04:49:58 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id k15so1383734vsr.11
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 21:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=QSjcS4XBjcOqVJAVVlp1Vf7vJYS23Fmx6mun98fMHYY=;
 b=Dw57odggnMWGgXYnys5w+hagHi4GUddhWel/oCy1DOk4LAt6654j30I/qmooZVf85s
 07Uzwfiehq6Aic7IA22sy0C3CPr4Rv7XGHyqf00ei6CQs/L3pE5tfg0U6dcceAWVM/gy
 nHDYzaEhxZZZJ7aX/YB5DOcs7FEUwtzcOraEhVtI5XB5eWzHJbKOD+jWz1Tp4fimon5B
 /PjIAQPqFOflh3xhpw62/hiyv9YGawiaIgIpYLxocrR0Er24XWEjURt7tXC+bW6cx7ND
 YwHyR898bRTE1ChwkXI/So+uWZU04Y+6J4YhAOUL/CLZTjOIRA9OJtV7XL16E1F3ZBLR
 Criw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=QSjcS4XBjcOqVJAVVlp1Vf7vJYS23Fmx6mun98fMHYY=;
 b=GcpGHXmDORSVKmfUYwGCtAWBX9cQbJK4QLWFM1kzDucmiEHIZoP26qkT2snUpDlLoh
 V22PzV1c4Nh80N/sHYTcQY4wF+RtnAji1cm0tCzUv1aUk4sLo/0tlkdzhCnJgk2XURpt
 L7DDbJk64wXkjvpkSzmeU2uVdGKqiln5XVLgnDL/xJvjE1Suq29/8w2HJYkIjvWPOz1c
 Li/Wj5HMSRIKN1j4SvKj/ZPFWR/eYc3vwriEZjPYMu3WkaZuFN2pPxi/V2778tFq+zoZ
 WpFOAryvMXgApDQwkXkVZbWsQt6LT0jSH3GuMGQQmH9okR4tD+ouwGatHllbWcnaJu9n
 G5tQ==
X-Gm-Message-State: AOAM5326ERKmxtb5/Mq3hKce8EIWst1waoM4CK6am1Fv+jA6D/SfP3vR
 hL6IqlqfWJWY9X4UUL7Bnk3RVwzVyEzXdiu4optwEK1rFlQ=
X-Google-Smtp-Source: ABdhPJwUvbWTsazWifrF+2SvR2wgB6Mrtj2xw3XHJ8nPSr8iXAq3JL6qXzeUal7SuX8qEiEn4XV9/CqK5S6uCAMprMo=
X-Received: by 2002:a05:6102:cd0:b0:322:c873:e708 with SMTP id
 g16-20020a0561020cd000b00322c873e708mr1523071vst.40.1648097397519; Wed, 23
 Mar 2022 21:49:57 -0700 (PDT)
MIME-Version: 1.0
From: snathick <snathicktechno@gmail.com>
Date: Thu, 24 Mar 2022 10:19:46 +0530
Message-ID: <CAN5CKbfJWXWZ2sQhOf-=81p+h-9QkZgRbegAnXHLPRn78XxNKg@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] Python package integration
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
Content-Type: multipart/mixed; boundary="===============3509824328302194394=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3509824328302194394==
Content-Type: multipart/alternative; boundary="000000000000ef364b05daef93cb"

--000000000000ef364b05daef93cb
Content-Type: text/plain; charset="UTF-8"

Hi,

I am trying to add the below python package to buildroot

https://github.com/richteel/TeelSys_Python_SHT


.mk file as follows

################################################################################
#
# python-sht21
#
################################################################################

PYTHON_SHT21_VERSION = 1.0
PYTHON_SHT21_SOURCE = pysht21-$(PYTHON_SHT21_VERSION).tar.gz
PYTHON_SHT21_SITE = https://github.com/richteel/TeelSys_Python_SHT
PYTHON_SHT21_LICENSE = BSD
PYTHON_SHT21_LICENSE_FILES = LICENSE
PYTHON_SHT21_SETUP_TYPE = setuptools

$(eval $(python-package))

make command giving following error

wget --passive-ftp -nd -t 3 -O
'/home/snathick/buildroot/output/build/.pysht21-1.0.uyWYsC/output' '
http://sources.buildroot.net/pysht21-1.0'
--2022-03-24 08:57:12--  http://sources.buildroot.net/pysht21-1.0
Resolving sources.buildroot.net (sources.buildroot.net)... 172.67.72.56,
104.26.0.37, 104.26.1.37, ...
Connecting to sources.buildroot.net (sources.buildroot.net)|172.67.72.56|:80...
connected.
HTTP request sent, awaiting response... 404 Not Found
2022-03-24 08:57:13 ERROR 404: Not Found.

package/pkg-generic.mk:185: recipe for target
'/home/snathick/buildroot/output/build/python-sht21-1.0/.stamp_downloaded'
failed
make[1]: ***
[/home/snathick/buildroot/output/build/python-sht21-1.0/.stamp_downloaded]
Error 1
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2


Any suggestions to resolve the issue




-- 
Thanks & Regards,
Snathick

--000000000000ef364b05daef93cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>I am trying to add the below python package to =
buildroot<br><br><a href=3D"https://github.com/richteel/TeelSys_Python_SHT"=
>https://github.com/richteel/TeelSys_Python_SHT</a><br><br><br>.mk file as =
follows<br><br>############################################################=
####################<br>#<br># python-sht21<br>#<br>#######################=
#########################################################<br><br>PYTHON_SHT=
21_VERSION =3D 1.0<br>PYTHON_SHT21_SOURCE =3D pysht21-$(PYTHON_SHT21_VERSIO=
N).tar.gz<br>PYTHON_SHT21_SITE =3D <a href=3D"https://github.com/richteel/T=
eelSys_Python_SHT">https://github.com/richteel/TeelSys_Python_SHT</a><br>PY=
THON_SHT21_LICENSE =3D BSD<br>PYTHON_SHT21_LICENSE_FILES =3D LICENSE<br>PYT=
HON_SHT21_SETUP_TYPE =3D setuptools<br><br>$(eval $(python-package))<br><br=
>make command giving following error<br><br>wget --passive-ftp -nd -t 3 -O =
&#39;/home/snathick/buildroot/output/build/.pysht21-1.0.uyWYsC/output&#39; =
&#39;<a href=3D"http://sources.buildroot.net/pysht21-1.0">http://sources.bu=
ildroot.net/pysht21-1.0</a>&#39; <br>--2022-03-24 08:57:12-- =C2=A0<a href=
=3D"http://sources.buildroot.net/pysht21-1.0">http://sources.buildroot.net/=
pysht21-1.0</a><br>Resolving <a href=3D"http://sources.buildroot.net">sourc=
es.buildroot.net</a> (<a href=3D"http://sources.buildroot.net">sources.buil=
droot.net</a>)... 172.67.72.56, 104.26.0.37, 104.26.1.37, ...<br>Connecting=
 to <a href=3D"http://sources.buildroot.net">sources.buildroot.net</a> (<a =
href=3D"http://sources.buildroot.net">sources.buildroot.net</a>)|172.67.72.=
56|:80... connected.<br>HTTP request sent, awaiting response... 404 Not Fou=
nd<br>2022-03-24 08:57:13 ERROR 404: Not Found.<br><br>package/<a href=3D"h=
ttp://pkg-generic.mk:185">pkg-generic.mk:185</a>: recipe for target &#39;/h=
ome/snathick/buildroot/output/build/python-sht21-1.0/.stamp_downloaded&#39;=
 failed<br>make[1]: *** [/home/snathick/buildroot/output/build/python-sht21=
-1.0/.stamp_downloaded] Error 1<br>Makefile:84: recipe for target &#39;_all=
&#39; failed<br>make: *** [_all] Error 2<br><br><br>Any suggestions to reso=
lve the issue <br><br><br><br clear=3D"all"><br>-- <br><div dir=3D"ltr" cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">=
<div>Thanks &amp; Regards,</div><div>Snathick<br></div></div></div></div>

--000000000000ef364b05daef93cb--

--===============3509824328302194394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3509824328302194394==--
