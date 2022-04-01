Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E02FC433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 09:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32E9A60B0A;
	Fri,  1 Apr 2022 09:10:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R3w6gONbYKEK; Fri,  1 Apr 2022 09:10:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A75CB60B1E;
	Fri,  1 Apr 2022 09:10:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DACC11BF376
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 09:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C957C405BE
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 09:10:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A6F4Z0IZkn9b for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 09:10:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CD8140156
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 09:10:38 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id x9so1530462ilc.3
 for <buildroot@buildroot.org>; Fri, 01 Apr 2022 02:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=bHDuOFDcJ70IoJjufhPnowpqx+68kklxhzAPf2l7Oac=;
 b=RMO4HhZ3dKF8MlSQt3hM0SDFLmrstIjodtsKGB2nNWrbkixLBm7ikAfMriqghcq6Pm
 2+apBfrIOt5ErtogUK2qdVjRdmNi3havP9HNG1E769y2CdP0W/2dGdDmMKgSS1XeJG2p
 gQMFFHYUOPSXbTU+anowD/QY1a4r+oT0oOBb+BNBApIxec/4xx9j3gXlv8cLNm4nqXFo
 cErYyZfLyt8MgT/KR46E/fnr772yfhLQwVajk+5CPwWhqdVAA0gp57KhxDJCOxB1ph/1
 XCo9JDnKDDaxLlPG+J49pAnG8JoQD3wco5FqkJUbaB1fKPaIoNbO+urko+L+lfLsGutR
 DF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=bHDuOFDcJ70IoJjufhPnowpqx+68kklxhzAPf2l7Oac=;
 b=vStU4O363mJ6X0d/ZqVXNlFNsq14nqQy9LhnvR/wOA3lE6WExSEuptdh9LD5mZzo4m
 wcCXZqxMvppHfE9jJ7dvN3ICaj7wNneLuMYbBZzFDj1TEEDEcU8WnzWcuHLD9ysO2OBg
 FcPR4Me+LJLvOdKqb2wHpZ2lUx8FmAz5kZ0nqABeYCAD9jeELq4nKRqq6VLLXKwV/6Kf
 3Gs6T3CG5itAHA0h81JlRrGAXPrkvQeX9ftq/utWIoEtWeH7KpUQrV5w+hbqWujuMCVe
 vTNNb+m7YAEOrlR5KX0gfmJ6QjRvrpGRHnzxO9vYivQnaT48tRO1Osv0s2FgfAzbuO07
 0SPw==
X-Gm-Message-State: AOAM531qChNlD+bvWKF4JjSRaI3VrBWMpH3/uKuDwnYKHVu50pDL8EUn
 R4Fkokm0G0iodc6Fnsfrb4OxLK4xiwmoJ3Cw42VOxHEe
X-Google-Smtp-Source: ABdhPJwEUD5H2+IjxUN3MjIIW+S6ay4aUV7FgD3a7GNAxIeForbmWf//GWE8eiMDquL1Sn3Ht1zT2ehfrUUJ5R9PCtQ=
X-Received: by 2002:a05:6e02:1a81:b0:2c9:e6ac:49c with SMTP id
 k1-20020a056e021a8100b002c9e6ac049cmr5659271ilv.281.1648804236806; Fri, 01
 Apr 2022 02:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeStce6+hEvk54=LGcgwTfPy7f2D_o=463haRjqOAOLj_1A@mail.gmail.com>
In-Reply-To: <CADYjeStce6+hEvk54=LGcgwTfPy7f2D_o=463haRjqOAOLj_1A@mail.gmail.com>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Fri, 1 Apr 2022 11:10:24 +0200
Message-ID: <CADYjeSu26N_9c4O3nMu=YFriPVyaXOqsR=h3K3KnqDahs9jmbQ@mail.gmail.com>
To: buildroot@buildroot.org
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
Content-Type: multipart/mixed; boundary="===============1541469104908358210=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1541469104908358210==
Content-Type: multipart/alternative; boundary="000000000000d6ceff05db942617"

--000000000000d6ceff05db942617
Content-Type: text/plain; charset="UTF-8"

Hello,

Any update on below request would be appreciated.

Thanks in advance,
Sourabh

On Thu, Mar 31, 2022, 19:55 Sourabh Hegde <hrsourabh011@gmail.com> wrote:

