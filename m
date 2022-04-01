Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E96AC433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 09:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12808405BE;
	Fri,  1 Apr 2022 09:43:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VGZUEVAyHqw8; Fri,  1 Apr 2022 09:43:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A02440607;
	Fri,  1 Apr 2022 09:42:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0DE801BF376
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 09:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E65A942577
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 09:42:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PkTV72k3kXUZ for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 09:42:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7189C42569
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 09:42:54 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id r2so2512685iod.9
 for <buildroot@buildroot.org>; Fri, 01 Apr 2022 02:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6RSbhunMOaVSCjDt4XYVl1S/PbrrubNi7ADumtyXP8Y=;
 b=qW0UP3I7HMoN+4XOlopTjZ1J15CchlzyDuyiiYFVd+UpviWmFoKf+8y21IFOWpaGHC
 hJai3FuuNlI0nnwuna/I2/No8PJljTKO84/HFGL+fUw2KeFCyR9BBH2WV67ShtiNC7C7
 Yl/xDwXMvDbrHrY7ksWfkPjn0cO0CWEYvtjPYe9GWAtK84ZXzSCtQedr+8JJIeg3fhrE
 Hjod5Avv3hKw29e8mUEvzviBLmtzEthpxqXx2v6bTQ860olUtOSMon512nMJiwQZV9Vg
 GW6BZD9GX3OF17rbCD19reKOd9mW2iuCPla5vhJnUl1MmXaxAzriXfLXoFUkn2C60Ai7
 AMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6RSbhunMOaVSCjDt4XYVl1S/PbrrubNi7ADumtyXP8Y=;
 b=hA9UYCcuo4IeeQprmjfQvVcRgAQll0RdBDVYn29GyNh12iwoNpP62Qtm6MF5lBfDdc
 Opo9z1eFlJk6UpFzn+rpqMXhMQ/89E+5uN4EHAX/rmJiNAIR/F73Crj9c8xefk9INXHS
 yrSGL8Nid7ka1RFCuoDiww44yJqvYgg+PtlxkfHUr34ETZek2TbZc7yZFh//w/b+p/I8
 GQaZKA/uXlSHB4AFk8WeiYYxayODa+dESjkzgx2gyo+PXJWUUO4+qHoINWIqqh8pO8nO
 Kkc5Driw+mZfS4oBgpQDVYDgYPs35lMSPIunjIRBTTI8TYTaXhD+VWxWBR0wAGwkBvR8
 ee2A==
X-Gm-Message-State: AOAM531D1v42eirT3RNFbi86ZSrj92Cv1eYDFIqGILS/EBF2w+eyFd1T
 Bo+VCKahMZaVWJGQzZ2s8/FGuyuR0Yq5JBSY8GRG0QeZ60g=
X-Google-Smtp-Source: ABdhPJxHlS+5Gm6LD1RbWlI27hYmlH4la98omTjOyfzyCoth2R2hEC8B2SArCbREgXLs9dgDxLHSQoRGLHC0nkNuyGQ=
X-Received: by 2002:a5e:a80a:0:b0:645:b477:bc23 with SMTP id
 c10-20020a5ea80a000000b00645b477bc23mr15907147ioa.191.1648806174015; Fri, 01
 Apr 2022 02:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeStce6+hEvk54=LGcgwTfPy7f2D_o=463haRjqOAOLj_1A@mail.gmail.com>
 <f10fe951-249a-25cb-b476-20cca3122e65@theobroma-systems.com>
In-Reply-To: <f10fe951-249a-25cb-b476-20cca3122e65@theobroma-systems.com>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Fri, 1 Apr 2022 11:42:42 +0200
Message-ID: <CADYjeSt9V+WjTfms4pM7J_g5-jSVE9ngc5uRjXRtfcq0iOtJNg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============4476225011884157402=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4476225011884157402==
Content-Type: multipart/alternative; boundary="0000000000004e423b05db949a66"

