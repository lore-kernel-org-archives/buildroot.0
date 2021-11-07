Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF837C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 01:59:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1361961440
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 01:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1361961440
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3DCE60628;
	Sun,  7 Nov 2021 01:59:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZDyneNRl1AYT; Sun,  7 Nov 2021 01:58:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B37F860666;
	Sun,  7 Nov 2021 01:58:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A3FF21BF578
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 01:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90F5160666
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 01:58:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uAUBwiL020Fs for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 01:58:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AE7160628
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 01:58:42 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXS8muPGjFf01jXS8mqK6L; Sun, 07 Nov 2021 02:58:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250321; bh=ItSGsV7IhSnl5Q1FbTdYQWjOklG9ks1tUqKwY5d64tc=;
 h=From:To:Subject:Date:MIME-Version;
 b=W5uOnqsDVD7XNjgRy2QXdP68JCGwq8cQQYcKxk7QsUDSXYAyhfZJYt6zMGkl6sUzV
 XnmselcO6LALeWff5MABU0Z7ipdgEHyJcUsouj0Z47nYWbK8aObhNOT7Y4LYMqUsxO
 BEAonMF9QCU/iSAyx7wl1zCD0VBNWnmnuKWC+EgsJjhaLBXWh664btLYp+VAOg72aH
 gDPHuggHUiMSbGfXpcl2ihH8FOeeZYuHAZUlg3FeROfiw9h0+3ipKdEMRYMi+DQ80I
 VmFbFBMdRCAT87+pxkt8fmL2MRCC8MgvYAjbOHXJrN03L3y78SaUbEaL4dq6nkbZLZ
 IyP6nT/OBdtFg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 02:58:21 +0100
Message-Id: <20211107015835.3055951-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfMRRYSpc8eunU6pGGDGLhB3yNmeNxSkGWL/Mm6ndXjAMQ3rXdupcqL2nm+fTs1tcJ3ewGdN9LnmDAyFQ4Ddib/eV/WzeNe3XdZIcUoRidrYfKRMs32Bs
 enX5icrKMhQA3gLpyyuJx9+iY33tcRpczFp+4ee92MOaIci3vmQKLUQraxgsmiwOvu1eMv6OKtpOX+ugh0wxoPzH29wpOg3+AWTwndc5eIjDlB5I7Zp+j8oe
 QOGFtP3oEVHGkZhKyMsD3tJP0GHL23scNYVQhhuOE7HMlpUTSGHuPIyoJFUwOdPF9r2IMQpT6e9FDzKdGZBPpusRRvo87N7kXed+1UsczgIaYtSIt5r78u4Y
 Vh/92V03991Exw2Uq9eCwdkjSOqaJZVjHGKyxyHBPI1nM0e+R1z6KKepel9RnFqsCC2sX5maIIBiG6Sj4cnY8M32taZWzgMKQu7FMJy+arf3LJGGZq2i8tms
 SdE3To/xuTyPznqey7LQvG9oO0JoiXbWgk3qCIpA2WhhHTrc4KYx2SGDSCcIVtKUOd4ZKr1ULpYjcrPoIv0AbW/rm+DJp0z7RKGQranrslIMGfZV9H4INnmE
 3rW++U6FoG2ALByfD4D782claJJLiK/ygf0lbTn2r1A4ezDf6DF/B4fG5mPkEyaMfB18benCzYDYQ4Hbrd4Nw2iIYifGaJ3IKFzto6yhD1xKU6V/kbvOHuaT
 j5TLMFzm11G9tZcnq6m7vojeOMulxB54NUYVKfhIkEsLjE5WotezRaFmpbyc3LZvxRmmBbkAhHfOz8iAPqJhlmy8x9V73xoc/zuBf4krGm42itjzPWX3ARTd
 rosWVqLBjOAyAGwatyFDaFT8eOhlRdjV1QdgNnotDU33cBp+1SBm68ZCAMpgbwCH7HtGCDHDqX+iSycs1VuVgLNxKsKIlZ0URma4gqd20BX44T1VEnXkZXWk
 liJWsjFAYltfsjhchXTaTAItMWTnurQhph8E0qhc3uuJdemj2Tnxx5yvHS8MpDf113/MmFDNPkud0rbha6PjtlBjbfLcxxeg2KpTOzI+pK/fDu+u2VZ6lY1t
 YZgFf4nwprYc8C1ABnHe+czXc2PXJF750aRDNplonSyX+/vEigsFyxevzMalrKUJcaJaJjYyN73rlDR5jeJGkAKgNRcHiTB07LXa7GAn8+UrxzPZW48nAiYX
 ZUWJUdvjiNaTksVNBz3q+TSIjeFpji0nPcwDLe5P9yVmtr6ien47yszs/RKOZw9wicE/SWyyEOIZzKfx1XbELAJjY0ekjxUJ9r27sE674BYD28ycEKJ3McqL
 kSo6zfdAUdFg2RF2/Ast0PsFLXmBABUoo9aCZAi2RwJ+0aj11ebQ/iUlMS7wklzmXsUkZldp0QRkhaJGfoya47oqbiZ1Tp+HQAiMMeIuTn4AoWbBkhD2Vr5X
 baWLirF3KdnOqMXR5w1ztp96Kfp2zVdilm/XZC4+ppCIBKeLqAuarP3ljMtxfLUJIbB0bC2xaLizgcaY9MWohH8sbrpHqeQUUieOc0XaIy3g3pBKr2GlHk4p
 DZAP41FLmx3tss5FUBDZ6XZ3aJ5k4FQHL8Psg2Fd619uitVKDrgL35Br7d+bgfnJRld3SF+6NLDk9AxsKHLkinmhRwMtrcshJO9d5XBnOJSnc5BCXnHtVLfQ
 TvD2et8GEK1HX0HY9zyKlJskpnRQ+4jSMF7hWl7524BUUgIZySSBTHnqBtOnuPx9LwfLV7zCzqnYSOBP1QwkVYok5RamuRk3vgU3D5/GWtCJhqHIJ0bNwg==
