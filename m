Return-Path: <SRS0=DPgg=NG=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B0AC4338F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 05:27:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C441760EB2
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 05:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C441760EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gadz.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DBB5605D2;
	Sun, 15 Aug 2021 05:27:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PnOfTGdQuprm; Sun, 15 Aug 2021 05:27:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D5EB605E2;
	Sun, 15 Aug 2021 05:27:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1AA671BF4E5
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 05:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07DC58364B
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 05:27:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L8wVoYTI4eV3 for <buildroot@lists.busybox.net>;
 Sun, 15 Aug 2021 05:27:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D10EA83640
 for <buildroot@busybox.net>; Sun, 15 Aug 2021 05:27:33 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id d16so3928141ljq.4
 for <buildroot@busybox.net>; Sat, 14 Aug 2021 22:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fc1m7/wAhPftBPGJ+v55cCNmOcnrOL8aPrjsTyi0lrE=;
 b=bPMp9DX4lGIwgtm/MpHySGfHzN4NzYkMOz5Tjrp1RzflGWwOhciodJrybfNzyfYTZV
 RQdzCxRVRzfyjOxQUyGJj5j3emxtiLu16fhlqFJokCVoF2AwUoCS/8WCKyV0aaGMyqkr
 Ijp7w8gqZf5zMlREaz1+HB7RnuxWvh4D2T0rlaeC7OQLASUv+hMg5jRT54WqWYmZrl8M
 MiYO1xgtP56D2uTixenNQv0nu3x+/nA/jJNR/LjWxt4x26CA1a6nB77srOQEsI9F7wLI
 wGsmnjUSSK297GFIR9ZRem9PFdtBBn1K+3W8UcSa7+FLTWCZGt/DVaZVlqyfuCYqdcPl
 aWMg==
X-Gm-Message-State: AOAM532Di+XOHZl1bykI9HHFQjPDXDgKx3gb0TMWMaYsWF2SM9qi86FP
 pbF90j2/NyqbZGLBpNKACS24dtK/pXz1FvBSmUaNl0ZmrzIMRw==
X-Google-Smtp-Source: ABdhPJxMQI1AAvW+Hk4HXxAF4wYbBZSMgObgwXuDOrCcnduuOFN6+V8/8oenxPG7FijmBCxArEEJk44BgD+2vKcJEu8=
X-Received: by 2002:a2e:a549:: with SMTP id e9mr7722481ljn.500.1629005251264; 
 Sat, 14 Aug 2021 22:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210804134635.262095-1-francois.perrad@gadz.org>
 <379b58ad-76ee-8601-d5b6-8a6cdf294818@mind.be>
 <CAB0FRstwhGpbUDDKzDR2AgR9DCbC+QwRd2oEAJ+kTSubcdr9vQ@mail.gmail.com>
 <20210807091347.GX27036@scaer>
In-Reply-To: <20210807091347.GX27036@scaer>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 15 Aug 2021 07:27:20 +0200
Message-ID: <CAB0FRst3D--bedbK1A72MLtr66yStFJuGbVp3Y1A0C9Nu81gvw@mail.gmail.com>
To: buildroot <buildroot@busybox.net>
Subject: Re: [Buildroot] [PATCH v3 1/2] package/lua-lunix: fix build with
 recent gcc
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="===============4675702097934904923=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============4675702097934904923==
Content-Type: multipart/alternative; boundary="00000000000056dc9f05c9925780"

--00000000000056dc9f05c9925780
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 7 ao=C3=BBt 2021 =C3=A0 11:13, Yann E. MORIN <yann.morin.1998@free.=
fr> a
=C3=A9crit :

