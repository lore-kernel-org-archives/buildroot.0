Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2143BC38142
	for <buildroot@archiver.kernel.org>; Tue, 31 Jan 2023 19:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A860381DBF;
	Tue, 31 Jan 2023 19:59:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A860381DBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id weOylLmsxrCJ; Tue, 31 Jan 2023 19:59:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E460C81D5C;
	Tue, 31 Jan 2023 19:59:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E460C81D5C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A48F31BF215
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 19:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BDCE404E5
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 19:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BDCE404E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XUUNLmZxA3nQ for <buildroot@lists.busybox.net>;
 Tue, 31 Jan 2023 19:59:35 +0000 (UTC)
X-Greylist: delayed 00:10:02 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABB0E400C8
Received: from sonic317-32.consmr.mail.ne1.yahoo.com
 (sonic317-32.consmr.mail.ne1.yahoo.com [66.163.184.43])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABB0E400C8
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 19:59:35 +0000 (UTC)
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1675195174; bh=RvzcSawTrQ7FVeGzjh7KTT4h2308ltAiZT4+2Qvm6an=;
 h=X-Sonic-MF:To:From:Subject:Date:From:Subject;
 b=H5K4AouUI5TFlzVBbpNP5yBoc6VjLOF8iqTQYGFdHnmGm3B5A95MLna3Y+VzTAlj4IR7ppUDRg/opCnkaQFXSOztGfCLezQ/2/ZhpjVpMXLEBfsYPhyMOD7OuUwPdLM/IxGjnyElh7Ney9+RSTzc+/xwG6kahS57BN3OytXfTuR0xA7jSyMADV0hAwyl1xMTT1iGyk3B33h9Ul4KXc32WH4wN7rV9a4l663UwU8lpYqIKF5J49IRHU0/xk3N+AVGgAz9QC6jBy0c2+Zfb0EMnqGDV6+iyy36pKqpKf6f/oMnRRv6p0PmfoWyAkaNeH7A3PaFJHkr7QSs/3tk7cJKQg==
