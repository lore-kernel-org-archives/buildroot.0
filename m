Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498F4C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 12:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94738823A0;
	Wed, 27 Jul 2022 12:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94738823A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vcNRs9v8KjCe; Wed, 27 Jul 2022 12:05:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D59F981CE7;
	Wed, 27 Jul 2022 12:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D59F981CE7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7264C1BF372
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 12:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BE8340A00
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 12:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BE8340A00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NWGQaX5LLX7g for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 12:05:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33F77408EA
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33F77408EA
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 12:05:35 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id r13so20222510oie.1
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 05:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/4fgVqgURuZAh3hJH4HkWnF3+Fuptv4r6I8x5cg9W4I=;
 b=Ktd6lkSDvFoGTHwsVj63XYWoSrP8pDUkLNDFGM4QN5hovYlg13CYUr8vNI0+le/gRn
 ggxeB3xdoJXb5tWMg5K6hHAWidUsir/zYqa/cCiN3WBj7lfr+NYGHEoX7uTJrvg83m5n
 V4hawGGjkwlv20F8Dy2ttHxSw4RpmweLE1CM9gQwdEg4fRDtEy1/3IcqqXGD9ufIPLr6
 nM6Gxj7BbS8fvfR8nO0vA1B6lu1D9x00JC3ygLqPCREgpe3l/grCOHMkWSf10sw5xipf
 Fch8/yM4iSQG/sijfT7+qXQSw7dUy8tGv2NdewPcJJzzBAe4KMzzCjfDJwYVAYrE4cyS
 qSIg==
X-Gm-Message-State: AJIora/kQ9g7/LgZfCeqZBdzr6UIwWNQusVsS/ImQvKvt3ikSU8D/UIy
 lnLLqwE2ZJLelnyPcloAk5xJvI9MTq/gSBTu9Yg=
X-Google-Smtp-Source: AGRyM1taML01t5+SR4BcvCkewhI1B7XTJNeRUMI+TfqyqtlMYlDYT/n0Jz+A2XEra8pddk94qkwyKTaRmJ3bzkZU9uo=
X-Received: by 2002:a05:6808:14d0:b0:33a:a708:e01a with SMTP id
 f16-20020a05680814d000b0033aa708e01amr1580671oiw.148.1658923534073; Wed, 27
 Jul 2022 05:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220108224337.3702128-1-fontaine.fabrice@gmail.com>
 <c1c3040b-d429-dcaf-6e97-5f0c8367b48a@mind.be>
In-Reply-To: <c1c3040b-d429-dcaf-6e97-5f0c8367b48a@mind.be>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 27 Jul 2022 14:05:23 +0200
Message-ID: <CAPi7W82V0nFCRi55MPsHV7DPQFSrGRmy1_mpFAhjj-MEgv6=DA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/4fgVqgURuZAh3hJH4HkWnF3+Fuptv4r6I8x5cg9W4I=;
 b=crnjM9XcQJ7ENp7/k4ANuEh65EgRKNS/FxEjT0lbdQ6ybebS9efbx1cZWMp+5EFH70
 01CgImSftuxl0bQwjKfUpx6NkT6wQ3M2FCNIKfTj3ttkaX9Zt1bUkxdaE2XJXmKAnyfW
 Y3anyhD3E9cf0qnR5rwQRHnDAJRnEvr2negwzausyxkEO+RD0cSMwDFiRJKZK8mbHRLJ
 WGTf5mIUhyA0CHuuY9KwxSDZJnRV7+2aZmjADHswvL/J4tAN0SP0PfIGX9BFWjAlLVUK
 hveejPCgNLresijsPsWQTYAldRjOZpeMv0BPhPwxaV+X9RkXiA+3ObdLj/AA7OhWhQmD
 SPWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=crnjM9Xc
Subject: Re: [Buildroot] [PATCH 1/2] package/minizip: add minizip-zlib
 support
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
Cc: Fabrice Fontaine <fabrice.fontaine@orange.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4682723535004198237=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4682723535004198237==
Content-Type: multipart/alternative; boundary="000000000000f5451005e4c83b3e"

--000000000000f5451005e4c83b3e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnout,

Le mer. 27 juil. 2022 =C3=A0 13:08, Arnout Vandecappelle <arnout@mind.be> a
=C3=A9crit :

>   Hi Fabrice,
>
> On 08/01/2022 23:43, Fabrice Fontaine wrote:
> > Add a virtual package to allow the user to select the minizip provider:
>
>   A virtual package should be used when the alternatives are more or less
> drop-in replacements. Here, however, they are absolutely not: they instal=
l
> completely different header files and libraries. There is no way that
> something
> that expects minizip-ng can build with minizip-zlib or vice versa.
>
>   In addition, the two can be installed in parallel.
>

