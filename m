Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFCF606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 18:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pEWSVyik
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E3B140434;
	Sun, 25 Oct 2026 18:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDxNwMRljvN6; Sun, 25 Oct 2026 18:24:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BF2084047C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792952648;
	b=OY9ITUAbyOeXHydRicJrHlPr/YXGgbHLf3pGnDURGWyFxBDakUihvSUE5sIStHbwzN9U
	 yWRB/kCGGzNy0kFz3FRrn9v8KBP8pIvsPwQ/7F1SKYYDo7Nra2oB+K2L8dZc8MJTCZYij
	 RCCS3QLiC47emw4QfOgxCeoVf8X7fWQuw5zfOrccCfsB8Js9AyXfvu5fx7lmIkp1wT5Ul
	 uF+gOzDo8zORWnJJrsmyukw2OrJwHjmaH43j0EgFIroSNGyMVaYit5ObfK+A9fJik4dLy
	 FFSxVf/8zp7ecUhdPlWpWH/InimFMIbHpPadg3Isu0wcoKIarVwx0LpvQjZzbeOs/KQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792952648;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Forwarded-Encrypted:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:To:Cc:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Errors-To:Sender;
	bh=USEuaFpcRsMEbZB2P+cnGM74O2d5G/MADT9IeluF2ls=;
	b=EZSuaeZGM/s6q8T5/PiZrWxPBlNJSRs5o2s+u8itV01dnZ57yItrMKjf5eBNIcqnr/YQ
	 k0GeISeLnD4KQrBYl/AZXZNC27hajAZTtbpnht+D4e/Sot2BF3kvVgUN8HSTrmKJXZu2p
	 dmnYqZAsk/cPFfx3pVvWQsA5CzNAqt9f6h9IfAXLYapqmk1e9dsZwcbSY7FD+4KLdhgzT
	 XcBBDjp7z24iYDF/xUxWDIbXItkVzrx1tAkhklHd5YQETffHJ7hcPKSkWXr0Eu0DqPP4A
	 U+NvizpRGahYYmh/DF3vPaG46KJUWekDhvLU0tFGTFZH7l6MRm1/idZ92f5e1NljLjw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792952648;
	bh=USEuaFpcRsMEbZB2P+cnGM74O2d5G/MADT9IeluF2ls=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pEWSVyikJ4sI5jz3MviQYADoAFk6aAPs2IPf+LdHc1YZQE/mbrxsyS9Ajy8U9qdg6
	 WFgjBChbKPuSOsae3V9uDe2uHtt9DLDqo+6CKN+zMwrTxLLVmm/OsozSAXziqdM45D
	 udnRZ+OAWSiRxRs9tfEvP42I6sr3w8v6rbQZiWO/MzULFYaczj6XYHtP7/tDkuydyo
	 DsYgc5uXhAuMhzO4yAEbdkPPVFyvzeBeXBApB4irAKiOzL1K41AEz/xRCAku43cCzu
	 NA8EjVPI/f5WR+/LnIzvBJSuMv3xmRY/FhkU98zIz0manSl9B7MzXwjLUDc9sbHjPE
	 oYOMZaPyYoHiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF2084047C;
	Sun, 25 Oct 2026 18:24:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DE43A235
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 18:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFB09605F0
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 18:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ikqi3BOqgRsf for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 18:24:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 95FF7605E3
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792952645;
 b=cO1ZuWats73zVjwOpdcO/A30kYlWboLltZ6X3M/p4a427+zQMCYJe28x8pNMOCNzptKP
 nLKeZ3D5NWJpxghW9CXcOW2I8b+UbIFLrj1FvPItjw7q9bNSSzl/J3cH8WVy6hheGKZho
 atzeA3x2+WHpAx52b2+1MmFaOA5DP7goMOwIW3My3imD7dEhfoeXx+BHBRd0BXcIplQSc
 J46oRRJsvrK2HvE+jKxpIJi85Jgr5K+i6W0uR2STGrvhbTLvAGpHSbkiDLB3RUJevr71Y
 X6Cmv3OECK/FH2yRI3wjnPF8bYgEfl8OEmdxU8o0TyvQDUBXTYH7OJEk5MbTOVLAS4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792952645;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
 Subject:To:Cc:Content-Type;
 bh=YURNSoKXZa1k4qFZ2u7OnXNPvaIJOzBz0z9vRoBB7d0=;
 b=RgTK4YAwrI8bgzGPlSxgm1bNK0rOOcVtAnyswEHgDIzM1A27PP5whTLNvHARJr9CJi/t
 UdOwVeL0gWdwsCCrHVnBIvskgFWRaztZR6P8Cm6pbZ4QQMCzNa03g5jDPQzzu1MnYUkMF
 AgIEw+JIggqL6NBFDjgxfxesNo7VmhkaHm8iJ3KjTbGQivJRQECCYWEJBPm4UrFSsNm3G
 rcXA8EDZK6MECAT+nksN4ziP3GZYkiTb2arBoYvYV5zkFCyye8MelqbQO3uDTd/J9bGLG
 JyS0tvHI94QB4BN4VBMfP++SXNiD+32xfGc45nq7zpel4IoYgCSLtCacn4OfXJJaWKg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=none header.from=devoogdt.com;
 arc=none smtp.remote-ip=209.85.160.171
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.160.171;
 helo=mail-qt1-f171.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95FF7605E3
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 18:24:04 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-53381e53b80so25494651cf.1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792952643; x=1793557443;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=YURNSoKXZa1k4qFZ2u7OnXNPvaIJOzBz0z9vRoBB7d0=;
 b=2f04xn3sQqaH9dvBwnFwlI+ISxmzxG1zZAzdGwZmM/RRpsYk1OMtxXRMC/yd2vS1J7
 Yk8HZZ9UPT/Je/5fYBQUkgeVrTvSrzTHtBn1p4JS2Z0GE4VkaDS3RkXiF5afwSg4M3cY
 AYVYxmozovl4da++JoskHpB0ma9St32u9sb9U9U5SDbJpId0ZYGjSKu5/3FbDdufGAl6
 8cM4IrqCWKE+7BKv5oU/tOafFbe4n+uQV780OBcO9oKQJsS8FAAx6fVQCo3ZfNAE4AYw
 gtxyaBpPa/S0EAG2sW9Dl/AAPP5bDOlf7beyX1ZqIDO8GOIS/Qqojcv9aedHyiwgPnFX
 P5Fw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwSSxnoe8Mj0eqfDxjBU3AvYK++l4+UdAS4eXy8U+9M9POE1Xsl7KQ6VQqakPFM7dAyOw/99yznR7U=@buildroot.org