--0000000000004e423b05db949a66
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Quentin,

Thanks for the update.

I am following this guideline
https://github.com/systemd/casync#building-casync . It says to build casync
run:

meson build && ninja -C build && sudo ninja -C build install

Actually, meson-build is successful but while running "ninja -C build" I am
getting above errors.

Having the actual package makefile for your casync package would help a
> lot if it still does not work.
>

I found this in
https://github.com/buildroot/buildroot/blob/master/package/casync/casync.mk

But how to use this to compile casync?

Can you please let me know what needs to be done?

Thanks in advance.

Actually, meson-build is successful

On Fri, 1 Apr 2022 at 11:11, Quentin Schulz <
quentin.schulz@theobroma-systems.com> wrote:

> Hi Sourabh Hegde,
>
> On 3/31/22 19:55, Sourabh Hegde wrote:
> > Hello All,
> >
> > While building casync using ninja build I am facing below errors
> > related to /usr/bin/ld:
> > . . .error adding symbols: file in wrong format
> >
> > I am following "casync" build guideline from
> >
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_systemd=
_casync-23building-2Dcasync&d=3DDwIBaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLe=
xDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DEZ6d819a1qu=
3uAFg1GbEGsYi60IPAlDkSahx_NFWucv2-olGfFGlWcnc8_-v_gj4&s=3D0oAe2qUNmvkBsGYIi=
apGRQ5OQYDghVxojZm5QaWUwiQ&e=3D
> > <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_ninja-2=
Dbuild_ninja_issues_url&d=3DDwIBaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7=
rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DEZ6d819a1qu3uAF=
g1GbEGsYi60IPAlDkSahx_NFWucv2-olGfFGlWcnc8_-v_gj4&s=3D7qFZDk5q2JFekiEteeOVN=
jQj50e86tte0akp-uMLm7k&e=3D
> > , it uses "meson " along
> > with ninja build.
> >
> > If build failures persist, run "meson setup --wipe" to rebuild from
> scratch
> > using the same options as passed when configuring the build.
> > To change option values, run "meson configure" instead.
> > ninja: Entering directory build'
> > [1/31] Linking target casync-http
> > FAILED: casync-http
> > cc -o casync-http casync-http.p/src_casync-http.c.o -Wl,--as-needed
> > -Wl,--no-undefined
> >
> -Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-lin=
ux-gnu/sysroot/usr/lib
> >
> -Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroo=
t-linux-gnu/sysroot/usr/lib
> > -Wl,--start-group src/libshared.a
> >
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysr=
oot/usr/lib/libcurl.so
> >
> >
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysr=
oot/usr/lib/libssl.so
> >
> >
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysr=
oot/usr/lib/libcrypto.so
> >
> >
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysr=
oot/usr/lib/liblzma.so
> >
> >
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysr=
oot/usr/lib/libz.so
> >
>  /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sys=
root/usr/lib/libzstd.so
> > -lm -Wl,--end-group
> > /usr/bin/ld:
> >
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysr=
oot/usr/lib/libcurl.so:
> > error adding symbols: file in wrong format
> > collect2: error: ld returned 1 exit status
> > [2/31] Linking target test-cachunk
> > FAILED: test-cachunk
> > cc -o test-cachunk test-cachunk.p/test_test-cachunk.c.o -Wl,--as-needed
> > -Wl,--no-undefined
> >
> -Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-lin=
ux-gnu/sysroot/usr/lib
> >
> -Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroo=
t-linux-gnu/sysroot/usr/lib
> > -Wl,--start-group src/libshared.a -lacl
> >
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysr=
oot/usr/lib/liblzma.so
> >
> >
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysr=
oot/usr/lib/libselinux.so
> >
> >
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysr=
oot/usr/lib/libz.so
> >
>  /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sys=
root/usr/lib/libzstd.so
> > -lm
> >
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysr=
oot/usr/lib/libssl.so
> >
>  /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sys=
root/usr/lib/libcrypto.so
> > -Wl,--end-group -pthread
> > /usr/bin/ld:
> >
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysr=
oot/usr/lib/liblzma.so:
> > error adding symbols: file in wrong format
> > collect2: error: ld returned 1 exit status
> > [3/31] Linking target test-cachunker
> > FAILED: test-cachunker
> > cc -o test-cachunker test-cachunker.p/test_test-cachunker.c.o
> > -Wl,--as-needed -Wl,--no-undefined
> >
> -Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-lin=
ux-gnu/sysroot/usr/lib
> >
> -Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroo=
t-linux-gnu/sysroot/usr/lib
> > -Wl,--start-group src/libshared.a -lacl
> >
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysr=
oot/usr/lib/liblzma.so
> >
> >
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysr=
oot/usr/lib/libselinux.so
> >
> >
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysr=
oot/usr/lib/libz.so
> >
>  /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sys=
root/usr/lib/libzstd.so
> > -lm
> >
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysr=
oot/usr/lib/libssl.so
> >
>  /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sys=
root/usr/lib/libcrypto.so
> > -Wl,--end-group -pthread
> > /usr/bin/ld:
> >
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysr=
oot/usr/lib/liblzma.so:
> > error adding symbols: file in wrong format
> > collect2: error: ld returned 1 exit status
> > [4/31] Linking target test-caencoder
> > FAILED: test-caencoder
> > cc -o test-caencoder test-caencoder.p/test_test-caencoder.c.o
> > -Wl,--as-needed -Wl,--no-undefined
> >
> -Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-lin=
ux-gnu/sysroot/usr/lib
> >
> -Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroo=
t-linux-gnu/sysroot/usr/lib
> > -Wl,--start-group src/libshared.a -lacl
> >
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysr=
oot/usr/lib/liblzma.so
> >
> >
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysr=
oot/usr/lib/libselinux.so
> >
> >
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysr=
oot/usr/lib/libz.so
> >
>  /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sys=
root/usr/lib/libzstd.so
> > -lm
> >
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysr=
oot/usr/lib/libssl.so
> >
>  /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sys=
root/usr/lib/libcrypto.so
> > -Wl,--end-group -pthread
> > /usr/bin/ld:
> >
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysr=
oot/usr/lib/liblzma.so:
> > error adding symbols: file in wrong format
> > collect2: error: ld returned 1 exit status
> > .
> > .
> > [10/31] Compiling C object test-camatch.p/test_test-camatch.c.o
> > ninja: build stopped: subcommand failed.
> >
> > I am using Buildroot as build system and after following similar post i=
n
> >
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__stackoverflow.com_=
questions_27967802_libstdc-2Dso-2Derror-2Dadding-2Dsymbols-2Dfile-2Din-2Dwr=
ong-2Dformat&d=3DDwIBaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw=
5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DEZ6d819a1qu3uAFg1GbEGsYi60=
IPAlDkSahx_NFWucv2-olGfFGlWcnc8_-v_gj4&s=3DxHy7bTlAyWOY4-lBdA9bwycscXiZBIO-=
Wkz7PZC9vbs&e=3D
> > <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_ninja-2=
Dbuild_ninja_issues_url&d=3DDwIBaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7=
rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DEZ6d819a1qu3uAF=
g1GbEGsYi60IPAlDkSahx_NFWucv2-olGfFGlWcnc8_-v_gj4&s=3D7qFZDk5q2JFekiEteeOVN=
jQj50e86tte0akp-uMLm7k&e=3D
> > I changed the PATH
> > environment
> > like:
> >
> >
> /root/raspcm4/sources/output/host/bin/:/root/bin:/usr/local/sbin:/usr/loc=
al/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/raspcm4/sources/output/host/aarc=
h64-buildroot-linux-gnu/sysroot/usr/bin
> >
> > But still, I end up getting the same errors
> >
> > Can anyone please let me know how to resolve this issue? Is there any
> ninja
> > build option to be selected in Buildroot?
> >
>
> Seems like cc is being used instead of the cross-compiler/linker.
>
> Did you use the meson-package mechanism in Buildroot? c.f.
>
> https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_me=
son_based_packages
>
> This should have everything required to compile meson packages. Define
> only the variables that are required and add one by one optional
> variables until you get it to build.
>
> Having the actual package makefile for your casync package would help a
> lot if it still does not work.
>
> Cheers,
> Quentin
>

