Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA138C433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 12:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53CAB404D1;
	Fri, 28 Jan 2022 12:33:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7XENc3SraB2w; Fri, 28 Jan 2022 12:33:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2BD840937;
	Fri, 28 Jan 2022 12:33:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A8CEE1BF332
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 12:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9725D60B0E
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 12:33:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7vjsCI9NhY_Z for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 12:33:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DEE0D60AA7
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 12:33:43 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id a19so40661pfx.4
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 04:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H9S3hAgwf+wCSo18EgvxjT+OLr/mdg9KFFFgYIlTpH4=;
 b=K1xYrJ7FWaq4Cn3MhpzNOxML0Pf3U0to4ArHAk8HlbYOXEMX1YzpiC1DWtfcvFnxAo
 6KEJDTJuFIMXhonXVUgXFVlSVanHfuYj/GuFCNRVwE3MxDq6Po9IVJ01RPY1bA0hsM4s
 nmKesgZnlBDvSkpgAzc1KsbhbqXVVAaAlhc+spdb78jzSFwH084vZTMvyl9l5SwKQv6v
 7rdXge2+oxN6Eq9rxD8Oz8X1T/05LiYqqraP4AEd47EYxe2OSoyHdOGS2JGa198NhySF
 LYri/KrD+gaAf9Y+ziGsywMS9QHDeSIQw65KA+bPhMSG9QNCMmBmXzYRV8I1lF5xbbvB
 GVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H9S3hAgwf+wCSo18EgvxjT+OLr/mdg9KFFFgYIlTpH4=;
 b=omk3KE/oHqFvbLrU/pLAnYEDcP+1dIyBBolDVJFOPDlZeqUmM1XR8KPA/ciVpBtChI
 bJsixpbtqLeCaPz93gEsiBLrZYWksDeb5M6P3JGk7hDZvh1gtZhprecRzwrqQET53wce
 dfjkafSOEoveOmsrbHxZel5UqnmjDCLGzipXqsrHpoziRSWjtG2zAZE4vc8cvA1sq1gV
 Up89Nr5qdxHeMOAIhUa3+hh9UyWnpWdzFrafZJDK7oD4F8Nv+T0zHiSKi0Onhz8I0net
 9+KG21TEULKGsG3nYGRG9AlPhB6J5du53xfNRi7NTo1xC1mwNuyHiXyZLHIQ9fPefaZ+
 62ZQ==
X-Gm-Message-State: AOAM532cqE+nG/9gpa6ZnT7uiIjhs3+IMYVb3LbiE7P8kROn/LGeup17
 I/fo+YtiJjh53p7gx/7Oc2BfI2l0OaYJzfD5qWw=
X-Google-Smtp-Source: ABdhPJzO9UUtPvf26bmbUv45TEr0PJVE8zIA3vMrppG1ShByLlRDkRxm+JllwQ+M/3xFE01sM2a50YlMDJgZ3Y3rDMA=
X-Received: by 2002:a05:6a00:b92:: with SMTP id
 g18mr7944027pfj.62.1643373223090; 
 Fri, 28 Jan 2022 04:33:43 -0800 (PST)
MIME-Version: 1.0
References: <20220128105917.30421-1-thomas.devoogdt@barco.com>
 <20220128105917.30421-2-thomas.devoogdt@barco.com>
 <20220128134223.GB765275@momiji>
In-Reply-To: <20220128134223.GB765275@momiji>
From: Thomas Devoogdt <thomas.devoogdt@gmail.com>
Date: Fri, 28 Jan 2022 13:33:32 +0100
Message-ID: <CACXRmJi3_D1n3tJNXgm+6azeVqY8=cA7gPvfWT8xMbR3Dk8eWA@mail.gmail.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/libsoup: bump to version 3.0.4
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0811407586301004075=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0811407586301004075==
Content-Type: multipart/alternative; boundary="000000000000321c9405d6a3a5d8"

--000000000000321c9405d6a3a5d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Adri=C3=A1n, all,

I tested indeed libsoup3 against webkitgtk 2.34.4 [1]. By dropping
-DUSE_SOUP2=3DON
from your commit, I was able to build webkitgtk 2.34.4.

You are right, other packages will have to migrate as well,
e.g. a GStreamer bump to 1.19.3 is needed [2].

A quick search learns me that BR2_PACKAGE_LIBSOUP is/can be selected in/for=
:
 - BR2_PACKAGE_GMPC (no explicit support mentioned yet)
 - BR2_PACKAGE_GSSDP (support on master branch [3])
 - BR2_PACKAGE_GUPNP_TOOLS (no explicit support mentioned yet)
 - BR2_PACKAGE_GVFS (no explicit support mentioned yet)
 - BR2_PACKAGE_LIBOSTREE (no explicit support mentioned yet)
 - BR2_PACKAGE_MIDORI (no explicit support mentioned yet)
 - BR2_PACKAGE_WPEWEBKIT (no explicit support mentioned yet)

 - BR2_PACKAGE_GST1_PLUGINS_GOOD (starting from 1.19.3)
 - BR2_PACKAGE_GSTD (starting from 1.19.3)
 - BR2_PACKAGE_WEBKITGTK (starting from 2.34.4)

