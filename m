Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABB2C433F5
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 17:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2FF0410FF;
	Thu, 31 Mar 2022 17:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TKpdPJUYkApj; Thu, 31 Mar 2022 17:56:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 778A7410FC;
	Thu, 31 Mar 2022 17:56:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C24A91BF9AC
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 17:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8ADE410F4
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 17:56:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OR0SeFSyKs0U for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 17:56:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4836F410FF
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 17:56:06 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id 125so366654iov.10
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 10:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=lmuyhcUwj5DHX/fUKYDfVI/OocmSV3g/N9hdan/H3/Y=;
 b=nXmJ4rHp7FOqT5ZE8j97wOEnThfJ80GMQLzIus3Mx2RvMakvxNSFcFzAa5X41i+dsM
 +qcZT8E/Ywy+aQJXCxZMlZQF8CBm7llBIZ1HG1M4HQzVaishuO6vTPJzUx48xoCsQHc9
 gUfJCoiNtK0tFXg++92W/5wn3HRCzU0E4/VArmePLn5BkrIMVn1JUoTxtX8kvEHiAzRa
 07lYzpbsfGL0zEHwcR/ScRtbF++aoMKPaF/9tj/6NcSeiUuzmsNRnwm/SbcS/o4EOQnS
 /GT4xSmvt3nNLBzJFXv9qwboUnvX+hzkkDmd5OaOeCTXv1QaP5LgaATkfaRPnfVtBN/O
 ME/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=lmuyhcUwj5DHX/fUKYDfVI/OocmSV3g/N9hdan/H3/Y=;
 b=jPOtDEObkxM8AVz79id2wnVxzZhicOWc9RNVYXhIkxTfiqBNocRfqjRzyS3c2D2BKk
 AjOIY+Yaa4+htzijTzcwcT4xQTLJxXEzG2iVXFRe+V8zT8BjUsRZL+/q5xzCmLF/Agmr
 rjpwsUZb14ExSF2MOX2dgqZ1/Gai9XqAlb44Qzy5+9ig5wZEPLn1tq0Zt+NlJF//rOop
 oWilflCUjIQCtD8V+WicLncifTA5ddkkMxDCJOt7BogLgBlbDaLljrMBe/oV4qzyPSJN
 0mOjZMDfBEJT1FtqOsh31M4QyPjqhRIYXSRiMQcKqiHxXcfk+nx4KkER7wK0KlIocOec
 Y28w==
X-Gm-Message-State: AOAM5324A+PifS4hQR5r+iCaQ7ZPOR4DhGYNT/ft5pcnMzCmfM1E6pTL
 xBlWg9s/BYi9oj7cP/I4xdu4CfEN+vm5GMgyXDPvTssNIzA=
X-Google-Smtp-Source: ABdhPJwxVIWY1ggRtCUPHTsu8eO1mekC3B0+9WR5lq0RotUVtmaIw+62OjKFREzWoQ34RLnPVw2JZtpd1Ndnq6LNOrs=
X-Received: by 2002:a6b:b704:0:b0:649:eccd:d46a with SMTP id
 h4-20020a6bb704000000b00649eccdd46amr14618166iof.55.1648749364863; Thu, 31
 Mar 2022 10:56:04 -0700 (PDT)
MIME-Version: 1.0
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Thu, 31 Mar 2022 19:55:53 +0200
Message-ID: <CADYjeStce6+hEvk54=LGcgwTfPy7f2D_o=463haRjqOAOLj_1A@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] Buildroot | ninja build error | /usr/bin/ld:error
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
Content-Type: multipart/mixed; boundary="===============6787549470829289852=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6787549470829289852==
Content-Type: multipart/alternative; boundary="00000000000037661a05db8760ca"

--00000000000037661a05db8760ca
Content-Type: text/plain; charset="UTF-8"

Hello All,

While building casync using ninja build I am facing below errors
related to /usr/bin/ld:
. . .error adding symbols: file in wrong format

I am following "casync" build guideline from
https://github.com/systemd/casync#building-casync
<https://github.com/ninja-build/ninja/issues/url> , it uses "meson " along
with ninja build.

If build failures persist, run "meson setup --wipe" to rebuild from scratch
using the same options as passed when configuring the build.
To change option values, run "meson configure" instead.
ninja: Entering directory build'
[1/31] Linking target casync-http
FAILED: casync-http
cc -o casync-http casync-http.p/src_casync-http.c.o -Wl,--as-needed
-Wl,--no-undefined
-Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
-Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
-Wl,--start-group src/libshared.a
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcurl.so

/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.so

/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so

/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so

/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so
 /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzstd.so
