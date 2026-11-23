Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D23A606A31E
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 22:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=li74K6x2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f3jQtcXI
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D637480C9C;
	Mon, 23 Nov 2026 22:35:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2GKl-BsPWy9j; Mon, 23 Nov 2026 22:35:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DD06780D05
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795473318;
	b=Zd0cuAFCfO5Spr9WUX61F3p7MowquK5OMoNsj8pUgV/f+PYuWcr184xQA1imjMBelfm1
	 tC1VsPeSvgD0e1zVyugWO945SBBGdgH6DA8oKUBKV/0cxCc7bgUT4TwEZRiH/NnVeD12m
	 lzX9oMMKW0+aiQ/bFhIWpK4Fhe8VvjRn5/aPyXslBG+PN4RauEvHj+jw16YeOGZNZYtNG
	 XnhRiF5AO/DbXOYurQjVX5ewsRtn6L+tMniJsm3aRAHK/5fZJthzMZMAC+i8xBDKKJABv
	 9MHB6WqpSex3ML7EZ2UCUTzNzR2UlEt2+vk2dUmOVwlruZy8E5nYESXuAGCTEchjgDw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795473318;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=gjlUD8U/0ZTVBCL0AuTCGZuUu4MBEZFUy0wPW9hI57g=;
	b=NQrqwwKNAuY+3OIIpjz6RAHHKkx2IHSMkifIrH80MGXp7RrrHapGQ8yjjF5Ek6yPeTKE
	 ceyhlDap7/Ih+snG+xfytyHdQ2vUQvRSwOOTzAi3l9n1rbMYzQODkix4PL8mhG0QVkb6I
	 UpmGp2k8AEO3cbOlGAU6AOOoErjULY/BtkcID7A5qZ9HJfiwK12G6egCqFj/68mgfIQbz
	 SqbWfctFjsJnvdkAB+sXA+9LDGdEzYv5HT33wdCyBV7p0FT4gWgO57IPXojHDZivnntzP
	 iU+9odGtftqseuyxihHpwYHSswGgKi2SiPobK3/kFMartFuqmTxeUqIxBdYbKFBvvLA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795473318;
	bh=gjlUD8U/0ZTVBCL0AuTCGZuUu4MBEZFUy0wPW9hI57g=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=li74K6x2i9fc+MNuqYjDslYxLaCLSy3MAqfJ6YQrVgX7/Nxh1nPiV5PlqsCZcfYlH
	 4zdoFBY4TvVRVJQsjXczOpvmsvwvclT7egpEkvqehhkAPI5CRMvin3CgUJiO8/DquY
	 kLwM9p7nXCeXN9+8Xh+WO0eWHXqTaUY0DjQ5hdoNehHHd/U7vNsKzQYtUZn9IwIN9+
	 mD5OYydIjkIWW6/dlzm6Zqq864w4g1esYWElmYE02/CwB0Q0jI2jCbNHnf/5afoM51
	 6nXhZKmJr0VLs/rfpcbIgcXzX/d97AZqLUqu2OMDZqTTwIAz2aKCMi71LyTYHbDpqF
	 eK9XLoQo8GQWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD06780D05;
	Mon, 23 Nov 2026 22:35:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B53A2D32
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 22:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7042400E0
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 22:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nokqFSNJTz-o for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 22:35:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C0CF540068
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::112a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com;
 envelope-from=vfazio@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=f3jQtcXI
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0CF540068
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 22:35:15 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-8b4d86f5328so25404147b3.0
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 14:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795473314; x=1796078114; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=CU4ZTRhdseENj4IuGR+9wM409UJ1qmVVzvMt8KPgR60=;
 b=f3jQtcXI8q5gHMB5gOdOYG7SGfAL/eeIGTg447flJZOQNjGLuKGLceJbGgUJ+E/MeT
 SIW78hTRzJu9btNN0ln+pl5wrEK80YfQ2Aix5lVMd3HpSDzS1SWT0mb3/fzfhy5Hiu8u
 pPYLWoX0QV8NbVW5Msg96oPHtHwD37N3a5WGoh7OxBl6icsDaB7XCEyfhjAhSKoPbQfj
 6yTMND4RuXn1o4rvOOQttb2PvMb4BPLKEE7XYA0uvsfInHv/un1xg4t7Yt7qQ2m8Jlym
 2aEfh+j7HveFT6SQ4tFOQ2fTJxqcz1g7wqoqHWtrd95m4Nc4NRtrcz/zVciNgwMRdL1j
 2wpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795473314; x=1796078114;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=CU4ZTRhdseENj4IuGR+9wM409UJ1qmVVzvMt8KPgR60=;
 b=ERfaVQodSWG2i9rbmnmPZfOG3G1TEVTJZTC2tetX/Qtra8E/n/Z4YLAoJq5lANrVmi
 t0K08t+3SpgX5BZ1B3dhdA1WExqj/IWgAgDq87UoeD821kbXF/U30618buyD1mV9cGcs
 qcM6XoiXTYnZ3NpXf0NS0/bySPK8jI3ENGI/DD1jH69CzfBN6EWimfSTuF6a2mY+osrn
 Ya0Nq51wFVZadhrgsXsnTHm6Z1SHov67dL8N+zC20P/K85diXviUqZrnuiawomaBNUhN
 S0DxRa7Q6foARdY0GuAW59+Qj5lcq1S2P9r7MWw3cje4VLsrl4B+OMLxBmtUdeMUqYvB
 KXwg==