X-Gm-Message-State: AFq9FYIxQ7NCorjgj0I6qv772vKaUH132zVP3SXX1EgDcW869cNJtzXw
 thuLmQzCawioJeSWmM8TWIpNFVXfq9jJAgeR8TZQETpmF7IXqP+k1guwTbaF2kcY+9Q=
X-Gm-Gg: AYBFou210/igt+bG3ZAO4l+m7VTNkGrKWNNE8noZyGkn0Z4CwJ6RlVISZ3NbK4PJTB9
 hW2eVzxyRTppjGI7OrB931jLF9Fp8uSV2eEmPOYxMLDwAWx/0xAalPV0FLnPHQ2/1++WamvMaX/
 qxXgzx+oqLBHl4nCKdgx9QkBc5xhrzMlsR4RhmrTgkHWGM7aKftseRVxaRLEwogopmirESQmkkD
 Gwthi6pA9ouN0WcncsKOVbgejeI13jQ4ccKa2cqMmL/fM4rwTRaMfNGX0NYmhEKNuN7EIT0lM7a
 yOY1hkxbruj2wnGUvdeKo1nUlmd2a8p/WieTokb9sPfyNE9ZyBk3FPQmGqN3vKg9xDZZjkLjU5E
 KMoFK/G1GHgKyJGfXweKfVtdRXlL9ZZkIka3+uPHhWzphdXk6kymM7h+V4qTk80c+rLMDwtNpH9
 wNjXQAlTn824jl4eNZzsMCpYz40+e63AjrWEQ2QRSd8dFh7U1bpVVJC0cC3F121HT3KfwLSwFI4
 oBLkJOgcNqfLXVQXlBYsqzaoVx3YLyZAxp3bY49xW7aw2z0+e9aAIlxap2QPRfRJMwL+qPybApW
 85yogze06o61Zt7P2so9lEpUup8nnIIv248aj6L94G0Nozl7cfkJo8cUpH/Q8sYmwQmLKNZxLnm
 6Lzr1bH3hrTS36CxrOkmhTGFy+pz+oQJHLSDZPw==
