Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C0B1C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 02:39:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1066E60F22
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 02:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1066E60F22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0F3160729;
	Mon, 25 Oct 2021 02:39:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id veC_OMpa1cPB; Mon, 25 Oct 2021 02:39:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F117D6072A;
	Mon, 25 Oct 2021 02:39:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DCA231BF378
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 02:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC4016072A
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 02:39:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RbUsplfMT3fI for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 02:39:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sonic309-22.consmr.mail.ne1.yahoo.com
 (sonic309-22.consmr.mail.ne1.yahoo.com [66.163.184.148])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBF7160729
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 02:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1635129543; bh=+Hb8RAugfNA4SWSeEpMuMM2xkrHPrLnS5LzDICw8LVo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=bqrNxF1ZGmLyV62ndYaA9JYgidj09OnL+7p1Bd5JDDhMlZxUIjoJWtN0sWxz8yWDBlhfqoEhsSrIwA111paBbOb2PXg0pw1dNNJOC49JY4laFDN5PE3WnHX1M0i0ixZyRgic5/q91LZplllVT7XoYZF/9yvoMXc/oh82Wjfwoze4t1qBpzzWMMvRZ2ylodBi7PKark7tBKKOdpKlCT4VrwDASUSHvZQ70hZ/qpQIDcWoNrzllhUynAVHadB7ohmcvxcwXGVOMbKCCJFTI4yHfQaM/X+CNXyf3b0nFzuwwzegGhYIB9opZagTa0+vZVnyadCSc59qC6wZTtvkvD3FkA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1635129544; bh=uDSWVhjqaGNnlHL+qxzDVFzIViz3JY971tnx2bVxQVR=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=g2gEqGoKQUFVjI9Zi1QIrfum1KYn9VtbjH1VtajmX0MPq/KMYVUO3vdwlOcR8Cia4uPotKuOfru7VVvg7fLoKxkSK7wZ4DFCzqZpDt2DfauveN2c+xKYCRoklKzokVcY75Bm28P1LylYrGzuO1ayZswG5BRlKoCFmDGn1mL6uM7E1ZD9QKSKjAdKdx3rDtY2zXg+/sTE03/iiNg+S0fvxdZfl/d0fkHtW17pvYFjOg81LdjQu62j2jd4tmbwrydPDySfmBTJbZoFu7VQsh0xTGbV0ZmBcwOqAUODJZ7mj2IshRNFANx5caPtLAEzRxW4x58+91ibbkP+jY4kqYHCPg==
X-YMail-OSG: tJK_eMYVM1lJ3OCB_qzLevOTJfRHnEjKb5fi0bUCkvmXF7DnbuadUVXgtAnVBqP
 UJERvZthvcmCwrKcPHt3TlAdf_Z4Wc5EB0GWMLgl93AQ979iJjo14ODawcoBtJoIoAVZ3Sojk4pL
 LkhhHFwCh8FURnIgazndtXPHB0rZ3Kq9c2BmiKRodfGHX.VrYxEKS648nFL45ZDry0lnoKjZp71Z
 7_HZDCgBDYaGJYz.qNRPxRNgloR3GrgOCB0hqPXkuJX9mPmn5Xz_eV4vesxrD9ElEUne59o1KzjA
 dRYtMbozErOatAlVJE4NGcD.6yiCZxOtsaPvXgIVCKQdOEOMRigdjvZatCGGLQ6eNn84OYWDF90Y
 U9kRhwSgPP9KnLzth0pynFGri7HsObPg_AcJwZYE9vgiAHO4flujtq71S9593iUqEv2UFdShF70h
 sDWE.Rf6sxCjaP1ciedGteUGvoh.mjVmJNZYOiEjwOuAcOQvUSvMyfc.E41mrut_PqGSTJzZ4HBJ
 lRSkR_K2SBADR8ProPfmD4pCuGT0zWvph6B1jXJD5oaZ1sbjLgN0miTyXnCfVedIXcgSKheG99cG
 H6BfXX1OQ4AWRuUNgfLBzp.07MXgzmcv0X8vN6l7_8mMSRHMkv.tQMBJ1qxrY9BeOIFXrAlexUAc
 Oack2SNRDdsZLv.BnbZMvcMlY_OGKR4Ibqk9up_GCCrzMFd2tUE21b4QzNU7x6WIwYAUV783dx9Y
 OZU_PfiVOHNz9Beo4IvJ68SzAbCNAb0TJSvW0_nFeUljMcme3crpZoU4yi8lcCSFwwtvtU9tBcO.
 pFAPWlS5sw4JcmuaoII0NZnEfFzlSeY.e59MOBXoM357aeO_y009xT3RESpUHMqACdr4WwJ8oxs_
 hPuMgv0XdjTdj6gwroEpkb1VgaNVzukokF9q9WioFTgGWE8IrbXQoXCo.6Ls7ZQNbpaGhxe26KDa
 ZL8FsZHOmky2Opk8JFVHrzh4qwQbffok6EnUzFLY0dVGZAyR9h9NDF06HxCAagEfXuYioVEAVlBN
 dQrMZGhftQkZwPtGbaxsvCDeGh_xPXoXFfUC_YBnPDzbPHnltJJOYIPNdhx6ip3LdNT8pM0nOiot
 .6kDxrtwnAnEct2A5JWw2gIn3eOcKDJUzsSSzjeeaojhioYcBOUucIWJwz3hs32gIqSGUofP5APi
 4nRRY.1NHG4K7KhfBpEshMte76Npeh.NRMSVwa083ZD.G3FLDERRmGX5FCDk5RV3gdrvyiUownAb
 NiCSxIZ0Y2ncyirADWWULs1ZnTrA.0hlfyRUWOoaJNC3CvVFUpcxzvkT1yuh4JHf7VNFfcJxRO28
 2VPDfEfPk_d_7xrbwUfbEnvmB0mfjrzwzS_7C1ZlVCjMFjSjKma.t11Yg7NvFMv_qsZ_KnFL8Aop
 g5yBD2TAG6.5CYFCF3TiR4hZd.EMPfLHZfcz48voXnGbwaJW0E5Ux.jVApiduWRdkh5e3e.Q5yIG
 ZkSUAF29TPQOCsQFmNMKzfcqs_Pptah_3lz6CGK56kU3PTd.VPvp3isF8SG3Ooqzs2q1MRcGNdlg
 ed7Hx.6f80mXl3Pt734l2..avR8fBBe7s.Q1zg9S0JMtjs0daEWoYejpdSxCq3PiUTPRsUDRhlPX
 ha.9Gjlfk4Y2LGFnejSjuP.wj33vcKP3_Ylj.D6DfJr_AECj4BRsU.iKW8enuDhNVkwz.zcFuv1T
 CELeIHTjaK326omgGAkfHwso.H8rzlUpz9dxaRT7Y8B0G7_R.elMKmEg8O4YTKiBPXf47.jiLbw.
 6Uy3nbjQe4su299vYBECElJekj5hhk0vhZk0RZe3dHMr08uocJoe91MJQy2fO.47bMVg2nGzLdU.
 EWQaLOz3HLF9oK5rVaSTl89SdfXSME8DbqSH4SD15Z9IpXQ.uO9LiRK_h_QzkVAMdasADhvDw4KV
 yf1YDnhORmb7GxKgZfs7hrT.IggKOxHPGq9Qft1B_m_UBYe8_TESS.FK9b5UMaIxwz.y_08WjTF7
 0JcwDykaE4QHD65g5IE4vu6xjoZAjm9.TCR5syaUTpCjAdfGv4cJOPWVlM8P9lqRKkaSzw.F54XK
 Tr6x60LRZZwcIgRscWH8XfcyKqavTY4NsNu7q4Es3nFf6LzPvtkPplCEv.mjxIljTrvYC25f5WgP
 _1VJA2Cb3Wsg_SfeAns42qYLtP8up0CN8U5TXBZ5Cl8xyTL2BrNMbe4yjeykkpDwtbaLPERSuzgP
 4masMMC.E3Epg9XvM.m4cuvgFpmkwu8mwoBnEZkK66Gmr85LA67bCq8TrTGRrxGozHQ--
