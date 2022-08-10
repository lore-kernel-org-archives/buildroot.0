Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40D8C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 21:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EE4682919;
	Wed, 10 Aug 2022 21:28:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EE4682919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UivKdOxuE4mf; Wed, 10 Aug 2022 21:28:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEB22827C6;
	Wed, 10 Aug 2022 21:28:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEB22827C6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8CFBD1BF40E
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 21:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 684D8827C6
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 21:28:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 684D8827C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FmgIUbVz--CU for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 21:28:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FE4C827BB
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FE4C827BB
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 21:28:00 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id c185so19226529oia.7
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 14:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=LV9qx88Ev8Lb3+llhg/lqB9uNoH26kFnUp9iXYZaewY=;
 b=KP2HuEZ9NYfI1xMfeAGueEsuG4rr+kl7pWn/yLc1jR94pk27uK6x27PRImC9wkNUkZ
 2IFEkgdbOoQSz1RREKUV/DIEONSb7o4bpVi/gU9W5tF1msdlvsQUghaI6Meu+qYGNpOx
 1kPlc3PdbbWomn8GEFkijbFDicHsmYwZNuea8Ebutgv+ZySxkVWgN+l5Wnfh0PDOMwCv
 D6GwKBm69AUSuwAxAHWnWMhaDu5Vqvi42cBlbjT5mT0KoU6ibaeH5zcjArIFbqG9ced4
 Be8YHy3+6mp2IfDzXlPEKluIJ14ArglBTAtseroI0imdehGmn0w85wNXusEjMG9mRJt/
 XTEg==
X-Gm-Message-State: ACgBeo3TSWZ4UjDrNgKnaK2wH0tL8NTNmd+AsFF62zkNeHFstgaOkxuG
 bFZN+J2nGfJfYwHnGuDVfQ/yjJaM+tGO6IkKSK+ohVupeJ8=
X-Google-Smtp-Source: AA6agR5twEjhAOTLc0fDWWSv/tXkaEK7ZLSh3vLupJ4yjEcg6tSea6wtsmj/kL9W0Z12sVWqwo1itr4z7ktQxLtmybw=
X-Received: by 2002:a05:6808:1584:b0:343:2404:6b9f with SMTP id
 t4-20020a056808158400b0034324046b9fmr2131005oiw.148.1660166879465; Wed, 10
 Aug 2022 14:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220809211837.2549340-1-fontaine.fabrice@gmail.com>
 <20220810232202.7615c1fc@windsurf>
In-Reply-To: <20220810232202.7615c1fc@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 10 Aug 2022 23:27:48 +0200
Message-ID: <CAPi7W81GFR6meymPKU4qAOZ48ZU9eF+M3dTE4mbbGRBhY9wZ-Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=LV9qx88Ev8Lb3+llhg/lqB9uNoH26kFnUp9iXYZaewY=;
 b=hoSmE8dMeFy+v10Zkp3ZRAc2adDWjjHhfpqAzL6SLjpCpnYwIGIs+p/GSiBdpd7a3h
 JwEdYaovhOY53o0DZGjXXRUb2v4/9BgYk274T19K6Dliy6DNq9QJjoCNSlCrPkGL8uyC
 wnj8BE6nCpdeVQNWvytOT1uZ6ETn7jJ+gPEDzvuENgkPYJmVGaot8Gtus8YBszh8tnrd
 3OoSE8YXk8ySxrgAFyKV8v0jCDQPu/ZhvmtGv+BhqMJeqQ8NJCmfkr5+MyFUus4EjLQu
 rLOXQ+ihSdedFDRIOJNNF2kxTxHwtRQHHxr1tj2k3tenE6aRTXpeLxjyGCaF9BILw/JM
 b/mw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hoSmE8dM
Subject: Re: [Buildroot] [PATCH 1/1] package/glog: fix build without threads
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
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3241363047391580800=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3241363047391580800==
Content-Type: multipart/alternative; boundary="0000000000001e54e505e5e9b911"

--0000000000001e54e505e5e9b911
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 10 ao=C3=BBt 2022 =C3=A0 23:22, Thomas Petazzoni <thomas.petazzoni@=
bootlin.com>
a =C3=A9crit :

