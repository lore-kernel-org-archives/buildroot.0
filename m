Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A168C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 19:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88AAD40335;
	Sun, 24 Apr 2022 19:50:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oR8vQcVwE7e6; Sun, 24 Apr 2022 19:50:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCB554028E;
	Sun, 24 Apr 2022 19:50:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A1D11BF348
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 19:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 569B581433
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 19:50:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 16QgTgkramIG for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 19:50:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF562813A3
 for <buildroot@busybox.net>; Sun, 24 Apr 2022 19:50:21 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id p10so22844469lfa.12
 for <buildroot@busybox.net>; Sun, 24 Apr 2022 12:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+Uf0x3MwvNVO2yHZHkx1zWEiCn5q1X2TUz/RrR8xPxI=;
 b=0dCVqjrKymweeBaoz4xYHqpdOMjm0FRCYXIGrJlTNtl5Jct0zDWRvhiqIJLj7/B7mu
 nhXt+OEXDj6wY1rMv8BKzLtf97byA/o9zrmpb3RrDKTZyEAfabHyWnB4KzdzUG3xXPiF
 6n7XhV6L1cut+9+xeSjbvW67zOXFhOJXJcuqWrKRR9b84QFWvuUr6qXCSdij2teqZzDS
 fPhChAPpDwaDUCsiKVSrU6n9vxD95RV4XjNujzu8ggGoHN6+0ML2Rsnrjah2foU7b37k
 kNmxvfMzeoQMniiwuJd/Iqb/Z9gMYpI5rVgjDBeMVYM8x4ba08bz+pgG0Bpv3WBvGPBR
 TuTQ==
X-Gm-Message-State: AOAM530uGZqSIkisqz6OJZ3BiCTnwyYirDSjb69Ig9xnHTPWeUnrRURK
 VSzTVKxQM4v/9oTjXlc3MnF0WpNJRJwbtxPfrV731vvEpRw=
X-Google-Smtp-Source: ABdhPJw+9cqHVkvcxUTCcagxAV7GuK0WxiCQE0TghT+zjnNopk37TxoEwig6Skfk4j2UplUjWEJy04tkJ3PU21kwGXc=
X-Received: by 2002:a05:6512:3b9a:b0:471:ad7e:725c with SMTP id
 g26-20020a0565123b9a00b00471ad7e725cmr10699000lfv.415.1650829819444; Sun, 24
 Apr 2022 12:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220424072016.3459504-1-francois.perrad@gadz.org>
 <69a502da-b1f9-b688-092e-59bf594ed6be@mind.be>
In-Reply-To: <69a502da-b1f9-b688-092e-59bf594ed6be@mind.be>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 24 Apr 2022 21:50:08 +0200
Message-ID: <CAB0FRssHJTHubfqVKPr4kPn0U7Wvme7GU5b6036tFCsmNc3v1w@mail.gmail.com>
To: buildroot <buildroot@busybox.net>
Subject: Re: [Buildroot] [PATCH] package/libressl: bump to version 3.5.2
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
Content-Type: multipart/mixed; boundary="===============0050724615466541144=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0050724615466541144==
Content-Type: multipart/alternative; boundary="000000000000f91ad905dd6bc43a"

--000000000000f91ad905dd6bc43a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 24 avr. 2022 =C3=A0 17:05, Arnout Vandecappelle <arnout@mind.be> a
=C3=A9crit :

