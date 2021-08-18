Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4658CC4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 07:01:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E446060462
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 07:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E446060462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gadz.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA72C80C49;
	Wed, 18 Aug 2021 07:01:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j6mUnjPjnRHh; Wed, 18 Aug 2021 07:01:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30BBD80C61;
	Wed, 18 Aug 2021 07:01:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 99DCC1BF8B4
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 07:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9411780C61
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 07:01:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fT04GnITplmd for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 07:01:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A518080C49
 for <buildroot@busybox.net>; Wed, 18 Aug 2021 07:01:29 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id z2so2557479lft.1
 for <buildroot@busybox.net>; Wed, 18 Aug 2021 00:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kZ75EXb/L9EwaHOW/U5+VRmCGp3jUqu2v1jQaBzJaqk=;
 b=VecaQ3vJX76aOKhldfz6DdMLkgwN85gP2HSoB+l+uo732lmgBD6TK+vBHl4lwdrSeU
 izlgqo7qw8tq5tYTpbuqF1cXcSeiXJnTtvKplhuvc0zTp/9Y+Wqypr3TiuX1dbpLqxVF
 aHjt8QcRdTfZHEql5OkZ8U2aIubjmcn9qy3wIxg4Mi1r/hv2d0ONWMow24SCQBVxi3lZ
 9R4fEViy+kdHE7hOkDB1pxHh1Rm0jsyteOq54F1tA2/+XzhkcGcRz91MeFLj4qo4UvyD
 qz7wCAWx9y1iX1uOXAXDQzfdcZpl+uulxZbZxpTFSuFYTXf+dUfhKLPfdyC5Wlq3nxZN
 Fyvg==
X-Gm-Message-State: AOAM531dQ8wjzBhisLOl5zSU2ipxnXX3Fs9alRVUhbXV+8eRoEZuI5ek
 kVIK/6wWIOYPEWjMfnGBnODeZjpb7zt44sMw4TIRkWKXRhgjWA==
X-Google-Smtp-Source: ABdhPJwITE7YwXVlOS1/+x1PUST2Zc+BFwUiDOvCW0pfKJyC1LXNpvYuy6LE5EFMcX4JLOtlalvfYsRQVuFiggXNpII=
X-Received: by 2002:a19:ac4c:: with SMTP id r12mr5161016lfc.217.1629270087023; 
 Wed, 18 Aug 2021 00:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210815135249.231896-1-francois.perrad@gadz.org>
 <92ad8dbd-77c2-6a5c-6ca2-b91b5632a1a0@mind.be>
In-Reply-To: <92ad8dbd-77c2-6a5c-6ca2-b91b5632a1a0@mind.be>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 18 Aug 2021 09:01:15 +0200
Message-ID: <CAB0FRssnm9aW6OmD9upQjEz+gLGTZzWs6BawLtkMX4RHOF4w1A@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH] package/vsftpd: fix build with libressl
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
Cc: buildroot <buildroot@busybox.net>
Content-Type: multipart/mixed; boundary="===============4365745098970600938=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============4365745098970600938==
Content-Type: multipart/alternative; boundary="000000000000c7db8f05c9d000db"

--000000000000c7db8f05c9d000db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 17 ao=C3=BBt 2021 =C3=A0 22:55, Arnout Vandecappelle <arnout@mind.b=
e> a
=C3=A9crit :

>
>
> On 15/08/2021 15:52, Francois Perrad wrote:
> > Fixes the following error:
> > ssl.c: In function 'ssl_init':
> > ssl.c:98:18: error: 'SSL_OP_NO_TLSv1_3' undeclared (first use in this
> function); did you mean 'SSL_OP_NO_TLSv1_1'?
> >
> > in ssl.h (libressl), the definition of SSL_OP_NO_TLSv1_3 is under the
> condition LIBRESSL_HAS_TLS1_3 or LIBRESSL_INTERNAL
> >
> > with libopenssl, this definition is unconditional
> >
> > this issue appears with vsftpd 3.0.4
> >
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >  package/vsftpd/vsftpd.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
> > index 8daf07c62..e36ba299c 100644
> > --- a/package/vsftpd/vsftpd.mk
> > +++ b/package/vsftpd/vsftpd.mk
> > @@ -41,7 +41,7 @@ VSFTPD_LIBS +=3D -lpam
> >  endif
> >
> >  define VSFTPD_BUILD_CMDS
> > -     $(TARGET_MAKE_ENV) $(MAKE) CC=3D"$(TARGET_CC)"
> CFLAGS=3D"$(TARGET_CFLAGS)" \
> > +     $(TARGET_MAKE_ENV) $(MAKE) CC=3D"$(TARGET_CC)"
> CFLAGS=3D"$(TARGET_CFLAGS) -DLIBRESSL_HAS_TLS1_3" \
>
>  I don't think this is how the libressl feature flags are supposed to be
> used. I
> think you're supposed to patch opensslfeatures.h before building libressl=
.
> AFAIU, the flags are indented to tell client applications which features
> are
> available in the library, so vsftpd could do something like
>
> #ifdef LIBRESSL_HAS_TLS1_3
> ... do something with SSL_OP_NO_TLSv1_3
> #endif
>
>  So I think a better solution would be to patch libressl to enable the tw=
o
> feature flags (TLS1_3 and DTLS1_2).
>
>  But I could be wrong, of course.
>
>
Arnout,

