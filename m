Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B467CC982F1
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 07:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 553B160685;
	Tue, 22 Sep 2026 07:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i1m-k-zM050W; Tue, 22 Sep 2026 07:09:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2795960662
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790060951;
	b=BTSMuo/30cdGF2qQaPRp9Lmt6A0puPtWgDcCXyaBOimJ/xv9n8Cq0G5mCTTmgIDVo3zl
	 PwducAUYMSFdBD/SdDstutrxwZ0dP1LYKTw3UccE6PxiQ/I3ZujrGJvUXl5K731o+0CCI
	 EM0uX8h5KNHxQAJP3/kw87v5tl11P/2ahnp+LOkQ2iviVp7eguPykNebB/HbUziDANb0M
	 NVdcBTRLy+oV7IC0vG82Ww7YANEcTiHXtyMyVBiNKaNrkPcneYR+7TfOb2vQTRSOPtd2O
	 xzv/WFVk57UDmOhDJMCkJOYPEDQnts4nZqoe4lmdOM3vFfV6scP+9I3EnXg77n+TBVg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790060951;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received-SPF:Received:DKIM-Signature:X-Authentication-Warning:
	 Message-ID:From:To:Cc:Date:In-Reply-To:References:User-Agent:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Errors-To:Sender;
	bh=KFrbYWV+xg1596/a/fAA/CnUwsWRSFwTVDL+yhUBo7g=;
	b=gaiuKTZDLn3Y6NaQgj2Do0+EtNsy2pJS+zi8TQdN08c3TmgjmMfXBwgfKaaL1WUj/lxT
	 ki87KBYJDg8lECMHalkv+7mDGPRxShDyHvSusGj5+ns/8vLHNUvWdRVsHABUz7BDxq4c8
	 8esHAoXW3IFv49YH8ufu/qUGkBhpDMag6xFhZujnFiggRYSvHTPeXikUcZDCsTLezJBgG
	 wgaX8+cMPjk1xKIfIYzBg1SgQxdHzCQCcDmByvoTES969clzzI4nAswvpRz2Wiyaoz5IX
	 6+3a9AxPgMIeGGP168U+Fdk7FQbZsE7y7FHidm+R4O0SPf2el6clnuZc4nUn4q1lbfw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790060951;
	bh=KFrbYWV+xg1596/a/fAA/CnUwsWRSFwTVDL+yhUBo7g=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UTSP0QbvQ6LoRelgAv3soCD2s8YX1sByvTUjeaLWme2qVpU6BrjsOD7rcztniehmq
	 V1olUS9zkFW3C7g/8Dw0lotEPH59g1JRB27d1sUKbKBwVVPOysHuZl50zrv9u3T5ig
	 qnAHUK30YoJCqFydwPZjSD5YsFaS2abstHkVjcvuUktdqCV+MnZyDDTh7qv75SNl1v
	 Ll55F6lVxVKF8Yxbb08oXYM/XSoD6ffLf+o2V70uUWBMRJVxSGMKwvpHvp+nXACuUU
	 HW0+N4fC52XJ7QBIdIyXQegzvIVAOhMPimq+iqtRgRjc//af5knXoA825bGHqRH7eZ
	 gVeZUSEqntWqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2795960662;
	Tue, 22 Sep 2026 07:09:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BAEC69D1
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 07:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0A4D80CD3
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 07:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IDlc0Wqx73X3 for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 07:09:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9CBDE80CBF
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a0e:73c2:602:2002::118"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790060948;
 b=p4n1gBVWfNZvrECYN26xXrpvYyzNw/titZ57eVwYelTvE5yAG8b1/9tZKYCOSdaMuoxL
 SZBvwLxCwC2XcUjH21TAf2m8LkqSMbVcpGTOIq/5YCm/4kIX5aZ4NpeouCTsjRnVWf6Pv
 Rf/kBYbPUd3lDZEu2IFPZ/IeEfRUALIwFTzJmndZ4DQ48v6R8gFpKqdIk5BDJa28qkQbH
 LoY7E7H1Dp7AK3HT246eo7QvgoB6JzUkW+fJXE0HPQybg+fxKYCzqyvbb37XTLTqx1GJI
 DXEviGLUz9GNCHW3NBWrqCR5N3R9Th58JmKwm6iQkxZHnyUen+ngfyjS3QXkuwrIfZw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790060948;
 h=X-Greylist:Received-SPF:Received-SPF:Received:DKIM-Signature:
 X-Authentication-Warning:Message-ID:Subject:From:To:Cc:Date:
 In-Reply-To:References:Content-Type:User-Agent:MIME-Version;
 bh=/JNRPhNWDNjlTySmAVwX7o3Wxv7S8LEqWmWtbgvkpsA=;
 b=VrSWLCKONF2r0kCOAUgGwpYZ6k2sDgM48e9OfnvHq2Hi0tNU167e9w53TlAdSP4y4+B0
 Y37q5sRs6qFLwMdq69igzN1DJSkJWNFCnPdHrOdZS45Pelkb1XvqvoeqtONpZKgBB/DI4
 Qn+Ghnd2RdlykcNst3cAcEs4VFI2yntAav23uvZjHinypo1nYme9wo32UbwDjyuKDBlXL
 jrpNkHYnaGFb2h8IFg0KBbgV4iQunOR4F6gZwxiyeBUZK7Cq17WQChi+0PguUXSVwSdo/
 ikACbaowuCmWWJXlJ22pJBiajjBTsaboPalHdf920wZXklcvjHUuBbl1Fw6Y9nqstxA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=sonologic.nl; 
 dkim=pass header.d=sonologic.nl header.i=@sonologic.nl header.a=rsa-sha256
 header.s=dkim header.b=Yh7JaJXR; 
 arc=none smtp.remote-ip="2a0e:73c2:602:2002::118"