X-Received: by 2002:a05:622a:5149:b0:536:79aa:de06 with SMTP id
 d75a77b69052e-5383b6ee917mr75794011cf.52.1792952642788; 
 Sun, 25 Oct 2026 11:24:02 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com.
 [209.85.160.175]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-538394f7e49sm38323141cf.15.2026.10.25.11.24.02
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Oct 2026 11:24:02 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-535179e995bso24405451cf.0
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:24:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvByUOu3t/vZ/06DVO4dtTFulGO9JoPHAo+i5+EO/EtzKJGqhN8mCFFDpxKQsxEeewDLZaZgeSbleI8w=@buildroot.org
X-Received: by 2002:a05:622a:98f:b0:532:c197:6529 with SMTP id
 d75a77b69052e-5383b6c02bamr73617931cf.49.1792952641818; Sun, 25 Oct 2026
 11:24:01 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018160651.349981-1-j@j-ernberg.se>
 <atUtmzafWnVtVm-t@windsurf>
 <atWwZGNSjbN0GrwD@landeda> <atXItOiRRP2j79zR@windsurf>
 <atXov2HEcIiVzCAU@landeda> <atYLM_NKiCwSpJSU@windsurf>
 <CAAHg4Zh+asqbkBTqtoaaZgRTgWn0YxUp0CnLfxD84vYwPNvetg@mail.gmail.com>
 <CAAHg4Zh0QZJ5Nep0S+BJnUO_zmB7p3nwYwYXDg594gb4vnz1dQ@mail.gmail.com>
In-Reply-To: <CAAHg4Zh0QZJ5Nep0S+BJnUO_zmB7p3nwYwYXDg594gb4vnz1dQ@mail.gmail.com>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sun, 25 Oct 2026 19:23:50 +0100
X-Gmail-Original-Message-ID: <CACXRmJjqwgffsZb10VxU1JVia=4jJ=JCQOhgXXZSXDaqyhpVEw@mail.gmail.com>
X-Gm-Features: AclHuK-e0BhpEKGAoWRhpk3UGE1oWnVxHqjhw-eszRsC-jUom_xUNnX7OVIGacs
Message-ID: <CACXRmJjqwgffsZb10VxU1JVia=4jJ=JCQOhgXXZSXDaqyhpVEw@mail.gmail.com>
To: John Ernberg <j@j-ernberg.se>
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, 
 buildroot@buildroot.org, Adam Ford <aford173@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bernd Kuhls <bernd@kuhls.net>,
 Joseph Kogut <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>
Subject: Re: [Buildroot] [RFC PATCH] package: {libgl, libglvnd,
 mesa3d}: Propagate libglvnd GL provider to libgl dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1936497161746341921=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-0.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1936497161746341921==
Content-Type: multipart/alternative; boundary="00000000000050959a065eae51c1"

--00000000000050959a065eae51c1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,


I added VA-API support because I needed a simple raspberry-pi server for a
local theatre project and
found it applicable to upstream. So no, I don't really need it anymore.

I see that I wrote this in commit 460700d38e1bb9ddb83bf8de81d69a2448099165:

The circular dependency only occurs when mesa3d is the libgl provider,
i.e. when GLX is enabled *without* libglvnd. In that case:
  mesa3d -> libva -> libgl -> mesa3d

So, I don't think that there will be a problem when libglvnd gets dropped.


Kr,

Thomas Devoogdt

