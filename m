Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8968C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 20:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F8FA60AB8;
	Mon,  8 Aug 2022 20:39:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F8FA60AB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kYep46ReIHUG; Mon,  8 Aug 2022 20:39:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D0E4607F7;
	Mon,  8 Aug 2022 20:39:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D0E4607F7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31F151BF291
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0614981343
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:39:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0614981343
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d_-Tdc9QEFyt for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 20:39:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0E6D81340
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0E6D81340
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 20:39:11 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-10bd4812c29so11806400fac.11
 for <buildroot@buildroot.org>; Mon, 08 Aug 2022 13:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=89IXjeBMPDeU4BecVjg9j4AjnfOZ1XGSL031gG4XK8k=;
 b=2F9y23vQ4fB+xFP3A0po+lEF8XHxbHvhN9n1lmrOxuW6hBD4REvPFigKYfpvy35AMF
 xVQWxZ3ejQe27UpIcgiPjnipy4OjLiUntZZTfZCX1Ub9JcMpGTlJUJ9lILos+pTOVvey
 JxrI8cTKWNJQgEPEpSYraQFBunwLhyeI1dlRkFa7Dt6qRu9lfkhX6IXzG55voxabgXKW
 47IVAQGF9LTx+yOWwmRNCrED9fGJfWevC9rzZY/TxSC2/AHzpmdBrKUzlWD20BbtHbQ2
 riaiVzrdJX625dSt3cTIVMUuDrc2vnfUGuRY8Q4F5VmowO33cJHYuNvyyJQhVuM0T2q/
 4xiQ==
X-Gm-Message-State: ACgBeo2io3yksG4L1Mr/bzxxwut5UZJG4CzGOkzja6XAqZ7fRgtVp3lR
 4tRGkwIpcZwxNRnqyymrGpJ2gP4bKeSC+erTOcE=
X-Google-Smtp-Source: AA6agR6q1iBGZr2dV44MKnjpNTDFy6bTbzE5lmpkRyDfW2OKe5F58Mrq150jdsY2YzldSbPcdZZcmHTMGvMYhxJFb2I=
X-Received: by 2002:a05:6870:b28a:b0:10f:72f:6c with SMTP id
 c10-20020a056870b28a00b0010f072f006cmr8851652oao.148.1659991150830; Mon, 08
 Aug 2022 13:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220808151402.1694762-1-fontaine.fabrice@gmail.com>
 <20220808223150.704a8822@windsurf>
In-Reply-To: <20220808223150.704a8822@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 8 Aug 2022 22:39:00 +0200
Message-ID: <CAPi7W80GOh-GQzB6u11MG69qn1GLWKT4VEGrkz53S-bofiWr_g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=89IXjeBMPDeU4BecVjg9j4AjnfOZ1XGSL031gG4XK8k=;
 b=S40cWtlnQxcIklrt9yjVfj+PLx4Hc2w1ejVKhy+qSiVMHFTp1tP4ChDt+QQWtayHn6
 /gxjgwAtftQCQKEmNqu9/udgAt5KX+y2Rfcwi+fsCyCFksWccTEDdz+1bjAFpG1QTVG2
 RAnGjd/656Y1e5eLrVTlvrAomnsU+zebUJDDV1zYDBw9omERaD0y0+HSzoxrB1ea/wAy
 eXum/3hm+Vxu9vl53ie3UlVEWyOiNn1b/zGCWcUvkaK+5cfU2jpkZWOBOi5Azy+C5dIu
 ge5Rl3LisKtX23LId8JTA1KKADq6rJ2o9CSHVY2uyDtv388kI97+3h5ztL2qutQwRqQu
 KTLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=S40cWtln
Subject: Re: [Buildroot] [PATCH 1/2] package/serd: bump to version 0.30.14
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2781088106938500871=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2781088106938500871==
Content-Type: multipart/alternative; boundary="000000000000e02a0705e5c0ce74"

--000000000000e02a0705e5c0ce74
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

Le lun. 8 ao=C3=BBt 2022 =C3=A0 22:31, Thomas Petazzoni <thomas.petazzoni@b=
ootlin.com>
a =C3=A9crit :

