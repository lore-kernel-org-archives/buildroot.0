Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF40C4332F
	for <buildroot@archiver.kernel.org>; Thu, 15 Dec 2022 21:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5235E4000B;
	Thu, 15 Dec 2022 21:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5235E4000B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z9qf1JISqRN9; Thu, 15 Dec 2022 21:53:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4439740239;
	Thu, 15 Dec 2022 21:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4439740239
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB5D91BF2C8
 for <buildroot@lists.busybox.net>; Thu, 15 Dec 2022 21:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 833F040239
 for <buildroot@lists.busybox.net>; Thu, 15 Dec 2022 21:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 833F040239
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cB74cubpZyJJ for <buildroot@lists.busybox.net>;
 Thu, 15 Dec 2022 21:52:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 073234000B
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 073234000B
 for <buildroot@buildroot.org>; Thu, 15 Dec 2022 21:52:54 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id vv4so1880365ejc.2
 for <buildroot@buildroot.org>; Thu, 15 Dec 2022 13:52:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=64NzCsM3vkb+jov9z5qQr7+YQnrBL6gncPNCXSo/Txo=;
 b=pfws/ezklcNIFxC4UQcassbqduMShI9GjQ1ETsMM80x20WeT5bJ/TaYdCbyWdBLB7U
 rFq+z0Maxp+KHjyB9kPCsYVFKY3a0GFXgH6MRTy64gAr/DEu1NqYvG+ZMsJpVGaNzk3N
 8bIwdM/C67FcnTcKay27qcpcuSNdKjsnVqGeh3TIDMtBlyBWwGU0LUgC2h6UUKqJFXZe
 enhDU7GFCk3u1h8GQWG9y5v41ys3sh8mNCr0FreJPO9S0nmHqtC8Lzv5a+QGPXmS98OI
 GabxKnb4f7uBmueQ+ZY9g3nlMoyiUXxJnvXYJQLXGA24AIsH1rbet91Pz0vrh+ZeN8PL
 rdtg==
X-Gm-Message-State: ANoB5pm/PMD9etZdke3JQKW5PXi7qrsOcEEYXka/6hYDlMAvex4l9OB4
 QJQ6CeVYNvdPGjOJfHTuVhmoCzyiIKQjhhYaeBc=
X-Google-Smtp-Source: AA0mqf7qe4zNPMCR73oH8px2yhBtcag+465Nd6EeuWvYnHf+jCJnf9Jlvyv3gXjnJV3EaaT4htav+EO6m7h8gXf2kcU=
X-Received: by 2002:a17:906:a259:b0:7ad:ccae:a30d with SMTP id
 bi25-20020a170906a25900b007adccaea30dmr70756610ejb.704.1671141173067; Thu, 15
 Dec 2022 13:52:53 -0800 (PST)
MIME-Version: 1.0
References: <20221214221506.43849-1-angelo@amarulasolutions.com>
In-Reply-To: <20221214221506.43849-1-angelo@amarulasolutions.com>
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Thu, 15 Dec 2022 23:52:42 +0200
Message-ID: <CA+fTLhga2y88TY3mppQ53q_2paXqaMXZ1JqiZeBoR1xcigDGBg@mail.gmail.com>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=64NzCsM3vkb+jov9z5qQr7+YQnrBL6gncPNCXSo/Txo=;
 b=fi0ldSimMCkN9T4ca26fCsKsXVO6IEK+TU4afuoZDztMwX3qTFU9EwPpU2RCK/oSar
 7HqX3IRHPSnxQhj93Dj5zN0pZJfbJJ6DyZqz7Ec2fFf4jdiBx8vG70MkQBAbhbSKWkt3
 eFAY1b9RqgHbAlNG/yuJtgmiYD14+f4Er35O/AybiepdHz8msly4MRWr6seyrcbaVE30
 4vsQjEZ476tX2gUimD/DO6lqiJp0zrlSMk43L8cpY7iwI+af88vwXN90zZypAhN/zzMK
 tjk5y57MQ6l8+eSTtA/N6141sx+6Bl1trqTrR8K9L1J61CiEgMXAayRzs2qnzASVtdSB
 8Bew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fi0ldSim
Subject: Re: [Buildroot] [PATCH v5 1/3] package/rtl8723ds-bt: new package
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
Content-Type: multipart/mixed; boundary="===============2815717181125307469=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2815717181125307469==
Content-Type: multipart/alternative; boundary="000000000000fd859405efe4dfa9"