-lm -Wl,--end-group
/usr/bin/ld:
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcurl.so:
error adding symbols: file in wrong format
collect2: error: ld returned 1 exit status
[2/31] Linking target test-cachunk
FAILED: test-cachunk
cc -o test-cachunk test-cachunk.p/test_test-cachunk.c.o -Wl,--as-needed
-Wl,--no-undefined
-Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
-Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
-Wl,--start-group src/libshared.a -lacl
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so

/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libselinux.so

/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so
 /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzstd.so
-lm
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.so
 /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so
-Wl,--end-group -pthread
/usr/bin/ld:
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so:
error adding symbols: file in wrong format
collect2: error: ld returned 1 exit status
[3/31] Linking target test-cachunker
FAILED: test-cachunker
cc -o test-cachunker test-cachunker.p/test_test-cachunker.c.o
-Wl,--as-needed -Wl,--no-undefined
-Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
-Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
-Wl,--start-group src/libshared.a -lacl
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so

/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libselinux.so

/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so
 /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzstd.so
-lm
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.so
 /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so
-Wl,--end-group -pthread
/usr/bin/ld:
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so:
error adding symbols: file in wrong format
collect2: error: ld returned 1 exit status
[4/31] Linking target test-caencoder
FAILED: test-caencoder
cc -o test-caencoder test-caencoder.p/test_test-caencoder.c.o
-Wl,--as-needed -Wl,--no-undefined
-Wl,-rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
-Wl,-rpath-link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib
-Wl,--start-group src/libshared.a -lacl
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so

/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libselinux.so

/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so
 /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzstd.so
-lm
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.so
 /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so
-Wl,--end-group -pthread
/usr/bin/ld:
/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so:
error adding symbols: file in wrong format
collect2: error: ld returned 1 exit status
.
.
[10/31] Compiling C object test-camatch.p/test_test-camatch.c.o
ninja: build stopped: subcommand failed.

I am using Buildroot as build system and after following similar post in
https://stackoverflow.com/questions/27967802/libstdc-so-error-adding-symbols-file-in-wrong-format
<https://github.com/ninja-build/ninja/issues/url> I changed the PATH
environment
like:

/root/raspcm4/sources/output/host/bin/:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/raspcm4/sources/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/bin

But still, I end up getting the same errors

Can anyone please let me know how to resolve this issue? Is there any ninja
build option to be selected in Buildroot?

Your help will be much appreciated.

Thanks in advance

P.S: Please let me know if any info is missing here

--00000000000037661a05db8760ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p dir=3D"auto" style=3D"box-sizing:border-box;margin-bott=
om:16px;color:rgb(36,41,47);font-family:-apple-system,BlinkMacSystemFont,&q=
uot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;=
,&quot;Segoe UI Emoji&quot;;font-size:14px;margin-top:0px">Hello All,</p><p=
 dir=3D"auto" style=3D"box-sizing:border-box;margin-top:0px;margin-bottom:1=
6px;color:rgb(36,41,47);font-family:-apple-system,BlinkMacSystemFont,&quot;=
Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&qu=
ot;Segoe UI Emoji&quot;;font-size:14px">While building=C2=A0<code style=3D"=
box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono=
&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9p=
x;padding:0.2em 0.4em;margin:0px;border-radius:6px">casync=C2=A0</code>usin=
g=C2=A0<code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono=
-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,mon=
ospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">n=
inja build</code>=C2=A0I am facing below errors related to<code style=3D"bo=
x-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&q=
uot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;=
padding:0.2em 0.4em;margin:0px;border-radius:6px">=C2=A0/usr/bin/ld: . . .e=
rror adding symbols: file in wrong format</code></p><p dir=3D"auto" style=
=3D"box-sizing:border-box;margin-top:0px;margin-bottom:16px;color:rgb(36,41=
,47);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helv=
etica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&q=
uot;;font-size:14px">I am following &quot;casync&quot; build guideline from=
=C2=A0<a href=3D"https://github.com/ninja-build/ninja/issues/url" style=3D"=
box-sizing:border-box;text-decoration-line:none">https://github.com/systemd=
/casync#building-casync</a>=C2=A0, it uses &quot;<code style=3D"box-sizing:=
border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menl=
o,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0=
.2em 0.4em;margin:0px;border-radius:6px">meson &quot;</code>=C2=A0along wit=
h ninja build.</p><p dir=3D"auto" style=3D"box-sizing:border-box;margin-top=
:0px;margin-bottom:16px;color:rgb(36,41,47);font-family:-apple-system,Blink=
MacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple C=
olor Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px"><code style=3D"=
box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono=
&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9p=
x;padding:0.2em 0.4em;margin:0px;border-radius:6px">If build failures persi=
st, run &quot;meson setup --wipe&quot; to rebuild from scratch</code><br st=
yle=3D"box-sizing:border-box"><code style=3D"box-sizing:border-box;font-fam=
ily:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Li=
beration Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0=
px;border-radius:6px">using the same options as passed when configuring the=
 build.</code><br style=3D"box-sizing:border-box"><code style=3D"box-sizing=
:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Men=
lo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:=
0.2em 0.4em;margin:0px;border-radius:6px">To change option values, run &quo=
t;meson configure&quot; instead.</code><br style=3D"box-sizing:border-box">=
<code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regula=
r,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;=
font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">ninja: E=
ntering directory build&#39;</code><br style=3D"box-sizing:border-box"><cod=
e style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&q=
uot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font=
-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">[1/31] Linki=
ng target casync-http</code><br style=3D"box-sizing:border-box"><code style=
=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF =
Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:1=
1.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">FAILED: casync-http=
</code><br style=3D"box-sizing:border-box"><code style=3D"box-sizing:border=
-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Cons=
olas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0=
.4em;margin:0px;border-radius:6px">cc -o casync-http casync-http.p/src_casy=
nc-http.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,</code>-<code style=3D"b=
ox-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&=
quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px=
;padding:0.2em 0.4em;margin:0px;border-radius:6px">rpath,/root/raspcm4/sour=
ces/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib -Wl,-rpa=
th</code>-<code style=3D"box-sizing:border-box;font-family:ui-monospace,SFM=
ono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,=
monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px=
">link,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu=
/sysroot/usr/lib -Wl,--start-group src/libshared.a</code>=C2=A0<code style=
=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF =
Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:1=
1.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">/root/raspcm4/sourc=
es/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcurl.s=
o</code>=C2=A0<code style=3D"box-sizing:border-box;font-family:ui-monospace=
,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&qu=
ot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius=
:6px">/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/=
sysroot/usr/lib/libssl.so</code>=C2=A0<code style=3D"box-sizing:border-box;=
font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,=
&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;=
margin:0px;border-radius:6px">/root/raspcm4/sources/output/host/bin/../aarc=
h64-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.so</code>=C2=A0<code styl=
e=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF=
 Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:=
11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">/root/raspcm4/sour=
ces/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.=
so</code>=C2=A0<code style=3D"box-sizing:border-box;font-family:ui-monospac=
e,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&q=
uot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radiu=
s:6px">/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu=
/sysroot/usr/lib/libz.so</code>=C2=A0<code style=3D"box-sizing:border-box;f=
ont-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&=
quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;m=
argin:0px;border-radius:6px">/root/raspcm4/sources/output/host/bin/../aarch=
64-buildroot-linux-gnu/sysroot/usr/lib/libzstd.so -lm -Wl,--end-group</code=
><br style=3D"box-sizing:border-box"><code style=3D"box-sizing:border-box;f=
ont-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&=
quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;m=
argin:0px;border-radius:6px">/usr/bin/ld: /root/raspcm4/sources/output/host=
/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libcurl.so: error addin=
g</code>=C2=A0<code style=3D"box-sizing:border-box;font-family:ui-monospace=
,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&qu=
ot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius=
:6px">symbols: file in wrong format</code><br style=3D"box-sizing:border-bo=
x"><code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Reg=
ular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospa=
ce;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">colle=
ct2: error: ld returned 1 exit status</code><br style=3D"box-sizing:border-=
box"><code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-R=
egular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monos=
pace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">[2/=
31] Linking target test-cachunk</code><br style=3D"box-sizing:border-box"><=
code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular=
,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;f=
ont-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">FAILED: t=
est-cachunk</code><br style=3D"box-sizing:border-box"><code style=3D"box-si=
zing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;=
,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padd=
ing:0.2em 0.4em;margin:0px;border-radius:6px">cc -o test-cachunk test-cachu=
nk.p/test_test-cachunk.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,</code>-<=
code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular=
,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;f=
ont-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">rpath,/ro=
ot/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/u=
sr/lib -Wl,-rpath</code>-<code style=3D"box-sizing:border-box;font-family:u=
i-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberat=
ion Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;bo=
rder-radius:6px">link,/root/raspcm4/sources/output/host/bin/../aarch64-buil=
droot-linux-gnu/sysroot/usr/lib -Wl,--start-group src/libshared.a</code>=C2=
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
;margin:0px;border-radius:6px">[3/31] Linking target test-cachunker</code><=
br style=3D"box-sizing:border-box"><code style=3D"box-sizing:border-box;fon=
t-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&qu=
ot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;mar=
gin:0px;border-radius:6px">FAILED: test-cachunker</code><br style=3D"box-si=
zing:border-box"><code style=3D"box-sizing:border-box;font-family:ui-monosp=
ace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono=
&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-rad=
ius:6px">cc -o test-cachunker test-cachunker.p/test_test-cachunker.c.o -Wl,=
--as-needed -Wl,--no-undefined -Wl,</code>-<code style=3D"box-sizing:border=
-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Cons=
olas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0=
.4em;margin:0px;border-radius:6px">rpath,/root/raspcm4/sources/output/host/=
bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib -Wl,-rpath</code>-<code =
style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quo=
t;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-s=
ize:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">link,/root/ras=
pcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib=
 -Wl,--start-group src/libshared.a</code>=C2=A0-<code style=3D"box-sizing:b=
