Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B832606A320
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 10:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=I7n+JpvJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A05D60AE4;
	Thu, 19 Nov 2026 10:24:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ufJuo9PrSsWq; Thu, 19 Nov 2026 10:24:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 25A16607F7
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795083885;
	b=Hd7vhyr3uiEg019ysORkHJWGJKrZF/Zq+XBNHleiGS+jvJxZiANjtQY4n/99ClLZo1gw
	 fCxPfiiFtUSde/fQgWTNpDUv8S9Kr7Yrok5FamTXfqydaD+FTypuCUhGcgDChbhc0UBnB
	 u5hj5qETacC/WQFNgcu+0Y8lmdEiW+8Up4jk/jLWjYHGPMVng94rSAStvUUc+ciehhJL2
	 vvn0Oqcccu3q1peciMVHoEHCwadcCyID6aPxeuIeb1FdCMQ3hi9Zv28vjjTirXywqsug1
	 qmH5FRRVTp18siTsm6VsGHae3wIJY+gzvK+F9pwyp8v5GLvzSG+V0YEny5/wcvR0Qng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795083885;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:X-Sonic-ID:Received:Date:To:
	 Message-ID:References:MIME-Version:X-Mailer:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Errors-To:Sender;
	bh=hBm0NL3WwN+CnMSJcjJ7fC2AHwxZ3z03ZeF99XBZqVM=;
	b=q5Ca32UaOiJ8zP+1TpRwiXLHdMfsGHr3/70i+dTNHJHqVBUpkgHJJC/cZf1XY3Tff76u
	 FcYAKEMzPumQ9JJaOUmFcL6jF04hQxiLn8RkUe468SwP4JBm1iYw6Ej5EqacN7fvGwdfF
	 7hn1Bi7i4E5wOdYoYY2EKxH4bzz/cWhyyLc/+nkxeDDAkXqop/y1ptrqpNe6FfFuXaUuv
	 y6d0LCii4V0/vuNavfo1eIuoswrU+fPFQlyAnj5RFcIkIx/7nOVVJxal5yMdvuTu16Svz
	 Z4EbtNCWH5motjmXLGCjDJ6bTceSADOGjmDv9liPs5LX+LZt8YcBVPKxmlHNaH+vWuA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795083885;
	bh=hBm0NL3WwN+CnMSJcjJ7fC2AHwxZ3z03ZeF99XBZqVM=;
	h=Date:To:References:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=I7n+JpvJOKnPispgEh/m47EQKXCjvTsF1poBsYcdBCd3OmbusN1wB+Hok+f7Crlp7
	 1OHGGeiiII7hQ6E3jHuM/htEqcOg0ViFcw2qmCGD43tUuYOH9FHCyfWcKmtLB9XPdy
	 t6jSmJIkxsuO4xRgNUW35CudLZYl5N5VSJ1S+oAH5czHoJelZLJaEHVoSmfBx34ZRn
	 uiEi0N/twURQZvfQcfscK0QzptWpowFgQ7E3eVMzNmHGJk72dNyjKrFwWVuLfHcPZi
	 Q1A+8YRYt5ARoQmijq3RBVVzVbFAL5VcLIn29FV5ImndjTR0BFWYzn1R4FErHOF5K4
	 aY/j6dcNSkhTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25A16607F7;
	Thu, 19 Nov 2026 10:24:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 34C5415D
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 10:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2685680F2F
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 10:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ygyQhDQW2Q2x for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 10:24:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3E09580DC5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.163.185.206;
 helo=sonic321-25.consmr.mail.ne1.yahoo.com;
 envelope-from=davidluca3000@yahoo.com; receiver=<UNKNOWN> 
