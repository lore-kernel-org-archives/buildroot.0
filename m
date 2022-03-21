Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6CEC433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 11:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D17DB408B4;
	Mon, 21 Mar 2022 11:47:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rXSA0SSGc2sV; Mon, 21 Mar 2022 11:47:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D34FA405B1;
	Mon, 21 Mar 2022 11:47:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9452F1BF995
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 11:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 818A982883
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 11:47:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=3brain.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IzoXOa5QaG8h for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 11:47:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D5F8382871
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 11:47:39 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id k21so7631444lfe.4
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 04:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=3brain.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V2VuWgtj2Tk3dneaMNsoCATeOdQTFBahsifARzewIds=;
 b=WSLYfXpDRNVbwovhp7kIuqmjs0TSx7q+aMsvVbXi6LP0sm6NOEVFjrIAYtGNLs6jkM
 pKsi8nDpDxiAd3OhgUdbkzDoeBuj/LWIOg+h1y3IGVV0KZt6TnkctnYYLfQIe7vx82w9
 jgt0nsy8T77xHIaJ4xSIDbNnXvBGI5GoxzR+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V2VuWgtj2Tk3dneaMNsoCATeOdQTFBahsifARzewIds=;
 b=e4FpZF3QGxC5RMf4FaWvL9PMWyLPk5y6qfQNESVYxD7dw0u7Xq0SDxXXiz8iaLAX1x
 iBPNZ9GcuQspszf2jk5UQE58qGUsjei6qrGiiMvLuFh+GHaUb2YntJh8x5r4LS/MPabJ
 pgaiWtNVQPllznNq7QnBy+zoDJT3/5mWwtGL9PU3XW8FvQkEl+e2E+FAscR1ukAMtDa8
 fUyHmZ0AWfbpqXmgMud+HWSoN360jEway3yYdKvK6PPjJNkMQUMclEMKSw58XGlUtxDD
 fCH8/VVEs/6Kx1UbrqDZSGWEP0E9jHPn1qzu9/Yvfrfngzg53YYTUgrEXrpICC/bP+DX
 YVdQ==
X-Gm-Message-State: AOAM532ZEzFI5FwS20OvB65YmwxtbJSwiY3bmRJea/ewb4s+nhcvc76R
 KsivmfbqZcmgjWVvPdUMaXjHu8moTMvH1BAXsfpFfsfWT1fP4rqVWv82g+6QR4MvY4j3Mo0qi/8
 P+Q4/TvvJycieXcdvPshYuwPWwxc=
X-Google-Smtp-Source: ABdhPJztDPm9dw/yPYrRAVKsjBdmA/1NzcUH1bg27FvawsU5E5v7/A88zz1GoZprWeTLqOGW6eOfByqYrxEG/z2xnrk=
X-Received: by 2002:ac2:58eb:0:b0:448:1eac:5428 with SMTP id
 v11-20020ac258eb000000b004481eac5428mr14278460lfo.172.1647863257506; Mon, 21
 Mar 2022 04:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220317095027.8939-1-bruno.seifert@3brain.com>
 <CAPi7W83ifYeJ-ip==t3P6-rsCXkfZrLD=zwS9ixi_LsC4myxEA@mail.gmail.com>
In-Reply-To: <CAPi7W83ifYeJ-ip==t3P6-rsCXkfZrLD=zwS9ixi_LsC4myxEA@mail.gmail.com>
From: Bruno Seifert <bruno.seifert@3brain.com>
Date: Mon, 21 Mar 2022 12:47:26 +0100
Message-ID: <CAMVTm6GYzUmNQQh9-+CdZ7TitjQy71NYN3rh--hkJt4AixLwtQ@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: update site link
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
Content-Type: multipart/mixed; boundary="===============4024366301834052498=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4024366301834052498==
Content-Type: multipart/alternative; boundary="0000000000001a38e005dab910e4"

--0000000000001a38e005dab910e4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

This can absolutely wait for the next expat bump.
I simply had to write this fix as I'm still on buildroot 2019.11 and the
corresponding expat version isn't available on sourceforge anymore, only
the new github location. I just guessed you guys weren't aware of the
upcoming change yet.  And since I had to figure out the solution anyway, I
might as well tell you about it.

Best regards,
Bruno

Fabrice Fontaine
Thu, Mar 17, 11:17 AM (4 days ago)


to me, Buildroot

On Thu, Mar 17, 2022 at 11:17 AM Fabrice Fontaine <
fontaine.fabrice@gmail.com> wrote:

> Hello,
>
> Le jeu. 17 mars 2022 =C3=A0 10:51, bruno seifert <bruno.seifert@3brain.co=
m> a
> =C3=A9crit :
> >
> > expat is currently in the process of changing the file hosting site fro=
m
> > sourceforge to github. This adjusts the site URL to the new github
> > location. Old versions are already not available on sourceforge anymore=
.
> >
> > Signed-off-by: bruno seifert <bruno.seifert@3brain.com>
> > ---
> > Backport to: all versions
> > I think the hashes don't need to be changed, but someone who actually
> > knows stuff should confirm that.
>
> Indeed, the hash is the same.
>
> > Feel free to adjust the name and syntax. I've just started working a
> month a go and really don't know what I'm doing.
> >
> > Signed-off-by: bruno seifert <bruno.seifert@3brain.com>
> > ---
> >  package/expat/expat.mk | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/package/expat/expat.mk b/package/expat/expat.mk
> > index b29b0e1d26..3dba920083 100644
> > --- a/package/expat/expat.mk
> > +++ b/package/expat/expat.mk
> > @@ -5,7 +5,8 @@
> >
> #########################################################################=
#######
> >
> >  EXPAT_VERSION =3D 2.4.7
> > -EXPAT_SITE =3D
> http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
> > +EXPAT_VERSION_TO_URL =3D $(subst .,_,$(EXPAT_VERSION))
> > +EXPAT_SITE =3D
> https://github.com/libexpat/libexpat/releases/download/R_$(EXPAT_VERSION_=
TO_URL)
>
> A single liner would be better:
> EXPAT_SITE =3D
> https://github.com/libexpat/libexpat/releases/download/R_$(subst
> .,_,$(EXPAT_VERSION))
> <https://github.com/libexpat/libexpat/releases/download/R_$(subst.,_,$(EX=
PAT_VERSION))>
>
> However, I don't understand why we have to update the URL now?
> Can't we wait for the next expat bump?
>
> >  EXPAT_SOURCE =3D expat-$(EXPAT_VERSION).tar.xz
> >  EXPAT_INSTALL_STAGING =3D YES
> >  EXPAT_DEPENDENCIES =3D host-pkgconf
> > --
> > 2.25.1
> >
> >
> > --
> >
> > 3Brain AG
> > Einsiedlerstrasse 30
> > 8820 W=C3=A4denswil
> > Switzerland
> > +41 81 322 70 86
> >
> > www.3brain.com <https://www.3brain.com/>
> >
> >  <https://twitter.com/3brain>
> >  <https://www.linkedin.com/company/3brain/>
> > <https://www.youtube.com/channel/UCLSFhw2saf7RdZt3Emmvt_Q>
> > <https://goo.gl/maps/6dA7fb5je94L4Pyf6>
> >
> >
> >
> >
> >
> >
> >
> >
> Best Regards,
>
> Fabrice
>

--=20

3Brain AG
Einsiedlerstrasse 30
8820 W=C3=A4denswil
Switzerland
+41 81 322 70 86

www.3brain.com <https://www.3brain.com/>

 <https://twitter.com/3brain>=C2=A0=C2=A0=C2=A0=C2=A0
 <https://www.linkedin.com/company/3brain/>=C2=A0=C2=A0=C2=A0=C2=A0=20
<https://www.youtube.com/channel/UCLSFhw2saf7RdZt3Emmvt_Q>=C2=A0=C2=A0=C2=
=A0=C2=A0=20
<https://goo.gl/maps/6dA7fb5je94L4Pyf6>









--0000000000001a38e005dab910e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>This can absolutely wait=
 for the next expat bump. <br></div><div>I simply had to write this fix as =
I&#39;m still on buildroot 2019.11 and the corresponding expat version isn&=
#39;t available on sourceforge anymore, only the new github location. I jus=
t guessed you guys weren&#39;t aware of the upcoming change yet.=C2=A0 And =
since I had to figure out the solution anyway, I might as well tell you abo=
ut it.</div><div><br></div><div>Best regards,</div><div>Bruno<br></div><div=
><br></div><div><div><div></div></div><div><div><table cellpadding=3D"0"><t=
body><tr><td><table cellpadding=3D"0"><tbody><tr><td><h3><span role=3D"grid=
cell"><span name=3D"Fabrice Fontaine"><span>Fabrice Fontaine</span></span> =
</span></h3></td></tr></tbody></table></td><td><div><span></span><span id=
=3D"m_-6147735934004200485gmail-:ne" title=3D"Mar 17, 2022, 11:17 AM" alt=
=3D"Mar 17, 2022, 11:17 AM" role=3D"gridcell">Thu, Mar 17, 11:17 AM (4 days=
 ago)</span></div></td></tr></tbody></table></div></div><table cellpadding=
