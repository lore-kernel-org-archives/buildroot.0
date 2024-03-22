Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1A6C6FD1F
	for <buildroot@archiver.kernel.org>; Fri, 22 Mar 2024 00:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 253B280B33;
	Fri, 22 Mar 2024 00:12:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9xU05ujVDVKR; Fri, 22 Mar 2024 00:12:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D3D181EE9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D3D181EE9;
	Fri, 22 Mar 2024 00:12:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2EB921BF3AF
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 00:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 284AB81EE9
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 00:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qjil_iDfW6bd for <buildroot@lists.busybox.net>;
 Fri, 22 Mar 2024 00:12:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB45180B33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB45180B33
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB45180B33
 for <buildroot@buildroot.org>; Fri, 22 Mar 2024 00:12:35 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-db3a09e96daso1403371276.3
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 17:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711066354; x=1711671154;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NJ2/9gX1NPDthQeXlXmpqdY6rQtPVTGvmeKnyOqYkGY=;
 b=sizGQ3NbxlQ0cOO/p1N2erDWtYt+4ygTtRr6YR6l6SGsrl9FtOppcoG7qp/49mzVzp
 y8eaWR5gDLx19VDhtOP82yS8Z3ctQvk7ptEpwYshgTNge2cnmJFyHnGUQyuZTcB8DV9h
 NPaBkT4p7sdBcORsqlgppMO9TJiBS6Z/VXq+mdM58JZgRK7PEd7V70TJkpVJxloXC/lT
 PSg/7ygWcULL4gYAqLHCiBbirOEfrH+LEA+jOmgXJ+1BMbFkF3G63jVQwyvfVJ5vMslf
 ck3+rM2TDV7LmI2o5k34I9WYTjagYkif/7nYA6Zxkl9LSgecTV+96b7DOcLOq7N1W0t9
 TjXQ==
X-Gm-Message-State: AOJu0YycbSlcmwQuKEn8epfjTQeiM4Aze4hryO/usKExjxz8lgWtUiLQ
 TaP8KW9ZUEd8EqQm1mz7dYiyd6p5c9azlyr0EHknNKoRQalgitSdl7TppcTDjHd+S4kgLn98jh3
 0Ot59dYWY/wrvftAMZVCCOT00m+uBL/SCirGrKw==
X-Google-Smtp-Source: AGHT+IG2cm0xxrDHLwQv0cqQhJ0f4NISr7r6bmbY9ZPHEvttpAW/89Jf/hzz0L7MambEgBgARuWdjLGgX+by3JKQ1zM=
X-Received: by 2002:a25:df4d:0:b0:dcd:65fa:ea06 with SMTP id
 w74-20020a25df4d000000b00dcd65faea06mr762978ybg.24.1711066354262; Thu, 21 Mar
 2024 17:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAMV0Ro8PH6Q4FJfv6OUXpxDPHCNEXt4b3N7_sRLP-RpH07s_bg@mail.gmail.com>
 <0609b565-6298-407c-b7b1-2d32424c802b@mind.be>
In-Reply-To: <0609b565-6298-407c-b7b1-2d32424c802b@mind.be>
From: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Thu, 21 Mar 2024 17:12:08 -0700
Message-ID: <CAMV0Ro_Fo3QLHk4RcDxUsjdQHUWFi2LYb6+wRnDyOK+7hPOCDA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711066354; x=1711671154; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NJ2/9gX1NPDthQeXlXmpqdY6rQtPVTGvmeKnyOqYkGY=;
 b=Gr1Z3tu0bcc1xogLmOJQYblCQzgYtrEvJD1WjBbVNF9+k+J7187N+xWsJTUpvKQ/Ca
 5AyfBaALWQa6jSuZfp3TVnS64ThqzhiVd5Pq9l5gY7IsqumHSvtJ+kKGkmahCK1PLiu4
 zhSiAhWgjTzXGV6JUYzb3a7+bS0LQFBVCxxmoek5MY+CnqFLUHg3ndvbYEbA6wF1hejC
 R3F8N5G0JQFkUSQFW1WqnqRoRiwBD/RiPJRnRCs+qQHzNVfjHl/bEMXJxzcoX/chJZbT
 J/1uM26SQ4afk4Os9GiaCjbqmmAV3RNWZSxch41IiBAv7R0ML0jJjaeAddhFeAjxYsdh
 g90g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Gr1Z3tu0
Subject: Re: [Buildroot] AUH (auto-upgrade-helper) for the Buildroot
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
Content-Type: multipart/mixed; boundary="===============2778917266090193471=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2778917266090193471==
Content-Type: multipart/alternative; boundary="0000000000003bac84061434ae22"

