Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A03BC3A5A7
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 16:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D80B561037;
	Tue,  6 Dec 2022 16:58:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D80B561037
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uoxZoWRHmPm4; Tue,  6 Dec 2022 16:58:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDE4B6102F;
	Tue,  6 Dec 2022 16:58:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDE4B6102F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 694DB1BF5AE
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 16:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51C3C409EA
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 16:58:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51C3C409EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oyjZ-5qIHK3b for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 16:58:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 223A340949
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 223A340949
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 16:58:13 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 j6-20020a4ab1c6000000b004809a59818cso2251993ooo.0
 for <buildroot@buildroot.org>; Tue, 06 Dec 2022 08:58:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eCBc773FZf7VxeVuD7wMczyhGfeTPPHrDA79CvoN6Nw=;
 b=yceqN3QH4IGv4tdV/kHCdsciWV9C5sviWAOj25AiwIbQlMp0q0yhaiWlPCrO/lwakR
 Vd90it8RBuSw07gfjk4QQWUh41qoCPEtamOuEVzKvxvFrPQdsZhn3miBrwFHjnQqrhv2
 Ccwgc+a9TtNDITmRAGkSP1JEKuXJDZP60LLwPXe49DuQb+UZJY39cNeanE2TRGYD05iC
 0UsUh69DLjC7zipu80gWpVMuhFJ6Z4WiAopi2CAnDAQaQOKXcJla9QOjeOvo2Du11xKG
 JpctNUJbLD4/5+xLayG1xMczdD3ke0K5Qi9FytS9+6yUFarq20Zmj3FLM9iteDuFQAmW
 GI2g==
X-Gm-Message-State: ANoB5pkTUxVDOp/MPlEruAxzyf2cKL5tMSB64ixM8wXMt95I+K1ejrKu
 Os3YqKGqq10PGr/78ILPG058z3mN+G9tgfAZ5Cuk3ksHgc+g6HLc
X-Google-Smtp-Source: AA0mqf7ssVg5X6VROct8TKHmMzdQZidNb9EOpTggypXLw7mVUS0sQb1I7ksZsuOBpFSbHkj8Jzq7cjBFg6i+P16ik28=
X-Received: by 2002:a4a:9693:0:b0:4a0:1add:b26f with SMTP id
 s19-20020a4a9693000000b004a01addb26fmr24210620ooi.59.1670345891841; Tue, 06
 Dec 2022 08:58:11 -0800 (PST)
MIME-Version: 1.0
References: <20221102165629.755750-1-jwood+buildroot@starry.com>
 <20221106105124.GP3918838@scaer> <87o7t9i8yy.fsf@dell.be.48ers.dk>
In-Reply-To: <87o7t9i8yy.fsf@dell.be.48ers.dk>
Date: Tue, 6 Dec 2022 11:58:01 -0500
Message-ID: <CANWKTsNrZyn6cytFmfa8oMZw+zLmMNUB9SKJyqVYEsYd5yP+mQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=starry.com; s=google;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eCBc773FZf7VxeVuD7wMczyhGfeTPPHrDA79CvoN6Nw=;
 b=F+MVLQeHHlRGXjOqFXA4IEPAQ1YMA3/Wl9t6yPJUdXyGEZ4rxob6E8DgiX9KAeJotr
 ySGZoWO+ajEEWqPtRXbb56FKVLl8Ye09tc1mH2GPPaySghngKUVupPk2HjX5Aq/TeTtJ
 o8LQW/CadtfzO7JtJLZ+HUnqSnQoN58YbZe4M=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=starry.com header.i=@starry.com
 header.a=rsa-sha256 header.s=google header.b=F+MVLQeH
Subject: Re: [Buildroot] [PATCH 1/1] package/ca-certificates: add support
 for cryptography > 3.0
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
From: Justin Wood via buildroot <buildroot@buildroot.org>
Reply-To: Justin Wood <jwood+buildroot@starry.com>
Content-Type: multipart/mixed; boundary="===============8098441624527951226=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8098441624527951226==
Content-Type: multipart/alternative; boundary="00000000000089286405ef2bb5b3"

--00000000000089286405ef2bb5b3
Content-Type: text/plain; charset="UTF-8"

Just to follow up for this list, this was merged upstream:

https://salsa.debian.org/debian/ca-certificates/-/commit/c7a3136aa0290f09080ff90d2c21d43b70710310

~Justin Wood

