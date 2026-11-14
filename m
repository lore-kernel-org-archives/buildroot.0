Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F429606A327
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 16:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cTAGe3eK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V75cmwpZ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2715160E43;
	Sat, 14 Nov 2026 16:22:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YqbL1OO78kBL; Sat, 14 Nov 2026 16:22:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 56CA46076D
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794673333;
	b=Jvrb9nN2mC5yhUugyg6YeuZGdDLnR6Wv6X2TO4jvdOM3qe3tqzUKt3rs+O7gZHqJZ4E1
	 le9RbSdJ/CoJR/ARFkcW3dl3wqq0XBgX3DPoa31tZBA41OlMZs1xX/xI0cTimsMIvV6Xq
	 2PsNQG4QzUaNZpYGcJCuaNSlpYQPs4rghlIcdgncBDCSJZJwKfjPQuEQQ8qb37nW446WH
	 cYyHoOhgH0o++RuSlN6rbAxjJj18zLLIsPRuTzc+Nky+nYR5urdqv3MXyvLBnNhqsR4N0
	 uiu2P7rapv1nuNybHyec8TcodW7ImhY9JIC2LBwpkYd5RKgKUUUfvqOD38U1xTRUBIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794673333;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=nLQ4TibmlTBiQaY5cbhAdbKsvAeM1bWivZ7is2izWTo=;
	b=Tl92kX6K6Os0S/ogH6jTrNc7/pJ2UXYb/HAm05aVFwaA4H8QPOAvWhgeLAIvE3hSBotr
	 AiTftM3s7bcF843JKlsqEzc8Kpk3XoutH5ijcMWdhYlRKG3agAQRC2IompDaxg4zQfQ2e
	 OIvSFGX7Kujj7IxCL2hGSAXoKn3SI64UykAjW9J41wJIwP6uOMz8OySlpkWGBHSAdO4p5
	 vZlEsS95+crta3lWrOydRwCRg9pshhKJX+/7GnMPWy73hCHcPVlcL7TBT+XxN6tzWu4bU
	 2PGIaTFau9oKyQsjOFmPDKxPwzpuJI5qF4gze31ilDe+KR+zbnVVwbuMPPqu35LBDag==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794673333;
	bh=nLQ4TibmlTBiQaY5cbhAdbKsvAeM1bWivZ7is2izWTo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cTAGe3eKrREyB6+k/WLj6qTzEVqszw77cYJUznVRS+K937vI0fnMfe0j1uOSNHCSf
	 wfNleWTcn9a0fYc+67ITE5d/XBknSoXj/hkZhhawI7tawcDeIRj4XTbgdGhSJf8Dot
	 DAwAEv9vdRkDgCxcgPA3QlpCyDNqffhutgWZSsLaDrmkuLIxkmUuwFTNWjBXjmcAqE
	 Hs5pgcKsNQSJIunQMe11TcXUC0EJJtq/LMKZgrnpSeCWjOpaMKHUdcJq8+oiJYUlAO
	 BuSBL6/HhW9cXOVr+uZFHJJWhJcWkxj4Gggzx1hhcweLl3yDCjBOP09PVs4awt8ch6
	 L8FAoHNzR1RIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56CA46076D;
	Sat, 14 Nov 2026 16:22:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 49ED59B6
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 16:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BC54814A1
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 16:22:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oGAZO0uI9ajo for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 16:22:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0173481501
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a00:1450:4864:20::62f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=V75cmwpZ
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0173481501
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 16:22:08 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c4322d310e7so438425166b.0
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 08:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794673326; x=1795278126; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=s+DffQ4IMNCJmtj7T8YeWWxqTcjA40KlWR8CvfgTJTI=;
 b=V75cmwpZCoD9cOllFzgBmd6rBv2pKx7t1RZpH7rvbbuemmBPbmOCDF7XAGuJsLtML+
 kS0ARRcdJWjyvBg8sWiiWpA92TA29oqQfC94IDRiZioPQzbT27kdQdeQO2QzlTtsC/jU
 04U7V5A8L545Q5yZMs7q4Nqf5JtApajXTaJYQmg6BUIo/X7VqP3OVrBO/4sAvvYYT3U5
 YTvb5tU7mhWZgxC1dGVYv5C/vIAVXgSBh256L2Q2X5IadAJJi3tC33lWQYH0ma3zf2wr
 qhAVS/lx8kCfD7HOWHL8iB0ETCz2nYnHM6M8Ntt/7zp/nuDS09WuEkV1FgCH8aqdFKOR
 KGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794673326; x=1795278126;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=s+DffQ4IMNCJmtj7T8YeWWxqTcjA40KlWR8CvfgTJTI=;
 b=j/s/gmwApEdt2DLRkX9NbhjcoNNk6P+aVZwxKNgD1firElxozqn9UfIY6IfoN58vXQ
 BuSCNYZ24DKOTCAP7Ajju82dK9LbFVE9h1l9XZRDQcjgrHeRXvs9sSCrn5BnpDYoDrgd
 YdU+6daz6Op/z4yNjRp8H5XwVy/Zk3i0ySbZ/txpkRS9sCQtBCLUjGGx8M36BjoO2r/h
 okLqhiq+FCS6JMrv+4Su7cKY5CxZgjUM+c93gM32sPhAHEwqsGLyiYHLkRmY0oKGdNXn
 Vx2DwVgfbtqAVWvr2/AdMvuAGdGqJ7Fhte6/SBOpnW5AUuF57gjyrzqGXiR3El7yXY5P
 1cCQ==