--000000000000fd859405efe4dfa9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kontakt Angelo Compagnucci (<angelo@amarulasolutions.com>) kirjutas
kuup=C3=A4eval N, 15. detsember 2022 kell 00:15:

> This package install the required firmware for enabling the
> Bluetooth device embedded in the RTL8723DS chip.
> The driver is included in Linux main tree and can be enabled
> with the BT_HCIUART_RTL symbol.
>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
>

I did the clean build + boot testing with Lichee RV dock
(sipeed_lichee_rv_dock_defconfig) which is using this package. From the log=
:

Starting mdev... OK
[    7.044734] Bluetooth: HCI UART driver ver 2.3
[    7.050998] Bluetooth: HCI UART protocol Three-wire (H5) registered
[    7.805105] Bluetooth: hci0: RTL: examining hci_ver=3D08 hci_rev=3D000d
lmp_ver=3D08 lmp_subver=3D8723
[    7.817938] Bluetooth: hci0: RTL: rom_version status=3D0 version=3D2
[    7.824105] Bluetooth: hci0: RTL: loading rtl_bt/rtl8723ds_fw.bin
[    8.073287] 8723ds: loading out-of-tree module taints kernel.
[    8.085577] Bluetooth: hci0: RTL: loading rtl_bt/rtl8723ds_config.bin
[    8.117338] Bluetooth: hci0: RTL: cfg_sz 47, total sz 30775
[    8.637554] Bluetooth: hci0: RTL: fw version 0xaa6c133b
Initializing random number generator: OK
Saving random seed: OK
Starting system message bus: done

If that counts as a test from patch perspective then:

Tested-by: Indrek Kruusa <indrek.kruusa@gmail.com>


> ---
> v3:
> * Simplified package (Thomas, Yann)
> * Package now only installs firmware (Thomas, Yann)
>
>  package/Config.in                      |  1 +
>  package/rtl8723ds-bt/Config.in         |  6 ++++++
>  package/rtl8723ds-bt/rtl8723ds-bt.hash |  2 ++
>  package/rtl8723ds-bt/rtl8723ds-bt.mk   | 17 +++++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/rtl8723ds-bt/Config.in
>  create mode 100644 package/rtl8723ds-bt/rtl8723ds-bt.hash
>  create mode 100644 package/rtl8723ds-bt/rtl8723ds-bt.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 914c3584e9..999feae08a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -585,6 +585,7 @@ endmenu
>         source "package/rtl8192eu/Config.in"
>         source "package/rtl8723bu/Config.in"
>         source "package/rtl8723ds/Config.in"
> +       source "package/rtl8723ds-bt/Config.in"
>         source "package/rtl8812au-aircrack-ng/Config.in"
>         source "package/rtl8821au/Config.in"
>         source "package/sane-backends/Config.in"
> diff --git a/package/rtl8723ds-bt/Config.in
> b/package/rtl8723ds-bt/Config.in
> new file mode 100644
> index 0000000000..0a604310c0
> --- /dev/null
> +++ b/package/rtl8723ds-bt/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_RTL8723DS_BT
> +       bool "rtl8723ds-bt"
> +       help
> +         rtl8723ds UART attached Bluetooth module firmware.
> +
> +         https://github.com/wsyco/RTL8723DS_BT_Linux
> diff --git a/package/rtl8723ds-bt/rtl8723ds-bt.hash
> b/package/rtl8723ds-bt/rtl8723ds-bt.hash
> new file mode 100644
> index 0000000000..1ec4e350f9
> --- /dev/null
> +++ b/package/rtl8723ds-bt/rtl8723ds-bt.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256  9e70a981946abeeb6437d9a27d8437cea15aa4df72f8d56ded0ae28af484d2f4
> rtl8723ds-bt-14cedf3a9fec1aa8c500fa52f3e3acc433cbcf08.tar.gz
> diff --git a/package/rtl8723ds-bt/rtl8723ds-bt.mk b/package/rtl8723ds-bt/
> rtl8723ds-bt.mk
> new file mode 100644
> index 0000000000..efd0a5bae9
> --- /dev/null
> +++ b/package/rtl8723ds-bt/rtl8723ds-bt.mk
> @@ -0,0 +1,17 @@
>
> +########################################################################=
########
> +#
> +# rtl8723ds-bt
> +#
>
> +########################################################################=
########
> +
> +RTL8723DS_BT_VERSION =3D 14cedf3a9fec1aa8c500fa52f3e3acc433cbcf08
> +RTL8723DS_BT_SITE =3D $(call
> github,wsyco,RTL8723DS_BT_Linux,$(RTL8723DS_BT_VERSION))
> +RTL8723DS_BT_LICENSE =3D PROPRIETARY
> +
> +define RTL8723DS_BT_INSTALL_TARGET_CMDS
> +       mkdir -p $(TARGET_DIR)/lib/firmware/rtl_bt/
> +       cp $(@D)/8723D/rtl8723d_fw
> $(TARGET_DIR)/lib/firmware/rtl_bt/rtl8723ds_fw.bin
> +       cp $(@D)/8723D/rtl8723d_config
> $(TARGET_DIR)/lib/firmware/rtl_bt/rtl8723ds_config.bin
> +endef
> +
> +$(eval $(generic-package))
> --
> 2.34.1
>
>