Message-ID: <665997591.554194.1675195174617@yahoo.com>
X-YMail-OSG: wXq0BlwVM1n1cTLJghhLA02zCWh.CC5zhncp1Ub7RC2d35AeF14QCoNCd7gW5cl
 z_WFaTB7krY8sXvvVRC2J4IsQZZ3I8x8cqeEhqLl25ss..qfyhwsRsmvDO1v_SQzbqss2lR9eSVf
 AMxNOFsthWDMV3c8WCrVGQwe3KukyfZeyUdUZza_FI.7RmKDZtYZgBy2oGP2bttL2qHWTIy_4DJJ
 Rt4hHvj4iYFlunNx47m_3WHTK8h1UTkoIBqP6ZTs5MP8t74oa_aCLCnBJsnUwXE1LVD5uA73qcFu
 qIbWIr_r1_.wXOlcDftyVSxg_0.7x3v5pJQFWIBwtb2FMZXP0NssvNnUIovw9oIuX9xEFdLiinj1
 rawJt9c_EyyDWaVnV2sJDtphWTKtg29mz30K3UNIwccX_WM_Lm9Zzhoo00n6G.55EB6ho1F3LPzZ
 KpBTuJL.ti1pOpPKXL_WHSUDJNI3vpvTlkbRZqlAovA67p.od0WTibWNaxzo8S95437XoBLBzt.J
 KKA2hVyyv9Vp_ibLWFWjbUokoCCghrX60gm4yKV2PYgY95GE26GcSkUJdc9J4RE71C.FY4b1cxfi
 URgn9LbvS2Dk.gjmSd8GcbHCbMT5OnZL8NAFaolZ968P7j2VPdotpF0KG0a34l3XeXJxdoGNU9An
 eUlFD_6ljWy3n5w7IblhxNuzqs2oHeNWiiEt3ZFRy8vNSWvHRDZ9AQMs2ohrKLgJO4FEgcV9KUjr
 xqtjWNGkth6S36UCKdeoQGz8j3RnvKJTZ5y1cJzS40IESf18lGF_kpvcKAt2dF5lmSfdsys38wPU
 nKQTwd8BGlq3.SAjlOb4hjwKiNsD4doKOAORCvvg_NUds6tQXLcffDiRGclL1MDy6trfUdJlYEbP
 bc2wkX7fQqxXkHlOYK2oaw53SrV3SfOj8M9SKD61mXw2nj1B9Ow17MxzRdDAW_AbdEayecHfHJwZ
 iLTGxnxFWWLD9unS93WL4EPdN3RjBuRs7FO.tBDGi.QDZzmq3BFM3iDVfudUeMm5fjwGme1DMIc7
 GmlphrgzbHn3dT8XWjCyY8iInrDocxs1TKH9kIOQs0GpzQWwb622.NoQ25DyDPxnj.gPQHT0A.nX
 8RZZ.3URrSulqtZHwFpTzUD99D0t_OG..oo778IHNHfqGhuV.alTc1GjyKpvleZ.cCF766UP.4DZ
 LVhyLdpl8UcaJ139mC8SUtARDKI.lhaDe7OpjKlv3a.UsO.5UsE5OBDHVb2YNR8Zq_myzCajrl43
 ZU5HtfLYTAxAKaAMD3fEnfNBcpx4oxMYNlW5nQ.Z9RjWw7NvawI30PxqX7RzIZvAHZxJksHF0Ah7
 c9XNqE6HHCVo7Bm1rqvgA7mmlyVNlHDjssDqN3DnogSQqL8V39GLuwRths2vW5BvyJSPHB4hLxB3
 3QWGl2UcBHj1T1Hfxk6861as_CF_N9_MwfO_BueB0RLzXWVkrK5n26K1sXG9UCD9H1aN7_XjWCx8
 1pC9qMxXrekNRbcqPAv61kwbjGOaTtPeHezoMC0qifjUC36rY4i_He9JxFna0gA_IB4X2Ov1CipV
 fz.a7Tx2vs68rCXsCTHwG8oDPAxRZGnJ1PlVeFKKkss5Una4tFTwq7Z_1Ts__vsDqsJ5Gl20kphQ
 oaC_mILG7egQA1.UBZIdUbs3V0Edf59E4Ufcp_x0s1PcQrmTZNq7oN5554Ze_mGXK_PnTt57Xc0D
 kZsCynATrmvamocDmap0_ISRi5_B8C27ncjB10HAHigoRW1ICA6m_3ianf_dEqzk8p6_aaukw4pJ
 cFOzTQqz46.sp_aNF8c_W2neRJUEzxr3wXtnpyYDqnt_Msqt3yj7rCd.zKzbpfT9yphBwC.Euh3T
 B.cbLXpnSX2idetU6slQcHTntOT3SFZAnOwkeSf_lbLU0tZNSb6YMtOjCt4dccpXec6lq1QCrH0U
 CX5_kAMYR49fy9Epb5EvqTli2_6IibWzY1qxU7PUHSY5_JCKKv.0JBS5jb1YvBpSWE69KauUDu24
 GPdAXib2srZtRrO78L9CSFbG.tLAY8ArbC2vC8PeJpM7dAuhtG6baJZhEtVdUFw4tee3vZIoLxRn
 n7x6SH8vyhZQO7s0rm6YZ_shVQszu6UVR6W9Na6LHeU1We2Op9GMlJltEYOb3u2p.u9u7imH8hgM
 nYGIQuRrtC6B9T1OaQGmuuz5lnRgP_HhEr2GD50Bb5yMcjbQp
