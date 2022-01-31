Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB21C433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 11:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE560400C9;
	Mon, 31 Jan 2022 11:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EdeMP35K9RlG; Mon, 31 Jan 2022 11:37:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8544540549;
	Mon, 31 Jan 2022 11:37:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2FEF91BF322
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 11:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D22160BD7
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 11:37:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BcaX6AjctgKy for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 11:37:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E366660B73
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 11:37:34 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 z10-20020a17090acb0a00b001b520826011so18088162pjt.5
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 03:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dk/8RASwWak52VroyhyFzxmjOCIyJDXK5bbfu7EjjBM=;
 b=UWc7MVH3E3+Ejg4a/ULeThYSy2QpDsUyzQ7mGdgG5wA5UNAzslqvgKBlWQsbVfkm/A
 n0uiwgv0FCP+CaNvEw22hiYPnkbd+pc2lOdIY5NhLQVKePUcwyhMXsZhjoVNNBbi2eln
 2R5f19TYH1CrDlmbfV3ockPJ1fQrYrSZZCbwOnNV2ePd1NR5J/5IZnSjwnylRmFqukKd
 1TobPBv6jwn7W+mnhRkDWCnv4SxfgdQWdDRhbMtzb3MoFg0LsOiiDW5p0R9vWA5/BOmj
 aPcukslhvSoa1KQ0hlYS9DNi0e9CAtjzvVNTYKbKSIB9tMZZ8Q1IDpbekdgX1D/4P0Xa
 XCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dk/8RASwWak52VroyhyFzxmjOCIyJDXK5bbfu7EjjBM=;
 b=Z5csFvkZtV01mNR3RazSYVLYIE1ayoklpriyUtxx5qaZk5X32TGDHt403YAPfw1/aA
 sLOE7n+xwZcL4uajcWCwt4C7lQ50iNIuRQliki2w4aK+rg0+DWOWAN0zC4HT+3XmZm+I
 /YciwwPZDlotLJuCZ1MDoZnar97DWYfR51nq+96R8eKpeNp+kVWu5uCmBML7VF72Y/Zi
 I9YXTALwsujVqeHN6ACa+UZSe2Oc94FHSyOWrNf+VRbvXf47fln3O+HZ4WQ8JfDyqMda
 d836HCFX2Ov2WOtateU4ddFwbuv/RKEceWR8UQ3JFM7LREDnDKdRIJXengUc3m7HK4N2
 n/lQ==
X-Gm-Message-State: AOAM530OUY+MLfSIlIN+nhAmMWEdjZs+N4GkGKFyx0ynUUPOfOqpPNCg
 Sek/4a+5AOagni8k1QACRrKcbOtZ/s6FYqCy3yc=
X-Google-Smtp-Source: ABdhPJwYoeYhc7vw8ZmINjWoa5Rv8gWu6s9JZehuQz5fgj9scCa8Rm1D7xM558ljB/vkJ1iQs6nysaSM4jrMv88zyB8=
X-Received: by 2002:a17:90a:bb92:: with SMTP id
 v18mr9506256pjr.177.1643629054216; 
 Mon, 31 Jan 2022 03:37:34 -0800 (PST)
MIME-Version: 1.0
References: <20220129214235.5133-1-thomas.devoogdt@gmail.com>
 <20220129214235.5133-2-thomas.devoogdt@gmail.com>
 <20220130154908.0ff0f0b6@windsurf>
 <20220131000221.GC987440@momiji> <20220130231706.3f6d7a66@windsurf>
In-Reply-To: <20220130231706.3f6d7a66@windsurf>
From: Thomas Devoogdt <thomas.devoogdt@gmail.com>
Date: Mon, 31 Jan 2022 12:37:23 +0100
Message-ID: <CACXRmJiCb10jOtS_eq=-6TYc=Z_yJdQmvHsxV_L9XyTKRJzm6Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/libsoup: add choice between
 libsoup2 and libsoup3
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6042807598538474887=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6042807598538474887==
Content-Type: multipart/alternative; boundary="000000000000eb4ec105d6df358a"

--000000000000eb4ec105d6df358a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Adri=C3=A1n, Thomas, and all,

Adri=C3=A1n:
> Yes, libsoup2 and libsoup3 are parallel-installable, both can coexist in
> the same system. The only caveat is, as I mentioned in a previous email,
> that having both versions loaded in the same process will result in odd
> crashes and assorted failures due to symbols clashing.

Thomas:
> If both libsoup2 and libsoup3 are enabled in the same build, it's going
> to be difficult to guarantee that one application doesn't end up
> loading both, by the usage of separate shared libraries that
> independently use a different version of libsoup.

After reading all those opinions, do we need to go that path?
 - From what I see, most packages do not yet support libsoup3.
 - Packages that do, will also support libsoup2 for a while.