> Hello All,
>
> While building casync using ninja build I am facing below errors related
> to /usr/bin/ld: . . .error adding symbols: file in wrong format
>
> I am following "casync" build guideline from
> https://github.com/systemd/casync#building-casync
> <https://github.com/ninja-build/ninja/issues/url> , it uses "meson " along
> with ninja build.
>
> If build failures persist, run "meson setup --wipe" to rebuild from scratch
> using the same options as passed when configuring the build.
> To change option values, run "meson configure" instead.
> ninja: Entering directory build'
> [1/31] Linking target casync-http
> FAILED: casync-http
> cc -o casync-http casync-http.p/src_casync-http.c.o -Wl,--as-needed
> -Wl,--no-undefined -Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
> -Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
> -Wl,--start-group src/libshared.a
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcurl.so
>
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.so
>
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so
>
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so
>
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so
>  /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzstd.so
> -lm -Wl,--end-group
> /usr/bin/ld:
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcurl.so:
> error adding symbols: file in wrong format
> collect2: error: ld returned 1 exit status
> [2/31] Linking target test-cachunk
> FAILED: test-cachunk
> cc -o test-cachunk test-cachunk.p/test_test-cachunk.c.o -Wl,--as-needed
> -Wl,--no-undefined -Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
> -Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
> -Wl,--start-group src/libshared.a -lacl
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so
>
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libselinux.so
>
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so
>  /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzstd.so
> -lm
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.so
>  /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so
> -Wl,--end-group -pthread
> /usr/bin/ld:
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so:
> error adding symbols: file in wrong format
> collect2: error: ld returned 1 exit status
> [3/31] Linking target test-cachunker
> FAILED: test-cachunker
> cc -o test-cachunker test-cachunker.p/test_test-cachunker.c.o
> -Wl,--as-needed -Wl,--no-undefined -Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
> -Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
> -Wl,--start-group src/libshared.a -lacl
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so
>
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libselinux.so
>
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so
>  /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzstd.so
> -lm
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.so
>  /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so
> -Wl,--end-group -pthread
> /usr/bin/ld:
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so:
> error adding symbols: file in wrong format
> collect2: error: ld returned 1 exit status
> [4/31] Linking target test-caencoder
> FAILED: test-caencoder
> cc -o test-caencoder test-caencoder.p/test_test-caencoder.c.o
> -Wl,--as-needed -Wl,--no-undefined -Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
> -Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
> -Wl,--start-group src/libshared.a -lacl
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so
>
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libselinux.so
>
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so
>  /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzstd.so
> -lm
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.so
>  /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so
> -Wl,--end-group -pthread
> /usr/bin/ld:
> /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so:
> error adding symbols: file in wrong format
> collect2: error: ld returned 1 exit status
> .
> .
> [10/31] Compiling C object test-camatch.p/test_test-camatch.c.o
> ninja: build stopped: subcommand failed.
>
> I am using Buildroot as build system and after following similar post in
> https://stackoverflow.com/questions/27967802/libstdc-so-error-adding-symbols-file-in-wrong-format
> <https://github.com/ninja-build/ninja/issues/url> I changed the PATH environment
> like:
>
>
> /root/raspcm4/sources/output/host/bin/:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/raspcm4/sources/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/bin
>
> But still, I end up getting the same errors
>
> Can anyone please let me know how to resolve this issue? Is there any ninja
> build option to be selected in Buildroot?
>
> Your help will be much appreciated.
>
> Thanks in advance
>
> P.S: Please let me know if any info is missing here
>

--000000000000d6ceff05db942617
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello,<div dir=3D"auto"><br></div><div dir=3D"auto">Any u=
pdate on below request would be=C2=A0appreciated.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Thanks in advance,</div><div dir=3D"auto">Sourabh=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Thu, Mar 31, 2022, 19:55 Sourabh Hegde &lt;<a href=3D"mailto:hrsou=
rabh011@gmail.com">hrsourabh011@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div dir=3D"ltr"><p dir=3D"auto" style=3D"box-sizing:=
border-box;margin-bottom:16px;color:rgb(36,41,47);font-family:-apple-system=
,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;A=
pple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px;margin-top=
:0px">Hello All,</p><p dir=3D"auto" style=3D"box-sizing:border-box;margin-t=
op:0px;margin-bottom:16px;color:rgb(36,41,47);font-family:-apple-system,Bli=
nkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple=
 Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">While buildin=
