Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E528C433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 17:39:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2511260FDA
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 17:39:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2511260FDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E10E1605FD;
	Sun, 14 Nov 2021 17:39:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XGLBMhLnyU4H; Sun, 14 Nov 2021 17:39:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE2D160667;
	Sun, 14 Nov 2021 17:39:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1EA111BF2BA
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 17:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A12F60667
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 17:39:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xcey198QBrFu for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 17:39:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sonic303-24.consmr.mail.gq1.yahoo.com
 (sonic303-24.consmr.mail.gq1.yahoo.com [98.137.64.205])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E02FA605FD
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 17:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1636911551; bh=B8AdP+0flkTi2TwN2a8uPC9Dg443DSySEA/UV10JATg=;
 h=Date:From:To:Cc:Subject:References:From:Subject:Reply-To;
 b=i4jNBSnlR6bDDEop28MB+D1y/+Xyy7qIILHBoBZWHNmXYTP4H1yXipIqbpl/SMBecFzBiID69GhnSJgzE8cECrV9ay6Ua+RWwXf0Lt8ZiLRNC8KQ0fX4eQNGgtpIR+k7HSJSbu4ztXH+d8g0QHDQiJNm8iK+he8lKDTjPGRhSEJ+sNvvv4t9JUecPecLKkHwGeuL7+qBqn/Ep+ds1VjrhRavUXAzpNf2lW/lX0d1c+i5oY3xQtPt2oEGo3r9Mw84020BmAnCFhv8TYE8XgRrzWmC6R0v7cqGPJl2xYXgJB9oiCnMb2R9F7BB+Ve/vl8bcV4WbVhCv+mnHgxKAg/NFw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1636911551; bh=h8WKkkMjnnTV4zkZqK3a/yFmJcQ/BVWuMnNMkno+6I1=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=unTfC+chqdXDvJizwQufY9A51Wn5TdtVnxn2vI6syMw/ZZRtAgsfl/n2TpAe5BQzZZVPWXtEO2/pVI2mtagtVqnHxDaSHlcseY2upJQhfQg250Q59xB3dn9QPS/Tvt7A5k62JdDAzBQu67/q28G6ICkQrCKJrB/xd2v9WILNhYYgK/TY5rlrMY4Y1+9ffjlf13VU+VOZI1pgGStuDnb7sLYgpUDKn4PV44oDjOalCA9Nu/POSym7lHrtvtWkpxTQGldJ1yjJhMoif0WfPO8dfhZTnH/L2TLIwMJwLZIK7Yg6sB8w7ZbmtgX6rEaH7TLxaVezxG2kn0g8dwSRyj+OyQ==
