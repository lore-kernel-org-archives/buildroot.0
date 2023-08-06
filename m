Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB7AC0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 21:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A565860BD3;
	Sun,  6 Aug 2023 21:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A565860BD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9CUbOVrjjgPO; Sun,  6 Aug 2023 21:09:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D246360E50;
	Sun,  6 Aug 2023 21:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D246360E50
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A1411BF30C
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F75560DDF
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F75560DDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DXcq3NNey7a3 for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 21:08:43 +0000 (UTC)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 775B9607F0
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 21:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 775B9607F0
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1b8b2b60731so23692965ad.2
 for <buildroot@buildroot.org>; Sun, 06 Aug 2023 14:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691356123; x=1691960923;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BPgEg6dWsCalOtpTnv1MlwHYLsthmlG9C06+PKuztzA=;
 b=adGJsrpwdIyYh6zgt3PbloM9U2Rh1bqkYssml0GN18Gn9XVE7EcaHaFMWzL5mDDdQa
 3RMO3T/wzNRw7pZIvStGwa6HXCIqhwzRvxm4+RLmRgxv1M6MjdTW3ZFwc+omx2H4l1lq
 uInJbNFIbr2F5lVI93dM6ItgghQ65egGePRCBWduNI+Yd5t+/tJ0pNy89t56TeU3nAKy
 v+Muwil31GrmRnnRbBann1tyi9hMyoZq8mmolL6ikOZ1BRdwqmNKzTNug9ZWcUhnh/w9
 tROQJQvSXUBC3UilNjvmEnHFxNFkS6eO2I7i2l+b+qpxLoyx6rEFICiVCSp1Ow1XXWAE
 F3+Q==
X-Gm-Message-State: AOJu0Yx+R0x1jgRUDqhdLIq4ZdpavqxepIZTPwmaW9H4yXB0Nyhiiylh
 jLNzB2gptucv4+axlBXBh4RcteeNIanpxLQQsiS2//WFe+I=
X-Google-Smtp-Source: AGHT+IGda7nJOTNlj0FYG7aqe9VNmVEBRI5Y/5mfTZ4HT+QquKxiichmh5X+3J8UL7fregfJcTDpv99hYlKWFBO8Gzk=
X-Received: by 2002:a17:903:230b:b0:1bc:239:a7e3 with SMTP id
 d11-20020a170903230b00b001bc0239a7e3mr8052284plh.44.1691356122666; Sun, 06
 Aug 2023 14:08:42 -0700 (PDT)
MIME-Version: 1.0
From: Andreas <andreasembbuild@gmail.com>
Date: Sun, 6 Aug 2023 23:08:31 +0200
Message-ID: <CAOLWrZ_+U2+hsJe9rSyxO=DcTf1DOMP-Mrn6t-602D1W4nQk0g@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691356123; x=1691960923;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=BPgEg6dWsCalOtpTnv1MlwHYLsthmlG9C06+PKuztzA=;
 b=SQMgSl9kveQUcdNyag2iqEtZM2vcck/Y/uhZmtWb+OnU01IxsSxa+YcAdRBkgcVJEG
 abotvyImyKPZa3E+wnLD62AjMq2tPQCtdi8VFARwsuu8YTinRu926yoctDiN9WmqSMxT
 EostjpJW9UQGjpXSuQWL9UZZ96SDQ1eN3FlWxaxv4TkODwL+ZGHm0r19DSZqNZ9sMyDJ
 skULE17kX9ZPrLYhEZlTDEsPL6OSgv37iX3JyyLkBiBoBWSuonWGETCEdCFiwCaZV0Nu
 T5MyiOwnhI1IjShAmwGPmmPt66XyOQ7ubQJliHbPlwNRf0k7W//Eb0M2vmaov0lDjOJV
 /jng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=SQMgSl9k
Subject: [Buildroot] Support for python-prctl
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
Content-Type: multipart/mixed; boundary="===============0338703263351717856=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0338703263351717856==
Content-Type: multipart/alternative; boundary="000000000000e159820602478802"

--000000000000e159820602478802
Content-Type: text/plain; charset="UTF-8"

Hi,

I am trying to add the package python-prctl but it fails missing the libcap
developement headers. How can I add them. I added libcap as a dependency

You need to install libcap development headers to build this module
make: *** [package/pkg-generic.mk:293:
/buildroot/output/build/python-prctl-1.8.1/.stamp_built] Error 1
make: Leaving directory '/buildroot'
finish


################################################################################
#
# python-prctl
#
################################################################################

PYTHON_PRCTL_VERSION = 1.8.1
PYTHON_PRCTL_SITE =
https://files.pythonhosted.org/packages/c0/99/be5393cfe9c16376b4f515d90a68b11f1840143ac1890e9008bc176cf6a6
PYTHON_PRCTL_SETUP_TYPE = setuptools
PYTHON_PRCTL_LICENSE = GNU General Public License (GPL)
PYTHON_PRCTL_DEPENDENCIES = host-pkgconf host-libcap libcap

$(eval $(python-package))

--000000000000e159820602478802
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I am trying to add the package pyth=
on-prctl but it fails missing the libcap developement headers. How can I ad=
d them. I added libcap as a dependency</div><div><br></div><div>You need to=
 install libcap development headers to build this module<br>make: *** [pack=
age/<a href=3D"http://pkg-generic.mk:293">pkg-generic.mk:293</a>: /buildroo=
t/output/build/python-prctl-1.8.1/.stamp_built] Error 1<br>make: Leaving di=
rectory &#39;/buildroot&#39;<br>finish<br></div><div><br></div><div><br></d=
iv><div>###################################################################=
#############<br>#<br># python-prctl<br>#<br>##############################=
##################################################<br><br>PYTHON_PRCTL_VERS=
ION =3D 1.8.1<br>PYTHON_PRCTL_SITE =3D <a href=3D"https://files.pythonhoste=
d.org/packages/c0/99/be5393cfe9c16376b4f515d90a68b11f1840143ac1890e9008bc17=
6cf6a6">https://files.pythonhosted.org/packages/c0/99/be5393cfe9c16376b4f51=
5d90a68b11f1840143ac1890e9008bc176cf6a6</a><br>PYTHON_PRCTL_SETUP_TYPE =3D =
setuptools<br>PYTHON_PRCTL_LICENSE =3D GNU General Public License (GPL)<br>=
PYTHON_PRCTL_DEPENDENCIES =3D host-pkgconf host-libcap libcap<br><br>$(eval=
 $(python-package))<br></div></div>

--000000000000e159820602478802--

--===============0338703263351717856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0338703263351717856==--
