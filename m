Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EB2606A339
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 11:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Y8xSibns
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65E5E40969;
	Fri,  6 Nov 2026 11:22:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qcSUMG_KJFhZ; Fri,  6 Nov 2026 11:22:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 059564096F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793964147;
	b=QSNepSXyQrbGo2VIq/PjkbVMX/7xZY4/8SNo6Ke6dKwbGXmH4D/4yL60Sh1iBp6H7WvZ
	 mAuNGSDXGtkXxG2ZxcaRrw/RulQJC5GXxQsSY2ZU+SE0x6KTnUu/Ihdk2CQdL8qTP0fRt
	 xkYBp9gM9MOU6l1da9wj0efQO67pSWccTu2BjpSXcsMX5QddUaVF4PMTzDL6Wk+NkjbSc
	 QhckLQX/clsMbiueJJTpmR8UOuX2gYqR7u0VZvF5++N6NUsqVMi2FHz7b3mWml5/i4COy
	 pwieBtfah6o0+RngVVEfX3qigdvmkPip0tOknsB+BXMVO1TXBjDku68hyDn0YMcTVJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793964147;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:X-Sonic-ID:Received:Date:To:
	 Message-ID:References:MIME-Version:X-Mailer:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Errors-To:Sender;
	bh=jVIurPopdfaN5Vas/SbOeBlJyx+h67yGpcocIB/8+xA=;
	b=oL+nG4gaxboZE41o9rq1Bs2xVJqZe5GED89hnoVZim+3dVP+BYwhD14qOLNr66fqokeK
	 1HCxaD5pcd/UXimll34tB7CY5s0iutCqBu4XAc1umb7fTpI5gRZUE90sRqmqNDaBWxb+T
	 UVCbt4P+J7zHMnpCKIkB2zCTzj9E0DSOXsBoQlXEKdgbYzyFoEGKfErm+J5WglHRW42iL
	 McFmSEwSN0oqcrUMebsRcA3wEQ7yQK2Mn1fk8YK3eS0yH/J7TLxjoquGv9VsSlNeHH2BR
	 p6Y4VHexGSVSWC7s+zUKANcDFBln4kZQt4UC2n2LAvopuBtmoJxaCm/v18cqB2QYQ6w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793964147;
	bh=jVIurPopdfaN5Vas/SbOeBlJyx+h67yGpcocIB/8+xA=;
	h=Date:To:References:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Y8xSibns58C7HmYMYW6xxWpvumSO+ZD7uU9j7nWiHTosAUQsD/wnZQMadWr2U+0ik
	 lSKl9D2ORdj/Z64vVYjTz/wjP2dzcQyxhLqAidBq3uERaQDU8+eXp17CkflbSDzpLf
	 VTWX6kcskGgAqENTcPMHnv1AK/CyTscmW2p5sCj1AbJLnCFYsAeV8u/edK9zDl1vCS
	 ocbiLWKnvxagbAfh5KxRqhz7ep4KuL5qCBGyF+BCuLyL7+bL9Wc2bJpzduzANYMnd8
	 gFBj9EGqK0S9sXlmj1Kx+dsRl0jBgWUjCwJ0yFCBjHBWZdx2AHSD1Zo44nNfdt+ABQ
	 PJtyZYaOz8nWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 059564096F;
	Fri,  6 Nov 2026 11:22:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 316E331F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 11:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 224F9607CF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 11:22:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id simFybi8bUv5 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 11:22:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DE4AC60640
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.163.188.204;
 helo=sonic311-23.consmr.mail.ne1.yahoo.com;
 envelope-from=davidluca3000@yahoo.com; receiver=<UNKNOWN> 