X-Gm-Message-State: APuU4Z8YeS3Vf11DYkxbFC3J08gc5DTZJKxlmMa1GVHbHpNjkqs4D+su
 GKpSRjukD4SHO+nwxGnpoCqVkEIPm32FvM0ZQQvGNcoHAn6mCk2n00esIqSSI+ZiKP3T9x8/MlV
 yF60btD9md5f/chuU1IVAsFTGp4A9XjI=
X-Gm-Gg: AZFdTZc1y/i4Xe5xLSEEo2Kom4FYi+uwqOUKG5SYnsUWKhQebpmrD2dU660XWtjLEGT
 g32CvU+KnREQKV3Q9zkxNfQZ+dBtUfF70/p9HoYb6UgM0MW4bm22pH8y9WK/TE3M6UiefsOgB7d
 EVAJrB/UC2g/HRjoBsaY3WsMjrdTKBvR1jKvbxnvRlrj7XuwiML5DggLeGwIE/z+ksULnbqerjQ
 v0YBo2jXMnQdqGM2JZAW7oG/8/Vp7rmBAGpgiqqbYB/EAlsYO9bjLA6Kz5Mbx1sljfthWgVxwJr
 vvV0ihxRtq11B9iCsKvlr08AptcGzMmWOURN85sAcZxbpjNKoHTAnqXho1juL8iV9KHogLZsX7I
 SmNE9BZ+jK+roPeNqb5pRwqYAB4LIgQ4ubEaRdVqYCZQCDkzpQIN0rC8lL+OwlV/KAuaZ
X-Received: by 2002:a05:690c:b18:b0:8b4:cbe3:277 with SMTP id
 00721157ae682-8b520443c23mr65813227b3.19.1795473314351; Mon, 23 Nov 2026
 14:35:14 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20240228165300.4158751-1-vfazio@gmail.com>
 <20261123173006.2250595-1-angelo.compagnucci@gmail.com>
 <PH1P110MB16036AFF106E5B0FA361B9C89F45A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <20261123200951.3350546-1-angelo.compagnucci@gmail.com>
In-Reply-To: <20261123200951.3350546-1-angelo.compagnucci@gmail.com>
From: Vincent Fazio <vfazio@gmail.com>
Date: Mon, 23 Nov 2026 16:35:02 -0600
X-Gm-Features: Aa3M54qjmF3vkD7gxPSYTGc_BNRGFHbw_FeqR2zAJgEDMMLmdkKYk7vVPwas4dg
Message-ID: <CAOrEah6tmVYxKe4C0N0GV2YvaOt22uPaRCFB1scc01ezwtBetw@mail.gmail.com>
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org, Vincent Fazio <vfazio@xes-inc.com>, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Neal Frager <neal.frager@amd.com>, Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc: add symver attribute
 support to MicroBlaze
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1252596327917422982=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1252596327917422982==
Content-Type: multipart/alternative; boundary="0000000000001b108c0660f9354c"

--0000000000001b108c0660f9354c
Content-Type: text/plain; charset="UTF-8"

Angelo,

On Mon, Nov 23, 2026, 14:09 Angelo Compagnucci <angelo.compagnucci@gmail.com>
wrote:

> Hi Vincent,
>
> On 23/11/26 18:44, Vincent Fazio wrote:
> > IMO working around this for every package is not the best long term
> solution.
>
> You are right. Fixing GCC once is better than fixing every package
> that hits the problem, now and in the future. I take back my proposal
> to drop the patch.
>
> If you agree, I can respin it on top of the GCC versions in master
> (14.4.0, 15.3.0 and 16.2.0), keeping you as the author.
>


Sounds good to me! Sorry if my other email came off as short, this patch
has been on the back burner for way too long and I've just never had the
time to get this submitted so I'm glad this came up.

--0000000000001b108c0660f9354c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Angelo,=C2=A0<br><br><div class=3D"gmail_quote gmail=
_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 23, 202=
6, 14:09 Angelo Compagnucci &lt;<a href=3D"mailto:angelo.compagnucci@gmail.=
com">angelo.compagnucci@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Hi Vincent,<br>
<br>
On 23/11/26 18:44, Vincent Fazio wrote:<br>
&gt; IMO working around this for every package is not the best long term so=
lution.<br>
<br>
You are right. Fixing GCC once is better than fixing every package<br>
that hits the problem, now and in the future. I take back my proposal<br>
to drop the patch.<br>
<br>
If you agree, I can respin it on top of the GCC versions in master<br>
(14.4.0, 15.3.0 and 16.2.0), keeping you as the author.<br></blockquote></d=
iv></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Sounds good to me! Sorry if my other email came off as short, thi=
s patch has been on the back burner for way too long and I&#39;ve just neve=
r had the time to get this submitted so I&#39;m glad this came up.=C2=A0</d=
iv></div>

--0000000000001b108c0660f9354c--

--===============1252596327917422982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1252596327917422982==--