X-YMail-OSG: sYAUhWgVM1mZhCTNB87G5kIJop2XKubCnp4U6EB3E.j1b4_MpTc_k3aw2e4ddlf
 .KOj6uTCFIMPbMrCxA._yfAJoRToaKpMv8sca0BZuKUycI9Fbdu6pRR0EpDRzi6linHgsoZEqGm0
 hNig5CQ1SlGf_XdngBS9X7mVmDd8Dr.Fi7eR.cGr7r9b2Kg._zPinLBJFOls3aLhVeja96UzpmkD
 t7lESDT4Y18F0fmk2srS1jPZ9ENm5Pl.0goEGqHJ1m44BEsc6vf9dIa4LFQ2yvv0Nj9I8TlY5Fy5
 v99zM9I94vgbyk6a3xh3lH2G1zn9Gk4nsce91ebHTLLVYDv6sv1uu6V3KoSKXz9u4mjRjn0Tfi9a
 pjZ6HBPmm7yPt5ZV3xyoRnn0pwITvZEAEmx1iiTm43WAHPo8Z.jy.AspdDrcPnPL4cRtM4_fw3Da
 M7ysv0s9vq1.aPKBwbiN6NHzp6vj0kzshZobkEVH3iXcrcHbeNvSpTjCfvUt8w8eozBn0ReSaIap
 13NedfGek8XAugQVRNX_tCBQP4049Ol5_THbGPlIljRTI4xeQdu.xGn2mTI1nd8TsfjlXjk9KOdD
 _05tgOD.Y2y6FeF9sXh.PGBBPUoogy.ZaPqco15YEP3kogeQ_Kd47hgfTxypUWK7OJPDFj7RiyNe
 v8rclJEKKgk5Jn5kz2H0F_C1eZXQvpFLj7Fi4yCjGHHzDWdgUZNMt2PQR4HkujqViRy85LEdBh56
 TFUTtxk4lp_QLH_uzDCXQoP.W4HxtgM0A1T9TK7w9lVr2YFArFgOfD1G.EjG2HQrnHcMAKtsrIRs
 f3j4d2W5.Hh_ZL037td4ltxprgHkL7Rue1vYV.A0TBoKwYc0vGFYI.YtB3M5MnvQffsYtiG.Y7qf
 QDCrWQM0UQX7yu8W3e3scg2Kl1_vKjkXH1v0ohBVYIImQrzYC5H5GolowWpQz.UqSYX4U4m3AcN8
 PfBq9VZ_1Rncv4unB1GuXB6AIqI7T8mkifj_91p_y2oK4RLerZlkg6hugQFQMemANz8LBo53qC6r
 bJuHbjkRG6v9IJN95CVjnX4vJccEEqfZoZUM4vsVIZbCpnBS3e2AE.n5kwdl.JlTc.ufqbPVvf2M
 SO1irlVQUvBN13o3sVNYm9Oz8MHOyvDiAMiagRBURS.ZTnj7hcZXqA0JYj1hvex5JTMX0h9teyzw
 1IwAEBPczhsLgDesJ0.lHzCtr3xByBERVhyNWi0xUhrmJmYoKjiq_vsv68Bki4wug6WfSw_DOg9f
 aFiuznJofIPJDEwNE6_XeC_Bz2GT2VJ9pLQkOixgK1rNPRxuodcC.SDVb3zngLaI5Jpq3UHEmPo0
 yB5Cy9DVvD_0jElXYueSfjbR_Fze0WZKjA4pJaNaZ97E7IGD66aTO3jVM34gtDPP1X3BRlvmQijr
 E2f0JTT3_NJgFoXAnumEBbaPileU.KTssOBV74Zr49y5Hcet15y8tWbu7JhuQlndEP_CL2Mk_gfQ
 Wo60P9JWl2WPnQtSrHApiwqflBg_uKYbZFtmrAUJozaYAyMphHESj.FYRMKHUmGFk3_oSWdlPwdv
 S317IWyw78sqorX.CtuHqMXEmTO8ay4htGD4IMLEZ6uMj5tt5s6BFpce19s30_b1E8mSbITHmna6
 p4XH91GcB5xTPBqONVcKuTJ5FeBpa.7Seud0MNuPCVMvu9aa_HPbRe2QyfHLWJUDqwcIPOr_iji4
 zKbbCg7rKuxGtwP_4Sw_bjQlHL3devL4WQTnl4rwVWeKtTWDNmKVv_zapk1SMvPpIwYUcURpXb83
 L.yOa_ziNhKyBmwWwBx8oxq6tn6ghv7TYVSKZhzFeVAsqYPBMdgmuzZ1xy.FY3i4x8P6CGgY.ZBW
 T61QMYLcrEq62z6EJvu7Vw7WJYAUsUi3MQBxUpGxrjYeLB9f_UVxT6vaEKYY7DZ3zbuj87uMoQEJ
 M5oKgpzt_.Nbx0kzq32UDO._LeIB6nr40wMT_6ufLsr3XZSN1lG6LSTX_jMqQlcf7DIuZmVoKOY2
 B5WIQyddgP2o_PMTFXNaJgUJnSdXGcFsTXf10.g6C2x4Lu0LHAxp6UX3D79et9TnakDHlwksjI1m
 _GZoNXQvEmajXq9phCNAjVhYumxiuD91AIks9Ku03JV_aY7tm840iyWn_3YOWy6dXBMpX3uv_ygT
 P7Slsd_l.Ns2QMC0IoX8GCW8r8h43yL1GRlYvlck5oZtgK0ZqyIX8XUcqD937h.ba9AQNnRyljF6
 htU63y.wXH1C1
X-Sonic-MF: <tallubko@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic303.consmr.mail.gq1.yahoo.com with HTTP; Sun, 14 Nov 2021 17:39:11 +0000
Date: Sun, 14 Nov 2021 17:38:52 +0000 (UTC)
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <270071220.621934.1636911532409@mail.yahoo.com>
MIME-Version: 1.0
References: <270071220.621934.1636911532409.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.19306 YMailNorrin
Subject: [Buildroot] [PATCH v3 1/1] package/chipsec: new package
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
Cc: tal lubko <tallubko@yahoo.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============5756173366636481012=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5756173366636481012==
Content-Type: multipart/alternative; 
	boundary="----=_Part_621933_1141489193.1636911532404"

------=_Part_621933_1141489193.1636911532404
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

CHIPSEC is a framework for analyzing the security of PC platforms including=
 hardware, system firmware (BIOS/UEFI), and platform components.