well, I wrote this PR
https://github.com/libressl-portable/openbsd/pull/124/files

what do you think about it ?

Fran=C3=A7ois

 Regards,
>  Arnout
>
>
> >               LDFLAGS=3D"$(TARGET_LDFLAGS)" LIBS=3D"$(VSFTPD_LIBS)" -C =
$(@D)
> >  endef
> >
> >
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

--000000000000c7db8f05c9d000db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 17 ao=C3=BBt 2021 =C3=A0=
=C2=A022:55, Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arn=
out@mind.be</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><br>
<br>
On 15/08/2021 15:52, Francois Perrad wrote:<br>
&gt; Fixes the following error:<br>
&gt; ssl.c: In function &#39;ssl_init&#39;:<br>
&gt; ssl.c:98:18: error: &#39;SSL_OP_NO_TLSv1_3&#39; undeclared (first use =
in this function); did you mean &#39;SSL_OP_NO_TLSv1_1&#39;?<br>
&gt; <br>
&gt; in ssl.h (libressl), the definition of SSL_OP_NO_TLSv1_3 is under the =
condition LIBRESSL_HAS_TLS1_3 or LIBRESSL_INTERNAL<br>
&gt; <br>
&gt; with libopenssl, this definition is unconditional<br>
&gt; <br>
&gt; this issue appears with vsftpd 3.0.4<br>
&gt; <br>
&gt; Signed-off-by: Francois Perrad &lt;<a href=3D"mailto:francois.perrad@g=
adz.org" target=3D"_blank">francois.perrad@gadz.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/vsftpd/<a href=3D"http://vsftpd.mk" rel=3D"noreferrer" t=
arget=3D"_blank">vsftpd.mk</a> | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/package/vsftpd/<a href=3D"http://vsftpd.mk" rel=3D"norefe=
rrer" target=3D"_blank">vsftpd.mk</a> b/package/vsftpd/<a href=3D"http://vs=
ftpd.mk" rel=3D"noreferrer" target=3D"_blank">vsftpd.mk</a><br>
&gt; index 8daf07c62..e36ba299c 100644<br>
&gt; --- a/package/vsftpd/<a href=3D"http://vsftpd.mk" rel=3D"noreferrer" t=
arget=3D"_blank">vsftpd.mk</a><br>
&gt; +++ b/package/vsftpd/<a href=3D"http://vsftpd.mk" rel=3D"noreferrer" t=
arget=3D"_blank">vsftpd.mk</a><br>
&gt; @@ -41,7 +41,7 @@ VSFTPD_LIBS +=3D -lpam<br>
&gt;=C2=A0 endif<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 define VSFTPD_BUILD_CMDS<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(TARGET_MAKE_ENV) $(MAKE) CC=3D&quot;$(TARGET_CC=
)&quot; CFLAGS=3D&quot;$(TARGET_CFLAGS)&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(TARGET_MAKE_ENV) $(MAKE) CC=3D&quot;$(TARGET_CC=
)&quot; CFLAGS=3D&quot;$(TARGET_CFLAGS) -DLIBRESSL_HAS_TLS1_3&quot; \<br>
<br>
=C2=A0I don&#39;t think this is how the libressl feature flags are supposed=
 to be used. I<br>
think you&#39;re supposed to patch opensslfeatures.h before building libres=
sl.<br>
AFAIU, the flags are indented to tell client applications which features ar=
e<br>
available in the library, so vsftpd could do something like<br>
<br>
#ifdef LIBRESSL_HAS_TLS1_3<br>
... do something with SSL_OP_NO_TLSv1_3<br>
#endif<br>
<br>
=C2=A0So I think a better solution would be to patch libressl to enable the=
 two<br>
feature flags (TLS1_3 and DTLS1_2).<br>
<br>
=C2=A0But I could be wrong, of course.<br>
<br></blockquote><div><br></div><div>Arnout,<br></div><div><br></div><div>w=
ell, I wrote this PR <a href=3D"https://github.com/libressl-portable/openbs=
d/pull/124/files">https://github.com/libressl-portable/openbsd/pull/124/fil=
es</a></div><div><br></div><div>what do you think about it ?<br></div><div>=
=C2=A0</div><div>Fran=C3=A7ois<br></div><div><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
=C2=A0Regards,<br>
=C2=A0Arnout<br>
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LDFLAGS=3D&quot;=
$(TARGET_LDFLAGS)&quot; LIBS=3D&quot;$(VSFTPD_LIBS)&quot; -C $(@D)<br>
&gt;=C2=A0 endef<br>
&gt;=C2=A0 <br>
&gt; <br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@busybox.net" target=3D"_blank">buildroot@busybo=
x.net</a><br>
<a href=3D"http://lists.busybox.net/mailman/listinfo/buildroot" rel=3D"nore=
ferrer" target=3D"_blank">http://lists.busybox.net/mailman/listinfo/buildro=
ot</a><br>
</blockquote></div></div>

--000000000000c7db8f05c9d000db--

--===============4365745098970600938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============4365745098970600938==--
