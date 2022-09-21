Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA43DECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53D1082EF1;
	Wed, 21 Sep 2022 20:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53D1082EF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HU0SYDIMejbR; Wed, 21 Sep 2022 20:41:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45370812EE;
	Wed, 21 Sep 2022 20:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45370812EE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F24C51BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAABF61055
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:41:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAABF61055
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z_T0j7xaSrpQ for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:41:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FA3D60FC0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FA3D60FC0
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:41:16 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id a2so11214343lfb.6
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 13:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=7vtlawsA7egIlvO1y44X32BRJ3gyxJ7OkhUx96CDu8Q=;
 b=YQa2q9VUsM7GhjFR66aPIEOiziAVEfLN6pkjhJxzeQTSpO3bchz1UQTkVykHsHCVMJ
 kORKlZeaPX4mA88qXUOd/hwgQrl/AZQTk0s5eHx33DdfV820RuW0s8XcIrhDtJlf2CRI
 Nj2r3ZDTcY790Cn3le1zVGi9mjVAG2xcrm0A+0Hf2LLvRILFaYnTsTuTPGbJUBVrmCK1
 P+R5OvsZzSTRTUbF9jDmm3xqBHGR1ilD8Gjd1W/98S6jMiInl+G8molg66332aRb8oNU
 ktOk4WX94OS/EYqJ4+O2HKeob6Xs84Au4UJWzE+SEvCnZLilaIeA/RWWDDoBl9ayLavT
 OSlQ==
X-Gm-Message-State: ACrzQf1ijVmfpFVtS9/XDasLcrcwEUE5lJwEY0Cgafbza+wCO0Ic94+K
 NJpy5+5cf6s7KXlO6EcgL5sZDW+crls+JWFUQIo=
X-Google-Smtp-Source: AMsMyM7vK/clgIXWQVAakbXmRGW2FLGPWUHLlWe4cZf9P0SOiucdcjEKrHGBY/Ez2uI+zlOSYFVU5HXDYuUM9+2biOE=
X-Received: by 2002:a05:6512:3b07:b0:49f:4443:d047 with SMTP id
 f7-20020a0565123b0700b0049f4443d047mr10277628lfv.63.1663792874003; Wed, 21
 Sep 2022 13:41:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220812101718.47491-1-fontaine.fabrice@gmail.com>
 <20220814123748.167ebb02@windsurf> <20220820112842.7bcd12f2@windsurf>
 <CAFSsvmq9vNbvrORfhtv8HvCtq20xrtZg9a4Autt2XDNGamUKkA@mail.gmail.com>
In-Reply-To: <CAFSsvmq9vNbvrORfhtv8HvCtq20xrtZg9a4Autt2XDNGamUKkA@mail.gmail.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 21 Sep 2022 22:41:02 +0200
Message-ID: <CAPi7W81=6Qsv9rSxhMNNEfACR_kP0wAjvhoqxMtnnYoxAkbR5Q@mail.gmail.com>
To: Adam Duskett <aduskett@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=7vtlawsA7egIlvO1y44X32BRJ3gyxJ7OkhUx96CDu8Q=;
 b=j0ocJm50NADekm1SR0SMwoHktypV2g7irAAMoE4ThB3BY9OOffzyX/vYe9xjd77XFs
 LffjVfhSB+BKxrXWAmvj/tGuEOnAsIdiJlkq9Ap7zWrvAcH43coY0d3gUX8cgA7adx5s
 KRsXk+ZEYyujlB4SIKtPBha+Ovy75cYl/PV02ES5psP7boFHrnIvliE1lyvddtmUiY+m
 9vsI96xYqKgbH3IhO0c3gJuzsGFeOJt18Fz/5d/XQlCf5buA74DckvnceSQiog+w5nEi
 LLLRKRnXGvcBAT2jzfq2jklD0qe9qUNHp6lj1Yhu8MPbHHPLg1QuWnxFmBHTWFoOH9x/
 DMeg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=j0ocJm50
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/poppler: fix introspection build
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============0272657816541859667=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0272657816541859667==
Content-Type: multipart/alternative; boundary="0000000000003c237705e935f798"

--0000000000003c237705e935f798
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Adam,

Bumping poppler will not been enough to fix the build failure.
--includedir=3D$(STAGING_DIR)/usr/share/gir-1.0 will also have to be passed
in -DINTROSPECTION_COMPILER_ARGS or do you think that g-ir-scanner wrapper
must handle this as suggested by Thomas above?

Best Regards,

Fabrice

Le mer. 21 sept. 2022 =C3=A0 19:38, Adam Duskett <aduskett@gmail.com> a =C3=
=A9crit :