g=C2=A0<code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono=
-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,mon=
ospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">c=
async=C2=A0</code>using=C2=A0<code style=3D"box-sizing:border-box;font-fami=
ly:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Lib=
eration Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0p=
x;border-radius:6px">ninja build</code>=C2=A0I am facing below errors relat=
ed to<code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-R=
egular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monos=
pace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">=C2=
=A0/usr/bin/ld: . . .error adding symbols: file in wrong format</code></p><=
p dir=3D"auto" style=3D"box-sizing:border-box;margin-top:0px;margin-bottom:=
16px;color:rgb(36,41,47);font-family:-apple-system,BlinkMacSystemFont,&quot=
;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&q=
uot;Segoe UI Emoji&quot;;font-size:14px">I am following &quot;casync&quot; =
build guideline from=C2=A0<a href=3D"https://github.com/ninja-build/ninja/i=
ssues/url" style=3D"box-sizing:border-box;text-decoration-line:none" target=
=3D"_blank" rel=3D"noreferrer">https://github.com/systemd/casync#building-c=
async</a>=C2=A0, it uses &quot;<code style=3D"box-sizing:border-box;font-fa=
mily:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;L=
iberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:=
0px;border-radius:6px">meson &quot;</code>=C2=A0along with ninja build.</p>=
<p dir=3D"auto" style=3D"box-sizing:border-box;margin-top:0px;margin-bottom=
:16px;color:rgb(36,41,47);font-family:-apple-system,BlinkMacSystemFont,&quo=
t;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&=
quot;Segoe UI Emoji&quot;;font-size:14px"><code style=3D"box-sizing:border-=
box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Conso=
las,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.=
4em;margin:0px;border-radius:6px">If build failures persist, run &quot;meso=
n setup --wipe&quot; to rebuild from scratch</code><br style=3D"box-sizing:=
border-box"><code style=3D"box-sizing:border-box;font-family:ui-monospace,S=
FMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot=
;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6=
px">using the same options as passed when configuring the build.</code><br =
style=3D"box-sizing:border-box"><code style=3D"box-sizing:border-box;font-f=
amily:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;=
Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin=
:0px;border-radius:6px">To change option values, run &quot;meson configure&=
quot; instead.</code><br style=3D"box-sizing:border-box"><code style=3D"box=
-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&qu=
ot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;p=
adding:0.2em 0.4em;margin:0px;border-radius:6px">ninja: Entering directory =
build&#39;</code><br style=3D"box-sizing:border-box"><code style=3D"box-siz=
ing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,=
Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;paddi=
ng:0.2em 0.4em;margin:0px;border-radius:6px">[1/31] Linking target casync-h=
ttp</code><br style=3D"box-sizing:border-box"><code style=3D"box-sizing:bor=
der-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,C=
onsolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2e=
m 0.4em;margin:0px;border-radius:6px">FAILED: casync-http</code><br style=
=3D"box-sizing:border-box"><code style=3D"box-sizing:border-box;font-family=
:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liber=
ation Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;=
border-radius:6px">cc -o casync-http casync-http.p/src_casync-http.c.o -Wl,=
--as-needed -Wl,--no-undefined -Wl,</code>-<code style=3D"box-sizing:border=
-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Cons=
olas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0=
.4em;margin:0px;border-radius:6px">rpath,/root/raspcm4/sources/output/host/=
bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib -Wl,-rpath</code>-<code =
style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quo=
t;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-s=
ize:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">link,/root/ras=
pcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib=
 -Wl,--start-group src/libshared.a</code>=C2=A0<code style=3D"box-sizing:bo=
