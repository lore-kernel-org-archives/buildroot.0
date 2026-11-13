Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08374606B121
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 10:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=b/0pYjXt
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE78781C20;
	Fri, 13 Nov 2026 10:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ext236N0nmR8; Fri, 13 Nov 2026 10:14:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B745181C71
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794564868;
	b=eeVQiz638F8yign74VzMJmX4Pzq0IQpa0u077LyaHCoNCPbB46gNnHAabQcnCvcBXasm
	 WaMx56LBFMrlNZccNxX6Mge2OqgpAIQ9UX1V5NsFeMVaiTyuiiE7nhnsAPfE/a36VddZ+
	 WJEbDZ/raLs2hgIc3tjDdwxCqbRSKW//4HEW7paUHvKZjsYz2Ts4M2Jz1L2DZ15SxDuJM
	 fPn3yzKiGQqf1z8V6pcHnFCE68k/puAkF1ieA0dfrR7KU2n69O4BNmULjgU+OEiVLfRSF
	 z/OvWLZA8txA/h65UKqEOktxveZHevCmmsYQowK7PcsxLRHsIK0vNRguGD02LhPRRcg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794564868;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:X-Sonic-ID:Received:Date:To:
	 Message-ID:References:MIME-Version:X-Mailer:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Errors-To:Sender;
	bh=i1Dw58d1AsfRjO/qHXXvQRBayIRoBBxhFA07nrfra7g=;
	b=mdyhFhQ2qW5snFlzgqyEm9razYvCM3cDn/NUqe50B2FrxZsn2nghI+Ej+wIJtbg5qbF7
	 QzUZkByg3u0NUeKVFhnGSkJR3Wqy4PW9sohLFlSVFsaFvbxjAfaAdNp0ETI7AkIL7sRtL
	 URAcjjStFhiWd8L3dCiNUeuyt2pubC/7BTAcYq2lLD80S6lTnnTE4Oz91X5ssb0hzpX4k
	 DHoXqsWQBrD8zkTZ7W9PZatPvrC6nT1pARW3dndbdzJvuS4cU5MxQsNE54sGzbyMtvy+W
	 HY+yzK0eiLjtVMiCcB+42eQmjT7rHgM2qTYHAky4oEckiALny7c5P0ZFqE3OhVXWqYQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794564868;
	bh=i1Dw58d1AsfRjO/qHXXvQRBayIRoBBxhFA07nrfra7g=;
	h=Date:To:References:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=b/0pYjXt0bCqbKAzQ8oFn+6jZl0lOIN4Bt1qyEZvTpJywoHyIlbmjc8TswrMJI2MU
	 6catYjLDVEBpLOj7qWAqvB2w2XyRnvI7XLUfkZ+VNlY3ZMfOjVsv8SOWcbARJfBC3j
	 Zk6yKhaMmSPoq6emIoTZ5LqtqAvesAG7C6u6tyOJEN6x8JTUv1k4/ckYoQV8/46myE
	 2R9+k689rehrM91R4jgGqclsDGSwowCPVWbxVqYkexSbbv/wuoqzWYxgh1M++M+gOn
	 JWzah8V4wdspTahjRMDcd/vLDkUjSU35rYoxMSHwEKCU7zgQq+qHnqqcvmsmCZPSl+
	 AAMeameqtsgaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B745181C71;
	Fri, 13 Nov 2026 10:14:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9285B1A6
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 10:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7819081C71
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 10:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 63oq6ehPD9qt for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 10:14:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7A2D081C20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.163.190.148;
 helo=sonic315-22.consmr.mail.ne1.yahoo.com;
 envelope-from=davidluca3000@yahoo.com; receiver=<UNKNOWN> 
