Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C8CCD37B0
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 17:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C025161512;
	Mon, 18 Sep 2023 17:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C025161512
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D7DpHxfgJUCa; Mon, 18 Sep 2023 17:12:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4F9961514;
	Mon, 18 Sep 2023 17:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4F9961514
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD6861BF31F
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 17:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B68D14074E
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 17:12:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B68D14074E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wbOuz3K3fvWU for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 17:12:37 +0000 (UTC)
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8894B402C3
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 17:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8894B402C3
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1a1fa977667so3081369fac.1
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 10:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695057156; x=1695661956;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xh4K0C0ZF6k6mJilcctX1oSx84lE2Yguq2FPlQcaMd4=;
 b=sK3DSpu3Alxqo32+TKS3Gh9F16FzAFOimMH+xvm4UG5wLlowbg88gNg7NH5RbhUBIZ
 xuoFhNPj+ZPKfY6p1clLlQE9OHgUG3yyf1GPZoonXm4uRr/MMPGGq1GtArU5OxdCAYnG
 wvpqvF9fKbyTXrU3kdW0XM89jt9dIugwyMJEVVm65PPCPIVyd4uB+pz9J8v+s8DzpHtV
 QvbxmjuBatWvTX3XJZ3s/68PATx8KLzhDYyrxoXnpJnBrCyXkVgkNFeii8+7vnn57q5B
 r6BrdldP17k+LnpuF3Bf6gP0y0EjQFgTVcXtacWGyLOs7tCVMtvndR0jo2Yntrr8xieT
 RVBQ==
X-Gm-Message-State: AOJu0YxecSxG6ooAdTVWs4h/iAoLGfCG3QsgAl2N4dkrRzeyVdcvMxwT
 bjAbtoeVhUNK/ZEUUWtSxaT4IIWcFL7xhysBavnHZrHHWq8=
X-Google-Smtp-Source: AGHT+IEkz9sFKv2wMLoBciE+sa7nIMWXjzchUu8TzLzv6o7c0pATwkAynp8PuzIMegNwAD+jMoqvF2UiWK48fu6Deq4=
X-Received: by 2002:a05:6870:219c:b0:1d4:d016:22a3 with SMTP id
 l28-20020a056870219c00b001d4d01622a3mr13612697oae.7.1695057156405; Mon, 18
 Sep 2023 10:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230915222711.899079-1-yanghaobillcheng@gmail.com>
 <20230916131930.GE415981@scaer>
In-Reply-To: <20230916131930.GE415981@scaer>
From: Yanghao Cheng <YanghaoBillCheng@gmail.com>
Date: Mon, 18 Sep 2023 10:12:24 -0700
Message-ID: <CAGnyD8u5_nTq7X0KsL2abetCAnWZhq9McztftMAhq8Ysv5pZsg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695057156; x=1695661956; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xh4K0C0ZF6k6mJilcctX1oSx84lE2Yguq2FPlQcaMd4=;
 b=BMyZkqMedBQrOk86pKc5U6XG0tk0WdQK/JH6mvU3+ZR8vLcruUafwGvq1gENGlzqwC
 F9ftQqkqm3DlP3ify7byXB4x1JhswA+Fr7bZlXbisEUnpLsOAMaJoRLyj6fS1niRMPzc
 XS1/bp/UMFa15Wd5XsVd9uR+MW6CwJp9af+/ytf/BfDEGsiDtyfGertwvq2W/hzdc87M
 nTpyPcNhhkis03mI49p5xedh/DlFnSYl672e1DQbAKPPPUxIF7hREIkJLXKcCY2bY/pl
 CY1urxtFpUebu/TdwfYNOhGZtRN2aunEgOq3zWV9ggep2+Jt/EBdwBvwLqgbynX37jEO
 Jj0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BMyZkqMe
Subject: Re: [Buildroot] [PATCH v3 1/2] package/xserver_xorg-server: fix
 init script conflicts
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
Cc: Yanghao Cheng <yanghao.cheng@aioi-atg.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7189276178340542479=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7189276178340542479==
Content-Type: multipart/alternative; boundary="000000000000ae7cb80605a53fc7"

--000000000000ae7cb80605a53fc7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you!

This is my first time submitting a patch, and I am happy to see that it's
committed.
I added the maintenance branch to the patch per the buildroot manual, but I
think I lost it when I reworked the patch for changes.
The maintenance branch I am on is 2023.02.x

Best,
Yanghao

On Sat, Sep 16, 2023 at 6:19=E2=80=AFAM Yann E. MORIN <yann.morin.1998@free=
.fr>
wrote:

> Yanghao Cheng, All,
>
> On 2023-09-15 15:27 -0700, Yanghao Cheng spake thusly:
> > From: Yanghao Cheng <yanghao.cheng@aioi-atg.com>
> >
> > xdm package also installs a init script that utimately starts X server
> >
> > Signed-off-by: Yanghao Cheng <yanghao.cheng@aioi-atg.com>
> > ---
> > Changes v1 -> v2:
> >     - Simplify the condition per Thomas's suggestion
> >
> > Changes v2 -> v3: (Suggested by Yann)
> >       - Revert indent added in original patch
> >       - Keep the original number of patches
> >
> >  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> > index 593bbd4276..0390519d6a 100644
> > --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> > +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> > @@ -181,8 +181,9 @@ define XSERVER_XORG_SERVER_INSTALL_INIT_SYSTEMD
> >               $(TARGET_DIR)/usr/lib/systemd/system/xorg.service
> >  endef
> >
> > -# init script conflicts with S90nodm
> > -ifneq ($(BR2_PACKAGE_NODM),y)
> > +# init script conflicts with S90nodm and S99xdm
> > +ifeq ($(or $(BR2_PACKAGE_NODM), $(BR2_PACKAGE_XAPP_XDM)),)
>
> As Thomas mentioned, in this situation, we do not use $(or ...), but we
> just concatenate the values:
>
>     ifeq ($(BR2_PACKAGE_NODM)$(BR2_PACKAGE_XAPP_XDM),)
>     ...
>
> > +# Install the init script only when nodm nor xdm aren't enabled
>
> I slightly reworded the comment, bcasue it did not make much sense to
> have two similar comments, one outsode, the other inside the conditional
> block.
>
> I did the same in the systemd-related change in patch 2.
>
> Both applied to master, thanks.
>
> Regards,
> Yann E. MORIN.
>
> >  define XSERVER_XORG_SERVER_INSTALL_INIT_SYSV
> >       $(INSTALL) -D -m 755 package/x11r7/xserver_xorg-server/S40xorg \
> >               $(TARGET_DIR)/etc/init.d/S40xorg
> > --
> > 2.25.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
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

--000000000000ae7cb80605a53fc7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thank you!</div><div dir=3D"ltr"><br></di=
v><div dir=3D"ltr">This is my first time submitting a patch, and I am happy=
 to see that it&#39;s committed.</div><div>I added the maintenance=C2=A0bra=
nch to the patch per the buildroot manual, but I think I lost it when I rew=
orked the patch for changes.=C2=A0<br>The maintenance branch I am on is 202=
3.02.x</div><div><br></div><div>Best,</div><div>Yanghao</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 16, 2023=
 at 6:19=E2=80=AFAM Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@fre=
e.fr">yann.morin.1998@free.fr</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Yanghao Cheng, All,<br>
<br>
On 2023-09-15 15:27 -0700, Yanghao Cheng spake thusly:<br>
&gt; From: Yanghao Cheng &lt;<a href=3D"mailto:yanghao.cheng@aioi-atg.com" =
target=3D"_blank">yanghao.cheng@aioi-atg.com</a>&gt;<br>
&gt; <br>
&gt; xdm package also installs a init script that utimately starts X server=
<br>
&gt; <br>
&gt; Signed-off-by: Yanghao Cheng &lt;<a href=3D"mailto:yanghao.cheng@aioi-=
atg.com" target=3D"_blank">yanghao.cheng@aioi-atg.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes v1 -&gt; v2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Simplify the condition per Thomas&#39;s suggestio=
n<br>
&gt; <br>
&gt; Changes v2 -&gt; v3: (Suggested by Yann)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- Revert indent added in original patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- Keep the original number of patches<br>
&gt; <br>
&gt;=C2=A0 package/x11r7/xserver_xorg-server/<a href=3D"http://xserver_xorg=
-server.mk" rel=3D"noreferrer" target=3D"_blank">xserver_xorg-server.mk</a>=
 | 5 +++--<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/x11r7/xserver_xorg-server/<a href=3D"http://xserv=
er_xorg-server.mk" rel=3D"noreferrer" target=3D"_blank">xserver_xorg-server=
.mk</a> b/package/x11r7/xserver_xorg-server/<a href=3D"http://xserver_xorg-=
server.mk" rel=3D"noreferrer" target=3D"_blank">xserver_xorg-server.mk</a><=
br>
&gt; index 593bbd4276..0390519d6a 100644<br>
&gt; --- a/package/x11r7/xserver_xorg-server/<a href=3D"http://xserver_xorg=
-server.mk" rel=3D"noreferrer" target=3D"_blank">xserver_xorg-server.mk</a>=
<br>
&gt; +++ b/package/x11r7/xserver_xorg-server/<a href=3D"http://xserver_xorg=
-server.mk" rel=3D"noreferrer" target=3D"_blank">xserver_xorg-server.mk</a>=
<br>
&gt; @@ -181,8 +181,9 @@ define XSERVER_XORG_SERVER_INSTALL_INIT_SYSTEMD<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/us=
r/lib/systemd/system/xorg.service<br>
&gt;=C2=A0 endef<br>
&gt;=C2=A0 <br>
&gt; -# init script conflicts with S90nodm<br>
&gt; -ifneq ($(BR2_PACKAGE_NODM),y)<br>
&gt; +# init script conflicts with S90nodm and S99xdm<br>
&gt; +ifeq ($(or $(BR2_PACKAGE_NODM), $(BR2_PACKAGE_XAPP_XDM)),)<br>
<br>
As Thomas mentioned, in this situation, we do not use $(or ...), but we<br>
just concatenate the values:<br>
<br>
=C2=A0 =C2=A0 ifeq ($(BR2_PACKAGE_NODM)$(BR2_PACKAGE_XAPP_XDM),)<br>
=C2=A0 =C2=A0 ...<br>
<br>
&gt; +# Install the init script only when nodm nor xdm aren&#39;t enabled<b=
r>
<br>
I slightly reworded the comment, bcasue it did not make much sense to<br>
have two similar comments, one outsode, the other inside the conditional<br=
>
block.<br>
<br>
I did the same in the systemd-related change in patch 2.<br>
<br>
Both applied to master, thanks.<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt;=C2=A0 define XSERVER_XORG_SERVER_INSTALL_INIT_SYSV<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 755 package/x11r7/xserver_x=
org-server/S40xorg \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/et=
c/init.d/S40xorg<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
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

--000000000000ae7cb80605a53fc7--

--===============7189276178340542479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7189276178340542479==--
