Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56847C433F5
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 16:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4B1081340;
	Thu, 19 May 2022 16:31:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZVQivwYZ8q7O; Thu, 19 May 2022 16:31:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FDE581330;
	Thu, 19 May 2022 16:31:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B5BC1BF37B
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 16:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1948560E03
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 16:31:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ib-7yPU1iURl for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 16:31:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B37160B93
 for <buildroot@buildroot.org>; Thu, 19 May 2022 16:31:44 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id t25so10065018lfg.7
 for <buildroot@buildroot.org>; Thu, 19 May 2022 09:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9HkUEUXu5imyGs8XArxm6UnECiNCG390SvdPo6HivGs=;
 b=PV1I8hbGusa+nsZPV+Y7e3cDupPugn75hoqG9oIPwYN6LoBSWbVtjZ42xWebQEX24L
 TgeCS21MdXfyBmgvJwYIfj45Sl9DPfhFlhplQPBMd4hEKVqjVuFxrz8Y8ad0+Vs1NerV
 de8vygVpZPYDsCGwyYBSeUqIVV/JdoOTC+qpMOjo57LKpHwIcOK2k9whXl6OR7XjoHQL
 hSbJ7fRxekVcaqf/W3RISfU7PhhPID8ZRXXjuJ6oqPxbtppfeilW54iL8mw1rA3OZs0C
 hScDEyHZWokXWxf5deZGlGPiILmp0Rp4DMe2RCOQYzec4KQ+SOlnMvb8E7m/wKAGdNt7
 360Q==
X-Gm-Message-State: AOAM533gKQXRKjGTN02HdTmC7n72Flg3lrvl93KCB+JfzN/us7qYkat5
 pqZw/Yll88zjusTOVu5B5Ccnqy8SAfpOUR4zJUa5mMbspcA/Pw==
X-Google-Smtp-Source: ABdhPJziwGBOdhRFrWrfQhi2x6Qxv5q024v9USljB6lx1E48a8EbjQdNLHN65pLaKVmbaQ5wtgbKKGBps9FJ2beDSUY=
X-Received: by 2002:a05:6512:3d01:b0:472:6386:9e73 with SMTP id
 d1-20020a0565123d0100b0047263869e73mr3851432lfv.486.1652977902100; Thu, 19
 May 2022 09:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220518141927.554571-1-aperez@igalia.com>
In-Reply-To: <20220518141927.554571-1-aperez@igalia.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 19 May 2022 18:31:30 +0200
Message-ID: <CAB0FRssx+9pJoLhn8DB6LvKRLcZMnaHEyU+gA6q_K22kbBsNBg@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: bump to version
 2.36.2
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: multipart/mixed; boundary="===============0978537868922946937=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0978537868922946937==
Content-Type: multipart/alternative; boundary="000000000000ad463105df5fe899"

--000000000000ad463105df5fe899
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 mai 2022 =C3=A0 16:19, Adrian Perez de Castro <aperez@igalia.com=
> a
=C3=A9crit :

> Bugfix release, mostly with build fixes, and an important fix for
> when using threaded rendering. Release notes:
>
>   https://wpewebkit.org/release/wpewebkit-2.36.2.html
>
> This release fails to build when X11 headers are not present, but there
> is already a fix accepted upstream and slated for inclusion in the next
> release in the series, so in the meantime imported it locally.
>
>
webkitgtk 2.36.1 (from BR 2022.05-rc1) has also this issue.
patch from https://bugs.webkit.org/show_bug.cgi?id=3D239039 solves it.

Fran=C3=A7ois



> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  ...GLE-with-the-EGL_NO_PLATFORM_SPECIFI.patch | 39 +++++++++++++++++++
>  package/wpewebkit/wpewebkit.hash              |  8 ++--
>  package/wpewebkit/wpewebkit.mk                |  2 +-
>  3 files changed, 44 insertions(+), 5 deletions(-)
>  create mode 100644
> package/wpewebkit/0001-GTK-WPE-Build-ANGLE-with-the-EGL_NO_PLATFORM_SPECI=
FI.patch
>
> diff --git
> a/package/wpewebkit/0001-GTK-WPE-Build-ANGLE-with-the-EGL_NO_PLATFORM_SPE=
CIFI.patch
> b/package/wpewebkit/0001-GTK-WPE-Build-ANGLE-with-the-EGL_NO_PLATFORM_SPE=
CIFI.patch
> new file mode 100644
> index 0000000000..0b6dd9bcb1
> --- /dev/null
> +++
> b/package/wpewebkit/0001-GTK-WPE-Build-ANGLE-with-the-EGL_NO_PLATFORM_SPE=
CIFI.patch
> @@ -0,0 +1,39 @@
> +From 32135a4af7c2ea1db2ea528df9af0a331ca88dba Mon Sep 17 00:00:00 2001
> +From: "zan@falconsigh.net"
> + <zan@falconsigh.net@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
> +Date: Tue, 12 Apr 2022 06:34:44 +0000
> +Subject: [PATCH] [GTK][WPE] Build ANGLE with the
> + EGL_NO_PLATFORM_SPECIFIC_TYPES define
> + https://bugs.webkit.org/show_bug.cgi?id=3D239039
> +
> +Reviewed by Adrian Perez de Castro.
> +
> +Specify the EGL_NO_PLATFORM_SPECIFIC_TYPES define when building ANGLE
> +subproject for the GTK and WPE ports. This should avoid searching for
> +platform-specific headers that might not be available at all during
> +build, e.g. the X11 headers which are used by default on UNIX platforms.
> +
> +* PlatformGTK.cmake:
> +* PlatformWPE.cmake:
> +
> +Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> +Upstream status: https://bugs.webkit.org/show_bug.cgi?id=3D239039
> +---
> + Source/ThirdParty/ANGLE/ChangeLog         | 15 +++++++++++++++
> + Source/ThirdParty/ANGLE/PlatformGTK.cmake |  2 +-
> + Source/ThirdParty/ANGLE/PlatformWPE.cmake |  2 +-
> + 3 files changed, 17 insertions(+), 2 deletions(-)
> +
> +diff --git a/Source/ThirdParty/ANGLE/PlatformWPE.cmake
> b/Source/ThirdParty/ANGLE/PlatformWPE.cmake
> +index a4d0b959c62..8f5bff7f19a 100644
> +--- a/Source/ThirdParty/ANGLE/PlatformWPE.cmake
> ++++ b/Source/ThirdParty/ANGLE/PlatformWPE.cmake
> +@@ -1,4 +1,4 @@
> +-list(APPEND ANGLE_DEFINITIONS ANGLE_PLATFORM_LINUX)
> ++list(APPEND ANGLE_DEFINITIONS ANGLE_PLATFORM_LINUX
> EGL_NO_PLATFORM_SPECIFIC_TYPES)
> + include(linux.cmake)
> +
> + if (USE_OPENGL)
> +--
> +2.36.1
> +
> diff --git a/package/wpewebkit/wpewebkit.hash
> b/package/wpewebkit/wpewebkit.hash
> index 3923c32111..d509ab091f 100644
> --- a/package/wpewebkit/wpewebkit.hash
> +++ b/package/wpewebkit/wpewebkit.hash
> @@ -1,7 +1,7 @@
> -# From https://wpewebkit.org/releases/wpewebkit-2.36.1.tar.xz.sums
> -md5 <https://wpewebkit.org/releases/wpewebkit-2.36.1.tar.xz.sums-md5>
> 7ba1c7fd0f67891ad137d11cac12f7a9  wpewebkit-2.36.1.tar.xz
> -sha1  0918a4daded01f42e65ec02a69f21cd6705311db  wpewebkit-2.36.1.tar.xz
> -sha256  ec83d8b2f8c3479ce9950d69440f3b9876ab70200fe6f4e07686054a0cba5723
> wpewebkit-2.36.1.tar.xz
> +# From https://wpewebkit.org/releases/wpewebkit-2.36.2.tar.xz.sums
> +md5 <https://wpewebkit.org/releases/wpewebkit-2.36.2.tar.xz.sums+md5>
> bcfb465ae085835ae96c68fddc85ca44  wpewebkit-2.36.2.tar.xz
> +sha1  1a5a6b7b5e94f4ea7e3462d6bdb5de7efa678f74  wpewebkit-2.36.2.tar.xz
> +sha256  959519562701e2005f2767a62e85977d6c3e65858709b376c89d8e33502febb9
> wpewebkit-2.36.2.tar.xz
>
>  # Hashes for license files:
>  sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4
> Source/WebCore/LICENSE-APPLE
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/
> wpewebkit.mk
> index 9c9a9a2838..ca26cb3f65 100644
> --- a/package/wpewebkit/wpewebkit.mk
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ########################################################################=
########
>
> -WPEWEBKIT_VERSION =3D 2.36.1
> +WPEWEBKIT_VERSION =3D 2.36.2
>  WPEWEBKIT_SITE =3D http://www.wpewebkit.org/releases
>  WPEWEBKIT_SOURCE =3D wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
>  WPEWEBKIT_INSTALL_STAGING =3D YES
> --
> 2.36.1
>
>

