Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686D3606A6B5
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 19:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WixpIw6k
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D16A80C0D;
	Mon, 23 Nov 2026 19:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ajQkH16wo1po; Mon, 23 Nov 2026 19:38:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7CBDD80C38
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795462702;
	b=NtLaBO1X6V3Yc2HLd6quF4T+TM+/nllywZLkyx+FYrpIBqwk9/5TbhWQaXsweAjo6opD
	 g8QQhWK79WVnLw0fZ4DhbNmwBBdFvt3/O12f0cuHL57QsRT/r64GHipK5LFr3PXejY9/x
	 xcbyghPvWiooZQ2pz8wEeJ1ISGmZMkzvM1WAH/sgUYiKwyBBi7VaiLZ6DeFtERd9CaAeh
	 D1lqONpNGMBjf+vCXBHhontuAbupmXlikr1XGvpdnKgl+45ZHVKhh3s2Kl9w8CcnjsQ1i
	 d/1/b90+H0uYp937+pfXyNW6o7V03YX9JA4eiaqzGohhjvs4VVUKeY32mO/crC+KF4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795462702;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:X-Sonic-ID:Received:Date:To:
	 Message-ID:References:MIME-Version:X-Mailer:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Errors-To:Sender;
	bh=/p0/3ueuPPW/2Nvzc3QzOoa0fAiyr6PMccNy9ufiCUI=;
	b=Oeux/cJn/LV/RAoOWgLik5DJR1U8MP7zQKy6XfgbLAT0eo+PfMSB11vmNG7LQw04q76g
	 uqSpeb9tBYVAsSgVbIDebIWTusibNQgd3mQPI8O8CHd3i4gxRhHrGkVMdGcihEYoP+gJN
	 KCEnL2gUkAT60rw/N0ejJO6x3xcgBpW8BHXhPQDqRZ7rgsiS2MZRxEBP33UUUhsqimjCf
	 j3AgWhHVEwhN5u6aurzd5/yzR6I72aTlWgZVo4hrOi6DRqdpY6rjkaUbRKf/dqU5WOFgj
	 3Rq0Wu2iSrvQQHF2iBh4Hl9fAmeehZQgSwgzSXK4b8ynGgQSEzv8/raDtRoCATsPoqw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795462702;
	bh=/p0/3ueuPPW/2Nvzc3QzOoa0fAiyr6PMccNy9ufiCUI=;
	h=Date:To:References:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=WixpIw6ktzlOn+UV6XTGb4sPR9BDnHRFnDbNOoDx94tBnJtL2kqooYq5ap3yQIZ7x
	 y/nqS+HL2Vbz4di46MAPvx+abgOAsh3B1c6BpJq14uDceX1nbC9O90c2+4nj7VzNnT
	 nQSQy7YviEwbXLFdq6bILsOrw3uicgobvGp3lp7W8XXV+Sxq6Cn28UYwxzb6GqCUxp
	 xrK1+Fz+qUGMhjFq916hTjkAcqp4SnHXLSkHYdWTggJ6YMlUzBmiqv4R1rvh72VoUI
	 oJ8OlNFEil5dLbF2XrO5cvZD5WLaWBtVZ4rfxawiB5lE6QQ2N65O51GeYpmlVYetpt
	 xqllI1WgCR6Zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CBDD80C38;
	Mon, 23 Nov 2026 19:38:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 27AC822B
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 19:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CF21406F7
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 19:38:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9wbhZh24A7GT for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 19:38:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1A340406ED
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=66.163.187.146;
 helo=sonic316-20.consmr.mail.ne1.yahoo.com;
 envelope-from=davidluca3000@yahoo.com; receiver=<UNKNOWN> 