=3D"0"><tbody><tr><td><br></td><td rowspan=3D"2"><br></td></tr></tbody></ta=
ble><div></div><table cellpadding=3D"0"><tbody><tr></tr></tbody></table><ta=
ble cellpadding=3D"0"><tbody><tr><td colspan=3D"3"><table cellpadding=3D"0"=
><tbody><tr><td><div><span>to <span name=3D"me">me</span>, <span name=3D"Bu=
ildroot">Buildroot</span> </span></div><div id=3D"m_-6147735934004200485gma=
il-:no" aria-haspopup=3D"true" role=3D"button" aria-label=3D"Show details">=
<img src=3D"https://mail.google.com/mail/u/0/images/cleardot.gif" alt=3D"">=
</div></td></tr></tbody></table></td></tr></tbody></table></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar=
 17, 2022 at 11:17 AM Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabri=
ce@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
Le jeu. 17 mars 2022 =C3=A0 10:51, bruno seifert &lt;<a href=3D"mailto:brun=
o.seifert@3brain.com" target=3D"_blank">bruno.seifert@3brain.com</a>&gt; a =
=C3=A9crit :<br>
&gt;<br>
&gt; expat is currently in the process of changing the file hosting site fr=
om<br>
&gt; sourceforge to github. This adjusts the site URL to the new github<br>
&gt; location. Old versions are already not available on sourceforge anymor=
e.<br>
&gt;<br>
&gt; Signed-off-by: bruno seifert &lt;<a href=3D"mailto:bruno.seifert@3brai=
n.com" target=3D"_blank">bruno.seifert@3brain.com</a>&gt;<br>
&gt; ---<br>
&gt; Backport to: all versions<br>
&gt; I think the hashes don&#39;t need to be changed, but someone who actua=
lly<br>
&gt; knows stuff should confirm that.<br>
<br>
Indeed, the hash is the same.<br>
<br>
&gt; Feel free to adjust the name and syntax. I&#39;ve just started working=
 a month a go and really don&#39;t know what I&#39;m doing.<br>
&gt;<br>
&gt; Signed-off-by: bruno seifert &lt;<a href=3D"mailto:bruno.seifert@3brai=
n.com" target=3D"_blank">bruno.seifert@3brain.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/expat/<a href=3D"http://expat.mk" rel=3D"noreferrer" tar=
get=3D"_blank">expat.mk</a> | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/package/expat/<a href=3D"http://expat.mk" rel=3D"noreferr=
er" target=3D"_blank">expat.mk</a> b/package/expat/<a href=3D"http://expat.=
mk" rel=3D"noreferrer" target=3D"_blank">expat.mk</a><br>
&gt; index b29b0e1d26..3dba920083 100644<br>
&gt; --- a/package/expat/<a href=3D"http://expat.mk" rel=3D"noreferrer" tar=
get=3D"_blank">expat.mk</a><br>
&gt; +++ b/package/expat/<a href=3D"http://expat.mk" rel=3D"noreferrer" tar=
get=3D"_blank">expat.mk</a><br>
&gt; @@ -5,7 +5,8 @@<br>
&gt;=C2=A0 ################################################################=
################<br>
&gt;<br>
&gt;=C2=A0 EXPAT_VERSION =3D 2.4.7<br>
&gt; -EXPAT_SITE =3D <a href=3D"http://downloads.sourceforge.net/project/ex=
pat/expat/$(EXPAT_VERSION)" rel=3D"noreferrer" target=3D"_blank">http://dow=
nloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)</a><br>
&gt; +EXPAT_VERSION_TO_URL =3D $(subst .,_,$(EXPAT_VERSION))<br>
&gt; +EXPAT_SITE =3D <a href=3D"https://github.com/libexpat/libexpat/releas=
es/download/R_$(EXPAT_VERSION_TO_URL)" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/libexpat/libexpat/releases/download/R_$(EXPAT_VERSION_T=
O_URL)</a><br>
<br>
A single liner would be better:<br>
EXPAT_SITE =3D <a href=3D"https://github.com/libexpat/libexpat/releases/dow=
nload/R_$(subst.,_,$(EXPAT_VERSION))" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/libexpat/libexpat/releases/download/R_$(subst<br>
.,_,$(EXPAT_VERSION))</a><br>
<br>
However, I don&#39;t understand why we have to update the URL now?<br>
Can&#39;t we wait for the next expat bump?<br>
<br>
&gt;=C2=A0 EXPAT_SOURCE =3D expat-$(EXPAT_VERSION).tar.xz<br>
&gt;=C2=A0 EXPAT_INSTALL_STAGING =3D YES<br>
&gt;=C2=A0 EXPAT_DEPENDENCIES =3D host-pkgconf<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt;<br>
&gt; 3Brain AG<br>
&gt; Einsiedlerstrasse 30<br>
&gt; 8820 W=C3=A4denswil<br>
&gt; Switzerland<br>
&gt; +41 81 322 70 86<br>
&gt;<br>
&gt; <a href=3D"http://www.3brain.com" rel=3D"noreferrer" target=3D"_blank"=
>www.3brain.com</a> &lt;<a href=3D"https://www.3brain.com/" rel=3D"noreferr=
er" target=3D"_blank">https://www.3brain.com/</a>&gt;<br>
&gt;<br>
&gt;=C2=A0 &lt;<a href=3D"https://twitter.com/3brain" rel=3D"noreferrer" ta=
rget=3D"_blank">https://twitter.com/3brain</a>&gt;<br>
&gt;=C2=A0 &lt;<a href=3D"https://www.linkedin.com/company/3brain/" rel=3D"=
noreferrer" target=3D"_blank">https://www.linkedin.com/company/3brain/</a>&=
gt;<br>
&gt; &lt;<a href=3D"https://www.youtube.com/channel/UCLSFhw2saf7RdZt3Emmvt_=
Q" rel=3D"noreferrer" target=3D"_blank">https://www.youtube.com/channel/UCL=
SFhw2saf7RdZt3Emmvt_Q</a>&gt;<br>
&gt; &lt;<a href=3D"https://goo.gl/maps/6dA7fb5je94L4Pyf6" rel=3D"noreferre=
r" target=3D"_blank">https://goo.gl/maps/6dA7fb5je94L4Pyf6</a>&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
Best Regards,<br>
<br>
Fabrice<br>
</blockquote></div>

