Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A3FE77188
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 02:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61EBE60707;
	Tue,  7 Jan 2025 02:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SObQypBcXOdm; Tue,  7 Jan 2025 02:14:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFB9D60799
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFB9D60799;
	Tue,  7 Jan 2025 02:14:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B0E27DB4
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 02:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90B5C4019D
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 02:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7m30O-THpsg for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 02:14:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 14B7140191
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14B7140191
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14B7140191
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 02:14:40 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e3983f8ff40so17544348276.1
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 18:14:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736216080; x=1736820880;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FUuwRpvb7Us5Ry84jcI/0yf7j++hlVsuja7jYz1zDa4=;
 b=gNrraLKSsXL5g1n93VFH3/mI/kyYmDRj5rnYH/4W72J7Jyx6vOEChDtkLUaXNJpx/q
 o6Gu7S5d92rqJcjCNY/+KgaWOYX4ccL2UyfmiZmUgzq7VgSiOz02PG4oiFu3y2PbiOwL
 b/G8T7jbqiu9UcuR0fSx5jyZSre32zvqsJJR/0wNv515e6ffLakuy4e3+8ZQ39PYO/cl
 IQnlcjH3ig2A9IyyU+hAydikPItM4lVd9s9grdD+RBtBNuh5wgAwsj00fhkvfudCHL8K
 zQnMUwVRWKPvWbUgGw1x5CBt0PKPasOHQaeit36f5pLMzX5oozvNtdoBCKJCPqzK1ots
 vgww==
X-Gm-Message-State: AOJu0YwsihjyTbacKCJDiuBM005xl9JHIy8vh/sNSGMcSIvXSbTAqYK6
 iXf+wfz1o252oT85leAQSmI/+7GKaVEd7xT9tx3HY+F1DJIxgNLcsdjnhpR9Z9x+t0UtG5IM1K9
 vTm1gQG2EpU4+r3KjZQJusFU8RRlNGp1H
X-Gm-Gg: ASbGncsd8XBXuuI8aURAY2EOLyzJleZT37VHJxQNMqh2TePKrpklAnl6+XXyWVGOZ4b
 KpR2c0RSgt1N5hUYvwJgZZYEBzluwrW1E88gP03I=
X-Google-Smtp-Source: AGHT+IGSapb0wbDNjklMixAhiw8P+vszvR4QWe1WkzxUzomaW+438XYSdbCuw8ods+nLvTVcad1J+pOmrk5B/qr/WdU=
X-Received: by 2002:a05:690c:7404:b0:6ef:4fba:8151 with SMTP id
 00721157ae682-6f3f8134ccamr383553857b3.19.1736216079574; Mon, 06 Jan 2025
 18:14:39 -0800 (PST)
MIME-Version: 1.0
References: <20250106024626.151525-1-nemaakhilesh@gmail.com>
 <d7c115a2a0d39baa4ddce696257ac360@free.fr>
In-Reply-To: <d7c115a2a0d39baa4ddce696257ac360@free.fr>
From: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon, 6 Jan 2025 18:14:13 -0800
Message-ID: <CAMV0Ro-_qiPc2i1xFPw4v0M2D-4xUu_=PR9ReCdTFjmMesRR6Q@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736216080; x=1736820880; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FUuwRpvb7Us5Ry84jcI/0yf7j++hlVsuja7jYz1zDa4=;
 b=bgK+1xr5/Zzv04uMLO1IHP0txQToy8udzzZzjA9kzNrovd++YOspHlnzlP5WDSMkHV
 eAKYeW1qrnq60ArcbzEmKW0Z/0BKhsefg42StTt/HELlnTordMl508rF/UQb2ZEi9X1s
 svlNspXMcsrecCMWnSD/9s0cqTE6HGazsQZGcWU+kKH8CUHQnyerQuNdKw/ow/fKfDHS
 Uh41HAtgxveoG16uqBGfrUnUurl77X++OII7URFy5vezqXrKhleSsd2D/RgbdYgHaHUR
 z3nOOujKxpU3y2AWx/GQ2qCwenViNGxHEd4eyq4FJSmZi5Hb6DLS5LFvINKtWY2cUkHs
 9Uxw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bgK+1xr5
Subject: Re: [Buildroot] [PATCH 1/1] package/iperf3: security bump to
 version 3.18
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
Content-Type: multipart/mixed; boundary="===============7346394931130139447=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7346394931130139447==
Content-Type: multipart/alternative; boundary="000000000000ad2e81062b144e12"

--000000000000ad2e81062b144e12
Content-Type: text/plain; charset="UTF-8"

Hi Julien,

On 06/01/2025 03:46, Akhilesh Nema wrote:
> > Fixes CVE-2024-26306.
>
> You mention here "CVE-2024-26306". It seems this CVE was already fixed
> in
> Buildroot commit:
>
> https://gitlab.com/buildroot.org/buildroot/-/commit/9d9a0db3d8b471ccf1721312450337ff53ed4a35


Yes, there was a typo in the message. This version bump has a fix for the
CVE-2024-53580.

Thanks
Akhilesh

--000000000000ad2e81062b144e12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Julien,</div><div><br></div><div class=3D"gmail_qu=
ote gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 06/01/2025 03:46, Akhilesh Nema wrote:<br>
&gt; Fixes CVE-2024-26306.<br>
<br>
You mention here &quot;CVE-2024-26306&quot;. It seems this CVE was already =
fixed <br>
in<br>
Buildroot commit:<br>
<a href=3D"https://gitlab.com/buildroot.org/buildroot/-/commit/9d9a0db3d8b4=
71ccf1721312450337ff53ed4a35" rel=3D"noreferrer" target=3D"_blank">https://=
gitlab.com/buildroot.org/buildroot/-/commit/9d9a0db3d8b471ccf1721312450337f=
f53ed4a35</a></blockquote><div><br></div><div>Yes, there was a typo in the =
message. This version bump has a fix for the CVE-2024-53580.</div><div><br>=
</div><div>Thanks</div><div>Akhilesh=C2=A0</div></div></div>

--000000000000ad2e81062b144e12--

--===============7346394931130139447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7346394931130139447==--