Received: from sonic316-20.consmr.mail.ne1.yahoo.com
 (sonic316-20.consmr.mail.ne1.yahoo.com [66.163.187.146])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A340406ED
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 19:38:19 +0000 (UTC)
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1795462698; bh=n1sqiGiGrzTeZbURuqK7LEcEHsz80p1ioEmjNzMh4g6=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=epgDEXWNBdADfE9c7gMXHRlacD8qOQI0YbxbuCRfTgLX4C0xs9237icH7WX3wNrnFuSa+VHcSpPMJoLGCsPcxnWHxm1ZgSh2S8lHOT4nMjZvFn5NBMRHlJnjkMNwy1MPldN08TgUXx2yvQvRrtBKm05CYVDn9GTlBTd5CXfTSjTuf+ITum1NV2Bou6x1vd+TVX/RI9Rhlp5Kg9jl567ISVY26T6Yvh22kn6/of/JsaHWpQWtUho2VEu3HNdxzNuNJ9eHtb7lqUwZTMGaL3bgmLGBMUUrER/zs2iSjx6eVgH3ed5z0Nb3cdkw/Hea9v7IklHRYEK2qhl6pXv9JML4kA==
X-YMail-OSG: ppsCxpwVM1ntWCnjwuCcYjMRkon9pAkA1aEh6Pb.841U11ceEAmtz5P.0byrURP
 9p5DYr9eX28FtnPRR_Xq6PMBlJH.i.01bwgMvthQq1sHHHVX93CTRKusqDW4qy3iRnUVOj1jFXHd
 25qOielL3pwh35dPV3r03EaAd56qCtz_wahcEVqMP_e0ZX9IJB3aYIpbhMXpMvUnmZnKpOVP1scc
 dHsN5AL9HeqbI_UEbp5ZmV50ErQGPkA5RKzP2T3GmPmy7GKsGYvINQD7zkQvtGXP5aNvxK3ClWo.
 p5rOxp3P30gQJm1t5kCuNL18ogCUMGwcemzohFlMaxmpWb4AKvKYXMgXGdih7qcJxflFewXHG_z1
 66jgicn88Un5pHa41nKdZ929zVn8w9ZOMNffRWG7spb0o7O3T0YlIG90yqX_5nCR9DjCf9FwKHh5
 iBcYKJJhwz5fdQ54vJs5F_Unjr0selDJ1Ybp1yyIMUCC.Ze22X5qkERbPfcP7BfqiI70hdcPyE.4
 sE5AZ72eWKY9rG1D57bhVAccmr7F7b8aQGfF0bbGMcP8xn82TkVW1qWBuPLEuFWKQGDkCew9A3Wb
 I4f1k3QUnF.uJNruHFPm7l5rFKOROADUoz3fR8uVXeZHsX5nEQ9dFlPbjUM9cyyPijuPSOcoZvpq
 CzaoUzVdUjn3mRAEQj8eup5nVzcF.ZrQpYuFVNx1dSK8.Vxw5JK70_HqqZ4Vr9sPCOz6to3bLg4w
 597zQO7W2sRuxtq7WPLiwauA.jyeHrQ4OW4wWXEp8oFAiKTGsklzlleyWLTfpGiqJLQDoNO_5ALA
 HoyId5YtJRr39kiJp4NwCypeScpfhJwF8nzFjSVCiDIX3B3uWyI8A67XFf572b0aRZcL6xTlMACX
 vWNEJ3n_H1WwDhu6E.xpmwHGvPXaCQNq86wI6Vd_GJbstplW2XoZtsRH1i93h76XXk2DaPrlBHoS
 AVs.ArFty2WUu1LWYPfElIECdUR03BYJgwajmAj53A1Loa76_wEzgtRfXsld.f1qm4EkhNnX5wUI
 YWVWketNz8miOOd9YWIAmreVZMjq137O4bVIDU9IfTRf25UD7aSs.wGfkxv8EOtugtzMlkdrDU5w
 LqkElTNNBlYT6NTkCooO9ooCdffCK29.RtzMybRds52IqTjAYjyUqpe7e_BkRYaWQyZcBOr0zju8
 CM_LbvCVu2Qdns.eWhhhBwFUh8cvcv.EuBxA.x3LhRTAcY3Vvc6k05WAwxOIOEieR6doh0I9VDpt
 A.lGjTHtopK9feIIJ73IEaw7YT5y0p3HzuGjk9sX12e9.XmQQAsjKByM1ck6_G4WB9J3OnBK1r3c
 n89YqIMSZf0lOa7zdE1T2_M4lCFO.Y_RmWnvqIAos4OLiZpSSiz7KwmSng6DoESID8hj.eDOr7IB
 kembkkU7xNSrEHslQ7zayxXyMAtCHpgcuXIutfKeAOdeUwDEiytdQwtuVceVwC6Wr2eN4fLzo9Na
 Dy76ZXnkJPrb1YJjD1v4pNqTuTvWuvDlfu7LEPfqK5MXRiNRhR5REehTO3wzrgzIbiJvJBqDCMSt
 wAUSDQLpiNQO0AZguy6cu_SF6hLDYuuLuceGAauQH_jma_jLntT_uYQKtoLH4gZXwMIkwdWvi0M7
 F2afO_iKwFiZx411VQKRiGygZ1JLsUMdnBPdcLfqJKdhKB5KlDcs3HkzbkCMQf6r.Qc5sFz7aY1h
 Av2quxRl94YAlb0eFmR26q41a1bjQaefzmynmCtWSQ_mcHpRqOLRTKDCz2Rt6iSdGMy.NaMzWmie
 8hnN_V1r8bhBmjgi.4wQtFNO_yG9diKvRO_YfFCUqZK7i10g6bEildLx2_XRn5gsDKLqRpLywGj9
 Xx0uSXEtOdhOzeX4t.o.DnI9aLCP4RI0HI52DycUD_HUPovgiS03fFSjS1zsoYy1ugBkn0g.wjDx
 INz5DTugTQuL_nYuNn7f3ScKq9R_x94UBjficLy9lHTzNiPSM225XnTsIZ9pCa.D3UdfgA70sCkV
 KbtFIm2c9LqG6yt1XI.BPU34.rSrCQPF8K_xQAHkz7zzCmGYgwFptKFrqN7vnHsZEHTe1sgR8lP1
 7jUyL9tuXXWdgc5UmN5L6Dx5z9AOu6sMBmVNFgX3cFum2.IY6RWrJHrDWNjcfoxb.lfLtQvOxzMk
 kYg2jTIAYGd0tCMTk9opnL9nZcuILxXhUK3IYv1v0V.tSKzitloGf5LzXEVdjQKHExGOzeXeu6Md
 rCjo5L0EcWOfeHkQiRnPf9yI7