> Hello;
>
> The above patch (and the existing patch currently in package/poppler)
> are both in the latest version of poppler, so this is probably safe to
> apply.
> However; it may be more advantageous to instead simply bump the
> poppler package instead of applying more patches.
>
> Thoughts?
>
> Adam
>
> On Sat, Aug 20, 2022 at 2:28 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello Fabrice,
> >
> > Do you have some feedback? Or perhaps Adam?
> >
> > Thanks!
> >
> > Thomas
> >
> > On Sun, 14 Aug 2022 12:37:48 +0200
> > Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:
> >
> > > Hello Fabrice,
> > >
> > > +Adam Duskett for GOI expertise.
> > >
> > > On Fri, 12 Aug 2022 12:17:18 +0200
> > > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> > >
> > > > diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.m=
k
> > > > index b54262e7c4..db6da25d39 100644
> > > > --- a/package/poppler/poppler.mk
> > > > +++ b/package/poppler/poppler.mk
> > > > @@ -47,7 +47,8 @@ POPPLER_DEPENDENCIES +=3D gobject-introspection
> > > >  POPPLER_CONF_OPTS +=3D \
> > > >     -DENABLE_GOBJECT_INTROSPECTION=3DON \
> > > >     -DINTROSPECTION_SCANNER=3D$(STAGING_DIR)/usr/bin/g-ir-scanner \
> > > > -   -DINTROSPECTION_COMPILER=3D$(STAGING_DIR)/usr/bin/g-ir-compiler
> > > > +   -DINTROSPECTION_COMPILER=3D$(STAGING_DIR)/usr/bin/g-ir-compiler=
 \
> > > > +
>  -DINTROSPECTION_COMPILER_ARGS=3D"--includedir=3D$(STAGING_DIR)/usr/share=
/gir-1.0"
> > > >  else
> > > >  POPPLER_CONF_OPTS +=3D -DENABLE_GOBJECT_INTROSPECTION=3DOFF
> > > >  endif
> > >
> > > I am really not familiar with all the gobject-introspection stuff, bu=
t
> > > I'm wondering if this is the right solution for this problem.
> > >
> > > In package/gobject-introspection/, I can see that we create and insta=
ll
> > > a g-ir-scanner wrapper that passes --add-include-path=3D"$(dirname
> > > "$0")"/../share/gir-1.0.
> > >
> > > In this same directory, we also have a g-ir-compiler wrapper, which i=
s
> > > used to execute things in Qemu. If a special path is needed, why don'=
t
> > > we pass it within this wrapper, so that the solution works for all
> > > packages?
> > >
> > > Apparently, according to
> > >
> package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.p=
c.patch
> > > there are some packages that set girdir in their .pc file so that oth=
er
> > > packages now where to find the GIR files.
> > >
> > > Really not clear in my mind how all of this should work. My only
> > > concern is that I would like us to find and use the same solution
> > > everywhere to solve the same problem, rather than having 10 different
> > > solutions for each package encountering the same issue.
> > >
> > > Thomas
> >
> >
> >
> > --
> > Thomas Petazzoni, co-owner and CEO, Bootlin
> > Embedded Linux and Kernel engineering and training
> > https://bootlin.com
>

--0000000000003c237705e935f798
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Adam,</div><div><br></div><div>Bumping poppler wil=
l not been enough to fix the build failure.</div><div>

--includedir=3D$(STAGING_DIR)/usr/share/gir-1.0 will also have to be passed=
 in -DINTROSPECTION_COMPILER_ARGS or do you think that=20
