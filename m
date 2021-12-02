Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71297C433F5
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 00:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0467D60711;
	Thu,  2 Dec 2021 00:39:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oM-JKEzeubcn; Thu,  2 Dec 2021 00:39:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 319B960799;
	Thu,  2 Dec 2021 00:39:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27A2E1BF5E0
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 00:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 172414040C
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 00:39:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QZN5ZVc7CtJU for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 00:39:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5618403ED
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 00:39:37 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id p3so16200666qvj.9
 for <buildroot@buildroot.org>; Wed, 01 Dec 2021 16:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/h4bMZY+uuqdvhv45tBzlzfts8gIUiVpVPH78y2qG5Q=;
 b=orsg+7QicdnmpwI4APC73R9Spj+8HUN/Kr5GHCMQ3AUUE1lwW2ljUYEi4wCaPHwrsq
 IajUV7lToowVv+lDUhIDHhdWM7b1zhQMiT8PMueFjZ5cbdg/IAxjo6Owno5qfheEJ3K/
 w4VoDMasru2MAsNLdmQnWYQpv/EFf5fgyPwI+Lh/FXA1p0gDRLRS1RheLI+CYBityKXq
 UrXtqqtkkLbr3umVxiFXjCseGN+56YylvjRaVSyqwrxJzQ9XU3kNYxo9fI1eShmWzmqe
 zccWHOMzgpJynSmsM2U0d4O4Ck7AZNNhi/9ydH6YdWbF6wl1A7XvgMKbauPXO+IWuKhP
 aeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/h4bMZY+uuqdvhv45tBzlzfts8gIUiVpVPH78y2qG5Q=;
 b=Y4CpAS0xGJdYExSGtX1vYoDHkZzL62183JPJ7jK/+PRGlGz9GjzQaApBIJXk14lKse
 W5QnxVEBxv96mJmKxnafnMIXlQR2zgxdAmwJCd3k/9RvmB1PjUPnclcKRO+DR1I6Q9yy
 24wpwKj+z8mF4AsZ0z1+btDGZSuWAH7VmwBH+kPEtKFPP1CKwAUd46N8bBUF5fNgSiXC
 rsnM5GsWGRG++u08cuWFQRER3KgmsmcXzk1d+sN/q24FOPaRIa2KaM/oeX7o7I+I94z3
 SC++QoE/XHZzDrZ6Ms8GgGlRDot2iAkmeW2p3V5ASOsqvrzAXWkLOmgz2jmbKaYO12/W
 uAuw==
X-Gm-Message-State: AOAM532QdoLLP1fpesNhNS8O/nxCggo8MXoxDMvO/DcA3hJsFsxiy5S7
 o5KAFBGqOelPxgTNAaFqLa2uJ3DpDODMDNsMjkM=
X-Google-Smtp-Source: ABdhPJwf3X3R0AP/Ifb6yM04Af1MOeds1GzIQlTJb0Y4ynGRN2TqhT0/VS1ATTgonZqEt0r5v0sPA4Q9oXa/gXWDRNc=
X-Received: by 2002:a05:6214:1453:: with SMTP id
 b19mr10228612qvy.20.1638405576699; 
 Wed, 01 Dec 2021 16:39:36 -0800 (PST)
MIME-Version: 1.0
References: <20211115144620.80555-1-kory.maincent@bootlin.com>
In-Reply-To: <20211115144620.80555-1-kory.maincent@bootlin.com>
From: bryce.schober@gmail.com
Date: Wed, 1 Dec 2021 16:39:00 -0800
Message-ID: <CAJpxd05UuRmbPZH8pP0DdfVL0RC8Z3p9KNzLV+9ZugcBz1uLew@mail.gmail.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Subject: Re: [Buildroot] [PATCH] package/rpi-firmware: update vcdbg runtime
 dependencies
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
Cc: martin@barkynet.com, mahyar.koshkouei@gmail.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4506228030566455539=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4506228030566455539==
Content-Type: multipart/alternative; boundary="00000000000065b23d05d21f06e6"

