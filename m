Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE67C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 09:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 082AE40908;
	Tue,  1 Nov 2022 09:19:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 082AE40908
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rtBivVhwdi79; Tue,  1 Nov 2022 09:19:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EFD0408F6;
	Tue,  1 Nov 2022 09:19:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EFD0408F6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C61741BF873
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 09:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE543812E8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 09:19:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE543812E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9fCRyPnSauUH for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 09:19:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EE2880F5D
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5EE2880F5D
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 09:19:48 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id p127so15277381oih.9
 for <buildroot@buildroot.org>; Tue, 01 Nov 2022 02:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gb+Zdsn53F0BlFoDrX+MGyqidbJeGPPJjBD1ca5owHk=;
 b=ipzlV0gkQNInLx3iucc5XEy6mwe3i3dIw5QzQHjBL8ffPAHNPTY4xsxHLqqYYGhuwc
 HyDa/wB0XfY7q+4s4BYx80nZN1M7tXDrXuvpKcFiDixVRUHonaxpNeAxgbMSx7+Xfd7A
 5N5xZMC36k0Zp00UYE3y0JyOhCu1372qekZ4gOYeWiENa2cN4Epyyal4fkYAZQCqDSLe
 Gj5ROfNmBbhrvwoN1cjJytGO0eQiSJ3vw5gntutwogztiC+mWt7CByztnUlkZrVOvDAa
 33g/pXQkyfBrVvUXlJGxCtGR719hC2M2+qdaeV5yZZVDdy1uDV+VhIyoBnDiivQaLftf
 TP+g==
X-Gm-Message-State: ACrzQf17MmVuRAetrVrjPYKMeCha01EKH52mSBnqU55E3lzFWQFIJmT3
 YG5TvBEHHS29xaL9mpfF6DIJ/XbwrP4d586DBBK7Gd6Epm0=
X-Google-Smtp-Source: AMsMyM5gDDgdaWTVI7e8fLVyeSd3/4RhRgCvEwAwSupt9qdP21XZ32i2USESvSVn6fOZ4PmTvk2rzaKcMR5Sduiun24=
X-Received: by 2002:a05:6808:120c:b0:351:6d17:1845 with SMTP id
 a12-20020a056808120c00b003516d171845mr9524194oil.254.1667294387250; Tue, 01
 Nov 2022 02:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221018234617.225947-1-giulio.benetti@benettiengineering.com>
 <20221031132519.4e5ebc69@windsurf> <20221031125405.GC1058960@scaer>
 <1e71c677-05cf-89b1-419f-df8e0f73ae63@benettiengineering.com>
 <20221101083206.GI2992523@scaer>
In-Reply-To: <20221101083206.GI2992523@scaer>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 1 Nov 2022 10:19:35 +0100
Message-ID: <CA+_SqVZMnZvF2-n4HvrUUg1=k-VT4QBZGNAHZpoGM86y37fyuw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Gb+Zdsn53F0BlFoDrX+MGyqidbJeGPPJjBD1ca5owHk=;
 b=hoSHJqOu549R2PlHOuGrhMAnNH62DE1FgNUqgv11z+F19OnCryGzpTdU+Ug1ZY4Gn6
 oHM06dfqLx0AZ4PxZrclWDYmfJsaZE+SE2OBxN2deRJ6zQo0p3yQKRnjLzYx7iP6HlZx
 Yz1pxqPdrNz8AzZftLGV1TyEC95OkGayT4u7I=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=hoSHJqOu
Subject: Re: [Buildroot] [PATCH] package/mono: allow to select which folders
 to install to target
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============1893229528888819826=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1893229528888819826==
Content-Type: multipart/alternative; boundary="000000000000b03cd905ec6539a5"

--000000000000b03cd905ec6539a5
Content-Type: text/plain; charset="UTF-8"

Il mar 1 nov 2022, 09:32 Yann E. MORIN <yann.morin.1998@free.fr> ha scritto:

