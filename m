Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E52C433F5
	for <buildroot@archiver.kernel.org>; Sun,  1 May 2022 17:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D91D40A7A;
	Sun,  1 May 2022 17:05:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KzV9kaps3FQD; Sun,  1 May 2022 17:05:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90BAE409FA;
	Sun,  1 May 2022 17:05:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB4041BF303
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 17:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E77B74058A
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 17:05:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j4hKFBNYHt6Z for <buildroot@lists.busybox.net>;
 Sun,  1 May 2022 17:05:04 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp2.osuosl.org (Postfix) with ESMTP id E28BC4015F
 for <buildroot@buildroot.org>; Sun,  1 May 2022 17:05:03 +0000 (UTC)
Received: from smtpclient.apple ([151.36.229.209])
 by Aruba Outgoing Smtp  with ESMTPA
 id lCtRnFs0l8fhXlCtRnr4ny; Sun, 01 May 2022 18:57:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1651424277; bh=HaVrLigYwbsaE6ccPN3KNIRcOBPzRe/u5Lsp+vLmowE=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=iMBwVDDHxXDa+TJPJCpJ8tmknw1bBguuGW/osNqXzpofKEyq2CRDsWrgjGJs2e/qb
 +hK2UMsOaDXfoVD1TC68OQOldNiBGs4PhRJcNq5V2TS8X3Fk4VypSQWqwivKrYYB5s
 LRYADNEatczwE/WmFpjX5qGvEe7RH4Fje8JTdWx34zTaV45qOpt9CVjO1eHB2n4gub
 yeiGc8ia4P3bxmCmlX6MQubgqfCcXhJMuDYlbJqoUcMKokwucD5CR7J9vetlqsaWtM
 wD1JPe2xQWBY/MRJ3MsMRPxLLrTzCZ3Ge7W/nLXLR/rBdi5VLTUs1Sa+O7OVK1iJeK
 5+ron/HIGv7jg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 1 May 2022 18:57:56 +0200
Message-Id: <19E943C0-7017-4454-93D9-88EEBAB80061@benettiengineering.com>
References: <ROAP284MB1248F81EBC538A6664E4DBC088FE9@ROAP284MB1248.BRAP284.PROD.OUTLOOK.COM>
In-Reply-To: <ROAP284MB1248F81EBC538A6664E4DBC088FE9@ROAP284MB1248.BRAP284.PROD.OUTLOOK.COM>
To: Albert Jose Silva Tovar <albertsilva.26@hotmail.com>
X-Mailer: iPhone Mail (19E258)
X-CMAE-Envelope: MS4xfFJfZ1wS4QwBuPmCIiBdu/KknH+m1eWhqpNFrjW+F720IyoRXQHP3IpNGFe+8nlE+crd1Gsb8OGuAeoDbm/2lIipp4VHQLLis/MkevxymQcqsGtI2NP/
 I3gFpyKipqijxgyYZ86qkqadClfdi3MgXdu/97So9paafLsZVbVugOJzwnI8Y2h8PHfiQFyYt3RTPQgS42/FpWmjS1t7Y18J+pHdSFf+heziuHqYrTjsgbzS
 rMShq9XaLmVC1cQ7nzjDDJ9VdlBag89wp86GVKY7Ytw=
Subject: Re: [Buildroot] Pantalla tactil - hycon-hy46xx.c
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============1808187164638986829=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1808187164638986829==
Content-Type: multipart/alternative; boundary=Apple-Mail-F04C13A9-8C8A-4514-ACA4-F811784FD1C0
Content-Transfer-Encoding: 7bit


--Apple-Mail-F04C13A9-8C8A-4514-ACA4-F811784FD1C0
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Albert,

> Il giorno 1 mag 2022, alle ore 13:24, Albert Jose Silva Tovar <albertsilva=
.26@hotmail.com> ha scritto:
>=20
> =EF=BB=BF
> Hi Giulio,
>=20
> I tell you that the version I'm using is the following: Linux buildroot 3.=
10.0 #1 Tue Mar 12 15:28:07 CET 2019 armv7l GNU/Linux.

Oh it=E2=80=99s a very old kernel, I don=E2=80=99t know how smoothly the pat=
ches would apply. They need backport almost for sure with some tweak.

>=20
> We are currently using a FocalTech-driver which is giving us problems with=
 the touch screen although it recognizes the screen it does not work very we=
ll.

It depends on the application in my experience, overall Hycon for me works r=
eally better than ft53/54 with glass/pet.

>=20
> The Linux buildroot version we are using is 2014 I will try to add the par=
ks to the buildroot repository to download when compiling and let you know h=
ow it works.

Oh, Buildroot version is very old too.

>=20
> I am new to this, it is still difficult to make changes but I will try.
>=20
> Thank you very much for the information.

No problem
Best regards
=E2=80=94-
Giulio Benetti
Benetti Engineering sas