> On Tue,  9 Aug 2022 23:18:37 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Fix the following build failure without threads raised since bump to
> > version 0.6.0 in commit 017dbc770c4fd58d7d52cf290dd3fc39a3603e0d and
> >
> https://github.com/google/glog/commit/4a4331f2f2de4c35ce72badf0bdc604c04e=
ebb26
> :
> >
> > CMake Error at
> /home/giuliobenetti/autobuild/run/instance-1/output-1/build/glog-0.6.0/CM=
akeFiles/CMakeTmp/CMakeLists.txt:18
> (add_executable):
> >   Target "cmTC_ed950" links to target "Threads::Threads" but the target
> was
> >   not found.  Perhaps a find_package() call is missing for an IMPORTED
> >   target, or an ALIAS target is missing?
> >
> > Fixes:
> >  -
> http://autobuild.buildroot.org/results/bf0846a51da69169286c7af38089d204d3=
d242d1
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  .../glog/0001-added-emscripten-support.patch  | 290 ++++++++++++++++++
> >  1 file changed, 290 insertions(+)
> >  create mode 100644 package/glog/0001-added-emscripten-support.patch
>
> Do you have an explanation of the link between building without threads
> and the addition of emscripten support? The link seems not obvious, at
> least to me :-)
>

I was too slow in rebasing my PR and so upstream decided to fix the threads
issue in the same commit than emscripten:
https://github.com/google/glog/pull/841


>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com


Best Regards,

Fabrice

--0000000000001e54e505e5e9b911
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 10 ao=C3=BBt 2022 =C3=A0=
=C2=A023:22, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootli=
n.com">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Tue,=C2=A0 9 Aug 2022 23=
:18:37 +0200<br>
Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" target=
=3D"_blank">fontaine.fabrice@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Fix the following build failure without threads raised since bump to<b=
r>
&gt; version 0.6.0 in commit 017dbc770c4fd58d7d52cf290dd3fc39a3603e0d and<b=
r>
&gt; <a href=3D"https://github.com/google/glog/commit/4a4331f2f2de4c35ce72b=
adf0bdc604c04eebb26" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/google/glog/commit/4a4331f2f2de4c35ce72badf0bdc604c04eebb26</a>:<br>
&gt; <br>
&gt; CMake Error at /home/giuliobenetti/autobuild/run/instance-1/output-1/b=
uild/glog-0.6.0/CMakeFiles/CMakeTmp/CMakeLists.txt:18 (add_executable):<br>
&gt;=C2=A0 =C2=A0Target &quot;cmTC_ed950&quot; links to target &quot;Thread=
s::Threads&quot; but the target was<br>
&gt;=C2=A0 =C2=A0not found.=C2=A0 Perhaps a find_package() call is missing =
for an IMPORTED<br>
&gt;=C2=A0 =C2=A0target, or an ALIAS target is missing?<br>
&gt; <br>
&gt; Fixes:<br>
&gt;=C2=A0 - <a href=3D"http://autobuild.buildroot.org/results/bf0846a51da6=
9169286c7af38089d204d3d242d1" rel=3D"noreferrer" target=3D"_blank">http://a=
utobuild.buildroot.org/results/bf0846a51da69169286c7af38089d204d3d242d1</a>=
<br>
&gt; <br>
&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice=
@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../glog/0001-added-emscripten-support.patch=C2=A0 | 290 +++++++=
+++++++++++<br>
&gt;=C2=A0 1 file changed, 290 insertions(+)<br>
&gt;=C2=A0 create mode 100644 package/glog/0001-added-emscripten-support.pa=
tch<br>
<br>
Do you have an explanation of the link between building without threads<br>
and the addition of emscripten support? The link seems not obvious, at<br>
least to me :-)<br></blockquote><div><br></div><div>I was too slow in rebas=
ing my PR and so upstream decided to fix the threads issue in the same comm=
it than emscripten: <a href=3D"https://github.com/google/glog/pull/841">htt=
ps://github.com/google/glog/pull/841</a></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a></blockquote><div><br></div><div>Best Regards,</div><div><=
br></div><div>Fabrice<br></div></div></div>

--0000000000001e54e505e5e9b911--

--===============3241363047391580800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3241363047391580800==--