rder-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,=
Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2=
em 0.4em;margin:0px;border-radius:6px">/root/raspcm4/sources/output/host/bi=
n/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcurl.so</code>=C2=A0<co=
de style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&=
quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;fon=
t-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">/root/raspc=
m4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/l=
ibssl.so</code>=C2=A0<code style=3D"box-sizing:border-box;font-family:ui-mo=
nospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation =
Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border=
-radius:6px">/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-lin=
ux-gnu/sysroot/usr/lib/libcrypto.so</code>=C2=A0<code style=3D"box-sizing:b=
order-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo=
,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.=
2em 0.4em;margin:0px;border-radius:6px">/root/raspcm4/sources/output/host/b=
in/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so</code>=C2=A0<c=
ode style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,=
&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;fo=
nt-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">/root/rasp=
cm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/=
libz.so</code>=C2=A0<code style=3D"box-sizing:border-box;font-family:ui-mon=
ospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation M=
ono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-=
radius:6px">/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linu=
x-gnu/sysroot/usr/lib/libzstd.so -lm -Wl,--end-group</code><br style=3D"box=
-sizing:border-box"><code style=3D"box-sizing:border-box;font-family:ui-mon=
ospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation M=
ono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-=
radius:6px">/usr/bin/ld: /root/raspcm4/sources/output/host/bin/../aarch64-b=
uildroot-linux-gnu/sysroot/usr/lib/libcurl.so: error adding</code>=C2=A0<co=
de style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&=
quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;fon=
t-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">symbols: fi=
le in wrong format</code><br style=3D"box-sizing:border-box"><code style=3D=
"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mon=
o&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9=
px;padding:0.2em 0.4em;margin:0px;border-radius:6px">collect2: error: ld re=
turned 1 exit status</code><br style=3D"box-sizing:border-box"><code style=
=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF =
Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:1=
1.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">[2/31] Linking targ=
et test-cachunk</code><br style=3D"box-sizing:border-box"><code style=3D"bo=
x-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&q=
uot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;=
padding:0.2em 0.4em;margin:0px;border-radius:6px">FAILED: test-cachunk</cod=
e><br style=3D"box-sizing:border-box"><code style=3D"box-sizing:border-box;=
font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,=
&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;=
margin:0px;border-radius:6px">cc -o test-cachunk test-cachunk.p/test_test-c=
achunk.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,</code>-<code style=3D"bo=
x-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&q=
uot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;=
padding:0.2em 0.4em;margin:0px;border-radius:6px">rpath,/root/raspcm4/sourc=
es/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib -Wl,-rpat=
h</code>-<code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMo=
no-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,m=
onospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px"=
>link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/=
sysroot/usr/lib -Wl,--start-group src/libshared.a</code>=C2=A0-<code style=
=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF =
Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:1=
1.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">lacl /root/raspcm4/=
sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libl=
zma.so</code>=C2=A0<code style=3D"box-sizing:border-box;font-family:ui-mono=
space,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mo=
no&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-r=
adius:6px">/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux=
-gnu/sysroot/usr/lib/libselinux.so</code>=C2=A0<code style=3D"box-sizing:bo=
rder-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,=
Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2=
em 0.4em;margin:0px;border-radius:6px">/root/raspcm4/sources/output/host/bi=
n/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so</code>=C2=A0<code =
style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quo=
t;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-s=
ize:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">/root/raspcm4/=
sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz=
std.so -lm</code>=C2=A0<code style=3D"box-sizing:border-box;font-family:ui-=
monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberatio=
n Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;bord=
er-radius:6px">/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-l=
inux-gnu/sysroot/usr/lib/libssl.so</code>=C2=A0<code style=3D"box-sizing:bo=
rder-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,=
Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2=
em 0.4em;margin:0px;border-radius:6px">/root/raspcm4/sources/output/host/bi=
n/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so -Wl,--end-gro=
up -pthread</code><br style=3D"box-sizing:border-box"><code style=3D"box-si=
zing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;=
,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padd=
ing:0.2em 0.4em;margin:0px;border-radius:6px">/usr/bin/ld: /root/raspcm4/so=
urces/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzm=
a.so: error adding</code>=C2=A0<code style=3D"box-sizing:border-box;font-fa=
mily:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;L=
iberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:=
0px;border-radius:6px">symbols: file in wrong format</code><br style=3D"box=
-sizing:border-box"><code style=3D"box-sizing:border-box;font-family:ui-mon=
ospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation M=
ono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-=
radius:6px">collect2: error: ld returned 1 exit status</code><br style=3D"b=
ox-sizing:border-box"><code style=3D"box-sizing:border-box;font-family:ui-m=
onospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation=
 Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;borde=
