Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3836DC4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 18:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8FE7400D3;
	Sun, 18 Dec 2022 18:07:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8FE7400D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rTstezE-hSaF; Sun, 18 Dec 2022 18:07:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52886402E5;
	Sun, 18 Dec 2022 18:07:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52886402E5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A80611BF2FF
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 18:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82A2781395
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 18:07:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82A2781395
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bGexskpmd6bA for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 18:07:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9179D80C36
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9179D80C36
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 18:06:59 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id m18so16905004eji.5
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 10:06:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gn/t4Ip7I5IbkZI/b1aHUgDpQme4FRl6Hf+XSAEevLw=;
 b=fDCnfakcPxIPYXv8JvpB1TM/MrJ1GDTR5YmkP/v3/QiIfhyi9/w2BdLiT3c9zIVARc
 FXRNVdSsesBl8CWqdVmPvnzqgOUe4kl7nLU/ahyabRyZrvXa22w3dXDeElLMPcTTl8Gw
 QgBtgSUQOFyIUdgyavk2r6N7sZ62sjZiaNwlYXTo/EmLfeHq7tzM7o18XcXiCHndZ5mL
 BH0NA3xOy51B1oqb/R57wD6fYEVS2u8I3K9Hb+3Zq6c86K/2h+h2HBpUAL9RY0Y/8bBv
 2k4vkf/uh8osD5Zz9f/XjmveKla7oct+le8tdyoXl/RivUxO0MPBml61ZQlMxtvnDFCe
 SKGw==
X-Gm-Message-State: AFqh2kqBaSBFpOyvl6nnLg+94czWL+eYnXfjP1lMPXJ9m/D3i4tEq8yC
 LZzphvWP23/CM0JhhG2TO08iWeRiwZl5TJf+KLk=
X-Google-Smtp-Source: AMrXdXuFPny+tvPVL4PO/giqah0k6ikikbfYsfQf5kftB5tMOqDCF1cjPuiPjTis4LOlpX9ReA6viCuqMXjKLKHj4+o=
X-Received: by 2002:a17:906:b804:b0:80d:ebfc:169f with SMTP id
 dv4-20020a170906b80400b0080debfc169fmr237028ejb.731.1671386817522; Sun, 18
 Dec 2022 10:06:57 -0800 (PST)
MIME-Version: 1.0
References: <20221218145518.21A4286933@busybox.osuosl.org>
In-Reply-To: <20221218145518.21A4286933@busybox.osuosl.org>
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Sun, 18 Dec 2022 20:06:46 +0200
Message-ID: <CA+fTLhjiOVoqs7uoKXRAVcbkWUJcfSUBMOpkwUtPBeuG1Fxx0A@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Gn/t4Ip7I5IbkZI/b1aHUgDpQme4FRl6Hf+XSAEevLw=;
 b=kV/TPVpWqrxhV5jkINnvH6tkrnBp1VgCO+WPK2+2toI79ZS54dIh/nYu+UAoDJCzeC
 tFChsq0zFb2F4bFKnDjKRojJmKLGFrGy5ahP0U9DUpBwibkDRcX+2RhKXheJ3P3t8sNS
 g3XtFElk9omxX1RCrzZA9vAULlts5/WgDof3QQ3dqu/7iVefaIYu2By3zUAPm8O58xjp
 BiRVaU4TXe2B+15cf7dhpWvThVKYDiglObYqL6H8KdpuaeiioNJF6RVYXVMvYbnCzMOF
 FyGInwZLm7Kdqj2gFv6iBsaelyDGAEa4s9Iv/zitOxjTYaMogLUzoFRQAGwxt63j8/yz
 0PMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kV/TPVpW
Subject: Re: [Buildroot] [git commit] configs/lichee_rv_dock: new defconfig
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
Content-Type: multipart/mixed; boundary="===============8366461861082919504=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8366461861082919504==
Content-Type: multipart/alternative; boundary="0000000000008a6e3705f01e11ad"

--0000000000008a6e3705f01e11ad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kontakt Peter Korsgaard (<peter@korsgaard.com>) kirjutas kuup=C3=A4eval P, =
18.
detsember 2022 kell 16:55:

> commit:
> https://git.buildroot.net/buildroot/commit/?id=3Df9ad317507cf8564200b88dd=
a2463406d0171122
> branch: https://git.buildroot.net/buildroot/commit/?id=3Drefs/heads/maste=
r
>
>
Very nice, but because of "linux: bump _KERNEL_LATEST_VERSION to 6.1" it's
broken.
For nezha and lichee_rv* the linux headers custom version has to be updated=
.


> Lichee RV Dock is a RISC-V Linux development kits with high integration,
> small size and affordable price designed for opensource developer.
>
> https://wiki.sipeed.com/hardware/en/lichee/RV/Dock.html
>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> Tested-by: Indrek Kruusa <indrek.kruusa@gmail.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  DEVELOPERS                                         |  1 +
>  board/sipeed/lichee_rv_dock/genimage.cfg           | 19 +++++++++
>  board/sipeed/lichee_rv_dock/linux.fragment         |  7 ++++
>  .../lichee_rv_dock/overlay/etc/network/interfaces  |  6 +++
>  .../lichee_rv_dock/overlay/etc/wpa_supplicant.conf |  8 ++++
>  board/sipeed/lichee_rv_dock/readme.txt             | 45
> ++++++++++++++++++++++
>  configs/sipeed_lichee_rv_dock_defconfig            | 41
> ++++++++++++++++++++
>  7 files changed, 127 insertions(+)
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 2f27ddb110..b0f10148b5 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -158,6 +158,7 @@ F:  package/rauc/
>
>  N:     Angelo Compagnucci <angelo.compagnucci@gmail.com>
>  F:     board/sipeed/lichee_rv/
> +F:     board/sipeed/lichee_rv_dock/
>  F:     configs/sipeed_lichee_rv*
>  F:     package/apparmor/
>  F:     package/corkscrew/
> diff --git a/board/sipeed/lichee_rv_dock/genimage.cfg
> b/board/sipeed/lichee_rv_dock/genimage.cfg
> new file mode 100644
> index 0000000000..38078f0ae3
> --- /dev/null
> +++ b/board/sipeed/lichee_rv_dock/genimage.cfg
> @@ -0,0 +1,19 @@
> +# Minimal SD card image for the sipeed Lichee RV dock
> +
> +image sdcard.img {
> +       hdimage {
> +       }
> +
> +       partition u-boot {
> +               in-partition-table =3D false
> +               image =3D "u-boot-sunxi-with-spl.bin"
> +               offset =3D 8K
> +       }
> +
> +       partition rootfs {
> +               partition-type =3D 0x83
> +               image =3D "rootfs.ext4"
> +               bootable =3D "true"
> +               offset =3D 1M
> +       }
> +}
> diff --git a/board/sipeed/lichee_rv_dock/linux.fragment
> b/board/sipeed/lichee_rv_dock/linux.fragment
> new file mode 100644
> index 0000000000..10016889ab
> --- /dev/null
> +++ b/board/sipeed/lichee_rv_dock/linux.fragment
> @@ -0,0 +1,7 @@
> +CONFIG_BT=3Dy
> +CONFIG_BT_HCIUART=3Dm
> +CONFIG_BT_HCIUART_SERDEV=3Dy
> +CONFIG_BT_HCIUART_3WIRE=3Dy
> +CONFIG_BT_HCIUART_RTL=3Dy
> +CONFIG_SERIAL_DEV_BUS=3Dy
> +CONFIG_SERIAL_DEV_CTRL_TTYPORT=3Dy
> diff --git a/board/sipeed/lichee_rv_dock/overlay/etc/network/interfaces
> b/board/sipeed/lichee_rv_dock/overlay/etc/network/interfaces
> new file mode 100644
> index 0000000000..89e7d74aff
> --- /dev/null
> +++ b/board/sipeed/lichee_rv_dock/overlay/etc/network/interfaces
> @@ -0,0 +1,6 @@
> +auto lo
> +iface lo inet loopback
> +
> +auto wlan0
> +iface wlan0 inet dhcp
> +wpa-conf /etc/wpa_supplicant.conf
> diff --git a/board/sipeed/lichee_rv_dock/overlay/etc/wpa_supplicant.conf
> b/board/sipeed/lichee_rv_dock/overlay/etc/wpa_supplicant.conf
> new file mode 100644
> index 0000000000..b43292b0a7
> --- /dev/null
> +++ b/board/sipeed/lichee_rv_dock/overlay/etc/wpa_supplicant.conf
> @@ -0,0 +1,8 @@
> +ap_scan=3D1
> +
> +network=3D{
> +        ssid=3D"YOURSSID"
> +        scan_ssid=3D1
> +        key_mgmt=3DWPA-PSK
> +        psk=3D"YOURPASSWD"
> +}
> diff --git a/board/sipeed/lichee_rv_dock/readme.txt
> b/board/sipeed/lichee_rv_dock/readme.txt
> new file mode 100644
> index 0000000000..048ba64d26
> --- /dev/null
> +++ b/board/sipeed/lichee_rv_dock/readme.txt
> @@ -0,0 +1,45 @@
> +Lichee RV dock
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Lichee RV Dock is a RISC-V Linux development kits with high integration,
> small
> +size and affordable price designed for opensource developer. It's
> equipped with
> +HDMI interface and it supports many screen by its screen convert board.
> It's
> +also equipped with many peripherals, including a UAB-A port, 2.4G Wifi-B=
T
> module,
> +an analog microphone and a speaker jack interface.
> +
> +How to build
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +$ make sipeed_lichee_rv_dock_defconfig
> +$ make
> +
> +Wifi
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Edit board/sipeed/lichee_rv_dock/overlay/etc/wpa_supplicant.conf or
> +/etc/wpa_supplicant.conf once connected to the board:
> +
> +* Replace YOURSSID with your AP ssid
> +* Replace YOURPASSWD with your AP password
> +
> +Bluetooth
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +To make the device discoverable and pairable, once connected to the boar=
d:
> +
> +* bluetoothctl power on
> +* bluetoothctl discoverable yes
> +* bluetoothctl pairable yes
> +
> +How to write the SD card
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Once the build process is finished you will have an image called
> "sdcard.img"
> +in the output/images/ directory.
> +
> +Copy the bootable "sdcard.img" onto an SD card with "dd":
> +
> +  $ sudo dd if=3Doutput/images/sdcard.img of=3D/dev/sdX
> +
> +Connect a TTL UART to the debug connector, insert the microSD card and
> +plug in a USB-C cable to the PWR connector to boot the system.
> diff --git a/configs/sipeed_lichee_rv_dock_defconfig
> b/configs/sipeed_lichee_rv_dock_defconfig
> new file mode 100644
> index 0000000000..7c8c6788fa
> --- /dev/null
> +++ b/configs/sipeed_lichee_rv_dock_defconfig
> @@ -0,0 +1,41 @@
> +BR2_riscv=3Dy
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=3Dy
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=3Dy
> +BR2_ROOTFS_OVERLAY=3D"board/sipeed/lichee_rv/overlay
> board/sipeed/lichee_rv_dock/overlay"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS=3D"-c board/sipeed/lichee_rv_dock/genimage.c=
fg"
> +BR2_LINUX_KERNEL=3Dy
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=3Dy
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call
> github,smaeul,linux,ca67838d84af4c9f85d06311c9e98e1adf46308f)/linux-ca678=
38d84af4c9f85d06311c9e98e1adf46308f.tar.gz"
> +BR2_LINUX_KERNEL_DEFCONFIG=3D"nezha"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"allwinner/sun20i-d1-lichee-rv-dock"
>
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D"board/sipeed/lichee_rv_dock/li=
nux.fragment"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=3Dy
> +BR2_PACKAGE_RTL8723DS=3Dy
> +BR2_PACKAGE_RTL8723DS_BT=3Dy
> +BR2_PACKAGE_BLUEZ5_UTILS=3Dy
> +BR2_PACKAGE_BLUEZ5_UTILS_CLIENT=3Dy
> +BR2_PACKAGE_WPA_SUPPLICANT=3Dy
> +BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN=3Dy
> +BR2_TARGET_ROOTFS_EXT2=3Dy
> +BR2_TARGET_ROOTFS_EXT2_4=3Dy
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_OPENSBI=3Dy
> +BR2_TARGET_OPENSBI_CUSTOM_VERSION=3Dy
> +BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE=3D"1.1"
> +BR2_TARGET_OPENSBI_PLAT=3D"generic"
> +# BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
> +BR2_TARGET_UBOOT=3Dy
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL=3Dy
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION=3D"$(call
> github,smaeul,u-boot,528ae9bc6c55edd3ffe642734b4132a8246ea777)/uboot-528a=
e9bc6c55edd3ffe642734b4132a8246ea777.tar.gz"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D"lichee_rv_dock"
> +BR2_TARGET_UBOOT_NEEDS_DTC=3Dy
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=3Dy
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy
> +BR2_TARGET_UBOOT_NEEDS_OPENSBI=3Dy
> +# BR2_TARGET_UBOOT_FORMAT_BIN is not set
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=3Dy
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME=3D"u-boot-sunxi-with-spl.bin"
> +BR2_PACKAGE_HOST_GENIMAGE=3Dy
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000008a6e3705f01e11ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Kontakt Peter Korsgaard (&lt;<a href=3D"m=
ailto:peter@korsgaard.com" target=3D"_blank">peter@korsgaard.com</a>&gt;) k=
irjutas kuup=C3=A4eval P, 18. detsember 2022 kell 16:55:<br></div><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">commit:=
 <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3Df9ad317507cf85=
64200b88dda2463406d0171122" rel=3D"noreferrer" target=3D"_blank">https://gi=
t.buildroot.net/buildroot/commit/?id=3Df9ad317507cf8564200b88dda2463406d017=
1122</a><br>
branch: <a href=3D"https://git.buildroot.net/buildroot/commit/?id=3Drefs/he=
ads/master" rel=3D"noreferrer" target=3D"_blank">https://git.buildroot.net/=
buildroot/commit/?id=3Drefs/heads/master</a><br>
<br></blockquote><div><br></div><div>Very nice, but because of &quot;linux:=
 bump _KERNEL_LATEST_VERSION to 6.1&quot; it&#39;s broken.</div><div>For ne=
zha and lichee_rv* the linux headers custom version has to be updated.<br><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Lichee RV Dock is a RISC-V Linux development kits with high integration,<br=
>
small size and affordable price designed for opensource developer.<br>
<br>
<a href=3D"https://wiki.sipeed.com/hardware/en/lichee/RV/Dock.html" rel=3D"=
noreferrer" target=3D"_blank">https://wiki.sipeed.com/hardware/en/lichee/RV=
/Dock.html</a><br>
<br>
Signed-off-by: Angelo Compagnucci &lt;<a href=3D"mailto:angelo@amarulasolut=
ions.com" target=3D"_blank">angelo@amarulasolutions.com</a>&gt;<br>
Tested-by: Indrek Kruusa &lt;<a href=3D"mailto:indrek.kruusa@gmail.com" tar=
get=3D"_blank">indrek.kruusa@gmail.com</a>&gt;<br>
Signed-off-by: Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com" t=
arget=3D"_blank">peter@korsgaard.com</a>&gt;<br>
---<br>
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0board/sipeed/lichee_rv_dock/genimage.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 19 +++++++++<br>
=C2=A0board/sipeed/lichee_rv_dock/linux.fragment=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 7 ++++<br>
=C2=A0.../lichee_rv_dock/overlay/etc/network/interfaces=C2=A0 |=C2=A0 6 +++=
<br>
=C2=A0.../lichee_rv_dock/overlay/etc/wpa_supplicant.conf |=C2=A0 8 ++++<br>
=C2=A0board/sipeed/lichee_rv_dock/readme.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 45 ++++++++++++++++++++++<br>
=C2=A0configs/sipeed_lichee_rv_dock_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 41 ++++++++++++++++++++<br>
=C2=A07 files changed, 127 insertions(+)<br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index 2f27ddb110..b0f10148b5 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -158,6 +158,7 @@ F:=C2=A0 package/rauc/<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Angelo Compagnucci &lt;<a href=3D"mailto:angelo=
.compagnucci@gmail.com" target=3D"_blank">angelo.compagnucci@gmail.com</a>&=
gt;<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0board/sipeed/lichee_rv/<br>
+F:=C2=A0 =C2=A0 =C2=A0board/sipeed/lichee_rv_dock/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0configs/sipeed_lichee_rv*<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/apparmor/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/corkscrew/<br>
diff --git a/board/sipeed/lichee_rv_dock/genimage.cfg b/board/sipeed/lichee=
_rv_dock/genimage.cfg<br>
new file mode 100644<br>
index 0000000000..38078f0ae3<br>
--- /dev/null<br>
+++ b/board/sipeed/lichee_rv_dock/genimage.cfg<br>
@@ -0,0 +1,19 @@<br>
+# Minimal SD card image for the sipeed Lichee RV dock<br>
+<br>
+image sdcard.img {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hdimage {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0partition u-boot {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in-partition-table =
=3D false<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;u-b=
oot-sunxi-with-spl.bin&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D 8K<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0partition rootfs {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-type =3D =
0x83<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;roo=
tfs.ext4&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootable =3D &quot;=
true&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D 1M<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
diff --git a/board/sipeed/lichee_rv_dock/linux.fragment b/board/sipeed/lich=
ee_rv_dock/linux.fragment<br>
new file mode 100644<br>
index 0000000000..10016889ab<br>
--- /dev/null<br>
+++ b/board/sipeed/lichee_rv_dock/linux.fragment<br>
@@ -0,0 +1,7 @@<br>
+CONFIG_BT=3Dy<br>
+CONFIG_BT_HCIUART=3Dm<br>
+CONFIG_BT_HCIUART_SERDEV=3Dy<br>
+CONFIG_BT_HCIUART_3WIRE=3Dy<br>
+CONFIG_BT_HCIUART_RTL=3Dy<br>
+CONFIG_SERIAL_DEV_BUS=3Dy<br>
+CONFIG_SERIAL_DEV_CTRL_TTYPORT=3Dy<br>
diff --git a/board/sipeed/lichee_rv_dock/overlay/etc/network/interfaces b/b=
oard/sipeed/lichee_rv_dock/overlay/etc/network/interfaces<br>
new file mode 100644<br>
index 0000000000..89e7d74aff<br>
--- /dev/null<br>
+++ b/board/sipeed/lichee_rv_dock/overlay/etc/network/interfaces<br>
@@ -0,0 +1,6 @@<br>
+auto lo<br>
+iface lo inet loopback<br>
+<br>
+auto wlan0<br>
+iface wlan0 inet dhcp<br>
+wpa-conf /etc/wpa_supplicant.conf<br>
diff --git a/board/sipeed/lichee_rv_dock/overlay/etc/wpa_supplicant.conf b/=
board/sipeed/lichee_rv_dock/overlay/etc/wpa_supplicant.conf<br>
new file mode 100644<br>
index 0000000000..b43292b0a7<br>
--- /dev/null<br>
+++ b/board/sipeed/lichee_rv_dock/overlay/etc/wpa_supplicant.conf<br>
@@ -0,0 +1,8 @@<br>
+ap_scan=3D1<br>
+<br>
+network=3D{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ssid=3D&quot;YOURSSID&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 scan_ssid=3D1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 key_mgmt=3DWPA-PSK<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 psk=3D&quot;YOURPASSWD&quot;<br>
+}<br>
diff --git a/board/sipeed/lichee_rv_dock/readme.txt b/board/sipeed/lichee_r=
v_dock/readme.txt<br>
new file mode 100644<br>
index 0000000000..048ba64d26<br>
--- /dev/null<br>
+++ b/board/sipeed/lichee_rv_dock/readme.txt<br>
@@ -0,0 +1,45 @@<br>
+Lichee RV dock<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+<br>
+Lichee RV Dock is a RISC-V Linux development kits with high integration, s=
mall<br>
+size and affordable price designed for opensource developer. It&#39;s equi=
pped with<br>
+HDMI interface and it supports many screen by its screen convert board. It=
&#39;s<br>
+also equipped with many peripherals, including a UAB-A port, 2.4G Wifi-BT =
module,<br>
+an analog microphone and a speaker jack interface.<br>
+<br>
+How to build<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+<br>
+$ make sipeed_lichee_rv_dock_defconfig<br>
+$ make<br>
+<br>
+Wifi<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+<br>
+Edit board/sipeed/lichee_rv_dock/overlay/etc/wpa_supplicant.conf or<br>
+/etc/wpa_supplicant.conf once connected to the board:<br>
+<br>
+* Replace YOURSSID with your AP ssid<br>
+* Replace YOURPASSWD with your AP password<br>
+<br>
+Bluetooth<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+<br>
+To make the device discoverable and pairable, once connected to the board:=
<br>
+<br>
+* bluetoothctl power on<br>
+* bluetoothctl discoverable yes<br>
+* bluetoothctl pairable yes<br>
+<br>
+How to write the SD card<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<b=
r>
+<br>
+Once the build process is finished you will have an image called &quot;sdc=
ard.img&quot;<br>
+in the output/images/ directory.<br>
+<br>
+Copy the bootable &quot;sdcard.img&quot; onto an SD card with &quot;dd&quo=
t;:<br>
+<br>
+=C2=A0 $ sudo dd if=3Doutput/images/sdcard.img of=3D/dev/sdX<br>
+<br>
+Connect a TTL UART to the debug connector, insert the microSD card and<br>
+plug in a USB-C cable to the PWR connector to boot the system.<br>
diff --git a/configs/sipeed_lichee_rv_dock_defconfig b/configs/sipeed_liche=
e_rv_dock_defconfig<br>
new file mode 100644<br>
index 0000000000..7c8c6788fa<br>
--- /dev/null<br>
+++ b/configs/sipeed_lichee_rv_dock_defconfig<br>
@@ -0,0 +1,41 @@<br>
+BR2_riscv=3Dy<br>
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=3Dy<br>
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=3Dy<br>
+BR2_ROOTFS_OVERLAY=3D&quot;board/sipeed/lichee_rv/overlay board/sipeed/lic=
hee_rv_dock/overlay&quot;<br>
+BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;support/scripts/genimage.sh&quot;<br>
+BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;-c board/sipeed/lichee_rv_dock/genimag=
e.cfg&quot;<br>
+BR2_LINUX_KERNEL=3Dy<br>
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=3Dy<br>
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D&quot;$(call github,smaeul,linu=
x,ca67838d84af4c9f85d06311c9e98e1adf46308f)/linux-ca67838d84af4c9f85d06311c=
9e98e1adf46308f.tar.gz&quot;<br>
+BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;nezha&quot;<br>
+BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy<br>
+BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D&quot;allwinner/sun20i-d1-lichee-rv-doc=
k&quot;<br>
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D&quot;board/sipeed/lichee_rv_dock=
/linux.fragment&quot;<br>
+BR2_LINUX_KERNEL_INSTALL_TARGET=3Dy<br>
+BR2_PACKAGE_RTL8723DS=3Dy<br>
+BR2_PACKAGE_RTL8723DS_BT=3Dy<br>
+BR2_PACKAGE_BLUEZ5_UTILS=3Dy<br>
+BR2_PACKAGE_BLUEZ5_UTILS_CLIENT=3Dy<br>
+BR2_PACKAGE_WPA_SUPPLICANT=3Dy<br>
+BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN=3Dy<br>
+BR2_TARGET_ROOTFS_EXT2=3Dy<br>
+BR2_TARGET_ROOTFS_EXT2_4=3Dy<br>
+# BR2_TARGET_ROOTFS_TAR is not set<br>
+BR2_TARGET_OPENSBI=3Dy<br>
+BR2_TARGET_OPENSBI_CUSTOM_VERSION=3Dy<br>
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE=3D&quot;1.1&quot;<br>
+BR2_TARGET_OPENSBI_PLAT=3D&quot;generic&quot;<br>
+# BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set<br>
+BR2_TARGET_UBOOT=3Dy<br>
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy<br>
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=3Dy<br>
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION=3D&quot;$(call github,smaeul,u-bo=
ot,528ae9bc6c55edd3ffe642734b4132a8246ea777)/uboot-528ae9bc6c55edd3ffe64273=
4b4132a8246ea777.tar.gz&quot;<br>
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D&quot;lichee_rv_dock&quot;<br>
+BR2_TARGET_UBOOT_NEEDS_DTC=3Dy<br>
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=3Dy<br>
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy<br>
+BR2_TARGET_UBOOT_NEEDS_OPENSBI=3Dy<br>
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set<br>
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=3Dy<br>
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME=3D&quot;u-boot-sunxi-with-spl.bin&quot=
;<br>
+BR2_PACKAGE_HOST_GENIMAGE=3Dy<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--0000000000008a6e3705f01e11ad--

--===============8366461861082919504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8366461861082919504==--