On Mon, Nov 14, 2022 at 3:20 PM Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
>  > Justin, All,
>  > On 2022-11-02 12:56 -0400, jwood+buildroot@starry.com spake thusly:
>  >> From: Justin Wood <jwood@starry.com>
>  >>
>  >> This patch was originally submitted upstream at
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1008244
>  >> by Wataru Ashihara <wsh@iij.ad.jp>.  Minor changes by me to account
> for the Buildroot change in 0001-*.patch.
>  >>
>  >> Building ca-certificates with a newer cryptography is breaking without
> this patch, and building buildroots
>  >> `python-cryptography` package first doesn't change the broken behavior.
>
>  > I've reworded the commit log in a more logical manner (explain what
>  > breaks and why, then how we fix it).
>
>  > I also notice that the bug report states that cryptography 3.0 is also
>  > affected, so I tweaked the commit title accordingly.
>
>  >> Signed-off-by: Justin Wood <jwood@starry.com>
>
>  > Applied to master, thanks.
>
> This is patching code we've added ourselves in patch 0001, so perhaps it
> makes sense to invert the order of the patches, merge them or simply
> drop the certdata2pem.py call completely? We don't build
> host-python-cryptography automatically, so it can only happen if the
> recently added optee-os option is selected (or a custom package), and
> they happen to build before ca-certificates.
>
> Committed to 2022.08.x, thanks (we don't have host-python-cryptography
> in 2022.02.x).
>
> --
> Bye, Peter Korsgaard
>

--00000000000089286405ef2bb5b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Just to follow up for this list, this was merged=
 upstream:</div><br><a href=3D"https://salsa.debian.org/debian/ca-certifica=
tes/-/commit/c7a3136aa0290f09080ff90d2c21d43b70710310" target=3D"_blank">ht=
tps://salsa.debian.org/debian/ca-certificates/-/commit/c7a3136aa0290f09080f=
f90d2c21d43b70710310</a><br><br></div>~Justin Wood</div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 14, 2022 at 3=
:20 PM Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com">peter@kor=
sgaard.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">&gt;&gt;&gt;&gt;&gt; &quot;Yann&quot; =3D=3D Yann E MORIN &lt;<a=
 href=3D"mailto:yann.morin.1998@free.fr" target=3D"_blank">yann.morin.1998@=
free.fr</a>&gt; writes:<br>
<br>
=C2=A0&gt; Justin, All,<br>
=C2=A0&gt; On 2022-11-02 12:56 -0400, <a href=3D"mailto:jwood%2Bbuildroot@s=
tarry.com" target=3D"_blank">jwood+buildroot@starry.com</a> spake thusly:<b=
r>
=C2=A0&gt;&gt; From: Justin Wood &lt;<a href=3D"mailto:jwood@starry.com" ta=
rget=3D"_blank">jwood@starry.com</a>&gt;<br>
=C2=A0&gt;&gt; <br>
=C2=A0&gt;&gt; This patch was originally submitted upstream at <a href=3D"h=
ttps://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1008244" rel=3D"noreferr=
er" target=3D"_blank">https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1=
008244</a><br>
=C2=A0&gt;&gt; by Wataru Ashihara &lt;<a href=3D"mailto:wsh@iij.ad.jp" targ=
et=3D"_blank">wsh@iij.ad.jp</a>&gt;.=C2=A0 Minor changes by me to account f=
or the Buildroot change in 0001-*.patch.<br>
=C2=A0&gt;&gt; <br>
=C2=A0&gt;&gt; Building ca-certificates with a newer cryptography is breaki=
ng without this patch, and building buildroots<br>
=C2=A0&gt;&gt; `python-cryptography` package first doesn&#39;t change the b=
roken behavior.<br>
<br>
=C2=A0&gt; I&#39;ve reworded the commit log in a more logical manner (expla=
in what<br>
=C2=A0&gt; breaks and why, then how we fix it).<br>
<br>
=C2=A0&gt; I also notice that the bug report states that cryptography 3.0 i=
s also<br>
=C2=A0&gt; affected, so I tweaked the commit title accordingly.<br>
<br>
=C2=A0&gt;&gt; Signed-off-by: Justin Wood &lt;<a href=3D"mailto:jwood@starr=
y.com" target=3D"_blank">jwood@starry.com</a>&gt;<br>
<br>
=C2=A0&gt; Applied to master, thanks.<br>
<br>
This is patching code we&#39;ve added ourselves in patch 0001, so perhaps i=
t<br>
makes sense to invert the order of the patches, merge them or simply<br>
drop the certdata2pem.py call completely? We don&#39;t build<br>
host-python-cryptography automatically, so it can only happen if the<br>
recently added optee-os option is selected (or a custom package), and<br>
they happen to build before ca-certificates.<br>
<br>
Committed to 2022.08.x, thanks (we don&#39;t have host-python-cryptography<=
br>
in 2022.02.x).<br>
<br>
-- <br>
Bye, Peter Korsgaard<br>
</blockquote></div>

--00000000000089286405ef2bb5b3--

--===============8098441624527951226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8098441624527951226==--