order-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo=
,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.=
2em 0.4em;margin:0px;border-radius:6px">lacl /root/raspcm4/sources/output/h=
ost/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so</code>=C2=
=A0<code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Reg=
ular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospa=
ce;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">/root=
/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr=
/lib/libselinux.so</code>=C2=A0<code style=3D"box-sizing:border-box;font-fa=
mily:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;L=
iberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:=
0px;border-radius:6px">/root/raspcm4/sources/output/host/bin/../aarch64-bui=
ldroot-linux-gnu/sysroot/usr/lib/libz.so</code>=C2=A0<code style=3D"box-siz=
ing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,=
Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;paddi=
ng:0.2em 0.4em;margin:0px;border-radius:6px">/root/raspcm4/sources/output/h=
ost/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzstd.so -lm</code=
>=C2=A0<code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono=
-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,mon=
ospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">/=
root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot=
/usr/lib/libssl.so</code>=C2=A0<code style=3D"box-sizing:border-box;font-fa=
mily:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;L=
iberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:=
0px;border-radius:6px">/root/raspcm4/sources/output/host/bin/../aarch64-bui=
ldroot-linux-gnu/sysroot/usr/lib/libcrypto.so -Wl,--end-group -pthread</cod=
e><br style=3D"box-sizing:border-box"><code style=3D"box-sizing:border-box;=
font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,=
&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;=
margin:0px;border-radius:6px">/usr/bin/ld: /root/raspcm4/sources/output/hos=
t/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/liblzma.so: error addi=
ng</code>=C2=A0<code style=3D"box-sizing:border-box;font-family:ui-monospac=
e,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&q=
uot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radiu=
s:6px">symbols: file in wrong format</code><br style=3D"box-sizing:border-b=
ox"><code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Re=
gular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monosp=
ace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">coll=
ect2: error: ld returned 1 exit status</code><br style=3D"box-sizing:border=
-box"><code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-=
Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,mono=
space;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">[4=
/31] Linking target test-caencoder</code><br style=3D"box-sizing:border-box=
"><code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regu=
lar,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospac=
e;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">FAILED=
: test-caencoder</code><br style=3D"box-sizing:border-box"><code style=3D"b=
ox-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&=
quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px=
;padding:0.2em 0.4em;margin:0px;border-radius:6px">cc -o test-caencoder tes=
t-caencoder.p/test_test-caencoder.c.o -Wl,--as-needed -Wl,--no-undefined -W=
l,</code>-<code style=3D"box-sizing:border-box;font-family:ui-monospace,SFM=
ono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,=
monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px=
">rpath,/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-gn=
u/sysroot/usr/lib -Wl,-rpath</code>-<code style=3D"box-sizing:border-box;fo=
nt-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&q=
uot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;ma=
rgin:0px;border-radius:6px">link,/root/raspcm4/sources/output/host/bin/../a=
arch64-buildroot-linux-gnu/sysroot/usr/lib -Wl,--start-group src/libshared.=
a</code>=C2=A0-<code style=3D"box-sizing:border-box;font-family:ui-monospac=
e,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&q=
uot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radiu=
s:6px">lacl /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linu=
x-gnu/sysroot/usr/lib/liblzma.so</code>=C2=A0<code style=3D"box-sizing:bord=
er-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Co=
nsolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em=
 0.4em;margin:0px;border-radius:6px">/root/raspcm4/sources/output/host/bin/=