X-Sonic-MF: <xiangyu.chen@aol.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.ne1.yahoo.com with HTTP; Mon, 25 Oct 2021 02:39:03 +0000
Date: Mon, 25 Oct 2021 02:38:56 +0000 (UTC)
To: <buildroot@buildroot.org>,  <thomas.petazzoni@bootlin.com>
Message-ID: <878688364.1210798.1635129536454@mail.yahoo.com>
In-Reply-To: <20211025022146.2556-2-xiangyu.chen@aol.com>
References: <[Buildroot] [PATCH] boot/at91bootstrap3: add svn repository
 method> <20211025022146.2556-1-xiangyu.chen@aol.com>
 <20211025022146.2556-2-xiangyu.chen@aol.com>
MIME-Version: 1.0
X-Mailer: WebService/1.1.19198 aolappiosmobile
Subject: [Buildroot] =?utf-8?b?UkXvvJogW1BBVENIIDEvMV0gW1BBVENIIHYyIDEv?=
 =?utf-8?q?1=5D_boot/at91bootstrap3=3A_add_svn_repository_method?=
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
From: Xiangyu Chen via buildroot <buildroot@buildroot.org>
Reply-To: Xiangyu Chen <xiangyu.chen@aol.com>
Cc: spdawson@gmail.com
Content-Type: multipart/mixed; boundary="===============3318946371552019366=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3318946371552019366==
Content-Type: multipart/alternative; 
	boundary="----=_Part_1210797_934670362.1635129536452"

