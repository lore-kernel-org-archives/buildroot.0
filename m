Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0B1C369C2
	for <buildroot@archiver.kernel.org>; Sat,  3 May 2025 20:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C7D440BD6;
	Sat,  3 May 2025 20:57:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fl_pDQW7Mgcs; Sat,  3 May 2025 20:57:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9934340BA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9934340BA0;
	Sat,  3 May 2025 20:57:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A90A3118
 for <buildroot@buildroot.org>; Sat,  3 May 2025 20:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B9F240B9E
 for <buildroot@buildroot.org>; Sat,  3 May 2025 20:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ozcSVZB7dvm1 for <buildroot@buildroot.org>;
 Sat,  3 May 2025 20:57:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=106.10.242.141;
 helo=sonic302-21.consmr.mail.sg3.yahoo.com;
 envelope-from=praveen_khurjekar@yahoo.co.in; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7F2B840B98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F2B840B98
Received: from sonic302-21.consmr.mail.sg3.yahoo.com
 (sonic302-21.consmr.mail.sg3.yahoo.com [106.10.242.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F2B840B98
 for <buildroot@buildroot.org>; Sat,  3 May 2025 20:57:19 +0000 (UTC)
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1746305836; bh=sKktfYwOezXdp5YgYjKqNeoLvAqWh0CAZjY8kk/ecWm=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=b+lUjxPR2HaBAwtzruzha0YEhfDJp+QbIzO9nJBlyR2TSlC4H5dm4N4H0fyoY2yYLZ+LIr0EEo3BSxX5ATky6aC4juRYJI1nbAA8hHL5QTqjnELKwk+TgXyb/EHO6uc3Hri+m9pWn6oqIPblOzI/CmV5h7yvWLGn553Kug3XFvnJDADsODNBzNcqSgibKaptFOU4v2C54sV16gsYN4KPakY28stBsJRijUuvNVLneYVPiTVASrxz0HYNK/KcC5dhxH3fd/cUeUwBTeMcYUltZXCA1iXruQmz7dQADWBCGRZu4pCU+rvB/kbPRAHrVU7uB+UQCZkzAeGOsgJxQSI/jA==
X-YMail-OSG: K9KtskgVM1k.4LSSn1V7EAYemi8Uqxle_bgt0pOVViukAGHs_maX8KJNQptzZEI
 GSOpjWoMDjd8mRM0lt7wQzQuwt1UbwJDcVChI9EMoIlqyCFN7B.wpbxeguHpXi2iF05M89UexzWN
 stHGeBaYdmhEt_kvgJqabE0t2y82cPsr1hj5rlRGqSThh87QRXGOLr2Q6ca0CIbfAWtP0n3FOmpO
 YHaUkMoskqnYQ8ozDNAlk21O5tL1hU0mZLd4HgqWb8aeyOSCob4Lxt49LrAoEMKbD54yJGeUty.K
 VAgyLvux2quyVutG6E4Qrt5ZRyEJlJD909Ol7ke8b_RERPs7POyQWuTcdTgdSmGnPoNBEMPc2O32
 oko_SgsXz1EWpf3DehRhM0ncE42LR7cT49fDh1p6BAbCrVrgEfMqlpOpKjNrURAjW_BThM897pbQ
 .nv.n.GTRaUHIfrrdzk9WPpC1b0EjYOrQ4eYeWWBVh.lXtUhfxDzOzNRkNSKZRJ5FDE.oX2gIPxV
 Tps2k1pLm12C4dS8TitMK6R997IwMxZAuY0fve0EECnXlqBNReLhmaauKm8DQCaRvKlUCuWfcVzu
 XaQR9rFCQpNP63nkyw.oE_pwltjD1CtHYFCx5mSR7Q0_SlsSKrgzb_mxR3f5m5nXSPsKPUEoERpv
 Gu1gjYwbHCkHvWL0y_4qozd_BOa4rT69kAO0MLOPq.ESzAFgrQZ2wSzIf9tIrvaNJ9YajmXsffgV
 maqV6nPAy3lNLmhokEWzClDiCd6VAUkeNn_lzfLDGIUZO9pYCQ7XTQMRHx.Kb6apomaRdG_kgLd1
 11t9UkDUiEOA6AiUceMXMv8evge5dLr7VOrnjD4XbiEvdyGHFU9a5uL4O8rO.6GBxzFOHe4FBn9Z
 Zd4aisXg43lUgvr1_mZgp5bpP5MnR0IlumhuXbX6OIQG_29aP459_ZbXjFbxzKRJn7AMaJJb5mD5
 6PEb.weg5Cv0NAlA7CyRzLI.ZqNfyyePf7scxteYvN8k3kFLMeGU0XGPWE.i6ZL.aVN3RHj2fS1P
 8a1gsTDxMd_JtxFsrSwfQvhdFAbsTmYA4RaGWDKLKyYxMhqNSI2W32Atjq2kxoSXOk.JdktGxAAr
 z0R4CFV8alzEcZsLencQECxl4oWUUuV9tBB1NoyX5WqbT0LIT9DTsiknnFqIWtIa8Z5MILXUfBxI
 sQQNJNQ.tjMYcBNHjTOl6z8tfEpM5TCyMv6foG_MRELwpEzUV.KryMHPo2J78xCdYRFEkcDF2z.r
 ia.GLo.zbpSwXYyYcqfhVXORgvjrag.MvqWkAA9pJMf_nlcOI2k_spxKw8OnPMX3iimEGjossuW3
 nB1F6QfyV005B3x0bsOmHa9yjDHJA5VS82j92fyIVBgDFGhV8uFNbX3DbQS50_qmTKwm6eRhAMAg
 wzoruqd6S6GWyN_YxVCevcOJkGdtW.wLDFwxkLzpKWVIWJpd8148.L_.nd7mTibPjfhGpZ7e_fbO
 kq_waiFtBMGX2zZKvOq2ysmjMt0QrLfd1GAX60QV7aRLoATr.C8hZ8T3RM4KjdjkZUp7LkgPtitu
 pnk6bG6TzpHTrNK.dR6vbjUc1OKAeHT3Ul7nGwDTKLBQiMViM1LPCu6l_0T42sHxxBYniYG0x9tW
 ayjjaF5IruYcuc08j2zpY6swVEYwrboSo0n9eExGFg_OaH5JPI3iO9OwhyBZ37ASx4sxvaSsIoO3
 sr8MhDL1RbPwLCmcthEGele_aVyCAxl0E1WZDfO04UbinEFvvWaR1GNdBI7yim5XndYUmGNwVZg4
 MUMpRFXnyyQTRIGND5TYBqi_9LosJL5LH94vT8PxqSIw9Qja8hb3HHsLLOIONls3AHVG7U9MRP0o
 wiSpQ.6__PE9gnO204TsqydCsmjuEpJfakrCCATz8F3M9kK3IKDSMq7kieGnRak044rxp7ZWiFC4
 16.Crmdo5ZhXQUiAAFU6P8S5OhL_ixuBmZ8AJh6usmQsWwAOAutDiu9hrvYOiKA3urO4AQ6vbOCd
 yU1y4.eKAH7qY1Wh28Gp5UE.Y9JEOOLVsr7MDh3c_bggxIhBKIoCywqzPHgTKWp9lwSydCdG.n.m
 bwdiqLGzUPWm3UxY6rAqIuWXSVGorRfExhdR5qztnPI7WavQuaYgXxUHNxviMKWxXQFp2IIPuSLo
 GDag1nN1i1Gb.1_csDtsR7MfjLa3RkUh4TTmm_XwK0k.4iRm6MhvNpP5nOJoExO.sqyZtMYNkobF
 8TV7qimr6c3XRw6HVa3vtRCej6PaD7dYyYykhTos-
X-Sonic-MF: <praveen_khurjekar@yahoo.co.in>
X-Sonic-ID: ee375e22-4918-4537-9b05-9542b0d662c7
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.sg3.yahoo.com with HTTP; Sat, 3 May 2025 20:57:16 +0000
Date: Sat, 3 May 2025 20:57:08 +0000 (UTC)
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <1197283725.615983.1746305828504@mail.yahoo.com>
MIME-Version: 1.0
References: <1197283725.615983.1746305828504.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.23772 YMailNorrin
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yahoo.co.in; s=s2048; t=1746305836;
 bh=Eqsnn9nd+/cNqYtm1xOcBpZ+fVkoLawsWnVcJCdIhDQ=;
 h=Date:From:To:Subject:References:From:Subject:Reply-To;
 b=rxvUKcKwY4DOaF8A6BqLLSr1v822O7rryBNGqkUZk5omeRd+1HIa09ePNDMdyxdFSOmjY81PaL3V1Gw4pYs23TjIIBRwZWAN3E2e7+b33s7YUoCWyxxYWbKOkNDyq3gDZGyS6a3cWdlKH7XAEKqaPMVOGTFGN+41UWZBNQyKlMO5KT4IeDmYfPtg5Br+RLc75Z8EKXAT9Nv7KIyFr7Gwwa4qDvmi5q6zZs2ud8Wq5X05yZMq7b5Xusz9pocb4KdftQpFupQXSUpXR58HqIZrqOu5eX7y6qL+DfZN2d+LcAavuupzxY4/Xp/kn1PwuNXc2O+N1LPX/N4jFRL1x/JQrg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=yahoo.co.in
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yahoo.co.in header.i=@yahoo.co.in header.a=rsa-sha256
 header.s=s2048 header.b=rxvUKcKw
Subject: [Buildroot] Error in Systemd Build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Praveen Khurjekar via buildroot <buildroot@buildroot.org>
Reply-To: Praveen Khurjekar <praveen_khurjekar@yahoo.co.in>
Content-Type: multipart/mixed; boundary="===============6978277444479788382=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6978277444479788382==
Content-Type: multipart/alternative; 
	boundary="----=_Part_615982_274301019.1746305828503"

------=_Part_615982_274301019.1746305828503
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Encountered the following :
/home/praveen/Work/BuildRootStable/buildroot-2025.02/output/build/systemd-2=
47.3//build
usage: meson [-h]
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {s=
etup,configure,dist,install,introspect,init,test,wrap,subprojects,rewrite,c=
ompile,devenv,env2mfile,reprotest,format,fmt,help}
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ..=
.
meson: error: unrecognized arguments: /home/praveen/Work/BuildRootStable/bu=
ildroot-2025.02/output/build/systemd-247.3/ /home/praveen/Work/BuildRootSta=
ble/buildroot-2025.02/output/build/systemd-247.3//build
make: *** [package/pkg-generic.mk:263: /home/praveen/Work/BuildRootStable/b=
uildroot-2025.02/output/build/systemd-247.3/.stamp_configured] Error 2

path issue ..

Thanks,Praveen

------=_Part_615982_274301019.1746305828503
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"yahoo-style-wrap" style=3D"font-fami=
ly:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:13px;"><div dir=
=3D"ltr" data-setdir=3D"false">Encountered the following :</div><div dir=3D=
"ltr" data-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false=
"><div>/home/praveen/Work/BuildRootStable/buildroot-2025.02/output/build/sy=
stemd-247.3//build<br>usage: meson [-h]<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {setup,configure,dist,install,intr=
ospect,init,test,wrap,subprojects,rewrite,compile,devenv,env2mfile,reprotes=
t,format,fmt,help}<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ...<br>meson: error: unrecognized arguments: /home/prav=
een/Work/BuildRootStable/buildroot-2025.02/output/build/systemd-247.3/ /hom=
e/praveen/Work/BuildRootStable/buildroot-2025.02/output/build/systemd-247.3=
//build<br>make: *** [package/pkg-generic.mk:263: /home/praveen/Work/BuildR=
ootStable/buildroot-2025.02/output/build/systemd-247.3/.stamp_configured] E=
rror 2<br><br></div>path issue ..</div><div dir=3D"ltr" data-setdir=3D"fals=
e"><br></div><div dir=3D"ltr" data-setdir=3D"false"><br></div><div dir=3D"l=
tr" data-setdir=3D"false">Thanks,</div><div dir=3D"ltr" data-setdir=3D"fals=
e">Praveen<br></div></div></body></html>
------=_Part_615982_274301019.1746305828503--

--===============6978277444479788382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6978277444479788382==--