Kr,

Thomas Devoogdt

---
[1]
https://git.sr.ht/~aperezdc/buildroot/commit/5dc402d58659a35a30afd1de1a8fb8=
075034f3fc
[2] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/104=
4
[3] https://gitlab.gnome.org/GNOME/gssdp/-/merge_requests/7


Op vr 28 jan. 2022 om 12:42 schreef Adrian Perez de Castro <
aperez@igalia.com>:

> Hello Thomas, all,
>
> On Fri, 28 Jan 2022 11:59:17 +0100 Thomas Devoogdt <
> thomas.devoogdt@gmail.com> wrote:
> > Drop upstreamed patch:
> >
> https://gitlab.gnome.org/GNOME/libsoup/-/commit/5c3d431bdb094c59997f2a23e=
31e83f815ab667c
> >
> > The gnome option was dropped in:
> >
> https://gitlab.gnome.org/GNOME/libsoup/-/commit/3fcaa882c4eb29fd754cdb6dd=
06195632cb4b52a
> >
> > A new "libnghttp2" dependency is added since libsoup 2.99.6 (HTTP2
> backend):
> >
> https://gitlab.gnome.org/GNOME/libsoup/-/commit/1a1d29c3114ca86c673d0c0b0=
2a492d0962dcfe8
> >
> > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> > ---
> >  Config.in.legacy                              |  6 +++
> >  .../0001-meson.build-set-c_std-to-gnu99.patch | 40 -------------------
> >  package/libsoup/Config.in                     |  6 +--
> >  package/libsoup/libsoup.hash                  |  4 +-
> >  package/libsoup/libsoup.mk                    | 11 ++---
> >  package/midori/Config.in                      |  1 -
> >  6 files changed, 12 insertions(+), 56 deletions(-)
> >  delete mode 100644
> package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
>
> Note that libsoup3 has a new API [1] (and ABI, therefore). Packages using
> libsoup2 may not even compile with libsoup3, or may crash at runtime in
> unexpected ways.
>
> You will need followup patches to modify packages that depend on libsoup
> to make them use libsoup2. For example in package/wpewebkit.mk we are
> currently passing -DUSE_SOUP2=3DON to CMake, which needs to be changed to
> OFF.
>
> Some packages may not even support yet building with libsoup3. Therefore
> we may need to keep the libsoup2 package. This is possible, as both
> versions
> are parallel-installable. But then there is one more issue: one cannot us=
e
> both libraries in the same process. Which means, for example, if wpewebki=
t
> gets changed to use libsoup3, then GStreamer *also* needs to be changed
> because both are used inside WebKit.
>
> These are all reasons why I have not yet sent patches to do the switch.
> Probably we want to discuss how to go ahead with the libsoup3 migration i=
n
> Buildroot.
>
> Cheers,
> =E2=80=94Adri=C3=A1n
>
> ---
> [1] https://libsoup.org/libsoup-3.0/ch02.html
>

--000000000000321c9405d6a3a5d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello=C2=A0Adri=C3=A1n, all,<div><br></div><div>I tested i=
ndeed libsoup3 against webkitgtk 2.34.4 [1]. By dropping -DUSE_SOUP2=3DON</=
div><div>from your commit, I was able to build=C2=A0webkitgtk 2.34.4.</div>=
<div><br></div><div>You are right, other packages will have to migrate as w=
ell,=C2=A0</div><div>e.g. a GStreamer bump to 1.19.3 is needed [2].=C2=A0</=
div><div><br></div><div>A quick search learns me that=C2=A0BR2_PACKAGE_LIBS=
OUP is/can be selected in/for:</div><div>=C2=A0-=C2=A0BR2_PACKAGE_GMPC (no =
explicit support mentioned yet)</div><div>=C2=A0-=C2=A0BR2_PACKAGE_GSSDP (s=
upport on master branch [3])</div><div>=C2=A0-=C2=A0BR2_PACKAGE_GUPNP_TOOLS=
 (no explicit support mentioned yet)</div><div>=C2=A0-=C2=A0BR2_PACKAGE_GVF=