--0000000000003bac84061434ae22
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnout,

Thank you for providing such a comprehensive response.

On Wed, Mar 20, 2024 at 10:21=E2=80=AFAM Arnout Vandecappelle <arnout@mind.=
be>
wrote:

>
>
> On 19/03/2024 22:02, Akhilesh Nema wrote:
> > Hi Buildroot Experts,
> >
> > Around 80% of the commits on the Buildroot involve package upgrades.
> > (As of March 18, 2024)
> > Total number of commits on the br master         - 71554
> > Total number of commits on the package folder - 57305
> >
> > Yocto has an AUH tool to perform trivial upgrades.
>
>   I believe in Yocto, AUH is only used to help people preparing patches.
> The
> update is not actually performed automatically, right? The only thing tha=
t
> happens automatically is that there's a server that runs AUH (weekly IIRC=
)
> and
> sends the results (including patches) to the mailing list.
>
Yes, it seems that  the Yocto Server is running it bi-weekly, and patches
are submitted to the mailing-list/patchwork for review.
https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D&submitte=
r=3D&state=3D*&q=3DAUH&archive=3Dboth&delegate=3D

Update is not performed automatically.


>   For sure, in Buildroot, we don't want fully automatic package bumps. We
> definitely want all package bumps to be runtime tested by someone!
>
>   That said, something that helps prepare an update is certainly welcome.
>
>
> > It would be great if AUH (
> https://git.yoctoproject.org/auto-upgrade-helper
> > <https://git.yoctoproject.org/auto-upgrade-helper>) will be available
> for the
> > Buildroot. Is there a plan to support AUH or a similar tool on Buildroo=
t?
>
>   The existing yocto tool is certainly not going to work as is, it relies
> on a
> bunch of OpenEmbedded specific features (like devtool).
>
>   The way this should work in Buildroot context is probably:
>
> - a util (in utils/ directory) that uses release-monitoring to find out
> the
> latest version of a package, and that updates the .mk and .hash files
> accordingly. It could perhaps also write a commit message.
>
> - a tool that completes the update flow for a (set of) packages by also
> running
> make legal-info on them, and running br-test-pkg and checkpackage. Ideall=
y
> also
> the runtime tests for that package, though it may be difficult to find
> them.
> Note that this tool will still need to get a config fragment as input,
> because
> br-test-pkg requires it.
>
>   With that in place, we could install a cron job on a server somewhere t=
o
> regularly perform this. But, as said before, the patches would still need
> to be
> runtime tested!
>
These are great ideas. I hope to see AUH port added to Buildroot soon.

Still there are some packages without a mapping on release-monitoring.org
(327, source - http://autobuild.buildroot.org/stats/master.html)
Some of the mappings are broken. (for example
https://release-monitoring.org/project/21837/.)
Buildroot may also apply an alternate (or supplement) method similar to the
one used by Yocto to check the availability of a new version.
https://github.com/openembedded/openembedded-core/blob/master/meta/lib/oe/r=
ecipeutils.py#L1012

>
>   Regards,
>   Arnout
>
>
> >
> > The usage of AUH can be found here -
> >
> https://docs.yoctoproject.org/dev-manual/upgrading-recipes.html#using-the=
-auto-upgrade-helper-auh
> <
> https://docs.yoctoproject.org/dev-manual/upgrading-recipes.html#using-the=
-auto-upgrade-helper-auh
> >
> >
> > Benefits of this tool are self explanatory.
> >
> > Thanks
> > Akhilesh
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot


Thanks
Akhilesh

--0000000000003bac84061434ae22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Arnout,</div><div dir=3D"ltr"><br></di=
v><div>Thank you for providing such a comprehensive response.</div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 20=
, 2024 at 10:21=E2=80=AFAM Arnout Vandecappelle &lt;<a href=3D"mailto:arnou=
t@mind.be">arnout@mind.be</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><br>
<br>
On 19/03/2024 22:02, Akhilesh Nema wrote:<br>
&gt; Hi Buildroot Experts,<br>
&gt; <br>
&gt; Around 80% of the commits on the Buildroot involve package upgrades.<b=
r>
&gt; (As of March 18, 2024)<br>
&gt; Total number of commits on the br master=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0- 71554<br>
&gt; Total number of commits on the package folder - 57305<br>
&gt; <br>
&gt; Yocto has an AUH tool to perform trivial upgrades.<br>
<br>
=C2=A0 I believe in Yocto, AUH is only used to help people preparing patche=
s. The <br>
update is not actually performed automatically, right? The only thing that =
<br>
happens automatically is that there&#39;s a server that runs AUH (weekly II=
RC) and <br>
sends the results (including patches) to the mailing list.<br></blockquote>=
<div>Yes, it seems that=C2=A0 the Yocto Server is running it bi-weekly, and=
 patches are submitted to the mailing-list/patchwork for review.</div><div>=
<a href=3D"https://patchwork.yoctoproject.org/project/oe-core/list/?series=
=3D&amp;submitter=3D&amp;state=3D*&amp;q=3DAUH&amp;archive=3Dboth&amp;deleg=
ate=3D">https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D&=
amp;submitter=3D&amp;state=3D*&amp;q=3DAUH&amp;archive=3Dboth&amp;delegate=
=3D</a><br></div><div>=C2=A0</div><div>Update is not performed automaticall=
y.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 For sure, in Buildroot, we don&#39;t want fully automatic package bu=
mps. We <br>
definitely want all package bumps to be runtime tested by someone!<br>
<br>
=C2=A0 That said, something that helps prepare an update is certainly welco=
me.<br>
<br>
<br>
&gt; It would be great if AUH (<a href=3D"https://git.yoctoproject.org/auto=
-upgrade-helper" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproj=
ect.org/auto-upgrade-helper</a> <br>
&gt; &lt;<a href=3D"https://git.yoctoproject.org/auto-upgrade-helper" rel=
=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/auto-upgrade=
-helper</a>&gt;) will be available for the <br>
&gt; Buildroot. Is there a plan to support AUH or a similar tool on Buildro=
ot?<br>
<br>
=C2=A0 The existing yocto tool is certainly not going to work as is, it rel=
ies on a <br>
bunch of OpenEmbedded specific features (like devtool).<br>
<br>
=C2=A0 The way this should work in Buildroot context is probably:<br>
<br>
- a util (in utils/ directory) that uses release-monitoring to find out the=
 <br>
latest version of a package, and that updates the .mk and .hash files <br>
accordingly. It could perhaps also write a commit message.<br>
<br>
- a tool that completes the update flow for a (set of) packages by also run=
ning <br>
make legal-info on them, and running br-test-pkg and checkpackage. Ideally =
also <br>
the runtime tests for that package, though it may be difficult to find them=
. <br>
Note that this tool will still need to get a config fragment as input, beca=
use <br>
br-test-pkg requires it.<br>
<br>
=C2=A0 With that in place, we could install a cron job on a server somewher=
e to <br>
regularly perform this. But, as said before, the patches would still need t=
o be <br>
runtime tested!<br></blockquote><div>These are great ideas. I=C2=A0hope to =
see AUH port added to Buildroot soon.<br></div><div><br></div><div>Still th=
ere are some packages without a mapping on <a href=3D"http://release-monito=
ring.org">release-monitoring.org</a> (327, source - <a href=3D"http://autob=
uild.buildroot.org/stats/master.html">http://autobuild.buildroot.org/stats/=
master.html</a>)<br></div><div>Some of the mappings are broken. (for exampl=
e <a href=3D"https://release-monitoring.org/project/21837/">https://release=
-monitoring.org/project/21837/</a>.)<br>Buildroot may also apply an alterna=
te (or supplement) method similar to the one used by Yocto to check the ava=
ilability of a new version.<br><a href=3D"https://github.com/openembedded/o=
penembedded-core/blob/master/meta/lib/oe/recipeutils.py#L1012">https://gith=
ub.com/openembedded/openembedded-core/blob/master/meta/lib/oe/recipeutils.p=
y#L1012</a><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
<br>
&gt; <br>
&gt; The usage of AUH can be found here - <br>
&gt; <a href=3D"https://docs.yoctoproject.org/dev-manual/upgrading-recipes.=
html#using-the-auto-upgrade-helper-auh" rel=3D"noreferrer" target=3D"_blank=
">https://docs.yoctoproject.org/dev-manual/upgrading-recipes.html#using-the=
-auto-upgrade-helper-auh</a> &lt;<a href=3D"https://docs.yoctoproject.org/d=
ev-manual/upgrading-recipes.html#using-the-auto-upgrade-helper-auh" rel=3D"=
noreferrer" target=3D"_blank">https://docs.yoctoproject.org/dev-manual/upgr=
ading-recipes.html#using-the-auto-upgrade-helper-auh</a>&gt;<br>
&gt; <br>
&gt; Benefits of this tool are self explanatory.<br>
&gt; <br>
&gt; Thanks<br>
&gt; Akhilesh<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a></blockquote><div class=3D"gmail_quote"><br></div>Thanks<b=
r><div>Akhilesh=C2=A0</div></div></div>

--0000000000003bac84061434ae22--

--===============2778917266090193471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2778917266090193471==--
