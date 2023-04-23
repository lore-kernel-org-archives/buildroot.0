Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF87C77B76
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 05:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71ADC60F8C;
	Sun, 23 Apr 2023 05:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71ADC60F8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2q7Mg_rayxxw; Sun, 23 Apr 2023 05:10:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5636860F12;
	Sun, 23 Apr 2023 05:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5636860F12
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 770661C29A1
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 05:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49BF1405AB
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 05:10:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49BF1405AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J6p5Cb00dTWP for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 05:10:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BFC440018
Received: from sonic305-20.consmr.mail.ne1.yahoo.com
 (sonic305-20.consmr.mail.ne1.yahoo.com [66.163.185.146])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BFC440018
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 05:10:19 +0000 (UTC)
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1682226619; bh=mMOVWpIuDMLazRIodPxzPQq29vIjEmHmmqSwn2OfvXM=;
 h=X-Sonic-MF:From:Date:Subject:To:From:Subject;
 b=OYcBHssQItVQkbDpOmY8tvwYKsEdKldvHRiT60zIhIIrwoatyimz7AObM2PQrTQorFHdwqrKqI0I3ri2itm50OpC5j5l10ZBsXc8RNzo39pcZwOxHHBk7k3EJY/hAvd03+MjLtSmy/7UfoBVK6fEXRnEa+FDoseC0t77MA1Zb8Z0BuBlRGomXJqsn07wWAFVklEPab7xmZ1sjgZgE7kTatbiuQ3ka1/xPc4Aoa7YSdPBLL6fxnO69L7v2L7T5NyuufiR/NZhmjEveVGQv6DHxblrsRgvwfAljAQ0zzE82m9U4z5rI3K5o36+OTUI3qZQ6CBFranuihnc0xD/S9Fv1A==
