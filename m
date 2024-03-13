Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13973C54791
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 18:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AEBC40232;
	Wed, 13 Mar 2024 18:07:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ez53FTCLJ2gb; Wed, 13 Mar 2024 18:07:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C04340253
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C04340253;
	Wed, 13 Mar 2024 18:07:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 90FD31BF350
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 18:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DDE781F58
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 18:07:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a0rynWo4L6lo for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 18:07:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 792E581B9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 792E581B9A
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 792E581B9A
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 18:07:11 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5d42e7ab8a9so73641a12.3
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 11:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710353230; x=1710958030;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xezmXBWXhZannIJVDA7P6soY9MJPjK5snLoqtOTsVy0=;
 b=fcmBRvPvWMaNUkmQeAUqmkZAfWB3Yy0fG3hiJc9dq92SGowX7kEug/glc2G/Kry/sj
 VnMTOC2cL88jy7UZZzYPoD/A09TSIkOtil+SjTg0Rz72gzn0Eg1FNnJfU6Cwwxphxqd7
 CJx3hN3KDKTiRP6qu2uKN9SVkE9heVurWLlr/TBEXl1Bs+2lrfm6MF11ZyrKAsjgovuF
 Xg0tBJgphwcSQ9v94+5gVZSIZkBtwNmVp9jgN6OC41/2PssuWfThraA4NTHTTs3NiG8e
 H5L0SvzuxtBXajhhc93lTVSIFQp2dK7Dpz1KA6MI41MRfgzZYtNXviOFfMH2ORQs9fzj
 mjgA==
X-Gm-Message-State: AOJu0YwgBtggm+f7lYIM8D1pJcwEl6I9WylQUspiv8yOQCTyi36ah03g
 +ry+ZLzWPNwMazJGaicIlcu4DTOTjTrzz0xIMd2WZzVhCc3yP+2tGSR7kLgGVKnisp8h/46FukH
 XcZRGdV/b58rBW4a0SQDXzWwncWgiV10Ak9lv
X-Google-Smtp-Source: AGHT+IFeOpCnDmgf+4hH3yiEPCdCYZTviwSdTOn3leBrhScbKgLZjXSyIF+55tDgFkpXwbwx+7vIjSoOa8dzh07Y/SM=
X-Received: by 2002:a17:90b:300f:b0:29b:ad27:3310 with SMTP id
 hg15-20020a17090b300f00b0029bad273310mr10403760pjb.22.1710353230166; Wed, 13
 Mar 2024 11:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240313091412.20865-1-francois.perrad@gadz.org>
 <20240313091412.20865-3-francois.perrad@gadz.org> <87il1qqxnj.fsf@tarshish>
In-Reply-To: <87il1qqxnj.fsf@tarshish>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 13 Mar 2024 19:06:59 +0100
Message-ID: <CAAE6iEWMAVwceZA6kdgBhTBu2-SHM3+r6h8OiUZpscX8KgHixA@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1710353230; x=1710958030; darn=busybox.net;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xezmXBWXhZannIJVDA7P6soY9MJPjK5snLoqtOTsVy0=;
 b=SUAAB2FoTJ5Wc613MfLuPGyv6PVZkySKWN/VI9E4/FFmnID/5D6pqILv2tRVsxm3vD
 vpTW+OnaYzdKozSpRCVks5uY3PgffLBT10jtI9clJOX8FFJ8M9TXZ2RjIHI9m9XkJBJI
 dI2FylcIae/Ia8iQ75M/NxFl09E/opnX/j3NHesHsLmEIK7ddxlJN3y6WRrnLZpbyBDm
 AK8Y7Np5KNTmI32NalCuiatY4YrWeLZwrwMsLDk9eoXuY/se7wmqPDuecEzmZYX4q0pu
 P0pAbLfZtixZ61AzPuliGEKNPzxIGx5g8eZux7ONwAM03CHPoq4PdDkHERWZMrt6udBX
 wooQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=SUAAB2Fo
Subject: Re: [Buildroot] [PATCH 03/31] package/dcron: disable busybox crond
 & crontab
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
Cc: buildroot@busybox.net, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5465947538731749174=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5465947538731749174==
Content-Type: multipart/alternative; boundary="000000000000baa1e206138ea432"

--000000000000baa1e206138ea432
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 13 mars 2024 =C3=A0 10:48, Baruch Siach via buildroot <
buildroot@buildroot.org> a =C3=A9crit :