--0000000000004e423b05db949a66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello=C2=A0Quentin,<div><br></div><div>Thanks for the upda=
te.</div><div><br></div><div>I am following this guideline=C2=A0<a href=3D"=
https://github.com/systemd/casync#building-casync">https://github.com/syste=
md/casync#building-casync</a>=C2=A0. It says to build casync run:</div><div=
><br></div><div>meson build &amp;&amp; ninja -C build &amp;&amp; sudo ninja=
 -C build install<br></div><div><br></div><div>Actually, meson-build is suc=
cessful=C2=A0but while running &quot;ninja -C build&quot; I am getting=C2=
=A0above errors.</div><div><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Having the actual package makefile for your casync package woul=
d help a<br>lot if it still does not work.<br></blockquote><div><br></div><=
div>I found this=C2=A0in=C2=A0<a href=3D"https://github.com/buildroot/build=
root/blob/master/package/casync/casync.mk">https://github.com/buildroot/bui=
ldroot/blob/master/package/casync/casync.mk</a></div><div><br></div><div>Bu=
t how to use this to compile=C2=A0casync?=C2=A0</div><div><br></div><div>Ca=
n you please let me know what needs to be done?</div><div><br></div><div>Th=
anks in advance.</div><div><br></div><div>Actually, meson-build is successf=
ul=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, 1 Apr 2022 at 11:11, Quentin Schulz &lt;<a href=3D"=
mailto:quentin.schulz@theobroma-systems.com">quentin.schulz@theobroma-syste=
ms.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Hi Sourabh Hegde,<br>
<br>
On 3/31/22 19:55, Sourabh Hegde wrote:<br>
&gt; Hello All,<br>
&gt; <br>
&gt; While building casync using ninja build I am facing below errors<br>
&gt; related to /usr/bin/ld:<br>
&gt; . . .error adding symbols: file in wrong format<br>
&gt; <br>
&gt; I am following &quot;casync&quot; build guideline from<br>
&gt; <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__gith=
ub.com_systemd_casync-23building-2Dcasync&amp;d=3DDwIBaQ&amp;c=3D_sEr5x9kUW=
huk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI=
_-172IIy1t&amp;m=3DEZ6d819a1qu3uAFg1GbEGsYi60IPAlDkSahx_NFWucv2-olGfFGlWcnc=
8_-v_gj4&amp;s=3D0oAe2qUNmvkBsGYIiapGRQ5OQYDghVxojZm5QaWUwiQ&amp;e=3D" rel=
=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/url?=
u=3Dhttps-3A__github.com_systemd_casync-23building-2Dcasync&amp;d=3DDwIBaQ&=
amp;c=3D_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP=
6m6qZZ4njZguQhZhkI_-172IIy1t&amp;m=3DEZ6d819a1qu3uAFg1GbEGsYi60IPAlDkSahx_N=
FWucv2-olGfFGlWcnc8_-v_gj4&amp;s=3D0oAe2qUNmvkBsGYIiapGRQ5OQYDghVxojZm5QaWU=
wiQ&amp;e=3D</a><br>
&gt; &lt;<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__=
github.com_ninja-2Dbuild_ninja_issues_url&amp;d=3DDwIBaQ&amp;c=3D_sEr5x9kUW=
huk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI=
_-172IIy1t&amp;m=3DEZ6d819a1qu3uAFg1GbEGsYi60IPAlDkSahx_NFWucv2-olGfFGlWcnc=
8_-v_gj4&amp;s=3D7qFZDk5q2JFekiEteeOVNjQj50e86tte0akp-uMLm7k&amp;e=3D" rel=
=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/url?=
u=3Dhttps-3A__github.com_ninja-2Dbuild_ninja_issues_url&amp;d=3DDwIBaQ&amp;=
c=3D_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6q=
ZZ4njZguQhZhkI_-172IIy1t&amp;m=3DEZ6d819a1qu3uAFg1GbEGsYi60IPAlDkSahx_NFWuc=
v2-olGfFGlWcnc8_-v_gj4&amp;s=3D7qFZDk5q2JFekiEteeOVNjQj50e86tte0akp-uMLm7k&=
amp;e=3D</a> &gt; , it uses &quot;meson &quot; along<br>
&gt; with ninja build.<br>
&gt; <br>
&gt; If build failures persist, run &quot;meson setup --wipe&quot; to rebui=
ld from scratch<br>
&gt; using the same options as passed when configuring the build.<br>
&gt; To change option values, run &quot;meson configure&quot; instead.<br>
&gt; ninja: Entering directory build&#39;<br>
&gt; [1/31] Linking target casync-http<br>
&gt; FAILED: casync-http<br>
&gt; cc -o casync-http casync-http.p/src_casync-http.c.o -Wl,--as-needed<br=
>
&gt; -Wl,--no-undefined<br>
&gt; -Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-=
linux-gnu/sysroot/usr/lib<br>
&gt; -Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-build=
root-linux-gnu/sysroot/usr/lib<br>
&gt; -Wl,--start-group src/libshared.a<br>
&gt; /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/s=
ysroot/usr/lib/libcurl.so<br>
&gt; <br>
&gt; /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/s=
ysroot/usr/lib/libssl.so<br>
&gt; <br>
&gt; /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/s=
ysroot/usr/lib/libcrypto.so<br>
&gt; <br>
&gt; /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/s=
ysroot/usr/lib/liblzma.so<br>
&gt; <br>
&gt; /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/s=
ysroot/usr/lib/libz.so<br>
&gt;=C2=A0 =C2=A0/root/raspcm4/sources/output/host/bin/../aarch64-buildroot=
-linux-gnu/sysroot/usr/lib/libzstd.so<br>
&gt; -lm -Wl,--end-group<br>
&gt; /usr/bin/ld:<br>
&gt; /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/s=
ysroot/usr/lib/libcurl.so:<br>
&gt; error adding symbols: file in wrong format<br>
&gt; collect2: error: ld returned 1 exit status<br>
&gt; [2/31] Linking target test-cachunk<br>
&gt; FAILED: test-cachunk<br>
&gt; cc -o test-cachunk test-cachunk.p/test_test-cachunk.c.o -Wl,--as-neede=
d<br>
&gt; -Wl,--no-undefined<br>
&gt; -Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-=
linux-gnu/sysroot/usr/lib<br>
&gt; -Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-build=
root-linux-gnu/sysroot/usr/lib<br>
&gt; -Wl,--start-group src/libshared.a -lacl<br>
&gt; /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/s=
ysroot/usr/lib/liblzma.so<br>
&gt; <br>
&gt; /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/s=
ysroot/usr/lib/libselinux.so<br>
&gt; <br>
&gt; /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/s=
ysroot/usr/lib/libz.so<br>
&gt;=C2=A0 =C2=A0/root/raspcm4/sources/output/host/bin/../aarch64-buildroot=
-linux-gnu/sysroot/usr/lib/libzstd.so<br>
&gt; -lm<br>
&gt; /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/s=
ysroot/usr/lib/libssl.so<br>
&gt;=C2=A0 =C2=A0/root/raspcm4/sources/output/host/bin/../aarch64-buildroot=
-linux-gnu/sysroot/usr/lib/libcrypto.so<br>
&gt; -Wl,--end-group -pthread<br>
&gt; /usr/bin/ld:<br>
&gt; /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/s=
ysroot/usr/lib/liblzma.so:<br>
&gt; error adding symbols: file in wrong format<br>
&gt; collect2: error: ld returned 1 exit status<br>
&gt; [3/31] Linking target test-cachunker<br>
&gt; FAILED: test-cachunker<br>
&gt; cc -o test-cachunker test-cachunker.p/test_test-cachunker.c.o<br>
&gt; -Wl,--as-needed -Wl,--no-undefined<br>
&gt; -Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-=
linux-gnu/sysroot/usr/lib<br>
&gt; -Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-build=
root-linux-gnu/sysroot/usr/lib<br>
&gt; -Wl,--start-group src/libshared.a -lacl<br>
&gt; /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/s=
ysroot/usr/lib/liblzma.so<br>
&gt; <br>
&gt; /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/s=
ysroot/usr/lib/libselinux.so<br>
&gt; <br>
&gt; /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/s=
ysroot/usr/lib/libz.so<br>
&gt;=C2=A0 =C2=A0/root/raspcm4/sources/output/host/bin/../aarch64-buildroot=
-linux-gnu/sysroot/usr/lib/libzstd.so<br>
&gt; -lm<br>
&gt; /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/s=
ysroot/usr/lib/libssl.so<br>
&gt;=C2=A0 =C2=A0/root/raspcm4/sources/output/host/bin/../aarch64-buildroot=
-linux-gnu/sysroot/usr/lib/libcrypto.so<br>
&gt; -Wl,--end-group -pthread<br>
&gt; /usr/bin/ld:<br>
&gt; /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/s=
ysroot/usr/lib/liblzma.so:<br>
&gt; error adding symbols: file in wrong format<br>
&gt; collect2: error: ld returned 1 exit status<br>
&gt; [4/31] Linking target test-caencoder<br>
&gt; FAILED: test-caencoder<br>
&gt; cc -o test-caencoder test-caencoder.p/test_test-caencoder.c.o<br>
&gt; -Wl,--as-needed -Wl,--no-undefined<br>
&gt; -Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-=
linux-gnu/sysroot/usr/lib<br>
&gt; -Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-build=
root-linux-gnu/sysroot/usr/lib<br>
&gt; -Wl,--start-group src/libshared.a -lacl<br>
&gt; /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/s=
ysroot/usr/lib/liblzma.so<br>
&gt; <br>
&gt; /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/s=
ysroot/usr/lib/libselinux.so<br>
&gt; <br>
&gt; /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/s=
ysroot/usr/lib/libz.so<br>
&gt;=C2=A0 =C2=A0/root/raspcm4/sources/output/host/bin/../aarch64-buildroot=
-linux-gnu/sysroot/usr/lib/libzstd.so<br>
&gt; -lm<br>
&gt; /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/s=
ysroot/usr/lib/libssl.so<br>
&gt;=C2=A0 =C2=A0/root/raspcm4/sources/output/host/bin/../aarch64-buildroot=
-linux-gnu/sysroot/usr/lib/libcrypto.so<br>
&gt; -Wl,--end-group -pthread<br>
&gt; /usr/bin/ld:<br>
&gt; /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/s=
ysroot/usr/lib/liblzma.so:<br>
&gt; error adding symbols: file in wrong format<br>
&gt; collect2: error: ld returned 1 exit status<br>
&gt; .<br>
&gt; .<br>
&gt; [10/31] Compiling C object test-camatch.p/test_test-camatch.c.o<br>
&gt; ninja: build stopped: subcommand failed.<br>
&gt; <br>
&gt; I am using Buildroot as build system and after following similar post =
in<br>
&gt; <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__stac=
koverflow.com_questions_27967802_libstdc-2Dso-2Derror-2Dadding-2Dsymbols-2D=
file-2Din-2Dwrong-2Dformat&amp;d=3DDwIBaQ&amp;c=3D_sEr5x9kUWhuk4_nFwjJtA&am=
p;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&amp;=
m=3DEZ6d819a1qu3uAFg1GbEGsYi60IPAlDkSahx_NFWucv2-olGfFGlWcnc8_-v_gj4&amp;s=
=3DxHy7bTlAyWOY4-lBdA9bwycscXiZBIO-Wkz7PZC9vbs&amp;e=3D" rel=3D"noreferrer"=
 target=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__s=