> Fran=C3=A7ois, All,
>
> On 2021-08-07 10:55 +0200, Fran=C3=A7ois Perrad spake thusly:
> > Le jeu. 5 ao=C3=BBt 2021 =C3=A0 19:05, Arnout Vandecappelle < [1]arnout=
@mind.be>
> a =C3=A9crit :
> [--SNIP--]
> >    Unless this patch is accepted upstream (unlikely, given that there
> was no
> >   maintainer activity on [1] since more than a month), a much better wa=
y
> IMHO is
> >   to set it from the .mk file:
> >
> >   LUA_LUNIX_BUILD_OPTS =3D CFLAGS=3D"$(TARGET_CFLAGS) -DHAVE_SYS_SYSCTL=
_H=3D0"
> >
> > It looks elegant but it doesn't work, because CFLAGS is already set in
> [6]pkg-luarocks.mk
>
> I would argue that lua packages should have a way to provide their own
> CFLAGS that would be able to override settng, probably something like:
>
>     diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
>     index fd79855878..4230783af0 100644
>     --- a/package/pkg-luarocks.mk
>     +++ b/package/pkg-luarocks.mk
>     @@ -117,7 +117,7 @@ define $(2)_INSTALL_TARGET_CMDS
>                         LUA_LIBDIR=3D"$$(STAGING_DIR)/usr/lib" \
>                         CC=3D$$(TARGET_CC) \
>                         LD=3D$$(TARGET_CC) \
>     -                   CFLAGS=3D"$$(LUAROCKS_CFLAGS)" \
>     +                   CFLAGS=3D"$$(LUAROCKS_CFLAGS)
> $$($(2)_LUAROCKS_CFLAGS)" \
>                         LIBFLAG=3D"-shared $$(TARGET_LDFLAGS)" \
>                         $$($(2)_BUILD_OPTS) $$($(2)_ROCKSPEC)
>      endef
>
> Could you please have a look into this?
>
>
I don't like this idea.
Finally, I push this : https://github.com/wahern/lunix/pull/20/files

Fran=C3=A7ois


> Regards,
> Yann E. MORIN.
>
> > The file lunix-20170920-1.rockspec is not a part of the upstream projec=
t
> (
> > [7]
> https://25thandclement.com/~william/projects/releases/lunix-20170920.tgz
> or [8]https://github.com/wahern/lunix).
> > It was created by the author of Luarocks package, it is only available
> on [9]https://luarocks.org/modules/daurnimator/lunix
> > So, my patch cannot be upstreamed, but it is currently the only way to
> do.
> >
> > Fran=C3=A7ois
> >
> >
> >   (This may not work though, depending on the order of the flags added
> by luarocks.)
> >
> >    Regards,
> >    Arnout
> >
> >   > ++
> >   };
> >   > ++                            };
> >   > ++                    };
> >   > ++            };
> >   > +     };
> >   > + }
> >   > +--
> >   > +2.30.2
> >   > +
> >   >
> >   _______________________________________________
> >   buildroot mailing list
> >   [10]buildroot@busybox.net
> >   [11]http://lists.busybox.net/mailman/listinfo/buildroot
> >
> > Links:
> > 1. mailto:arnout@mind.be
> > 2.
> http://autobuild.buildroot.net/results/749a11d5289c6fec3b2f236b9073fc1ab7=
30d090/
> > 3. mailto:francois.perrad@gadz.org
> > 4. mailto:francois.perrad@gadz.org
> > 5. mailto:francois.perrad@gadz.org
> > 6. http://pkg-luarocks.mk
> > 7.
> https://25thandclement.com/~william/projects/releases/lunix-20170920.tgz
> > 8. https://github.com/wahern/lunix
> > 9. https://luarocks.org/modules/daurnimator/lunix
> > 10. mailto:buildroot@busybox.net
> > 11. http://lists.busybox.net/mailman/listinfo/buildroot
>
> > _______________________________________________
> > buildroot mailing list
> > buildroot@busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
>
> --
>
> .-----------------.--------------------.------------------.--------------=
------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There i=
s
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------=
------'
>

