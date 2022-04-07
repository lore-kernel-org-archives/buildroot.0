Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC94C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Apr 2022 00:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F29A40BB3;
	Thu,  7 Apr 2022 00:36:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yWEqHFdGcKSg; Thu,  7 Apr 2022 00:36:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CA19408E6;
	Thu,  7 Apr 2022 00:36:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4E5F1C1135
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 00:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2D8E408E6
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 00:36:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JGbJAG1S2LMt for <buildroot@lists.busybox.net>;
 Thu,  7 Apr 2022 00:36:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D59D1403A7
 for <buildroot@buildroot.org>; Thu,  7 Apr 2022 00:36:38 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2eb888cf7e7so44945417b3.13
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 17:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GzREbOfAK3ISFmopNVaJoakexBdgM4CdrA9RULLJyYo=;
 b=Eiu/773Uy6dXy3GroNm9x9GRv4NBbucTWSYx2tkktFr9SfN89u61FG/iS/5oimdxHp
 R1UST6GSMEUbig4hWEdgnht5a9M6qCnrxkDBLMJpQkeAv3P6xVeIBgOP5wXdFSygMDlS
 +Ah+OpDMzHQCgXfFS3rGwFrNkz1Mgg69hLiIUXB/r375WmR8dT21INj/64NkBOHvB+3i
 hhkXN9WKlOKICf4EEeGHLNTMIzCOq9Q1Z63GjD9LhZqddS5NZ8ua3/r6kuT3N14NkDM8
 CJ98ToP54qac0w0Hb+H22tKq0wGktbUH+Uz/ptQr9pUdOTx8Ah9p8zakxQo3bVuZb8Vv
 JCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GzREbOfAK3ISFmopNVaJoakexBdgM4CdrA9RULLJyYo=;
 b=pCMwIxooSaN/TUvwZtz3MdWW5FW4PuawrDuN60WfRspdn8t8ppIxCBdBRCmjMIY0Eq
 6+QHVi/AXisbOF/ths6nPWdvjZnmoFirZK8bHmEPPnNGJx116sW2ZJwdDgeOkgJ7YRkY
 C/ONf7ubeEgYXuvCsHXGGhcM1ALMGSoK0TFS+Dufv1TqfmmFYj5nE83bL1aEDhhNqnNv
 2jMEpSUtHqIqSrWW1PLQnul32FgIi1qMqv64LBi02YQRYji+dG6lLnm5CpNp/q4Cqy5x
 k/WQQkI925dBRflfBl7Rxev3cMTASc6fm6EQWgyZVIDX/FX0O7yi1mrNjiYakP2/DBCz
 uy1g==
X-Gm-Message-State: AOAM532ujN+gZDVauSvNCA6yhoC/z/OjVDXX8Cocn6zC9NeN9Z7gx9oO
 p0rX6Es5YaEk/uzPV9dHVOHjdyHTljKeI6sIx6TeKYNK
X-Google-Smtp-Source: ABdhPJwuCQ16sLHw8oCy7mbuQgH6zbh26Tvy9YTABAG9piU1Tl1b+nPVtLRB/D95gsszxfmUfRKls6nUDAzRWK+STKs=
X-Received: by 2002:a81:15d8:0:b0:2e9:e838:bf22 with SMTP id
 207-20020a8115d8000000b002e9e838bf22mr9098365ywv.157.1649291797885; Wed, 06
 Apr 2022 17:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAM70yxCknY7qH9uiqNpDhynxAdsjw1zM9AH=UaiAzET+f7treA@mail.gmail.com>
 <a4724812-eafb-0ffc-b14d-df9ed04aac80@mind.be>
 <CAM70yxAu66JWhogiabz7fXqz4XpFGXmiOaahX5V3+GKQG_eUfw@mail.gmail.com>
 <CADvTj4oT2COBMmeg3jONzVX4_wXxKFLEe9Nh3AakSBbon5RQjQ@mail.gmail.com>
 <CAM70yxDPCUobSnoq7XhH=k7Q8B5x9j2=DSWS9a-VN3iX6zg5pA@mail.gmail.com>
 <CADvTj4p_qDCOB5PysR+rNKpp9Fo4PCCn9n4AzpJ4mRkZnqtk_g@mail.gmail.com>
 <CAM70yxDMKEOTKfesTPp02oakyCCB4zM+BmigQ0fqMoaSfeHjnA@mail.gmail.com>
 <CADvTj4rvFLx28rNUEy=c5kgONHTiQRbBbyM51ehC6GUp8bmDhg@mail.gmail.com>