--000000000000fd859405efe4dfa9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Kontakt Angelo Compagnucci (&lt;<a href=
=3D"mailto:angelo@amarulasolutions.com">angelo@amarulasolutions.com</a>&gt;=
) kirjutas kuup=C3=A4eval N, 15. detsember 2022 kell 00:15:<br></div><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This=
 package install the required firmware for enabling the<br>
Bluetooth device embedded in the RTL8723DS chip.<br>
The driver is included in Linux main tree and can be enabled<br>
with the BT_HCIUART_RTL symbol.<br>
<br>
Signed-off-by: Angelo Compagnucci &lt;<a href=3D"mailto:angelo@amarulasolut=
ions.com" target=3D"_blank">angelo@amarulasolutions.com</a>&gt;<br></blockq=
uote><div><br></div><div>I did the clean build + boot testing with Lichee=
=C2=A0RV dock (sipeed_lichee_rv_dock_defconfig) which is using this package=
. From the log:</div><div><br></div><div>Starting mdev... OK<br>[ =C2=A0 =
=C2=A07.044734] Bluetooth: HCI UART driver ver 2.3<br>[ =C2=A0 =C2=A07.0509=
98] Bluetooth: HCI UART protocol Three-wire (H5) registered<br>[ =C2=A0 =C2=
=A07.805105] Bluetooth: hci0: RTL: examining hci_ver=3D08 hci_rev=3D000d lm=
p_ver=3D08 lmp_subver=3D8723<br>[ =C2=A0 =C2=A07.817938] Bluetooth: hci0: R=
TL: rom_version status=3D0 version=3D2<br>[ =C2=A0 =C2=A07.824105] Bluetoot=
h: hci0: RTL: loading rtl_bt/rtl8723ds_fw.bin<br>[ =C2=A0 =C2=A08.073287] 8=
723ds: loading out-of-tree module taints kernel.<br>[ =C2=A0 =C2=A08.085577=
] Bluetooth: hci0: RTL: loading rtl_bt/rtl8723ds_config.bin<br>[ =C2=A0 =C2=
=A08.117338] Bluetooth: hci0: RTL: cfg_sz 47, total sz 30775<br>[ =C2=A0 =
=C2=A08.637554] Bluetooth: hci0: RTL: fw version 0xaa6c133b<br>Initializing=
 random number generator: OK<br>Saving random seed: OK<br>Starting system m=
essage bus: done<br></div><div><br></div><div>If that counts as a test from=
 patch perspective then:</div><div><br></div><div>Tested-by: Indrek Kruusa =
