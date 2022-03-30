Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0578C433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 17:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75DD06126B;
	Wed, 30 Mar 2022 17:04:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aRQWFSQ277SM; Wed, 30 Mar 2022 17:04:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74B7F61262;
	Wed, 30 Mar 2022 17:04:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6F8561BF47E
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 17:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69B2B40569
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 17:04:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0xIIEw2qjoW7 for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 17:04:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90E8B4015D
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 17:04:23 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id x4so25508117iop.7
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 10:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=pDjG+T6XCiWvzXObDvSrxFp1AMnCCf6RnXGMWCJ140s=;
 b=KHakXLJ6w+9S0d+XCWVS5q9SAf6ij5jlEC9vzxa4A2TRUe0WSZXsxNi6F4nLikoH/D
 xV02elroQUYX+eHfsfH9Uf5Xrmy5KgZrgM0THI2/LvZ3qvktHsWXAxVxWW7LPMopY3hs
 F1GB9VWYAsL8Hc09Mk0fDoihMnzyjNYjaJ+PzId036bc1NZLYwpx0Y/KBJPorZucZqhZ
 9ZEwFVm01O/ZYySPYk9B9tqJzDum6hBsmvwHMUkkHf8zKtZ5oA7vHhfbvgGf7ZKY14XB
 tncS6jY8U1x8UKq+2myBWpq09Yo/TekGuyczoTR5KmvpCtRjDxaeP5dlNh5bTagBnuxW
 P3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=pDjG+T6XCiWvzXObDvSrxFp1AMnCCf6RnXGMWCJ140s=;
 b=GZgF0tnMRwmvbrGvmheNsOMwknIa3TSRXW+QS9mU8gCy3e41O/Yn1n/Q0DZC1QWB7K
 2GFJQ0qFGGyGdC0F5sejesWGht8wEPsNd/S1iVdWK0UQ+7nV5ypR4Zt4PAo+j7rlYEaW
 5zFcqAyg2BOPb51rummP7Yz7G0h6scJNI0Vftg7nVqLC5Xg6e/wlxsOVTuUOu07sWgZF
 zptIEBRdYETD7HjCffSZXFYwOz1UralwcZUrgMShBv/U8T6VBzksjYh0775K6Sp8Rn3H
 kfgYaUIKEul9C29m1eSYjnCFsQufrSekSrP0likv5lt24NOJtSjmmmUHU5Yx8FFD1byy
 rINw==
X-Gm-Message-State: AOAM531uXy0ZFuhtzsWhK/UtmNSQFH0Iu3rA75g6Awxu+05nKLkqaaFX
 XAtGrWpNDegxPvwkiac0gYunhmiJd3YEC4c3ggkQdyn53Bw=
X-Google-Smtp-Source: ABdhPJx8AiCBhOMrG/+83NvkflJi9zt72M7LuSzmWfJ8xFNJxl3rNZfkYlP3bu98KxqNV09PWkd/hoGsUjyWz5MVaI0=
X-Received: by 2002:a05:6638:2601:b0:31a:632e:3d69 with SMTP id
 m1-20020a056638260100b0031a632e3d69mr382291jat.229.1648659862379; Wed, 30 Mar
 2022 10:04:22 -0700 (PDT)
MIME-Version: 1.0
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Wed, 30 Mar 2022 19:04:11 +0200
Message-ID: <CADYjeSs3mV8Nhq6VzwKRfLB16cJeQkjJjc-bBeP8RO7z8RCdgw@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] Run-time dependency error | C shared or static library
 'acl' not found
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
Content-Type: multipart/mixed; boundary="===============3801622143621243981=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3801622143621243981==
Content-Type: multipart/alternative; boundary="00000000000074028e05db728900"

--00000000000074028e05db728900
Content-Type: text/plain; charset="UTF-8"

Hello All,

I am building casync to use with the "rauc" tool. And I am using Buildroot
2022.02 as build system and I have enabled "host meson-tools " in Buildroot
"menuconfig ". But while building using
https://github.com/systemd/casync#building-casync

meson build && ninja -C build && sudo ninja -C build install

I am getting the below errors:

Found pkg-config: /root/raspcm4/sources/output/host/bin/pkg-config (1.6.3)
Run-time dependency liblzma found: YES 5.2.5
Run-time dependency zlib found: YES 1.2.11
Run-time dependency libzstd found: YES 1.5.2
Run-time dependency libcurl found: YES 7.81.0
Run-time dependency openssl found: YES 1.1.1m

meson.build:135:0: ERROR: C shared or static library 'acl' not found

But BR2_PACKAGE_ACL=y is already selected.

Can you please let me know what is the proper package that should be
selected in Buildroot? And also what are the other Run-time dependencies
(libs/packages) that should be selected in Buildroot?

Your help will be much appreciated.

Thanks in advance


Kind Regards,

Sourabh

--00000000000074028e05db728900
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p dir=3D"auto" style=3D"box-sizing:border-box;margin-bott=
om:16px;color:rgb(36,41,47);font-family:-apple-system,BlinkMacSystemFont,&q=
uot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;=
,&quot;Segoe UI Emoji&quot;;font-size:14px;margin-top:0px">Hello All,</p><p=
 dir=3D"auto" style=3D"box-sizing:border-box;margin-top:0px;margin-bottom:1=