Subject: [Buildroot] [PATCH 000/102] Standardize/beautify genimage .cfg
 files for all boards
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Theo Debrouwere <t.debrouwere@televic.com>,
 Nicholas Sielicki <sielicki@yandex.com>, Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Mike Harmony <mike.harmony@snapav.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Michel Stempin <michel.stempin@wanadoo.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Dagg Stompler <daggs@gmx.com>,
 Biagio Montaruli <biagio.hkr@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>,
 Jan Kraval <jan.kraval@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Peter Seiderer <ps.report@gmx.net>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Filip Skoneczny <fskoneczny@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 David Lechner <david@lechnology.com>, Davide Viti <zinosat@gmail.com>,
 Nikolay Dimitrov <nikolay.dimitrov@retrohub.org>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Crokaert <pct@crookies.net>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Lothar Felten <lothar.felten@gmail.com>, Luca Ceresoli <luca@lucaceresoli.net>,
 Romain Naour <romain.naour@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patchset aims to set a standard for all genimage .cfg files in
Buildroot since at the moment various formats are used.
First of all I've changed every double space into tab, and in general tab
becomes the separator in place of space that more than sometimes is used
mixed with tabs.
There are some space, newline left, no newlines after nodes while
newlines after other.
All the offsets and sizes are specified in a mixed way of bytes number,
K, M, G, hexadecimal.
So basically these file has never had a standard. Even if a real standard
is not really defined I ask you to accept this long patchset to improve
consistency and to ease the readibility of offsets and sizes.

I've created a patch per file instead of "topic" like "missing space",
"convert from space to tab" etc. because it was a big mix of everything
in more than one file.

I ask, can I add a section in Documentation where to explain how to write
a "standard" genimage .cfg file? That way there is a guideline.

Best regards

