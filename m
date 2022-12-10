Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC026C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 16:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E17581495;
	Sat, 10 Dec 2022 16:55:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E17581495
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pD_vOSSMffFu; Sat, 10 Dec 2022 16:55:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 302D88149B;
	Sat, 10 Dec 2022 16:55:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 302D88149B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 970801BF59F
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65D0C60736
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 16:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65D0C60736
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wN9vZbI_9lup for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 16:55:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15A77605A1
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15A77605A1
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 16:55:33 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id k2so3498439qkk.7
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 08:55:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F1/n4KbA3VxwNOY2wxZMjbVtB63X+thVSL8Ipp7SXe8=;
 b=KAd02YsBH56S/NQEOYrC6qa5a1qJwZrnYYNsZhRFnJZNaG0ikCmuZ8wJHAF7THdo43
 7iFxS1r46aDGaGvkeNLDblF8/HgzL9+0SMgl7Lsz/By6pTE1pCbXth/RSHH/41dbV50V
 qi8XvwTzdzE+YvwXo4Z2Jx9ADzZ/o+NUVpp+NgCz/Zz/NeIkXBwREsB7hsbwcwND4S8K
 csZM0vrIlt9/hGfB6qohZYE3hdduya/s1cu0puKby5O77bkP/awjleJ22tB3s6ovOvyU
 ETvYs8ufJDqwuMO+xvid/unwLVDPSAxavvmub1I5IOwrv0SesQD5lWID2OdiKEMoADuV
 rfQA==
X-Gm-Message-State: ANoB5plfeRFPnU4L9m5mTxXQvP/HE4s6IPuMVWq8/ZJsOJ7Lk/AePaYe
 XSHDWSAtzGsGgplBn1xfAJFXe4FOqv6hYLVvY/OiPwy5sGs=
X-Google-Smtp-Source: AA0mqf4UUNcMjhfqvyGYELD35Kdcp+G7fPjuZlnfCjH4C3GmSpkrIW+smWxWhEtqgx9WmeVQXSTCK4TJ/Vi+5BOjHX8=
X-Received: by 2002:a05:620a:14b3:b0:6ff:7ab5:edc6 with SMTP id
 x19-20020a05620a14b300b006ff7ab5edc6mr143838qkj.639.1670691331795; Sat, 10
 Dec 2022 08:55:31 -0800 (PST)
MIME-Version: 1.0
References: <20221210131713.274886-1-nolange79@gmail.com>
 <20221210161851.GC1044805@scaer>
In-Reply-To: <20221210161851.GC1044805@scaer>
From: Norbert Lange <nolange79@gmail.com>
Date: Sat, 10 Dec 2022 17:55:20 +0100
Message-ID: <CADYdroNE6D2SPkFNCsYiQYTBHFKVM9SO7-bHy4USTuPqqYEQQg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F1/n4KbA3VxwNOY2wxZMjbVtB63X+thVSL8Ipp7SXe8=;
 b=jC7xmdaOEIBastQqYFnI8X4s9hP9HQ8HhWNsbb8AeysdxxEJziEg0zMqFXrq8Rjbx7
 SAQZ6foWotUgf1QNCFTWiiETrq0sPeciN1kIuv/MbqD42eh9Q31oRHJ/av2i/P4/nOIw
 gkN7SJVp79sdHXpn/0oU7nwrOObcj2htdeNqr8IjROZXwIFXtn5ijZt221CAAgY8H6lK
 +dtP/1xUOzaOsFSL58Oo5PeXzPBCD2r4jauGy27bAyoe/xbiqH68rdI3ZPDvqJWayc/6
 /jMNe6Cj6IzZhG60gV8Vm7If75UGVXeQ8vPE59y5RXV1CUbmBqhN6DnfWpsEWsCaXy9L
 RC2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jC7xmdaO
Subject: Re: [Buildroot] [PATCH] package/libxml-parser-perl: fix build when
 host matches target gcc
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============8581568870536619798=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8581568870536619798==
Content-Type: multipart/alternative; boundary="0000000000005c6edf05ef7c23dd"

--0000000000005c6edf05ef7c23dd
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Dec 2022, 17:18 Yann E. MORIN, <yann.morin.1998@free.fr> wrote:

> Norbert, All,
>
> On 2022-12-10 14:17 +0100, Norbert Lange spake thusly:
> > The host configure and build step looks for same compiler name
> > (eg. x86_64-linux-gnu-gcc), and the build potentially breaks
> > if the target compiler is named identically.
> >
> > revert PATH env variable to not include the target binaries.
>
> We pass $(HOST_CONFIGURE_OPTS) in the environment, which contains a
> definition for: CC=$(HOSTCC)
>
> And HOSTCC is defined as:
>
>     ifndef HOSTCC
>     HOSTCC := gcc
>     HOSTCC := $(shell which $(HOSTCC) || type -p $(HOSTCC) || echo gcc)
>     endif
>
> In my case, however, I can indeed see that it uses it (single line
> wrapped for readability):
>
>     /usr/bin/gcc -c  -I/home/ymorin/dev/buildroot/O/master/host/include
>     -D_REENTRANT -D_GNU_SOURCE -DDEBIAN -fwrapv -fno-strict-aliasing -pipe
>     -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g
>     -DVERSION=\"2.46\" -DXS_VERSION=\"2.46\" -fPIC
>     "-I/usr/lib/x86_64-linux-gnu/perl/5.30/CORE"   Expat.c
>
> So, I looked at the generated Makefile, and I can see;
>
>     # These definitions are from config.sh (via
> /usr/lib/x86_64-linux-gnu/perl/5.30/Config.pm).
>     # They may have been overridden via Makefile.PL or on the command line.
>
> So, we are passing CC et all in the environment, so they do not override
> the ones my system perl was built with.
>

I actually dont see where the compiler name comes from in my case

We are also even forcing LD, but it is not accounted for either... I
> guess that _may_ work when we are building our own host-perl, but not
> when we are using the system perl...
>
> So, I think the best fix would be to change how we pass CC et al,
> either by passing HOST_LIBXML_PARSER_PERL_CONFIGURE_OPTS as options
> instead of in the environment, or by carefully cherry-picking CC, LD and
> maybe a few others, and force them to be passed as options.
>

I actually forgot about it, thinking it has been accepted, but you
find an earlier patch from myself at [1] (ML archive seems dead ATM?).

I think having the "wrong" compiler in path generally is asking for trouble,
this package doesnt need any BR provided host-tools so its fine without.
I don't know how to fix this in a clean manner for the general case
(some host pkgs might just build with target compiler without anyone
noticing).

perhaps install wrappers for the target toolchain in eg.
$(HOST_DIR)/fake-bin/x86_64-linux-gnu-gcc

wrappers would print a warning (possibly break the build later, if the
problem is
better understood), then forward the arguments to
/usr/bin/x86_64-linux-gnu-gcc
(same thing for every target toolchain binary).

only on host configure/build/install steps the '$(HOST_DIR)/fake-bin'
entry would be added in front of PATH.

regards,
Norbert


> Regards,
> Yann E. MORIN.
>
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > ---
> >  package/libxml-parser-perl/libxml-parser-perl.mk | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk
> b/package/libxml-parser-perl/libxml-parser-perl.mk
> > index 37cef2e418..4af4485429 100644
> > --- a/package/libxml-parser-perl/libxml-parser-perl.mk
> > +++ b/package/libxml-parser-perl/libxml-parser-perl.mk
> > @@ -14,6 +14,7 @@ LIBXML_PARSER_PERL_RUN_PERL = `which perl`
> >
> >  HOST_LIBXML_PARSER_PERL_CONFIGURE_OPTS = \
> >       $(HOST_CONFIGURE_OPTS) \
> > +     PATH="$(PATH)" \
> >       LD="$(HOSTCC)"
> >
> >  define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
> > --
> > 2.35.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
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
>

[1] - https://lists.buildroot.org/pipermail/buildroot/2020-June/284219.html