S (no explicit support mentioned yet)</div><div>=C2=A0-=C2=A0BR2_PACKAGE_LI=
BOSTREE (no explicit support mentioned yet)</div><div>=C2=A0-=C2=A0BR2_PACK=
AGE_MIDORI (no explicit support mentioned yet)</div>=C2=A0-=C2=A0BR2_PACKAG=
E_WPEWEBKIT=C2=A0(no explicit support mentioned yet)<div><br></div><div><di=
v>=C2=A0-=C2=A0BR2_PACKAGE_GST1_PLUGINS_GOOD (starting from 1.19.3)</div><d=
iv>=C2=A0-=C2=A0BR2_PACKAGE_GSTD (starting from=C2=A01.19.3)</div></div><di=
v>=C2=A0-=C2=A0BR2_PACKAGE_WEBKITGTK (starting from=C2=A02.34.4)</div><div>=
<br></div><div><div>Kr,</div><div><br></div><div>Thomas Devoogdt</div></div=
><div><br></div><div>---</div><div>[1] <a href=3D"https://git.sr.ht/~aperez=
dc/buildroot/commit/5dc402d58659a35a30afd1de1a8fb8075034f3fc">https://git.s=
r.ht/~aperezdc/buildroot/commit/5dc402d58659a35a30afd1de1a8fb8075034f3fc</a=
></div><div>[2]=C2=A0<a href=3D"https://gitlab.freedesktop.org/gstreamer/gs=
treamer/-/merge_requests/1044">https://gitlab.freedesktop.org/gstreamer/gst=
reamer/-/merge_requests/1044</a></div><div>[3]=C2=A0<a href=3D"https://gitl=
ab.gnome.org/GNOME/gssdp/-/merge_requests/7">https://gitlab.gnome.org/GNOME=
/gssdp/-/merge_requests/7</a></div><div><br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Op vr 28 jan. 2022 om 12:=
42 schreef Adrian Perez de Castro &lt;<a href=3D"mailto:aperez@igalia.com">=
aperez@igalia.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hello Thomas, all,<br>
<br>
On Fri, 28 Jan 2022 11:59:17 +0100 Thomas Devoogdt &lt;<a href=3D"mailto:th=
omas.devoogdt@gmail.com" target=3D"_blank">thomas.devoogdt@gmail.com</a>&gt=
; wrote:<br>
&gt; Drop upstreamed patch:<br>
&gt; <a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/commit/5c3d431bdb0=
94c59997f2a23e31e83f815ab667c" rel=3D"noreferrer" target=3D"_blank">https:/=
/gitlab.gnome.org/GNOME/libsoup/-/commit/5c3d431bdb094c59997f2a23e31e83f815=
ab667c</a><br>
&gt; <br>
&gt; The gnome option was dropped in:<br>
&gt; <a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/commit/3fcaa882c4e=
b29fd754cdb6dd06195632cb4b52a" rel=3D"noreferrer" target=3D"_blank">https:/=
/gitlab.gnome.org/GNOME/libsoup/-/commit/3fcaa882c4eb29fd754cdb6dd06195632c=
b4b52a</a><br>
&gt; <br>
&gt; A new &quot;libnghttp2&quot; dependency is added since libsoup 2.99.6 =
(HTTP2 backend):<br>
&gt; <a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/commit/1a1d29c3114=
ca86c673d0c0b02a492d0962dcfe8" rel=3D"noreferrer" target=3D"_blank">https:/=
/gitlab.gnome.org/GNOME/libsoup/-/commit/1a1d29c3114ca86c673d0c0b02a492d096=
2dcfe8</a><br>
&gt; <br>
&gt; Signed-off-by: Thomas Devoogdt &lt;<a href=3D"mailto:thomas.devoogdt@b=
arco.com" target=3D"_blank">thomas.devoogdt@barco.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 Config.in.legacy=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++<br>
&gt;=C2=A0 .../0001-meson.build-set-c_std-to-gnu99.patch | 40 -------------=
------<br>
&gt;=C2=A0 package/libsoup/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +--<br>
&gt;=C2=A0 package/libsoup/libsoup.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
&gt;=C2=A0 package/libsoup/<a href=3D"http://libsoup.mk" rel=3D"noreferrer"=
 target=3D"_blank">libsoup.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 ++---<br>
&gt;=C2=A0 package/midori/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br>
&gt;=C2=A0 6 files changed, 12 insertions(+), 56 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 package/libsoup/0001-meson.build-set-c_std-to=
-gnu99.patch<br>
<br>
Note that libsoup3 has a new API [1] (and ABI, therefore). Packages using<b=
r>
libsoup2 may not even compile with libsoup3, or may crash at runtime in<br>
unexpected ways.<br>
<br>
You will need followup patches to modify packages that depend on libsoup<br=
>
to make them use libsoup2. For example in package/<a href=3D"http://wpewebk=
it.mk" rel=3D"noreferrer" target=3D"_blank">wpewebkit.mk</a> we are<br>
currently passing -DUSE_SOUP2=3DON to CMake, which needs to be changed to<b=
r>
OFF.<br>
<br>
Some packages may not even support yet building with libsoup3. Therefore<br=
>
we may need to keep the libsoup2 package. This is possible, as both version=
s<br>
are parallel-installable. But then there is one more issue: one cannot use<=
br>
both libraries in the same process. Which means, for example, if wpewebkit<=
br>
gets changed to use libsoup3, then GStreamer *also* needs to be changed<br>
because both are used inside WebKit.<br>
<br>
These are all reasons why I have not yet sent patches to do the switch.<br>
Probably we want to discuss how to go ahead with the libsoup3 migration in<=
br>
Buildroot.<br>
<br>
Cheers,<br>
=E2=80=94Adri=C3=A1n<br>
<br>
---<br>
[1] <a href=3D"https://libsoup.org/libsoup-3.0/ch02.html" rel=3D"noreferrer=
" target=3D"_blank">https://libsoup.org/libsoup-3.0/ch02.html</a><br>
</blockquote></div>

--000000000000321c9405d6a3a5d8--

--===============0811407586301004075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0811407586301004075==--