Received: from sonic321-25.consmr.mail.ne1.yahoo.com
 (sonic321-25.consmr.mail.ne1.yahoo.com [66.163.185.206])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E09580DC5
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 10:24:42 +0000 (UTC)
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1795083881; bh=9k7c0ZuqTJIVfPsfRgFL54UGc3elgbwD1M76Obayqhh=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=M1l4OTxjchie5yq5Ff1of5BSxfp+yGBYbxlOzJUJ/IcUTD7oddXOhdPu4YORyQyB6GgA0bRmja9cwtCZov0RiMeKnAuBvdMi8DKpPokELmIA0kMtR41kQZ4LvHo2OxilJjInTGLwZzhpoPx6QCrIfMJFzzd0PYNDQSuASOKV6pAgqjhuPIpzrr55K60h1ByXHsD7ZykMIpskbkXuPf83BaOBGbbmyrX4ePSJNzQXFVMjuqEsvIHwjPGJZkRZO5t1pavQVJF0iz5dfNgYTJOD/fVWuNtPlikGpJCM4mNLy1QiINBv7LuqZgT69VtrxQn4T0NkTUhItPoMqeijvFMqHA==
X-YMail-OSG: G06O93EVM1mc2u22KzHpkhQuPobkJxVLCkIZn5To1ixklTS4CEf596zAUjVh_ua
 RtuPVwSFxdUwVZEV_KOCX9BxNcaVxJxr5JOe8Q5gFY_p54JqWILG51VSXh6HWdVpqrEMXs4VvhTq
 jnUqMz86wlySdJX701SC4nJha7g6geRF_PCzYSQTfnH8Y_anMpNszjEhPKprjWJ7lh2VeNQxSGey
 wLRvdfV8iWRpFe7rTNVOovytiguFzlkgd74Uz0g3Zs9eIqOG9FR8Sp_ofzYFdOS8OzQ.aBaUb0vF
 KXL1B8q0VeHhJicPUFEBGbbLY1hXFAs_upz5yLYomkZCD_6tii_34rnZo37vD9GBneIsAF6NeCRb
 sVb.lf22T3iOSB_lgyAB70CdjfJO8T5CRDpi.Uv7xk8YcEnisOLAYHHqhLJ0uZ0sVlRwRDWDOmRU
 HFNVYcmo0OrK1t.hlzmoYfr5_SDjQ5.H2eK9z3letrfYn76bMD446lRvR72Lo0upSOspVdRRIVQJ
 FK_yYTYJQEPbYOIJc0HVUyacVl2KrUuVnWlLvft7IxvUwIAVhtdEbWsDrEKo5RIEWSzhwQTk2A0M
 e_ndVgbRbR71YQfMRKdiRieKOmx7WSIXQnjaMMPbT_QsMkaJ9CXbjrprBIoXCvBVALYR.2nC_VYp
 yFdR7w.IXM1gSxBVMKcTq1nntCgOPMF.U.bAf0MPlgpcsDb5ba7EFPAAYVC6xkVS9mEBL1x.Oc7g
 HLRcJjkWDSyIog1l_dR2ECJgkVG0YEkz22k0QiqLvA82KGLnwKS32h64iJcMRkdF53Sr0J4qjiKT
 f2QN0dHoQJl.OJe1iF109wNhv11qBv4ZYyb1SDHqhvuxOAGAaluS7EBPJWmHo5gk5TjY0d96mz7a
 98c6.WEHK8ntMUzYcSSSfUcdV9f9uGcNo3Cfoo1NVel_AifS8LucJ5yaH9MOhwoDn5iLEw6Zr4wG
 dm6X8IWpzbYZz5gLUdJcKSWLQ0kI8HBXHVxvVNPhCz4R7JkwnGq7T4rAvbgz5sCNSQuGL.XVq9LL
 zz_0AM.CT.NQcobt4p8gPFaT8Wy7GYg0QzC6DJiB8GM0.Tezbrhwkj.uLy12c9FSkk1mmJ0wiRKY
 WPOO.sL9XKbWJYUccQo7xEvRJia5IAOO.rWACF4JHNSpnt35jX6tp516WX23Y7hckY5wszCEpiH6
 mAeBv31DKmDUVsZSCO6DCD.S0TOQn6NX8N0eoH9rwj9s1c2JyMVAkHdxEUpG0ZVlWLNmO7zI7mJa
 KCykoeePN2iSi9ZwkRZeRHTjYXGNiZz80FpBxVj9p8GR1jEeXeJcsxTh97NFd2SrTlL_mYTsMjta
 1d7yxVoN_2p_qYH06mWMXBLbbjdcZBDUCZEOxGsvT2cshmtAFr1TYec7ogUsRnJOFGdINZ6IS07A
 zR0KyUhbaqokVZ0D3KT8k2p62QmiCQdAey_BvxGhPHpMu_mc6AuR5b12mcPBYBMXcwWzIkpYEz49
 VJZF5DQo3p9kiuOmJaUOwZGBZPmD2_FXiPEzODd_qA8A_I_MzqzAY9os5KVn.fZVGI2N6jaJXL2V
 dnYW6rW9RUU24qvfUc_4xsjb13ZdnA8gmO5DzWvicGnWVPijvdBPzmwA7jsCA1UXIoQnolrJMew7
 1qpiBrXTulNRwoNFpUbUY5.Nv6VhCPaDBj6QUjX__EF1Osuz.WiqiiG8T91p0q02eEviqOpA7oC2
 pgth_WCzXuk3eBFEhK8AH_VoFr23oscoRGY19OES9hobpDV0pzyAy_4rZPoLuA8PZgXGcyiXDBut
 t24LJeF77yoFW32EMhiwud4R0MBR.JxCiS92Gfzn27b3sLEwL4W5vkvpfWycCCnxTHR.KTFi0HDI
 hdKzHKuOqeAyUEcIff36IPf3uB4o92ZTMvGwqPttd8ucJR1QAbEieSrmP_zMCPUpHT3VKwvpINuR
 DVaUaCf0Va6wJ2K03BzkjZecTiLLiArBriAu0wwrVg.Ba35wkag33TbrQr2XcNyqcRKq6zTlrk92
 s.OE.aCRQG.08eH.oVyynIy5HbcXBJfR7K_2yDQSzCEW7vUE1ErxEdOyTkYMBFSU2aMdSaRUGs65
 pFEdpYsXg9Bx8aPjzUuPX8NHGDHpXbT8be0dLDF5ZWhl910J1ZJ4WMDfBfobSqGxOC6n5OrLdloe
 nsVivvGcNo169XoByZunv.72QnNehJn4C9umIjzFSR8RSUSXNPMXI8uMEmyOnl1CffH7QKib.w3l
 g0hgpKU3IUP4RVUW_hm07O4yPJA0iLI.lGKXVP44BN7Z4liU5J4Yix1g68V4MWgpzGPtMeJdcYIn
 5Kx.O8Ml.7sYRy_MKAz0Tvjmdr_WRAGX.s74bh1Nu_3xLyLkW1a6DVw2OTo3R
