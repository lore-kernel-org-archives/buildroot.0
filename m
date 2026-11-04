Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C755606A865
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nCTUscui
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CFC460728;
	Wed,  4 Nov 2026 22:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xLzqtipTtSJ0; Wed,  4 Nov 2026 22:14:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4040B607D5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793830472;
	b=k6qdElfygXWj/0cWpQOAn5RuU1R0wbkFkF7SFZRdUrryJdWjpJLSQiSTcKBAe4ZIeHEZ
	 iJH/BadBqdRNZCs80FngbcXgwHHef+h4RdZviTxA53k1nYGSIQwQis+5ni7zFTFF2kziP
	 WbIVlDL+7IOGMDMY9UHEyU84peeHuMOnPtHaTR8NWvOQ7riUxR6XO8YRSOBFSYYTACpk4
	 TwvJNytzc/djybWKDKXePTcSWEWN4iciWK29i6F8wmauCqpNoixYywb2w4O5s2s2/OYwJ
	 dj6oEacpCSROe2x5Do5BoPGqpZJ0hdf55j8Q5ICnURUr0NhShJ1A7r/Y8iioAV4OyEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793830472;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Forwarded-Encrypted:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:To:Cc:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Errors-To:Sender;
	bh=QgxCGl3tkpsQNB8YzVVfmer3jxDVd27K8MOSIrajR8Y=;
	b=mCwJCjVnl/hIwV4LgMBeJaY7sllXuXZbxwa2kD520tShe+vW753HV+U3N8+sMfKW+QII
	 wpGNVTMItnANpA1BlYsGMe1gMuwQLrVDORJ55UwST/MQuF++PSnp26pXBbNjwI9Uha/ZO
	 6mKKS0R4J5UGhPh/pR3Ub7CEpaD32KU8gnUF3JhAKMGsBJvWS68Y+pVd3zvuof2bUblu4
	 PNylMIg1JOcbFYxw/XcvzqkDQc3OXUJWUo+qHJp1kJpK4Vl/43uIg0kRWMedhU3jZKtur
	 epFKJeW6eLHh/mvCX5rLvdxe1IEYP2c9qBZgXWssCXK+dnf0uHrxdT5zuAvforo7/vw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793830472;
	bh=QgxCGl3tkpsQNB8YzVVfmer3jxDVd27K8MOSIrajR8Y=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nCTUscuiC9leUKFAqFGRiXvpOsTkQjoJiGH79fNOCWed78puiZSj8ZtdBNeigHoF0
	 OWvoOZLSi5Ys/tEB2zjovmQQ3Nm6MaJfS/g+kt6e5/4o10N1438oir5fvH+WpqziF/
	 lGrRENiGpbj55xMkZxWEcwHFaJZqmuUU7iu8cIgXq1ZvyjmtQqCpwUMlPKih7WLit7
	 CbWAIPf+CHOEJrfcBUSE7+YSGVO744/4VGH6DyE2rPwt2JQvg72zBMP/GouvpmENEB
	 9ZhfOT4e7OIROs+cUk013basE1AQgY1WDBKiatFn9wnYWQfjWDa5vsE8PdqdeNWEsS
	 mL5E5QkCcoVwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4040B607D5;
	Wed,  4 Nov 2026 22:14:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1941C362
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AA9940806
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N3JZnIwjJrVC for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:14:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 174CE407FE
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=209.85.160.178
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.160.178;
 helo=mail-qt1-f178.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 174CE407FE
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:14:29 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-5351d76e1baso755891cf.1
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 14:14:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793830468; x=1794435268;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=/E8PNSJJhWLgCsu/kJVq0R4LxK7n0iYDRpHQNA6MzKY=;
 b=GP7JfjJRpLYEXfny2JSZJY/3uUNpHqvW+kV0tti689wfpsdvavJQi/xx76py8ffz28
 yjvD1HWXuXL3uq+zcKSVTUuKRHxZ6HEwLUyvB4KsLe3rU5OnSwgH5yj35j1nZ8Hk2tXN
 EdnvvclCSXD10njmmOXqxP+22yn/hAhd3GlgISUV43RVevKYdJMFZYqYLOdIdBxx5GzF
 bCd7ZDbYjSYkZu7eEUVQzmDkMgRO4v0s3DQlZRJPRXJYi9co5G/ePvEJUZZDkI8/HVvM
 PIjnilukc+UZlB8XWj+DJl3g8llrs3IANcMJdhYQM6gI4R+S47So4HGnPDtMNwDpN7r3
 dNlA==
