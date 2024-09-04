Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63E2CD4F24
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 19:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A9C540334;
	Wed,  4 Sep 2024 19:44:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VVvfzMNV_1xg; Wed,  4 Sep 2024 19:44:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17E3A40345
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17E3A40345;
	Wed,  4 Sep 2024 19:44:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0BC521BF3C4
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 19:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC41040204
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 19:44:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wDyw8075qCId for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 19:44:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8A50D400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A50D400D6
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A50D400D6
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 19:44:49 +0000 (UTC)
Received: from [10.76.189.206] (unknown [37.166.137.86])
 (Authenticated sender: vjardin@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id A6BE319F72F;
 Wed,  4 Sep 2024 21:44:44 +0200 (CEST)
From: Vincent Jardin <vjardin@free.fr>
To: <buildroot@buildroot.org>
Date: Wed, 04 Sep 2024 21:44:43 +0200
Message-ID: <191be915bf8.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
In-Reply-To: <20240828102106.55640-1-vjardin@free.fr>
References: <20240827003813.30083-2-vjardin@free.fr>
 <20240828102106.55640-1-vjardin@free.fr>
User-Agent: AquaMail/1.51.5 (build: 105105504)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725479087;
 bh=gnuymDfEPA2oYxQ1WJFVkNRiJuMuVm6/QUReBa3gVW8=;
 h=From:To:CC:Date:In-Reply-To:References:Subject:From;
 b=FBvxHtt+nujO9fnE6lLv1RoLrxaUAwTKM0YlECtcTJ35O2v06A2rQNMzkp8m43p0d
 MNGY/eDZQOyRFqQJCghw0Rv/IYSHJJwPm9ijhnAnnHwDIYgrBZR4npxsl6LUs3bwAB
 KYckFlCUtQuifinkI5WFYnbd7d2qtl22BzNuaqARsuUVLpLUnGFUe5l+uoMq+ZzcgF
 PGO7R9p8+mNbZakhEsneqAw9MDnfeMfaurd4fwCCx8vGRqI1CpqyKWrPM6Cm4UFE9Y
 E/Djcs+gbmor5O7bs0qxUAPJnepL/A1S+jKAs/qvxdnJe+XzcsAy7nMvLZovzaytwo
 5PG6Db9L6pakg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=FBvxHtt+
Subject: Re: [Buildroot] [PATCH v4 0/1] add DPDK libraries
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============4623893417229261371=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============4623893417229261371==
Content-Type: multipart/alternative; boundary="191be915eec49ca2856267d32a"

This is a multi-part message in MIME format.
--191be915eec49ca2856267d32a
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

Le 28 août 2024 12:21:12 Vincent Jardin <vjardin@free.fr> a écrit :

> v3 -> v4 changes:
>  - proof readings (dpdk/DPDK, git.dpdk.org instead of github)
>  - gcc 4.9 needed
>

Is this v4 serie ok ? What's next have it merged ?

Thanks,
  Vincent

--191be915eec49ca2856267d32a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto">Hi,</div><div dir=3D"auto"><br></div>
<div id=3D"aqm-original" style=3D"color: black;">
<div dir=3D"auto">Le 28 ao=C3=BBt 2024 12:21:12 Vincent Jardin &lt;vjardin@=
free.fr&gt; a =C3=A9crit :</div>
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">v3 -&gt; v4 changes:</div>
<div dir=3D"auto">&nbsp; - proof readings (dpdk/DPDK, git.dpdk.org instead =
of github)</div>
<div dir=3D"auto">&nbsp; - gcc 4.9 needed</div></blockquote></div><div id=
=3D"aqm-original" style=3D"color: black;" dir=3D"auto"><blockquote type=3D"=
cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75ex; border-left: 1px=
 solid #808080; padding-left: 0.75ex;"><div dir=3D"auto"><br></div></blockq=
uote></div><div dir=3D"auto"><br></div><div dir=3D"auto">Is this v4 serie o=
k ? What's next have it merged ?</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Thanks,</div><div dir=3D"auto">&nbsp; Vincent&nbsp;</div>
</div></body>
</html>

--191be915eec49ca2856267d32a--


--===============4623893417229261371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4623893417229261371==--