X-Greylist: delayed 123 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 22 Sep 2026 07:09:07 UTC
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=sonologic.nl
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=sonologic.nl header.i=@sonologic.nl header.a=rsa-sha256
 header.s=dkim header.b=Yh7JaJXR
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a0e:73c2:602:2002::118; helo=mx1.sonologic.net;
 envelope-from=gmc@sonologic.nl; receiver=<UNKNOWN> 
Received: from mx1.sonologic.net (mx1.sonologic.net
 [IPv6:2a0e:73c2:602:2002::118])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CBDE80CBF
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 07:09:07 +0000 (UTC)
Received-SPF: pass (mx1.sonologic.net: authenticated connection)
 receiver=mx1.sonologic.net; client-ip=2a0e:73c2:602:2001:9745:3c6e:b6a6:dcd5;
 helo=[IPv6:2a0e:73c2:602:2001:9745:3c6e:b6a6:dcd5];
 envelope-from=gmc@sonologic.nl;
 x-software=spfmilter 2.2 http://www.acme.com/software/spfmilter/ with
 libspf2-1.2.11; 
Received: from [IPv6:2a0e:73c2:602:2001:9745:3c6e:b6a6:dcd5]
 (2a0e-73c2-602-2001-9745-3c6e-b6a6-dcd5.ipv6.karabro.net
 [IPv6:2a0e:73c2:602:2001:9745:3c6e:b6a6:dcd5]) (authenticated bits=0)
 by mx1.sonologic.net (8.18.2/8.18.1) with ESMTPSA id 68M78mxM020361
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 22 Sep 2026 09:08:49 +0200 (CEST)
 (envelope-from gmc@sonologic.nl)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sonologic.nl; s=dkim;
 t=1790060929; bh=sDaEJqGGoiJoKt/mmx8rd7Z6DFnNcT69xchtaHttAJA=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=Yh7JaJXRpLzNjtkUr/JNVeYrWuQJFlEdeKqpM7tUR/ZaG16Czcj3MGbc5LaIn0lyS
 00Vn4TE8EjvaP7kjZ17K83pi1WxrU310NMK02QX56caG1gNLz/BgSYE+3AoupETHtN
 1DbxGZgupaB1wBq7zKSMFQuaxFYsbhr6uIoowg6U4xNChWppw4KY15XcmQ+tzCI+Ty
 XnZRm1g7e2QV6cX2KDx7CP2//feRUQERxO4qkjLUupcQLktcSHEoeR4IeLBIZ+s2IR
 L3YjG2bgT58Vxa/nFplhTNQm7Oosb32sO1d2CoWLqDpakKMtGP+n9LgJmtRY3kCjtt
 nA0f2WlcggEHw==
X-Authentication-Warning: mx1.sonologic.net: Host
 2a0e-73c2-602-2001-9745-3c6e-b6a6-dcd5.ipv6.karabro.net
 [IPv6:2a0e:73c2:602:2001:9745:3c6e:b6a6:dcd5] claimed to be
 [IPv6:2a0e:73c2:602:2001:9745:3c6e:b6a6:dcd5]