X-YMail-OSG: qTofdMUVM1nontiXIl9sexKMsf16a1CdIQq7V3BEiq4DzRUXjWmUe_FckzmQdF9
 fShwcROFGoy3GlnlCtx5cC8sSCHSfs54LuAqwjEIsFfCZT6MQU4B0_FKxg5DAfY48c6LE7_Jkh7z
 BrYj.8On4Q7tllJUJa0cEGmNO93s06aA8SWuwzWai2SQ6vJmE8QjY3B9BkRwP7r9iF8TGxfIS83n
 iOGIMAnNmbsQgcfavp0P7KwfS7asJmwnwy83Irke58Pq.d5ljVdGTUTH1f0JzsGNOsVKD.T7e8EN
 RawWuSBpc5E9m8FynpXGBTfw4MqxIikBFxjRKHq92Ur2QMTz_ThXvSImooxV6REYORWc63_1zlGe
 7CzO0akVo0wOvIpwCPro0qWVeK3.h3u2zBYe2JJSUR5q.wrfMTqbOwOMWUtoaZLfN9qzQi5g3aSm
 8zfoeCwEmBVbnM1GynxtEV4_G0SdP.NMmOTXNIeBj9ZErYG5r1UNCQwli_UExz3ndwgD1O8T8NvU
 wlcLsA6fC.AVVjhynqkgFr04ehvuly9JJqLDhuZ_6lvnYZyj.Wvkx1ckyPajk0YkG_xJifRTdIBG
 Oq7PyntgtDosSrWZCtLkS1NgNm2eUhQ49yqoBgz2a5xo3MmAp8UM3IZqHL3Sxn0sDn0h0Ncr9NEa
 AkEgeM.5jw4TqrNplJcovvYU2xsfxNFKDB0Ic8zyTcH5GwkfVWu7mZvX2ejKhX2LqSQpSr0pTfbn
 50n6CO6y6pq5jlwTcIOdnAbtdnQLO1_2kx_jf_N4MxUCTvZahC_XpTbpMz0mv4SgwQaIUxxsd._a
 TkwuiDvENyAkRPKVdku4ybDgj_sSAVSYCuVq6T1Rxv4EEErAI6DRh_gQkEJfPFmFTAPVHWnLVrCr
 .yN8jHJ7cVIOtUSfZsyfgZfmGj1ZNBP2Ri63dwR17xZPpOHyiJ_8TLcsZmKAasaXJbFrvoH61Sql
 0V8h__a7N5tZxzgw6iXboyk.Qgr5rqAEp5VzJE_v8cUOPz71MCZxLf0VOWCaLPI7fBdF7cPvcgRW
 q_ApLHdgnUyGjoZOZTlQO6M20tAr5gPCO.CRWuBY2uBUaEbeMzhqILL4yJLRcpUKH_20rxst8x4_
 rVGbpdlq0emrv9H50auululFDmAfH_M5U.LxAtvAJFO6lTEMvDgbNbtK2rAXbk34B9xP8gBMQgXG
 CwM3nKstDO0NZEgBbibId4rcrYpqvqqs9nZfIJQxYAALNjW8R2U.qnyEHVXg5b16r9V4QuOS6WsP
 aGvS2n8aUOZzSh_ayjwg29qPKozz9DopZy0ELwIgsOeAu3bPnpdfSsTr_r9vdDko2iQBsntLKpaI
 dPoF7.oMhEMe2uc4OFhkpSoZ7delJ.C5rKiE79UOCZDEsSfqVmo72_7Di0epGqy4X_kR06SIw9pd
 aQZf5L0mWy4RSBZKA4qmOE0imnFQfaglL01YN99B11.cOKOPkeSVFfo9jErS80Alo6HRMdFqFOn9
 21yPeRl6QfScv_G7B2xHpvqLsXNJH9HhXWetwlkMRn2XrRu9g8KXAJuiwsKINDn0YBaUi91AKHVz
 73jDNdP6a_nB4pc0.Hx6_7GCvgJWS7g0fwYUGUTHfSEjbP5lRReLgiGiARVXbOo0DXYW.w1.zpJC
 L.aVH58f8Wlg1UhRA4Pvze9mriZAbv2Ai_9MtYhkQF_u7ZPfenK6Q.0lUj3ug299shORbWH6yisw
 f9U6iBAWZtJom2uqnmoHibrJDfZyMRnMV9CbJfxOxx7vPgSicpeTEU8WFYiIZRtHm3o5CTaD0wFo
 Em2x1lZT11sdW7uAFPZVSE03RNvB_fGQo.oa4oxepCU5M1qdOBRlMwHup6EzL6FprgVY1diNNDr6
 rsv0ubvqfoTTg_E7CjToVUcOlhjI9GaALxKrXA9e0elOaQUlA68oqre3.blL2w7ld0SDFrQ96SX7
 W6hHaLX4jUvrJlieMmGhomyKQal0fmz0XRYlbA94WE5lNeIxlzAoZlKjXKgp9z__TSHQfN2uVjOH
 ozErOKE7e6OwrUkBj4ryXtqEOy7biYBPmOE6oyOWwfpEEEScTBLua3qVUsXMZRolFje7C.7Tg8YA
 BQrTKIIl1DdaT0mQbyDwg0Rd1yTKBF91ib8Mp_moP10yqs6nKyL5nyHPNnhl4ca5ucbsL7g7h77l
 .Otd.wr9bMGfpXxcbaM48waKlP0lXAE0tEv80pOVBV8NzUbtkDc6jtFVgQEUlZ5z_MyXt93TSWNY
 uyoMWUXyTL_OuoWrJAmJB5Z1sVgdYmPk-
X-Sonic-MF: <victorhooi@yahoo.com>
X-Sonic-ID: 67b7f627-412a-45c4-b785-a9f8e82a8153
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.ne1.yahoo.com with HTTP; Sun, 23 Apr 2023 05:10:19 +0000
Received: by hermes--production-gq1-546798879c-sq6s2 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID fbcd34c08eb394c4bc988aef222cf7c6; 
 Sun, 23 Apr 2023 05:00:16 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-771eeb2a3b3so472521241.0
 for <buildroot@buildroot.org>; Sat, 22 Apr 2023 22:00:16 -0700 (PDT)
X-Gm-Message-State: AAQBX9c/chdu3NaMf837j7PJODdwx0wLZbacgYRF5LyFf4sN9TTZvkpz
 ENrhm55bJjqz0eDx6JKawm1Tn+Aeo5KCUdkLfDU=
X-Google-Smtp-Source: AKy350bafOqfo2Tn7Nt9xJKppttpEX+5I+Ujqcw9qX0JgMuSV2lukNAw5oMnqIjYZ8jOre1JbyVKn36bF3QpHddxYZc=
X-Received: by 2002:a05:6102:358f:b0:42c:6b3d:3cff with SMTP id
 h15-20020a056102358f00b0042c6b3d3cffmr4609403vsu.1.1682226014748; Sat, 22 Apr
 2023 22:00:14 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 23 Apr 2023 15:00:03 +1000
