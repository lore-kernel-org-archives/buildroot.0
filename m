Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F7CE936FC
	for <buildroot@archiver.kernel.org>; Fri,  6 Oct 2023 11:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50EEF41DE4;
	Fri,  6 Oct 2023 11:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50EEF41DE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BQhVI5FsgFMt; Fri,  6 Oct 2023 11:11:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5C3B41DED;
	Fri,  6 Oct 2023 11:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5C3B41DED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 169C21BF38B
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 11:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F147C82768
 for <buildroot@lists.busybox.net>; Fri,  6 Oct 2023 11:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F147C82768
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LXSrdMUmbKid for <buildroot@lists.busybox.net>;
 Fri,  6 Oct 2023 11:11:36 +0000 (UTC)
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 889BA82438
 for <buildroot@buildroot.org>; Fri,  6 Oct 2023 11:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 889BA82438
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-d90da64499cso2200951276.0
 for <buildroot@buildroot.org>; Fri, 06 Oct 2023 04:11:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696590695; x=1697195495;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sgJUawckDTz5STYjRplnp98XGx7v6xfZlXZ3M/nNThU=;
 b=KAdXW4OLpXJjCge3+ZBns1N5zoxQD82jvwAKb9ow9/iIUVz1WAxz+W2l1WHBvX75DE
 JKKHvK6WLzDdXp3GS9+ibMYTpGt+gLlfzcrlfQVjeRck5BPgx3tkXlxbqmNdGYpSzVTz
 jMlzj4lDiNcfAzfj/9dryfdaIZc9swx1GLCltxoa1ZFh1neRFKwMFk7ZXsrWzckEB5Ig
 Y7UZ8kW29MmXC7s1tsl4upazypX3jSD6Xqxxzf0a8whxOMCs6ds9GGVlyHP1vhW4AzbR
 3j8FunZIpYPapNrJ89aBwfCoa/P5vYNBmLewbgKvkjfp+RJX2y/fPlmNxMtnKkVPt309
 5J6w==
X-Gm-Message-State: AOJu0YwhJIYEnrdC70Bpjohf8LO/nRiWsA4AEz9OrcrQR+ZqXEotFuvk
 sckIRWBkJtaOoFZMpJ+iXZz3ZwKEy13U8ITY0xwDbwKobF8=
X-Google-Smtp-Source: AGHT+IGabg2wwZ1+WWn1/k38Z8Po5eohUpAMikytKNwiRQcKf2IR7tl/neYhE8Bhk5CvssqFTn1V+hhrgHkQ/PimV9U=
X-Received: by 2002:a25:acd2:0:b0:d4a:d2e2:afe0 with SMTP id
 x18-20020a25acd2000000b00d4ad2e2afe0mr8087115ybd.14.1696590695329; Fri, 06
 Oct 2023 04:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1696522656.git.yann.morin.1998@free.fr>
 <33ee4b08c20f9c4566cfe82c648f01599cab70b5.1696522656.git.yann.morin.1998@free.fr>
In-Reply-To: <33ee4b08c20f9c4566cfe82c648f01599cab70b5.1696522656.git.yann.morin.1998@free.fr>
From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 6 Oct 2023 13:11:23 +0200
Message-ID: <CAFSsvmoFOWqWunvi0bv6q_N+LXBVfB8QjNs0_hfQzQLOwwOKVg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696590695; x=1697195495; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sgJUawckDTz5STYjRplnp98XGx7v6xfZlXZ3M/nNThU=;
 b=K7d4DxCdVr9FZQzOPagUWTCDPHlTLEm4vJt120T/5kkn8Fn+AJmzQ7UdIUy9KwTsFl
 +jWcZoaUV9yMzYFNjZze/uIpVhWBuy4VZfte3IVXaTgJua4bS7TgEl58MQemmoWq85lb
 7tCD6WsfiayEeEKkR+ceNH96+Kh2B/QD9jLmawYpPaBSI/kjPsIjlqeDXTMTjgnN1Mb4
 sm6mnW86SamApgZuQC97HCiUfZB2/b90XsW9NueDiBGoskeXhaTT+fxNgczZNT7u6E3q
 TWBOg/2nOXzknsUpGkP14hDlzcY5wds1irl7R6W8d5/emt1CxSA2M8FYFmMIXxW27Cor
 qUlQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=K7d4DxCd