g-ir-scanner wrapper must handle this as suggested by Thomas above?</div><d=
iv><br></div><div>Best Regards,</div><div><br></div><div>Fabrice<br></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">L=
e=C2=A0mer. 21 sept. 2022 =C3=A0=C2=A019:38, Adam Duskett &lt;<a href=3D"ma=
ilto:aduskett@gmail.com">aduskett@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Hello;<br>
<br>
The above patch (and the existing patch currently in package/poppler)<br>
are both in the latest version of poppler, so this is probably safe to<br>
apply.<br>
However; it may be more advantageous to instead simply bump the<br>
poppler package instead of applying more patches.<br>
<br>
Thoughts?<br>
<br>
Adam<br>
<br>
On Sat, Aug 20, 2022 at 2:28 AM Thomas Petazzoni<br>
&lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" target=3D"_blank">thoma=
s.petazzoni@bootlin.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello Fabrice,<br>
&gt;<br>
&gt; Do you have some feedback? Or perhaps Adam?<br>
&gt;<br>
&gt; Thanks!<br>
&gt;<br>
&gt; Thomas<br>
&gt;<br>
&gt; On Sun, 14 Aug 2022 12:37:48 +0200<br>
&gt; Thomas Petazzoni via buildroot &lt;<a href=3D"mailto:buildroot@buildro=
ot.org" target=3D"_blank">buildroot@buildroot.org</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; Hello Fabrice,<br>
&gt; &gt;<br>
&gt; &gt; +Adam Duskett for GOI expertise.<br>
&gt; &gt;<br>
&gt; &gt; On Fri, 12 Aug 2022 12:17:18 +0200<br>
&gt; &gt; Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com=
" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; diff --git a/package/poppler/<a href=3D"http://poppler.mk" r=
el=3D"noreferrer" target=3D"_blank">poppler.mk</a> b/package/poppler/<a hre=
f=3D"http://poppler.mk" rel=3D"noreferrer" target=3D"_blank">poppler.mk</a>=
<br>
&gt; &gt; &gt; index b54262e7c4..db6da25d39 100644<br>
&gt; &gt; &gt; --- a/package/poppler/<a href=3D"http://poppler.mk" rel=3D"n=
oreferrer" target=3D"_blank">poppler.mk</a><br>
&gt; &gt; &gt; +++ b/package/poppler/<a href=3D"http://poppler.mk" rel=3D"n=
oreferrer" target=3D"_blank">poppler.mk</a><br>
&gt; &gt; &gt; @@ -47,7 +47,8 @@ POPPLER_DEPENDENCIES +=3D gobject-introspe=
ction<br>
&gt; &gt; &gt;=C2=A0 POPPLER_CONF_OPTS +=3D \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0-DENABLE_GOBJECT_INTROSPECTION=3DON \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0-DINTROSPECTION_SCANNER=3D$(STAGING_DIR)/=
usr/bin/g-ir-scanner \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0-DINTROSPECTION_COMPILER=3D$(STAGING_DIR)/usr/=
bin/g-ir-compiler<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0-DINTROSPECTION_COMPILER=3D$(STAGING_DIR)/usr/=
bin/g-ir-compiler \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0-DINTROSPECTION_COMPILER_ARGS=3D&quot;--includ=
edir=3D$(STAGING_DIR)/usr/share/gir-1.0&quot;<br>
&gt; &gt; &gt;=C2=A0 else<br>
&gt; &gt; &gt;=C2=A0 POPPLER_CONF_OPTS +=3D -DENABLE_GOBJECT_INTROSPECTION=
=3DOFF<br>
&gt; &gt; &gt;=C2=A0 endif<br>
&gt; &gt;<br>
&gt; &gt; I am really not familiar with all the gobject-introspection stuff=
, but<br>
&gt; &gt; I&#39;m wondering if this is the right solution for this problem.=
<br>
&gt; &gt;<br>
&gt; &gt; In package/gobject-introspection/, I can see that we create and i=
nstall<br>
&gt; &gt; a g-ir-scanner wrapper that passes --add-include-path=3D&quot;$(d=
irname<br>
&gt; &gt; &quot;$0&quot;)&quot;/../share/gir-1.0.<br>
&gt; &gt;<br>
&gt; &gt; In this same directory, we also have a g-ir-compiler wrapper, whi=
ch is<br>
&gt; &gt; used to execute things in Qemu. If a special path is needed, why =
don&#39;t<br>
&gt; &gt; we pass it within this wrapper, so that the solution works for al=
l<br>
&gt; &gt; packages?<br>
&gt; &gt;<br>
&gt; &gt; Apparently, according to<br>
&gt; &gt; package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-gl=
ib-2.0.pc.patch<br>
&gt; &gt; there are some packages that set girdir in their .pc file so that=
 other<br>
&gt; &gt; packages now where to find the GIR files.<br>
&gt; &gt;<br>
&gt; &gt; Really not clear in my mind how all of this should work. My only<=
br>
&gt; &gt; concern is that I would like us to find and use the same solution=
<br>
&gt; &gt; everywhere to solve the same problem, rather than having 10 diffe=
rent<br>
&gt; &gt; solutions for each package encountering the same issue.<br>
&gt; &gt;<br>
&gt; &gt; Thomas<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Thomas Petazzoni, co-owner and CEO, Bootlin<br>
&gt; Embedded Linux and Kernel engineering and training<br>
&gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">h=
ttps://bootlin.com</a><br>
</blockquote></div>

--0000000000003c237705e935f798--

--===============0272657816541859667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0272657816541859667==--