Op zo 25 okt 2026 om 15:14 schreef John Ernberg <j@j-ernberg.se>:

> Hi Thomas D,
>
> Full context here:
> https://lore.kernel.org/buildroot/20261018160651.349981-1-j@j-ernberg.se/
>
> Thomas P has suggested to drop libglvnd as a resolution to the issue
> the patch linked above tries to resolve.
>
> Turns out that a removal of libglvnd will regress the recent
> enablement of the VA-API support you recently contributed. Are you
> still a user of libglvnd?
>
> Best regards // John Ernberg
>
> On Thu, Oct 22, 2026 at 11:24=E2=80=AFPM John Ernberg <j@j-ernberg.se> wr=
ote:
> >
> > Hi Thomas,
> >
> > On Mon, Oct 19, 2026 at 2:23=E2=80=AFPM Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com> wrote:
> > >
> > > On Mon, Oct 19, 2026 at 11:54:07AM +0200, Yann E. MORIN wrote:
> > > > Thomas, All,
> > > >
> > > > On 2026-10-19 09:40 +0200, Thomas Petazzoni spake thusly:
> > > > > On Mon, Oct 19, 2026 at 07:53:40AM +0200, Yann E. MORIN wrote:
> > > > > Yes, because right now we have:
> > > > >         [GL-using package] -> libgl -> libglvnd
> > > > > And separately
> > > > >         mesa3d -> libglvnd
> > > > > which means that [GL-using package] can be built before mesa3d,
> except
> > > > > that libglvnd doesn't provide *all* what is needed to act as a GL
> > > > > provider, for example it doesn't provide dri.pc.
> > > > [--SNIP--]
> > > > > > I wonder if should further have this:
> > > > > >     [GL-using package] -> libgl     ->     libglvnd
> > > > > >                               \-> mesa3d -/
> > > > > I'm afraid I don't understand your diagrams :-/
> > > >
> > > > * libgl depends on libglvnd
> > > > * libgl depends on all actual GL providers (like mesa3d)
> > > > * actual GL providers (like mesa3d) depend on libglvnd
> > >
> > > But what are you describing here? How it _should_ work, or how it
> > > works _today_?
> > >
> > > Because today the part:
> > >
> > > * libgl depends on all actual GL providers (like mesa3d)
> > >
> > > is not there, and that's precisely the problem.
> > >
> > > That being said: it is odd for mesa3d to provide dri.pc. This means
> > > that if you have multiple OpenGL providers... they would all provide
> > > their own dri.pc, overridding each other?
> > >
> > > > > > ... even though the libgl -> mesa3d would be here just to ensur=
e
> build
> > > > > > ordering, and there would be nothing from mesa3d that the
> [GL-using
> > > > > > package] would use at build time in practice. I think...
> > > > > And that's where you're not correct, and that's the whole point o=
f
> > > > > John's patch in the first place. Check out his commit log for
> details.
> > > >
> > > > Sorry, I don't have the thread history here; only digest-subscribed=
.
> > >
> > > Welcome to the world of lore/lei :-)
> > >
> > >
> https://lore.kernel.org/buildroot/20261018160651.349981-1-j@j-ernberg.se/
> > >
> > > > IIRC, one of the reason to bump the nvidia-driver back at the time,
> > > > besides the bump itself, was that the newer driver was glvnd-aware.
> > > > But this has stalled.
> > > >
> > > > Also, eventually, there are tricks to actually have multiple GL
> > > > providers, when one uses br2-external trees, so even if GL provider=
s
> > > > bundled in Buildroot do not play nice with glvnd, it does not mean
> > > > out-of-tree providers can't use it...
> > > >
> > > > > Essentially, I'm trying to figure out whether we should:
> > > > > (1) Fix this libglvnd issue by adding more complexity
> > > > > or
> > > > > (2) Re-simplify everything by dropping libglvnd entirely
> > > >
> > > > Well, no longer my call to make anymore. I was just providing a
> > > > recollection of what I remembered from back then.
> > >
> > > Indeed, but I wanted to see if there was anything I was missing.
> > >
> > > On my side, I believe I would be in favor of (2), i.e dropping
> > > libglvnd.
> > >
> >
> > I was dragging my feed a little bit to see if Yann had more to add to
> > the discussion.
> >
> > I'll whip up a removal in the next couple of days.
> >
> > Best regards // John Ernberg
>
>