> Hello Fabrice,
>
> On Mon,  8 Aug 2022 17:14:01 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> >  ifeq ($(BR2_STATIC_LIBS),y)
> > -SERD_CONF_OPTS +=3D --static --no-shared --static-progs
> > +SERD_CONF_OPTS +=3D -Dstatic=3Dtrue
> > +else
> > +SERD_CONF_OPTS +=3D -Dstatic=3Dfalse
> >  endif
>
> The meson-package infra is already doing:
>
>         --default-library=3D$(if $(BR2_STATIC_LIBS),static,shared) \
>
> What is the behavior when both --default-library and -Dstatic are
> combined?
>

If -Dstatic is true, -static will be added to tool_link_args to statically
link executables:

if get_option('static')
tool_link_args +=3D ['-static']
endif

So, indeed, the static option is probably only useful when both shared and
static libraries are built (i.e. with BR2_SHARED_STATIC_LIBS) to force the
tools to be statically linked.
I can drop it if you want.


> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com


Best Regards,

Fabrice

--000000000000e02a0705e5c0ce74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello Thomas,<br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 8 ao=C3=BBt=
 2022 =C3=A0=C2=A022:31, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.peta=
zzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Fabrice,<=
br>
<br>
On Mon,=C2=A0 8 Aug 2022 17:14:01 +0200<br>
Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" target=
=3D"_blank">fontaine.fabrice@gmail.com</a>&gt; wrote:<br>
<br>
&gt;=C2=A0 ifeq ($(BR2_STATIC_LIBS),y)<br>
&gt; -SERD_CONF_OPTS +=3D --static --no-shared --static-progs<br>
&gt; +SERD_CONF_OPTS +=3D -Dstatic=3Dtrue<br>
&gt; +else<br>
&gt; +SERD_CONF_OPTS +=3D -Dstatic=3Dfalse<br>
&gt;=C2=A0 endif<br>
<br>
The meson-package infra is already doing:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --default-library=3D$(if $(BR2_STATIC_LIBS),sta=
tic,shared) \<br>
<br>
What is the behavior when both --default-library and -Dstatic are<br>
combined? <br></blockquote><div><br></div><div>If -Dstatic is true, -static=
 will be added to tool_link_args to s<span class=3D"gmail-pl-s">tatically l=
ink executables</span>:<br></div><div><br></div><div>
<table class=3D"gmail-highlight gmail-tab-size gmail-js-file-line-container=
 gmail-js-code-nav-container gmail-js-tagsearch-file"><tbody><tr><td id=3D"=
gmail-LC123" class=3D"gmail-blob-code gmail-blob-code-inner gmail-js-file-l=
ine"><span class=3D"gmail-pl-k">if</span> <span class=3D"gmail-pl-c1">get_o=
ption</span>(<span class=3D"gmail-pl-s"><span class=3D"gmail-pl-pds">&#39;<=
/span>static<span class=3D"gmail-pl-pds">&#39;</span></span>)</td>
        </tr>
        <tr>
          </tr></tbody></table><table class=3D"gmail-highlight gmail-tab-si=
ze gmail-js-file-line-container gmail-js-code-nav-container gmail-js-tagsea=
rch-file"><tbody><tr><td id=3D"gmail-LC124" class=3D"gmail-blob-code gmail-=
blob-code-inner gmail-js-file-line">    tool_link_args <span class=3D"gmail=
-pl-k">+=3D</span> [<span class=3D"gmail-pl-s"><span class=3D"gmail-pl-pds"=
>&#39;</span>-static<span class=3D"gmail-pl-pds">&#39;</span></span>]</td>
        </tr>
        <tr>
          </tr></tbody></table>  <span class=3D"gmail-pl-k">endif</span>

</div><div>=C2=A0</div><div>So, indeed, the static option is probably only =
useful when both shared and static libraries are built (i.e. with BR2_SHARE=
D_STATIC_LIBS) to force the tools to be statically linked.</div><div>I can =
drop it if you want.<br></div><div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a></blockquote><div><br></div><div>Best Regards,</div><div><=
br></div><div>Fabrice<br></div></div></div>

--000000000000e02a0705e5c0ce74--

--===============2781088106938500871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2781088106938500871==--