------=_Part_1210797_934670362.1635129536452
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Thomas and all,
Sorry for that stupid mistake in patch v1,I copied a svn workspace code to =
git and missing=C2=A0AT91BOOTSTRAP3_SITE string.
Now I re-submitted a v2 patch, has been done in my git workspace, the=C2=A0=
changes as below:
V1->V2 add Thomas=E2=80=99s comment, fix mistake

Testing done in my local setup
The at91bootstrap can be downloaded and compiled =C2=A0successfully in a pr=
ivate SVN server.



Thanks and Best regards,Xiangyu


=E6=98=9F=E6=9C=9F=E4=B8=80, =E5=8D=81=E6=9C=88 25, 2021, 10:22 =E4=B8=8A=
=E5=8D=88 =E4=BA=8E CHEN Xiangyu <xiangyu.chen@aol.com>=E5=86=99=E9=81=93=
=EF=BC=9A

Since more and more traditional companies are starting using buildroot
with AT91SAM9x chipset as their product firmware, much of them are still
using SVN as their version control system. So add svn repository method
to AT91bootstrap3 package.

Signed-off-by: CHEN Xiangyu <xiangyu.chen@aol.com>
---
 boot/at91bootstrap3/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 +++++++++---
 boot/at91bootstrap3/at91bootstrap3.mk |=C2=A0 4 ++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index 650d3a23c8..b3e18fce7c 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -30,6 +30,12 @@ config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 =C2=A0=C2=A0=C2=A0 =C2=A0 This option allows Buildroot to get the AT91 Boo=
tstrap 3
 =C2=A0=C2=A0=C2=A0 =C2=A0 source code from a Git repository.
=20
+config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN
+=C2=A0=C2=A0=C2=A0 bool "Custom SVN repository"
+=C2=A0=C2=A0=C2=A0 help
+=C2=A0=C2=A0=C2=A0 =C2=A0 This option allows Buildroot to get the AT91 Boo=
tstrap 3
+=C2=A0=C2=A0=C2=A0 =C2=A0 source code from a Subversion repository
+
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
 =C2=A0=C2=A0=C2=A0 bool "Custom tarball"