--00000000000050959a065eae51c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div><br></div><div>I added VA-API suppo=
rt because I needed a simple raspberry-pi server for a local theatre projec=
t and</div><div>found it applicable=C2=A0to upstream. So no, I don&#39;t re=
ally need it anymore.</div><div><br></div><div>I see that I wrote this in c=
ommit=C2=A0460700d38e1bb9ddb83bf8de81d69a2448099165:</div><div><br></div><d=
iv>The circular dependency only occurs when mesa3d is the libgl provider,<b=
r>i.e. when GLX is enabled <b>without</b> libglvnd. In that case:<br>=C2=A0=
 mesa3d -&gt; libva -&gt; libgl -&gt; mesa3d</div><div><br></div><div>So, I=
 don&#39;t think that there will be a problem when=C2=A0libglvnd gets dropp=
ed.</div><div><br></div><div><br></div><div>Kr,</div><div><br></div><div>Th=
omas Devoogdt</div></div><br><div class=3D"gmail_quote gmail_quote_containe=
r"><div dir=3D"ltr" class=3D"gmail_attr">Op zo 25 okt 2026 om 15:14 schreef=
 John Ernberg &lt;<a href=3D"mailto:j@j-ernberg.se">j@j-ernberg.se</a>&gt;:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Thomas D,<br=
>
<br>
Full context here:<br>
<a href=3D"https://lore.kernel.org/buildroot/20261018160651.349981-1-j@j-er=
nberg.se/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/bui=
ldroot/20261018160651.349981-1-j@j-ernberg.se/</a><br>
<br>
Thomas P has suggested to drop libglvnd as a resolution to the issue<br>
the patch linked above tries to resolve.<br>
<br>
Turns out that a removal of libglvnd will regress the recent<br>
enablement of the VA-API support you recently contributed. Are you<br>
still a user of libglvnd?<br>
<br>
Best regards // John Ernberg<br>
<br>
On Thu, Oct 22, 2026 at 11:24=E2=80=AFPM John Ernberg &lt;<a href=3D"mailto=
:j@j-ernberg.se" target=3D"_blank">j@j-ernberg.se</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Thomas,<br>
&gt;<br>
&gt; On Mon, Oct 19, 2026 at 2:23=E2=80=AFPM Thomas Petazzoni<br>
&gt; &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" target=3D"_blank">=
thomas.petazzoni@bootlin.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Mon, Oct 19, 2026 at 11:54:07AM +0200, Yann E. MORIN wrote:<br=
>
&gt; &gt; &gt; Thomas, All,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On 2026-10-19 09:40 +0200, Thomas Petazzoni spake thusly:<br=
>
&gt; &gt; &gt; &gt; On Mon, Oct 19, 2026 at 07:53:40AM +0200, Yann E. MORIN=
 wrote:<br>
&gt; &gt; &gt; &gt; Yes, because right now we have:<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[GL-using package] -&g=
t; libgl -&gt; libglvnd<br>
&gt; &gt; &gt; &gt; And separately<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mesa3d -&gt; libglvnd<=
br>
&gt; &gt; &gt; &gt; which means that [GL-using package] can be built before=
 mesa3d, except<br>
&gt; &gt; &gt; &gt; that libglvnd doesn&#39;t provide *all* what is needed =
to act as a GL<br>
&gt; &gt; &gt; &gt; provider, for example it doesn&#39;t provide dri.pc.<br=
>
&gt; &gt; &gt; [--SNIP--]<br>
&gt; &gt; &gt; &gt; &gt; I wonder if should further have this:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0[GL-using package] -&gt; libgl=
=C2=A0 =C2=A0 =C2=A0-&gt;=C2=A0 =C2=A0 =C2=A0libglvnd<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\-&gt; mesa3d=
 -/<br>
