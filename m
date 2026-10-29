Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D63606A330
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 09:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=O/sqTSP/;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=l8FJZISD
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4789660710;
	Thu, 29 Oct 2026 09:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dnS3kJMcVzAa; Thu, 29 Oct 2026 09:58:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BC48C60686
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793267906;
	b=VoHZGoUmYEgYki2XEAs+lFuXsq9EPysXzQSqpdm1TZOp3oIfhetu3LN/0v9sNrGfeAFP
	 SDzloZCxN5wyXClVwxSTzZuKXICErgacoEt7dMs/92DRAL/WROVyVorKXbgymHsDOvOsi
	 Ei+c6iXsuFqLJtYOD3RHbfk7kH6piIv3jAeG51DygIzwkb9NEz2KWEogJ5XnvqybLevwt
	 Z2UkeTZBAmDj7MR36fi644/hvTn1dr1glsOqs8+XjOChOhOctRVqUBmJOeTHZ1Lx+2OpT
	 MFPlTqfv2hNki1fcn7nMwl1wdT0Qy5be1b51GqG8InuYL//GTqxp7rmQ67ooET3uklQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793267906;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=xb9QeQjw7YBA8T2P9RuhF0abr3HwkrG/VYALp1AmgeI=;
	b=jL17u3NhqRLbWYd9QohvojNJNDiNlrb90FG1SQWiyMHtFpmXQ+GzQwKaOetlc6pHLwgx
	 O4C3UMED/cgf9dZLpaEfCWkW+kMRHAJFqtCiau5337hyL6OH6UHnI6brAI25i+J2sE0N7
	 NNMcVfkFzn8tXxaiUzKwVERCgKvimnTS4VuAh5VMUXuZRQvrOAUqCzZgA47J5DiVix+Ue
	 1NZs09tOUr1AGdIUeG2JicgMr4PomWB0URlAhQKXhvGV1Fa41q9bLDtP3z475qoPTAEV8
	 EEIGDboWbwDKl0h9VbxtXrYN3OpGHvIJvtWOJ6TYmxBJKaT2c/ZDBdKx5MT3vqYILyg==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793267906;
	bh=xb9QeQjw7YBA8T2P9RuhF0abr3HwkrG/VYALp1AmgeI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O/sqTSP/n9Ks6IsN+uMxlegf0cWOdEMMuQfcmClkgBnDlWljtrVlL0n15vyuUy+1T
	 QazmH/KBAuA/EyoGvsv4rTn3jjsubplY2wAPjQKEI6Pvm46ktFNRf8MTASjvTjUX3W
	 1qO1V5RDaiZ5IONc+9/bDe2+0bIny+r6IiXUey+mtbinZEQOfPDeaBfVgyBGWyszpi
	 jDjoSlnhOjsIW+htaf8P1SltSfAvKXptPZTllAU2YVr5HBs+P384X61T4BDDATxeYe
	 hIHXCDKkpnKPqdgLuSwAICdH3Pddpop383zjuQLztXehU1R/vjM33AGZUtKOuYbFut
	 SBnoSA0SJOaOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC48C60686;
	Thu, 29 Oct 2026 09:58:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3CAD356
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 09:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A54704032E
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 09:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vY07NeUbpZDb for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 09:58:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6762A40024
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::b12f"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1793267904;
 b=HfRDFG5ghxp9tTZK30UYa0bEn8NuNo9pF7vOinksuz4BeWtRi8bHSvo46Eq7ycimPt6u
 R1lbN3mvRhuBOV62Wm6w3TuD0ODgOiHbYSCZQDvsYFAERYgR+DVtRjhlLbJejA2PD0ILQ
 386bgzix5yvjFSZidyHYGrODAlQlcw9NSrYZ/BwVOxTdeZr/6MFkp3CPxgka2YATAyLTV
 SCyWT6FfymBoBpfGS0rz8HPwgltHZYzo6lUNFN9IW/XyppBKG9m7miDTzRFTdLA1+1MZl
 hv0cFZSwfaFnI+HhS6yBN7i9zXkR8WsF7VqPDts//5V22Bi45rR5ZHhmU9+87hrZIJQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793267904;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type;
 bh=5rpsqrHaIuB/GR6EQMLo2EExzcwQxfuGI8m7lYnSEVE=;
 b=P4m5BAAmSToUFjAEnm/2e4wz1KvOi36nA9IUdRplWLiW3o0K42epn4HqrRhjO+1MglpA
 ziVSfXMKclyNUnKkml0zbz9UxbSuOU5Vq/2jUCFaQKHHs3cXlOsDWq+/Ab/JvXy3icdlR
 3kenOXaBIJJa+CvwwHwoFFhsvsfyYeFu+rSpx4YeG4aeqQQwx3qqORGr+3n1XcrNhGf8n
 u/YIVfgWimdycHo+BqFLAvwG//l+huaPSEQc9C6t1V8DhIrsNIahf+4Q5OvXSYDz5TVVh
 eneR5ZZ06DtQ0d/5uLdhMXuO1oYhyVZipGDZ0UbnB6z42guF5WF9XRISuvtjoe1cTMQ==