X-Sonic-MF: <davidluca3000@yahoo.com>
X-Sonic-ID: 7968ec69-45d9-4b24-bbe6-89bc6f631db6
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic321.consmr.mail.ne1.yahoo.com with HTTP; Thu, 19 Nov 2026 10:24:41 +0000
Date: Thu, 19 Nov 2026 10:24:33 +0000 (UTC)
To: <buildroot@buildroot.org>
Message-ID: <519380524.50174.1795083873768@mail.yahoo.com>
References: <519380524.50174.1795083873768.ref@mail.yahoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: WebService/1.1.27079 YahooMailAndroidMobile
Subject: [Buildroot] Perl missing modules
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
Content-Type: multipart/mixed; boundary="===============2731046160402603272=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-1.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_REPLYTO_END_DIGIT,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2731046160402603272==
Content-Type: multipart/alternative; 
	boundary="----=_Part_50173_33201324.1795083873767"

------=_Part_50173_33201324.1795083873767
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,=C2=A0
I have Buildroot 2026.08.1 successfully building a x86_64 image on my VM, b=
ut on a different VM that was building 2024.02 without issues, currently fa=
iling with following error:
"14:04:35 Your Perl installation is not complete enough; at least the follo=
wing
14:04:35=C2=A0 modules are missing:
14:04:35=C2=A0 =C2=A0 =C2=A0 =C2=A0open"
The version reported for perl is: v5.26.3 on both VMs.=C2=A0
I tried a small perl script to test 'open' function and works fine, any ide=
a what I'm missing?=C2=A0

Best regards,=C2=A0
David.=C2=A0

Yahoo Mail: Search, organise, conquer
------=_Part_50173_33201324.1795083873767
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,&nbsp;<br>I have Buildroot 2026.08.1 successfully building a x86_64 i=
mage on my VM, but on a different VM that was building 2024.02 without issu=
es, currently failing with following error:<br>"14:04:35 Your Perl installa=
tion is not complete enough; at least the following<br>14:04:35&nbsp; modul=
es are missing:<br>14:04:35&nbsp; &nbsp; &nbsp; &nbsp;open"<br>The version =
reported for perl is: v5.26.3 on both VMs.&nbsp;<br>I tried a small perl sc=
ript to test 'open' function and works fine, any idea what I'm missing?&nbs=
p;<br><br>Best regards,&nbsp;<br>David.&nbsp;<br><br><div id=3D"ymail_andro=
id_signature"><a id=3D"ymail_android_signature_link" href=3D"https://mail.o=
nelink.me/107872968?pid=3Dnativeplacement&amp;c=3DUS_Acquisition_YMktg_315_=
SearchOrgConquer_EmailSignature&amp;af_sub1=3DAcquisition&amp;af_sub2=3DUS_=
YMktg&amp;af_sub3=3D&amp;af_sub4=3D100002039&amp;af_sub5=3DC01_Email_Static=
_&amp;af_ios_store_cpp=3D0c38e4b0-a27e-40f9-a211-f4e2de32ab91&amp;af_androi=
d_url=3Dhttps://play.google.com/store/apps/details?id=3Dcom.yahoo.mobile.cl=
ient.android.mail&amp;listing=3Dsearch_organize_conquer">Yahoo Mail: Search=
, organise, conquer</a></div>
------=_Part_50173_33201324.1795083873767--

--===============2731046160402603272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2731046160402603272==--