../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libselinux.so</code>=C2=A0<c=
ode style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,=
&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;fo=
nt-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">/root/rasp=
cm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/=
libz.so</code>=C2=A0<code style=3D"box-sizing:border-box;font-family:ui-mon=
ospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation M=
ono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-=
radius:6px">/root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linu=
x-gnu/sysroot/usr/lib/libzstd.so -lm</code>=C2=A0<code style=3D"box-sizing:=
border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menl=
o,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0=
.2em 0.4em;margin:0px;border-radius:6px">/root/raspcm4/sources/output/host/=
bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libssl.so</code>=C2=A0<c=
ode style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,=
&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;fo=
nt-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">/root/rasp=
cm4/sources/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/=
libcrypto.so -Wl,--end-group -pthread</code><br style=3D"box-sizing:border-=
box"><code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-R=
egular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monos=
pace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">/us=
r/bin/ld: /root/raspcm4/sources/output/host/bin/../aarch64-buildroot-linux-=
gnu/sysroot/usr/lib/liblzma.so: error adding</code>=C2=A0<code style=3D"box=
-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&qu=
ot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;p=
adding:0.2em 0.4em;margin:0px;border-radius:6px">symbols: file in wrong for=
mat</code><br style=3D"box-sizing:border-box"><code style=3D"box-sizing:bor=
der-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,C=
onsolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2e=
m 0.4em;margin:0px;border-radius:6px">collect2: error: ld returned 1 exit s=
tatus</code><br style=3D"box-sizing:border-box"><code style=3D"box-sizing:b=
order-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo=
,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.=
2em 0.4em;margin:0px;border-radius:6px">.</code><br style=3D"box-sizing:bor=
der-box"><code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMo=
no-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,m=
onospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px"=
>.</code><br style=3D"box-sizing:border-box"><code style=3D"box-sizing:bord=
er-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Co=
nsolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em=
 0.4em;margin:0px;border-radius:6px">[10/31] Compiling C object test-camatc=
h.p/test_test-camatch.c.o</code><br style=3D"box-sizing:border-box"><code s=
tyle=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot=
;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-si=
ze:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">ninja: build st=
opped: subcommand failed.</code><br></p><p dir=3D"auto" style=3D"box-sizing=
:border-box;margin-top:0px;margin-bottom:16px;color:rgb(36,41,47);font-fami=
ly:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sa=
ns-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size=
:14px">I am using Buildroot as build system and after following similar pos=
t in=C2=A0<a href=3D"https://github.com/ninja-build/ninja/issues/url" style=
=3D"box-sizing:border-box;background-color:transparent;text-decoration-line=
:none">https://stackoverflow.com/questions/27967802/libstdc-so-error-adding=
-symbols-file-in-wrong-format</a>=C2=A0I changed the=C2=A0<code style=3D"bo=
x-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&q=
uot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;=
padding:0.2em 0.4em;margin:0px;border-radius:6px">PATH=C2=A0</code>environm=
ent like:</p><p dir=3D"auto" style=3D"box-sizing:border-box;margin-top:0px;=
margin-bottom:16px;color:rgb(36,41,47);font-family:-apple-system,BlinkMacSy=
stemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color =
Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px"><code style=3D"box-s=
izing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot=
;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9px;pad=
ding:0.2em 0.4em;margin:0px;border-radius:6px">/root/raspcm4/sources/output=
/host/bin/:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbi=
n:/bin:/root/raspcm4/sources/output/host/aarch64-buildroot-linux-gnu/sysroo=
t/usr/bin</code></p><p dir=3D"auto" style=3D"box-sizing:border-box;margin-t=
op:0px;margin-bottom:16px;color:rgb(36,41,47);font-family:-apple-system,Bli=
nkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple=
 Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">But still, I =
end up getting the same errors</p><p dir=3D"auto" style=3D"box-sizing:borde=
r-box;margin-top:0px;margin-bottom:16px;color:rgb(36,41,47);font-family:-ap=
ple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-ser=
if,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px"=
>Can anyone please let me know how to resolve this issue? Is there any=C2=
=A0<code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Reg=
ular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospa=
ce;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">ninja=
 build</code>=C2=A0option to be selected in Buildroot?</p><p dir=3D"auto" s=
tyle=3D"box-sizing:border-box;margin-top:0px;margin-bottom:16px;color:rgb(3=
6,41,47);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,=
Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emo=
ji&quot;;font-size:14px">Your help will be much appreciated.</p><p dir=3D"a=
uto" style=3D"box-sizing:border-box;margin-top:0px;margin-bottom:16px;color=
:rgb(36,41,47);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&=
quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe =
UI Emoji&quot;;font-size:14px">Thanks in advance</p><p dir=3D"auto" style=
=3D"box-sizing:border-box;margin-top:0px;margin-bottom:16px;color:rgb(36,41=
,47);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helv=
etica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&q=
uot;;font-size:14px">P.S: Please let me know if any info is missing here</p=
></div>

--00000000000037661a05db8760ca--

--===============6787549470829289852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6787549470829289852==--