6px;color:rgb(36,41,47);font-family:-apple-system,BlinkMacSystemFont,&quot;=
Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&qu=
ot;Segoe UI Emoji&quot;;font-size:14px">I am building casync to use with th=
e &quot;rauc&quot; tool. And I am using Buildroot 2022.02 as build system a=
nd I have enabled &quot;<code style=3D"box-sizing:border-box;font-family:ui=
-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberati=
on Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;bor=
der-radius:6px">host meson-tools &quot;</code>=C2=A0in Buildroot &quot;<cod=
e style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&q=
uot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font=
-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">menuconfig &=
quot;.</code>=C2=A0But while building using=C2=A0<a href=3D"https://github.=
com/systemd/casync#building-casync">https://github.com/systemd/casync#build=
ing-casync</a></p><p dir=3D"auto" style=3D"box-sizing:border-box;margin-top=
:0px;margin-bottom:16px;color:rgb(36,41,47);font-family:-apple-system,Blink=
MacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple C=
olor Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px"><code style=3D"=
box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono=
&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:11.9p=
x;padding:0.2em 0.4em;margin:0px;border-radius:6px">meson build &amp;&amp; =
ninja -C build &amp;&amp; sudo ninja -C build install</code></p><p dir=3D"a=
uto" style=3D"box-sizing:border-box;margin-top:0px;margin-bottom:16px;color=
:rgb(36,41,47);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&=
quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe =
UI Emoji&quot;;font-size:14px">I am getting the below errors:</p><p dir=3D"=
auto" style=3D"box-sizing:border-box;margin-top:0px;margin-bottom:16px;colo=
r:rgb(36,41,47);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI=
&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe=
 UI Emoji&quot;;font-size:14px"><code style=3D"box-sizing:border-box;font-f=
amily:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;=
Liberation Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin=
:0px;border-radius:6px">Found pkg-config: /root/raspcm4/sources/output/host=
/bin/pkg-config (1.6.3)</code><br style=3D"box-sizing:border-box"><code sty=
le=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&quot;S=
F Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size=
:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">Run-time dependen=
cy liblzma found: YES 5.2.5</code><br style=3D"box-sizing:border-box"><code=
 style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&qu=
ot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-=
size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">Run-time depe=
ndency zlib found: YES 1.2.11</code><br style=3D"box-sizing:border-box"><co=
de style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regular,&=
quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;fon=
t-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">Run-time de=
pendency libzstd found: YES 1.5.2</code><br style=3D"box-sizing:border-box"=
><code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Regul=
ar,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace=
;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">Run-tim=
e dependency libcurl found: YES 7.81.0</code><br style=3D"box-sizing:border=
-box"><code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-=
Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,mono=
space;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">Ru=
n-time dependency openssl found: YES 1.1.1m</code></p><p dir=3D"auto" style=
=3D"box-sizing:border-box;margin-top:0px;margin-bottom:16px;color:rgb(36,41=
,47);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helv=
etica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&q=
uot;;font-size:14px"><code style=3D"box-sizing:border-box;font-family:ui-mo=
nospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation =
Mono&quot;,monospace;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border=
-radius:6px">meson.build:135:0: ERROR: C shared or static library &#39;acl&=
#39; not found</code></p><p dir=3D"auto" style=3D"box-sizing:border-box;mar=
gin-top:0px;margin-bottom:16px;color:rgb(36,41,47);font-family:-apple-syste=
m,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;=
Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">But=C2=
=A0<code style=3D"box-sizing:border-box;font-family:ui-monospace,SFMono-Reg=
ular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospa=
ce;font-size:11.9px;padding:0.2em 0.4em;margin:0px;border-radius:6px">BR2_P=
ACKAGE_ACL=3Dy</code>=C2=A0is already selected.</p><p dir=3D"auto" style=3D=
"box-sizing:border-box;margin-top:0px;margin-bottom:16px;color:rgb(36,41,47=
);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helveti=
ca,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot=
;;font-size:14px">Can you please let me know what is the proper package tha=
t should be selected in Buildroot? And also what are the other Run-time dep=
endencies (libs/packages) that should be selected in Buildroot?</p><p dir=
=3D"auto" style=3D"box-sizing:border-box;margin-top:0px;margin-bottom:16px;=
color:rgb(36,41,47);font-family:-apple-system,BlinkMacSystemFont,&quot;Sego=
e UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;S=
egoe UI Emoji&quot;;font-size:14px">Your help will be much appreciated.</p>=
<p dir=3D"auto" style=3D"box-sizing:border-box;margin-top:0px;color:rgb(36,=
41,47);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,He=
lvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji=
&quot;;font-size:14px;margin-bottom:0px">Thanks in advance</p><p dir=3D"aut=
o" style=3D"box-sizing:border-box;margin-top:0px;color:rgb(36,41,47);font-f=
amily:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial=
,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-s=
ize:14px;margin-bottom:0px"><br></p><p style=3D"box-sizing:border-box;margi=
n-top:0px;color:rgb(36,41,47);font-family:-apple-system,BlinkMacSystemFont,=
&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quo=
t;,&quot;Segoe UI Emoji&quot;;font-size:14px;margin-bottom:0px">Kind Regard=
s,</p><p style=3D"box-sizing:border-box;margin-top:0px;color:rgb(36,41,47);=
font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica=
,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;=
font-size:14px;margin-bottom:0px">Sourabh</p></div>

--00000000000074028e05db728900--

--===============3801622143621243981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3801622143621243981==--