> Hi Francois,
>
> On Wed, Mar 13 2024, Francois Perrad wrote:
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >  package/dcron/dcron.mk | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/package/dcron/dcron.mk b/package/dcron/dcron.mk
> > index f0c3efbf8..d4dd48e77 100644
> > --- a/package/dcron/dcron.mk
> > +++ b/package/dcron/dcron.mk
> > @@ -33,4 +33,9 @@ define DCRON_INSTALL_INIT_SYSTEMD
> >               $(TARGET_DIR)/usr/lib/systemd/system/dcron.service
> >  endef
> >
> > +define DCRON_BUSYBOX_CONFIG_FIXUPS
> > +     $(call KCONFIG_DISABLE_OPT,CONFIG_CROND)
> > +     $(call KCONFIG_DISABLE_OPT,CONFIG_CRONTAB)
> > +endef
>
> Do we still need dcron in BUSYBOX_DEPENDENCIES then?
>
> Same question for other patches in this series.
>
> baruch
>
>
Hi Baruch,

you are right, these kind of dependencies in busybox.mk become useless (the
conflict between the Busybox applet and the full application is gone).

So, I'll remove them in v2.

Fran=C3=A7ois



> > +
> >  $(eval $(generic-package))
>
>
> --
>                                                      ~. .~   Tk Open
> Systems
> =3D}------------------------------------------------ooO--U--Ooo----------=
--{=3D
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000baa1e206138ea432
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 13 mars 2024 =C3=A0=C2=
=A010:48, Baruch Siach via buildroot &lt;<a href=3D"mailto:buildroot@buildr=
oot.org">buildroot@buildroot.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Hi Francois,<br>
<br>
On Wed, Mar 13 2024, Francois Perrad wrote:<br>
&gt; Signed-off-by: Francois Perrad &lt;<a href=3D"mailto:francois.perrad@g=
adz.org" target=3D"_blank">francois.perrad@gadz.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/dcron/<a href=3D"http://dcron.mk" rel=3D"noreferrer" tar=
get=3D"_blank">dcron.mk</a> | 5 +++++<br>
&gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt;<br>
&gt; diff --git a/package/dcron/<a href=3D"http://dcron.mk" rel=3D"noreferr=
er" target=3D"_blank">dcron.mk</a> b/package/dcron/<a href=3D"http://dcron.=
mk" rel=3D"noreferrer" target=3D"_blank">dcron.mk</a><br>
&gt; index f0c3efbf8..d4dd48e77 100644<br>
&gt; --- a/package/dcron/<a href=3D"http://dcron.mk" rel=3D"noreferrer" tar=
get=3D"_blank">dcron.mk</a><br>
&gt; +++ b/package/dcron/<a href=3D"http://dcron.mk" rel=3D"noreferrer" tar=
get=3D"_blank">dcron.mk</a><br>
&gt; @@ -33,4 +33,9 @@ define DCRON_INSTALL_INIT_SYSTEMD<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/us=
r/lib/systemd/system/dcron.service<br>
&gt;=C2=A0 endef<br>
&gt;=C2=A0 <br>
&gt; +define DCRON_BUSYBOX_CONFIG_FIXUPS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_DISABLE_OPT,CONFIG_CROND)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_DISABLE_OPT,CONFIG_CRONTAB)<br>
&gt; +endef<br>
<br>
Do we still need dcron in BUSYBOX_DEPENDENCIES then?<br>
<br>
Same question for other patches in this series.<br>
<br>
baruch<br>
<br></blockquote><div><br></div><div>Hi Baruch,</div><div><br></div><div>yo=
u are right, these kind of dependencies in <a href=3D"http://busybox.mk">bu=
sybox.mk</a> become useless (the conflict between the Busybox applet and th=
e full application is gone).</div><div><br></div><div>So, I&#39;ll remove t=
hem in v2.</div><div><br></div><div>Fran=C3=A7ois<br></div><div><br></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +<br>
&gt;=C2=A0 $(eval $(generic-package))<br>
<br>
<br>
-- <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~. .~=C2=A0 =C2=A0Tk Open Systems<=
br>
=3D}------------------------------------------------ooO--U--Ooo------------=
{=3D<br>
=C2=A0 =C2=A0- <a href=3D"mailto:baruch@tkos.co.il" target=3D"_blank">baruc=
h@tkos.co.il</a> - tel: +972.52.368.4656, <a href=3D"http://www.tkos.co.il"=
 rel=3D"noreferrer" target=3D"_blank">http://www.tkos.co.il</a> -<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--000000000000baa1e206138ea432--

--===============5465947538731749174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5465947538731749174==--