r-radius:6px">[3/31] Linking target test-cachunker</code><br style=3D"box-s=
izing:border-box"><code style=3D"box-sizing:border-box;font-family:ui-monos=
pace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mon=
o&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-ra=
dius:6px">FAILED: test-cachunker</code><br style=3D"box-sizing:border-box">=
<code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regula=
r,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;=
font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">cc -o te=
st-cachunker test-cachunker.p/test_test-cachunker.c.o -Wl,--as-needed -Wl,-=
-no-undefined -Wl,</code>-<code style=3D"box-sizing:border-box;font-family:=
ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Libera=
tion Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;b=
order-radius:6px">rpath,/root/raspcm4/sources/output/host/bin/../aarch64-bu=
ildroot-linux-gnu/sysroot/usr/lib -Wl,-rpath</code>-<code style=3D"box-sizi=
ng:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,M=
enlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;paddin=
g:0.2em 0.4em;margin:0px;border-radius:6px">link,/root/raspcm4/sources/outp=
ut/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib -Wl,--start-grou=
p src/libshared.a</code>=C2=A0-<code style=3D"box-sizing:border-box;font-fa=
mily:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;L=
iberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:=
0px;border-radius:6px">lacl /root/raspcm4/sources/output/host/bin/../aarch6=
4-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so</code>=C2=A0<code style=3D=
"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mon=
o&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9=
px;padding:0.2em 0.4em;margin:0px;border-radius:6px">/root/raspcm4/sources/=
output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libselinux.s=
o</code>=C2=A0<code style=3D"box-sizing:border-box;font-family:ui-monospace=
,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&qu=
ot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius=
:6px">/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/=
sysroot/usr/lib/libz.so</code>=C2=A0<code style=3D"box-sizing:border-box;fo=
nt-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&q=
uot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;ma=
rgin:0px;border-radius:6px">/root/raspcm4/sources/output/host/bin/../aarch6=
4-buildroot-linux-gnu/sysroot/usr/lib/libzstd.so -lm</code>=C2=A0<code styl=
e=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF=
 Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:=
11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">/root/raspcm4/sour=
ces/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.s=
o</code>=C2=A0<code style=3D"box-sizing:border-box;font-family:ui-monospace=
,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&qu=
ot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius=
:6px">/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/=
sysroot/usr/lib/libcrypto.so -Wl,--end-group -pthread</code><br style=3D"bo=
x-sizing:border-box"><code style=3D"box-sizing:border-box;font-family:ui-mo=
nospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation =
Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border=
-radius:6px">/usr/bin/ld: /root/raspcm4/sources/output/host/bin/../aarch64-=
buildroot-linux-gnu/sysroot/usr/lib/liblzma.so: error adding</code>=C2=A0<c=
ode style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,=
&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;fo=
nt-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">symbols: f=
ile in wrong format</code><br style=3D"box-sizing:border-box"><code style=
=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF =
Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:1=
1.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">collect2: error: ld=
 returned 1 exit status</code><br style=3D"box-sizing:border-box"><code sty=
le=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;S=
F Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size=
:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">[4/31] Linking ta=
rget test-caencoder</code><br style=3D"box-sizing:border-box"><code style=
=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF =
Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:1=
1.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">FAILED: test-caenco=
der</code><br style=3D"box-sizing:border-box"><code style=3D"box-sizing:bor=
der-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,C=
onsolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2e=
m 0.4em;margin:0px;border-radius:6px">cc -o test-caencoder test-caencoder.p=
/test_test-caencoder.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,</code>-<co=
de style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&=
quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;fon=
t-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">rpath,/root=
/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr=
/lib -Wl,-rpath</code>-<code style=3D"box-sizing:border-box;font-family:ui-=
monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberatio=
n Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;bord=
er-radius:6px">link,/root/raspcm4/sources/output/host/bin/../aarch64-buildr=
oot-linux-gnu/sysroot/usr/lib -Wl,--start-group src/libshared.a</code>=C2=
=A0-<code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Re=
gular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monosp=
ace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">lacl=
 /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysro=
ot/usr/lib/liblzma.so</code>=C2=A0<code style=3D"box-sizing:border-box;font=
-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quo=
t;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;marg=
in:0px;border-radius:6px">/root/raspcm4/sources/output/host/bin/../aarch64-=
buildroot-linux-gnu/sysroot/usr/lib/libselinux.so</code>=C2=A0<code style=
=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF =
Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:1=
1.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">/root/raspcm4/sourc=
es/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so</=
code>=C2=A0<code style=3D"box-sizing:border-box;font-family:ui-monospace,SF=
Mono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;=
,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6p=
x">/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sys=
root/usr/lib/libzstd.so -lm</code>=C2=A0<code style=3D"box-sizing:border-bo=
x;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consola=
s,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4e=
m;margin:0px;border-radius:6px">/root/raspcm4/sources/output/host/bin/../aa=
rch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.so</code>=C2=A0<code style=
=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF =
Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:1=
1.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">/root/raspcm4/sourc=
es/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto=
.so -Wl,--end-group -pthread</code><br style=3D"box-sizing:border-box"><cod=
e style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&q=
uot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font=
-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">/usr/bin/ld:=
 /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysro=