--00000000000065b23d05d21f06e6
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 15, 2021 at 6:46 AM Kory Maincent <kory.maincent@bootlin.com>
wrote:
>
> We used to select the rpi-userland to make the vcdbg tool work but it
> conflict with the use of mesa. It implies we can not install vcdbg with
> mesa libraries but it is false. We could use the prebuilt libraries from
> the rpi-firmware sources to run vcdbg.
>
> This patch removes the select dependency of rpi-userland package and
> installs the prebuilt libraries needed by vcdbg only if rpi-userland
> is not selected.
>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Reviewed-by: Bryce Schober <bryce.schober@gmail.com>
Tested-by: Bryce Schober <bryce.schober@gmail.com>

> ---
>  package/rpi-firmware/Config.in       |  1 -
>  package/rpi-firmware/rpi-firmware.mk | 11 +++++++++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/package/rpi-firmware/Config.in
b/package/rpi-firmware/Config.in
> index f5a25c5680..d8bcc8ba96 100644
> --- a/package/rpi-firmware/Config.in
> +++ b/package/rpi-firmware/Config.in
> @@ -98,7 +98,6 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
>         depends on BR2_arm # prebuilt arm binary, rpi-userland
>         depends on BR2_TOOLCHAIN_USES_GLIBC
>         depends on BR2_INSTALL_LIBSTDCPP # rpi-userland
> -       select BR2_PACKAGE_RPI_USERLAND
>         help
>           Install vcdbg, to help debug communication with the GPU.
>
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/
rpi-firmware.mk
> index d74f7155c7..743a259dc3 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -32,12 +32,23 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
>  endef
>  endif
>
> +# Install prebuilt libraries if RPI_USERLAND not enabled
> +ifneq ($(BR2_PACKAGE_RPI_USERLAND),y)
> +define RPI_FIRMWARE_INSTALL_TARGET_LIB
> +       $(INSTALL) -D -m 0644 $(@D)/$(if
BR2_ARM_EABIHF,hardfp/)opt/vc/lib/libvcos.so \
> +               $(TARGET_DIR)/usr/lib/libvcos.so
> +       $(INSTALL) -D -m 0644 $(@D)/$(if
BR2_ARM_EABIHF,hardfp/)opt/vc/lib/libdebug_sym.so \
> +               $(TARGET_DIR)/usr/lib/libdebug_sym.so
> +endef
> +endif
> +
>  ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG),y)
>  define RPI_FIRMWARE_INSTALL_TARGET_CMDS
>         $(INSTALL) -D -m 0700 $(@D)/$(if
BR2_ARM_EABIHF,hardfp/)opt/vc/bin/vcdbg \
>                 $(TARGET_DIR)/usr/sbin/vcdbg
>         $(INSTALL) -D -m 0644 $(@D)/$(if
BR2_ARM_EABIHF,hardfp/)opt/vc/lib/libelftoolchain.so \
>                 $(TARGET_DIR)/usr/lib/libelftoolchain.so
> +       $(RPI_FIRMWARE_INSTALL_TARGET_LIB)
>  endef
>  endif # INSTALL_VCDBG
>
> --
> 2.25.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--00000000000065b23d05d21f06e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Mon, Nov 15, 2021 at 6:46 AM Kory Maincent &lt;<a href=
=3D"mailto:kory.maincent@bootlin.com">kory.maincent@bootlin.com</a>&gt; wro=
te:<br>&gt;<br>&gt; We used to select the rpi-userland to make the vcdbg to=
ol work but it<br>&gt; conflict with the use of mesa. It implies we can not=
 install vcdbg with<br>&gt; mesa libraries but it is false. We could use th=
e prebuilt libraries from<br>&gt; the rpi-firmware sources to run vcdbg.<br=
>&gt;<br>&gt; This patch removes the select dependency of rpi-userland pack=
age and<br>&gt; installs the prebuilt libraries needed by vcdbg only if rpi=
-userland<br>&gt; is not selected.<br>&gt;<br>&gt; Signed-off-by: Kory Main=
cent &lt;<a href=3D"mailto:kory.maincent@bootlin.com">kory.maincent@bootlin=
.com</a>&gt;<div><br></div><div>Reviewed-by: Bryce Schober &lt;<a href=3D"m=
ailto:bryce.schober@gmail.com">bryce.schober@gmail.com</a>&gt;</div><div><d=
iv>Tested-by: Bryce Schober &lt;<a href=3D"mailto:bryce.schober@gmail.com">=
bryce.schober@gmail.com</a>&gt;</div><br class=3D"gmail-Apple-interchange-n=
ewline">&gt; ---<br>&gt; =C2=A0package/rpi-firmware/Config.in =C2=A0 =C2=A0=
 =C2=A0 | =C2=A01 -<br>&gt; =C2=A0package/rpi-firmware/<a href=3D"http://rp=