> Giulio, All,
>
> On 2022-11-01 03:27 +0100, Giulio Benetti spake thusly:
> > On 31/10/22 13:54, Yann E. MORIN wrote:
> > >On 2022-10-31 13:25 +0100, Thomas Petazzoni via buildroot spake thusly:
> > >>On Wed, 19 Oct 2022 01:46:17 +0200
> > >>Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> > >>>At the moment all APIs folders are copied to target increasing the
> size of
> > >>>rootfs of ~190MB. Allow to select which API folders we want to copy to
> > >>>target to shrink rootfs down.
> > >>>
> > >>>Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > >>Practically speaking, could you describe which folders are needed in a
> > >>typical scenario you've had?
> > >Yes, can you provide a rationale for when only a subset of APIs is
> > >needed?
> > I've answered on previous e-mail. I've realized only now that I could
> > answer to your e-mail for both.
>
> Hey, what you answered Thomas is not a rationale, it is an example. ;-)
> A rationale is "an explanation of controlling principles of opinion,
> belief, practice, or phenomena", or "an underlying reason". [0]
>
> As a rationale, I would have expected something that explains the reason
> why there are so many directories, and so why, under some circumstances,
> we can get rid of them (or not). It needs not be too long, but just
> provide an overview. For example, here is a totally made up blurb:
>
>     mono provides support for a lot of legacy APIs for backward
>     compatibility for existing applications, way back from the first
>     stable API, 2.0 and up to the current version. The set of APIs are
>     split in two categories: version-based APIs, and the rest (gac, the
>     FooBar set of common Baz; monodoc, which renders documentation while
>     riding a unicycle...).
>
>     For a custom application, the set of required versioned APIs is
>     limited; most often only the latest or the very few latest are
>     needed. Only gac is always required, and monodoc is never used on
>     the target as we never render the documentation there.
>
> [0] https://www.merriam-webster.com/dictionary/rationale
>
> [--SNIP--]
> > >>Should we instead have a single string option
> > >>BR2_PACKAGE_MONO_INSTALL_LIB_DIRS, which is empty by default. When
> > >>empty, it means all folders are installed. Otherwise, only the
> > >>specified folders are installed.
> > >Agreed. I expect that having no API level installed would yield a
> > >non-working system, so:
> > >     config BR2_PACKAGE_MONO_API_VERSIONS
> > >         string "API versions to install"
> > >         help
> > >           Keep empty to install all.
> > Ok, I go with that then!
>
> ACK.
>

My two cents. Historically, the mono configure was offering some options to
enable only some versions of the API which was lately removed
So, removing older compatibility API folders should be perfectly fine. We
cannot remove the Global Assembly Cache (GAC).

For the rest, it would be nice if Giulio could do some testing (I can try
it too) to understand at what extent we can remove any other folder.


> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000b03cd905ec6539a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mar 1 nov 2022, 09:32 Yann E. MORIN &lt;<a href=3D"=
mailto:yann.morin.1998@free.fr">yann.morin.1998@free.fr</a>&gt; ha scritto:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Giulio, All,<br>
<br>
On 2022-11-01 03:27 +0100, Giulio Benetti spake thusly:<br>
&gt; On 31/10/22 13:54, Yann E. MORIN wrote:<br>
&gt; &gt;On 2022-10-31 13:25 +0100, Thomas Petazzoni via buildroot spake th=
usly:<br>
&gt; &gt;&gt;On Wed, 19 Oct 2022 01:46:17 +0200<br>
&gt; &gt;&gt;Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettieng=
ineering.com" target=3D"_blank" rel=3D"noreferrer">giulio.benetti@benettien=
gineering.com</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;At the moment all APIs folders are copied to target increa=
sing the size of<br>
&gt; &gt;&gt;&gt;rootfs of ~190MB. Allow to select which API folders we wan=
t to copy to<br>
&gt; &gt;&gt;&gt;target to shrink rootfs down.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;Signed-off-by: Giulio Benetti &lt;<a href=3D"mailto:giulio=
.benetti@benettiengineering.com" target=3D"_blank" rel=3D"noreferrer">giuli=
o.benetti@benettiengineering.com</a>&gt;<br>
&gt; &gt;&gt;Practically speaking, could you describe which folders are nee=
ded in a<br>
&gt; &gt;&gt;typical scenario you&#39;ve had?<br>
&gt; &gt;Yes, can you provide a rationale for when only a subset of APIs is=
<br>
&gt; &gt;needed?<br>
&gt; I&#39;ve answered on previous e-mail. I&#39;ve realized only now that =
I could<br>
&gt; answer to your e-mail for both.<br>
<br>
Hey, what you answered Thomas is not a rationale, it is an example. ;-)<br>
A rationale is &quot;an explanation of controlling principles of opinion,<b=
r>
belief, practice, or phenomena&quot;, or &quot;an underlying reason&quot;. =
[0]<br>
<br>
As a rationale, I would have expected something that explains the reason<br=
>
why there are so many directories, and so why, under some circumstances,<br=
>
we can get rid of them (or not). It needs not be too long, but just<br>
provide an overview. For example, here is a totally made up blurb:<br>
<br>
=C2=A0 =C2=A0 mono provides support for a lot of legacy APIs for backward<b=
r>
=C2=A0 =C2=A0 compatibility for existing applications, way back from the fi=
rst<br>
=C2=A0 =C2=A0 stable API, 2.0 and up to the current version. The set of API=
s are<br>
=C2=A0 =C2=A0 split in two categories: version-based APIs, and the rest (ga=
c, the<br>
=C2=A0 =C2=A0 FooBar set of common Baz; monodoc, which renders documentatio=
n while<br>
=C2=A0 =C2=A0 riding a unicycle...).<br>
<br>
=C2=A0 =C2=A0 For a custom application, the set of required versioned APIs =
is<br>
=C2=A0 =C2=A0 limited; most often only the latest or the very few latest ar=
e<br>
=C2=A0 =C2=A0 needed. Only gac is always required, and monodoc is never use=
d on<br>
=C2=A0 =C2=A0 the target as we never render the documentation there.<br>
<br>
[0] <a href=3D"https://www.merriam-webster.com/dictionary/rationale" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://www.merriam-webster.com/d=
ictionary/rationale</a><br>
<br>
[--SNIP--]<br>
&gt; &gt;&gt;Should we instead have a single string option<br>
&gt; &gt;&gt;BR2_PACKAGE_MONO_INSTALL_LIB_DIRS, which is empty by default. =
When<br>
&gt; &gt;&gt;empty, it means all folders are installed. Otherwise, only the=
<br>
&gt; &gt;&gt;specified folders are installed.<br>
&gt; &gt;Agreed. I expect that having no API level installed would yield a<=
br>
&gt; &gt;non-working system, so:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0config BR2_PACKAGE_MONO_API_VERSIONS<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0string &quot;API versions to ins=
tall&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Keep empty to install all=
.<br>
&gt; Ok, I go with that then!<br>
<br>
ACK.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"au=
to">My two cents. Historically, the mono configure was offering some option=
s to enable only some versions of the API which was lately removed=C2=A0</d=
iv><div dir=3D"auto">So, removing older compatibility API folders should be=
 perfectly fine. We cannot remove the Global Assembly Cache (GAC).</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">For the rest, it would be nice i=
f Giulio could do some testing (I can try it too) to understand at what ext=
ent we can remove any other folder.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=
=A0 =C2=A0 |=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank" rel=3D"norefer=
rer">buildroot@buildroot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman=
/listinfo/buildroot</a><br>
</blockquote></div></div></div>

--000000000000b03cd905ec6539a5--

--===============1893229528888819826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1893229528888819826==--