Giulio Benetti (102):
  board/aarch64-efi/genimage.cfg: beautify file
  board/acmesystems/acqua-a5/genimage.cfg: beautify file
  board/acmesystems/aria-g25/genimage.cfg: beautify file
  board/acmesystems/arietta-g25/genimage.cfg: beautify file
  board/altera/socrates_cyclone5/genimage.cfg: beautify file
  board/amarula/a64-relic/genimage.cfg: beautify file
  board/atmel/at91sam9x5ek_mmc/genimage.cfg: beautify file
  board/atmel/sama5d27_som1_ek_mmc/genimage.cfg: beautify file
  board/atmel/sama5d27_wlsom1_ek_mmc/genimage.cfg: beautify file
  board/atmel/sama5d2_xplained_mmc/genimage.cfg: beautify file
  board/atmel/sama5d3_xplained_mmc/genimage.cfg: beautify file
  board/atmel/sama5d4_xplained_mmc/genimage.cfg: beautify file
  board/bananapi/bananapi-m1/genimage.cfg: beautify file
  board/bananapi/bananapi-m2-ultra/genimage.cfg: beautify file
  board/bananapi/bananapi-m2-zero/genimage.cfg: beautify file
  board/bananapi/bananapi-m64/genimage.cfg: beautify file
  board/beagleboardx15/genimage.cfg: beautify file
  board/beaglebone/genimage.cfg: beautify file
  board/beagleboneai/genimage.cfg: beautify file
  board/beaglev/genimage.cfg: beautify file
  board/beelink/gs1/genimage.cfg: beautify file
  board/ci20/genimage.cfg: beautify file
  board/cubietech/cubieboard2/genimage.cfg: beautify file
  board/embest/riotboard/genimage.cfg: beautify file
  board/engicam/geam6ul/genimage.cfg: beautify file
  board/engicam/icorem6/genimage.cfg: beautify file
  board/engicam/icorem6_rqs/genimage.cfg: beautify file
  board/engicam/isiot/genimage.cfg: beautify file
  board/friendlyarm/nanopc-t4/genimage.cfg: beautify file
  board/friendlyarm/nanopi-a64/genimage.cfg: beautify file
  board/friendlyarm/nanopi-m1-plus/genimage.cfg: beautify file
  board/friendlyarm/nanopi-m1/genimage.cfg: beautify file
  board/friendlyarm/nanopi-m4/genimage.cfg: beautify file
  board/friendlyarm/nanopi-neo-plus2/genimage.cfg: beautify file
  board/friendlyarm/nanopi-neo/genimage.cfg: beautify file
  board/friendlyarm/nanopi-neo2/genimage.cfg: beautify file
  board/friendlyarm/nanopi-r1/genimage.cfg: beautify file
  board/grinn/chiliboard/genimage.cfg: beautify file
  board/grinn/liteboard/genimage.cfg: beautify file
  board/hardkernel/odroidc2/genimage.cfg: beautify file
  board/hardkernel/odroidxu4/genimage.cfg: beautify file
  board/intel/galileo/genimage.cfg: beautify file
  board/lego/ev3/genimage.cfg: beautify file
  board/lemaker/bananapro/genimage.cfg: beautify file
  board/licheepi/genimage.cfg: beautify file
  board/linksprite/pcduino/genimage.cfg: beautify file
  board/microchip/sam9x60ek_mmc/genimage.cfg: beautify file
  board/microchip/sama5d2_icp/genimage.cfg: beautify file
  board/minnowboard/genimage.cfg: beautify file
  board/nexbox/a95x/genimage.cfg: beautify file
  board/olimex/a13_olinuxino/genimage.cfg: beautify file
  board/olimex/a20_olinuxino/genimage.cfg: beautify file
  board/olimex/a33_olinuxino/genimage.cfg: beautify file
  board/olimex/a64_olinuxino/genimage.cfg: beautify file
  board/orangepi/orangepi-lite/genimage.cfg: beautify file
  board/orangepi/orangepi-lite2/genimage.cfg: beautify file
  board/orangepi/orangepi-one-plus/genimage.cfg: beautify file
  board/orangepi/orangepi-one/genimage.cfg: beautify file
  board/orangepi/orangepi-pc-plus/genimage.cfg: beautify file
  board/orangepi/orangepi-pc/genimage.cfg: beautify file
  board/orangepi/orangepi-pc2/genimage.cfg: beautify file
  board/orangepi/orangepi-plus/genimage.cfg: beautify file
  board/orangepi/orangepi-prime/genimage.cfg: beautify file
  board/orangepi/orangepi-r1/genimage.cfg: beautify file
  board/orangepi/orangepi-rk3399/genimage.cfg: beautify file
  board/orangepi/orangepi-win/genimage.cfg: beautify file
  board/orangepi/orangepi-zero-plus/genimage.cfg: beautify file
  board/orangepi/orangepi-zero-plus2/genimage.cfg: beautify file
  board/orangepi/orangepi-zero/genimage.cfg: beautify file
  board/pandaboard/genimage.cfg: beautify file
  board/pc/genimage-bios.cfg: beautify file
  board/pc/genimage-efi.cfg: beautify file
  board/pine64/pine64/genimage.cfg: beautify file
  board/pine64/rock64/genimage.cfg: beautify file
  board/pine64/rockpro64/genimage.cfg: beautify file
  board/pine64/sopine/genimage.cfg: beautify file
  board/qemu/aarch64-sbsa/genimage.cfg: beautify file
  board/radxa/rockpi-4/genimage.cfg: beautify file
  board/radxa/rockpi-n10/genimage.cfg: beautify file
  board/radxa/rockpi-n8/genimage.cfg: beautify file
  board/raspberrypi/genimage-raspberrypi.cfg: beautify file
  board/raspberrypi/genimage-raspberrypi0.cfg: beautify file
  board/raspberrypi/genimage-raspberrypi0w.cfg: beautify file
  board/raspberrypi/genimage-raspberrypi2.cfg: beautify file
  board/raspberrypi/genimage-raspberrypi3-64.cfg: beautify file
  board/raspberrypi/genimage-raspberrypi3.cfg: beautify file
  board/raspberrypi/genimage-raspberrypi4-64.cfg: beautify file
  board/raspberrypi/genimage-raspberrypi4.cfg: beautify file
  board/raspberrypi/genimage-raspberrypicm4io-64.cfg: beautify file
  board/raspberrypi/genimage-raspberrypicm4io.cfg: beautify file
  board/roseapplepi/genimage.cfg: beautify file
  board/sinovoip/m1-plus/genimage.cfg: beautify file
  board/sinovoip/m2-plus/genimage.cfg: beautify file
  board/solidrun/macchiatobin/genimage.cfg: beautify file
  board/stmicroelectronics/stm32f469-disco/genimage.cfg: beautify file
  board/synopsys/hsdk/genimage.cfg: beautify file
  board/technologic/ts7680/genimage.cfg: beautify file
  board/terasic/de10nano_cyclone5/genimage.cfg: beautify file
  board/toradex/apalis-imx6/genimage.cfg: beautify file
  board/uevm5432/genimage.cfg: beautify file
  board/zynq/genimage.cfg: beautify file
  board/zynqmp/genimage.cfg: beautify file

 board/aarch64-efi/genimage-efi.cfg            | 45 +++++++-------
 board/acmesystems/acqua-a5/genimage.cfg       |  1 +
 board/acmesystems/aria-g25/genimage.cfg       |  1 +
 board/acmesystems/arietta-g25/genimage.cfg    |  7 ++-
 board/altera/socrates_cyclone5/genimage.cfg   |  5 +-
 board/amarula/a64-relic/genimage.cfg          |  1 +
 board/atmel/at91sam9x5ek_mmc/genimage.cfg     |  1 +
 board/atmel/sama5d27_som1_ek_mmc/genimage.cfg |  1 +
 .../atmel/sama5d27_wlsom1_ek_mmc/genimage.cfg |  1 +
 board/atmel/sama5d2_xplained_mmc/genimage.cfg |  1 +
 board/atmel/sama5d3_xplained_mmc/genimage.cfg |  1 +
 board/atmel/sama5d4_xplained_mmc/genimage.cfg |  1 +
 board/bananapi/bananapi-m1/genimage.cfg       |  5 +-
 board/bananapi/bananapi-m2-ultra/genimage.cfg |  5 +-
 board/bananapi/bananapi-m2-zero/genimage.cfg  |  5 +-
 board/bananapi/bananapi-m64/genimage.cfg      |  5 +-
 board/beagleboardx15/genimage.cfg             |  3 +-
 board/beaglebone/genimage.cfg                 |  3 +-
 board/beagleboneai/genimage.cfg               |  1 +
 board/beaglev/genimage.cfg                    | 18 +++---
 board/beelink/gs1/genimage.cfg                |  5 +-
 board/ci20/genimage.cfg                       | 44 +++++++-------
 board/cubietech/cubieboard2/genimage.cfg      |  5 +-
 board/embest/riotboard/genimage.cfg           | 26 ++++----
 board/engicam/geam6ul/genimage.cfg            |  3 +-
 board/engicam/icorem6/genimage.cfg            |  3 +-
 board/engicam/icorem6_rqs/genimage.cfg        |  3 +-
 board/engicam/isiot/genimage.cfg              |  3 +-
 board/friendlyarm/nanopc-t4/genimage.cfg      | 60 +++++++++----------
 board/friendlyarm/nanopi-a64/genimage.cfg     |  5 +-
 board/friendlyarm/nanopi-m1-plus/genimage.cfg |  5 +-
 board/friendlyarm/nanopi-m1/genimage.cfg      |  5 +-
 board/friendlyarm/nanopi-m4/genimage.cfg      |  2 +-
 .../friendlyarm/nanopi-neo-plus2/genimage.cfg |  5 +-
 board/friendlyarm/nanopi-neo/genimage.cfg     |  5 +-
 board/friendlyarm/nanopi-neo2/genimage.cfg    |  5 +-
 board/friendlyarm/nanopi-r1/genimage.cfg      |  5 +-
 board/grinn/chiliboard/genimage.cfg           | 43 ++++++-------
 board/grinn/liteboard/genimage.cfg            | 59 +++++++++---------
 board/hardkernel/odroidc2/genimage.cfg        |  3 +-
 board/hardkernel/odroidxu4/genimage.cfg       | 17 +++---
 board/intel/galileo/genimage.cfg              |  3 +-
 board/lego/ev3/genimage.cfg                   | 18 ++++--
 board/lemaker/bananapro/genimage.cfg          |  5 +-
 board/licheepi/genimage.cfg                   |  5 +-
 board/linksprite/pcduino/genimage.cfg         |  5 +-
 board/microchip/sam9x60ek_mmc/genimage.cfg    |  1 +
 board/microchip/sama5d2_icp/genimage.cfg      |  1 +
 board/minnowboard/genimage.cfg                |  1 +
 board/nexbox/a95x/genimage.cfg                |  1 +
 board/olimex/a13_olinuxino/genimage.cfg       | 32 +++++-----
 board/olimex/a20_olinuxino/genimage.cfg       |  4 +-
 board/olimex/a33_olinuxino/genimage.cfg       |  4 +-
 board/olimex/a64-olinuxino/genimage.cfg       |  5 +-
 board/orangepi/orangepi-lite/genimage.cfg     |  5 +-
 board/orangepi/orangepi-lite2/genimage.cfg    |  5 +-
 board/orangepi/orangepi-one-plus/genimage.cfg |  5 +-
 board/orangepi/orangepi-one/genimage.cfg      |  5 +-
 board/orangepi/orangepi-pc-plus/genimage.cfg  |  5 +-
 board/orangepi/orangepi-pc/genimage.cfg       |  5 +-
 board/orangepi/orangepi-pc2/genimage.cfg      |  5 +-
 board/orangepi/orangepi-plus/genimage.cfg     |  5 +-
 board/orangepi/orangepi-prime/genimage.cfg    |  5 +-
 board/orangepi/orangepi-r1/genimage.cfg       |  5 +-
 board/orangepi/orangepi-rk3399/genimage.cfg   |  2 +-
 board/orangepi/orangepi-win/genimage.cfg      |  5 +-
 .../orangepi/orangepi-zero-plus/genimage.cfg  |  5 +-
 .../orangepi/orangepi-zero-plus2/genimage.cfg |  5 +-
 board/orangepi/orangepi-zero/genimage.cfg     |  4 +-
 board/pandaboard/genimage.cfg                 |  1 +
 board/pc/genimage-bios.cfg                    | 36 ++++++-----
 board/pc/genimage-efi.cfg                     | 49 +++++++--------
 board/pine64/pine64/genimage.cfg              |  5 +-
 board/pine64/rock64/genimage.cfg              | 36 +++++------
 board/pine64/rockpro64/genimage.cfg           |  2 +-
 board/pine64/sopine/genimage.cfg              |  5 +-
 board/qemu/aarch64-sbsa/genimage.cfg          | 42 ++++++-------
 board/radxa/rockpi-4/genimage.cfg             |  2 +-
 board/radxa/rockpi-n10/genimage.cfg           |  2 +-
 board/radxa/rockpi-n8/genimage.cfg            |  2 +-
 board/raspberrypi/genimage-raspberrypi.cfg    | 51 ++++++++--------
 board/raspberrypi/genimage-raspberrypi0.cfg   | 47 ++++++++-------
 board/raspberrypi/genimage-raspberrypi0w.cfg  | 49 +++++++--------
 board/raspberrypi/genimage-raspberrypi2.cfg   | 47 ++++++++-------
 .../raspberrypi/genimage-raspberrypi3-64.cfg  | 53 ++++++++--------
 board/raspberrypi/genimage-raspberrypi3.cfg   | 53 ++++++++--------
 .../raspberrypi/genimage-raspberrypi4-64.cfg  | 47 ++++++++-------
 board/raspberrypi/genimage-raspberrypi4.cfg   | 47 ++++++++-------
 .../genimage-raspberrypicm4io-64.cfg          | 47 ++++++++-------
 .../raspberrypi/genimage-raspberrypicm4io.cfg | 47 ++++++++-------
 board/roseapplepi/genimage.cfg                | 12 ++--
 board/sinovoip/m1-plus/genimage.cfg           |  5 +-
 board/sinovoip/m2-plus/genimage.cfg           |  5 +-
 board/solidrun/macchiatobin/genimage.cfg      |  4 +-
 .../stm32f469-disco/genimage.cfg              |  4 +-
 board/synopsys/hsdk/genimage.cfg              | 42 ++++++-------
 board/technologic/ts7680/genimage.cfg         |  2 +-
 board/terasic/de10nano_cyclone5/genimage.cfg  |  1 +
 board/toradex/apalis-imx6/genimage.cfg        | 14 ++---
 board/uevm5432/genimage.cfg                   |  1 +
 board/zynq/genimage.cfg                       |  2 +
 board/zynqmp/genimage.cfg                     |  1 +
 102 files changed, 716 insertions(+), 625 deletions(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