>=20
> Saludos Cordiales.
> Ing. Albert Silva.
>=20
>=20
> De: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Enviado: s=C3=A1bado, 30 de abril de 2022 5:42 p. m.
> Para: Albert Jose Silva Tovar <albertsilva.26@hotmail.com>
> Cc: buildroot <buildroot@buildroot.org>
> Asunto: Re: Pantalla tactil - hycon-hy46xx.c
> =20
> Hi Albert,
>=20
> I add Buildroot ML in Cc since it's in a good part Buildroot related and=20=

> other people can help too,
>=20
> On 29/04/22 14:28, Albert Jose Silva Tovar wrote:
> > Good afternoon Julio,
> >=20
> > I am writing to you because of a contribution you made on this website:
> > https://github.com/torvalds/linux/blob/master/drivers/input/touchscreen/=
hycon-hy46xx.c=20
> > <https://github.com/torvalds/linux/blob/master/drivers/input/touchscreen=
/hycon-hy46xx.c>
> >=20
> > I would like to ask you a question! I have a builroot OS and I would=20
> > like to integrate this drivers to it, the sources that you use, in=20
> > principle where would I have to put them or what would be the process of=
=20
> > adapting the driver?
>=20
> I think you're using a Linux version without the hycon driver, so what=20
> you can do is to patch the kernel you're using by adding the patch to=20
> Buildroot for Linux.
>=20
> So you have to:
> 1. clone kernel git and checkout the version you're using or directly=20
> use your own kernel repository if any
> 2. clone mainline kernel
> 3. extract my patches from the cloned mainline kernel with:
> "git format-patch" command
> 4. copy the patches to your buildroot/board/company/linux like this:
> =20
> https://github.com/buildroot/buildroot/tree/master/board/seeed/stm32mp157c=
-odyssey/patches
> 5. use the BR2_GLOBAL_PATCH_DIR variable in your Buildroot defconfig,=20
> like this:
> =20
> https://github.com/buildroot/buildroot/blob/master/configs/stm32mp157c_ody=
ssey_defconfig#L3
> 6. rebuild Buildroot
>=20
> That is the way I would do it.
>=20
> Which Linux version are you using?
>=20
> Feel free to ask me more help also regarding the driver itself if you=20
> encounter problems with back-porting my patches.
>=20
> Best regards
> --=20
> Giulio Benetti
> Benetti Engineering sas

--Apple-Mail-F04C13A9-8C8A-4514-ACA4-F811784FD1C0
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Albert,<div><div dir=3D"ltr"><br><blockq=
uote type=3D"cite">Il giorno 1 mag 2022, alle ore 13:24, Albert Jose Silva T=
ovar &lt;albertsilva.26@hotmail.com&gt; ha scritto:<br><br></blockquote></di=
v><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF

<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-1=
">



<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Giulio,
<div><br>
</div>
<div>I tell you that the version I'm using is the following: Linux buildroot=
 3.10.0 #1 Tue Mar 12 15:28:07 CET 2019 armv7l GNU/Linux.
</div></div></div></blockquote><div><br></div><div>Oh it=E2=80=99s a very ol=
d kernel, I don=E2=80=99t know how smoothly the patches would apply. They ne=
ed backport almost for sure with some tweak.</div><br><blockquote type=3D"ci=
te"><div dir=3D"ltr"><div style=3D"font-family: Calibri, Helvetica, sans-ser=
if; font-size: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<div><br>
</div>
<div>We are currently using a FocalTech-driver which is giving us problems w=
ith the touch screen although it recognizes the screen it does not work very=
 well.
</div></div></div></blockquote><div><br></div><div>It depends on the applica=
tion in my experience, overall Hycon for me works really better than ft53/54=
 with glass/pet.</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><div st=
yle=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt; color: r=
gb(0, 0, 0);" class=3D"elementToProof">
<div><br>
</div>
<div>The Linux buildroot version we are using is 2014 I will try to add the p=
arks to the buildroot repository to download when compiling and let you know=
 how it works.