X-Gmail-Original-Message-ID: <CAMnnoU+DHRXQVgTL4YLFxhkdcZx9PZXiGMLO4vW6KYfQaEGFNw@mail.gmail.com>
Message-ID: <CAMnnoU+DHRXQVgTL4YLFxhkdcZx9PZXiGMLO4vW6KYfQaEGFNw@mail.gmail.com>
To: buildroot@buildroot.org
References: <CAMnnoU+DHRXQVgTL4YLFxhkdcZx9PZXiGMLO4vW6KYfQaEGFNw.ref@mail.gmail.com>
X-Mailer: WebService/1.1.21365
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yahoo.com; s=s2048; t=1682226619;
 bh=oVGYV/7awBdp3lDOg2FpXJNYs/WUn4MFnyduK+fPHa0=;
 h=From:Date:Subject:To:References:From:Subject:Reply-To;
 b=cYGzz9MrWGs00tkFucNycLYOZ+pSMaawM50orj6Q3HN2jqzPU9gFd647VrRBdsi4xrUMrO0YOG+y3/ahIj4rvJ9lHh60iuytXIOQ6qDgbA4zUmqYZFogGlyjGuEOTfWT2IZql73V9EeEZlB7NdnTXaZPcSfsYPCCE3ID7gzH2rbR7AK13lx3yHhMh3fbijbbh8zkkzKn731sH0SUN3vQkfhs8mb+PxjkWDi5YUlwvIF8o2EV/Lq/fZreI1o2BcKhmNC6b14I5L49mQbyqFUByozRKAzPXcSnyhboHQiI4pTB1i1clfaUlLSjLzgWbx/wgbcF4uqS8etFLcmv+SHAGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.a=rsa-sha256 header.s=s2048 header.b=cYGzz9Mr
Subject: [Buildroot] buildroot for ARM64 - aligning on 4K/16K/64K - will it
 still run on 4K systems?
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
From: Victor Hooi via buildroot <buildroot@buildroot.org>
Reply-To: Victor Hooi <victorhooi@yahoo.com>
Content-Type: multipart/mixed; boundary="===============3132146855284058062=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3132146855284058062==
Content-Type: multipart/alternative; boundary="0000000000000a8d4405f9f9c468"

--0000000000000a8d4405f9f9c468
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I am trying to build a k3s <https://github.com/k3s-io/k3s> cluster to run
on Mac Mini machines (i.e. Apple Silicon) running Asahi Linux
<https://asahilinux.org/>

k3s uses buildroot, via k3s-root <https://github.com/k3s-io/k3s-root>.

However, one issue is that recent k3s binaries seem to be specifically
compiled for 4K page sizes only - whereas Asahi Linux specifically supports
16K page sizes (due to some architecture decisions in the Apple
Silicon/M1/M2 chips etc.)

As far as I can tell, the k3s change to introduce 4K only support was in
this commit (November 2022):

https://github.com/k3s-io/k3s-root/commit/48b49ad763ed1a6ca69b4cd51b6aa671c=
fdb97d8

which was described as a "Update buildroot to 2022.08.1".

This k3s commit added the below lines to buildroot/arm64config:

BR2_ARM64_PAGE_SIZE_4K=3Dy
> # BR2_ARM64_PAGE_SIZE_64K is not set
> BR2_ARM64_PAGE_SIZE=3D"4K"


*Question 1* - Was there something introduced in buildroot 2022.08.1, that
mandated the above config changes? I'm assuming it was something upstream?

 I also found this older mailing list post (2021) from =C5=81ukasz Stelmach=
:

https://lore.kernel.org/all/20211203215005.GA50662@scaer/T/


>
>
>
>
>
> *MMUs on AArch64 support three different page sizes: 4 kB, 16 kB,and 64
> kB. It is OS kernel's task to choose the configuration duringboot. Linux
> kernel can be compiled to support different page size.To run on a system
> with pages larger than 4 kB userland binaries needto be properly aligned
> during the linking process. However, binariesprepared for systems with
> larger pages can run on systems with smallerpages.*