X-Gm-Message-State: APuU4Z+hElsOQHQOzbu2AdOAWlPlMAItjorJUhEVk9dfzW05LzQKmi8c
 Ivd6wEtE1b9Ea+MOXUBE3sJWaBO1/SrLIFmRbmZuCy5SvI7JxQnJOWDtRNj5YlR9p0e8K5jEQ+I
 EVZ+/ldvwSXH5/xYVG3Y6X53S32qn/4k=
X-Gm-Gg: AYBFou2yhU0W9VW8vEN3HeJ3YIlNtW0Ampapc+RZK5oTVz8oquccD0eKRJSkqXZIjsf
 6yEPZ3F59XVh5mv725wuc4Dz50XnZV6xXZjuGJFXOINgdSpPKJV5ey0/yAW27gqpWRk9XZy9pvU
 49LQI6aofLXCNPedpK8RRCylh8lWhU47LYKWQ7nOUHe7ylKe5JhgRciQm6LUmORE2d+7GPtfmjW
 GY3UBMVZcPBTNpB2UNe+8TyW2FDEzf/PwfHcCerTY92Ut3HC6IC1kjgrxwk+KGYrhmm281UCLki
 meWZixBjpPeFKK9IESrAnYMKdZD78itczWRVEID6GckjwasLWiNyPecj49llP/ACdIB3wKYZ8OE
 vOUN+OXdyIHcO1qOZMr6ybTOrj0VU+pcFhiszHVyE/46WKRu3KTGmSqQdIxd6qZXQXRxb4d8=
X-Received: by 2002:a17:907:6d02:b0:c4d:31cd:9dec with SMTP id
 a640c23a62f3a-c509634a434mr505928766b.30.1794673326397; Sat, 14 Nov 2026
 08:22:06 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260713113710.1732927-1-chakrabortyshubham66@gmail.com>
 <aoNuO__aQMnMl0ni@windsurf>
 <CABvxksxYWcRQHZospOPy=dCRWqWkp6Cf2J8FpsDnqZZ0ObNY4Q@mail.gmail.com>
 <aodK_V5XZwTZ3S_L@windsurf>
 <CABvxksyvBezT1ur2Ai9jhDM=a+YzvY3NyfXPo133-aAFXKmZ2w@mail.gmail.com>
 <ao36H3zReUs-lIQA@windsurf>
In-Reply-To: <ao36H3zReUs-lIQA@windsurf>
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sat, 14 Nov 2026 21:51:55 +0530
X-Gm-Features: AclHuK86-XdbVY1AuNvp38i-LRWVX7ivKSTEetRNtqJnMcyDVMoEX95dfUzs23Y
Message-ID: <CABvxksx8iLLBkgLuhfggFoc6Hm0HwPobL1qFr-cR9QMeZ-DRYQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Buildroot List <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH] package/unrar: bump to version 7.2.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3957310712117634903=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=2.1 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3957310712117634903==
Content-Type: multipart/alternative; boundary="0000000000001ba05b06603ef226"

--0000000000001ba05b06603ef226
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

I'll send a v2 that is a plain bump to 7.2.7, dropping UNRAR_IGNORE_CVES,
since 7.2.7 isn't affected.

For the stable branches (2026.05.x, 2026.02.x, 2025.02.x): CVE-2022-30333
is only flagged there
because they ship an older unrar. Once the bump is in master, I suggest
cherry-picking
it to those branches rather than backporting the CVE fix alone.

Best regards,
Shubham

On Wed, Aug 26, 2026 at 1:55=E2=80=AFAM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Mon, Aug 24, 2026 at 07:21:53AM +0530, Shubham Chakraborty wrote:
>
> > I think we should update the unrar in the stable branches.
> >
> > It was an oversight on my part. I'm still learning how to communicate
> these
> > decisions properly on the mailing list.
>
> So now, I am confused. What are the next steps?
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000001ba05b06603ef226
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Thomas,<div><br></div><div>I&#39;ll send a v2 that is a=
 plain bump to 7.2.7, dropping
   UNRAR_IGNORE_CVES,=C2=A0</div><div>since 7.2.7 isn&#39;t affected.=C2=A0=
</div><div><br></div><div>For the stable branches (2026.05.x, 2026.02.x, 20=
25.02.x): CVE-2022-30333 is only
   flagged there=C2=A0</div><div>because they ship an older unrar. Once the=
 bump is in master, I suggest cherry-picking</div><div>it to those branches=
 rather than
   backporting the CVE fix alone.</div><div><br></div><div>Best regards,=C2=
=A0</div><div>Shubham</div></div><br><div class=3D"gmail_quote gmail_quote_=
container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 26, 2026 at 1:=
55=E2=80=AFAM Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootl=
in.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
On Mon, Aug 24, 2026 at 07:21:53AM +0530, Shubham Chakraborty wrote:<br>
<br>
&gt; I think we should update the unrar in the stable branches.<br>
&gt; <br>
&gt; It was an oversight on my part. I&#39;m still learning how to communic=
ate these<br>
&gt; decisions properly on the mailing list.<br>
<br>
So now, I am confused. What are the next steps?<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--0000000000001ba05b06603ef226--

--===============3957310712117634903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3957310712117634903==--
