Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484D9C433F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 11:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3D49844B2;
	Fri,  1 Apr 2022 11:42:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pHHM7G1fz5Rk; Fri,  1 Apr 2022 11:42:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2A678448A;
	Fri,  1 Apr 2022 11:42:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7BEF11BF355
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 11:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69A8840538
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 11:42:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xWb8olSsc_G2 for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 11:42:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59355403C4
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 11:42:00 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id z6so2909937iot.0
 for <buildroot@buildroot.org>; Fri, 01 Apr 2022 04:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TDI1zhRU6idrywD/ryu/UzKKjh8IyjwH0XvkPeEIRN8=;
 b=BRJifLadO135VU+SA2DboW/7pcZAjhJTVtiREqpaFTuegDKoQGBnkpBpIVarTvZGs8
 q30W1aOVmk+mhEimFVmejjvWKz/I6HJQCn2yGoLMUZ07FDVsAmqrSNvMpXBTLDAlENUv
 Vmay97+6nEQML28QMcKOzpl1VpRRWAT7bi8BuAuBP0fgwsyMdWt/P4oO2XCJRyGEY5Uk
 Nil+Dh53F4bav7ejBka0amuZAwbh8KL0+aiy/0HOlBgTdc3Y5MaovMt2T/Mj9d9QOWN9
 +FBNU/XGOmrFFoqyTArr3glLShEIUk2JCjXBe0/kF3n3bOX/Fom5z3CoJnaCnZ482jFy
 3Lag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TDI1zhRU6idrywD/ryu/UzKKjh8IyjwH0XvkPeEIRN8=;
 b=q5eOcUBfl/bxtAb2QI099c7LFqlPA80dRm8kE6MepuTpBmEil0BzqSmuRtPa9BkGe2
 EGmmP3TIKrdO5eYB8NO0I7MPVsD5AHOAkFbYxdMWcjlXimHf0bi9eDrNUfxt367JQyxW
 6StMYYlCjS16evKaUJsqeH0w+dz3ITej4QerT98WGLIZTrbaNQIH3nLBRdmCB1v80DWj
 ZvATByi5ZlaHc+jzL3SKCg/MBojAKvZvtGASoBq1sJ8V9dCO/c+XgREzziFQL0M6ZIY5
 EJSEF4t0H7uJdRrfCelhSfepGACMIH0V24Y4KR/Yt7ns+uUWYX03UwpzXw2z1O4G9XRl
 +2Tg==
X-Gm-Message-State: AOAM5307rG88xuspzgWB++RHEVwnq9gRRrajDhU2icPdZdDaaGE3WcC6
 0PCVpWeAzz1MdZYz0TNbB/I7DgccKfX367QBPSrb8vT8H44=
X-Google-Smtp-Source: ABdhPJw590ca5zfd198CgrYOdRyVctozSd1MUBsBtso8ocZ69ukeBXo30A7ZkvE2UwulgZ7pIb/YxjvnPKuaHckzKVw=
X-Received: by 2002:a05:6638:2601:b0:31a:632e:3d69 with SMTP id
 m1-20020a056638260100b0031a632e3d69mr5507954jat.229.1648813319429; Fri, 01
 Apr 2022 04:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeStce6+hEvk54=LGcgwTfPy7f2D_o=463haRjqOAOLj_1A@mail.gmail.com>
 <f10fe951-249a-25cb-b476-20cca3122e65@theobroma-systems.com>
 <CADYjeSt9V+WjTfms4pM7J_g5-jSVE9ngc5uRjXRtfcq0iOtJNg@mail.gmail.com>
 <a44d36f4-05cd-1198-5788-1a5e1ec84c6f@theobroma-systems.com>
In-Reply-To: <a44d36f4-05cd-1198-5788-1a5e1ec84c6f@theobroma-systems.com>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Fri, 1 Apr 2022 13:41:48 +0200
Message-ID: <CADYjeSunuDshm9E8t9y+39tT9a1tu6BT3m=eKEgVG15uWgaM0Q@mail.gmail.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: Re: [Buildroot] Buildroot | ninja build error | /usr/bin/ld:error
 adding symbols: file in wrong format
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
Content-Type: multipart/mixed; boundary="===============3249352768210680966=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3249352768210680966==
Content-Type: multipart/alternative; boundary="00000000000034a24805db9644e0"