=20
@@ -39,7 +45,7 @@ config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION
 =C2=A0=C2=A0=C2=A0 string "URL of custom AT91Bootstrap tarball"
 =C2=A0=C2=A0=C2=A0 depends on BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
=20
-if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
+if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT || BR2_TARGET_AT91BOOTSTRAP3_CUSTO=
M_SVN
=20
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL
 =C2=A0=C2=A0=C2=A0 string "URL of custom repository"
@@ -47,7 +53,7 @@ config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION
 =C2=A0=C2=A0=C2=A0 string "Custom repository version"
 =C2=A0=C2=A0=C2=A0 help
-=C2=A0=C2=A0=C2=A0 =C2=A0 Revision to use in the typical format used by Gi=
t
+=C2=A0=C2=A0=C2=A0 =C2=A0 Revision to use in the typical format used by Gi=
t or SVN
 =C2=A0=C2=A0=C2=A0 =C2=A0 E.G. a sha id, a tag, branch, ..
=20
 endif
@@ -57,7 +63,7 @@ config BR2_TARGET_AT91BOOTSTRAP3_VERSION
 =C2=A0=C2=A0=C2=A0 default "v4.0.0" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VE=
RSION
 =C2=A0=C2=A0=C2=A0 default "v3.10.3" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_V=
ERSION_3X
 =C2=A0=C2=A0=C2=A0 default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION \
-=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_=
GIT
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_=
GIT || BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN
 =C2=A0=C2=A0=C2=A0 default "custom"=C2=A0=C2=A0=C2=A0 if BR2_TARGET_AT91BO=
OTSTRAP3_CUSTOM_TARBALL
=20
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_PATCH_DIR
diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at=
91bootstrap3.mk
index 1e2a3a44b0..4bbe7cc718 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -15,6 +15,10 @@ else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT),y)
 AT91BOOTSTRAP3_SITE =3D $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_R=
EPO_URL))
 AT91BOOTSTRAP3_SITE_METHOD =3D git
 BR_NO_CHECK_HASH_FOR +=3D $(AT91BOOTSTRAP3_SOURCE)
+else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN),y)
+AT91BOOTSTRAP3_SITE =3D $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_R=
EPO_URL))
+AT91BOOTSTRAP3_SITE_METHOD =3D svn
+BR_NO_CHECK_HASH_FOR +=3D $(AT91BOOTSTRAP3_SOURCE)
 else
 AT91BOOTSTRAP3_SITE =3D $(call github,linux4sam,at91bootstrap,$(AT91BOOTST=
RAP3_VERSION))
 endif
--=20
2.13.1





------=_Part_1210797_934670362.1635129536452
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html xmlns=3D"http://www.w3.org/1999/xhtml" xmlns:v=3D"urn:schemas-microso=
ft-com:vml" xmlns:o=3D"urn:schemas-microsoft-com:office:office"><head><!--[=
if gte mso 9]><xml><o:OfficeDocumentSettings><o:AllowPNG/><o:PixelsPerInch>=
96</o:PixelsPerInch></o:OfficeDocumentSettings></xml><![endif]--></head><bo=
dy>
Hi Thomas and all,<div><br></div><div>Sorry for that stupid mistake in patc=
h v1,I copied a svn workspace code to git and missing&nbsp;AT91BOOTSTRAP3_S=
ITE string.</div><div><br></div><div>Now I re-submitted a v2 patch, has bee=
n done in my git workspace, the&nbsp;changes as below:</div><div><br></div>=
<div>V1-&gt;V2 add Thomas=E2=80=99s comment, fix mistake</div><div><br></di=
v><div><br></div><div>Testing done in my local setup</div><div><br></div><d=
iv>The at91bootstrap can be downloaded and compiled &nbsp;successfully in a=
 private SVN server.</div><div><br></div><div><br><br><br>Thanks and Best r=