</div></div></div></blockquote><div><br></div><div>Oh, Buildroot version is v=
ery old too.</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><div style=3D=
"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);" class=3D"elementToProof">
<div><br>
</div>
<div>I am new to this, it is still difficult to make changes but I will try.=
</div></div></div></blockquote><blockquote type=3D"cite"><div dir=3D"ltr"><d=
iv style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<div><br>
</div>
<div>Thank you very much for the information.</div></div></div></blockquote>=
<div><br></div><div>No problem</div><div>Best regards</div><div>=E2=80=94-</=
div><div>Giulio Benetti</div><div>Benetti Engineering sas</div><br><blockquo=
te type=3D"cite"><div dir=3D"ltr"><div style=3D"font-family: Calibri, Helvet=
ica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" class=3D"elementToPr=
oof">
</div>
<div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div></div>
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color:=
#000000; background-color:#FFFFFF; font-family:Calibri,Arial,Helvetica,sans-=
serif">
<div style=3D"color:rgb(34,34,34); font-family:arial,sans-serif; font-size:1=
2.8000001907349px; background-color:rgb(255,255,255)">
<b style=3D"">Saludos Cordiales.</b></div>
<div style=3D"color:rgb(34,34,34); font-family:arial,sans-serif; font-size:1=
2.8000001907349px; background-color:rgb(255,255,255)">
<span style=3D"font-size:12.8px"><b>Ing.</b><i style=3D"font-weight:bold">&n=
bsp;</i>Albert Silva.</span><br>
</div>
<div style=3D"color:rgb(34,34,34); font-family:arial,sans-serif; font-size:1=
2.8000001907349px; background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"color:rgb(34,34,34); font-family:arial,sans-serif; font-size:1=
2.8000001907349px; background-color:rgb(255,255,255)">
</div>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; colo=
r:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" col=
or=3D"#000000" style=3D"font-size:11pt"><b>De:</b> Giulio Benetti &lt;giulio=
.benetti@benettiengineering.com&gt;<br>
<b>Enviado:</b> s=C3=A1bado, 30 de abril de 2022 5:42 p.&nbsp;m.<br>
<b>Para:</b> Albert Jose Silva Tovar &lt;albertsilva.26@hotmail.com&gt;<br>
<b>Cc:</b> buildroot &lt;buildroot@buildroot.org&gt;<br>
<b>Asunto:</b> Re: Pantalla tactil - hycon-hy46xx.c</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt">=

<div class=3D"PlainText">Hi Albert,<br>
<br>
I add Buildroot ML in Cc since it's in a good part Buildroot related and <br=
>
other people can help too,<br>
<br>
On 29/04/22 14:28, Albert Jose Silva Tovar wrote:<br>
&gt; Good afternoon Julio,<br>
&gt; <br>
&gt; I am writing to you because of a contribution you made on this website:=
<br>
&gt; <a href=3D"https://github.com/torvalds/linux/blob/master/drivers/input/=
touchscreen/hycon-hy46xx.c" data-auth=3D"NotApplicable">
https://github.com/torvalds/linux/blob/master/drivers/input/touchscreen/hyco=
n-hy46xx.c</a>
<br>
&gt; &lt;<a href=3D"https://github.com/torvalds/linux/blob/master/drivers/in=
put/touchscreen/hycon-hy46xx.c" data-auth=3D"NotApplicable">https://github.c=
om/torvalds/linux/blob/master/drivers/input/touchscreen/hycon-hy46xx.c</a>&g=
t;<br>
&gt; <br>
&gt; I would like to ask you a question! I have a builroot OS and I would <b=
r>
&gt; like to integrate this drivers to it, the sources that you use, in <br>=

&gt; principle where would I have to put them or what would be the process o=
f <br>
&gt; adapting the driver?<br>
<br>
I think you're using a Linux version without the hycon driver, so what <br>
you can do is to patch the kernel you're using by adding the patch to <br>
Buildroot for Linux.<br>
<br>
So you have to:<br>
1. clone kernel git and checkout the version you're using or directly <br>
use your own kernel repository if any<br>
2. clone mainline kernel<br>
3. extract my patches from the cloned mainline kernel with:<br>
"git format-patch" command<br>
4. copy the patches to your buildroot/board/company/linux like this:<br>
&nbsp;<br>
</div>
<div class=3D"PlainText elementToProof"><a href=3D"https://github.com/buildr=
oot/buildroot/tree/master/board/seeed/stm32mp157c-odyssey/patches" data-auth=
=3D"NotApplicable">https://github.com/buildroot/buildroot/tree/master/board/=
seeed/stm32mp157c-odyssey/patches</a><br>
</div>
<div class=3D"PlainText">5. use the BR2_GLOBAL_PATCH_DIR variable in your Bu=
ildroot defconfig,
<br>
like this:<br>
&nbsp;<br>
</div>
<div class=3D"PlainText elementToProof"><a href=3D"https://github.com/buildr=
oot/buildroot/blob/master/configs/stm32mp157c_odyssey_defconfig#L3" data-aut=
h=3D"NotApplicable">https://github.com/buildroot/buildroot/blob/master/confi=
gs/stm32mp157c_odyssey_defconfig#L3</a><br>
</div>
<div class=3D"PlainText">6. rebuild Buildroot<br>
<br>
That is the way I would do it.<br>
<br>
Which Linux version are you using?<br>
<br>
Feel free to ask me more help also regarding the driver itself if you <br>
encounter problems with back-porting my patches.<br>
<br>
Best regards<br>
-- <br>
Giulio Benetti<br>
Benetti Engineering sas<br>
</div>
</span></font></div>


</div></blockquote></div></body></html>=

--Apple-Mail-F04C13A9-8C8A-4514-ACA4-F811784FD1C0--

--===============1808187164638986829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1808187164638986829==--