&lt;<a href=3D"mailto:indrek.kruusa@gmail.com">indrek.kruusa@gmail.com</a>&=
gt;<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
---<br>
v3:<br>
* Simplified package (Thomas, Yann)<br>
* Package now only installs firmware (Thomas, Yann)<br>
<br>
=C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0package/rtl8723ds-bt/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 6 ++++++<br>
=C2=A0package/rtl8723ds-bt/rtl8723ds-bt.hash |=C2=A0 2 ++<br>
=C2=A0package/rtl8723ds-bt/<a href=3D"http://rtl8723ds-bt.mk" rel=3D"norefe=
rrer" target=3D"_blank">rtl8723ds-bt.mk</a>=C2=A0 =C2=A0| 17 ++++++++++++++=
+++<br>
=C2=A04 files changed, 26 insertions(+)<br>
=C2=A0create mode 100644 package/rtl8723ds-bt/Config.in<br>
=C2=A0create mode 100644 package/rtl8723ds-bt/rtl8723ds-bt.hash<br>
=C2=A0create mode 100644 package/rtl8723ds-bt/<a href=3D"http://rtl8723ds-b=
t.mk" rel=3D"noreferrer" target=3D"_blank">rtl8723ds-bt.mk</a><br>
<br>
diff --git a/package/Config.in b/package/Config.in<br>
index 914c3584e9..999feae08a 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -585,6 +585,7 @@ endmenu<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/rtl8192eu/Config.in&quot;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/rtl8723bu/Config.in&quot;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/rtl8723ds/Config.in&quot;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/rtl8723ds-bt/Config.in&quo=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/rtl8812au-aircrack-ng/Conf=
ig.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/rtl8821au/Config.in&quot;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/sane-backends/Config.in&qu=
ot;<br>
diff --git a/package/rtl8723ds-bt/Config.in b/package/rtl8723ds-bt/Config.i=
n<br>
new file mode 100644<br>
index 0000000000..0a604310c0<br>
--- /dev/null<br>
+++ b/package/rtl8723ds-bt/Config.in<br>
@@ -0,0 +1,6 @@<br>
+config BR2_PACKAGE_RTL8723DS_BT<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;rtl8723ds-bt&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rtl8723ds UART attached Bluetooth module=
 firmware.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/wsyco/RTL8=
723DS_BT_Linux" rel=3D"noreferrer" target=3D"_blank">https://github.com/wsy=
co/RTL8723DS_BT_Linux</a><br>
diff --git a/package/rtl8723ds-bt/rtl8723ds-bt.hash b/package/rtl8723ds-bt/=
rtl8723ds-bt.hash<br>
new file mode 100644<br>
index 0000000000..1ec4e350f9<br>
--- /dev/null<br>
+++ b/package/rtl8723ds-bt/rtl8723ds-bt.hash<br>
@@ -0,0 +1,2 @@<br>
+# Locally computed<br>
+sha256=C2=A0 9e70a981946abeeb6437d9a27d8437cea15aa4df72f8d56ded0ae28af484d=
2f4=C2=A0 rtl8723ds-bt-14cedf3a9fec1aa8c500fa52f3e3acc433cbcf08.tar.gz<br>
diff --git a/package/rtl8723ds-bt/<a href=3D"http://rtl8723ds-bt.mk" rel=3D=
"noreferrer" target=3D"_blank">rtl8723ds-bt.mk</a> b/package/rtl8723ds-bt/<=
a href=3D"http://rtl8723ds-bt.mk" rel=3D"noreferrer" target=3D"_blank">rtl8=
723ds-bt.mk</a><br>
new file mode 100644<br>
index 0000000000..efd0a5bae9<br>
--- /dev/null<br>
+++ b/package/rtl8723ds-bt/<a href=3D"http://rtl8723ds-bt.mk" rel=3D"norefe=
rrer" target=3D"_blank">rtl8723ds-bt.mk</a><br>
@@ -0,0 +1,17 @@<br>
+##########################################################################=
######<br>
+#<br>
+# rtl8723ds-bt<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+RTL8723DS_BT_VERSION =3D 14cedf3a9fec1aa8c500fa52f3e3acc433cbcf08<br>
+RTL8723DS_BT_SITE =3D $(call github,wsyco,RTL8723DS_BT_Linux,$(RTL8723DS_B=
T_VERSION))<br>
+RTL8723DS_BT_LICENSE =3D PROPRIETARY<br>
+<br>
+define RTL8723DS_BT_INSTALL_TARGET_CMDS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p $(TARGET_DIR)/lib/firmware/rtl_bt/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp $(@D)/8723D/rtl8723d_fw $(TARGET_DIR)/lib/fi=
rmware/rtl_bt/rtl8723ds_fw.bin<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp $(@D)/8723D/rtl8723d_config $(TARGET_DIR)/li=
b/firmware/rtl_bt/rtl8723ds_config.bin<br>
+endef<br>
+<br>
+$(eval $(generic-package))<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--000000000000fd859405efe4dfa9--

--===============2815717181125307469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2815717181125307469==--