egards,</div><div>Xiangyu<br><br><p class=3D"yahoo-quoted-begin" style=3D"f=
ont-size: 15px; color: #715FFA; padding-top: 15px; margin-top: 0">=E6=98=9F=
=E6=9C=9F=E4=B8=80, =E5=8D=81=E6=9C=88 25, 2021, 10:22 =E4=B8=8A=E5=8D=88 =
=E4=BA=8E CHEN Xiangyu &lt;xiangyu.chen@aol.com&gt;=E5=86=99=E9=81=93=EF=BC=
=9A</p><blockquote class=3D"iosymail"><div dir=3D"ltr">Since more and more =
traditional companies are starting using buildroot<br clear=3D"none">with A=
T91SAM9x chipset as their product firmware, much of them are still<br clear=
=3D"none">using SVN as their version control system. So add svn repository =
method<br clear=3D"none">to AT91bootstrap3 package.<br clear=3D"none"><br c=
lear=3D"none">Signed-off-by: CHEN Xiangyu &lt;<a shape=3D"rect" ymailto=3D"=
mailto:xiangyu.chen@aol.com" href=3D"mailto:xiangyu.chen@aol.com">xiangyu.c=
hen@aol.com</a>&gt;<br clear=3D"none">---<br clear=3D"none"> boot/at91boots=
trap3/Config.in&nbsp; &nbsp; &nbsp; &nbsp;  | 12 +++++++++---<br clear=3D"n=
one"> boot/at91bootstrap3/at91bootstrap3.mk |&nbsp; 4 ++++<br clear=3D"none=
"> 2 files changed, 13 insertions(+), 3 deletions(-)<br clear=3D"none"><br =
clear=3D"none">diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootst=
rap3/Config.in<br clear=3D"none">index 650d3a23c8..b3e18fce7c 100644<br cle=
ar=3D"none">--- a/boot/at91bootstrap3/Config.in<br clear=3D"none">+++ b/boo=
t/at91bootstrap3/Config.in<br clear=3D"none">@@ -30,6 +30,12 @@ config BR2_=
TARGET_AT91BOOTSTRAP3_CUSTOM_GIT<br clear=3D"none"> &nbsp;&nbsp;&nbsp; &nbs=
p; This option allows Buildroot to get the AT91 Bootstrap 3<br clear=3D"non=
e"> &nbsp;&nbsp;&nbsp; &nbsp; source code from a Git repository.<br clear=
=3D"none"> <br clear=3D"none">+config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN<=
br clear=3D"none">+&nbsp;&nbsp;&nbsp; bool "Custom SVN repository"<br clear=
=3D"none">+&nbsp;&nbsp;&nbsp; help<br clear=3D"none">+&nbsp;&nbsp;&nbsp; &n=
bsp; This option allows Buildroot to get the AT91 Bootstrap 3<br clear=3D"n=
one">+&nbsp;&nbsp;&nbsp; &nbsp; source code from a Subversion repository<br=
 clear=3D"none">+<br clear=3D"none"> config BR2_TARGET_AT91BOOTSTRAP3_CUSTO=
M_TARBALL<br clear=3D"none"> &nbsp;&nbsp;&nbsp; bool "Custom tarball"<br cl=
ear=3D"none"> <br clear=3D"none">@@ -39,7 +45,7 @@ config BR2_TARGET_AT91BO=
OTSTRAP3_CUSTOM_TARBALL_LOCATION<br clear=3D"none"> &nbsp;&nbsp;&nbsp; stri=
ng "URL of custom AT91Bootstrap tarball"<br clear=3D"none"> &nbsp;&nbsp;&nb=
sp; depends on BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL<br clear=3D"none"> =
<br clear=3D"none">-if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT<br clear=3D"non=
e">+if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT || BR2_TARGET_AT91BOOTSTRAP3_CU=
STOM_SVN<br clear=3D"none"> <br clear=3D"none"> config BR2_TARGET_AT91BOOTS=
TRAP3_CUSTOM_REPO_URL<br clear=3D"none"> &nbsp;&nbsp;&nbsp; string "URL of =
custom repository"<br clear=3D"none">@@ -47,7 +53,7 @@ config BR2_TARGET_AT=
91BOOTSTRAP3_CUSTOM_REPO_URL<br clear=3D"none"> config BR2_TARGET_AT91BOOTS=
TRAP3_CUSTOM_REPO_VERSION<br clear=3D"none"> &nbsp;&nbsp;&nbsp; string "Cus=
tom repository version"<br clear=3D"none"> &nbsp;&nbsp;&nbsp; help<br clear=
=3D"none">-&nbsp;&nbsp;&nbsp; &nbsp; Revision to use in the typical format =
used by Git<br clear=3D"none">+&nbsp;&nbsp;&nbsp; &nbsp; Revision to use in=
 the typical format used by Git or SVN<br clear=3D"none"> &nbsp;&nbsp;&nbsp=