X-Forwarded-Encrypted: i=1;
 AKwUvBz6WjtG8fZxdGIQ/+nJKouQ1x1N4xbhd7JCQBExPaPMnLjEaI3Zk9dHAZKDmI11TWUJ5FsJnLsGZzE=@buildroot.org
X-Gm-Message-State: APuU4Z9cCZyMoQrNajIVW3LTK5XdFRWiwvFqaaYF4HWBXxDOJToM4WGs
 XGW6QR8rJaTgG69GB4z2zkVQ0obq8KuUNN19z/FRjbxMuSqjKQin4snEHefqsc/M
X-Gm-Gg: AYBFou2HdRErR/5s/vNUNO06VBRMSSHBm26oFNP05pzlMvNivP/1gDKTRAERjYh3mFj
 H6FpS7XBTQOGVkGxxDnWwldZqhPsKRBMJYqXy0146ayE4ZCkCIMQjmvNoQEfWANHj5bh9hmPpTS
 wOAIyXaDK2Oey0cjg0yj+XPlml0PEMlTtaL+EAyyc0+e2zCaB9iVNjB+W77PNV93creFc7yRyhE
 /f6ndfyvz4NaZyi/ZYr5DOqvV5Yx7QdTLrQAN1vKXynQ+6ekW6NekE7jPsQcpvxIljln9TJC0pa
 LIj2QeuCLtRKK07z7bLtgweaLNutBqVh4v4YthOFgYt7uUlcOE+OuIKXoI04UABJpQjPzEtnnoN
 HawgUKr/mGfLZ/7nGEVmFPlVzRR97P2VqG5OPxorxR2XUyeKfx6/tNI6BBahfTff0HqoKHTOtUB
 5LROU9KXNZfM5S7+hSRMKseDIYEXaSR2cldMFxuWnewQOOODODTxdfLpwctYtgoNCCu4kOl1TVU
 ODHeXzQO9kEIqcP5Cf61srtmpLkzvaORo8En+vEInVgCjNMU1WFLoyA9Mow7z3eRY+dnT6eZ47M
 ls4YP280vHgBdSqag08TaPmFB8GxQu5n9ek291ylLamvG6EHN2rXz2BwPdrNEwwMSSHMlxZvmPv
 sby1/TsPf2TUBJFNi7k9MLxKnzQkneG6Lb9/gHFkHim6bA6S/JHgXUXcr3pjqCk/RXJyYtjTGuz
 FlNxzm1w==
X-Received: by 2002:a05:622a:480e:b0:549:bbb2:d050 with SMTP id
 d75a77b69052e-54c9b337acfmr15903721cf.18.1793830468297; 
 Wed, 04 Nov 2026 14:14:28 -0800 (PST)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com.
 [209.85.219.52]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91e7dad276csm30498286d6.2.2026.11.04.14.14.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 14:14:27 -0800 (PST)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-91b9e758c50so769006d6.1
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 14:14:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AKwUvByhITep9yrvMNUBJAseXCmzg3krtmcifHCZmoZlsCONNiGqGo423DzPEOOJLcr7ciU2KGpp+i6CBi8=@buildroot.org
X-Received: by 2002:a05:6214:f09:b0:91c:7a6d:ddd8 with SMTP id
 6a1803df08f44-91e93e360fdmr19360926d6.0.1793830467599; Wed, 04 Nov 2026
 14:14:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <audrTUDPjZfZpyNG@windsurf>
 <20261102160505.1754919-1-thomas.devoogdt@barco.com>
 <20261102160505.1754919-3-thomas.devoogdt@barco.com>
 <auuWSHnhQQkIunzF@windsurf>
In-Reply-To: <auuWSHnhQQkIunzF@windsurf>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Wed, 4 Nov 2026 23:14:16 +0100
X-Gmail-Original-Message-ID: <CACXRmJiBtFOHY4_nTtkKXn5CwN0BGJ+vz6b4bCC-bd1XX2s+tw@mail.gmail.com>
X-Gm-Features: AclHuK_NjW7Tj2nLx_xDd859HWrQzEt5XHcdVbwxqZqtyvy2J10Ph9aKi9PNnrs
Message-ID: <CACXRmJiBtFOHY4_nTtkKXn5CwN0BGJ+vz6b4bCC-bd1XX2s+tw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org, 
 fontaine.fabrice@gmail.com, 
 Copilot <223556219+Copilot@users.noreply.github.com>