Received: from sonic311-23.consmr.mail.ne1.yahoo.com
 (sonic311-23.consmr.mail.ne1.yahoo.com [66.163.188.204])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE4AC60640
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 11:22:23 +0000 (UTC)
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1793964141; bh=7mCv6VEpMFfGPWLmSxG3m2TZftNt7ICQy8tY+M9Q62T=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=aF8Cpp2tov0EUaYA2F1xMwvHQ4G1Gf8Usfz6bg+jFsRXRxdwbDz4Fklgz5SPKGHcwz1LY+tVuc4RRry+KEylIpKa9RiwzUU60scHMIaoHb823JTGmE60yettuBbrnhIr7Wu8ndl13dUXWCpVbJpZOR2qTRgmklrJ4vW7x+IVVZsjdP4VTiT9EDVPFMw0LPpju3CEXhYXgKtV0lY3SLJ4JinkKx+abL+V+rgU4WJd2t0guMl1b+vNNyZcATgPnU6ClI0UjP3qIP8BK1zi+W9nTrmYygYZ6hvATh3QTYmiy1pgIEKGIalGYAkAsFObxADo6haAJ/KbCd5mD755R2HVxg==
X-YMail-OSG: sd71GdsVM1lodIE4lu1NYDNmRpHOA5C1SQ2XYqHriz6god1OnTQfeDnmCnqyfrU
 sYFc67jOUORqOpkXcuHgiYbiOeriboWYwK9kHTdZrqflig7NRUP2jA4M0f021KpuGDr1YyC2uZYT
 6KR8mlWcYLrCPAfNgKGzEpBcp3Nz7wwZBrzEWzbQ2MOp1THRTcE3BZYpLYSpG1wSTx9wL3t_vLAY
 u4reyQgUm89msdH8inHAW1A6cmToHkNoAido9KYup7a2No.FV9gVGMTaV7v6CsbHLp2RCHTk4tzJ
 f_7njzPjQmn3M5MDOwqPGRMltLOBEckO660Z6zZes4IzWfg.z5ZkmCVXlNmP7XDFQKLbSDibxlcl
 fV2f7aUYx5teT2K6Ypqzl8At9w7MwnVxMoEKVkoTZxyOAV52tOBDtyp_wjIqasp5NdW_C53aLzx5
 5ISEfthm1Y4t7nj0L728XV0g97kGzWOjTyj.rwAnbGK8Ntz2GsgIW9wpE0n1y_rootm.UPDYfm1P
 Y.Y8aoci.xHSAAbswZj9CBszMG2RnaxemBZ.f0GIoZc4b0jh6mev1Y3YTMaEG9rgmEqi_wCpiX3j
 vzyKZP2q7GTtWNxe.7T_iUgoQYfGZyEXSpujW3ySt2YYSVVTs65Lk6ysptaiL0WY73E.scae1UcK
 yUynYkqRwOiOYDVrprrCivvS4Cx2WJgQ8U0SV0bvLIotynmrgSqxBgbQe7g0UsG8dloPxrGg5uAi
 Dcvu4aKTbJae55NNMmgWJeOQAXMoQN_6jI7BMxeDR3FGGcJKfbMD6rMd25yVjuQapGC2pcjS9wxf
 TASFkyAgzcquaXP.w1pN8Eo.vMNCYaUVbTNsmg57x28GMAZZpUZYiAKovd_VuLaVgmhlwijPGims
 UCZB3K_h02Ee3Yng.KMg7oWZf7.mgzUGXcSsLf14biluTKjgtBS4Pn9l8F3DZ083igsls8qAjjPd
 5NPHtJVSmRCiShFjc76zjHF8xUb5kSWWWOJQB04qBA14wMZ1Al_LjEeT.NRdAZ__sJiivRhFCP66
 Ih28jhdPnV391s9aRnFWfaCwP3mSnV5pGvyApL_5mg1YtJYXXmh0OOnjtnjzG4kn_CHVHHi3PDax
 1NTot5H9Z53m0UxwPGnCGh6bYgxzY7lGKi.LH9BgCbauAp6TY1tKX0pmciqr8LVEOMRBnXxfYtDP
 bun_VWxnTO_ZhwBLGiqtVQn.An0pgcwPNuybyY7QF41PkkpWST7T9tuLHDhE0Lm..2Sv39KDM50f
 HYxB7_bJT0hQX.cRUqy4SGzZvYCsEPXzJ4N0bDrMRfG.xw1v1BsLW1IZfCx8RJ0CD3WNMcaiaSp0
 da0ivZVX12Ai2t_cVebQ8UF7iMQwpZzEDfTHII1lYcaaUTbz8pGp5rpMTjBdxTwQcPWd4abnurIs
 Wbh0fb5ccpxsStM.5VT67Qa1KgF.SW4Szf6stqAM3AFGaM.Olp2lbivRmo5wgNmCOAwEr4e4sI2b
 GcM7L_lRwQaq.6fIDQ_bTRaR8YCOErSD2L8l4763iUeaKStq6Zp..D2b7cCes5TuSZhOw._UQ5.3
 hshM4sMnNrJZb8aW6LFy6jr33un2Jir6kCFPcebbcMBlUMEOgdaL52v9rPNYwx.Ecdj2MZMqNM6_
 k18uEeh98dxL68qYSF1G9etgxjip_HXrn.hNVqRK_7_IbJrOTsUK47OwwkTX6HyYsF7BjI.eLQxi
 1dMEKuILoMgq3k8Q9ODRNGkfU0O82PkYYZWOZNoV.qgZOPV0h37.FC6cKtl9HsX9Nun3O3V03fk3
 CiWhV5jch5V8V7Hy3xtDfr1ffIIlpLeiJchOr6MpwgWSZeNC7_W7uP.jiBXdMo1DvtGvo5T362kg
 ..cGBav.Q9ECHJvctaepQ0fYUaevfOZ.rK4DkGxbQd1zJ.TEfi60PqobWLqrK0DOVfzG9q64GjHv
 zT2c7Xnf2D9vw1P1mFMvKpXZsnv1Wgjcmc2VDWCGaQ0JAa5pnJsvrg1ZPb1rlVkmHPLJApw3oBS9
 A2j0hHpaIT2b570H_7Gy29uqBZlCma0JciX4vrmHUqjtg.glYaoL9hF07qWfWgP47.PPa9ftR_vu
 Mx8tqxWoWR_Dbr_2hrr05HWAXmKJInzi_pzzJ_yG0ynSKJSrSDZCEwZDwT5v0JtDqzUM5Gt8DnpL
 _W.Tu2rODFvRlksmb2E51T6yec0UB0M4VwTgEvb3eLym5Fnam9uceNjZSb4uhAhWmO_t_BaFjTWg
 sTjfnhZjmNBgH8wO3k.3_VrBwTbzAKo1RZbJNhNb56ISL5sPscUhMB6MFBe1mP0CnaJLJjTY1JyG
 2Wp0xyt.oV7_DfajrSXxnAlXJUe8U71xcwVld46XnN0Pn31g_2cHunlAI