--00000000000034a24805db9644e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Quentin,

make casync
>
> if you want it in an image created by Buildroot, modify your config with
> make menuconfig and save your changes, then run make.
>

But will this create binary for host system also? Sorry, its bit confusing
here.

I need casync tool use with "rauc" as given in
https://rauc.readthedocs.io/en/latest/advanced.html#creating-casync-bundles

When I do "rauc convert --cert=3D<certfile> --key=3D<keyfile>
--keyring=3D<keyring> conventional-bundle.raucb casync-bundle.raucb"

I get:

"Failed to create bundle: Failed to start casync: Failed to execute child
process ?casync? (No such file or directory)"

So, casync doesn't exist.

My understanding is that Buildroot should be able to properly set up meson
for cross-compilation.

I ran make casync and now casync is part of rootfs image. But I need casync
on host to use with rauc.

Any advice on how to proceed will be helpful.

Thanks in advance

On Fri, 1 Apr 2022 at 11:50, Quentin Schulz <
quentin.schulz@theobroma-systems.com> wrote:

> Hi,
>
> On 4/1/22 11:42, Sourabh Hegde wrote:
> > Hello Quentin,
> >
> > Thanks for the update.
> >
> > I am following this guideline
> >
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_systemd=
_casync-23building-2Dcasync&d=3DDwIFaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLe=
xDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DE7Vx6coYDXR=
Y655Egik49UZpZDdQ2JWKiYWJBrFF9kw3yPPVRGS-GvW7LrRZTcZV&s=3DRs7PUiLj89kkH7rFu=
4ocmrVT20cGAtkh-dF1BLw4Dns&e=3D
> . It says to build casync
> > run:
> >
> > meson build && ninja -C build && sudo ninja -C build install
> >
> > Actually, meson-build is successful but while running "ninja -C build" =
I
> am
> > getting above errors.
> >
>
> Upstream projects usually don't account for cross-compilation and some
> tricks might be needed for build systems to correctly compile some
> pieces of software. So just reuse whatever the build system is giving
> you first before trying without. That means using package
> makefiles/recipes if they already exist.
>
> > Having the actual package makefile for your casync package would help a
> >> lot if it still does not work.
> >>
> >
> > I found this in
> >
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_buildro=
ot_buildroot_blob_master_package_casync_casync.mk&d=3DDwIFaQ&c=3D_sEr5x9kUW=
huk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-17=
2IIy1t&m=3DE7Vx6coYDXRY655Egik49UZpZDdQ2JWKiYWJBrFF9kw3yPPVRGS-GvW7LrRZTcZV=
&s=3DqykqjQKn5qe2ldZRFFEFO8SkK7wArzNb80WRnjwPc3s&e=3D
> >
> > But how to use this to compile casync?
> >
>
> make casync
>
> if you want it in an image created by Buildroot, modify your config with
> make menuconfig and save your changes, then run make.
>
> Cheers,
> Quentin
>

--00000000000034a24805db9644e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello=C2=A0Quentin,<div><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">make casync<br><br>if you want it in an image cre=
ated by Buildroot, modify your config with<br>make menuconfig and save your=
 changes, then run make.<br></blockquote><div><br></div><div>But will this =
create binary for host system also? Sorry, its bit confusing here.</div><di=
v><br></div><div>I need casync tool use with &quot;rauc&quot; as given in=
=C2=A0<a href=3D"https://rauc.readthedocs.io/en/latest/advanced.html#creati=
ng-casync-bundles">https://rauc.readthedocs.io/en/latest/advanced.html#crea=
ting-casync-bundles</a>=C2=A0</div><div><br></div><div>When I do &quot;rauc=
 convert=C2=A0--cert=3D&lt;certfile&gt; --key=3D&lt;keyfile&gt; --keyring=