Subject: Re: [Buildroot] [PATCH v2] package/libgtk3: add missing direct
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
Content-Type: multipart/mixed; boundary="===============6913121047847072031=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-0.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6913121047847072031==
Content-Type: multipart/alternative; boundary="000000000000cf0366065f7ab362"

--000000000000cf0366065f7ab362
Content-Type: text/plain; charset="UTF-8"

Hi Thomas

Op wo 4 nov 2026 om 21:34 schreef Thomas Petazzoni <
thomas.petazzoni@bootlin.com>:

> On Mon, Nov 02, 2026 at 05:05:05PM +0100, Thomas Devoogdt wrote:
> > From: Thomas Devoogdt <thomas@devoogdt.com>
> >
> > GTK3 links directly against fribidi (mandatory) and harfbuzz
> > (auto-detected).
>
> Wait, does this mean that harfbuzz is not mandatory? If it isn't
> mandatory, it shouldn't be an unconditional dependency of libgtk3.
>
> My quick reading of the meson.build seems to indicate that it is
> mandatory when the x11 or wayland backends are used, but not with the
> broadway backend.
>
> So perhaps the BR2_PACKAGE_LIBGTK3_WAYLAND and BR2_PACKAGE_LIBGTK3_X11
> should select BR2_PACKAGE_HARFBUZZ, and libgtk3.mk should contain:
>
> ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
> LIBGTK3_DEPENDENCIES += harfbuzz
> endif
>
> Could you double check this?
>

You are right, harfbuzz is indeed only needed when the x11 or wayland
backends are used.
It's also true that harfbuzz is anyway selected through pango. I will
resend the patch with your
proposal as it is strictly speaking more correct.

Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>
>
Kr,

Thomas Devoogdt

--000000000000cf0366065f7ab362
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Thomas</div><br><div class=3D"gmail_quote gmail_qu=
ote_container"><div dir=3D"ltr" class=3D"gmail_attr">Op wo 4 nov 2026 om 21=
:34 schreef Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin=
.com">thomas.petazzoni@bootlin.com</a>&gt;:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Mon, Nov 02, 2026 at 05:05:05PM +0100, Thoma=
s Devoogdt wrote:<br>
&gt; From: Thomas Devoogdt &lt;<a href=3D"mailto:thomas@devoogdt.com" targe=
t=3D"_blank">thomas@devoogdt.com</a>&gt;<br>
&gt; <br>
&gt; GTK3 links directly against fribidi (mandatory) and harfbuzz<br>
&gt; (auto-detected).<br>
<br>
Wait, does this mean that harfbuzz is not mandatory? If it isn&#39;t<br>
mandatory, it shouldn&#39;t be an unconditional dependency of libgtk3.<br>
<br>
My quick reading of the meson.build seems to indicate that it is<br>
mandatory when the x11 or wayland backends are used, but not with the<br>
broadway backend.<br>
<br>
So perhaps the BR2_PACKAGE_LIBGTK3_WAYLAND and BR2_PACKAGE_LIBGTK3_X11<br>
should select BR2_PACKAGE_HARFBUZZ, and <a href=3D"http://libgtk3.mk" rel=
=3D"noreferrer" target=3D"_blank">libgtk3.mk</a> should contain:<br>
<br>
ifeq ($(BR2_PACKAGE_HARFBUZZ),y)<br>
LIBGTK3_DEPENDENCIES +=3D harfbuzz<br>
endif<br>
<br>
Could you double check this?<br></blockquote><div><br></div><div>You are ri=
ght, harfbuzz is indeed only needed when=C2=A0the x11 or wayland backends a=
re used.</div><div>It&#39;s also true that=C2=A0harfbuzz is anyway selected=
 through pango. I will resend the patch with your</div><div>proposal as it =
is strictly=C2=A0speaking more correct.</div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
Thanks a lot!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br></blockquote><div><br></div><div>Kr,</div><div><br></div><div>Thomas De=
voogdt=C2=A0</div></div></div>

--000000000000cf0366065f7ab362--

--===============6913121047847072031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6913121047847072031==--