In-Reply-To: <CADvTj4rvFLx28rNUEy=c5kgONHTiQRbBbyM51ehC6GUp8bmDhg@mail.gmail.com>
From: Emile Cormier <emile.cormier.jr@gmail.com>
Date: Wed, 6 Apr 2022 21:36:26 -0300
Message-ID: <CAM70yxAULOdSF03JY+3MgSjy9HQsF81h1SYJ31w0sUk5HqhS6A@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [Feature Request] Host cmake built with the
 --system-curl option
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============8787020620133181933=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8787020620133181933==
Content-Type: multipart/alternative; boundary="000000000000be794405dc05aba4"

--000000000000be794405dc05aba4
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 6, 2022 at 8:11 PM James Hilliard <james.hilliard1@gmail.com>
wrote:

> You might still be able to share it for desktop builds for development
> by creating
> packages and then overriding them using the OVERRIDE_SRCDIR feature:
>
> https://buildroot.org/downloads/manual/manual.html#_using_buildroot_during_development
>

We use Qt Creator as an IDE, and it integrates very well with CMake-based
projects, especially for debugging. I'm afraid that introducing buildroot
into the mix would wreck our productivity for development.

The way I have it set up now with buildroot being exclusively used to
produce "release" images for our embedded device is working well. Before
buildroot, release images were assembled manually using a Debian ARM image
provided by the board vendor, and then tailored to suit our needs. It goes
without saying this was very tedious and error-prone. Using buildroot to
generate device images is way easier and more consistent, plus we can
tailor the operating system exactly as we need it.

It turns out that the problem with buildroot's cmake not supporting https
downloads is a minor one that I can solve it two ways:
1. Pre-download the tarballs using wget via build scripts
2. Install a more recent cmake on the build system that meets buildroot's
requirements

If this feature request is declined (as perhaps it should be), then it's no
big deal, really.

Thanks again for the advice.

--000000000000be794405dc05aba4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Apr 6, 2022 at 8:11 PM James Hilliard &lt;<a href=3D"mailto:=
james.hilliard1@gmail.com">james.hilliard1@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">You might still be able=
 to share it for desktop builds for development<br>
by creating<br>
packages and then overriding them using the OVERRIDE_SRCDIR feature:<br>
<a href=3D"https://buildroot.org/downloads/manual/manual.html#_using_buildr=
oot_during_development" rel=3D"noreferrer" target=3D"_blank">https://buildr=
oot.org/downloads/manual/manual.html#_using_buildroot_during_development</a=
><br></blockquote><div><br></div><div>We use Qt Creator as an IDE, and it i=
ntegrates very well with CMake-based projects, especially for debugging. I&=
#39;m afraid that introducing buildroot into the mix would wreck our produc=
tivity for development.</div><div><br></div><div>The way I have it set up n=
ow with buildroot being exclusively used to produce &quot;release&quot; ima=
ges for our embedded device is working well. Before buildroot, release imag=
es were assembled manually using a Debian ARM image provided by the board v=
endor, and then tailored to suit our needs. It goes without saying this was=
 very tedious and error-prone. Using buildroot to generate device images is=
 way easier and more consistent, plus we can tailor the operating system ex=
actly as we need it.</div><div><br></div><div>It turns out that the problem=
 with buildroot&#39;s cmake not supporting https downloads is a minor one t=
hat I can solve it two ways:</div><div>1. Pre-download the tarballs using w=
get via build scripts<br></div><div>2. Install a more recent cmake on the b=
uild system that meets buildroot&#39;s requirements</div><div><br></div><di=
v>If this feature request is declined (as perhaps it should be), then it&#3=
9;s no big deal, really.</div><div><br></div><div>Thanks again for the advi=
ce.<br></div></div></div>

--000000000000be794405dc05aba4--

--===============8787020620133181933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8787020620133181933==--
