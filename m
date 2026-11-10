Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F3C606A32A
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 13:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Fia8Xb8V;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q5l3NGs/
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C335380DBA;
	Tue, 10 Nov 2026 13:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6GpVOR5sXQpv; Tue, 10 Nov 2026 13:58:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A7F1780E1F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794319114;
	b=Ar+/RzU+acdius2EUUDViZ8Qpt/8cbQgB7SZI0qaMDgM7P70o/JdZvTAQU7wtNABryO4
	 2Mjt4pYd3giSHHE+uL6WInXKN9KNVVKdJ7aEE5TEd3lBy5ZVzhNbSxPW4g5N4zVs0Sr55
	 NLRO/ATsrXRXoTuSDFEc3M+X7sItVGh5AH1jrBWu6O+OpDKw3bgIBvovZsQK/Rwr8HAcB
	 QtPJiHhM/OCPKeLmKAOI7WpVmYZNJtNJK4M0FqT3GbJW4BI77KZ0Ta5AT1HWHwDRNurgt
	 AwwZJfi3i87O+GngpRNCj/vIzMc8Kyse+4UUTJDbygPRk7kA1bZDByw19NwBrJiXc7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794319114;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=g+SAZz2Zk1Vy+raZ2cYJ3JlumxdhhlmNUKwEyvwwdi0=;
	b=llDJG5ckWxq3pLOgaG6OVtsG2Z8K9U7bT3Oj4sfKtJ1h9ZQEQRQNgtEC1YwotcWwDEnw
	 1YARUWVBDEDy5MynBUa6Sl0fcJN84/BR6PQ30qt3Oa4nRnobMzqbUM8fxrGYR5kFYp15a
	 mbvriCInqpb0FvPyTJLGGsZ819nX8fce4KcRJUHEGVNod0dg0ZNWsPqSl+47oAMo6Alzx
	 mWS5iLA6MKbzu1NzpEw1cT9AXO+8fJCIZvzeHvwPmM49gsjdwUfN4ZpNSjWxv//fTBjJO
	 UhDr3ygR8VRwm7283Hg3UbLMq/j40F4lLXf9ln6CrUEcbNIkzW8apZXfpnTzRuQilWA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794319114;
	bh=g+SAZz2Zk1Vy+raZ2cYJ3JlumxdhhlmNUKwEyvwwdi0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fia8Xb8VxseaW3juYFVow6cXjdYPo5KIpZfy86T3n89XFPGm6Z1YU8fO+vahF06Lm
	 6Bd+uRidFrN01YniFlLa3j48rQJ1Al7NlMHBQAN+qNpXuojTM3gLlNH0Fw6xCiOoUy
	 A6rx9X5mmDa/fem2Wd/XP0hg7mwjWv9Ko7g3A+ybVr7YgW1lZHEAQpK/lrdbgqZapB
	 gBph3F2voz/Qt2g+LbsmsojhygmvugIW3w8fxqSJpDBs+e3kWdk/xabJY5LEYnM9eV
	 AFe1CmtIGsgySeOLador7dAWhzSDtaVqiUor17Jh6CQgbq40BMAcOmeBwL6gkYju/v
	 9PvSpqj95ip6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7F1780E1F;
	Tue, 10 Nov 2026 13:58:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D4A36731
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 13:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B94D340941
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 13:58:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZSMcoN7lnBKb for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 13:58:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A2A404093F
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2001:4860:4864:20::36"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::36; helo=mail-oa1-x36.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=q5l3NGs/
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2A404093F
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 13:58:31 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-48eee44b908so1047323fac.1
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 05:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794319110; x=1794923910; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=EAqYF5m4jW49UeJ0VJ92Mu5i+E9buGqzRUmtu/kAZEU=;
 b=q5l3NGs/TmK3PC3wFyupRBwO09bBrKKsVvj5hmkJs686kpzVaEUf1qk5NYy02gybp3
 apfpysRGHaEBCh3lgEdbYhFNHT28t1aJx0jdg1aqa7kvjSc6BPU2gVzXSemUXzEUi4qE
 W5cWp1wQFzpWWtZYy4GO/ztiymsOOcrsb8xr6CG8EwURYpzEqCEuMTufpib+JtKA4mPx
 MI6gZiN6zpZCcimkomnfBTX6k0nHDaM98PBtGS670a/M0BA3kcZt+w4TBI/M0Ndz8sDj
 GYxHYeZ8EJ9uYDnwk9NBVzKwZwsZKc4/zVIOaFrbE+FcDX6ta1RPJaluM4YKQUoDe9jf
 bP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794319110; x=1794923910;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=EAqYF5m4jW49UeJ0VJ92Mu5i+E9buGqzRUmtu/kAZEU=;
 b=cfCtVMDIZpd+i/cAe3FdDGkbF0TFKugeaEo0/OQqe7NHHjMq9qeKX+wnZ17o+re2vp
 PBb6LBfPH9vnViQplmr43PyMq1vx2aSUDXswQrZP2fGLx+W+/eH3Es4kNJNHnSuEU5Lm
 gBowRum26MHgUFoY+eNmObf16j6W8XuQJQe/qQf6y3ABv/M9WQHPXQnJ2CuNlbr+iqNj
 Eqq4RusYygO6YAQ3Q1ITSEtAeBUn4jBt846WfAYwPBKjjnxC7h7CCAqg7Jvlqet8AMNs
 yMxVGcPtu3XC7iNeHjfnQXlG79wmcrPmJCCEm3E4dP3e9VG+4VvJ3kuw9sVOyAkXay34
 IdPQ==
