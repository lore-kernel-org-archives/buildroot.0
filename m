Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E290F606A33D
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SOSq5UHF
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF9916085F;
	Wed,  4 Nov 2026 22:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bYH46YmrRshT; Wed,  4 Nov 2026 22:42:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DA46E6082D
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793832169;
	b=aXY6xCVGkRPTIasVPjBwaiYy8qn+pAgTnEeUU48+hAagTTDo6s2bw2Tlu1SHx82+4pFZ
	 YydFvLiLPXnr7eDaI8WMzzruWFVsI4HFom5crXREh1oGe3gAH9oSh8QIk85Wu1H4/imRr
	 p746xYqLegt+OiOppi0++aQTJ2SDNOYZ1q0pcQnEhumCULGrT/WU0qcgJBT2qq+kXMZms
	 q8sk2kd09/VlccI7dVdzKtQIH2vPeEWBm0iHBjjQc96eS15NPho72QT2SDBOHnDOa0KKJ
	 LR3T5utnPXMeQAvs6AWmAbGaaQ00M0KXeD8NuBV7EXkmJHefq6pir0lmPsohW7JEusQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793832169;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=S00f3vsbQc4PofRurrqGMq9TAViK4suyd1e5RYyR3xc=;
	b=YHJs4gyNQ9cyj84VskhuFjk8E/YVI3TZm50qvoLvjRBOD/jiRqGgCR/zaU7I34a95aFr
	 2a2w2oXUVMCddb27XmogDhWfZMOz/XBJpH34ybnZGn9SN8gusBZbReG41/OjYVp55+lFv
	 BKoMaN5hk2+neM2u6k3/eK7qrsQ10X3+mAydVNVVqwJK3C90YeGHnozagrrskEwpoIMOk
	 v3kh/KkJNFuWd+kOmuiFmykktq0iBkmlZv1qLPb03bsVgjF0EE420bIkZOhlj2bjmHZ7j
	 ikK614bNMFETUxNyngjgoGgTT1eVroGurqb2t7YkRDp66nP4ED8SD3hJMHy/Kt4MxIQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793832168;
	bh=S00f3vsbQc4PofRurrqGMq9TAViK4suyd1e5RYyR3xc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SOSq5UHFDn4skr5bI64edTH6LazhotgyXdAg0J0XGmKOs6XmnEaX8JqNXaCrtXsh4
	 JdPnRl0NZysTTNSZuekVgilIRLiOaPGSU5OcH32lyzO0XqSWVtdk9xpicsrJLSEPWT
	 VlnbbkQ0S9RcIiq3BalWNpL4ZlN9kBI/AVxHYchVtwoRxSmI/VwGtvw/Rxk4u4SY9X
	 HEPvvm9BUR/Hf1J1yCAIgfjk8815aRA4nykcFWVwW1MzdhUGdj+m5sbzjHiNb4N/1P
	 uLXZJd9FT74Un0HwqeaW7A7O7iZBlZdhj9Rq9OTXXk/4fWVKIK4q2IbwhFqT5SfEwA
	 IRykuGA32C94g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA46E6082D;
	Wed,  4 Nov 2026 22:42:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D26237B
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EE5B81266
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vfsX-YKJ3jyS for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:42:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4D5E981255
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D5E981255
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:42:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 7B8CC1A0440
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:42:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3FAB55FD65;
 Wed,  4 Nov 2026 22:42:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D7CF510329271; Wed,  4 Nov 2026 23:42:36 +0100 (CET)
Date: Wed, 4 Nov 2026 23:42:36 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, fontaine.fabrice@gmail.com
Message-ID: <auu0yPag0L5mvMrN@windsurf>
References: <audrTUDPjZfZpyNG@windsurf>
 <20261102160505.1754919-1-thomas.devoogdt@barco.com>
 <auuV_PCwJYLlCadf@windsurf>
 <CACXRmJhjkduyOe2sJUJK59H9Fc-4GehP77t9PSHOnEzqYHcWtQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACXRmJhjkduyOe2sJUJK59H9Fc-4GehP77t9PSHOnEzqYHcWtQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/libgtk4: add missing direct
 dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 10:53:04PM +0100, Thomas Devoogdt wrote:

>     I assume you verified that all those dependencies are not just direct
>     dependencies, but are also _mandatory_ dependencies, correct?
> =

> =

> Yes, all packages are direct and=A0mandatory=A0dependencies.
> =

> cairo: [4]https://gitlab.gnome.org/GNOME/gtk/-/blob/4.21.0/meson.build?re=
f_type
> =3Dtags#L471-473
> harfbuzz: [5]https://gitlab.gnome.org/GNOME/gtk/-/blob/4.21.0/meson.build?
> ref_type=3Dtags#L476-478
> jpeg: [6]https://gitlab.gnome.org/GNOME/gtk/-/blob/4.21.0/meson.build?ref=
_type=3D
> tags#L494
> libdrm: [7]https://gitlab.gnome.org/GNOME/gtk/-/blob/4.21.0/meson.build?
> ref_type=3Dtags#L731
> libfribidi: [8]https://gitlab.gnome.org/GNOME/gtk/-/blob/4.21.0/meson.bui=
ld?
> ref_type=3Dtags#L474-475
> libpng: [9]https://gitlab.gnome.org/GNOME/gtk/-/blob/4.21.0/meson.build?
> ref_type=3Dtags#L492
> tiff: [10]https://gitlab.gnome.org/GNOME/gtk/-/blob/4.21.0/meson.build?re=
f_type
> =3Dtags#L493
> x11: [11]https://gitlab.gnome.org/GNOME/gtk/-/blob/4.21.0/meson.build?ref=
_type=3D
> tags#L606-664

Perfect, thanks for the confirmation!

>     Because for the patch on libgtk3, I think you got this wrong (I'll
>     reply to it separately).
> =

> =

> I will have a look, and also reply=A0separately.

Thanks a lot!

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