So why not proceed whit libsoup2 as default, but allow to select libsoup3.
We can explicitly mark some packages with `depends on
!BR2_PACKAGE_LIBSOUP_VERSION_3`.
By this, developers can at least start integrating libsoup3 in their custom
packages.

I didn't add `depends on !BR2_PACKAGE_LIBSOUP_VERSION_3` to this path yet.
I think that such flags should be added by the respective package
maintainers (in the next bump cycle).

--> For me, libsoup3 support is important for the additional APIs that
webkitgtk 2.34.4 is providing.

kr,
Thomas

Op zo 30 jan. 2022 om 23:17 schreef Thomas Petazzoni <
thomas.petazzoni@bootlin.com>:

> On Mon, 31 Jan 2022 00:02:21 +0200
> Adrian Perez de Castro <aperez@igalia.com> wrote:
>
> > > Is it possible to install both libsoup2 and libsoup3 side-by-side in
> > > the same system? This requires them having a different library name a=
nd
> > > a different location for header files.
> >
> > Yes, libsoup2 and libsoup3 are parallel-installable, both can coexist i=
n
> > the same system. The only caveat is, as I mentioned in a previous email=
,
> > that having both versions loaded in the same process will result in odd
> > crashes and assorted failures due to symbols clashing.
>
> If both libsoup2 and libsoup3 are enabled in the same build, it's going
> to be difficult to guarantee that one application doesn't end up
> loading both, by the usage of separate shared libraries that
> independently use a different version of libsoup.
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000eb4ec105d6df358a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Adri=C3=A1n, Thomas, and all,<br></div=
><div dir=3D"ltr"><br></div><div dir=3D"ltr">Adri=C3=A1n:=C2=A0<br></div><d=
iv dir=3D"ltr">&gt; Yes, libsoup2 and libsoup3 are parallel-installable, bo=
th can coexist in<br>&gt;=C2=A0the same system. The only caveat is, as I me=
ntioned in a previous email,<br>&gt;=C2=A0that having both versions loaded =
in the same process will result in odd<br>&gt;=C2=A0crashes and assorted fa=
ilures due to symbols clashing.<br></div><div dir=3D"ltr"><br></div><div>Th=
omas:</div><div>&gt; If both libsoup2 and libsoup3 are enabled in the same =
build, it&#39;s going<br>&gt;=C2=A0to be difficult to guarantee that one ap=
plication doesn&#39;t end up<br>&gt;=C2=A0loading both, by the usage of sep=
arate shared libraries that<br>&gt;=C2=A0independently use a different vers=
ion of libsoup.<br></div><div><br></div><div>After reading all those opinio=
ns, do we need to go that path?<br>=C2=A0- From what I see, most packages d=
o not yet support libsoup3.<br>=C2=A0- Packages that do, will also support =
libsoup2 for a while.<br><br>So why not proceed whit libsoup2 as default, b=
ut allow to select libsoup3. <br>We can explicitly mark some packages with =
`depends on !BR2_PACKAGE_LIBSOUP_VERSION_3`.<br>By this, developers can at =
least start integrating libsoup3 in their custom packages.</div><div><br></=
div><div>I didn&#39;t add `depends on !BR2_PACKAGE_LIBSOUP_VERSION_3` to th=
is path yet.</div><div>I think that such flags should be added by the respe=
ctive package maintainers (in the next bump cycle).<br></div><div><br></div=
><div>--&gt; For me, libsoup3 support is important for the additional APIs =
that webkitgtk 2.34.4 is providing.</div><div><br></div><div>kr,</div><div>=
Thomas</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">Op zo 30 jan. 2022 om 23:17 schreef Thomas Petazzoni &lt;<a href=3D"m=
ailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt;:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 31 Jan 20=
22 00:02:21 +0200<br>
Adrian Perez de Castro &lt;<a href=3D"mailto:aperez@igalia.com" target=3D"_=
blank">aperez@igalia.com</a>&gt; wrote:<br>
<br>
&gt; &gt; Is it possible to install both libsoup2 and libsoup3 side-by-side=
 in<br>
&gt; &gt; the same system? This requires them having a different library na=
me and<br>
&gt; &gt; a different location for header files.=C2=A0 <br>
&gt; <br>
&gt; Yes, libsoup2 and libsoup3 are parallel-installable, both can coexist =
in<br>
&gt; the same system. The only caveat is, as I mentioned in a previous emai=
l,<br>
&gt; that having both versions loaded in the same process will result in od=
d<br>
&gt; crashes and assorted failures due to symbols clashing.<br>
<br>
If both libsoup2 and libsoup3 are enabled in the same build, it&#39;s going=
<br>
to be difficult to guarantee that one application doesn&#39;t end up<br>
loading both, by the usage of separate shared libraries that<br>
independently use a different version of libsoup.<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--000000000000eb4ec105d6df358a--

--===============6042807598538474887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6042807598538474887==--
