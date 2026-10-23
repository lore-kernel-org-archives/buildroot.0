Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976A8606A31D
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 16:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VQmj6Qb3
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 599EC6061F;
	Fri, 23 Oct 2026 16:14:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WofezYMFzafB; Fri, 23 Oct 2026 16:14:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 753326069D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792772096;
	b=Y9yi0yaS1KshGJ4Fb1j2ZApTV3q4SQIjRBOQ9PGOrAIpoiYMQYe7AF5EiqH2Rx1d3cwW
	 H9bNySleOJ9+I44twZfHmRZFs61GesAq/PrNPAjalLqsqXUpIjYANEB+NivZ5h2ngVbev
	 /JOvcdgd/7T+qT6um6O/86CJOk09YPheOb8guyxRV7/1RlziOapdXk/W6oaSRpH06ExKZ
	 pG87bQviXkpMcXYxjx6P2bMCbrGU7cAb6j7/eDE8tWoe6ag4+aJFF9KjBpRNkiV2ImncB
	 pX6VYKQboNxzqMggWIh9B4Y0EjRGYRgstppxIrWlbQcExS1GVsS+Ljt2r+RXV//jvkg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792772096;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:MIME-Version:References:In-Reply-To:Date:
	 X-Gm-Features:Message-ID:To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Type:Errors-To:Sender;
	bh=emGdpFhCgwe3uT8+J0vt2INsZNo6zHGJ6LY/z/oHtnQ=;
	b=bnUhVncOMx0dlDAe18e6nRpquIbtAC+89qiTkr3NEg4ctzBaWJtSkO4FXcEjl+fMDPbC
	 3P0i6jRpBy35KwiRFOpVVzchKqOGaGPlt0JhqFdWo0L//xaeZdD2+P+eh6lDiekZqaiBI
	 xxnN5C+oNADhwMPI4CizWExHVoZdrD8IKTwJj2muyhy4FgD75NXb37uahe1e3y+2smMtb
	 kKQ3BAcCJI7GRYkp04HA4gDGLWasfu3rJIlZplzFN7XQzcHbMgud42DweMNDvnLAfts1H
	 lB/fhyoeXP6Pdt4TjHwSWavR0RuEiRcIDubzSFvUjjK/3sEbquDp8LaXi0ZxtyhJSmA==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792772096;
	bh=emGdpFhCgwe3uT8+J0vt2INsZNo6zHGJ6LY/z/oHtnQ=;
	h=References:In-Reply-To:Date:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=VQmj6Qb39WwtIYjWNWxrsJiToMNReU6p1SD8mg1egaWUjIEORTDyn4ZEi0cYhW1Y0
	 u5xv0Mv661+qt9X+rlya6a0FiAdWXZWtuQXU9ZZl/DgAu5i7AwVgLydPeqaNZIypr6
	 KkHCY+Mm+h61l3q+pxo+0jTDlWT0wAR2aae6F0BkQB5qWpmEfCtf6ZIkhJHmz08o/L
	 n69RrHZwFiYwTkT3QJtTq8gVtRM7h30Q5H4z0Uh2Z7xxf0tBzvMUZ1wUq+JIl1CJIW
	 Ktio88Y6O6Pq+ozMm0YNWoyScIyDJ62KWTbFJJsLSPHG70Fv8icISWtqH1Q9XLrkcs
	 2keKXs1AFJszA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 753326069D;
	Fri, 23 Oct 2026 16:14:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 79BAE3C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 16:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FFD681293
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 16:14:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 72XHrlcdiKnq for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 16:14:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EB00B8125E
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792772094;
 b=RmztVUNKmwnQmm4vw4nrgt4djJmMHBaieUpjanAHF++1RAjrS3P0aYHCGE43AsCTXOIt
 KmkE4/CSTzyMGKUweJSx5+tfHF/pfGfBoUwx3gHJms7l+CHeaPxLNP1aOB08y5k/b3vYM
 wj/zV05nay2cwAnseZ5R1OVocLlmTUlgEMcFbxzCipvEZxEgVCHT9EMrOTjyziq5mYjVv
 qFgwurIGBp5IU6WH6ciA1sI2J13NGnpvVBKTKuNk6CxINnn7OOlo63mElMbxtM0AMeeVZ
 JfVvCRfJHYqWKub9VpR0hE869+3txDIN/88FDJPmei2Y+aZLethDer/0u/eD9zLvqEQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792772094;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
 Message-ID:Subject:To:Cc:Content-Type;
 bh=gLT+m9/rqMiFwBZe1M2iExyBgL5b4QI89YZq9n/gjws=;
 b=sc1CUl/dhAv9oc8knRVwMTA4CSVzsXPBC7/tpYhZJG7MOlId80xhb1+xV1OtyVhg27tB
 xMOKqNu4mWQ7EyC1y3x7bWtkzEYSQ0rELW7bkIUna0j5hZZGKlyDbbC+Bgc0MaFnP3WOa
 QgM8NXxXI0rhvhb7soQnJ9Zmua2BuECqBlNjD4C+Af12fSBZrZM/C0Bb2JYSI3u71MD2X
 YdtMC61ZnGsyhGDIF9Jljg3x501q92mP4vAqHC1otSqSwehXKWQOGLYr7hGsicQzzYu0y
 ZHXZy4Wleu+1Bml8GTBOEBNXBpYadBXSq0IhUq4CwD2cWc02ViR74usB7gnlqWYJaVw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
 dmarc=pass header.from=starry.com;
 dkim=pass header.d=starry.com header.i=@starry.com header.a=rsa-sha256
 header.s=google header.b=h7wKSXqQ; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:20::633"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=nhed@starry.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB00B8125E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 16:14:53 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-c414e5d282eso128637966b.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 09:14:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792772091; cv=none;
 d=google.com; s=arc-20260327;
 b=LctpaANAGKNfxc/RWXmbTnKM9RpdOSOCdCItVVXJXfHow5eN2RFeMDMhbJaGktDSIJ
 JPY3f2Dh+ZMxdzgxoHgGnJrsZaE4gaRjouzQFbTFDdGjQDUWeBMkOpE4sLyjiOyDu08o
 JyFSDGwJImGVNwyQvDE8XXY4WuFuVl663Z52AVtrOLj+JjieV8rmvmUhVBy7HcN7pX5a
 KtN8pgs6Qi+qtK0n8vP/1v0gte6ri4wNMOmysU5TT3hVSywLL2vHLsk73rXAfjdpeqcz
 Tojj54qGVb1pSHOccXrvtxr6Tv1m+iGwwRGrWLI+Z0/0OzFyNxu+yh0XUnfvuigMofTT
 owCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=gLT+m9/rqMiFwBZe1M2iExyBgL5b4QI89YZq9n/gjws=;
 fh=xBYHhZNFleibmwiQ3s9RvWfxee544D8dzQJjxyQiIhc=;
 b=iMhAQ3IoKxH1JJXAjsNfs6JNAAq+EWEJZKcxH3y0WUDgJd2Vb2On2AiXH7wLxem2L8
 SVBujhjZtWa2u1zAXOPqq2s2Wpv1DSoyUJcCJw5X43lnMmeEdn1SJ5nWO1HlM8tunPK0
 MLFobu0aPE4aWlsNIrFLWKKOMaTnBHz2L90TaSQwrdCWP7VIGxDTaqXgk8pS7K8Rsmm/
 hKW+IrxfZDVHJLq0h7w1GH/h4PE8fMKrm99XU28B9wHIIL+DVDorbayAQVk49V9XMHdM
 kTz56lFIkHxAnfKl47jHtYvk54aA8reJc3Go7acITBbvUPVSlpSANKSYqn29eQzDnG+8
 nQ4w==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792772091; x=1793376891;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=gLT+m9/rqMiFwBZe1M2iExyBgL5b4QI89YZq9n/gjws=;
 b=NkeUFtuQEJijOCyrV4RBBBY9MVaeZNQW5Z9lmmeOyE7MRKhT9xZNvNHFBy2eGzv1z7
 TbNLF5ylDPeoRmjIQCPTbqqtABz2axAvljxuDGxa2ZsHBNG+YHIT0jXMl/x9/smBou3Q
 1fl1c5KFVhmNb+M9281dJpPiTftf8FTWH/KNZvDFu++oeX/s4HNp1usJHtOSGqbKE13l
 xpvvruW9VCTSiZB1bVpz/dln+9fShqe2TIWM2XfyiUm5dylUUdY1ufEJmbwPD5vNsOkd
 UlhRn08GCZ74tKoLgQxPmIvh6LV6m920U9VrBSVR8ZrGurKqlM8Ziysj77YKKOqjEyZ0
 OyYg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzBJn1fN/UphT3dw44xBmQRkpvcmCo2EboYCRvcrzp47j80gSrAsL/bZov5v4fyMusOxwGNScdNAGY=@buildroot.org