Subject: Re: [Buildroot] [PATCH 2/2 v2] suport/runtime-test: extend flutter
 test to check rendering is happening
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
Content-Type: multipart/mixed; boundary="===============2966291925262370527=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2966291925262370527==
Content-Type: multipart/alternative; boundary="000000000000b973a306070a4d11"

--000000000000b973a306070a4d11
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks good to me!

Reviewed-by: Adam Duskett <aduskett@gmail.com>

On Thu, Oct 5, 2023 at 6:17=E2=80=AFPM Yann E. MORIN <yann.morin.1998@free.=
fr>
wrote:

> Commit 7f0af11cee31 (support/testing/tests/package/test_flutter.py: new
> runtime test) added a simple test that just checked that the systemd
> unit launching the application, was active.
>
> It is perfectly possible, from a systemd perspective, that the unit is
> active, while the application actually crashes.
>
> Instead, what we need to check, is that the application does actually
> render "something"; we don't really care what, as long as we know it is
> actually rendering, thus the graphical stack is working and the
> aplication stack is running.
>
> Extend the flutter runtime test to also check that the framebuffer is
> modified by the application when it is running, similarly to what we do
> in the weston test.
>
> We drop the activation of the unit and start it manually, as we want to
> check the state of the CRC before, while, and after the application
> runs.
>
> We also need to disable the blinking cursor on the console, or we would
> not be able to detect whether a change in CRC is due to the application
> starting rendering, or to the cursor blinking. We tell the kernel to
> disable the cursor with the appropriate kernel command line parameter.
>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Adam Duskett <aduskett@gmail.com>
>
> ---
> Changes v1 -> v2:
>   - don't mistake blinking cursor for application start  (Adam)
>   - properly terminate application  (Adam)
> ---
>  support/testing/tests/package/test_flutter.py | 35 +++++++++++++++----
>  .../flutter-gallery.service                   |  1 -
>  2 files changed, 29 insertions(+), 7 deletions(-)
>  delete mode 120000
> support/testing/tests/package/test_flutter/overlay/etc/systemd/system/mul=
ti-user.target.wants/flutter-gallery.service
>
> diff --git a/support/testing/tests/package/test_flutter.py
> b/support/testing/tests/package/test_flutter.py
> index a3e98a43e5..515c95409f 100644
> --- a/support/testing/tests/package/test_flutter.py
> +++ b/support/testing/tests/package/test_flutter.py
> @@ -1,8 +1,11 @@
>  import os
> +import time
>  import infra.basetest
>
> +from ..graphics_base import GraphicsBase
>
> -class TestFlutter(infra.basetest.BRTest):
> +
> +class TestFlutter(infra.basetest.BRTest, GraphicsBase):
>      config =3D f"""
>          BR2_aarch64=3Dy
>          BR2_TOOLCHAIN_EXTERNAL=3Dy
> @@ -39,7 +42,7 @@ class TestFlutter(infra.basetest.BRTest):
>          self.emulator.boot(
>              arch=3D"aarch64",
>              kernel=3Dkern,
> -            kernel_cmdline=3D["root=3D/dev/vda console=3DttyAMA0"],
> +            kernel_cmdline=3D["root=3D/dev/vda console=3DttyAMA0
> vt.global_cursor_default=3D0"],
>              options=3D["-M", "virt",
>                       "-cpu", "cortex-a57",
>                       "-m", "512M",
> @@ -48,7 +51,27 @@ class TestFlutter(infra.basetest.BRTest):
>                       "-vnc", "none",
>                       "-drive", f"file=3D{img},if=3Dvirtio,format=3Draw"]=
)
>          self.emulator.login()
> -        cmd =3D "systemctl is-active flutter-gallery"
> -        output, exit_code =3D self.emulator.run(cmd, 10)
> -        self.assertEqual(exit_code, 0)
> -        self.assertEqual(output[0], "active")
> +
> +        # Get the CRC from the current ramebuffer
> +        empty_crc =3D self.get_n_fb_crc(count=3D1)[0]
> +
> +        # Start the gallery App. It can take a bit of time to start,
> +        # so lets try a few times. 600 samples should cover about 10s
> +        # @60Hz (although, the rendering could be much slower on slow
> +        # machines)
> +        self.assertRunOk("systemctl start flutter-gallery", timeout=3D10=
)
> +        for i in range(600):
> +            gallery_crc =3D self.get_n_fb_crc(count=3D1)[0]
> +            if gallery_crc !=3D empty_crc:
> +                break
> +            time.sleep(1)
> +        self.assertNotEqual(gallery_crc, empty_crc, "gallery app did not
> render anything on screen")
> +
> +        # Stop the application, and check it restored the framebuffer
> content
> +        self.assertRunOk("systemctl stop flutter-gallery", timeout=3D10)
> +        for i in range(600):
> +            gallery_crc =3D self.get_n_fb_crc(count=3D1)[0]
> +            if gallery_crc =3D=3D empty_crc:
> +                break
> +            time.sleep(1)
> +        self.assertEqual(gallery_crc, empty_crc, "gallery app did not
> stop rendering")
> diff --git
> a/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/m=
ulti-user.target.wants/flutter-gallery.service
> b/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/m=
ulti-user.target.wants/flutter-gallery.service
> deleted file mode 120000
> index 40993fb16c..0000000000
> ---
> a/support/testing/tests/package/test_flutter/overlay/etc/systemd/system/m=
ulti-user.target.wants/flutter-gallery.service
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../../../usr/lib/systemd/system/flutter-gallery.service
> \ No newline at end of file
> --
> 2.25.1
>
>

--000000000000b973a306070a4d11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Looks good to me!</div><div><br></div><div>Reviewed-b=
y: Adam Duskett &lt;<a href=3D"mailto:aduskett@gmail.com">aduskett@gmail.co=
m</a>&gt;</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Thu, Oct 5, 2023 at 6:17=E2=80=AFPM Yann E. MORIN &lt;<a href=
=3D"mailto:yann.morin.1998@free.fr">yann.morin.1998@free.fr</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Commit 7f0af11ce=
e31 (support/testing/tests/package/test_flutter.py: new<br>
runtime test) added a simple test that just checked that the systemd<br>
unit launching the application, was active.<br>
<br>
It is perfectly possible, from a systemd perspective, that the unit is<br>
active, while the application actually crashes.<br>
<br>
Instead, what we need to check, is that the application does actually<br>
render &quot;something&quot;; we don&#39;t really care what, as long as we =
know it is<br>
actually rendering, thus the graphical stack is working and the<br>
aplication stack is running.<br>
<br>
Extend the flutter runtime test to also check that the framebuffer is<br>
modified by the application when it is running, similarly to what we do<br>
in the weston test.<br>
<br>
We drop the activation of the unit and start it manually, as we want to<br>
check the state of the CRC before, while, and after the application<br>
runs.<br>
<br>
We also need to disable the blinking cursor on the console, or we would<br>
not be able to detect whether a change in CRC is due to the application<br>
starting rendering, or to the cursor blinking. We tell the kernel to<br>
disable the cursor with the appropriate kernel command line parameter.<br>
<br>
Signed-off-by: Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr"=
 target=3D"_blank">yann.morin.1998@free.fr</a>&gt;<br>
Cc: Adam Duskett &lt;<a href=3D"mailto:aduskett@gmail.com" target=3D"_blank=
">aduskett@gmail.com</a>&gt;<br>
<br>
---<br>
Changes v1 -&gt; v2:<br>
=C2=A0 - don&#39;t mistake blinking cursor for application start=C2=A0 (Ada=
m)<br>
=C2=A0 - properly terminate application=C2=A0 (Adam)<br>
---<br>
=C2=A0support/testing/tests/package/test_flutter.py | 35 +++++++++++++++---=
-<br>
=C2=A0.../flutter-gallery.service=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
=C2=A02 files changed, 29 insertions(+), 7 deletions(-)<br>
=C2=A0delete mode 120000 support/testing/tests/package/test_flutter/overlay=
/etc/systemd/system/multi-user.target.wants/flutter-gallery.service<br>
<br>
diff --git a/support/testing/tests/package/test_flutter.py b/support/testin=
g/tests/package/test_flutter.py<br>
index a3e98a43e5..515c95409f 100644<br>
--- a/support/testing/tests/package/test_flutter.py<br>
+++ b/support/testing/tests/package/test_flutter.py<br>
@@ -1,8 +1,11 @@<br>
=C2=A0import os<br>
+import time<br>
=C2=A0import infra.basetest<br>
<br>
+from ..graphics_base import GraphicsBase<br>
<br>
-class TestFlutter(infra.basetest.BRTest):<br>
+<br>
+class TestFlutter(infra.basetest.BRTest, GraphicsBase):<br>
=C2=A0 =C2=A0 =C2=A0config =3D f&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_aarch64=3Dy<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_TOOLCHAIN_EXTERNAL=3Dy<br>
@@ -39,7 +42,7 @@ class TestFlutter(infra.basetest.BRTest):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.emulator.boot(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arch=3D&quot;aarch64&quot;,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel=3Dkern,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_cmdline=3D[&quot;root=3D/=
dev/vda console=3DttyAMA0&quot;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_cmdline=3D[&quot;root=3D/=
dev/vda console=3DttyAMA0 vt.global_cursor_default=3D0&quot;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options=3D[&quot;-M&quot;, =
&quot;virt&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;-cpu&quot;, &quot;cortex-a57&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;-m&quot;, &quot;512M&quot;,<br>
@@ -48,7 +51,27 @@ class TestFlutter(infra.basetest.BRTest):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;-vnc&quot;, &quot;none&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;-drive&quot;, f&quot;file=3D{img},if=3Dvirtio,format=3Draw&quot;]=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.emulator.login()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;systemctl is-active flutter-gall=
ery&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 output, exit_code =3D self.emulator.run(cmd, 1=
0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(exit_code, 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(output[0], &quot;active&quot;=
)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Get the CRC from the current ramebuffer<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 empty_crc =3D self.get_n_fb_crc(count=3D1)[0]<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Start the gallery App. It can take a bit of =
time to start,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # so lets try a few times. 600 samples should =
cover about 10s<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # @60Hz (although, the rendering could be much=
 slower on slow<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # machines)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRunOk(&quot;systemctl start flutter=
-gallery&quot;, timeout=3D10)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in range(600):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gallery_crc =3D self.get_n_fb_cr=
c(count=3D1)[0]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if gallery_crc !=3D empty_crc:<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertNotEqual(gallery_crc, empty_crc, &q=
uot;gallery app did not render anything on screen&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Stop the application, and check it restored =
the framebuffer content<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRunOk(&quot;systemctl stop flutter-=
gallery&quot;, timeout=3D10)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in range(600):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gallery_crc =3D self.get_n_fb_cr=
c(count=3D1)[0]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if gallery_crc =3D=3D empty_crc:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(gallery_crc, empty_crc, &quot=
;gallery app did not stop rendering&quot;)<br>
diff --git a/support/testing/tests/package/test_flutter/overlay/etc/systemd=
/system/multi-user.target.wants/flutter-gallery.service b/support/testing/t=
ests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.want=
s/flutter-gallery.service<br>
deleted file mode 120000<br>
index 40993fb16c..0000000000<br>
--- a/support/testing/tests/package/test_flutter/overlay/etc/systemd/system=
/multi-user.target.wants/flutter-gallery.service<br>
+++ /dev/null<br>
@@ -1 +0,0 @@<br>
-../../../../usr/lib/systemd/system/flutter-gallery.service<br>
\ No newline at end of file<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000b973a306070a4d11--

--===============2966291925262370527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2966291925262370527==--