--0000000000005c6edf05ef7c23dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto"><div><br><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, 10 Dec 2022, 17:18 Yann E. MO=
RIN, &lt;<a href=3D"mailto:yann.morin.1998@free.fr" target=3D"_blank">yann.=
morin.1998@free.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">N=
orbert, All,<br>
<br>
On 2022-12-10 14:17 +0100, Norbert Lange spake thusly:<br>
&gt; The host configure and build step looks for same compiler name<br>
&gt; (eg. x86_64-linux-gnu-gcc), and the build potentially breaks<br>
&gt; if the target compiler is named identically.<br>
&gt; <br>
&gt; revert PATH env variable to not include the target binaries.<br>
<br>
We pass $(HOST_CONFIGURE_OPTS) in the environment, which contains a<br>
definition for: CC=3D$(HOSTCC)<br>
<br>
And HOSTCC is defined as:<br>
<br>
=C2=A0 =C2=A0 ifndef HOSTCC<br>
=C2=A0 =C2=A0 HOSTCC :=3D gcc<br>
=C2=A0 =C2=A0 HOSTCC :=3D $(shell which $(HOSTCC) || type -p $(HOSTCC) || e=
cho gcc)<br>
=C2=A0 =C2=A0 endif<br>
<br>
In my case, however, I can indeed see that it uses it (single line<br>
wrapped for readability):<br>
<br>
=C2=A0 =C2=A0 /usr/bin/gcc -c=C2=A0 -I/home/ymorin/dev/buildroot/O/master/h=
ost/include<br>
=C2=A0 =C2=A0 -D_REENTRANT -D_GNU_SOURCE -DDEBIAN -fwrapv -fno-strict-alias=
ing -pipe<br>
=C2=A0 =C2=A0 -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=
=3D64 -O2 -g<br>
=C2=A0 =C2=A0 -DVERSION=3D\&quot;2.46\&quot; -DXS_VERSION=3D\&quot;2.46\&qu=
ot; -fPIC<br>
=C2=A0 =C2=A0 &quot;-I/usr/lib/x86_64-linux-gnu/perl/5.30/CORE&quot;=C2=A0 =
=C2=A0Expat.c<br>
<br>
So, I looked at the generated Makefile, and I can see;<br>
<br>
=C2=A0 =C2=A0 # These definitions are from config.sh (via /usr/lib/x86_64-l=
inux-gnu/perl/5.30/Config.pm).<br>
=C2=A0 =C2=A0 # They may have been overridden via Makefile.PL or on the com=
mand line.<br>
<br>
So, we are passing CC et all in the environment, so they do not override<br=
>
the ones my system perl was built with.<br></blockquote></div></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">I actually dont see where the compil=
er name comes from in my case=C2=A0</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
We are also even forcing LD, but it is not accounted for either... I<br>
guess that _may_ work when we are building our own host-perl, but not<br>
when we are using the system perl...<br>
<br>
So, I think the best fix would be to change how we pass CC et al,<br>
either by passing HOST_LIBXML_PARSER_PERL_CONFIGURE_OPTS as options<br>
instead of in the environment, or by carefully cherry-picking CC, LD and<br=
>
maybe a few others, and force them to be passed as options.<br></blockquote=
></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I actually forgo=
t about it, thinking it has been accepted, but you</div><div dir=3D"auto">f=
ind an earlier patch from myself at [1] (ML archive seems dead ATM?).</div>=
<div dir=3D"auto"><br></div><div>I think having the &quot;wrong&quot; compi=
ler in path generally is asking for trouble,</div><div>this package doesnt =
need any BR provided host-tools so its fine without.</div><div>I don&#39;t =
know how to fix this in a clean manner for the general case</div><div>(some=
 host pkgs might just build with target compiler without anyone noticing).<=
/div><div><br></div><div>perhaps install wrappers for the target toolchain =
in eg.</div><div>$(HOST_DIR)/fake-bin/x86_64-linux-gnu-gcc</div><div><br></=
div><div>wrappers would print a warning (possibly break the build later, if=
 the problem is</div><div>better understood), then forward the arguments to=
 /usr/bin/x86_64-linux-gnu-gcc</div><div>(same thing for every target toolc=
hain binary).</div><div><br></div><div>only on host configure/build/install=
 steps the &#39;$(HOST_DIR)/fake-bin&#39;</div><div>entry would be added in=
 front of PATH.</div><div><br></div><div>regards,</div><div>Norbert</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; Signed-off-by: Norbert Lange &lt;<a href=3D"mailto:nolange79@gmail.com=
" rel=3D"noreferrer" target=3D"_blank">nolange79@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/libxml-parser-perl/<a href=3D"http://libxml-parser-perl.=
mk" rel=3D"noreferrer noreferrer" target=3D"_blank">libxml-parser-perl.mk</=
a> | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/package/libxml-parser-perl/<a href=3D"http://libxml-parse=
r-perl.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">libxml-parser-pe=
rl.mk</a> b/package/libxml-parser-perl/<a href=3D"http://libxml-parser-perl=
.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">libxml-parser-perl.mk<=
/a><br>
&gt; index 37cef2e418..4af4485429 100644<br>
&gt; --- a/package/libxml-parser-perl/<a href=3D"http://libxml-parser-perl.=
mk" rel=3D"noreferrer noreferrer" target=3D"_blank">libxml-parser-perl.mk</=
a><br>
&gt; +++ b/package/libxml-parser-perl/<a href=3D"http://libxml-parser-perl.=
mk" rel=3D"noreferrer noreferrer" target=3D"_blank">libxml-parser-perl.mk</=
a><br>
&gt; @@ -14,6 +14,7 @@ LIBXML_PARSER_PERL_RUN_PERL =3D `which perl`<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 HOST_LIBXML_PARSER_PERL_CONFIGURE_OPTS =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$(HOST_CONFIGURE_OPTS) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0PATH=3D&quot;$(PATH)&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0LD=3D&quot;$(HOSTCC)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS<br>
&gt; -- <br>
&gt; 2.35.1<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" rel=3D"noreferrer" target=
=3D"_blank">buildroot@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://lists.buildroot.org/ma=
ilman/listinfo/buildroot</a><br>
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
--------&#39;<br></blockquote><div><br></div><div>[1] -=C2=A0<a href=3D"htt=
ps://lists.buildroot.org/pipermail/buildroot/2020-June/284219.html">https:/=
/lists.buildroot.org/pipermail/buildroot/2020-June/284219.html</a>=C2=A0</d=
iv></div></div></div>
</div>

--0000000000005c6edf05ef7c23dd--

--===============8581568870536619798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8581568870536619798==--