X-Gm-Message-State: AFq9FYKuGwLzvVxf6NNMDc5J2RhzebSOt8chs8DyqgvjAnwBgMs7oG4h
 boPciRuB5lDO1IeG4NtlhIZQlIXUDlDdUm5mK24+DUvSMwk2qPEeg2buqnH7FyLF2exLJ0Ci0te
 EAZSJWzzqDEXuPw968K0ySGdqs0UbW1SR12GbcQxtEd8xv91nBvHnoPy8v41m
X-Gm-Gg: AYBFou2UhPAPMzeT+oAKeI1xon1+h2K0fn3++9BEGS7HQF+9cEknfYqU+vMlkZIJqvn
 qbFVGqaBhn1uJ52AO326N9NBsxtNMiWNlSuJiWX2BFCwm3ac0uaEjuwrlv5mnne73vqm+v6DOAm
 UasmJbYBzSbsurwQozN6jdZDRVU8xnpH8BsTRrghX1Iu/JHrAX6Xaune8ICq9xQTL2lcdkjD4aG
 UgHyj84AG7t7X+5ENnbJByLotrTK7+KcVGxEJ/v5aBw9F07hK7yLUDXbUlZoF4X7Xxs/ECZgbfV
 Jb9UhI84Doy3D9UVHltC2LsaKnXFKMMNw9Io8vwz/fKbiz0Xk/oCVe0gAw9NgwbaSPwukfwIp6l
 GeVwuVjYZGHtfufAwctQpQLxBtUNxcCnaMnZGXfoKeYO0ntVk338HQGZirQ==