Received: from sonic315-22.consmr.mail.ne1.yahoo.com
 (sonic315-22.consmr.mail.ne1.yahoo.com [66.163.190.148])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A2D081C20
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 10:14:25 +0000 (UTC)
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1794564864; bh=3/TLZHJAtWJf2h47CI5h+q6Bf+M6jhGYA/wBwI/TxPR=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=jiK2Virlh3vgLySEQ3Dya7bmU7ERuQpFHJXx/QQDad95mnB8/Q6yn2h3j/cfxOqVNOOidjMJIMEFIZPUHSv0E9P/NPlE5RPdHpqZ4M13T6DuD2dHRpuAnUxa0sdi6bbyUsSu5dBjo3iYrLQZCgnndO2UH3QO5T/lOJjDiuSCu+YH+Qh4Gz8ErfyBH8JcLdRFmNXEON+FEVyzc2ZBgwpB4TL8Yt5MJV8ze71FY5LaIbR1JptB3hHx5HQct4/nPaGOQv/eDi2tRDFVcAdMkgqm51YMAK/Ec6w789XeONesPtoYIpyFVzZjAzVyblj5wbXbXh5Ycxlo3SWe0coXGLToJw==
X-YMail-OSG: zcZwMoIVM1lzbzNkTf3Bh4RNmq1iEAzbE1h1wTT_hI4jwPQ8cJPYfQj4OBktUCj
 VW9WX2vbEH8k04OU2d.SlH5U2U5Bclkmw3tDSm386lbo77oKpoAsaYhPwFdUKMNpLoSy688zPUNQ
 EhxESdm8GvuKB7qlnDNmkAfEXZm4ZJ7K75P4_8Tx6NPREakG7J_vL64iYuUvevHg6uY3ZasZc3l9
 8CPCA_i3TeG_ubb9iKZ_cQgf.VL1ocbItDgkP7g2thSck_OugsTV2kp_HKrqHjbbByn0YIODaX7I
 HB8HtOltnn7hcFNDr2TKtebVJ29VneStYDmJpVg7Yxi8W4zy7xLHaY56mDhISEAUctGhu3pwh6yw
 KfuyVeZAVp_926wNFzAqPzusofqNmSEVThdTWOwBAXNXyEZFwIj.qEv7_r2Ree1rlGgDjk1M58X9
 5TtvoHecvZTOtnGlBwXYsy43tvKej2cgIpXHuwV7h8s7JP9E0Rphmns04I6WAjyIVoCvu7LwBnR4
 0H2RIqtVXlD77FS8lw84NS2SDN2j1lBzHNijFRFDKQqEafm0MqRnVoE_4XdbHDVsVhxYH87CBwH5
 dFEkyxgucK8z8eazcibTXe3dvThIHth9NzpYkBjMptCXOyLgRkngatMX.D1RDMZaPyRrBtFk05YA
 FIQ9iCd_bk897MNvkK6SxGZYUAigmVFt3nb1o.7tz6OUi5J_1MFWrCKvZfCbtRKocNV1J4WcXqp6
 PIHh6Jtst0qDl1raTPKLO7oA9TV1ZlEScd6XJ0QE13PhttyQl.mduwISSkDDIBAojVcpajVPX8js
 uNOoXF4DGVfmDMQB5aaxVTy13zOco1HRnxxh2OxKGahFEIjtJGaaanXnE0dvL2DFlueKqgvye4Lc
 2wGd5VS45jlwUGZMRVxWgIvdROWW3AGRTWHcHqxVb4ba3GxzURcbAVcuNgZMwkQt03OMCRA1Kh_p
 kyLnW0t10faqJc8HAE2_74hHbCoD.SlOwfDSgpBkbSBN9nMNO4gpX8M56h_8MZQGmvTmn_2D7Ati
 W_x2Lx6H.mq22t1UWEngUQ_c6LkC1EGNwpZaHWAxNdT6wHX_ZySU6iH6pPbu.3rHVJ9udaFzCp3.
 o_l3My8ogVvcgtkdZc9DCvPLd41RJ.AgZOSU.PS_cJcq6h5kmYOCNBQSE29YfQNzFBx2y4K7zCnL
 rWO_W8oAwd3j5aV490Qef7egWe9FTf6Dm9uFxOqo7jUATPAa5ZOrGm8PBtDn6HJ8chayNfI1x3o.
 yfbfNfzed5kiSHIBd278BnU8rr7LxJ83Wn7329M0Uu9JQ98GLk7TxQDeZIkzdGMm1XbuZ0akS4vr
 7bJA50STekthbVF4JSc5PBCMu41UisqyRC378wzzUF0hOj_h1eYsGROusNkdgHk0mjMP1TLa3W3D
 ebWpk6QyKUBy1sxi9Iv_m79UHsOT1T5lydLLpwymTUp2DJ6Ac7fPzhwavtUYfW905ZafmEAKWkz2
 IkHTr5PBu6rEciUnXuRkVWFoL9mb2A_3CMLSbSI_TFtG5vEf.livwVxVgK9AJF666bQrJ3Szwbzy
 4JLfHib2FJSxQ5OQqCyQRzINafENgQYC9v3H0SpKNLOv8aoN_m7MYXk3FtvkNVV1TyEIb22sQKA9
 oAdVAuiMGkgSHCgi1Y6ZP5shXpfoXA1sIEYsDxr05gBcE43_0GIsQORq5NCnwXa59MyvqJt4zYLd
 iWsGL5cMX1Abxk.B20HfbCkRUIY.HrR0jn9dlodeC8vLf.77zdZ1hoYr_.nDDzfJHCetZ7z98m0t
 7J2pbI6mPv80puPrLnLk0kwJJi0jD6JCANmJXOF3c0mml9cEdxWJdVwkpogvZCINePmEUxND6qKw
 pv8FqgYt6HJBu0GQUlOe4iy5RFXhX0a2aBZDwM9I7eErcqFUSx5RTh6KA62NI6_erqk6Hd.FANdS
 hDEzkXv5UEKgx8ZdkZ2pfjc1yEOrwYdjvOzh5rEKemWQtikp5j1PchrbEFbJVPAlDS_baWYJxKr3
 XbQFzAnmekS6hrfSpZEGo3ZMwBBEslUte2KRBFcZjJ2M0jMFf263vNlNurH1MjQQ_gu7vFOy_sqR
 KZ33hmHS4WM7z.IEWlKPcyfdtaw6dciACxs.eQZ45vtjUwoBk3iPxclWD0LfpcVw5pLSrxqZ2Vbj
 WvTkGhTCdLy5Ey8A15f0Tzrxi9jUatHjjYXFApF19J5HVgjOquEBB7YQ18kmXyr9qiaRxqMpbwfG
 YvqK5W2TnbYd5ZOJLnSaRDa4Agra_nZ1_DOU73CphiFAr52K4sZf16whYXf3._6p89Odc3ScumWh
 NFK.BOONT6yE8J7Z8ttE9SEJiNkbcs751OGiFZYxFdtiRk1uxCzJ21M.I