X-Gm-Message-State: APuU4Z875G2kRDOl7ALjw7GWRz6UAAUQOg12EG3bUl/HiX63ESyopluU
 u9LOiDfeQ+grH4mE7YOUX2QVDzPHUpVgVwLdrlf1JHcsOELtXF9gEkeN8t2gvoVEWfpTLvaW6Fq
 lgJwPkQ7ts63l4YuS5fVbdvbxai3jUpE=
X-Gm-Gg: AYBFou0w0q5rR5UpbWo25E9MEC8MW13jY6qTeRhWAXWM4emqJ3O0dLWp8X1UBnokL/L
 X2Mqc5QZ0zLWc2Z43+hRY7BL2c+Cnvk32MJ8yF/olT6gP+a4aMT/mltVtRY66Oo0uB2mT2B6UWl
 C+E3CkpEhkifSEgQ2ut0sienJJp7yqnfsbffaaS87BitueKKfG1yOMorahS6fy7CwT2J1+T/cNx
 wW2w1KahLqToes+Yh9lEOkILQAU1ePlqJPtDf23D/tNj99A7pGd3mUJiFcZb1FTWIMZAYC8x+rm
 yg1kSa6QdGd0TKWFT6J/c1Xf0bcxUhzfwe2PIb6e0Vn3c9hw2QopGZs49XfN/hyHGxKKNk+aXCa
 BkPPUU/6gktwfk207r5SB7C2L/7+gZC2AJMhs
X-Received: by 2002:a05:6808:1a0a:b0:4f7:a3f2:d8b8 with SMTP id
 5614622812f47-5683cc79ccfmr2033934b6e.29.1794319110150; Tue, 10 Nov 2026
 05:58:30 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261109130533.4171508-1-angelo.compagnucci@gmail.com>
 <avKrY-io3kEIaRen@waldemar-brodkorb.de>
In-Reply-To: <avKrY-io3kEIaRen@waldemar-brodkorb.de>
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 10 Nov 2026 14:57:54 +0100
X-Gm-Features: AclHuK8brQnPehq8IXecZoUutP_gNGL3hR5NVnRdWjvXAY1XBdxUVkbDX2bbQ5k
Message-ID: <CA+TH9VngRP4VrbpeaQYim8_FSp6cZD_DizJdNAOfnuckwQKtkA@mail.gmail.com>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org, Quentin Schulz <quentin.schulz@cherry.de>, 
 Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, 
 Peter Seiderer <ps.report@gmx.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 0/2] package/qt5: security bump to version
 5.15.19
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3161372810370015542=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=2.1 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3161372810370015542==
Content-Type: multipart/alternative; boundary="0000000000002c9f11065fec799f"