That's not completely true: minizip(-ng) and minizip-legacy can be
installed in parallel only if compatibility headers are disabled (which is
done since commit fc166894b3f257c4cb20d84368c918f3335dadf5).
Ideally, it would be great to enable back those compatibility headers.
Should I make this new option dependent on !BR2_PACKAGE_MINIZIP_LEGACY
instead of making a virtual package?

>
>
>   So there's no reason at all to make it a virtual package.
>

I decided to make a virtual package because there was already a virtual
package for zlib and zlib-ng.
I thought that we were in the same situation with minizip(-ng) and
minizip-legacy.


>
> >   - the current minizip (which has been renamed minizip-ng since
> >
> https://github.com/zlib-ng/minizip-ng/commit/db95894646b87f6178ceaa389cbd=
b5b1ba8cd97a
> )
>
>   It would make more sense to switch the existing minizip package to this
> new
> upstream repository.
>

Actually, we're already shipping minizip-ng as minizip. However, minizip-ng
is not really widely used by the opensource community. For example,
domoticz only supports minizip-legacy.


>
>   We could rename the package to minizip-ng, but we generally avoid that.
> It's
> just annoyance for people who upgrade buildroot (legacy handling helps,
> but it
> is still annoying), and there is no benefit at all other than
> "consistency".


OK, I can send a v2 which doesn't rename minizip as minizip-ng.


>
> >   - the 'legacy' minizip provided by zlib which is still widely support=
ed
> >     by various opensource packages such as domoticz
>
>   We should just add a package minizip-zlib.
>

>
> > There is no need to add entries in Config.legacy as the previous option=
s
> > are kept and the default provider of minizip is minizip-ng.
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> [snip]
> > diff --git a/package/minizip-zlib/minizip-zlib.mk
> b/package/minizip-zlib/minizip-zlib.mk
> > new file mode 100644
> > index 0000000000..67d4e31f41
> > --- /dev/null
> > +++ b/package/minizip-zlib/minizip-zlib.mk
> > @@ -0,0 +1,24 @@
> >
> +########################################################################=
########
> > +#
> > +# minizip-zlib
> > +#
> >
> +########################################################################=
########
> > +
> > +MINIZIP_ZLIB_VERSION =3D 1.2.11
> > +MINIZIP_ZLIB_SOURCE =3D zlib-$(MINIZIP_ZLIB_VERSION).tar.xz
> > +MINIZIP_ZLIB_SITE =3D http://www.zlib.net
> > +MINIZIP_ZLIB_LICENSE =3D Zlib
> > +MINIZIP_ZLIB_LICENSE_FILES =3D README
> > +MINIZIP_ZLIB_INSTALL_STAGING =3D YES
> > +MINIZIP_ZLIB_PROVIDES =3D minizip
> > +MINIZIP_ZLIB_SUBDIR =3D contrib/minizip
> > +MINIZIP_ZLIB_AUTORECONF =3D YES
>
>   Please add a comment why autoreconf is needed.
>
>   Regards,
>   Arnout
>
> > +MINIZIP_ZLIB_DEPENDENCIES =3D zlib
> > +
> > +ifeq ($(BR2_PACKAGE_MINIZIP_DEMOS),y)
> > +MINIZIP_ZLIB_CONF_OPTS +=3D --enable-demos
> > +else
> > +MINIZIP_ZLIB_CONF_OPTS +=3D --disable-demos
> > +endif
> > +
> > +$(eval $(autotools-package))
> [snip]
>

Best Regards,

Fabrice

--000000000000f5451005e4c83b3e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Arnout,<br></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 27 juil. 2022 =
=C3=A0=C2=A013:08, Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.b=
e" target=3D"_blank">arnout@mind.be</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 Hi Fabrice,<br>
<br>
On 08/01/2022 23:43, Fabrice Fontaine wrote:<br>
&gt; Add a virtual package to allow the user to select the minizip provider=
:<br>
<br>
=C2=A0 A virtual package should be used when the alternatives are more or l=
ess <br>
drop-in replacements. Here, however, they are absolutely not: they install =
<br>
completely different header files and libraries. There is no way that somet=
hing <br>
that expects minizip-ng can build with minizip-zlib or vice versa.<br>
<br>
=C2=A0 In addition, the two can be installed in parallel.<br></blockquote><=
div><br></div><div>That&#39;s not completely true: minizip(-ng) and minizip=
-legacy can be installed in parallel only if compatibility headers are disa=
bled (which is done since commit fc166894b3f257c4cb20d84368c918f3335dadf5).=
</div><div>Ideally, it would be great to enable back those compatibility he=
aders.</div><div> Should I make this new option dependent on !BR2_PACKAGE_M=
INIZIP_LEGACY instead of making a virtual package?<br></div>=C2=A0<blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 So there&#39;s no reason at all to make it a virtual package.<br></b=
lockquote><div><br></div><div><div>I decided to make a virtual package beca=
use there was already a virtual package for zlib and zlib-ng.</div><div>I t=
hought that we were in the same situation with minizip(-ng) and minizip-leg=
acy.<br></div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
&gt;=C2=A0 =C2=A0- the current minizip (which has been renamed minizip-ng s=
ince<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/zlib-ng/minizip-ng/co=
mmit/db95894646b87f6178ceaa389cbdb5b1ba8cd97a" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/zlib-ng/minizip-ng/commit/db95894646b87f6178cea=
a389cbdb5b1ba8cd97a</a>)<br>
<br>
=C2=A0 It would make more sense to switch the existing minizip package to t=
his new <br>
upstream repository.<br></blockquote><div><br></div><div>Actually, we&#39;r=
e already shipping minizip-ng as minizip. However, minizip-ng is not really=
 widely used by the opensource community. For example, domoticz only suppor=
