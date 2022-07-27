Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06726C19F29
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 19:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F986405B4;
	Wed, 27 Jul 2022 19:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F986405B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LiyPvXyD9r3X; Wed, 27 Jul 2022 19:41:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8149D40391;
	Wed, 27 Jul 2022 19:41:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8149D40391
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 84D311BF3C6
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 19:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F19C82779
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 19:41:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F19C82779
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vWfvEBap3H4V for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 19:41:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C25B8267C
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C25B8267C
 for <buildroot@busybox.net>; Wed, 27 Jul 2022 19:41:17 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id p5so11741525edi.12
 for <buildroot@busybox.net>; Wed, 27 Jul 2022 12:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=clLNvUxPEJqVrA/mRuZ65Tb1pJPKeC8NIJkE0VJrB08=;
 b=b1/e20eKmsuqYlTS9u4uEdkbtHXwoPUTIDPlvLEDEIP3H1Ki/ko0ayk6Ps2R7f7Ea+
 6hEBywE1Oq5qzko8sBuBr24rgOsVaL0ZSH8cuGTi560VZU4fmfuOC+C+VzSCt65MMwZX
 cmFBqqnettWpmrNlnAEg1oxEynheHC153aeC0JMORESXJyUSS+tEsMlOYcRqniJ78k7z
 MlDJnwCG37XR8OKY9yCgusUtA/dDztQ2vLiHMBIINKnTKXvTh1gdejz5imceVFg370jM
 CR1SgTVRUOZLn+g7sDv4vp/HW/RYlLYfCv7TJFM99CK5mrCLW0Hnx0qi8QtsKXMIyFZf
 H92A==
X-Gm-Message-State: AJIora9TIfhWRSu6vjCrNgBya2F82pbk4sy5OqeR+IoTOwav8s0/ghVe
 RrDC2jxN3maS9s4Nmgk6qaQaYUkjzN5eKW0qGzo=
X-Google-Smtp-Source: AGRyM1tsSgaZxC4ja30R9Bw8qXlSq7OKyx7eMwVMqQfUhSRL++7iUVPMYjW/jvKBqeDEQ8uU4GxvR6KykrnDLnaVH28=
X-Received: by 2002:a05:6402:3907:b0:431:6776:64e7 with SMTP id
 fe7-20020a056402390700b00431677664e7mr24264561edb.0.1658950875377; Wed, 27
 Jul 2022 12:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220219181554.32204-1-guillaume.bressaix@gmail.com>
 <20220727082502.17cc05e2@windsurf>
In-Reply-To: <20220727082502.17cc05e2@windsurf>
From: Guillaume Bres <guillaume.bressaix@gmail.com>
Date: Wed, 27 Jul 2022 21:40:49 +0200
Message-ID: <CAJe0E3fFS=bMkKi5bU91RT-W3HVPSrWMmJiD1KJ1V8hjTiEcZA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=clLNvUxPEJqVrA/mRuZ65Tb1pJPKeC8NIJkE0VJrB08=;
 b=eUW3pvz18zZu76OGnMcaXi07RTP3uKGqL57WTUQOtS777U8Jk52q6V0W7PQGoPUQxN
 P7ud1Dnx1ODM3wbLOTHh6PcQ4BuwDisY6FqmfxNfCZlSehnYf2C7m1ol7DLNXDapONl2
 we7ow/61WD+VYuR4GqIbewQOqy4LECCYqQaWWMPKav7AhKv9TwXpbrvSM3Od4Z+f4HCg
 IhbPUeFjpLYb2CfWylEBg+Tb7sUXlKaIxgEYIekDmsViJAGTR0dD6StjkzimD0t6Qi65
 WmSB9lUA6TLnnlWMBqIcEs/nbNRlPrZ1tMrjiwGOXhAW0scm/wP5eYsvXs+In2xVNM02
 Gu2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eUW3pvz1
Subject: Re: [Buildroot] [PATCH] package/python-joblib: new host-only package
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
Cc: buildroot@busybox.net
Content-Type: multipart/mixed; boundary="===============0385216243114824755=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0385216243114824755==
Content-Type: multipart/alternative; boundary="000000000000a0766805e4ce994a"

--000000000000a0766805e4ce994a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

I did not propose sklearn along these patches because it
requires python-scipy to be merged first.
I just resubmitted an updated version of the scipy serie
https://patchwork.ozlabs.org/project/buildroot/patch/20220727192948.18653-4=
-guillaume.bressaix@gmail.com/

btw, thanks for merging the new NTP daemon "ntpsec" ! :)

Guillaume W. Bres
Software engineer
<guillaume.bressaix@gmail.com>


Le mer. 27 juil. 2022 =C3=A0 08:25, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a =C3=A9crit :

> Hello Guillaume,
>
> On Sat, 19 Feb 2022 19:15:54 +0100
> "Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:
>
> > Joblib is a set of tools to provide lightweight pipelining in Python
> >
> > Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
>
> Thanks a lot for this patch. It looks good. However, could you send it
> in a patch series that includes python-scikitlearn? Indeed, we don't
> really like to have orphan host packages in Buildroot, i.e host
> packages that are not used by any other package visible in menuconfig.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000a0766805e4ce994a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Thomas,<br><br>I did not propose sklearn along these=
 patches because it requires=C2=A0python-scipy to be merged first.<br>I jus=
t resubmitted an updated version of the scipy serie<br><a href=3D"https://p=
atchwork.ozlabs.org/project/buildroot/patch/20220727192948.18653-4-guillaum=
e.bressaix@gmail.com/" target=3D"_blank">https://patchwork.ozlabs.org/proje=
ct/buildroot/patch/20220727192948.18653-4-guillaume.bressaix@gmail.com/</a>=
<br><br>btw, thanks for merging the new NTP daemon &quot;ntpsec&quot; ! :)<=
br><br clear=3D"all"><div><div dir=3D"ltr" data-smartmail=3D"gmail_signatur=
e"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div=
><div><div><font face=3D"arial,helvetica,sans-serif">Guillaume W. Bres<br><=
/font></div><font face=3D"arial,helvetica,sans-serif">Software engineer</fo=
nt><br></div><font face=3D"arial,helvetica,sans-serif"></font></div><font f=
ace=3D"arial,helvetica,sans-serif">&lt;<a href=3D"mailto:guillaume.bressaix=
@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;<br></fon=
t></div></div></div></div></div></div><br></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 27 juil. 2022 =C3=A0=
=C2=A008:25, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootli=
n.com" target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Gu=
illaume,<br>
<br>
On Sat, 19 Feb 2022 19:15:54 +0100<br>
&quot;Guillaume W. Bres&quot; &lt;<a href=3D"mailto:guillaume.bressaix@gmai=
l.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Joblib is a set of tools to provide lightweight pipelining in Python<b=
r>
&gt; <br>
&gt; Signed-off-by: Guillaume W. Bres &lt;<a href=3D"mailto:guillaume.bress=
aix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;<br>
<br>
Thanks a lot for this patch. It looks good. However, could you send it<br>
in a patch series that includes python-scikitlearn? Indeed, we don&#39;t<br=
>
really like to have orphan host packages in Buildroot, i.e host<br>
packages that are not used by any other package visible in menuconfig.<br>
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000a0766805e4ce994a--

--===============0385216243114824755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0385216243114824755==--