=3D&lt;keyring&gt; conventional-bundle.raucb casync-bundle.raucb&quot;</div=
><div><br></div><div>I get:</div><div><br></div><div>&quot;Failed to create=
 bundle: Failed to start casync: Failed to execute child process ?casync? (=
No such file or directory)&quot;<br></div><div><br></div><div>So, casync do=
esn&#39;t exist.</div><div><br></div><div>My understanding is that Buildroo=
t should be able to properly set up meson for cross-compilation.=C2=A0</div=
><div><br></div><div>I ran make casync and now casync=C2=A0is part of rootf=
s image. But I need casync on host to use with rauc.</div><div><br></div><d=
iv>Any advice on how to proceed will be helpful.</div><div><br></div><div>T=
hanks in advance</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Fri, 1 Apr 2022 at 11:50, Quentin Schulz &lt;<a hr=
ef=3D"mailto:quentin.schulz@theobroma-systems.com">quentin.schulz@theobroma=
-systems.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Hi,<br>
<br>
On 4/1/22 11:42, Sourabh Hegde wrote:<br>
&gt; Hello Quentin,<br>
&gt; <br>
&gt; Thanks for the update.<br>
&gt; <br>
&gt; I am following this guideline<br>
&gt; <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__gith=
ub.com_systemd_casync-23building-2Dcasync&amp;d=3DDwIFaQ&amp;c=3D_sEr5x9kUW=
huk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI=
_-172IIy1t&amp;m=3DE7Vx6coYDXRY655Egik49UZpZDdQ2JWKiYWJBrFF9kw3yPPVRGS-GvW7=
LrRZTcZV&amp;s=3DRs7PUiLj89kkH7rFu4ocmrVT20cGAtkh-dF1BLw4Dns&amp;e=3D" rel=
=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/url?=
u=3Dhttps-3A__github.com_systemd_casync-23building-2Dcasync&amp;d=3DDwIFaQ&=
amp;c=3D_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP=
6m6qZZ4njZguQhZhkI_-172IIy1t&amp;m=3DE7Vx6coYDXRY655Egik49UZpZDdQ2JWKiYWJBr=
FF9kw3yPPVRGS-GvW7LrRZTcZV&amp;s=3DRs7PUiLj89kkH7rFu4ocmrVT20cGAtkh-dF1BLw4=
Dns&amp;e=3D</a>=C2=A0 . It says to build casync<br>
&gt; run:<br>
&gt; <br>
&gt; meson build &amp;&amp; ninja -C build &amp;&amp; sudo ninja -C build i=
nstall<br>
&gt; <br>
&gt; Actually, meson-build is successful but while running &quot;ninja -C b=
uild&quot; I am<br>
&gt; getting above errors.<br>
&gt; <br>
<br>
Upstream projects usually don&#39;t account for cross-compilation and some =
<br>
tricks might be needed for build systems to correctly compile some <br>
pieces of software. So just reuse whatever the build system is giving <br>
you first before trying without. That means using package <br>
makefiles/recipes if they already exist.<br>
<br>
&gt; Having the actual package makefile for your casync package would help =
a<br>
&gt;&gt; lot if it still does not work.<br>
&gt;&gt;<br>
&gt; <br>
&gt; I found this in<br>
&gt; <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__gith=
ub.com_buildroot_buildroot_blob_master_package_casync_casync.mk&amp;d=3DDwI=
FaQ&amp;c=3D_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq=
8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&amp;m=3DE7Vx6coYDXRY655Egik49UZpZDdQ2JWKiY=
WJBrFF9kw3yPPVRGS-GvW7LrRZTcZV&amp;s=3DqykqjQKn5qe2ldZRFFEFO8SkK7wArzNb80WR=
njwPc3s&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.p=
roofpoint.com/v2/url?u=3Dhttps-3A__github.com_buildroot_buildroot_blob_mast=
er_package_casync_casync.mk&amp;d=3DDwIFaQ&amp;c=3D_sEr5x9kUWhuk4_nFwjJtA&a=
mp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&amp=
;m=3DE7Vx6coYDXRY655Egik49UZpZDdQ2JWKiYWJBrFF9kw3yPPVRGS-GvW7LrRZTcZV&amp;s=
=3DqykqjQKn5qe2ldZRFFEFO8SkK7wArzNb80WRnjwPc3s&amp;e=3D</a><br>
&gt; <br>
&gt; But how to use this to compile casync?<br>
&gt; <br>
<br>
make casync<br>
<br>
if you want it in an image created by Buildroot, modify your config with <b=
r>
make menuconfig and save your changes, then run make.<br>
<br>
Cheers,<br>
Quentin<br>
</blockquote></div>

--00000000000034a24805db9644e0--

--===============3249352768210680966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3249352768210680966==--