&gt; &gt; &gt; &gt; I&#39;m afraid I don&#39;t understand your diagrams :-/=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; * libgl depends on libglvnd<br>
&gt; &gt; &gt; * libgl depends on all actual GL providers (like mesa3d)<br>
&gt; &gt; &gt; * actual GL providers (like mesa3d) depend on libglvnd<br>
&gt; &gt;<br>
&gt; &gt; But what are you describing here? How it _should_ work, or how it=
<br>
&gt; &gt; works _today_?<br>
&gt; &gt;<br>
&gt; &gt; Because today the part:<br>
&gt; &gt;<br>
&gt; &gt; * libgl depends on all actual GL providers (like mesa3d)<br>
&gt; &gt;<br>
&gt; &gt; is not there, and that&#39;s precisely the problem.<br>
&gt; &gt;<br>
&gt; &gt; That being said: it is odd for mesa3d to provide dri.pc. This mea=
ns<br>
&gt; &gt; that if you have multiple OpenGL providers... they would all prov=
ide<br>
&gt; &gt; their own dri.pc, overridding each other?<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; ... even though the libgl -&gt; mesa3d would be he=
re just to ensure build<br>
&gt; &gt; &gt; &gt; &gt; ordering, and there would be nothing from mesa3d t=
hat the [GL-using<br>
&gt; &gt; &gt; &gt; &gt; package] would use at build time in practice. I th=
ink...<br>
&gt; &gt; &gt; &gt; And that&#39;s where you&#39;re not correct, and that&#=
39;s the whole point of<br>
&gt; &gt; &gt; &gt; John&#39;s patch in the first place. Check out his comm=
it log for details.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Sorry, I don&#39;t have the thread history here; only digest=
-subscribed.<br>
&gt; &gt;<br>
&gt; &gt; Welcome to the world of lore/lei :-)<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://lore.kernel.org/buildroot/20261018160651.34998=
1-1-j@j-ernberg.se/" rel=3D"noreferrer" target=3D"_blank">https://lore.kern=
el.org/buildroot/20261018160651.349981-1-j@j-ernberg.se/</a><br>
&gt; &gt;<br>
&gt; &gt; &gt; IIRC, one of the reason to bump the nvidia-driver back at th=
e time,<br>
&gt; &gt; &gt; besides the bump itself, was that the newer driver was glvnd=
-aware.<br>
&gt; &gt; &gt; But this has stalled.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Also, eventually, there are tricks to actually have multiple=
 GL<br>
&gt; &gt; &gt; providers, when one uses br2-external trees, so even if GL p=
roviders<br>
&gt; &gt; &gt; bundled in Buildroot do not play nice with glvnd, it does no=
t mean<br>
&gt; &gt; &gt; out-of-tree providers can&#39;t use it...<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Essentially, I&#39;m trying to figure out whether we sh=
ould:<br>
&gt; &gt; &gt; &gt; (1) Fix this libglvnd issue by adding more complexity<b=
r>
&gt; &gt; &gt; &gt; or<br>
&gt; &gt; &gt; &gt; (2) Re-simplify everything by dropping libglvnd entirel=
y<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Well, no longer my call to make anymore. I was just providin=
g a<br>
&gt; &gt; &gt; recollection of what I remembered from back then.<br>
&gt; &gt;<br>
&gt; &gt; Indeed, but I wanted to see if there was anything I was missing.<=
br>
&gt; &gt;<br>
&gt; &gt; On my side, I believe I would be in favor of (2), i.e dropping<br=
>
&gt; &gt; libglvnd.<br>
&gt; &gt;<br>
&gt;<br>
&gt; I was dragging my feed a little bit to see if Yann had more to add to<=
br>
&gt; the discussion.<br>
&gt;<br>
&gt; I&#39;ll whip up a removal in the next couple of days.<br>
&gt;<br>
&gt; Best regards // John Ernberg<br>
<br>
</blockquote></div>

--00000000000050959a065eae51c1--

--===============1936497161746341921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1936497161746341921==--
