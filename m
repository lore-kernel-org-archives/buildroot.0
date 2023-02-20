Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB13EC636CC
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 14:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CA9160DA0;
	Mon, 20 Feb 2023 14:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CA9160DA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tx8LFcl-TGxh; Mon, 20 Feb 2023 14:23:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 835B760BF2;
	Mon, 20 Feb 2023 14:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 835B760BF2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A3431BF2B4
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 14:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 240F5403F5
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 14:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 240F5403F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U4d6BKNmevMJ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 14:23:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D91C5403ED
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D91C5403ED
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 14:23:53 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id cp9so2652361pjb.0
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 06:23:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m48u30mxSqQ4kkhKoaUIYFwcudrNY7Bvh/y0jtiaDRc=;
 b=O8ULROmuKg2xTG9YNnL03cm8cK5912a4gPDXIhtPXZOnd+2gYcekLUia6Us8LhZ8uJ
 kRnQiuLvCXvzeZICKCtQm+h3EL31hYxNeY9QzdTUpNqxDEKYabI0N0Prlh/JgmpXqRva
 xpnx78wS27lrZFVWKs9KoYZDlwdgSF6IY0Njc5r+ER6rPcllE/ozGC5MmGQlf87hGNxb
 cJgCQn3x4H+ovREqtxjDmffYavt9s3kvd+n+TLs0qEBKdsylcu3N4owOtktdEKBCFLxW
 xBPfKyhx2fT4MYM9azQh514JxsfPYvxqo7DvnMOTxIVVRKqVHUMK0IY68cGRNB8l18fN
 /XtQ==
X-Gm-Message-State: AO0yUKVwlzBu49ytkQE+AQbAnn2PfZUJNU8fN3lFaem87o7aL3SiYXFy
 ANPsYJvh0DjYkLPjwbs/LpgeUrY8t4ZsjFBDmuw=
X-Google-Smtp-Source: AK7set/k/M/JA4Ohes1PHBrJx5reB1ZpNnQ9+eq0PtNv6HWkqu1uxQGKl0JiL8CruWJJwgLZmwugiZhXZg2ayzjpW20=
X-Received: by 2002:a17:90b:3881:b0:234:f45:c117 with SMTP id
 mu1-20020a17090b388100b002340f45c117mr715124pjb.76.1676903033233; Mon, 20 Feb
 2023 06:23:53 -0800 (PST)
MIME-Version: 1.0
References: <20230220112410.953669-1-fontaine.fabrice@gmail.com>
 <20230220150704.7ff37d71@windsurf>
In-Reply-To: <20230220150704.7ff37d71@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 20 Feb 2023 15:23:42 +0100
Message-ID: <CAPi7W81cfaQ_Gk5u5sNHufCATEdrYM4Lgi2gH6hPySPwEYE=jQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=m48u30mxSqQ4kkhKoaUIYFwcudrNY7Bvh/y0jtiaDRc=;
 b=V62A43pklHAo25O43OgqrZWaHQ4h/Jh7uTvvFtOw6l8UDyxy0u9+Hh3VM8qbGfQTwn
 S6b6g/am7+texQWDp4mTy1qrIo0xoCI7HBY0r2pdkvotjjuw5EIYSEMTa10Uuh8RpsVa
 OOdLec9jyZlzZsl3RiD7gvkxyFCMFAfzgcdXrqBF0J8tbfieHyyg8huacQGDZwzT9K8M
 w9leG4epq9QqOlZ4CDHkK2a614naEQH1fBIHopIoGB/a1XSUFh2661Zj2cFzYl2Xej8W
 j2OL+6qNUECARP0aG5y+bg2jyCtFtSicOSG3PGzwWm85ZWSmY8holfeVlBzQcBrlO1gf
 e+xA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=V62A43pk
Subject: Re: [Buildroot] [PATCH 1/1] package/glslsandbox-player: fix build
 with rockchip-mali
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7689908803002853052=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7689908803002853052==
Content-Type: multipart/alternative; boundary="0000000000009e664505f5226999"

--0000000000009e664505f5226999
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 20 f=C3=A9vr. 2023 =C3=A0 15:07, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a =C3=A9crit :

> On Mon, 20 Feb 2023 12:24:10 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > + PKG_CHECK_MODULES([egl], [egl >=3D 1])
> > +-PKG_CHECK_MODULES([glesv2], [glesv2 >=3D 1])
> > ++PKG_CHECK_MODULES([glesv2], [glesv2])
>
> Is this the proper solution, or is the proper solution to patch
> rockchip-mali's .pc file?
>

Patching rockchip-mali is probably better but I don't know what version
number should be put inside glesv2.pc.
Should I hardcode 2 in the pkgconfig file?
Moreover, should I patch the file through a sed in buildroot or send an
upstream patch?
Upstreaming this change is probably impossible as rockchip-mali uses a
commit from October 2018 and the pkgconfig is not available anymore in
usptream master.


>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

Best Regards,

Fabrice

--0000000000009e664505f5226999
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">Le=C2=A0lun. 20 f=C3=A9vr. 2023 =C3=A0=C2=A015:07, Thomas Petazzoni =
&lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@bootli=
n.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Mon, 20 Feb 2023 12:24:10 +0100<br>
Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" target=
=3D"_blank">fontaine.fabrice@gmail.com</a>&gt; wrote:<br>
<br>
&gt; + PKG_CHECK_MODULES([egl], [egl &gt;=3D 1])<br>
&gt; +-PKG_CHECK_MODULES([glesv2], [glesv2 &gt;=3D 1])<br>
&gt; ++PKG_CHECK_MODULES([glesv2], [glesv2])<br>
<br>
Is this the proper solution, or is the proper solution to patch<br>
rockchip-mali&#39;s .pc file?<br></blockquote><div><br></div><div>Patching =
rockchip-mali is probably better but I don&#39;t know what version number s=
hould be put inside glesv2.pc.</div><div>Should I hardcode 2 in the pkgconf=
ig file?</div><div>Moreover, should I patch the file through a sed in build=
root or send an upstream patch?</div><div>Upstreaming this change is probab=
ly impossible as rockchip-mali uses a commit from October 2018 and the pkgc=
onfig is not available anymore in usptream master.</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br></blockquote><div><br></div><div>Best Regards,</div><d=
iv><br></div><div>Fabrice<br></div></div></div>

--0000000000009e664505f5226999--

--===============7689908803002853052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7689908803002853052==--
