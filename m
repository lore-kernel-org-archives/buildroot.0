Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD110C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 11:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82D1240918;
	Sat, 12 Mar 2022 11:12:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mbEdUqgSGh_g; Sat, 12 Mar 2022 11:12:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92EAD408E1;
	Sat, 12 Mar 2022 11:12:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB2E71BF34A
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 11:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6D32408E1
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 11:12:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 41Gjm-DZZ45k for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 11:12:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F3BA408DE
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 11:12:25 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id i8so16619519wrr.8
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 03:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QUGac+oXLilYA8RA3Z40XlrQfXzimptRnFX6z40aewo=;
 b=Y+RuqKoiM3CwPlZm6zJ5m730dsKuBXAIApFJu/Mm3ksLertiz1QGtgQUg80A5Ez5sq
 701vRkyS8Y6WeGknXGXfafb8a705nn+P8Q4Qm88I0U0WaXl42Yr7cd2i4pBXq4RvYpsL
 uwfToLJHoyBfgOrEM/Ud2FTBxSrKplQs2nPSPtQsNYoV1k+8yucZp1psiVbeJtIcE5xr
 YQKMD4qVd9juPVb5xx/M7zkjzV5PXBEeJjYquDZzTzFMA6eHODZO3bQb4BbPTiSojQbr
 +IObctbgxzMtDFK9LPFLv9IqWIktKyNDHIlQvi9SDD+Xk9u/EuOS6PYfXzCiJKxotAdo
 p1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QUGac+oXLilYA8RA3Z40XlrQfXzimptRnFX6z40aewo=;
 b=c+yecPyOFBhB45b+jeSHRL+toEk92gfAbYjrtvD8a2oSiOEAn3+2ASPe1liggYSjC1
 jZ+LZ6Yv8nHpWolfDNCyCQ7wL0ZagqSnVcyQlL2/H+zi74db0OHwkZ5xnyulZMI4+o5y
 vmUY6DXPiK6zyXbK6p/ggpPNTt1RgvtK/qlDAv9C3q4CJDsoABuS6TEpU8SH40//zViG
 J4woztXfb7neMSQF5zAbQy2Mk8Md+eFnD8BusSiUKnro/HpEn35LJtcJmSEmnVUGz5Hj
 8ViktGizBxvUXdjB34BggonevxQqcfI1ClAwLSY+dnAawlOXUKkVSUfeiiHJoIjOTKDT
 Fojg==
X-Gm-Message-State: AOAM5331BjwOkdObgC/16SR7PQgHE5+Qo8QGD8CPJoO/k6/dBI2yWz8r
 eo1RfTspN3EektuUm8PHHDng1XU+dQPzvF9Ks5WjrCGA7WpgyDEYdKA=
X-Google-Smtp-Source: ABdhPJzHHY0wpT1i07M/roitiUjLweZZM2+anyZe2B/Spw0HCbrJQWw3kj+amxYM/bd2RbEs0JfmFx73Maae4ic67yQ=
X-Received: by 2002:adf:f70f:0:b0:1f1:dfb1:ab68 with SMTP id
 r15-20020adff70f000000b001f1dfb1ab68mr10274006wrp.439.1647083543175; Sat, 12
 Mar 2022 03:12:23 -0800 (PST)
MIME-Version: 1.0
References: <CAHnHX5hroE_7UO1ZftG4VktkSOTCj6u6W7bRM-sBpe8WBM+_oA@mail.gmail.com>
 <8db51f93-0b22-57b3-5a99-a4199277ea91@163.com>
In-Reply-To: <8db51f93-0b22-57b3-5a99-a4199277ea91@163.com>
From: Mohd Faiz Rohani <mohd.faiz.rohani@gmail.com>
Date: Sat, 12 Mar 2022 19:12:11 +0800
Message-ID: <CAHnHX5jZ7-4PjGh0FHyU8rJrFMKuGnjjowFB1uTytpaCeofWOQ@mail.gmail.com>
To: TIAN Yuanhao <tianyuanhao3@163.com>
Subject: Re: [Buildroot] User and Group Utility in Buildroot
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4203216286624184251=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4203216286624184251==
Content-Type: multipart/alternative; boundary="00000000000081a49705da038569"

--00000000000081a49705da038569
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 11, 2022 at 8:47 PM TIAN Yuanhao <tianyuanhao3@163.com> wrote:

> These tools seem to come from _shadow_, which Buildroot doesn't have.
>

   Thank you for the information.  I have read the buildroot user manual
and found out that users and groups are created with the
BR2_ROOTFS_USERS_TABLES. The format can be found at section 9.6 of the
Buildroot manual.
Thanks.
Faiz


> Thanks,
> Yuanhao
> On 3/10/22 23:10, Mohd Faiz Rohani wrote:
> > Hi Guys
> >
> > I need help here. I could not find the correct utils for the Linux
> > user and group management (useradd groupadd etc. etc.) in the
> > Buildroot packages. Can anyone show me which utils I need to select in
> > order to activate this?. Fyi I'm using buildroot-2022.02-rc3.
> >
> > Thank you
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
>

--00000000000081a49705da038569
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 11, 2022 at 8:47 PM TIAN =
Yuanhao &lt;<a href=3D"mailto:tianyuanhao3@163.com">tianyuanhao3@163.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The=
se tools seem to come from _shadow_, which Buildroot doesn&#39;t have.<br><=
/blockquote><div><br></div><div>=C2=A0 =C2=A0Thank you for the information.=
=C2=A0 I have read the buildroot user manual and found out that users and g=
roups are created with the BR2_ROOTFS_USERS_TABLES. The=C2=A0format can be =
found at section 9.6 of the Buildroot manual.</div><div>Thanks.</div><div>F=
aiz</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
Yuanhao<br>
On 3/10/22 23:10, Mohd Faiz Rohani wrote:<br>
&gt; Hi Guys<br>
&gt;<br>
&gt; I need help here. I could not find=C2=A0the correct utils for the Linu=
x <br>
&gt; user and group management (useradd groupadd etc. etc.) in the <br>
&gt; Buildroot packages. Can anyone show me which utils I need to select in=
 <br>
&gt; order to activate this?. Fyi I&#39;m using buildroot-2022.02-rc3.<br>
&gt;<br>
&gt; Thank you<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
<br>
</blockquote></div></div>

--00000000000081a49705da038569--

--===============4203216286624184251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4203216286624184251==--