>
>
> On 24/04/2022 09:20, Francois Perrad wrote:
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >   package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch | 2 +-
> >   package/libressl/Config.in                                  | 2 ++
> >   package/libressl/libressl.hash                              | 2 +-
> >   package/libressl/libressl.mk                                | 2 +-
> >   4 files changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patc=
h
> b/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
> > index 98fe250f6..1c59aec72 100644
> > --- a/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
> > +++ b/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
> > @@ -20,7 +20,7 @@ diff --git a/include/openssl/ssl.h
> b/include/openssl/ssl.h
> >   index 46f24b2ea..4048a6e63 100644
> >   --- a/include/openssl/ssl.h
> >   +++ b/include/openssl/ssl.h
> > -@@ -411,11 +411,7 @@ typedef int (*tls_session_secret_cb_fn)(SSL *s,
> void *secret, int *secret_len,
> > +@@ -408,11 +408,7 @@ typedef int (*tls_session_secret_cb_fn)(SSL *s,
> void *secret, int *secret_len,
> >    #define SSL_OP_NO_TLSv1                                    0x0400000=
0L
> >    #define SSL_OP_NO_TLSv1_2                          0x08000000L
> >    #define SSL_OP_NO_TLSv1_1                          0x10000000L
> > diff --git a/package/libressl/Config.in b/package/libressl/Config.in
> > index 600829cb9..aa42c21a9 100644
> > --- a/package/libressl/Config.in
> > +++ b/package/libressl/Config.in
> > @@ -6,4 +6,6 @@ config BR2_PACKAGE_LIBRESSL_BIN
> >         Install the openssl binary to the target file system. This is
> >         a command line tool for doing various cryptographic stuff.
> >
> > +       https://www.libressl.org/
>
>   Why do you add this? We already have the URL in the top-level choice, i=
n
> package/openssl/Config.in.
>
>
You are right, it is a mistake.

Fran=C3=A7ois


>   Regards,
>   Arnout
>
> > +
> >   endif
> > diff --git a/package/libressl/libressl.hash
> b/package/libressl/libressl.hash
> > index e92399871..c3590798d 100644
> > --- a/package/libressl/libressl.hash
> > +++ b/package/libressl/libressl.hash
> > @@ -1,4 +1,4 @@
> >   # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
> > -sha256
> ff88bffe354818b3ccf545e3cafe454c5031c7a77217074f533271d63c37f08d
> libressl-3.4.3.tar.gz
> > +sha256
> 56feab8e21c3fa6549f8b7d7511658b8e98518162838a795314732654adf3e5f
> libressl-3.5.2.tar.gz
> >   # Locally computed
> >   sha256
> 5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
> > diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.m=
k
> > index 0bb468ced..c9c484d5d 100644
> > --- a/package/libressl/libressl.mk
> > +++ b/package/libressl/libressl.mk
> > @@ -4,7 +4,7 @@
> >   #
> >
>  ########################################################################=
########
> >
> > -LIBRESSL_VERSION =3D 3.4.3
> > +LIBRESSL_VERSION =3D 3.5.2
> >   LIBRESSL_SITE =3D https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
> >   LIBRESSL_LICENSE =3D ISC (new additions), OpenSSL or SSLeay (original
> OpenSSL code)
> >   LIBRESSL_LICENSE_FILES =3D COPYING
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000f91ad905dd6bc43a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. 24 avr. 2022 =C3=A0=C2=
=A017:05, Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout=
@mind.be</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><br>
<br>
On 24/04/2022 09:20, Francois Perrad wrote:<br>
&gt; Signed-off-by: Francois Perrad &lt;<a href=3D"mailto:francois.perrad@g=
adz.org" target=3D"_blank">francois.perrad@gadz.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patc=
h | 2 +-<br>
&gt;=C2=A0 =C2=A0package/libressl/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 2 ++<br>
&gt;=C2=A0 =C2=A0package/libressl/libressl.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A0package/libressl/<a href=3D"http://libressl.mk" rel=3D"nor=
eferrer" target=3D"_blank">libressl.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A04 files changed, 5 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.pat=
ch b/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch<br>
&gt; index 98fe250f6..1c59aec72 100644<br>
&gt; --- a/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch<br>
&gt; +++ b/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch<br>
&gt; @@ -20,7 +20,7 @@ diff --git a/include/openssl/ssl.h b/include/openssl=
/ssl.h<br>
&gt;=C2=A0 =C2=A0index 46f24b2ea..4048a6e63 100644<br>
&gt;=C2=A0 =C2=A0--- a/include/openssl/ssl.h<br>
&gt;=C2=A0 =C2=A0+++ b/include/openssl/ssl.h<br>
&gt; -@@ -411,11 +411,7 @@ typedef int (*tls_session_secret_cb_fn)(SSL *s, =
void *secret, int *secret_len,<br>
&gt; +@@ -408,11 +408,7 @@ typedef int (*tls_session_secret_cb_fn)(SSL *s, =
void *secret, int *secret_len,<br>
&gt;=C2=A0 =C2=A0 #define SSL_OP_NO_TLSv1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x04000000L<br>
&gt;=C2=A0 =C2=A0 #define SSL_OP_NO_TLSv1_2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x08000000L<br>
&gt;=C2=A0 =C2=A0 #define SSL_OP_NO_TLSv1_1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x10000000L<br>
&gt; diff --git a/package/libressl/Config.in b/package/libressl/Config.in<b=
r>
&gt; index 600829cb9..aa42c21a9 100644<br>
&gt; --- a/package/libressl/Config.in<br>
&gt; +++ b/package/libressl/Config.in<br>
&gt; @@ -6,4 +6,6 @@ config BR2_PACKAGE_LIBRESSL_BIN<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Install the openssl binary to the tar=
get file system. This is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a command line tool for doing various=
 cryptographic stuff.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://www.libressl.org/" rel=
=3D"noreferrer" target=3D"_blank">https://www.libressl.org/</a><br>
<br>
=C2=A0 Why do you add this? We already have the URL in the top-level choice=
, in <br>
package/openssl/Config.in.<br>
<br></blockquote><div><br></div><div>You are right, it is a mistake.</div><=
div><br></div><div>Fran=C3=A7ois<br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt; diff --git a/package/libressl/libressl.hash b/package/libressl/libress=
l.hash<br>
&gt; index e92399871..c3590798d 100644<br>
&gt; --- a/package/libressl/libressl.hash<br>
&gt; +++ b/package/libressl/libressl.hash<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt;=C2=A0 =C2=A0# From <a href=3D"https://ftp.openbsd.org/pub/OpenBSD/Libr=
eSSL/SHA256" rel=3D"noreferrer" target=3D"_blank">https://ftp.openbsd.org/p=
ub/OpenBSD/LibreSSL/SHA256</a><br>
&gt; -sha256=C2=A0 ff88bffe354818b3ccf545e3cafe454c5031c7a77217074f533271d6=
3c37f08d=C2=A0 libressl-3.4.3.tar.gz<br>
&gt; +sha256=C2=A0 56feab8e21c3fa6549f8b7d7511658b8e98518162838a79531473265=
4adf3e5f=C2=A0 libressl-3.5.2.tar.gz<br>
&gt;=C2=A0 =C2=A0# Locally computed<br>
&gt;=C2=A0 =C2=A0sha256=C2=A0 5c63613f008f16a9c0025c096bbd736cecf720494d121=
b5c5203e0ec6e5955b1=C2=A0 COPYING<br>
&gt; diff --git a/package/libressl/<a href=3D"http://libressl.mk" rel=3D"no=
referrer" target=3D"_blank">libressl.mk</a> b/package/libressl/<a href=3D"h=
ttp://libressl.mk" rel=3D"noreferrer" target=3D"_blank">libressl.mk</a><br>
&gt; index 0bb468ced..c9c484d5d 100644<br>
&gt; --- a/package/libressl/<a href=3D"http://libressl.mk" rel=3D"noreferre=
r" target=3D"_blank">libressl.mk</a><br>
&gt; +++ b/package/libressl/<a href=3D"http://libressl.mk" rel=3D"noreferre=
r" target=3D"_blank">libressl.mk</a><br>
&gt; @@ -4,7 +4,7 @@<br>
&gt;=C2=A0 =C2=A0#<br>
&gt;=C2=A0 =C2=A0##########################################################=
######################<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -LIBRESSL_VERSION =3D 3.4.3<br>
&gt; +LIBRESSL_VERSION =3D 3.5.2<br>
&gt;=C2=A0 =C2=A0LIBRESSL_SITE =3D <a href=3D"https://ftp.openbsd.org/pub/O=
penBSD/LibreSSL" rel=3D"noreferrer" target=3D"_blank">https://ftp.openbsd.o=
rg/pub/OpenBSD/LibreSSL</a><br>
&gt;=C2=A0 =C2=A0LIBRESSL_LICENSE =3D ISC (new additions), OpenSSL or SSLea=
y (original OpenSSL code)<br>
&gt;=C2=A0 =C2=A0LIBRESSL_LICENSE_FILES =3D COPYING<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--000000000000f91ad905dd6bc43a--

--===============0050724615466541144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0050724615466541144==--