X-Sonic-MF: <davidluca3000@yahoo.com>
X-Sonic-ID: 4cb30900-a9a2-40bc-bda9-0c42a48e9e0e
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.ne1.yahoo.com with HTTP; Mon, 23 Nov 2026 19:38:18 +0000
Date: Mon, 23 Nov 2026 19:38:17 +0000 (UTC)
To: Buildroot <buildroot@buildroot.org>
Message-ID: <600589126.630915.1795462697803@mail.yahoo.com>
References: <600589126.630915.1795462697803.ref@mail.yahoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: WebService/1.1.27100 YMailNovation
Subject: [Buildroot] Perl missing modules unknown
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
Content-Type: multipart/mixed; boundary="===============6098344007284801737=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-1.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_REPLYTO_END_DIGIT,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6098344007284801737==
Content-Type: multipart/alternative; 
	boundary="----=_Part_630914_2049893967.1795462697802"

------=_Part_630914_2049893967.1795462697802
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,=C2=A0
I have Buildroot 2026.08.1 successfully building a x86_64 image on my VM, b=
ut on a different VM that was building 2024.02 without issues, it's current=
ly failing with following error:
"14:04:35 Your Perl installation is not complete enough; at least the follo=
wing
14:04:35=C2=A0 modules are missing:
14:04:35=C2=A0 =C2=A0 =C2=A0 =C2=A0open"
The version reported for perl is: v5.26.3 on both VMs.=C2=A0Any idea what I=
'm missing?
Best regards,David.
------=_Part_630914_2049893967.1795462697802
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head></head><body><div class="yahoo-style-wrap" style="font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px;"><div dir="ltr" data-setdir="false"><div>Hello,&nbsp;</div><div><br>I have Buildroot 2026.08.1 successfully building a x86_64 image on my VM, but on a different VM that was building 2024.02 without issues, it's currently failing with following error:<br>"14:04:35 Your Perl installation is not complete enough; at least the following<br>14:04:35&nbsp; modules are missing:<br>14:04:35&nbsp; &nbsp; &nbsp; &nbsp;open"<br>The version reported for perl is: v5.26.3 on both VMs.&nbsp;</div>Any idea what I'm missing?</div><div dir="ltr" data-setdir="false"><br></div><div dir="ltr" data-setdir="false">Best regards,</div><div dir="ltr" data-setdir="false">David.</div></div></body></html>
------=_Part_630914_2049893967.1795462697802--

--===============6098344007284801737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6098344007284801737==--