; &nbsp; E.G. a sha id, a tag, branch, ..<br clear=3D"none"> <br clear=3D"n=
one"> endif<br clear=3D"none">@@ -57,7 +63,7 @@ config BR2_TARGET_AT91BOOTS=
TRAP3_VERSION<br clear=3D"none"> &nbsp;&nbsp;&nbsp; default "v4.0.0" if BR2=
_TARGET_AT91BOOTSTRAP3_LATEST_VERSION<br clear=3D"none"> &nbsp;&nbsp;&nbsp;=
 default "v3.10.3" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X<br clear=
=3D"none"> &nbsp;&nbsp;&nbsp; default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO=
_VERSION \<br clear=3D"none">-&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; if BR2_=
TARGET_AT91BOOTSTRAP3_CUSTOM_GIT<br clear=3D"none">+&nbsp;&nbsp;&nbsp; &nbs=
p;&nbsp;&nbsp; if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT || BR2_TARGET_AT91BO=
OTSTRAP3_CUSTOM_SVN<br clear=3D"none"> &nbsp;&nbsp;&nbsp; default "custom"&=
nbsp;&nbsp;&nbsp; if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL<br clear=3D"n=
one"> <br clear=3D"none"> config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_PATCH_DIR=
<br clear=3D"none">diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boo=
t/at91bootstrap3/at91bootstrap3.mk<br clear=3D"none">index 1e2a3a44b0..4bbe=
7cc718 100644<br clear=3D"none">--- a/boot/at91bootstrap3/at91bootstrap3.mk=
<br clear=3D"none">+++ b/boot/at91bootstrap3/at91bootstrap3.mk<br clear=3D"=
none">@@ -15,6 +15,10 @@ else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT)=
,y)<br clear=3D"none"> AT91BOOTSTRAP3_SITE =3D $(call qstrip,$(BR2_TARGET_A=
T91BOOTSTRAP3_CUSTOM_REPO_URL))<br clear=3D"none"> AT91BOOTSTRAP3_SITE_METH=
OD =3D git<br clear=3D"none"> BR_NO_CHECK_HASH_FOR +=3D $(AT91BOOTSTRAP3_SO=
URCE)<br clear=3D"none">+else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN)=
,y)<br clear=3D"none">+AT91BOOTSTRAP3_SITE =3D $(call qstrip,$(BR2_TARGET_A=
T91BOOTSTRAP3_CUSTOM_REPO_URL))<br clear=3D"none">+AT91BOOTSTRAP3_SITE_METH=
OD =3D svn<br clear=3D"none">+BR_NO_CHECK_HASH_FOR +=3D $(AT91BOOTSTRAP3_SO=
URCE)<br clear=3D"none"> else<br clear=3D"none"> AT91BOOTSTRAP3_SITE =3D $(=
call github,linux4sam,at91bootstrap,$(AT91BOOTSTRAP3_VERSION))<br clear=3D"=
none"> endif<br clear=3D"none">-- <br clear=3D"none">2.13.1<div class=3D"yq=
t0530970009" id=3D"yqtfd55157"><br clear=3D"none"><br clear=3D"none"></div>=
</div><blockquote></blockquote></blockquote></div>
</body></html>
------=_Part_1210797_934670362.1635129536452--

--===============3318946371552019366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3318946371552019366==--