Message-ID: <68b45c0661aa9b73aa28aa982bd4206230445ecd.camel@sonologic.nl>
From: Koen Martens <gmc@sonologic.nl>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, James Hilliard
 <james.hilliard1@gmail.com>
Cc: Adam Duskett <aduskett@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 buildroot	 <buildroot@buildroot.org>, Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov	 <aleksandr.o.makarov@gmail.com>, Zoltan Gyarmati
 <mr.zoltan.gyarmati@gmail.com>, Marcin Bis <marcin@bis.org.pl>, Robert
 Rose <robertroyrose@gmail.com>, Adam Duskett	
 <adam.duskett@amarulasolutions.com>, Yair Ben Avraham
 <yairba@protonmail.com>, Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 =?ISO-8859-1?Q?C=E9dric_Ch=E9pied?=	 <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, Dario
 Binacchi <dario.binacchi@amarulasolutions.com>, Titouan Christophe
 <titouan.christophe@mind.be>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>, Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter	 <richterphilipp.pops@gmail.com>, Thomas Devoogdt
 <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>, Roy Kollen
 Svendsen <roykollensvendsen@gmail.com>, Brandon Maier	
 <brandon.maier@collins.com>, Francois Perrad
 <francois.perrad.86@gmail.com>, =?ISO-8859-1?Q?No=E9?= Rubinstein	
 <noe.rubinstein@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky	 <yurovsky@gmail.com>, =?ISO-8859-1?Q?Andr=E9?= Zwing
 <nerv@dawncrow.de>, Daniel Price <daniel.price@gmail.com>, Christian Hitz
 <christian@klarinett.li>, Gregory Dymarek	 <gregd72002@gmail.com>, Stefan
 Ott <stefan@ott.net>, Baxiche Su	 <baxiche@gmail.com>, Philippe Reynes
 <philippe.reynes@softathome.com>, Fabrice Fontaine
 <fabrice.fontaine@orange.com>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Date: Tue, 22 Sep 2026 09:08:48 +0200
In-Reply-To: <arIjwNIjCp-rmGH_@windsurf>
References: <20260919155845.5776-1-bernd@kuhls.net>
 <20260919155845.5776-2-bernd@kuhls.net> <aq-xqh_4_J_v2lQ6@windsurf>
 <CAFSsvmpcYXFia=4TuZGKAEpyciugC5nUn4vM6nYTnAQHG_+G-w@mail.gmail.com>
 <arFb6txpfwW2SwzJ@windsurf>
 <CAFSsvmqhq-xbpkXPFUUnip9=Db9aHv17=sjgojP7rmqXYqgFxw@mail.gmail.com>
 <CADvTj4pPKx2ZxGH5Cct+0ekDTxFXqPPe6HvhnVKj7ig-+S8cvQ@mail.gmail.com>
 <arIjwNIjCp-rmGH_@windsurf>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 01/77] Remove mender packages
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3844406433449354500=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3844406433449354500==
Content-Type: multipart/alternative; boundary="=-zR4WtwaOrOadTM/NTDzL"

--=-zR4WtwaOrOadTM/NTDzL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

tis 2026-09-22 klockan 08:48 +0200 skrev Thomas Petazzoni:
> But overall, yes, AI-assisted review would definitely be welcome. A
> large majority of the reviews point out the same problems over and
> over again, so it shouldn't be too difficult for an AI to learn from
> this.

Please remove me from further discussion on this topic.

I shall also remove myself from the DEVELOPERS list.

Thanks,

Koen


--=-zR4WtwaOrOadTM/NTDzL
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div>tis 2026-09-22 klockan 08:48 +0200 skrev Thomas P=
etazzoni:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border=
-left:2px #729fcf solid;padding-left:1ex"><div>But overall, yes, AI-assiste=
d review would definitely be welcome. A<br></div><div>large majority of the=
 reviews point out the same problems over and<br></div><div>over again, so =
it shouldn't be too difficult for an AI to learn from<br></div><div>this.<b=
r></div></blockquote><div><br></div><div>Please remove me from further disc=
ussion on this topic.</div><div><br></div><div>I shall also remove myself f=
rom the DEVELOPERS list.</div><div><br></div><div>Thanks,</div><div><br>Koe=
n</div><div><br></div><div><span></span></div><div><br></div><div><span></s=
pan></div></body></html>

--=-zR4WtwaOrOadTM/NTDzL--

--===============3844406433449354500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3844406433449354500==--
