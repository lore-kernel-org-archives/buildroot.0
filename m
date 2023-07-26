Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C2CC0015E
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 18:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E52D80B3B;
	Wed, 26 Jul 2023 18:38:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E52D80B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UkGaTFswYNWy; Wed, 26 Jul 2023 18:38:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A04F80AEE;
	Wed, 26 Jul 2023 18:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A04F80AEE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 907A41BF421
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 18:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68328404D9
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 18:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68328404D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WXkza7wmkIn6 for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 18:38:28 +0000 (UTC)
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92F8540543
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 18:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92F8540543
Received: from smtpclient.apple ([146.241.200.99])
 by Aruba Outgoing Smtp  with ESMTPA
 id OjOzq9O8Ua8IoOjOzquuI0; Wed, 26 Jul 2023 20:38:25 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 26 Jul 2023 20:38:24 +0200
Message-Id: <E29A89A4-CBE3-4B41-B65C-DEA72DBCC1FB@benettiengineering.com>
References: <CABRndgxy9N+ndHtMQNo3qytZ5jbmRKk0yddYT6J-Y+E64BHPGw@mail.gmail.com>
In-Reply-To: <CABRndgxy9N+ndHtMQNo3qytZ5jbmRKk0yddYT6J-Y+E64BHPGw@mail.gmail.com>
To: Zvi Vered <veredz72@gmail.com>
X-Mailer: iPhone Mail (20G75)
X-CMAE-Envelope: MS4xfK+JNUYv8OPJJ2PgbsG4ymmeGUbAx+6/psA5gl3vJMl+Ylvlj9iNz6fcApm3te7J3iBXl0WgINoYmua2tcHN+5kFEORrrCbAg5JkRHqdX9ln4GlPvEGG
 I23wyYSq3r+2G2SMUfO/ILlcUUrxm0yadOwjJvyLPiRoX14VkhiGaWm2wL9axVYtOYQYamyTRy6ycnJCWqYLmfkZURYC3yPXNCjo1qOfsqdxkOfZC4VtuCfM
 +21IB7Dh2D9O15wmg0LWEw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1690396705; bh=TzY1z8LHcsfB4kOXv1cJrafVb5HxrMEGjNTtPhvktDo=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=XAgDA5JqTehG0ngmT87ySPL4uH0pzaBR9JTL6ErC0vdekRmKt3sroPfZtNDo4NAzI
 MlLWzPV/p9lVjJ1cKgUvn/wLrHu6imZ0Ufa6PiEkY1nWPA2q8bMTuMV1vkHOtnB9ey
 +JKadGqlDkopB5B97BoKbvi1lNnUn8Mt95ThlL28/vhLjoEgCWF+8e2o4ouD2HAyi6
 91SgqFC9HrP9n/nmowhW+CySzv18CJReZuLYDjzTZDgNw2o1Q7UcOdUufV5EBhMDA5
 gNvEfxFzH+1lMxUS/uNJ3J//IUdjhzL761L8ibjQXAELAyt4sXrUrWwN4tXXg3Z1mG
 Ue/lvyhStcvwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=XAgDA5Jq
Subject: Re: [Buildroot] buildroot 2023.02.3 : containers
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
Content-Type: multipart/mixed; boundary="===============8525100595565116247=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8525100595565116247==
Content-Type: multipart/alternative; boundary=Apple-Mail-C872355B-667C-444E-BD75-EEB5CDDD2745
Content-Transfer-Encoding: 7bit


--Apple-Mail-C872355B-667C-444E-BD75-EEB5CDDD2745
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Zvika,<br><div dir=3D"ltr"><br><blockquo=
te type=3D"cite">Il giorno 26 lug 2023, alle ore 19:04, Zvi Vered &lt;veredz=
72@gmail.com&gt; ha scritto:<br><br></blockquote></div><blockquote type=3D"c=
ite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"ltr">Hi&nbsp;Giulio,<div><br></di=
v><div>Thank you very much for your reply.</div><div>I need dockers is my ta=
rget where the rootfs created by buildroot is located.</div><div>Now I see t=
hat buildroot has docker components.&nbsp;</div></div></div></blockquote><di=
v><br></div><div>pardon, I=E2=80=99ve misunderstood. Yes there are:</div><di=
v>- docker-engine</div><div>and in case you need:</div><div>- docker-cli</di=
v><div>- docker-compose</div><div><br></div><div>Since you=E2=80=99re using x=
86_64 you should be able to build with no problem.</div><div><br></div><div>=
Best regards</div><div>Giulio</div><br><blockquote type=3D"cite"><div dir=3D=
"ltr"><div dir=3D"ltr"><div><br></div><div>Best&nbsp;regards,</div><div>Zvik=
a&nbsp;</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Wed, Jul 26, 2023 at 10:12=E2=80=AFAM Giulio Benetti &lt;<a h=
ref=3D"mailto:giulio.benetti@benettiengineering.com">giulio.benetti@benettie=
ngineering.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"auto">Hi Zvika,<div><div dir=3D"ltr"><br><blockquote=
 type=3D"cite">Il giorno 26 lug 2023, alle ore 04:43, Zvi Vered &lt;<a href=3D=
