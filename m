Return-Path: <SRS0=lBh3=OV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C53C433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 14:35:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 075FA61A50
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 14:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 075FA61A50
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC83684429;
	Fri,  1 Oct 2021 14:35:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t2mIQccqDpJ5; Fri,  1 Oct 2021 14:35:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 996A884438;
	Fri,  1 Oct 2021 14:35:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 203361BF424
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 14:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F07F843E0
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 14:35:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4qSOBwinbmKF for <buildroot@lists.busybox.net>;
 Fri,  1 Oct 2021 14:35:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sonic311-23.consmr.mail.gq1.yahoo.com
 (sonic311-23.consmr.mail.gq1.yahoo.com [98.137.65.204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D43FD84348
 for <buildroot@buildroot.org>; Fri,  1 Oct 2021 14:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1633098905; bh=bLudkZBQYuC8trurtkBpKpFGDxguIBrA+mCf1FgOeWA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=MIvETYHMaDj0fXrhLTQXii3vER4dfSNoR+EDEAU8fVm/KOJiwQaRpUI5Poiqf+18Bd1R/J+ygD2ImZGh3500oI5bEvdcC1gGgt6wParWVlEXPwRi2KU1JrB0FEtvevOGDWQl/qauShIq0l+jQEAoYVZgwnIHStAZfE+4XpUBJZyfYBISVd856kFSyg4CpV2EPguS6ouq7DsAYtxCMnQxEu+k4ynhEkyLugeIChONUJmYSqPWsFFO1b3oEWdCQysPTvALb0U5SI62Iv2SkCCDX7nBaBirGFMYrtBfb+MY90wXzwFh+6dGqLrnsPXZReOv2+u6+z7AEJzI41SaLcj0AQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1633098905; bh=GesLUDKRwDWKCDYJ/AcRDpgzw5gNFraLRK6dH/fqwv6=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=UJvjlAt7uWfSoIT/o3VFdp5MyXC1QhPT7/moLbpv/ii0LpAIPyw1WgOhufDlzigLqAcI5XAickqvxli6zceqlq2Jx1gNxoIrV0OTTVRyirvtTYOEuh7opkR8jywezrAp6mOOq6rU6OFEQKelsFHMcBIH74gc45YqAoM3ExDrHgAE4i16erDv/3IJTno6Wjxc1plVnVeDDoIOYC8ey4mEHom2WycD2ncnIpTwBH3AP1tQ3VbqYF1y4hrMYUeWtHyv+9/TXncWJV0lKl67tjPfqeXcv5YrLF+81w8isjtBoHwPHqXqqd6ESfS8b4b72oTKospnfO+W9P7reWlraQOnBw==
X-YMail-OSG: s2gYTLkVM1ljfCvMcitI_2Ul3oA.Nkf9ejub_G.D4neBDbgGqYJjnFPKsw3stk9
 1KhMwosThndNQLbFXCWB2h2M0wICVeH96hPRR84gwAWNPYwC916tSRMV88.OMddQFuD_2wykL_vg
 PIisG80yRsijhsLls48XJK5jVpMX6rIvprE4uJC2L59up42FPVH7kb7eJxjLoe8ayGrT5NaEqiKK
 VNvq1WC.t5aQD0VBCW4vFatKfezMPT1oCnw_.27ygcjn9BRPWk.2u3ipN08kvprdfdcdRPs5cZjm
 z7cSTOVeJXgi5TVejUQy.bOgTFrhod26cxzl6hkyLHtAywgV2jyPEK8O4RmaDmH36U6w67cwgZpv
 2042NIyFeKrwm8552ieQEs_sSBOF.s0n80zQmO28RBGk5onjR6K3v3YutGc7adHYMV8BdaWiG20G
 KMCLOvEFVes4LEiXiNoDoYrQavWNkly4IvS3mIEM8_JnH2YnfSjZ7HKb6tK1qC7meXvsPQa9nVbm
 yrotgFIMCWkBpkr8oWFu_xwGAc4_H_BZvkc6f9V1aqXVdvBuPSU8KcOCC0xlRwitVhHaQtZcyxbH
 jQqDui_lT9MMHsieW7MO2ULE6PtY1XrWISPg5i9FD5nddlrMuflce4FSQmlXq96ZPF.oEbRlsAC3
 S9UMxuv_BOlQZMOFf4hNqtEQbfP326KwRf21HG8SWr5020INDILu5JTYiLbYx4VIdCZz6ik0j83H
 x90li7OgqsxzuF6goLt64ve69NeZWF.cMot9vY2F2H9G_NyGNWT9NBDjRQhT_0B2I7mLJ1uHr4aB
 mPiUakvdeSgNtt9IQx9Uyc2AJiwo9uF1Cs9P.xv4Sm4GnFJ68kvZVTrbAqsVMqJe7NeXMq430tb_
 rGm_gD4V9igeyePNMLO2IWDl.6dXCyFLGFwTEug3vlUbhnK0dBxlh1wFJtnMmwknWDncKG9t4XUk
 hnnzxHeftOvra5roRTb_Nk9wXqMNDl8IRe0dx9oZbqWkLhYhAB8a9tlhLkF41z.fFzbUqRNflv3W
 HO2MNpSmqLQksjwVGq1v0d0YGOydX_aeJwqG4JXMMfQ3qZg7JBcdOcTDxR_kYt6cbLN9K5DjEKMK
 iQMyYtoEnQzGqrSLaRKQ_kMG6kg07dQwBKuehK7.QMcadbZY1zeoYl10FUIo3tkWNwOb0nzXosmN
 asyCCdzklQQauAZBZumXXKtiORWviY0CYD9UQwxHm0dZicpi_piZw4g8dgS5keyQmiSXE3yAyibD
 U.tbfa_QFpJeFVvGMEebqaono7hBpp07ggpeJ6vL4jvwI2IPc5zuL7NbcUsljulYDTXEimKsB5cD
 rKFE89Bbloj3dE1rzmFdAA_TSgjwp0z8NtJy20gfrlzl4n9mHn_Erip.D6PSCsFAqvSAeXjfev7K
 pY9h4LwePUG2mQAVRkoPqrrqWs1Q4DjDvIfStXh6rQULJ7WQYUvYwerf.cheOSwc9XrWBopNofsV
 awFSAVyuFXCgjuomCf7MzwFMq2P4QPOJs8PdKi0LANSyQe7p.2FVH7udoTC.oX2FyWnwy2L5tDrt
 KYmT5YniCf2.Y3HLDZ3TJBKFT4EP6v.D874kYc21phezio0P1Xrqj5Q92.VB3XGaJBmPG7tBXGnz
 ag54TtX3lFWTVU5rBYFp9esbGc2._yQSRztkIPcsPjLHDJEiQtrWHJEtgR9.8HtqOfRr_M_bWS_J
 lzkMekimCQihMayEj43mRi9mShUI8n0PwmqJ544w6rNovgNElaaWh2FZ.LlUh5G5d0gbBwr6LTqy
 9RHerVZas5hDo._Zo0pycQG.4JkqfTDEqCkLQXIgrXymZ5HcfnCKFU4sS6KubsNeQb3f2YfvOFu9
 mw.cvrRtlk37P4RsHyRugJLh4nee6JEGxKwh6YjHWYf0j5v8K7csGUgLeBnBcZr0rLbjL6cPTEfr
 VDeidxYtpOz44taQMB3OomhOqNZ4TgfV70m_Z6VsEgeyjdhc9ldATAct0q0NEY725VB6aCn0czrn
 T4WKQONN5XW9d1BJPRk7hM0t__9X98uCKdqLorvQi44pU5xEXbS8l38uzNVFuuuUO8fOJZeHs37f
 TXZDGwVMurAVAAAu33c3MgKuG4z2kG6GKC2Fu2unHsytBeg1H0S5BHQVnrB8_9EghyBQY6M4H7gi
 4hfOeK0ek0kN4ZAG..9W8qjXUsU2FFT6_zGjGtz87T4iQ63_OFh.wyd1R3BfipSnWNvsbbnwCs10
 wtv6k9rDypPM1VhlTeqDtEstc9vkBvDkbyLuRx.9uZ.k-
X-Sonic-MF: <tallubko@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic311.consmr.mail.gq1.yahoo.com with HTTP; Fri, 1 Oct 2021 14:35:05 +0000
Date: Fri, 1 Oct 2021 14:35:03 +0000 (UTC)
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <212347867.858114.1633098903235@mail.yahoo.com>
In-Reply-To: <20211001015433.11176-1-tallubko@yahoo.com>
References: <20211001015433.11176-1-tallubko.ref@yahoo.com>
 <20211001015433.11176-1-tallubko@yahoo.com>
MIME-Version: 1.0
X-Mailer: WebService/1.1.19076 YMailNorrin
Subject: Re: [Buildroot] [PATCH 1/1] package/chipsec: new package
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
From: Tal Lubko via buildroot <buildroot@buildroot.org>
Reply-To: Tal Lubko <tallubko@yahoo.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============4808680569135577606=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4808680569135577606==
Content-Type: multipart/alternative; 
	boundary="----=_Part_858113_704319023.1633098903231"

------=_Part_858113_704319023.1633098903231
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

 Hi
I've submitted a patch which adds new package - chipsec, which=C2=A0is a fr=
amework for analyzing the security of PC platforms.
I haven't got a reply for this patch so I've got a feeling I've done someth=
ing wrong.Have I?
Thanks,Tal
    On Friday, October 1, 2021, 04:54:58 AM GMT+3, Tal Lubko via buildroot =
<buildroot@buildroot.org> wrote: =20
=20
 Signed-off-by: Tal Lubko <tallubko@yahoo.com>
---
 package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +
 ...ed-modules-instead-of-source-modules.patch | 27 +++++++++++++++++++
 package/chipsec/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 19 +++++++++++++
 package/chipsec/chipsec.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 3 +++
 package/chipsec/chipsec.mk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 23 ++++++++++++++++
 5 files changed, 73 insertions(+)
 create mode 100644 package/chipsec/0001-search-for-compiled-modules-instea=
d-of-source-modules.patch
 create mode 100644 package/chipsec/Config.in
 create mode 100644 package/chipsec/chipsec.hash
 create mode 100644 package/chipsec/chipsec.mk

diff --git a/package/Config.in b/package/Config.in
index 2f83c87582..ce73e2db72 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2010,6 +2010,7 @@ endif
 endmenu
=20
 menu "Security"
+=C2=A0=C2=A0=C2=A0 source "package/chipsec/Config.in"
 =C2=A0=C2=A0=C2=A0 source "package/libapparmor/Config.in"
 =C2=A0=C2=A0=C2=A0 source "package/libselinux/Config.in"
 =C2=A0=C2=A0=C2=A0 source "package/libsemanage/Config.in"
diff --git a/package/chipsec/0001-search-for-compiled-modules-instead-of-so=
urce-modules.patch b/package/chipsec/0001-search-for-compiled-modules-inste=
ad-of-source-modules.patch
new file mode 100644
index 0000000000..08a87bf3cc
--- /dev/null
+++ b/package/chipsec/0001-search-for-compiled-modules-instead-of-source-mo=
dules.patch
@@ -0,0 +1,27 @@
+From fd67e6878daec7abeef649bb687464c832a04ee6 Mon Sep 17 00:00:00 2001
+From: Tal Lubko <tallubko@yahoo.com>
+Date: Wed, 22 Sep 2021 15:50:46 +0300
+Subject: [PATCH] search for compiled modules instead of source code module=
s
+
+change chipsec_main to search for compiled modules (PYCs) instead of
+source code modules (PYs).
+---
+ chipsec_main.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/chipsec_main.py b/chipsec_main.py
+index 1aa46ea..11cf9c6 100755
+--- a/chipsec_main.py
++++ b/chipsec_main.py
+@@ -215,7 +215,7 @@ class ChipsecMain:
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while len(subdirs)=
 > 0:
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subd=
irs.pop()
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for modx in mod_fnames:
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if fnmatch.fnmatc=
h( modx, '*.py' ) and not fnmatch.fnmatch( modx, '__init__.py' ):
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if fnmatch.fnmatc=
h( modx, '*.pyc' ) and not fnmatch.fnmatch( modx, '__init__.pyc' ):
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self=
.load_module( os.path.join( dirname, modx ), self._module_argv )
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.Loaded_Modules.sort()
+=20
+--=20
+2.17.1
+
diff --git a/package/chipsec/Config.in b/package/chipsec/Config.in
new file mode 100644
index 0000000000..3da41c14a6
--- /dev/null
+++ b/package/chipsec/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_CHIPSEC
+=C2=A0=C2=A0=C2=A0 bool "chipsec"
+=C2=A0=C2=A0=C2=A0 depends on BR2_LINUX_KERNEL
+=C2=A0=C2=A0=C2=A0 depends on BR2_PACKAGE_PYTHON3
+=C2=A0=C2=A0=C2=A0 depends on BR2_i386 || BR2_x86_64
+=C2=A0=C2=A0=C2=A0 select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+
+=C2=A0=C2=A0=C2=A0 help
+=C2=A0=C2=A0=C2=A0 =C2=A0 CHIPSEC is a framework for analyzing the securit=
y of PC
+=C2=A0=C2=A0=C2=A0 =C2=A0 platforms including hardware, system firmware (B=
IOS/UEFI),
+=C2=A0=C2=A0=C2=A0 =C2=A0 and platform components.=20
+
+=C2=A0=C2=A0=C2=A0 =C2=A0 https://github.com/chipsec/chipsec
+
+comment "chipsec needs a Linux kernel to be built"
+=C2=A0=C2=A0=C2=A0 depends on !BR2_LINUX_KERNEL
+
+comment "chipsec depends on python3"
+=C2=A0=C2=A0=C2=A0 depends on !BR2_PACKAGE_PYTHON3
diff --git a/package/chipsec/chipsec.hash b/package/chipsec/chipsec.hash
new file mode 100644
index 0000000000..344eb4fab8
--- /dev/null
+++ b/package/chipsec/chipsec.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 0470326e00f66c91d751e9827d9e0050e3e4ac5b2bc7a9943a76381beda58162=C2=
=A0 chipsec-1.7.1.tar.gz
+sha256 4c2ca80f4d3675a53a216a64d67e7b411a81a6e958defd248c6f1ecf44dc6607=C2=
=A0 COPYING
diff --git a/package/chipsec/chipsec.mk b/package/chipsec/chipsec.mk
new file mode 100644
index 0000000000..96d96176cc
--- /dev/null
+++ b/package/chipsec/chipsec.mk
@@ -0,0 +1,23 @@
+##########################################################################=
######
+#
+# chipsec
+#
+##########################################################################=
######
+
+CHIPSEC_VERSION =3D 1.7.1
+CHIPSEC_SITE =3D $(call github,chipsec,chipsec,$(CHIPSEC_VERSION))
+CHIPSEC_SETUP_TYPE =3D setuptools
+CHIPSEC_LICENSE =3D GPL-2.0
+CHIPSEC_LICENSE_FILES =3D LICENSE
+CHIPSEC_DEPENDENCIES =3D linux
+CHIPSEC_ENV =3D KSRC=3D$(LINUX_DIR)
+CHIPSEC_BUILD_OPTS =3D build_ext -i
+
+CHIPSEC_POST_INSTALL_TARGET_HOOKS +=3D CHIPSEC_INSTALL_LKM
+
+define CHIPSEC_INSTALL_LKM
+=C2=A0=C2=A0=C2=A0 $(INSTALL) -m 0644 -D $(@D)/chipsec/helper/linux/chipse=
c.ko \
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 $(TARGET_DIR)/usr/lib/python$(PYTHON=
3_VERSION_MAJOR)/site-packages/chipsec/helper/linux
+endef
+
+$(eval $(python-package))
--=20
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
 =20
------=_Part_858113_704319023.1633098903231
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp6b6ba309yahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div></div>
        <div dir=3D"ltr" data-setdir=3D"false">Hi</div><div dir=3D"ltr" dat=
a-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">I've su=
bmitted a patch which adds new package - chipsec, which&nbsp;<span>is a fra=
mework for analyzing the security of PC platforms.</span></div><div dir=3D"=
ltr" data-setdir=3D"false"><span><br></span></div><div dir=3D"ltr" data-set=
dir=3D"false">I haven't got a reply for this patch so I've got a feeling I'=
ve done something wrong.</div><div dir=3D"ltr" data-setdir=3D"false">Have I=
?</div><div dir=3D"ltr" data-setdir=3D"false"><br></div><div dir=3D"ltr" da=
ta-setdir=3D"false">Thanks,</div><div dir=3D"ltr" data-setdir=3D"false">Tal=
</div><div><br></div>
       =20
        </div><div id=3D"ydpd9464f3yahoo_quoted_3221068671" class=3D"ydpd94=
64f3yahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Friday, October 1, 2021, 04:54:58 AM GMT+3, Tal Lubk=
o via buildroot &lt;buildroot@buildroot.org&gt; wrote:
                </div>
                <div><br></div>
                <div><br></div>
                <div><div dir=3D"ltr">Signed-off-by: Tal Lubko &lt;<a href=
=3D"mailto:tallubko@yahoo.com" rel=3D"nofollow" target=3D"_blank">tallubko@=
yahoo.com</a>&gt;<br></div><div dir=3D"ltr">---<br></div><div dir=3D"ltr"> =
package/Config.in&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  |&nbsp; 1 +<br></div><div dir=3D"l=
tr"> ...ed-modules-instead-of-source-modules.patch | 27 +++++++++++++++++++=
<br></div><div dir=3D"ltr"> package/chipsec/Config.in&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  | 19 +++++++++++++<br></di=
v><div dir=3D"ltr"> package/chipsec/chipsec.hash&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 3 +++<br></div><div dir=3D"ltr"=
> package/chipsec/chipsec.mk&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; | 23 ++++++++++++++++<br></div><div dir=3D"ltr"> 5 f=
iles changed, 73 insertions(+)<br></div><div dir=3D"ltr"> create mode 10064=
4 package/chipsec/0001-search-for-compiled-modules-instead-of-source-module=
s.patch<br></div><div dir=3D"ltr"> create mode 100644 package/chipsec/Confi=
g.in<br></div><div dir=3D"ltr"> create mode 100644 package/chipsec/chipsec.=
hash<br></div><div dir=3D"ltr"> create mode 100644 package/chipsec/chipsec.=
mk<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">diff --git a/packag=
e/Config.in b/package/Config.in<br></div><div dir=3D"ltr">index 2f83c87582.=
.ce73e2db72 100644<br></div><div dir=3D"ltr">--- a/package/Config.in<br></d=
iv><div dir=3D"ltr">+++ b/package/Config.in<br></div><div dir=3D"ltr">@@ -2=
010,6 +2010,7 @@ endif<br></div><div dir=3D"ltr"> endmenu<br></div><div dir=
=3D"ltr"> <br></div><div dir=3D"ltr"> menu "Security"<br></div><div dir=3D"=
ltr">+&nbsp;&nbsp;&nbsp; source "package/chipsec/Config.in"<br></div><div d=
ir=3D"ltr"> &nbsp;&nbsp;&nbsp; source "package/libapparmor/Config.in"<br></=
div><div dir=3D"ltr"> &nbsp;&nbsp;&nbsp; source "package/libselinux/Config.=
in"<br></div><div dir=3D"ltr"> &nbsp;&nbsp;&nbsp; source "package/libsemana=
ge/Config.in"<br></div><div dir=3D"ltr">diff --git a/package/chipsec/0001-s=
earch-for-compiled-modules-instead-of-source-modules.patch b/package/chipse=
c/0001-search-for-compiled-modules-instead-of-source-modules.patch<br></div=
><div dir=3D"ltr">new file mode 100644<br></div><div dir=3D"ltr">index 0000=
000000..08a87bf3cc<br></div><div dir=3D"ltr">--- /dev/null<br></div><div di=
r=3D"ltr">+++ b/package/chipsec/0001-search-for-compiled-modules-instead-of=
-source-modules.patch<br></div><div dir=3D"ltr">@@ -0,0 +1,27 @@<br></div><=
div dir=3D"ltr">+From fd67e6878daec7abeef649bb687464c832a04ee6 Mon Sep 17 0=
0:00:00 2001<br></div><div dir=3D"ltr">+From: Tal Lubko &lt;<a href=3D"mail=
to:tallubko@yahoo.com" rel=3D"nofollow" target=3D"_blank">tallubko@yahoo.co=
m</a>&gt;<br></div><div dir=3D"ltr">+Date: Wed, 22 Sep 2021 15:50:46 +0300<=
br></div><div dir=3D"ltr">+Subject: [PATCH] search for compiled modules ins=
tead of source code modules<br></div><div dir=3D"ltr">+<br></div><div dir=
=3D"ltr">+change chipsec_main to search for compiled modules (PYCs) instead=
 of<br></div><div dir=3D"ltr">+source code modules (PYs).<br></div><div dir=
=3D"ltr">+---<br></div><div dir=3D"ltr">+ chipsec_main.py | 2 +-<br></div><=
div dir=3D"ltr">+ 1 file changed, 1 insertion(+), 1 deletion(-)<br></div><d=
iv dir=3D"ltr">+<br></div><div dir=3D"ltr">+diff --git a/chipsec_main.py b/=
chipsec_main.py<br></div><div dir=3D"ltr">+index 1aa46ea..11cf9c6 100755<br=
></div><div dir=3D"ltr">+--- a/chipsec_main.py<br></div><div dir=3D"ltr">++=
++ b/chipsec_main.py<br></div><div dir=3D"ltr">+@@ -215,7 +215,7 @@ class C=
hipsecMain:<br></div><div dir=3D"ltr">+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;  while len(subdirs) &gt; 0:<br></div><div dir=3D"ltr">+=
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  subd=
irs.pop()<br></div><div dir=3D"ltr">+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;  for modx in mod_fnames:<br></div><div dir=3D"ltr">+-&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if fnmatch.fnmatch( modx, '*.py' ) an=
d not fnmatch.fnmatch( modx, '__init__.py' ):<br></div><div dir=3D"ltr">++&=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if fnmatch.fnmatch( =
modx, '*.pyc' ) and not fnmatch.fnmatch( modx, '__init__.pyc' ):<br></div><=
div dir=3D"ltr">+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;  self.load_module( os.path.join( dirname, modx ), self._module_=
argv )<br></div><div dir=3D"ltr">+&nbsp; &nbsp; &nbsp; &nbsp;  self.Loaded_=
Modules.sort()<br></div><div dir=3D"ltr">+ <br></div><div dir=3D"ltr">+-- <=
br></div><div dir=3D"ltr">+2.17.1<br></div><div dir=3D"ltr">+<br></div><div=
 dir=3D"ltr">diff --git a/package/chipsec/Config.in b/package/chipsec/Confi=
g.in<br></div><div dir=3D"ltr">new file mode 100644<br></div><div dir=3D"lt=
r">index 0000000000..3da41c14a6<br></div><div dir=3D"ltr">--- /dev/null<br>=
</div><div dir=3D"ltr">+++ b/package/chipsec/Config.in<br></div><div dir=3D=
"ltr">@@ -0,0 +1,19 @@<br></div><div dir=3D"ltr">+config BR2_PACKAGE_CHIPSE=
C<br></div><div dir=3D"ltr">+&nbsp;&nbsp;&nbsp; bool "chipsec"<br></div><di=
v dir=3D"ltr">+&nbsp;&nbsp;&nbsp; depends on BR2_LINUX_KERNEL<br></div><div=
 dir=3D"ltr">+&nbsp;&nbsp;&nbsp; depends on BR2_PACKAGE_PYTHON3<br></div><d=
iv dir=3D"ltr">+&nbsp;&nbsp;&nbsp; depends on BR2_i386 || BR2_x86_64<br></d=
iv><div dir=3D"ltr">+&nbsp;&nbsp;&nbsp; select BR2_PACKAGE_PYTHON_SETUPTOOL=
S # runtime<br></div><div dir=3D"ltr">+<br></div><div dir=3D"ltr">+&nbsp;&n=
bsp;&nbsp; help<br></div><div dir=3D"ltr">+&nbsp;&nbsp;&nbsp; &nbsp; CHIPSE=
C is a framework for analyzing the security of PC<br></div><div dir=3D"ltr"=
>+&nbsp;&nbsp;&nbsp; &nbsp; platforms including hardware, system firmware (=
BIOS/UEFI),<br></div><div dir=3D"ltr">+&nbsp;&nbsp;&nbsp; &nbsp; and platfo=
rm components. <br></div><div dir=3D"ltr">+<br></div><div dir=3D"ltr">+&nbs=
p;&nbsp;&nbsp; &nbsp; <a href=3D"https://github.com/chipsec/chipsec" rel=3D=
"nofollow" target=3D"_blank">https://github.com/chipsec/chipsec</a><br></di=
v><div dir=3D"ltr">+<br></div><div dir=3D"ltr">+comment "chipsec needs a Li=
nux kernel to be built"<br></div><div dir=3D"ltr">+&nbsp;&nbsp;&nbsp; depen=
ds on !BR2_LINUX_KERNEL<br></div><div dir=3D"ltr">+<br></div><div dir=3D"lt=
r">+comment "chipsec depends on python3"<br></div><div dir=3D"ltr">+&nbsp;&=
nbsp;&nbsp; depends on !BR2_PACKAGE_PYTHON3<br></div><div dir=3D"ltr">diff =
--git a/package/chipsec/chipsec.hash b/package/chipsec/chipsec.hash<br></di=
v><div dir=3D"ltr">new file mode 100644<br></div><div dir=3D"ltr">index 000=
0000000..344eb4fab8<br></div><div dir=3D"ltr">--- /dev/null<br></div><div d=
ir=3D"ltr">+++ b/package/chipsec/chipsec.hash<br></div><div dir=3D"ltr">@@ =
-0,0 +1,3 @@<br></div><div dir=3D"ltr">+# Locally calculated<br></div><div =
dir=3D"ltr">+sha256 0470326e00f66c91d751e9827d9e0050e3e4ac5b2bc7a9943a76381=
beda58162&nbsp; chipsec-1.7.1.tar.gz<br></div><div dir=3D"ltr">+sha256 4c2c=
a80f4d3675a53a216a64d67e7b411a81a6e958defd248c6f1ecf44dc6607&nbsp; COPYING<=
br></div><div dir=3D"ltr">diff --git a/package/chipsec/chipsec.mk b/package=
/chipsec/chipsec.mk<br></div><div dir=3D"ltr">new file mode 100644<br></div=
><div dir=3D"ltr">index 0000000000..96d96176cc<br></div><div dir=3D"ltr">--=
- /dev/null<br></div><div dir=3D"ltr">+++ b/package/chipsec/chipsec.mk<br><=
/div><div dir=3D"ltr">@@ -0,0 +1,23 @@<br></div><div dir=3D"ltr">+#########=
#######################################################################<br>=
</div><div dir=3D"ltr">+#<br></div><div dir=3D"ltr">+# chipsec<br></div><di=
v dir=3D"ltr">+#<br></div><div dir=3D"ltr">+###############################=
#################################################<br></div><div dir=3D"ltr"=
>+<br></div><div dir=3D"ltr">+CHIPSEC_VERSION =3D 1.7.1<br></div><div dir=
=3D"ltr">+CHIPSEC_SITE =3D $(call github,chipsec,chipsec,$(CHIPSEC_VERSION)=
)<br></div><div dir=3D"ltr">+CHIPSEC_SETUP_TYPE =3D setuptools<br></div><di=
v dir=3D"ltr">+CHIPSEC_LICENSE =3D GPL-2.0<br></div><div dir=3D"ltr">+CHIPS=
EC_LICENSE_FILES =3D LICENSE<br></div><div dir=3D"ltr">+CHIPSEC_DEPENDENCIE=
S =3D linux<br></div><div dir=3D"ltr">+CHIPSEC_ENV =3D KSRC=3D$(LINUX_DIR)<=
br></div><div dir=3D"ltr">+CHIPSEC_BUILD_OPTS =3D build_ext -i<br></div><di=
v dir=3D"ltr">+<br></div><div dir=3D"ltr">+CHIPSEC_POST_INSTALL_TARGET_HOOK=
S +=3D CHIPSEC_INSTALL_LKM<br></div><div dir=3D"ltr">+<br></div><div dir=3D=
"ltr">+define CHIPSEC_INSTALL_LKM<br></div><div dir=3D"ltr">+&nbsp;&nbsp;&n=
bsp; $(INSTALL) -m 0644 -D $(@D)/chipsec/helper/linux/chipsec.ko \<br></div=
><div dir=3D"ltr">+&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; $(TARGET_DIR)/usr/=
lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/chipsec/helper/linux<br></=
div><div dir=3D"ltr">+endef<br></div><div dir=3D"ltr">+<br></div><div dir=
=3D"ltr">+$(eval $(python-package))<br></div><div dir=3D"ltr">-- <br></div>=
<div dir=3D"ltr">2.17.1<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr=
">_______________________________________________<br></div><div dir=3D"ltr"=
>buildroot mailing list<br></div><div dir=3D"ltr"><a href=3D"mailto:buildro=
ot@buildroot.org" rel=3D"nofollow" target=3D"_blank">buildroot@buildroot.or=
g</a><br></div><div dir=3D"ltr"><a href=3D"https://lists.buildroot.org/mail=
man/listinfo/buildroot" rel=3D"nofollow" target=3D"_blank">https://lists.bu=
ildroot.org/mailman/listinfo/buildroot</a><br></div></div>
            </div>
        </div></body></html>
------=_Part_858113_704319023.1633098903231--

--===============4808680569135577606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4808680569135577606==--