X-Sonic-MF: <davidluca3000@yahoo.com>
X-Sonic-ID: adba8e66-2c07-44ea-91ea-87893a592ac4
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic311.consmr.mail.ne1.yahoo.com with HTTP; Fri, 6 Nov 2026 11:22:21 +0000
Date: Fri, 6 Nov 2026 11:22:15 +0000 (UTC)
To: <buildroot@buildroot.org>
Message-ID: <1461151393.479397.1793964135398@mail.yahoo.com>
References: <1461151393.479397.1793964135398.ref@mail.yahoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: WebService/1.1.26943 YahooMailAndroidMobile
Subject: [Buildroot] NetworkManager not available
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: David Luca via buildroot <buildroot@buildroot.org>
Reply-To: David Luca <davidluca3000@yahoo.com>
Content-Type: multipart/mixed; boundary="===============5832064643594297288=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-1.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_REPLYTO_END_DIGIT,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5832064643594297288==
Content-Type: multipart/alternative; 
	boundary="----=_Part_479396_1809315352.1793964135396"

------=_Part_479396_1809315352.1793964135396
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,=C2=A0

Was using Buildroot 2024.02 and had NetworkManager available for nmtui and =
nmcli commands on x86_64 platform with GCC12.3.0, Linux kernel 4.18.
 I moved to Buildroot 2026.08.1 and imported same defconfig file, but these=
 command line tools are no longer available, menuconfig only shows "Network=
Manager needs udev /dev management and a glibc or musl toolchain w/headers =
>=3D 5.4,dynamic library, wchar, threads, gcc >=3D 4.9".

The defconfig still shows "BR2_PACKAGE_NETWORK_MANAGER=3Dy"
Any idea what I'm missing?=C2=A0

Thank you in advance,=C2=A0
David.=C2=A0

Yahoo Mail: Search, organise, conquer
------=_Part_479396_1809315352.1793964135396
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,&nbsp;<br><br>Was using Buildroot 2024.02 and had NetworkManager avai=
lable for nmtui and nmcli commands on x86_64 platform with GCC12.3.0, Linux=
 kernel 4.18.<br> I moved to Buildroot 2026.08.1 and imported same defconfi=
g file, but these command line tools are no longer available, menuconfig on=
ly shows "NetworkManager needs udev /dev management and a glibc or musl too=
lchain w/headers &gt;=3D 5.4,dynamic library, wchar, threads, gcc &gt;=3D 4=
.9".<br><br>The defconfig still shows "BR2_PACKAGE_NETWORK_MANAGER=3Dy"<br>=
Any idea what I'm missing?&nbsp;<br><br>Thank you in advance,&nbsp;<br>Davi=
d.&nbsp;<br><br><div id=3D"ymail_android_signature"><a id=3D"ymail_android_=
signature_link" href=3D"https://mail.onelink.me/107872968?pid=3Dnativeplace=
ment&amp;c=3DUS_Acquisition_YMktg_315_SearchOrgConquer_EmailSignature&amp;a=
f_sub1=3DAcquisition&amp;af_sub2=3DUS_YMktg&amp;af_sub3=3D&amp;af_sub4=3D10=
0002039&amp;af_sub5=3DC01_Email_Static_&amp;af_ios_store_cpp=3D0c38e4b0-a27=
e-40f9-a211-f4e2de32ab91&amp;af_android_url=3Dhttps://play.google.com/store=
/apps/details?id=3Dcom.yahoo.mobile.client.android.mail&amp;listing=3Dsearc=
h_organize_conquer">Yahoo Mail: Search, organise, conquer</a></div>
------=_Part_479396_1809315352.1793964135396--

--===============5832064643594297288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5832064643594297288==--