ARC-Authentication-Results: i=2; smtp2.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=l8FJZISD; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::b12f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b12f; helo=mail-yx1-xb12f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=l8FJZISD
Received: from mail-yx1-xb12f.google.com (mail-yx1-xb12f.google.com
 [IPv6:2607:f8b0:4864:20::b12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6762A40024
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 09:58:23 +0000 (UTC)
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-677d35fd1d2so2023620d50.1
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 02:58:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793267903; cv=none;
 d=google.com; s=arc-20260327;
 b=fcSBikh3n8QxNtYsO4ijliVC68uJIWXPeYF4mY7G7KWJC4XQsXxxnogjmEIXqD1KCV
 1rG2LJDdFaJtkEol3lNLBEKuR0d37BR0ZEtuy0/AvXK4dEHkvA3UpJNUhJxZ+Irp5jW1
 srQC87EF1Lriwd6u0hj8pxPuMiyO9/HCrw9PUdxylpOxpMFw7PZ2E2srUdHmOApJ8INu
 6wIG6un17Ui2A8nlqRH9hsOyrwjcXgdMO7oCGdLP5GvJLAPuGx4YgOy4Ab/OT+LSRls2
 YRr42zyrj2iT1aVZwK71OiQUUw2RwAFgc4Fr9x3etuiy64KFiVp+iJ4sQWyx05B9HgjO
 xjDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=5rpsqrHaIuB/GR6EQMLo2EExzcwQxfuGI8m7lYnSEVE=;
 fh=t1HKz4FGwg2rlpSa7EUNbKGYl/IKyrvQ/1p5yhNuG2o=;
 b=lyj/KQIbkSWAOxQD848efQR0PsbsYRdc8fD1TeccToo5UWjTOVeIDVC+QALp+70Q0t
 YZaH/1kWuzYmxojINHUCoWcfx/ULsgWfL90Kmq0hin+A8Cag70WdFc9JBnNNqoDnyywN
 My/v+2IB3VIHlHM2ijBm1h2QIECQD5/voZpixIVtcWNeK9uhE8Arf8K4hP592Arqco6S
 QSEKaF/clbemgJwgdE6Vre5xGhsqPpNqZX9Vy88FH8lQ6DNGRI8XLlJShNdHluf0MaZV
 gFWhRDTdORpz5xxb61tbTF5dacL+45irjb+NMKyKqvqixTf5agOycrFC/IFssodqyyTX
 QYWQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793267903; x=1793872703;
 darn=buildroot.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=5rpsqrHaIuB/GR6EQMLo2EExzcwQxfuGI8m7lYnSEVE=;
 b=l8FJZISDQFty9b9LfFUM96+zXrMHWgFLtAZ/t5FztyVqbebpStuCqevinDYG86JP+P
 xDNz00perCRKIxpSw/RgWchrG6RuLkTQW/yYD+lLskWBOhJiuXBmGylegDI4rsf+TzBm
 X0aAOG+nfuIUNsoHV/Pci3M2CLiAD+nvTYPtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793267903; x=1793872703;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=5rpsqrHaIuB/GR6EQMLo2EExzcwQxfuGI8m7lYnSEVE=;
 b=Xx3dwDrbS5uPJ0neeiAKOr2bxlb3ha1U+FqX8El1EPlhCLEnwX9mHm8r1qk0kfOIuY
 3i05Ehlsc+1ENTqVYk1Uhzkxp9Nz8fSzVcK3Cpm+xOexpp62kZLvmNtMI+tHzSQp4297
 a4ENTNJLRVo1S4iLLMr4/dq/72oyzcvVcFLJGf3CSSK+umLLgo2B+Q3LvnCtJT78ijhm
 vxWi4etkHRTlON0auXglGXjZ5nPo8jA/gEIfjiZBJNrTMnduoofoGXmI3hNJZ4IhESE0
 UthnMBiZ0g34TN2pT4F6g0zDAM+W0Ph7dU4p9+y7b45Qv5Pnhx11NTDZWTfUJkRKsSi7
 H0Fw==
X-Gm-Message-State: AFq9FYK/Y0RYwVGzx2tl6Qcx+dM1A3zY+io0UlY3J7qKY/gwpJDD9z+y
 oMen2Y4HXrzTJB1WE6CJROqgpT9795QpwM+eeAZa8/OjYd8nweAmoFV3hbDtOEg5/vKP4lQnI2B
 90hlVfy18UB7KSQMs26+o/g2GV/Qr7eQMEyDvXogFu7dFLx7ZM926758=
X-Gm-Gg: AYBFou0h2qkaO7dDjrXtYgLF7F9kEUbYWWwdmyfei6TBpFJH3vzEj58w0ryE1qc2f83
 d+Ws216NTU3MoLZm75eJ0hN8WYD4/aukK2rSE5jQz9mMmUjisT90AlPg5wViXeAVI4eUiwp/uw+
 8DIvmZMmdjWzavgnNKnCXvmHamozTXoTVkri9CQgTQNqdUEZIu8T3rQxm3LXCuJWw0dZ4SrXQVU
 4qam4V5xhvumbMRsrupNeHJVnscozqdrF1h3fOqkN+Gr9W1kr3Iu4G2CeFtked6Mp1ZuVWir9Xj
 HHXxzayfyCXwJjH5QZY2xOvJ1feyT8GkzsiT8PLDDGOeGe5rn4rKLzUO1225ocwE6RljgK0V52j
 2KemvdOwlAoUSmxc8mK5jvQQke8jfzqjKuwMPyzyYTU0rryMiMRcJj/+UMdL6k6DscA==
X-Received: by 2002:a05:690e:1443:b0:66f:94c4:51ea with SMTP id
 956f58d0204a3-67a7bcaa621mr3435095d50.47.1793267901511; Thu, 29 Oct 2026
 02:58:21 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027144159.1097876-1-dario.binacchi@amarulasolutions.com>
 <20261027144159.1097876-2-dario.binacchi@amarulasolutions.com>
 <auDQxqNkGAR3F3JJ@windsurf>
In-Reply-To: <auDQxqNkGAR3F3JJ@windsurf>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 29 Oct 2026 10:58:09 +0100
X-Gm-Features: AclHuK-HfR0QWx7uubgHG--nEtlBLHaXAk2VRnhkDCeGJZfpADLJnOk5lZV5U1E
Message-ID: <CABGWkvq6-B8ETC79RY3pXJX2SY0-FB9o7cGdgQ6MkNrGeZLT0g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH 2/2] package/drogon: fix build with LibreSSL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5098866685342465148=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5098866685342465148==
Content-Type: multipart/alternative; boundary="00000000000041cef7065ef7b837"

--00000000000041cef7065ef7b837
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas

On Tue, Oct 27, 2026 at 5:27=E2=80=AFPM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Tue, Oct 27, 2026 at 03:41:58PM +0100, Dario Binacchi wrote:
> > The trantor library bundled in drogon 1.9.14 fails to build against
> > LibreSSL, because it uses SSL_CTX_set_cert_cb(), which LibreSSL does
> > not provide.
> >
> > Add the patch submitted upstream, which disables that call when
> > building against LibreSSL. The patch description explains the details.
> >
> > Fixes:
> >  -
> https://autobuild.buildroot.org/results/f1c7a336f3fabb2d2a2793930573b69bc=
47c3ee7
> >  -
> https://autobuild.buildroot.org/results/795c9ab125a029f0d90a267147cb6d6d8=
0887688
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> I am not super comfortable applying this one, I'd really like to see
> upstream's feedback before applying. Of course, if another Buildroot
> maintainer is comfortable with what the patch is doing, don't hesitate
> to apply.
>

The fix has now been merged upstream, unchanged:
https://github.com/an-tao/trantor/commit/a77cc3651d5950f2f8aeceab80f74f3187=
0f4017

I sent a v2 that points to the upstream commit.

Thanks and regards,
Dario


> Best regards,
>
> Thomas Petazzoni
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>


--=20
*Dario Binacchi*
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com

--00000000000041cef7065ef7b837
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Thomas</div><br><div class=3D"gmail_qu=
ote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oc=
t 27, 2026 at 5:27=E2=80=AFPM Thomas Petazzoni &lt;<a href=3D"mailto:thomas=
.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Oct 27, 2026 at=
 03:41:58PM +0100, Dario Binacchi wrote:<br>
&gt; The trantor library bundled in drogon 1.9.14 fails to build against<br=
>
&gt; LibreSSL, because it uses SSL_CTX_set_cert_cb(), which LibreSSL does<b=
r>
&gt; not provide.<br>
&gt; <br>
&gt; Add the patch submitted upstream, which disables that call when<br>
&gt; building against LibreSSL. The patch description explains the details.=
<br>
&gt; <br>
&gt; Fixes:<br>
&gt;=C2=A0 - <a href=3D"https://autobuild.buildroot.org/results/f1c7a336f3f=
abb2d2a2793930573b69bc47c3ee7" rel=3D"noreferrer" target=3D"_blank">https:/=
/autobuild.buildroot.org/results/f1c7a336f3fabb2d2a2793930573b69bc47c3ee7</=
a><br>
&gt;=C2=A0 - <a href=3D"https://autobuild.buildroot.org/results/795c9ab125a=
029f0d90a267147cb6d6d80887688" rel=3D"noreferrer" target=3D"_blank">https:/=
/autobuild.buildroot.org/results/795c9ab125a029f0d90a267147cb6d6d80887688</=
a><br>
&gt; <br>
&gt; Signed-off-by: Dario Binacchi &lt;<a href=3D"mailto:dario.binacchi@ama=
rulasolutions.com" target=3D"_blank">dario.binacchi@amarulasolutions.com</a=
>&gt;<br>
<br>
I am not super comfortable applying this one, I&#39;d really like to see<br=
>
upstream&#39;s feedback before applying. Of course, if another Buildroot<br=
>
maintainer is comfortable with what the patch is doing, don&#39;t hesitate<=
br>
to apply.<br></blockquote><div><br></div>The fix has now been merged upstre=
am, unchanged:<br><a href=3D"https://github.com/an-tao/trantor/commit/a77cc=
3651d5950f2f8aeceab80f74f31870f4017">https://github.com/an-tao/trantor/comm=
it/a77cc3651d5950f2f8aeceab80f74f31870f4017</a><br><br>I sent a v2 that poi=
nts to the upstream commit.<br><br>Thanks and regards,<br><div><span style=
=3D"background-color:transparent">Dario</span>=C2=A0</div><div><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Best regards,<br>
<br>
Thomas Petazzoni<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><font color=3D"#888888"><font color=3D"#000000" =
face=3D"Times New Roman"><span style=3D"font-size:14px"><b>Dario Binacchi</=
b></span></font><br style=3D"color:rgb(0,0,0);font-family:&quot;Times New R=
oman&quot;;font-size:medium"><span style=3D"color:rgb(0,0,0);font-family:&q=
uot;Times New Roman&quot;;font-size:12px">Senior Embedded Software Engineer=
<br></span></font><span style=3D"color:rgb(0,0,0);font-family:&quot;Times N=
ew Roman&quot;;font-size:12px">M. +39 328 0625246</span><font color=3D"#888=
888"><span style=3D"color:rgb(0,0,0);font-family:&quot;Times New Roman&quot=
;;font-size:12px"><br><a href=3D"mailto:dario.binacchi@amarulasolutions.com=
" style=3D"color:rgb(17,85,204)" target=3D"_blank">dario.binacchi@amarulaso=
lutions.com</a></span><br style=3D"color:rgb(0,0,0);font-family:&quot;Times=
 New Roman&quot;;font-size:medium"><span style=3D"font-family:&quot;Times N=
ew Roman&quot;;font-size:12px;color:rgb(241,194,50)">=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95</span><br style=3D"color:rgb(0,0,0)=
;font-family:&quot;Times New Roman&quot;;font-size:medium"><span style=3D"c=
olor:rgb(0,0,0);font-family:&quot;Times New Roman&quot;;font-size:12px"><sp=
an style=3D"font-weight:700">Amarula Solutions SRL</span><br>=C2=A0Via Feli=
ce Cavallotti 25D, 41012 Carpi, MO, IT<br><a href=3D"mailto:info@amarulasol=
utions.com" style=3D"color:rgb(17,85,204)" target=3D"_blank">info@amarulaso=
lutions.com</a><br><a href=3D"http://www.amarulasolutions.com/" style=3D"co=
lor:rgb(17,85,204)" target=3D"_blank">www.amarulasolutions.com</a></span></=
font></div></div></div>

--00000000000041cef7065ef7b837--

--===============5098866685342465148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5098866685342465148==--