"mailto:veredz72@gmail.com" target=3D"_blank">veredz72@gmail.com</a>&gt; ha s=
critto:<br><br></blockquote></div><blockquote type=3D"cite"><div dir=3D"ltr"=
>=EF=BB=BF<span>Hello,</span><br><span></span><br><span>I built root file sy=
stem with buildroot 2023.02.3</span><br><span>The kernel is vanilla 5.4.249<=
/span><br><span>Architecture: x86_64. It works.</span><br><span></span><br><=
span>Can you please tell if I can use containers in this setup ? How ?</span=
><br></div></blockquote><div><br></div><div>You can use official buildroot d=
ocker by issuing:</div><div>$ utils/docker-run</div><div>inside buildroot fo=
lder.</div><div>You can check out buildroot manual:</div><div><div style=3D"=
display:block"><div style=3D"display:inline-block" role=3D"link"><a style=3D=
"border-radius:10px;font-family:-apple-system,Helvetica,Arial,sans-serif;dis=
play:block;width:300px;overflow:hidden;text-decoration:none" rel=3D"nofollow=
" href=3D"https://buildroot.org/downloads/manual/manual.html#submitting-patc=
hes" dir=3D"ltr" role=3D"button" width=3D"300" target=3D"_blank"><table styl=
e=3D"table-layout:fixed;border-collapse:collapse;width:300px;background-colo=
r:rgb(233,233,235);font-family:-apple-system,Helvetica,Arial,sans-serif" cel=
lpadding=3D"0" cellspacing=3D"0" border=3D"0" width=3D"300"><tbody><tr><td><=
table bgcolor=3D"#E9E9EB" cellpadding=3D"0" cellspacing=3D"0" width=3D"300" s=
tyle=3D"font-family:-apple-system,Helvetica,Arial,sans-serif;table-layout:fi=
xed;background-color:rgb(233,233,235)"><tbody><tr><td style=3D"padding:8px 0=
px"><div style=3D"max-width:100%;margin:0px 16px;overflow:hidden"><div style=
=3D"font-weight:500;font-size:12px;overflow:hidden;text-overflow:ellipsis;te=
xt-align:left"><a rel=3D"nofollow" href=3D"https://buildroot.org/downloads/m=
anual/manual.html#submitting-patches" style=3D"text-decoration:none" target=3D=
"_blank"><font color=3D"#000000" style=3D"color:rgb(0,0,0)">The Buildroot us=
er manual</font></a></div><div style=3D"font-weight:400;font-size:11px;overf=
low:hidden;text-overflow:ellipsis;text-align:left"><a rel=3D"nofollow" href=3D=
"https://buildroot.org/downloads/manual/manual.html#submitting-patches" styl=
e=3D"text-decoration:none" target=3D"_blank"><font color=3D"#A2A2A9" style=3D=
"color:rgba(60,60,67,0.6)">buildroot.org</font></a></div></div></td><td styl=
e=3D"padding:6px 12px 6px 0px" width=3D"36"><a rel=3D"nofollow" href=3D"http=
s://buildroot.org/downloads/manual/manual.html#submitting-patches" target=3D=
"_blank"><div>&lt;favicon.ico&gt;</div></a></td></tr></tbody></table></td></=
tr></tbody></table></a></div></div><br></div><div>In general patches are che=
cked using docker-run script.</div><div><br></div><div>Best regards</div><di=
v>Giulio</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><span></span><b=
r><span>Thank you,</span><br><span>Zvika</span><br><span>___________________=
____________________________</span><br><span>buildroot mailing list</span><b=
r><span><a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildro=
ot@buildroot.org</a></span><br><span><a href=3D"https://lists.buildroot.org/=
mailman/listinfo/buildroot" target=3D"_blank">https://lists.buildroot.org/ma=
ilman/listinfo/buildroot</a></span><br></div></blockquote></div></div></bloc=
kquote></div>
</div></blockquote></body></html>=

--Apple-Mail-C872355B-667C-444E-BD75-EEB5CDDD2745--

--===============8525100595565116247==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8525100595565116247==--