<br>
<div style=3D"color:#939a9d;font-family:Rubik,Roboto,Arial,Helvetica,sans-s=
erif;line-height:1.4;letter-spacing:0.07em">
<div style=3D"color:#3d61f9;font-weight:500;line-height:1.5"><span style=3D=
"font-size:small;letter-spacing:0.07em">3Brain AG</span></div><div style=3D=
"color:#3d61f9;font-weight:500;line-height:1.5"><div style=3D"color:rgb(147=
,154,157);font-size:small;line-height:1.4;letter-spacing:0.07em"><div>Einsi=
edlerstrasse 30<br>8820 W=C3=A4denswil<br>Switzerland<br>+41 81 322 70 86<b=
r></div><div style=3D"margin-top:25.0781px;margin-bottom:12.5312px"><div><a=
 href=3D"https://www.3brain.com/" style=3D"color:rgb(61,97,249)" target=3D"=
_blank">www.3brain.com</a><br></div><div><a href=3D"https://twitter.com/3br=
ain" style=3D"color:rgb(61,97,249)" target=3D"_blank"><img src=3D"https://r=
esources.3brain.com/f1/email-assets/twitter_small.png" alt=3D"TW"></a>=C2=
=A0=C2=A0=C2=A0=C2=A0<a href=3D"https://www.linkedin.com/company/3brain/" s=
tyle=3D"color:rgb(61,97,249)" target=3D"_blank"><img src=3D"https://resourc=
es.3brain.com/f1/email-assets/linkedin_small.png" alt=3D"IN"></a>=C2=A0=C2=
=A0=C2=A0=C2=A0<a href=3D"https://www.youtube.com/channel/UCLSFhw2saf7RdZt3=
Emmvt_Q" style=3D"color:rgb(61,97,249)" target=3D"_blank"><img src=3D"https=
://resources.3brain.com/f1/email-assets/youtube_small.png" alt=3D"YT"></a>=
=C2=A0=C2=A0=C2=A0=C2=A0<a href=3D"https://goo.gl/maps/6dA7fb5je94L4Pyf6" s=
tyle=3D"color:rgb(61,97,249)" target=3D"_blank"><img src=3D"https://resourc=
es.3brain.com/f1/email-assets/location_small.png" alt=3D"LOC"></a></div></d=
iv></div></div><div style=3D"margin-top:1%;margin-bottom:0.5%">
</div>

</div>
--0000000000001a38e005dab910e4--

--===============4024366301834052498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4024366301834052498==--