ts minizip-legacy.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
=C2=A0 We could rename the package to minizip-ng, but we generally avoid th=
at. It&#39;s <br>
just annoyance for people who upgrade buildroot (legacy handling helps, but=
 it <br>
is still annoying), and there is no benefit at all other than &quot;consist=
ency&quot;.=C2=A0</blockquote><div><br></div><div>OK, I can send a v2 which=
 doesn&#39;t rename minizip as minizip-ng.<br></div><div>=C2=A0<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0- the &#39;legacy&#39; minizip provided by zlib which is s=
till widely supported<br>
&gt;=C2=A0 =C2=A0 =C2=A0by various opensource packages such as domoticz<br>
<br>
=C2=A0 We should just add a package minizip-zlib.<br></blockquote><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt; There is no need to add entries in Config.legacy as the previous optio=
ns<br>
&gt; are kept and the default provider of minizip is minizip-ng.<br>
&gt; <br>
&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice=
@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
<br>
[snip]<br>
&gt; diff --git a/package/minizip-zlib/<a href=3D"http://minizip-zlib.mk" r=
el=3D"noreferrer" target=3D"_blank">minizip-zlib.mk</a> b/package/minizip-z=
lib/<a href=3D"http://minizip-zlib.mk" rel=3D"noreferrer" target=3D"_blank"=
>minizip-zlib.mk</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..67d4e31f41<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/minizip-zlib/<a href=3D"http://minizip-zlib.mk" rel=3D"n=
oreferrer" target=3D"_blank">minizip-zlib.mk</a><br>
&gt; @@ -0,0 +1,24 @@<br>
&gt; +#####################################################################=
###########<br>
&gt; +#<br>
&gt; +# minizip-zlib<br>
&gt; +#<br>
&gt; +#####################################################################=
###########<br>
&gt; +<br>
&gt; +MINIZIP_ZLIB_VERSION =3D 1.2.11<br>
&gt; +MINIZIP_ZLIB_SOURCE =3D zlib-$(MINIZIP_ZLIB_VERSION).tar.xz<br>
&gt; +MINIZIP_ZLIB_SITE =3D <a href=3D"http://www.zlib.net" rel=3D"noreferr=
er" target=3D"_blank">http://www.zlib.net</a><br>
&gt; +MINIZIP_ZLIB_LICENSE =3D Zlib<br>
&gt; +MINIZIP_ZLIB_LICENSE_FILES =3D README<br>
&gt; +MINIZIP_ZLIB_INSTALL_STAGING =3D YES<br>
&gt; +MINIZIP_ZLIB_PROVIDES =3D minizip<br>
&gt; +MINIZIP_ZLIB_SUBDIR =3D contrib/minizip<br>
&gt; +MINIZIP_ZLIB_AUTORECONF =3D YES<br>
<br>
=C2=A0 Please add a comment why autoreconf is needed.<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; +MINIZIP_ZLIB_DEPENDENCIES =3D zlib<br>
&gt; +<br>
&gt; +ifeq ($(BR2_PACKAGE_MINIZIP_DEMOS),y)<br>
&gt; +MINIZIP_ZLIB_CONF_OPTS +=3D --enable-demos<br>
&gt; +else<br>
&gt; +MINIZIP_ZLIB_CONF_OPTS +=3D --disable-demos<br>
&gt; +endif<br>
&gt; +<br>
&gt; +$(eval $(autotools-package))<br>
[snip]<br></blockquote><div><br></div><div>Best Regards,</div><div><br></di=
v><div>Fabrice<br></div></div></div>

--000000000000f5451005e4c83b3e--

--===============4682723535004198237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4682723535004198237==--