i-firmware.mk">rpi-firmware.mk</a> | 11 +++++++++++<br>&gt; =C2=A02 files c=
hanged, 11 insertions(+), 1 deletion(-)<br>&gt;<br>&gt; diff --git a/packag=
e/rpi-firmware/Config.in b/package/rpi-firmware/Config.in<br>&gt; index f5a=
25c5680..d8bcc8ba96 100644<br>&gt; --- a/package/rpi-firmware/Config.in<br>=
&gt; +++ b/package/rpi-firmware/Config.in<br>&gt; @@ -98,7 +98,6 @@ config =
BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
depends on BR2_arm # prebuilt arm binary, rpi-userland<br>&gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_USES_GLIBC<br>&gt; =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 depends on BR2_INSTALL_LIBSTDCPP # rpi-userland<br>&gt; - =
=C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_RPI_USERLAND<br>&gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 help<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Install vcdbg=
, to help debug communication with the GPU.<br>&gt;<br>&gt; diff --git a/pa=
ckage/rpi-firmware/<a href=3D"http://rpi-firmware.mk">rpi-firmware.mk</a> b=
/package/rpi-firmware/<a href=3D"http://rpi-firmware.mk">rpi-firmware.mk</a=
><br>&gt; index d74f7155c7..743a259dc3 100644<br>&gt; --- a/package/rpi-fir=
mware/<a href=3D"http://rpi-firmware.mk">rpi-firmware.mk</a><br>&gt; +++ b/=
package/rpi-firmware/<a href=3D"http://rpi-firmware.mk">rpi-firmware.mk</a>=
<br>&gt; @@ -32,12 +32,23 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS<br>&g=
t; =C2=A0endef<br>&gt; =C2=A0endif<br>&gt;<br>&gt; +# Install prebuilt libr=
aries if RPI_USERLAND not enabled<br>&gt; +ifneq ($(BR2_PACKAGE_RPI_USERLAN=
D),y)<br>&gt; +define RPI_FIRMWARE_INSTALL_TARGET_LIB<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 $(INSTALL) -D -m 0644 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/l=
ib/libvcos.so \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
$(TARGET_DIR)/usr/lib/libvcos.so<br>&gt; + =C2=A0 =C2=A0 =C2=A0 $(INSTALL) =
-D -m 0644 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/lib/libdebug_sym.so \<b=
r>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TARGET_DIR)/usr=
/lib/libdebug_sym.so<br>&gt; +endef<br>&gt; +endif<br>&gt; +<br>&gt; =C2=A0=
ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG),y)<br>&gt; =C2=A0define RPI=
_FIRMWARE_INSTALL_TARGET_CMDS<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL=
) -D -m 0700 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/bin/vcdbg \<br>&gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TARGET_DIR)/usr/s=
bin/vcdbg<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL) -D -m 0644 $(@D)/$=
(if BR2_ARM_EABIHF,hardfp/)opt/vc/lib/libelftoolchain.so \<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TARGET_DIR)/usr/lib/libe=
lftoolchain.so<br>&gt; + =C2=A0 =C2=A0 =C2=A0 $(RPI_FIRMWARE_INSTALL_TARGET=
_LIB)<br>&gt; =C2=A0endef<br>&gt; =C2=A0endif # INSTALL_VCDBG<br>&gt;<br>&g=
t; --<br>&gt; 2.25.1<br>&gt;<br>&gt; ______________________________________=
_________<br>&gt; buildroot mailing list<br>&gt; <a href=3D"mailto:buildroo=
t@buildroot.org">buildroot@buildroot.org</a><br>&gt; <a href=3D"https://lis=
ts.buildroot.org/mailman/listinfo/buildroot">https://lists.buildroot.org/ma=
ilman/listinfo/buildroot</a></div></div>

--00000000000065b23d05d21f06e6--

--===============4506228030566455539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4506228030566455539==--