X-Sonic-MF: <davidluca3000@yahoo.com>
X-Sonic-ID: ab7dd84b-8264-4e40-8cbc-a1c6bacdd7da
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.ne1.yahoo.com with HTTP; Fri, 13 Nov 2026 10:14:24 +0000
Date: Fri, 13 Nov 2026 10:14:18 +0000 (UTC)
To: Julien Olivain via Buildroot <buildroot@buildroot.org>
Message-ID: <813093532.2289630.1794564858648@mail.yahoo.com>
References: <813093532.2289630.1794564858648.ref@mail.yahoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: WebService/1.1.26943 YahooMailAndroidMobile
Subject: [Buildroot] Fail to compile Linux kernel 5.14 with GCC15
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
Content-Type: multipart/mixed; boundary="===============6749763500132394481=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-1.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_REPLYTO_END_DIGIT,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6749763500132394481==
Content-Type: multipart/alternative; 
	boundary="----=_Part_2289629_1719014681.1794564858647"

------=_Part_2289629_1719014681.1794564858647
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,=C2=A0
As mentioned in the title, I receive a compile error for arch/x86/realmode/=
rm/wakemain.c:
./include/linux/stddef:11:9: error: cannot use keyword 'false' as enumerati=
on constant
Note: 'false'is a keyword with' '-std=3Dc23' onwards.=C2=A0
So I patched my buildroot linux/linux.mk to add:
ifeq ($(BR_TOOLCHAIN_GCC_AT_LEAST_15),y)
LINUX_CFLAGS +=3D -std=3Dgnu17
endif
However the compiler error is still happening, any idea how to fix?=C2=A0
Best regards,=C2=A0
David.=C2=A0

Yahoo Mail: Search, organise, conquer
------=_Part_2289629_1719014681.1794564858647
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,&nbsp;<br>As mentioned in the title, I receive a compile error for ar=
ch/x86/realmode/rm/wakemain.c:<br>./include/linux/stddef:11:9: error: canno=
t use keyword 'false' as enumeration constant<br>Note: 'false'is a keyword =
with' '-std=3Dc23' onwards.&nbsp;<br>So I patched my buildroot linux/linux.=
mk to add:<br>ifeq ($(BR_TOOLCHAIN_GCC_AT_LEAST_15),y)<br>LINUX_CFLAGS +=3D=
 -std=3Dgnu17<br>endif<br>However the compiler error is still happening, an=
y idea how to fix?&nbsp;<br>Best regards,&nbsp;<br>David.&nbsp;<br><br><div=
 id=3D"ymail_android_signature"><a id=3D"ymail_android_signature_link" href=
=3D"https://mail.onelink.me/107872968?pid=3Dnativeplacement&amp;c=3DUS_Acqu=
isition_YMktg_315_SearchOrgConquer_EmailSignature&amp;af_sub1=3DAcquisition=
&amp;af_sub2=3DUS_YMktg&amp;af_sub3=3D&amp;af_sub4=3D100002039&amp;af_sub5=
=3DC01_Email_Static_&amp;af_ios_store_cpp=3D0c38e4b0-a27e-40f9-a211-f4e2de3=
2ab91&amp;af_android_url=3Dhttps://play.google.com/store/apps/details?id=3D=
com.yahoo.mobile.client.android.mail&amp;listing=3Dsearch_organize_conquer"=
>Yahoo Mail: Search, organise, conquer</a></div>
------=_Part_2289629_1719014681.1794564858647--

--===============6749763500132394481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6749763500132394481==--
