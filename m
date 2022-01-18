Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5F6C433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2005600B9;
	Tue, 18 Jan 2022 10:54:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uAb8s8CLvcgw; Tue, 18 Jan 2022 10:54:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5315560030;
	Tue, 18 Jan 2022 10:54:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 126EB1BF28D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E77F60DCB
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:53:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kqdWbyL0n5Jz for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:53:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10106.aruba.it (smtpcmd10106.aruba.it [62.149.156.106])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8418560D8E
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:53:08 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9lzyna5ib; Tue, 18 Jan 2022 11:46:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502766; bh=EAmlj7Ru96zjXBjVoUgmvxirmq8H9qqNQqvxuo7fM5Q=;
 h=From:To:Subject:Date:MIME-Version;
 b=Dse4bxcuOAt9a2SI7bB8hY6AQ3Bax89XMVEy5rnRKU9Q5GFF2H1gm96vq1zhmCsvE
 Tl7+nwCcIK8PN2DRzvpwWTpPefmu992LucTHizUUtSJLVVvQ+NME3ZtkeTrpXz13sH
 /azmaVBginCzYVh49BR3QNEGL7r6Yp0mmslfvSeiBgQO+GB9xfyQlu7FaR/CHIVilc
 QsKQWKcB4N6asryRkom3Kqvs7J1zk5md40Ig2njsOZykjyNrJPxV0rDnQ8+1vtBTIe
 hPCoC2ktgtbDXXbwi8lKvdOrZYW8Bhx2sVrPqoTQ9nOer4Bs5Svupsx0nDubHYA7XJ
 EQloympQwynTQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:19 +0100
Message-Id: <20220118104338.2081259-10-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfAYiJ5UfdFkwFMpd5UMTSBW7sA3sjqaQJdluLSKHaG6bCIFmskNcmpm5Yj3fULkqbKmDqwkbDXdPR5B5bt3Lp2rJkm5bo8lZStbBsbIUAZD18WM7Za57
 0q0kZSip9t9q0+P7Kk9CkdOHWDQLv/LYvvdUAfuaDVw68/pX+1Ed1AMqvnp/WyKeE2TZco2vooh80lSMYvcvaFbLspdOBl0pJEzKn5Lprl/N3bkxEF4YBRRw
 e7s2GbXRmynt7+DolPvdSNHWzkT10GVdTOVmKBUxCqAg7bbxVFvFqf+W3FAzd5Om5We+NC2UQJrm070mRAFYXC8R9j+AgV3Z95uqr4uHtwa1GXnAFkQMwZ7u
 +rl1D86814PolIJ59xqq3YrXuBVwtX0ntax6Sv/x26GtUTZu4iE4m0O7v5a7a++UjKGly9i5kbg9sdZTG93qd5HrPEF785XU0b0U4reFEx8c29pn4ipXGW6B
 QYh+AU1NcQ4EJ0aE4BQJ1+LS3A46YUoT2tVr49tSkZnZdcCO8QIjZ1ElT+4H8dtSKYRI1gfucHZcEvXvsywznllt2cQWohSXErRm2061+C5NPM2Xf7mi2Xun
 /ILs6ptVlDJtvC9AILlaFHFNbZtzdaYVLuwMaQcZ2zagTssTXR2nP121b8BZJ2kR8R+0W0+rj/InMV115o7P+9xN7ZWe97TTHIeWhnWaRqNQXUu+V3uwwE1s
 tNEiZKgIlOgNZ2y7qi7HO4jWcQPBqUDscT/DXk79a0GLnKFYviKZX+4szNAvVeEP+BSmpwZQutVP07Mm4+efVb1ny5Tl39s98mYziutGsbynCkjymoS7piRv
 WZ/tfFzqAvaKneSTT9iXlza65DGmGUbdIZ7jhYHcra972mNUkADjTTFwF4mvuA==
Subject: [Buildroot] [PATCH 09/28] configs/friendlyarm_nanopi_m1_defconfig:
 enable NEON/VFPV4 FPU strategy
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

This board has Allwinner H3 that is a cortex-A7 and supports NEON/VFPV4
FPU strategy, so let's enable it instead of only VFPV4.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/friendlyarm_nanopi_m1_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/friendlyarm_nanopi_m1_defconfig b/configs/friendlyarm_nanopi_m1_defconfig
index 18cfcb261e..6e78e662be 100644
--- a/configs/friendlyarm_nanopi_m1_defconfig
+++ b/configs/friendlyarm_nanopi_m1_defconfig
@@ -1,7 +1,7 @@
 # Architecture
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_ARM_FPU_VFPV4=y
+BR2_ARM_FPU_NEON_VFPV4=y
 
 # Linux headers same as kernel, a 5.0 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