X-Received: by 2002:a17:907:969e:b0:c46:88ef:2e46 with SMTP id
 a640c23a62f3a-c46a8ef33efmr447945866b.1.1792772091468; Fri, 23 Oct 2026
 09:14:51 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <0100019e947c6908-6c76a09a-23cf-406f-82ce-3889dd5dd255-000000@email.amazonses.com>
 <as3sjbzkJ8Teyy8t@windsurf> <87ld81ua4t.fsf@dell.be.48ers.dk>
 <as4sQrV4YU97glMl@windsurf>
In-Reply-To: <as4sQrV4YU97glMl@windsurf>
Date: Fri, 23 Oct 2026 12:14:40 -0400
X-Gm-Features: AclHuK_qxf4AHD9WfMSECXbEkCc0YZycjKlZlE-ruTaVF9i9T48AEvcjXxS6-1c
Message-ID: <CABGDZCnqoR7oO_H_dCVUz80An9eixZzXHEk_bEnjC9DEBzHKUA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH] package/umtprd: expose package build options
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Nevo Hed via buildroot <buildroot@buildroot.org>
Reply-To: Nevo Hed <nhed+buildroot@starry.com>
Cc: Paul Cercueil <paul@crapouillou.net>, arnout@rnout.be,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5650239494575651772=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-3.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5650239494575651772==
Content-Type: multipart/alternative; boundary="000000000000acf57b065e844789"

--000000000000acf57b065e844789
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maybe overcorrection on my behalf but I was just trying to make all the
options in the component configurable

Re: SYSLOG:
    I actually don't enable or need it.  Yes it is a daemon but in my
systemd-based platform without
    this flag it goes to stdout and stdout goes to the journal by default
but is otherwise controlled by `StandardOutput*=3D` *

