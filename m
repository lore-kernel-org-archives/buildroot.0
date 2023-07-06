Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354BAEB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 21:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB53260A8A;
	Thu,  6 Jul 2023 21:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB53260A8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s8cGGjTqmQxj; Thu,  6 Jul 2023 21:08:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5C09606A0;
	Thu,  6 Jul 2023 21:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5C09606A0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D0E381BF379
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 21:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5B59417E6
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 21:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5B59417E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Jyh4CCzl7Cp for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 21:08:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47986417DF
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47986417DF
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 21:08:45 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3090d3e9c92so1229153f8f.2
 for <buildroot@buildroot.org>; Thu, 06 Jul 2023 14:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688677723; x=1691269723;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W0AP5BORuBBN1TYMPl+cZQkaD7eMTxi6KdElZEE6QbM=;
 b=FLLlyaoyVHYPWK8qiPxlYd/sjMi0Zit8dWeRs0HSRP5lNi2PY1NdP0eiRctih+rH3u
 iKggA6oGSeTw2tZB1SFnFXpFQwXFtPfFZcfSmEojDf/2ST13dqgnPga/bvvMDvmj7rhj
 DF2P/7R6pqyQJM0dQdE2TWO5cUP5eeXeYvazFPLaNv3k6SsHEgn6xTO1Z9c+TVYKX7Md
 lA1tBjJ/lzFc64xgfUX3ttgdRGqQzs/GEhgiork/cpvfuidoTBmun/OZS2tfyFUKLWfS
 cEeQU9B/boVoy4cbNfNscCcnjuRPp1Xyf5N6lY4k8fgi10apvUvnHYGf4VW8rnB5g4Iz
 bCyA==
X-Gm-Message-State: ABy/qLalgSnwLJv774qnp1NZwBY3a5RvOkm/pu+wzk1HaXNM0DPqTfVS
 SdBHcSkBaYlY1c7kUmaRgKKDLEWeaiYGd/x3/lG5XdMzMQQvn8lfhTbLzg==
X-Google-Smtp-Source: APBJJlEEfe2o+DyJVk2vPSzUWngC0w6UwkFxhhuruawmlzUGe+gplbk6aLk0581fA8sXzg6IODpFpiq4NVp/EsWRZ7A=
X-Received: by 2002:adf:e3c9:0:b0:311:1568:1a27 with SMTP id
 k9-20020adfe3c9000000b0031115681a27mr3358092wrm.58.1688677722957; Thu, 06 Jul
 2023 14:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAOf5uwmYNk+28CEYS-_tcGWVsw7-pWYCY2YCJXQzuijep5A5eg@mail.gmail.com>
 <eb58a86c-4792-fc4c-cdfa-42487c3347c4@mind.be>
In-Reply-To: <eb58a86c-4792-fc4c-cdfa-42487c3347c4@mind.be>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Thu, 6 Jul 2023 23:08:31 +0200
Message-ID: <CAOf5uw=wGxZAF6JA8wRdvv7Bhgi_HVEOnXrk2TRbmgkBzCPWUg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1688677723; x=1691269723;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W0AP5BORuBBN1TYMPl+cZQkaD7eMTxi6KdElZEE6QbM=;
 b=GDfOzRouY8fwJj2fT+m7p+N0DU8rLGkYcZ1vC8tDl43g/wFsI1axasAjn1q60J4LSC
 Zye+MlVsVL83XjvSafCIXK7iuj/xGD9OGSkks820OQdJZJZ2agN4DnsveqNMAapXbqRj
 WG4CpXeyGJPdzm5HhQM7wdLTVbCuJf8DWLOsU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=GDfOzRou
Subject: Re: [Buildroot] external toolchain license collection
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============2137176692625164567=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2137176692625164567==
Content-Type: multipart/alternative; boundary="000000000000d13d9f05ffd7ebb7"

--000000000000d13d9f05ffd7ebb7
Content-Type: text/plain; charset="UTF-8"

Hi

Il gio 6 lug 2023, 21:18 Arnout Vandecappelle <arnout@mind.be> ha scritto:

>
>
> On 05/07/2023 12:08, Michael Nazzareno Trimarchi wrote:
> > Hi all
> >
> > Is there a way to collect the license of an external toolchain and put
> > it in the buildroot bundle?
> > For instance we have some packages like libuclic and other libraries
> > that are put in the target but even those licenses should appear. Is
> > something I miss?
>
>   For the existing predefined external toolchains we indeed don't have any
> license information. For a custom external toolchain that you specify
> through
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_* there's no way to specify it either.
> However, if
> you create your own predefined toolchain in a BR2_EXTERNAL, you can set
> its
> _LICENSE and _LICENSE_FILES and that should work. Make sure you also set
> _ACTUAL_SOURCE_TARBALL. Note that the license files are fetched from the
> _SOURCE, not the _ACTUAL_SOURCE_TARBALL.
>
>   It would be good if we would add _LICENSE and _LICENSE_FILES for the
> predefined toolchains.
>

Read it and should work, the only problem I can see to be fully compliant
is to delivery build and installation script. I think this can be done only
building toolchain from buildroot. I don't really how this is handle
legally when people use toolchain built by others


Michael

>
>   Regards,
>   Arnout
>

--000000000000d13d9f05ffd7ebb7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi<br><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">Il gio 6 lug 2023, 21:18 Arnout Vandecappelle &lt;<a=
 href=3D"mailto:arnout@mind.be">arnout@mind.be</a>&gt; ha scritto:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><br>
<br>
On 05/07/2023 12:08, Michael Nazzareno Trimarchi wrote:<br>
&gt; Hi all<br>
&gt; <br>
&gt; Is there a way to collect the license of an external toolchain and put=
<br>
&gt; it in the buildroot bundle?<br>
&gt; For instance we have some packages like libuclic and other libraries<b=
r>
&gt; that are put in the target but even those licenses should appear. Is<b=
r>
&gt; something I miss?<br>
<br>
=C2=A0 For the existing predefined external toolchains we indeed don&#39;t =
have any <br>
license information. For a custom external toolchain that you specify throu=
gh <br>
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_* there&#39;s no way to specify it either. Ho=
wever, if <br>
you create your own predefined toolchain in a BR2_EXTERNAL, you can set its=
 <br>
_LICENSE and _LICENSE_FILES and that should work. Make sure you also set <b=
r>
_ACTUAL_SOURCE_TARBALL. Note that the license files are fetched from the <b=
r>
_SOURCE, not the _ACTUAL_SOURCE_TARBALL.<br>
<br>
=C2=A0 It would be good if we would add _LICENSE and _LICENSE_FILES for the=
 <br>
predefined toolchains.<br></blockquote></div></div><div dir=3D"auto"><br></=
div><div dir=3D"auto">Read it and should work, the only problem I can see t=
o be fully compliant is to delivery build and installation script. I think =
this can be done only building toolchain from buildroot. I don&#39;t really=
 how this is handle legally when people use toolchain built by others</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">M=
ichael=C2=A0</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
</blockquote></div></div></div>

--000000000000d13d9f05ffd7ebb7--

--===============2137176692625164567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2137176692625164567==--
