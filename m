Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730D7C43217
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 00:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B82F341900;
	Wed, 23 Nov 2022 00:47:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B82F341900
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hvdaJ9Lm8BzQ; Wed, 23 Nov 2022 00:47:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 701464191D;
	Wed, 23 Nov 2022 00:47:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 701464191D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E52051BF95E
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 00:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCCE88206D
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 00:47:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCCE88206D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J6dKDE8-t6de for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 00:47:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 805C28200A
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 805C28200A
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 00:47:08 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id g12so27229316wrs.10
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 16:47:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WQaVhCA0yR6OGlSMchv898ZmyDAMYZXc8572HAPFOkU=;
 b=z6wipiwi87VmzIxrI512aM6u+OWB8WGlUdivjmN7Eia+dobRcaxs5bC+6cPz/IdJAN
 KQBouit8Gine1N+XBOaM6Rstr+q9OrNyNxTc3mOVPtHfpioKGWmi7o671vJxN6knnxmm
 Vy2PeDhSO/lmNUdCyKpAFu5Znq/LE0szslX4KrwxUo6T15BeYiiQaYzvJYFSzdH5hSQA
 xHtaQrdOnXGi92epJ6w4+YP7ms3rzIKEKL2SfxhtkEHbXcufCTiiUF3/W0eP5EeMwId6
 gdleK6r/S78wjrnnkIZgsOzfu0IS3u7UQ5p/3dxvKy0irujTxfEW8VdjM3UiMPgxE/Y3
 Oo1A==
X-Gm-Message-State: ANoB5pkMlEjrhRYy+lTkOBgR4jDxE8bR1g2sgmJ7XU4+LDiE27EVqPnO
 WaiUsscJnf/le5P845v3GkZ0MbfOO/uO7dYZtqZ3Zn18Iqjn/w==
X-Google-Smtp-Source: AA0mqf6wFvMSy2f+2aJFbvVfY87YITY/1fOaQ/3g+Ao1Sp/8cS406kd6ojDlmxfMvXthRNuEaZtu1E6Ctq0PxM08gGU=
X-Received: by 2002:a05:6000:1288:b0:241:dfd0:e7e3 with SMTP id
 f8-20020a056000128800b00241dfd0e7e3mr4301341wrx.413.1669164426233; Tue, 22
 Nov 2022 16:47:06 -0800 (PST)
MIME-Version: 1.0
From: Michael Despault <mike@wewearmanyhats.com>
Date: Tue, 22 Nov 2022 16:46:54 -0800
Message-ID: <CAP_a2zr1FbRNYf12d+42tPZ3xQrthddMc7pajaMC7ZA94aP5qQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wewearmanyhats-com.20210112.gappssmtp.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WQaVhCA0yR6OGlSMchv898ZmyDAMYZXc8572HAPFOkU=;
 b=RAnKK1qlZNFS/p7xCkkueFv8hZBD3thSiSvzIYODxFLZE8m7SnYUxeAIRDlMsmEdZP
 VN7i1u1ywHteFfyAlLm0JTHzJCLQ6Rbooylx5ql0/48fd13IT/J66hmzR293Vo5VE2bQ
 /C7GhfPWDjbA5IJ5ts4qiAJZATHtHoR9+NHhbgrr+2DbHnGk96UmF5Ay/z9izkoq7wCq
 NzsAzvAD1zjDt18rMgP2pTuOk9zd8d+vNEqT0Plqr7UnpTH1A1ph+Ppp4SyIORaQ/Hk0
 C0UIacgzt6cCWHN8KgAtY4122JjxAASU4Xmxqn5Xol1DINVarO4F1vO1sYqpUd9EpVCR
 TU+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=wewearmanyhats-com.20210112.gappssmtp.com
 header.i=@wewearmanyhats-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=RAnKK1ql
Subject: [Buildroot] defconfig with wayland support?
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
Content-Type: multipart/mixed; boundary="===============3966019611375949102=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3966019611375949102==
Content-Type: multipart/alternative; boundary="000000000000b2a14705ee18a00e"

--000000000000b2a14705ee18a00e
Content-Type: text/plain; charset="UTF-8"

I'm struggling to get a buildroot generated system up and running that has
working wayland support.  My primary goal is simply to be able to get an
embedded system that can run and display wayland applications, using the
buildroot system.  I've found examples of other configs that claim to have
X11 support, but nothing on wayland.  Poking around in "make menuconfig"
I've done what I can to enable any wayland/weston related options, but
currently I'm hitting this build error:

Run-time dependency libdrm found: NO (tried pkgconfig and cmake)
output/build/wlroots-0.14.1/meson.build:99:0: ERROR: Dependency "libdrm"
not found, tried pkgconfig and cmake

This happens when I try and build meson.  Has anyone had success getting an
embedded system (via buildroot) going with wayland working out of the box?
Hoping someone would be able to share their defconfig file with the
appropriate options, or at least share the essential components to enable
in make menuconfig.  Barebones is fine and not concerned so much about
architecture right now, but currently testing on X86_64 with the intent to
target aarch64 eventually.

Thanks,
Mike

*Mike Despault*
*CEO*
https://wewearmanyhats.com/

--000000000000b2a14705ee18a00e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m struggling to get a buildroot generated syste=
m up and running that has working wayland support.=C2=A0 My primary goal is=
 simply to be able to get an embedded=C2=A0system that can run and display =
wayland applications, using the buildroot system.=C2=A0 I&#39;ve found exam=
ples of other configs that claim to have X11 support, but nothing on waylan=
d.=C2=A0 Poking around in &quot;make menuconfig&quot; I&#39;ve done what I =
can to enable any wayland/weston related options, but currently I&#39;m hit=
ting this build error:</div><div><br></div><div>Run-time dependency libdrm =
found: NO (tried pkgconfig and cmake)<br>output/build/wlroots-0.14.1/meson.=
build:99:0: ERROR: Dependency &quot;libdrm&quot; not found, tried pkgconfig=
 and cmake<br></div><div><br></div><div>This happens when I try and build m=
eson.=C2=A0 Has anyone had success getting an embedded system (via buildroo=
t) going with wayland working out of the box?=C2=A0 Hoping someone would be=
 able to share their defconfig file with the appropriate options, or at lea=
st share the essential components to enable in make menuconfig.=C2=A0 Bareb=
ones is fine and not concerned so much about architecture right now, but cu=
rrently testing on X86_64 with the intent to target aarch64 eventually.</di=
v><div><br></div><div>Thanks,</div><div>Mike</div><br clear=3D"all"><div><d=
iv dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"=
><div dir=3D"ltr"><div style=3D"color:rgb(0,0,0);font-family:&quot;helvetic=
a neue&quot;,helvetica,arial,sans-serif;line-height:19.5px"><b>Mike Despaul=
t</b></div><div style=3D"color:rgb(0,0,0);font-family:&quot;helvetica neue&=
quot;,helvetica,arial,sans-serif;line-height:19.5px"><i>CEO</i></div><div s=
tyle=3D"color:rgb(0,0,0);font-family:&quot;helvetica neue&quot;,helvetica,a=
rial,sans-serif;line-height:19.5px"><a href=3D"https://wewearmanyhats.com/"=
 target=3D"_blank">https://wewearmanyhats.com/</a><br></div></div></div></d=
iv></div>

--000000000000b2a14705ee18a00e--

--===============3966019611375949102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3966019611375949102==--