ot/usr/lib/liblzma.so: error adding</code>=C2=A0<code style=3D"box-sizing:b=
order-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo=
,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.=
2em 0.4em;margin:0px;border-radius:6px">symbols: file in wrong format</code=
><br style=3D"box-sizing:border-box"><code style=3D"box-sizing:border-box;f=
ont-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&=
quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;m=
argin:0px;border-radius:6px">collect2: error: ld returned 1 exit status</co=
de><br style=3D"box-sizing:border-box"><code style=3D"box-sizing:border-box=
;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas=
,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em=
;margin:0px;border-radius:6px">.</code><br style=3D"box-sizing:border-box">=
<code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regula=
r,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;=
font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">.</code>=
<br style=3D"box-sizing:border-box"><code style=3D"box-sizing:border-box;fo=
nt-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&q=
uot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;ma=
rgin:0px;border-radius:6px">[10/31] Compiling C object test-camatch.p/test_=
test-camatch.c.o</code><br style=3D"box-sizing:border-box"><code style=3D"b=
ox-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&=
quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px=
;padding:0.2em 0.4em;margin:0px;border-radius:6px">ninja: build stopped: su=
bcommand failed.</code><br></p><p dir=3D"auto" style=3D"box-sizing:border-b=
ox;margin-top:0px;margin-bottom:16px;color:rgb(36,41,47);font-family:-apple=
-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,=
&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">I =
am using Buildroot as build system and after following similar post in=C2=
=A0<a href=3D"https://github.com/ninja-build/ninja/issues/url" style=3D"box=
-sizing:border-box;background-color:transparent;text-decoration-line:none" =
target=3D"_blank" rel=3D"noreferrer">https://stackoverflow.com/questions/27=
967802/libstdc-so-error-adding-symbols-file-in-wrong-format</a>=C2=A0I chan=
ged the=C2=A0<code style=3D"box-sizing:border-box;font-family:ui-monospace,=
SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quo=
t;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:=
6px">PATH=C2=A0</code>environment like:</p><p dir=3D"auto" style=3D"box-siz=
ing:border-box;margin-top:0px;margin-bottom:16px;color:rgb(36,41,47);font-f=
amily:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial=
,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-s=
ize:14px"><code style=3D"box-sizing:border-box;font-family:ui-monospace,SFM=
ono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,=
monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px=
">/root/raspcm4/sources/output/host/bin/:/root/bin:/usr/local/sbin:/usr/loc=
al/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/raspcm4/sources/output/host/aarc=
h64-buildroot-linux-gnu/sysroot/usr/bin</code></p><p dir=3D"auto" style=3D"=
box-sizing:border-box;margin-top:0px;margin-bottom:16px;color:rgb(36,41,47)=
;font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetic=
a,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;=
;font-size:14px">But still, I end up getting the same errors</p><p dir=3D"a=
uto" style=3D"box-sizing:border-box;margin-top:0px;margin-bottom:16px;color=
:rgb(36,41,47);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&=
quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe =
UI Emoji&quot;;font-size:14px">Can anyone please let me know how to resolve=
 this issue? Is there any=C2=A0<code style=3D"box-sizing:border-box;font-fa=
mily:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;L=
iberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:=
0px;border-radius:6px">ninja build</code>=C2=A0option to be selected in Bui=
ldroot?</p><p dir=3D"auto" style=3D"box-sizing:border-box;margin-top:0px;ma=
rgin-bottom:16px;color:rgb(36,41,47);font-family:-apple-system,BlinkMacSyst=
emFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Em=
oji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">Your help will be much=
 appreciated.</p><p dir=3D"auto" style=3D"box-sizing:border-box;margin-top:=
0px;margin-bottom:16px;color:rgb(36,41,47);font-family:-apple-system,BlinkM=
acSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Co=
lor Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">Thanks in advanc=
e</p><p dir=3D"auto" style=3D"box-sizing:border-box;margin-top:0px;margin-b=
ottom:16px;color:rgb(36,41,47);font-family:-apple-system,BlinkMacSystemFont=
,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&qu=
ot;,&quot;Segoe UI Emoji&quot;;font-size:14px">P.S: Please let me know if a=
ny info is missing here</p></div>
</blockquote></div>

--000000000000d6ceff05db942617--

--===============1541469104908358210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1541469104908358210==--