Signed-off-by: Tal Lubko <tallubko@yahoo.com>
---=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 3 ++=C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +=
=C2=A0.../0001-extend-modules-search-add-pycs.patch | 16 ++++++++=C2=A0pack=
age/chipsec/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 37 +++++++++++++++++++=C2=A0package/chipsec/chips=
ec.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 3 ++=C2=A0package/chipsec/chipsec.mk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 28 ++++++++++++++=C2=A06 files changed=
, 88 insertions(+)=C2=A0create mode 100644 package/chipsec/0001-extend-modu=
les-search-add-pycs.patch=C2=A0create mode 100644 package/chipsec/Config.in=
=C2=A0create mode 100644 package/chipsec/chipsec.hash=C2=A0create mode 1006=
44 package/chipsec/chipsec.mk
diff --git a/DEVELOPERS b/DEVELOPERSindex 65240615b0..581eb3f272 100644--- =
a/DEVELOPERS+++ b/DEVELOPERS@@ -2599,6 +2599,9 @@ F: package/python-influxd=
b/=C2=A0N: Sven Oliver Moll <svolli@svolli.de>=C2=A0F: package/most/=C2=A0+=
N: Tal Lubko <tallubko@yahoo.com>+F: package/chipsec/+=C2=A0N: Theo Debrouw=
ere <t.debrouwere@televic.com>=C2=A0F: board/beagleboardx15/=C2=A0F: config=
s/beagleboardx15_defconfigdiff --git a/package/Config.in b/package/Config.i=
nindex c23755a421..6c683aaa86 100644--- a/package/Config.in+++ b/package/Co=
nfig.in@@ -2400,6 +2400,7 @@ endmenu=C2=A0menu "Security"=C2=A0 source "pac=
kage/apparmor/Config.in"=C2=A0 source "package/checkpolicy/Config.in"+ sour=
ce "package/chipsec/Config.in"=C2=A0 source "package/ima-evm-utils/Config.i=
n"=C2=A0 source "package/optee-benchmark/Config.in"=C2=A0 source "package/o=
ptee-client/Config.in"diff --git a/package/chipsec/0001-extend-modules-sear=
ch-add-pycs.patch b/package/chipsec/0001-extend-modules-search-add-pycs.pat=
chnew file mode 100644index 0000000000..3f783a109e--- /dev/null+++ b/packag=
e/chipsec/0001-extend-modules-search-add-pycs.patch@@ -0,0 +1,16 @@+diff --=
git a/chipsec_main.py b/chipsec_main.py+index 1aa46ea..5acb768 100755+--- a=
/chipsec_main.py++++ b/chipsec_main.py+@@ -215,8 +215,9 @@ class ChipsecMai=
n:+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while len(=
subdirs) > 0:+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0subdirs.pop()+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0for modx in mod_fnames:+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if fnmatch.fnmatch( modx, '*.py' ) and not fnmatch.fnmatch( m=
odx, '__init__.py' ):+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 self.load_module( os.path.join( dirname, modx ), self._mo=
dule_argv )++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((f=
nmatch.fnmatch( modx, '*.py' ) and not fnmatch.fnmatch( modx, '__init__.py'=
 )) or++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (fnmatch.fnmatch( modx, '*.pyc' ) and not fnmatch.fnmatch( modx, '__ini=
t__.pyc' ))):++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 self.load_module( os.path.join( dirname, modx ), s=
elf._module_argv )+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.Loaded_Modules.so=
rt()+=C2=A0+=C2=A0 =C2=A0 =C2=A0def load_my_modules(self):diff --git a/pack=
age/chipsec/Config.in b/package/chipsec/Config.innew file mode 100644index =
0000000000..839204301e--- /dev/null+++ b/package/chipsec/Config.in@@ -0,0 +=
1,37 @@+config BR2_PACKAGE_CHIPSEC+ bool "chipsec"+ depends on !BR2_PACKAGE=
_PYTHON # python3+ depends on BR2_USE_WCHAR # python3+ depends on BR2_TOOLC=
HAIN_HAS_THREADS # python3+ depends on BR2_USE_MMU # python3+ depends on !B=
R2_STATIC_LIBS # python3+ depends on BR2_i386 || BR2_x86_64 # supported onl=
y on x86/x86_64+ depends on BR2_LINUX_KERNEL+ select BR2_PACKAGE_PYTHON3++ =
help+ =C2=A0 CHIPSEC is a framework for analyzing the security of PC+ =C2=
=A0 platforms including hardware, system firmware (BIOS/UEFI),+ =C2=A0 and =
platform components.=C2=A0++ =C2=A0 https://github.com/chipsec/chipsec++com=
ment "chipsec needs a toolchain w/ wchar, threads, dynamic library"+ depend=
s on BR2_USE_MMU+ depends on BR2_i386 || BR2_x86_64+ depends on !BR2_USE_WC=
HAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS++comment "chipsec need=
s a Linux kernel to be built"+ depends on BR2_USE_MMU+ depends on BR2_i386 =
|| BR2_x86_64+ depends on !BR2_LINUX_KERNEL++comment "chipsec is not compat=
ible with python"+ depends on BR2_USE_MMU+ depends on BR2_i386 || BR2_x86_6=
4+ depends on BR2_PACKAGE_PYTHON++comment "chipsec depends on python3"+ dep=
ends on BR2_USE_MMU+ depends on BR2_i386 || BR2_x86_64+ depends on !BR2_PAC=
KAGE_PYTHON3diff --git a/package/chipsec/chipsec.hash b/package/chipsec/chi=
psec.hashnew file mode 100644index 0000000000..a1f38304d1--- /dev/null+++ b=
/package/chipsec/chipsec.hash@@ -0,0 +1,3 @@+# Locally calculated+sha256=C2=
=A0 b13ad6f3923b2a38e9574cf150d60e947783663abcf93fb3672c9b2de47b6f63=C2=A0 =
chipsec-1.7.3.tar.gz+sha256=C2=A0 4c2ca80f4d3675a53a216a64d67e7b411a81a6e95=
8defd248c6f1ecf44dc6607=C2=A0 COPYINGdiff --git a/package/chipsec/chipsec.m=
k b/package/chipsec/chipsec.mknew file mode 100644index 0000000000..e8b6b69=
a00--- /dev/null+++ b/package/chipsec/chipsec.mk@@ -0,0 +1,28 @@+##########=
######################################################################+#+# =
chipsec+#+#################################################################=
###############++CHIPSEC_VERSION =3D 1.7.3+CHIPSEC_SITE =3D $(call github,c=
hipsec,chipsec,v$(CHIPSEC_VERSION))+CHIPSEC_SETUP_TYPE =3D setuptools+CHIPS=
EC_LICENSE =3D GPL-2.0+CHIPSEC_LICENSE_FILES =3D LICENSE+CHIPSEC_DEPENDENCI=
ES =3D linux host-nasm++# needed in order to build chipsec's LKM against Bu=
ildroot's kernel+CHIPSEC_ENV =3D KSRC=3D$(LINUX_DIR)++# build command accor=
ding to chipsec's manual (chipsec-manual.pdf)+CHIPSEC_BUILD_OPTS =3D build_=
ext -i++define CHIPSEC_INSTALL_LKM+ # chipsec's scripts search chipsec.ko i=
n a non-standart location+ $(INSTALL) -m 0644 -D $(@D)/chipsec/helper/linux=
/chipsec.ko \+ $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-pa=
ckages/chipsec/helper/linux+endef++CHIPSEC_POST_INSTALL_TARGET_HOOKS +=3D C=
HIPSEC_INSTALL_LKM++$(eval $(python-package))--=C2=A02.17.1


------=_Part_621933_1141489193.1636911532404
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp81920e98yahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div><div><div dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helveti=
ca, Arial, sans-serif; font-size: 16px;" data-setdir=3D"false"><span>CHIPSE=
C is a framework for analyzing the security of PC platforms including hardw=
are, system firmware (BIOS/UEFI), and platform components.</span><br></div>=
<div dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica, Arial, sa=
ns-serif; font-size: 16px;" data-setdir=3D"false"><span><br></span></div><d=
iv dir=3D"ltr" style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans=
-serif; font-size: 16px;">Signed-off-by: Tal Lubko &lt;tallubko@yahoo.com&g=
t;<br></div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sa=
ns-serif; font-size: 16px;">---</div><div style=3D"font-family: Helvetica N=
eue, Helvetica, Arial, sans-serif; font-size: 16px;">&nbsp;DEVELOPERS&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 3 ++</div><div style=
=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 1=
6px;">&nbsp;package/Config.in&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 1 +</div>=
<div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; fo=
nt-size: 16px;">&nbsp;.../0001-extend-modules-search-add-pycs.patch | 16 ++=
++++++</div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sa=
ns-serif; font-size: 16px;">&nbsp;package/chipsec/Config.in&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 37 ++++++++++=
+++++++++</div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial,=
 sans-serif; font-size: 16px;">&nbsp;package/chipsec/chipsec.hash&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 3 ++</div><div=
 style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-s=
ize: 16px;">&nbsp;package/chipsec/chipsec.mk&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 28 ++++++++++++++</div><div style=
=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 1=
6px;">&nbsp;6 files changed, 88 insertions(+)</div><div style=3D"font-famil=
y: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">&nbsp;cr=
eate mode 100644 package/chipsec/0001-extend-modules-search-add-pycs.patch<=
/div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-seri=
f; font-size: 16px;">&nbsp;create mode 100644 package/chipsec/Config.in</di=
v><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; =
font-size: 16px;">&nbsp;create mode 100644 package/chipsec/chipsec.hash</di=
v><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; =
font-size: 16px;">&nbsp;create mode 100644 package/chipsec/chipsec.mk</div>=
<div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; fo=
nt-size: 16px;"><br></div><div style=3D"font-family: Helvetica Neue, Helvet=
ica, Arial, sans-serif; font-size: 16px;">diff --git a/DEVELOPERS b/DEVELOP=
ERS</div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-=
serif; font-size: 16px;">index 65240615b0..581eb3f272 100644</div><div styl=
e=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: =
16px;">--- a/DEVELOPERS</div><div style=3D"font-family: Helvetica Neue, Hel=
vetica, Arial, sans-serif; font-size: 16px;">+++ b/DEVELOPERS</div><div sty=
le=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size:=
 16px;">@@ -2599,6 +2599,9 @@ F:<span style=3D"white-space: pre-wrap;">=09<=
/span>package/python-influxdb/</div><div style=3D"font-family: Helvetica Ne=
ue, Helvetica, Arial, sans-serif; font-size: 16px;">&nbsp;N:<span style=3D"=
white-space: pre-wrap;">=09</span>Sven Oliver Moll &lt;svolli@svolli.de&gt;=
</div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-ser=
if; font-size: 16px;">&nbsp;F:<span style=3D"white-space: pre-wrap;">=09</s=
pan>package/most/</div><div style=3D"font-family: Helvetica Neue, Helvetica=
, Arial, sans-serif; font-size: 16px;">&nbsp;</div><div style=3D"font-famil=
y: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">+N:<span=
 style=3D"white-space: pre-wrap;">=09</span>Tal Lubko &lt;tallubko@yahoo.co=
m&gt;</div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, san=
s-serif; font-size: 16px;">+F:<span style=3D"white-space: pre-wrap;">=09</s=
pan>package/chipsec/</div><div style=3D"font-family: Helvetica Neue, Helvet=
ica, Arial, sans-serif; font-size: 16px;">+</div><div style=3D"font-family:=
 Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">&nbsp;N:<s=
pan style=3D"white-space: pre-wrap;">=09</span>Theo Debrouwere &lt;t.debrou=
were@televic.com&gt;</div><div style=3D"font-family: Helvetica Neue, Helvet=
ica, Arial, sans-serif; font-size: 16px;">&nbsp;F:<span style=3D"white-spac=
e: pre-wrap;">=09</span>board/beagleboardx15/</div><div style=3D"font-famil=
y: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">&nbsp;F:=
<span style=3D"white-space: pre-wrap;">=09</span>configs/beagleboardx15_def=
config</div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sa=
ns-serif; font-size: 16px;">diff --git a/package/Config.in b/package/Config=
.in</div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-=
serif; font-size: 16px;">index c23755a421..6c683aaa86 100644</div><div styl=
e=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: =
16px;">--- a/package/Config.in</div><div style=3D"font-family: Helvetica Ne=
ue, Helvetica, Arial, sans-serif; font-size: 16px;">+++ b/package/Config.in=
</div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-ser=
if; font-size: 16px;">@@ -2400,6 +2400,7 @@ endmenu</div><div style=3D"font=
-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">&n=
bsp;menu "Security"</div><div style=3D"font-family: Helvetica Neue, Helveti=
ca, Arial, sans-serif; font-size: 16px;">&nbsp;<span style=3D"white-space: =
pre-wrap;">=09</span>source "package/apparmor/Config.in"</div><div style=3D=
"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px=
;">&nbsp;<span style=3D"white-space: pre-wrap;">=09</span>source "package/c=
heckpolicy/Config.in"</div><div style=3D"font-family: Helvetica Neue, Helve=
tica, Arial, sans-serif; font-size: 16px;">+<span style=3D"white-space: pre=
-wrap;">=09</span>source "package/chipsec/Config.in"</div><div style=3D"fon=
t-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">&=
nbsp;<span style=3D"white-space: pre-wrap;">=09</span>source "package/ima-e=
vm-utils/Config.in"</div><div style=3D"font-family: Helvetica Neue, Helveti=
ca, Arial, sans-serif; font-size: 16px;">&nbsp;<span style=3D"white-space: =
pre-wrap;">=09</span>source "package/optee-benchmark/Config.in"</div><div s=
tyle=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-siz=
e: 16px;">&nbsp;<span style=3D"white-space: pre-wrap;">=09</span>source "pa=
ckage/optee-client/Config.in"</div><div style=3D"font-family: Helvetica Neu=
e, Helvetica, Arial, sans-serif; font-size: 16px;">diff --git a/package/chi=
psec/0001-extend-modules-search-add-pycs.patch b/package/chipsec/0001-exten=
d-modules-search-add-pycs.patch</div><div style=3D"font-family: Helvetica N=
eue, Helvetica, Arial, sans-serif; font-size: 16px;">new file mode 100644</=
div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif=
; font-size: 16px;">index 0000000000..3f783a109e</div><div style=3D"font-fa=
mily: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">--- /=
dev/null</div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, =
sans-serif; font-size: 16px;">+++ b/package/chipsec/0001-extend-modules-sea=
rch-add-pycs.patch</div><div style=3D"font-family: Helvetica Neue, Helvetic=
a, Arial, sans-serif; font-size: 16px;">@@ -0,0 +1,16 @@</div><div style=3D=
"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px=
;">+diff --git a/chipsec_main.py b/chipsec_main.py</div><div style=3D"font-=
family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">+in=
dex 1aa46ea..5acb768 100755</div><div style=3D"font-family: Helvetica Neue,=
 Helvetica, Arial, sans-serif; font-size: 16px;">+--- a/chipsec_main.py</di=
v><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; =
font-size: 16px;">++++ b/chipsec_main.py</div><div style=3D"font-family: He=
lvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">+@@ -215,8 +2=
15,9 @@ class ChipsecMain:</div><div style=3D"font-family: Helvetica Neue, =
Helvetica, Arial, sans-serif; font-size: 16px;">+&nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;while len(subdirs) &gt; 0:</div><div st=
yle=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size=
: 16px;">+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;subdirs.pop()</div><div style=3D"font-family: Helvetica Neue, He=
lvetica, Arial, sans-serif; font-size: 16px;">+&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;for modx in mod_fnames:</div><div style=3D"font-family:=
 Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">+-&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if fnmatch.fnmatch( modx, '=
*.py' ) and not fnmatch.fnmatch( modx, '__init__.py' ):</div><div style=3D"=
font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;=
">+-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; s=
elf.load_module( os.path.join( dirname, modx ), self._module_argv )</div><d=
iv style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font=
-size: 16px;">++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if =
((fnmatch.fnmatch( modx, '*.py' ) and not fnmatch.fnmatch( modx, '__init__.=
py' )) or</div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial,=
 sans-serif; font-size: 16px;">++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; (fnmatch.fnmatch( modx, '*.pyc' ) and not fnmat=
ch.fnmatch( modx, '__init__.pyc' ))):</div><div style=3D"font-family: Helve=
tica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">++&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; self.=
load_module( os.path.join( dirname, modx ), self._module_argv )</div><div s=
tyle=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-siz=
e: 16px;">+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.Loaded_Modules.sort()</di=
v><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; =
font-size: 16px;">+&nbsp;</div><div style=3D"font-family: Helvetica Neue, H=
elvetica, Arial, sans-serif; font-size: 16px;">+&nbsp; &nbsp; &nbsp;def loa=
d_my_modules(self):</div><div style=3D"font-family: Helvetica Neue, Helveti=
ca, Arial, sans-serif; font-size: 16px;">diff --git a/package/chipsec/Confi=
g.in b/package/chipsec/Config.in</div><div style=3D"font-family: Helvetica =
Neue, Helvetica, Arial, sans-serif; font-size: 16px;">new file mode 100644<=
/div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-seri=
f; font-size: 16px;">index 0000000000..839204301e</div><div style=3D"font-f=
amily: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">--- =
/dev/null</div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial,=
 sans-serif; font-size: 16px;">+++ b/package/chipsec/Config.in</div><div st=
yle=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size=
: 16px;">@@ -0,0 +1,37 @@</div><div style=3D"font-family: Helvetica Neue, H=
elvetica, Arial, sans-serif; font-size: 16px;">+config BR2_PACKAGE_CHIPSEC<=
/div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-seri=
f; font-size: 16px;">+<span style=3D"white-space: pre-wrap;">=09</span>bool=
 "chipsec"</div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial=
, sans-serif; font-size: 16px;">+<span style=3D"white-space: pre-wrap;">=09=
</span>depends on !BR2_PACKAGE_PYTHON # python3</div><div style=3D"font-fam=
ily: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">+<span=
 style=3D"white-space: pre-wrap;">=09</span>depends on BR2_USE_WCHAR # pyth=
on3</div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-=
serif; font-size: 16px;">+<span style=3D"white-space: pre-wrap;">=09</span>=
depends on BR2_TOOLCHAIN_HAS_THREADS # python3</div><div style=3D"font-fami=
ly: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">+<span =
style=3D"white-space: pre-wrap;">=09</span>depends on BR2_USE_MMU # python3=
</div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-ser=
if; font-size: 16px;">+<span style=3D"white-space: pre-wrap;">=09</span>dep=
ends on !BR2_STATIC_LIBS # python3</div><div style=3D"font-family: Helvetic=
a Neue, Helvetica, Arial, sans-serif; font-size: 16px;">+<span style=3D"whi=
te-space: pre-wrap;">=09</span>depends on BR2_i386 || BR2_x86_64 # supporte=
d only on x86/x86_64</div><div style=3D"font-family: Helvetica Neue, Helvet=
ica, Arial, sans-serif; font-size: 16px;">+<span style=3D"white-space: pre-=
wrap;">=09</span>depends on BR2_LINUX_KERNEL</div><div style=3D"font-family=
: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">+<span st=
yle=3D"white-space: pre-wrap;">=09</span>select BR2_PACKAGE_PYTHON3</div><d=
iv style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font=
-size: 16px;">+</div><div style=3D"font-family: Helvetica Neue, Helvetica, =
Arial, sans-serif; font-size: 16px;">+<span style=3D"white-space: pre-wrap;=
">=09</span>help</div><div style=3D"font-family: Helvetica Neue, Helvetica,=
 Arial, sans-serif; font-size: 16px;">+<span style=3D"white-space: pre-wrap=
;">=09</span>&nbsp; CHIPSEC is a framework for analyzing the security of PC=
</div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-ser=
if; font-size: 16px;">+<span style=3D"white-space: pre-wrap;">=09</span>&nb=
sp; platforms including hardware, system firmware (BIOS/UEFI),</div><div st=
yle=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size=
: 16px;">+<span style=3D"white-space: pre-wrap;">=09</span>&nbsp; and platf=
orm components.&nbsp;</div><div style=3D"font-family: Helvetica Neue, Helve=
tica, Arial, sans-serif; font-size: 16px;">+</div><div style=3D"font-family=
: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">+<span st=
yle=3D"white-space: pre-wrap;">=09</span>&nbsp; https://github.com/chipsec/=
chipsec</div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, s=
ans-serif; font-size: 16px;">+</div><div style=3D"font-family: Helvetica Ne=
ue, Helvetica, Arial, sans-serif; font-size: 16px;">+comment "chipsec needs=
 a toolchain w/ wchar, threads, dynamic library"</div><div style=3D"font-fa=
mily: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">+<spa=
n style=3D"white-space: pre-wrap;">=09</span>depends on BR2_USE_MMU</div><d=
iv style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font=
-size: 16px;">+<span style=3D"white-space: pre-wrap;">=09</span>depends on =
BR2_i386 || BR2_x86_64</div><div style=3D"font-family: Helvetica Neue, Helv=
etica, Arial, sans-serif; font-size: 16px;">+<span style=3D"white-space: pr=
e-wrap;">=09</span>depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS =
|| BR2_STATIC_LIBS</div><div style=3D"font-family: Helvetica Neue, Helvetic=
a, Arial, sans-serif; font-size: 16px;">+</div><div style=3D"font-family: H=
elvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">+comment "ch=
ipsec needs a Linux kernel to be built"</div><div style=3D"font-family: Hel=
vetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">+<span style=
=3D"white-space: pre-wrap;">=09</span>depends on BR2_USE_MMU</div><div styl=
e=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: =
16px;">+<span style=3D"white-space: pre-wrap;">=09</span>depends on BR2_i38=
6 || BR2_x86_64</div><div style=3D"font-family: Helvetica Neue, Helvetica, =
Arial, sans-serif; font-size: 16px;">+<span style=3D"white-space: pre-wrap;=
">=09</span>depends on !BR2_LINUX_KERNEL</div><div style=3D"font-family: He=
lvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">+</div><div s=
tyle=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-siz=
e: 16px;">+comment "chipsec is not compatible with python"</div><div style=
=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 1=
6px;">+<span style=3D"white-space: pre-wrap;">=09</span>depends on BR2_USE_=
MMU</div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-=
serif; font-size: 16px;">+<span style=3D"white-space: pre-wrap;">=09</span>=
depends on BR2_i386 || BR2_x86_64</div><div style=3D"font-family: Helvetica=
 Neue, Helvetica, Arial, sans-serif; font-size: 16px;">+<span style=3D"whit=
e-space: pre-wrap;">=09</span>depends on BR2_PACKAGE_PYTHON</div><div style=
=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 1=
6px;">+</div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, s=
ans-serif; font-size: 16px;">+comment "chipsec depends on python3"</div><di=
v style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-=
size: 16px;">+<span style=3D"white-space: pre-wrap;">=09</span>depends on B=
R2_USE_MMU</div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial=
, sans-serif; font-size: 16px;">+<span style=3D"white-space: pre-wrap;">=09=
</span>depends on BR2_i386 || BR2_x86_64</div><div style=3D"font-family: He=
lvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">+<span style=
=3D"white-space: pre-wrap;">=09</span>depends on !BR2_PACKAGE_PYTHON3</div>=
<div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; fo=
nt-size: 16px;">diff --git a/package/chipsec/chipsec.hash b/package/chipsec=
/chipsec.hash</div><div style=3D"font-family: Helvetica Neue, Helvetica, Ar=
ial, sans-serif; font-size: 16px;">new file mode 100644</div><div style=3D"=
font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;=
">index 0000000000..a1f38304d1</div><div style=3D"font-family: Helvetica Ne=
ue, Helvetica, Arial, sans-serif; font-size: 16px;">--- /dev/null</div><div=
 style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-s=
ize: 16px;">+++ b/package/chipsec/chipsec.hash</div><div style=3D"font-fami=
ly: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">@@ -0,0=
 +1,3 @@</div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, =
sans-serif; font-size: 16px;">+# Locally calculated</div><div style=3D"font=
-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">+s=
ha256&nbsp; b13ad6f3923b2a38e9574cf150d60e947783663abcf93fb3672c9b2de47b6f6=
3&nbsp; chipsec-1.7.3.tar.gz</div><div style=3D"font-family: Helvetica Neue=
, Helvetica, Arial, sans-serif; font-size: 16px;">+sha256&nbsp; 4c2ca80f4d3=
675a53a216a64d67e7b411a81a6e958defd248c6f1ecf44dc6607&nbsp; COPYING</div><d=
iv style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font=
-size: 16px;">diff --git a/package/chipsec/chipsec.mk b/package/chipsec/chi=
psec.mk</div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, s=
ans-serif; font-size: 16px;">new file mode 100644</div><div style=3D"font-f=
amily: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">inde=
x 0000000000..e8b6b69a00</div><div style=3D"font-family: Helvetica Neue, He=
lvetica, Arial, sans-serif; font-size: 16px;">--- /dev/null</div><div style=
=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 1=
6px;">+++ b/package/chipsec/chipsec.mk</div><div style=3D"font-family: Helv=
etica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">@@ -0,0 +1,28 @=
@</div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-se=
rif; font-size: 16px;">+###################################################=
#############################</div><div style=3D"font-family: Helvetica Neu=
e, Helvetica, Arial, sans-serif; font-size: 16px;">+#</div><div style=3D"fo=
nt-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">=
+# chipsec</div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial=
, sans-serif; font-size: 16px;">+#</div><div style=3D"font-family: Helvetic=
a Neue, Helvetica, Arial, sans-serif; font-size: 16px;">+##################=
##############################################################</div><div st=
yle=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size=
: 16px;">+</div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial=
, sans-serif; font-size: 16px;">+CHIPSEC_VERSION =3D 1.7.3</div><div style=
=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 1=
6px;">+CHIPSEC_SITE =3D $(call github,chipsec,chipsec,v$(CHIPSEC_VERSION))<=
/div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-seri=
f; font-size: 16px;">+CHIPSEC_SETUP_TYPE =3D setuptools</div><div style=3D"=
font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;=
">+CHIPSEC_LICENSE =3D GPL-2.0</div><div style=3D"font-family: Helvetica Ne=
ue, Helvetica, Arial, sans-serif; font-size: 16px;">+CHIPSEC_LICENSE_FILES =
=3D LICENSE</div><div style=3D"font-family: Helvetica Neue, Helvetica, Aria=
l, sans-serif; font-size: 16px;">+CHIPSEC_DEPENDENCIES =3D linux host-nasm<=
/div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-seri=
f; font-size: 16px;">+</div><div style=3D"font-family: Helvetica Neue, Helv=
etica, Arial, sans-serif; font-size: 16px;">+# needed in order to build chi=
psec's LKM against Buildroot's kernel</div><div style=3D"font-family: Helve=
tica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">+CHIPSEC_ENV =3D=
 KSRC=3D$(LINUX_DIR)</div><div style=3D"font-family: Helvetica Neue, Helvet=
ica, Arial, sans-serif; font-size: 16px;">+</div><div style=3D"font-family:=
 Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">+# build c=
ommand according to chipsec's manual (chipsec-manual.pdf)</div><div style=
=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 1=
6px;">+CHIPSEC_BUILD_OPTS =3D build_ext -i</div><div style=3D"font-family: =
Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">+</div><div=
 style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-s=
ize: 16px;">+define CHIPSEC_INSTALL_LKM</div><div style=3D"font-family: Hel=
vetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">+<span style=
=3D"white-space: pre-wrap;">=09</span># chipsec's scripts search chipsec.ko=
 in a non-standart location</div><div style=3D"font-family: Helvetica Neue,=
 Helvetica, Arial, sans-serif; font-size: 16px;">+<span style=3D"white-spac=
e: pre-wrap;">=09</span>$(INSTALL) -m 0644 -D $(@D)/chipsec/helper/linux/ch=
ipsec.ko \</div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial=
, sans-serif; font-size: 16px;">+<span style=3D"white-space: pre-wrap;">=09=
=09</span>$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-package=
s/chipsec/helper/linux</div><div style=3D"font-family: Helvetica Neue, Helv=
etica, Arial, sans-serif; font-size: 16px;">+endef</div><div style=3D"font-=
family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">+</=
div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif=
; font-size: 16px;">+CHIPSEC_POST_INSTALL_TARGET_HOOKS +=3D CHIPSEC_INSTALL=
_LKM</div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans=
-serif; font-size: 16px;">+</div><div style=3D"font-family: Helvetica Neue,=
 Helvetica, Arial, sans-serif; font-size: 16px;">+$(eval $(python-package))=
</div><div style=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-ser=
if; font-size: 16px;">--&nbsp;</div><div style=3D"font-family: Helvetica Ne=
ue, Helvetica, Arial, sans-serif; font-size: 16px;">2.17.1</div><div style=
=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 1=
6px;"><br></div></div><br></div></div></body></html>
------=_Part_621933_1141489193.1636911532404--

--===============5756173366636481012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5756173366636481012==--