X-Sonic-MF: <jason.choi9@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.ne1.yahoo.com with HTTP; Tue, 31 Jan 2023 19:59:34 +0000
Received: by hermes--production-ne1-746bc6c6c4-x7txm (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID bff308bc49515dc71611fa6c0d1b4927; 
 Tue, 31 Jan 2023 19:49:30 +0000 (UTC)
MIME-Version: 1.0
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Date: Tue, 31 Jan 2023 14:49:29 -0500
Importance: normal
X-Priority: 3
X-Mailer: WebService/1.1.21123
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yahoo.com; s=s2048; t=1675195174;
 bh=bisEF1+2yZChXhFwehUPo70cZwCIiipDCTg7QUdtJ4k=;
 h=To:From:Subject:Date:From:Subject:Reply-To;
 b=OZroWxNyfkStpHoSdGKuV0R7oRGFvgNy9qu33qZMz5OuUsmHHBnpkOC2UNfWRk8eAyMxspSxSJZU78ASpTCXoFLiTNoJ+gTnOghb4ugj2hgWKyo9c+GBckxVInKKqNGCikulvFIZ81me6Kg0aSZEPWa033vC73FFzn9O2Srd4dT/W5nxxphIcTqh9gkxCIUJlPs0FrWe8YYzXME+FyT1dwIHhrw4UMQTKlmkgGecKeX8D8uI6rFcjZyGMrBn0KoSYQ6/K5mLJa/YY47d7RzBYMUtoLKsP5DALbFgrdOlLzyl/etODMUPB2TQSulUHIWj0lwwaruyFu/ynHegRBhHVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.a=rsa-sha256 header.s=s2048 header.b=OZroWxNy
Subject: [Buildroot] How to know the package updated?
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
From: Jason Choi via buildroot <buildroot@buildroot.org>
Reply-To: Jason Choi <jason.choi9@yahoo.com>
Content-Type: multipart/mixed; boundary="===============8924979719216454027=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8924979719216454027==
Content-Type: multipart/alternative;
	boundary="_BF1C9F3D-BF00-4424-84C2-42883D609EC1_"

--_BF1C9F3D-BF00-4424-84C2-42883D609EC1_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

I=E2=80=99ve recently checked the version 2022.02.3 and 2022.02.4.
I found bind is mentioned under fixes for download/compilation/runtime/lice=
nse issues in ~.
So, I compared bind package between 2022.02.3 and 2022.02.4.
And actually they are same version which is bind-9.16.27.tar.xz.

Does it mean there are patches maintained separately?
Or, am I misunderstanding the change log?
Please advise me.

Sent from Mail for Windows


--_BF1C9F3D-BF00-4424-84C2-42883D609EC1_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta ht=
tp-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta name=
=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:"Yu Gothic";
	panose-1:2 11 4 0 0 0 0 0 0 0;}
@font-face
	{font-family:"MS PGothic";
	panose-1:2 11 6 0 7 2 5 8 2 4;}
@font-face
	{font-family:"\@Yu Gothic";
	panose-1:2 11 4 0 0 0 0 0 0 0;}
@font-face
	{font-family:"\@MS PGothic";}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Yu Gothic",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DJA link=3Dblue vlink=3D"#954F72" style=3D'wo=
rd-wrap:break-word'><div class=3DWordSection1><p class=3DMsoNormal><span la=
ng=3DEN-US>I=E2=80=99ve recently checked the version 2022.02.3 and 2022.02.=
4.</span></p><p class=3DMsoNormal><span lang=3DEN-US>I found bind is mentio=
ned under fixes for download/compilation/runtime/license issues in ~.</span=
></p><p class=3DMsoNormal><span lang=3DEN-US>So, I compared bind package be=
tween 2022.02.3 and 2022.02.4.</span></p><p class=3DMsoNormal><span lang=3D=
EN-US>And actually they are same version which is bind-9.16.27.tar.xz.</spa=
n></p><p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><=
p class=3DMsoNormal><span lang=3DEN-US>Does it mean there are patches maint=
ained separately?</span></p><p class=3DMsoNormal><span lang=3DEN-US>Or, am =
I misunderstanding the change log?</span></p><p class=3DMsoNormal><span lan=
g=3DEN-US>Please advise me.</span><span lang=3DEN-US style=3D'font-size:12.=
0pt'><o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US><o:p>&nb=
sp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>Sent from <a hr=
ef=3D"https://go.microsoft.com/fwlink/?LinkId=3D550986">Mail</a> for Window=
s</span></p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-size:12.0=
pt;font-family:"MS PGothic",sans-serif'><o:p>&nbsp;</o:p></span></p></div><=
/body></html>=

--_BF1C9F3D-BF00-4424-84C2-42883D609EC1_--


--===============8924979719216454027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8924979719216454027==--