--00000000000056dc9f05c9925780
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 7 ao=C3=BBt 2021 =C3=A0=
=C2=A011:13, Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr">y=
ann.morin.1998@free.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Fran=C3=A7ois, All,<br>
<br>
On 2021-08-07 10:55 +0200, Fran=C3=A7ois Perrad spake thusly:<br>
&gt; Le=C2=A0jeu. 5 ao=C3=BBt 2021 =C3=A0=C2=A019:05, Arnout Vandecappelle =
&lt; [1]<a href=3D"mailto:arnout@mind.be" target=3D"_blank">arnout@mind.be<=
/a>&gt; a =C3=A9crit=C2=A0:<br>
[--SNIP--]<br>
&gt;=C2=A0 =C2=A0=C2=A0Unless this patch is accepted upstream (unlikely, gi=
ven that there was no<br>
&gt;=C2=A0 =C2=A0maintainer activity on [1] since more than a month), a muc=
h better way IMHO is<br>
&gt;=C2=A0 =C2=A0to set it from the .mk file:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0LUA_LUNIX_BUILD_OPTS =3D CFLAGS=3D&quot;$(TARGET_CFLAGS) -=
DHAVE_SYS_SYSCTL_H=3D0&quot;<br>
&gt; <br>
&gt; It looks elegant but it doesn&#39;t work, because CFLAGS is already se=
t in [6]<a href=3D"http://pkg-luarocks.mk" rel=3D"noreferrer" target=3D"_bl=
ank">pkg-luarocks.mk</a><br>
<br>
I would argue that lua packages should have a way to provide their own<br>
CFLAGS that would be able to override settng, probably something like:<br>
<br>
=C2=A0 =C2=A0 diff --git a/package/<a href=3D"http://pkg-luarocks.mk" rel=
=3D"noreferrer" target=3D"_blank">pkg-luarocks.mk</a> b/package/<a href=3D"=
http://pkg-luarocks.mk" rel=3D"noreferrer" target=3D"_blank">pkg-luarocks.m=
k</a><br>
=C2=A0 =C2=A0 index fd79855878..4230783af0 100644<br>
=C2=A0 =C2=A0 --- a/package/<a href=3D"http://pkg-luarocks.mk" rel=3D"noref=
errer" target=3D"_blank">pkg-luarocks.mk</a><br>
=C2=A0 =C2=A0 +++ b/package/<a href=3D"http://pkg-luarocks.mk" rel=3D"noref=
errer" target=3D"_blank">pkg-luarocks.mk</a><br>
=C2=A0 =C2=A0 @@ -117,7 +117,7 @@ define $(2)_INSTALL_TARGET_CMDS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 LUA_LIBDIR=3D&quot;$$(STAGING_DIR)/usr/lib&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 CC=3D$$(TARGET_CC) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 LD=3D$$(TARGET_CC) \<br>
=C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0CFLAGS=3D&quot;$$(LUAROCKS_CFLAGS)&quot; \<br>
=C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0CFLAGS=3D&quot;$$(LUAROCKS_CFLAGS) $$($(2)_LUAROCKS_CFLAGS)&quot;=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 LIBFLAG=3D&quot;-shared $$(TARGET_LDFLAGS)&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 $$($(2)_BUILD_OPTS) $$($(2)_ROCKSPEC)<br>
=C2=A0 =C2=A0 =C2=A0endef<br>
<br>
Could you please have a look into this?<br>
<br></blockquote><div><br></div><div>I don&#39;t like this idea.</div><div>=
Finally, I push this : <a href=3D"https://github.com/wahern/lunix/pull/20/f=
iles">https://github.com/wahern/lunix/pull/20/files</a></div><div><br></div=
><div>Fran=C3=A7ois<br></div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; The file lunix-20170920-1.rockspec is not a part of the upstream proje=
ct (<br>
&gt; [7]<a href=3D"https://25thandclement.com/~william/projects/releases/lu=
nix-20170920.tgz" rel=3D"noreferrer" target=3D"_blank">https://25thandcleme=
nt.com/~william/projects/releases/lunix-20170920.tgz</a> or [8]<a href=3D"h=
ttps://github.com/wahern/lunix" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/wahern/lunix</a>).<br>
&gt; It was created by the author of Luarocks package, it is only available=
 on [9]<a href=3D"https://luarocks.org/modules/daurnimator/lunix" rel=3D"no=
referrer" target=3D"_blank">https://luarocks.org/modules/daurnimator/lunix<=
/a><br>
&gt; So, my patch cannot be upstreamed, but it is currently the only way to=
 do.<br>
&gt; <br>
&gt; Fran=C3=A7ois<br>
&gt; =C2=A0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0(This may not work though, depending on the order of the f=
lags added by luarocks.)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0Regards,<br>
&gt;=C2=A0 =C2=A0=C2=A0Arnout<br>
&gt; <br>
&gt;=C2=A0 =C2=A0&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt;=C2=A0 =C2=A0&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 };<br>
&gt;=C2=A0 =C2=A0&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt;=C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0&gt; + }<br>
&gt;=C2=A0 =C2=A0&gt; +--<br>
&gt;=C2=A0 =C2=A0&gt; +2.30.2<br>
&gt;=C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0_______________________________________________<br>
&gt;=C2=A0 =C2=A0buildroot mailing list<br>
&gt;=C2=A0 =C2=A0[10]<a href=3D"mailto:buildroot@busybox.net" target=3D"_bl=
ank">buildroot@busybox.net</a><br>
&gt;=C2=A0 =C2=A0[11]<a href=3D"http://lists.busybox.net/mailman/listinfo/b=
uildroot" rel=3D"noreferrer" target=3D"_blank">http://lists.busybox.net/mai=
lman/listinfo/buildroot</a><br>
&gt; <br>
&gt; Links:<br>
&gt; 1. mailto:<a href=3D"mailto:arnout@mind.be" target=3D"_blank">arnout@m=
ind.be</a><br>
&gt; 2. <a href=3D"http://autobuild.buildroot.net/results/749a11d5289c6fec3=
b2f236b9073fc1ab730d090/" rel=3D"noreferrer" target=3D"_blank">http://autob=
uild.buildroot.net/results/749a11d5289c6fec3b2f236b9073fc1ab730d090/</a><br=
>
&gt; 3. mailto:<a href=3D"mailto:francois.perrad@gadz.org" target=3D"_blank=
">francois.perrad@gadz.org</a><br>
&gt; 4. mailto:<a href=3D"mailto:francois.perrad@gadz.org" target=3D"_blank=
">francois.perrad@gadz.org</a><br>
&gt; 5. mailto:<a href=3D"mailto:francois.perrad@gadz.org" target=3D"_blank=
">francois.perrad@gadz.org</a><br>
&gt; 6. <a href=3D"http://pkg-luarocks.mk" rel=3D"noreferrer" target=3D"_bl=
ank">http://pkg-luarocks.mk</a><br>
&gt; 7. <a href=3D"https://25thandclement.com/~william/projects/releases/lu=
nix-20170920.tgz" rel=3D"noreferrer" target=3D"_blank">https://25thandcleme=
nt.com/~william/projects/releases/lunix-20170920.tgz</a><br>
&gt; 8. <a href=3D"https://github.com/wahern/lunix" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/wahern/lunix</a><br>
&gt; 9. <a href=3D"https://luarocks.org/modules/daurnimator/lunix" rel=3D"n=
oreferrer" target=3D"_blank">https://luarocks.org/modules/daurnimator/lunix=
</a><br>
&gt; 10. mailto:<a href=3D"mailto:buildroot@busybox.net" target=3D"_blank">=
buildroot@busybox.net</a><br>
&gt; 11. <a href=3D"http://lists.busybox.net/mailman/listinfo/buildroot" re=
l=3D"noreferrer" target=3D"_blank">http://lists.busybox.net/mailman/listinf=
o/buildroot</a><br>
<br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@busybox.net" target=3D"_blank">buildroot@b=
usybox.net</a><br>
&gt; <a href=3D"http://lists.busybox.net/mailman/listinfo/buildroot" rel=3D=
"noreferrer" target=3D"_blank">http://lists.busybox.net/mailman/listinfo/bu=
ildroot</a><br>
<br>
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
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer" target=3D"_bl=
ank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 =
|=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
</blockquote></div></div>

--00000000000056dc9f05c9925780--

--===============4675702097934904923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============4675702097934904923==--