--0000000000002c9f11065fec799f
Content-Type: text/plain; charset="UTF-8"

Il giorno mar 10 nov 2026 alle ore 06:28 Waldemar Brodkorb <wbx@openadk.org>
ha scritto:

> Hi Angelo, all,
> Angelo Compagnucci wrote,
>
> > This bumps the qt5 packages to Qt 5.15.19, from the kde/5.15 branch of
> > KDE's Qt5 Patch Collection, which is now rebased on it. qt5webengine
> > is bumped in its own patch, as it drops and refreshes some patches of
> > qt5webengine-chromium.
> >
> > This should be the last Qt5 bump: Qt 5.15.19 is the very last Qt 5.15
> > release, and the Qt Company ended its support of Qt 5.15 after 26 May
> > 2025 [1]. KDE keeps its Qt5 Patch Collection only for the open source
> > projects still on Qt 5.15 until they move to Qt 6, and only for very
> > critical fixes [2]. Qt5 users should plan their move to Qt6.
> >
> > FYI: I am working on a series moving the Qt5 users to Qt6 and removing
> > Qt5 from Buildroot. Before sending it, I would like to get feedback on
> > this: would the removal be welcome, and when (for example after the
> > next LTS)?
>
> We are still using QT5, so it would be nice to keep it for the next
> LTS and remove it afterwards.
>

Thanks for the feedback. Not my decision to take, but I suspect that
maintaining an unmaintained big project like that for the next 3 years
doesn't look that appealing to the LTS guys ...


> best regards
>  Waldemar
>


-- 
Profile: http://it.linkedin.com/in/compagnucciangelo

--0000000000002c9f11065fec799f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Il giorno mar 1=
0 nov 2026 alle ore 06:28 Waldemar Brodkorb &lt;<a href=3D"mailto:wbx@opena=
dk.org">wbx@openadk.org</a>&gt; ha scritto:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Hi Angelo, all,<br>
Angelo Compagnucci wrote,<br>
<br>
&gt; This bumps the qt5 packages to Qt 5.15.19, from the kde/5.15 branch of=
<br>
&gt; KDE&#39;s Qt5 Patch Collection, which is now rebased on it. qt5webengi=
ne<br>
&gt; is bumped in its own patch, as it drops and refreshes some patches of<=
br>
&gt; qt5webengine-chromium.<br>
&gt; <br>
&gt; This should be the last Qt5 bump: Qt 5.15.19 is the very last Qt 5.15<=
br>
&gt; release, and the Qt Company ended its support of Qt 5.15 after 26 May<=
br>
&gt; 2025 [1]. KDE keeps its Qt5 Patch Collection only for the open source<=
br>
&gt; projects still on Qt 5.15 until they move to Qt 6, and only for very<b=
r>
&gt; critical fixes [2]. Qt5 users should plan their move to Qt6.<br>
&gt; <br>
&gt; FYI: I am working on a series moving the Qt5 users to Qt6 and removing=
<br>
&gt; Qt5 from Buildroot. Before sending it, I would like to get feedback on=
<br>
&gt; this: would the removal be welcome, and when (for example after the<br=
>
&gt; next LTS)?<br>
<br>
We are still using QT5, so it would be nice to keep it for the next<br>
LTS and remove it afterwards.<br></blockquote><div><br></div><div>Thanks fo=
r the feedback. Not my decision to take, but I suspect that maintaining an =
unmaintained big project like that for the next 3 years doesn&#39;t look th=
at appealing to the LTS guys ...=C2=A0</div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
best regards<br>
=C2=A0Waldemar<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Pr=
ofile: <a href=3D"http://it.linkedin.com/in/compagnucciangelo" target=3D"_b=
lank">http://it.linkedin.com/in/compagnucciangelo</a></div></div>

--0000000000002c9f11065fec799f--

--===============3161372810370015542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3161372810370015542==--
