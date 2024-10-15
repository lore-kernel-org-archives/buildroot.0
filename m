Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AE6D20682
	for <buildroot@archiver.kernel.org>; Tue, 15 Oct 2024 23:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99E338110B;
	Tue, 15 Oct 2024 23:30:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FizaTksQ5eXb; Tue, 15 Oct 2024 23:30:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF37581111
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF37581111;
	Tue, 15 Oct 2024 23:30:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 238771BF580
 for <buildroot@lists.busybox.net>; Tue, 15 Oct 2024 23:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1270F608A9
 for <buildroot@lists.busybox.net>; Tue, 15 Oct 2024 23:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1CcOoqFpdeWv for <buildroot@lists.busybox.net>;
 Tue, 15 Oct 2024 23:30:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F2D72608A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2D72608A7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2D72608A7
 for <buildroot@buildroot.org>; Tue, 15 Oct 2024 23:30:37 +0000 (UTC)
Received: from [10.143.7.197] (unknown [37.169.72.189])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 68ADD13F88F;
 Wed, 16 Oct 2024 01:30:26 +0200 (CEST)
From: Vincent Jardin <vjardin@free.fr>
To: <buildroot@buildroot.org>
Date: Wed, 16 Oct 2024 01:30:26 +0200
Message-ID: <1929284ba68.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
In-Reply-To: <30afa1fb5f4ae9d1c01ab5c557bf46f9@free.fr>
References: <o24zxu3iac7zacfdlxdzhpnjuixozkrf35tznhuodxxkbtv737@hxe2jgbd7d37>
 <20240924152430.61363-1-vjardin@free.fr>
 <20240924152430.61363-2-vjardin@free.fr>
 <30afa1fb5f4ae9d1c01ab5c557bf46f9@free.fr>
User-Agent: AquaMail/1.53.0 (build: 105300523)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1729035034;
 bh=njp0lfeJTSKwM6cQU1sCRKnkg6UWOyO6ytkHMDMBK94=;
 h=From:To:CC:Date:In-Reply-To:References:Subject:From;
 b=LsJzqOj1S0+U9HfcFS4kpw6zudqqMP8eQt8h/hl8ibixkT/k4fdHP+QYTbwTPnp29
 LkdJggkaArqgOd6ktumYfUa3EIP2oGV1b7dbHKYH+62RODZRwMdBTOug96yUBWXu8u
 f2vVJTyTamy6ugGbEMgD8Uu8UMZ4rA+Bd3RekXAYg494eReUGmvsvNb7SCVuq/0eRQ
 Hky5aL6ijWdYjp7zDCox+3W6T3TS/8hl+1kCR1rJ+haWPW5MdR+OyDq64vVcSW2bm0
 1i71sLTlDO5FREi+BtAIHoLKsTtj7C/eoycPMPIXttGiux9CVc/+7f+kL8V35+CSMN
 7cmg73f8hOd7w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LsJzqOj1
Subject: Re: [Buildroot] [PATCH v8 1/1] package/dpdk: add 24.07
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
Cc: Julien Olivain <ju.o@free.fr>, Arnout Vandecappelle <arnout@mind.de>,
 Yann Morin <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============4593532546572556458=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============4593532546572556458==
Content-Type: multipart/alternative; boundary="1929284bede653f2856fc68bbb"

This is a multi-part message in MIME format.
--1929284bede653f2856fc68bbb
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

This patch seems to be OK for everyone, I understand that many maintainers 
can be very busy, but since many reviews are done, what does prevent its 
merge ?

Thanks,
  Vincent

Le 2 octobre 2024 23:58:36 Julien Olivain <ju.o@free.fr> a écrit :

> Hi Vincent, All,
>
> Thanks for this update!
>
> To me, this patch can be merged as is. I am able to run successfully
> a basic runtime test, at:
> https://gitlab.com/jolivain/buildroot/-/jobs/7979322138


--1929284bede653f2856fc68bbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto">Hi,</div><div dir=3D"auto"><br></div><div dir=3D"auto">Th=
is patch seems to be OK for everyone, I understand that many maintainers ca=
n be very busy, but since many reviews are done, what does prevent its merg=
e ?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div di=
r=3D"auto">&nbsp; Vincent&nbsp;</div><div dir=3D"auto"><br></div>
<div id=3D"aqm-original" style=3D"color: black;">
<div dir=3D"auto">Le 2 octobre 2024 23:58:36 Julien Olivain &lt;ju.o@free.f=
r&gt; a =C3=A9crit :</div>
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">Hi Vincent, All,</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Thanks for this update!</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">To me, this patch can be merged as is. I am able to run s=
uccessfully</div>
<div dir=3D"auto">a basic runtime test, at:</div>
<div dir=3D"auto">https://gitlab.com/jolivain/buildroot/-/jobs/7979322138</=
div>
<div dir=3D"auto"><br></div>
</blockquote></div><div dir=3D"auto"><br></div>
</div></body>
</html>

--1929284bede653f2856fc68bbb--


--===============4593532546572556458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4593532546572556458==--