Re: DEBUG:
    I needed it when I was integrating into my system and things were not
working WRT umtprd.  In that case I would
    never have enabled BR2_ENABLE_RUNTIME_DEBUG as I'm interested in
debugging that specific component.
    Granted I can forgo this and just patch the makefile for a debug build.

So if you guys think its cleaner and easier I can replace this whole patch
with the addition of:
    ifeq ($(BR2_PACKAGE_SYSTEMD),y)
    UMTPRD_BUILD_OPTS +=3D SYSTEMD=3D1
    endif



On Tue, Oct 13, 2026 at 9:04=E2=80=AFAM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Tue, Oct 13, 2026 at 01:12:50PM +0200, Peter Korsgaard wrote:
>
> > So I guess it does make sense with the option, unless we say that it
> > should always log to syslog given that it is a daemon.
>
> That was my thinking: it's a daemon, so "of course" one will want it
> to log to syslog, no?
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000acf57b065e844789
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Maybe overcorrection on my behalf but I w=
as just trying to make all the options in the=C2=A0component configurable<i=
nput name=3D"virtru-metadata" type=3D"hidden" value=3D"{&quot;email-policy&=
quot;:{&quot;disableCopyPaste&quot;:false,&quot;disablePrint&quot;:false,&q=
uot;disableForwarding&quot;:false,&quot;enableNoauth&quot;:false,&quot;expi=
res&quot;:false,&quot;sms&quot;:false,&quot;expirationNum&quot;:1,&quot;exp=
irationUnit&quot;:&quot;days&quot;,&quot;expirationDate&quot;:null,&quot;is=
Managed&quot;:false},&quot;attachments&quot;:{},&quot;compose-id&quot;:&quo=
t;3&quot;,&quot;compose-window&quot;:{&quot;secure&quot;:false}}"><div><br>=
</div><div>Re: SYSLOG:</div><div>=C2=A0 =C2=A0 I actually don&#39;t enable =
or need it.=C2=A0 Yes it is a daemon but in my systemd-based platform witho=
ut=C2=A0</div><div>=C2=A0 =C2=A0 this flag it goes to stdout and stdout goe=
s to the journal by default but is otherwise controlled by `StandardOutput<=
b>=3D`=C2=A0</b></div><div><b><br></b></div><div>Re: DEBUG:</div><div>=C2=
=A0 =C2=A0 I needed=C2=A0it when I was integrating into my system=C2=A0and =
things were not working WRT umtprd.=C2=A0 In that case I would=C2=A0</div><=
div>=C2=A0 =C2=A0 never have enabled=C2=A0<span style=3D"background-color:t=
ransparent">BR2_ENABLE_RUNTIME_DEBUG as I&#39;m interested in debugging tha=
t specific component.</span></div><div><span style=3D"background-color:tran=
sparent">=C2=A0 =C2=A0 Granted I can forgo this and just patch the=C2=A0mak=
efile for a debug build.<br><br>So if you guys=C2=A0think its cleaner and e=
asier I can replace this whole patch with the addition of:</span></div><div=
>=C2=A0 =C2=A0 ifeq ($(BR2_PACKAGE_SYSTEMD),y)<br>=C2=A0 =C2=A0 UMTPRD_BUIL=
D_OPTS +=3D SYSTEMD=3D1<br>=C2=A0 =C2=A0 endif<br></div><div><br></div><div=
><span style=3D"background-color:transparent"><br></span></div></div><br><d=
iv class=3D"gmail_quote gmail_quote_container" style=3D""><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Oct 13, 2026 at 9:04=E2=80=AFAM Thomas Petazzo=
ni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@boo=
tlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Tue, Oct 13, 2026 at 01:12:50PM +0200, Peter Korsgaard wrote:<br=
>
<br>
&gt; So I guess it does make sense with the option, unless we say that it<b=
r>
&gt; should always log to syslog given that it is a daemon.<br>
<br>
That was my thinking: it&#39;s a daemon, so &quot;of course&quot; one will =
want it<br>
to log to syslog, no?<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--000000000000acf57b065e844789--

--===============5650239494575651772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5650239494575651772==--