tackoverflow.com_questions_27967802_libstdc-2Dso-2Derror-2Dadding-2Dsymbols=
-2Dfile-2Din-2Dwrong-2Dformat&amp;d=3DDwIBaQ&amp;c=3D_sEr5x9kUWhuk4_nFwjJtA=
&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&a=
mp;m=3DEZ6d819a1qu3uAFg1GbEGsYi60IPAlDkSahx_NFWucv2-olGfFGlWcnc8_-v_gj4&amp=
;s=3DxHy7bTlAyWOY4-lBdA9bwycscXiZBIO-Wkz7PZC9vbs&amp;e=3D</a><br>
&gt; &lt;<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__=
github.com_ninja-2Dbuild_ninja_issues_url&amp;d=3DDwIBaQ&amp;c=3D_sEr5x9kUW=
huk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI=
_-172IIy1t&amp;m=3DEZ6d819a1qu3uAFg1GbEGsYi60IPAlDkSahx_NFWucv2-olGfFGlWcnc=
8_-v_gj4&amp;s=3D7qFZDk5q2JFekiEteeOVNjQj50e86tte0akp-uMLm7k&amp;e=3D" rel=
=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/url?=
u=3Dhttps-3A__github.com_ninja-2Dbuild_ninja_issues_url&amp;d=3DDwIBaQ&amp;=
c=3D_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6q=
ZZ4njZguQhZhkI_-172IIy1t&amp;m=3DEZ6d819a1qu3uAFg1GbEGsYi60IPAlDkSahx_NFWuc=
v2-olGfFGlWcnc8_-v_gj4&amp;s=3D7qFZDk5q2JFekiEteeOVNjQj50e86tte0akp-uMLm7k&=
amp;e=3D</a> &gt; I changed the PATH<br>
&gt; environment<br>
&gt; like:<br>
&gt; <br>
&gt; /root/raspcm4/sources/output/host/bin/:/root/bin:/usr/local/sbin:/usr/=
local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/raspcm4/sources/output/host/a=
arch64-buildroot-linux-gnu/sysroot/usr/bin<br>
&gt; <br>
&gt; But still, I end up getting the same errors<br>
&gt; <br>
&gt; Can anyone please let me know how to resolve this issue? Is there any =
ninja<br>
&gt; build option to be selected in Buildroot?<br>
&gt; <br>
<br>
Seems like cc is being used instead of the cross-compiler/linker.<br>
<br>
Did you use the meson-package mechanism in Buildroot? c.f. <br>
<a href=3D"https://buildroot.org/downloads/manual/manual.html#_infrastructu=
re_for_meson_based_packages" rel=3D"noreferrer" target=3D"_blank">https://b=
uildroot.org/downloads/manual/manual.html#_infrastructure_for_meson_based_p=
ackages</a><br>
<br>
This should have everything required to compile meson packages. Define <br>
only the variables that are required and add one by one optional <br>
variables until you get it to build.<br>
<br>
Having the actual package makefile for your casync package would help a <br=
>
lot if it still does not work.<br>
<br>
Cheers,<br>
Quentin<br>
</blockquote></div>

--0000000000004e423b05db949a66--

--===============4476225011884157402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4476225011884157402==--
