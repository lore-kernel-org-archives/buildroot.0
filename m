Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CAAC433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E60540197;
	Tue, 18 Jan 2022 10:53:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K4bQ0NWP9dWb; Tue, 18 Jan 2022 10:53:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9736B401B1;
	Tue, 18 Jan 2022 10:53:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6FAB41BF28D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D70760D8E
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:52:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VOLijkMenHn6 for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:52:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10106.aruba.it (smtpcmd10106.aruba.it [62.149.156.106])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9280360D89
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:52:23 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9lz9na4lO; Tue, 18 Jan 2022 11:45:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502721; bh=hgD29yPuCMsQBhpV2rN8L/07JO9iA0t+6b+6hFY67S0=;
 h=From:To:Subject:Date:MIME-Version;
 b=QaS83ukwfw/YU/mJ3Ptwwkbstq2L7webVNGXOtp8KQ55wZahT99ADgT+sscKRk/wd
 GIK7TU7iApUO/VzQCvcTqUOk2dyhmNQNZaYaMkZS/MdiZKanW/KKakNsFp1/2nIiHa
 oNiIud8L2KTL24KVcwhLctJztLYNeMam1wPAUSRnhFPe+DS4+F4Uvb8lnYMHvJcMB5
 wVb4twhCobAW4Cq9vm9R2ieC1WnT41E7+dV4MdcPbxR39oIN05kMEhacw5vRW/IYat
 E8cASaeRj9xNe7ppjL23bmezxbyzoYfkDaUjiQsNgQzWfhfzxLD6msWw5DIk1xTer3
 90iJOnINAMYvg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:15 +0100
Message-Id: <20220118104338.2081259-6-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfAvG3ZYoV65BkdIJmEsfvj7gMXLP+B65dkHFaInH1f1cNoEUz5+uZoOqlWzA3LltbQY6e0v9XR8AG9tQ7wVzglt9dwnuQzFX9tQkhErpouoyQua1S87R
 G/RQnxsWqbd1HzfeKaj4A/Wi4zkDva1fW0FjDlToiW/bgv2SpO0+TeWt4vaiscySj96sx7BeXv+Y0cuy02zXmv+uHExg/4era4EoLogxBB3P4bq2FqgBTWs9
 6NeihAssMxJ5p+dnM0SZMcLjOtaYZFv9PgTyaaYN71tKfoYCK8O/YKbbAmQmfrgySEqJ3DEEBitm0asejIH1/6npd4sySwyMvVOxoJxd4SlIdvRhWY1j8JMM
 PKxaB8jhMuV1susjD9jcSpqY24hlebXOAENPvYZwrXySE4dh1GAKi9RubXT/7d2UFycK7992s8vNVZI8lPSjoEUHrJdaKYUq0/YyGr4KW1lzgEgxeApObabZ
 vXNjmzB+fZd0xYLIWTicOLMOESPa8bh703bEesCYVGA6RG8t7hyIpn3J/zzfQExA7OgTqTTXhRZZ8xbk5MEXgrI8esjqLQHWnJJd54BtyMLWllztvalqec4L
 FAvl/+nrgS8hD50xybZNOhifV04nDPZGZPg3JHCtvzL4FKzqubsaSABQNHawrq0YP7ZxRysrydgxKSCPuaGR6JPaa6mu+JJnpNibRYsMqMMEz7b3HhD23D2P
 s3hDS9Y4E0EVeDbBjNLf1bfGsewth2djeYgg8bTxW4QFEOrnLyQPXXldF0ngFZ97v/T2MVRdWuq/X22xDWsQwFdS+MqWKnU+7R5Spxkwl2ds6WadBH8dAKsH
 +Y7i8Or8JzNc/mnIgLCGTG6zuCmsL7vT/IeduLQtjLSv8YPMmj67vvKbOiDgsg==
Subject: [Buildroot] [PATCH 05/28] configs/beagleboardx15_defconfig: enable
 NEON/VFPV4 FPU strategy
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
Cc: Theo Debrouwere <t.debrouwere@televic.com>, Simon Doppler <dopsi@dopsi.ch>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>, Jan Kraval <jan.kraval@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Davide Viti <zinosat@gmail.com>, Mike Harmony <mike.harmony@snapav.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Michel Stempin <michel.stempin@wanadoo.fr>,
 Lothar Felten <lothar.felten@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Biagio Montaruli <biagio.hkr@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This board has TI AM5728 that is a cortex-A15 and supports NEON/VFPV4 FPU
strategy, so let's enable it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/beagleboardx15_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/beagleboardx15_defconfig b/configs/beagleboardx15_defconfig
index 039a07b11e..2ee2777dad 100644
--- a/configs/beagleboardx15_defconfig
+++ b/configs/beagleboardx15_defconfig
@@ -1,5 +1,6 @@
 BR2_arm=y
 BR2_cortex_a15=y
+BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboardx15/genimage.cfg"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