--000000000000ad463105df5fe899
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 18 mai 2022 =C3=A0=C2=A0=
16:19, Adrian Perez de Castro &lt;<a href=3D"mailto:aperez@igalia.com">aper=
ez@igalia.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Bugfix release, mostly with build fixes, and an i=
mportant fix for<br>
when using threaded rendering. Release notes:<br>
<br>
=C2=A0 <a href=3D"https://wpewebkit.org/release/wpewebkit-2.36.2.html" rel=
=3D"noreferrer" target=3D"_blank">https://wpewebkit.org/release/wpewebkit-2=
.36.2.html</a><br>
<br>
This release fails to build when X11 headers are not present, but there<br>
is already a fix accepted upstream and slated for inclusion in the next<br>
release in the series, so in the meantime imported it locally.<br>
<br></blockquote><div><br></div><div>webkitgtk 2.36.1 (from BR 2022.05-rc1)=
 has also this issue.</div><div>patch from <a href=3D"https://bugs.webkit.o=
rg/show_bug.cgi?id=3D239039" rel=3D"noreferrer" target=3D"_blank">https://b=
ugs.webkit.org/show_bug.cgi?id=3D239039</a> solves it.<br></div><div><br></=
div><div>Fran=C3=A7ois<br></div><div><br></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Adrian Perez de Castro &lt;<a href=3D"mailto:aperez@igalia.c=
om" target=3D"_blank">aperez@igalia.com</a>&gt;<br>
---<br>
=C2=A0...GLE-with-the-EGL_NO_PLATFORM_SPECIFI.patch | 39 ++++++++++++++++++=
+<br>
=C2=A0package/wpewebkit/wpewebkit.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 8 ++--<br>
=C2=A0package/wpewebkit/<a href=3D"http://wpewebkit.mk" rel=3D"noreferrer" =
target=3D"_blank">wpewebkit.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A03 files changed, 44 insertions(+), 5 deletions(-)<br>
=C2=A0create mode 100644 package/wpewebkit/0001-GTK-WPE-Build-ANGLE-with-th=
e-EGL_NO_PLATFORM_SPECIFI.patch<br>
<br>
diff --git a/package/wpewebkit/0001-GTK-WPE-Build-ANGLE-with-the-EGL_NO_PLA=
TFORM_SPECIFI.patch b/package/wpewebkit/0001-GTK-WPE-Build-ANGLE-with-the-E=
GL_NO_PLATFORM_SPECIFI.patch<br>
new file mode 100644<br>
index 0000000000..0b6dd9bcb1<br>
--- /dev/null<br>
+++ b/package/wpewebkit/0001-GTK-WPE-Build-ANGLE-with-the-EGL_NO_PLATFORM_S=
PECIFI.patch<br>
@@ -0,0 +1,39 @@<br>
+From 32135a4af7c2ea1db2ea528df9af0a331ca88dba Mon Sep 17 00:00:00 2001<br>
+From: &quot;<a href=3D"mailto:zan@falconsigh.net" target=3D"_blank">zan@fa=
lconsigh.net</a>&quot;<br>
+ &lt;zan@falconsigh.net@268f45cc-cd09-0410-ab3c-d52691b4dbfc&gt;<br>
+Date: Tue, 12 Apr 2022 06:34:44 +0000<br>
+Subject: [PATCH] [GTK][WPE] Build ANGLE with the<br>
+ EGL_NO_PLATFORM_SPECIFIC_TYPES define<br>
+ <a href=3D"https://bugs.webkit.org/show_bug.cgi?id=3D239039" rel=3D"noref=
errer" target=3D"_blank">https://bugs.webkit.org/show_bug.cgi?id=3D239039</=
a><br>
+<br>
+Reviewed by Adrian Perez de Castro.<br>
+<br>
+Specify the EGL_NO_PLATFORM_SPECIFIC_TYPES define when building ANGLE<br>
+subproject for the GTK and WPE ports. This should avoid searching for<br>
+platform-specific headers that might not be available at all during<br>
+build, e.g. the X11 headers which are used by default on UNIX platforms.<b=
r>
+<br>
+* PlatformGTK.cmake:<br>
+* PlatformWPE.cmake:<br>
+<br>
+Signed-off-by: Adrian Perez de Castro &lt;<a href=3D"mailto:aperez@igalia.=
com" target=3D"_blank">aperez@igalia.com</a>&gt;<br>
+Upstream status: <a href=3D"https://bugs.webkit.org/show_bug.cgi?id=3D2390=
39" rel=3D"noreferrer" target=3D"_blank">https://bugs.webkit.org/show_bug.c=
gi?id=3D239039</a><br>
+---<br>
+ Source/ThirdParty/ANGLE/ChangeLog=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 +=
++++++++++++++<br>
+ Source/ThirdParty/ANGLE/PlatformGTK.cmake |=C2=A0 2 +-<br>
+ Source/ThirdParty/ANGLE/PlatformWPE.cmake |=C2=A0 2 +-<br>
+ 3 files changed, 17 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/Source/ThirdParty/ANGLE/PlatformWPE.cmake b/Source/ThirdParty=
/ANGLE/PlatformWPE.cmake<br>
+index a4d0b959c62..8f5bff7f19a 100644<br>
+--- a/Source/ThirdParty/ANGLE/PlatformWPE.cmake<br>
++++ b/Source/ThirdParty/ANGLE/PlatformWPE.cmake<br>
+@@ -1,4 +1,4 @@<br>
+-list(APPEND ANGLE_DEFINITIONS ANGLE_PLATFORM_LINUX)<br>
++list(APPEND ANGLE_DEFINITIONS ANGLE_PLATFORM_LINUX EGL_NO_PLATFORM_SPECIF=
IC_TYPES)<br>
+ include(linux.cmake)<br>
+ <br>
+ if (USE_OPENGL)<br>
+-- <br>
+2.36.1<br>
+<br>
diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit=
.hash<br>
index 3923c32111..d509ab091f 100644<br>
--- a/package/wpewebkit/wpewebkit.hash<br>
+++ b/package/wpewebkit/wpewebkit.hash<br>
@@ -1,7 +1,7 @@<br>
-# From <a href=3D"https://wpewebkit.org/releases/wpewebkit-2.36.1.tar.xz.s=
ums-md5" rel=3D"noreferrer" target=3D"_blank">https://wpewebkit.org/release=
s/wpewebkit-2.36.1.tar.xz.sums<br>
-md5</a>=C2=A0 7ba1c7fd0f67891ad137d11cac12f7a9=C2=A0 wpewebkit-2.36.1.tar.=
xz<br>
-sha1=C2=A0 0918a4daded01f42e65ec02a69f21cd6705311db=C2=A0 wpewebkit-2.36.1=
.tar.xz<br>
-sha256=C2=A0 ec83d8b2f8c3479ce9950d69440f3b9876ab70200fe6f4e07686054a0cba5=
723=C2=A0 wpewebkit-2.36.1.tar.xz<br>
+# From <a href=3D"https://wpewebkit.org/releases/wpewebkit-2.36.2.tar.xz.s=
ums+md5" rel=3D"noreferrer" target=3D"_blank">https://wpewebkit.org/release=
s/wpewebkit-2.36.2.tar.xz.sums<br>
+md5</a>=C2=A0 bcfb465ae085835ae96c68fddc85ca44=C2=A0 wpewebkit-2.36.2.tar.=
xz<br>
+sha1=C2=A0 1a5a6b7b5e94f4ea7e3462d6bdb5de7efa678f74=C2=A0 wpewebkit-2.36.2=
.tar.xz<br>
+sha256=C2=A0 959519562701e2005f2767a62e85977d6c3e65858709b376c89d8e33502fe=
bb9=C2=A0 wpewebkit-2.36.2.tar.xz<br>
<br>
=C2=A0# Hashes for license files:<br>
=C2=A0sha256=C2=A0 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a7=
6094edb4=C2=A0 Source/WebCore/LICENSE-APPLE<br>
diff --git a/package/wpewebkit/<a href=3D"http://wpewebkit.mk" rel=3D"noref=
errer" target=3D"_blank">wpewebkit.mk</a> b/package/wpewebkit/<a href=3D"ht=
tp://wpewebkit.mk" rel=3D"noreferrer" target=3D"_blank">wpewebkit.mk</a><br=
>
index 9c9a9a2838..ca26cb3f65 100644<br>
--- a/package/wpewebkit/<a href=3D"http://wpewebkit.mk" rel=3D"noreferrer" =
target=3D"_blank">wpewebkit.mk</a><br>
+++ b/package/wpewebkit/<a href=3D"http://wpewebkit.mk" rel=3D"noreferrer" =
target=3D"_blank">wpewebkit.mk</a><br>
@@ -4,7 +4,7 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-WPEWEBKIT_VERSION =3D 2.36.1<br>
+WPEWEBKIT_VERSION =3D 2.36.2<br>
=C2=A0WPEWEBKIT_SITE =3D <a href=3D"http://www.wpewebkit.org/releases" rel=
=3D"noreferrer" target=3D"_blank">http://www.wpewebkit.org/releases</a><br>
=C2=A0WPEWEBKIT_SOURCE =3D wpewebkit-$(WPEWEBKIT_VERSION).tar.xz<br>
=C2=A0WPEWEBKIT_INSTALL_STAGING =3D YES<br>
-- <br>
2.36.1<br>
<br>
</blockquote></div></div>

--000000000000ad463105df5fe899--

--===============0978537868922946937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0978537868922946937==--