This seems to suggest that aligning to 64K, we should still be able to run
on systems with smaller pages (e.g. Raspberry Pis).

*Question 2* - Do you know if the above information ("binaries prepared for
systems with larger pages can run on systems with smaller pages") is still
true?

There's also some context for the k3s/Asahi Linux discussion here:

   - https://github.com/k3s-io/k3s/issues/7335
   -
   https://www.reddit.com/r/AsahiLinux/comments/12v06v5/running_k3s_on_asah=
i_linux_could_we_get_it_to/

Thanks,
Victor

--0000000000000a8d4405f9f9c468
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I am trying to build a <a href=3D"h=
ttps://github.com/k3s-io/k3s">k3s</a> cluster to run on Mac Mini machines (=
i.e. Apple Silicon) running <a href=3D"https://asahilinux.org/">Asahi Linux=
</a></div><div><br></div><div>k3s uses buildroot, via <a href=3D"https://gi=
thub.com/k3s-io/k3s-root">k3s-root</a>.</div><div><br></div><div>However, o=
ne issue is that recent k3s binaries seem to be specifically compiled=C2=A0=
for 4K page sizes only - whereas Asahi Linux specifically supports 16K page=
 sizes (due to some architecture decisions in the Apple Silicon/M1/M2 chips=
 etc.)</div><div><br></div><div>As far as I can tell, the k3s change to int=
roduce 4K only support was in this commit (November 2022):</div><div><br></=
div><div><a href=3D"https://github.com/k3s-io/k3s-root/commit/48b49ad763ed1=
a6ca69b4cd51b6aa671cfdb97d8">https://github.com/k3s-io/k3s-root/commit/48b4=
9ad763ed1a6ca69b4cd51b6aa671cfdb97d8</a><br></div><div><br></div>which was =
described as a &quot;Update buildroot to 2022.08.1&quot;.<div><br></div><di=
v>This k3s commit added the below lines to buildroot/arm64config:</div><div=
><br></div><div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><font fac=
e=3D"monospace">BR2_ARM64_PAGE_SIZE_4K=3Dy<br># BR2_ARM64_PAGE_SIZE_64K is =
not set<br>BR2_ARM64_PAGE_SIZE=3D&quot;4K&quot;</font></blockquote><div><br=
></div><div><b>Question 1</b> - Was there something introduced in buildroot=
 2022.08.1, that mandated the above config changes? I&#39;m assuming it was=
 something upstream?<br><div><br>=C2=A0I also found=C2=A0this older mailing=
 list post (2021) from =C5=81ukasz Stelmach:<br><br><a href=3D"https://lore=
.kernel.org/all/20211203215005.GA50662@scaer/T/">https://lore.kernel.org/al=
l/20211203215005.GA50662@scaer/T/</a><br><br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><i>MMUs on AArch64 support three different page sizes: =
4 kB, 16 kB,<br>and 64 kB. It is OS kernel&#39;s task to choose the configu=
ration during<br>boot. Linux kernel can be compiled to support different pa=
ge size.<br>To run on a system with pages larger than 4 kB userland binarie=
s need<br>to be properly aligned during the linking process. However, binar=
ies<br>prepared for systems with larger pages can run on systems with small=
er<br>pages.</i></blockquote></div><div><br></div><div>This seems to sugges=
t that aligning to 64K, we should still be able to run on systems with smal=
ler pages (e.g. Raspberry Pis).<br></div><div><br></div><b>Question 2</b> -=
 Do you know if the above information (&quot;binaries prepared for systems =
with larger pages can run on systems with smaller pages&quot;) is still tru=
e?</div><div><br><div>There&#39;s also some context for the k3s/Asahi Linux=
 discussion here:</div><div><ul><li><a href=3D"https://github.com/k3s-io/k3=
s/issues/7335">https://github.com/k3s-io/k3s/issues/7335</a></li><li><a hre=
f=3D"https://www.reddit.com/r/AsahiLinux/comments/12v06v5/running_k3s_on_as=
ahi_linux_could_we_get_it_to/">https://www.reddit.com/r/AsahiLinux/comments=
/12v06v5/running_k3s_on_asahi_linux_could_we_get_it_to/</a></li></ul><div>T=
hanks,</div></div></div></div><div>Victor</div></div>

--0000000000000a8d4405f9f9c468--

--===============3132146855284058062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3132146855284058062==--
