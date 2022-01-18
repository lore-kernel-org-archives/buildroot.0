Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C85DC433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF3C081A1C;
	Tue, 18 Jan 2022 10:50:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bsByatyFI9hj; Tue, 18 Jan 2022 10:50:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27A4181A15;
	Tue, 18 Jan 2022 10:50:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A71951BF28D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93959405EC
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:50:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pqau-YBUvyfn for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:50:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10106.aruba.it (smtpcmd10106.aruba.it [62.149.156.106])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1EEE400C6
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:50:22 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9m33na8vr; Tue, 18 Jan 2022 11:49:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502959; bh=6lMcu5LDTWecrr0FFxcTpZPUJfZE/2d/p3iEW1RYy1I=;
 h=From:To:Subject:Date:MIME-Version;
 b=OzKVmLdfJVR4jPH0dVN2YPxm/bDOYm/TosJaXPQ9oYHBjW9aWVsajjbgIXg8gnP6q
 FJJpaK9tb945jN/uRMIPDcEWVpC6GtlMDocIxIWDFmRnjOi02POM6wHL255wBVIxsK
 kxxeUrOtXc/gGQHX5TZcH/5KJQVsY4GVDAhtMAhZ0WcenRMg4oYmyM/37U9fWd3s5W
 vF1vGG579+p8lKtOWevIHM/KJeM8v+uQ0x/KYNHq01sOeROzmlf7BQ1oUw77X5GTYA
 Ifr98YWk++DR+UzcC1/dlGT9EeBCYwKECJvs0M14JVXhZ8zf+Vol3Y6zx/26Asi0ku
 Pl/ReDuRXO5cA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:38 +0100
Message-Id: <20220118104338.2081259-29-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHreXDzHwCyqW+nGm9LHX4zzI3MLqIaLq5KTnFv3d06mHWxO7StuZfGmaU3036rl/ouqpJOcsRHOBwtdwmTYIlqXEyy9E+Mx3wxJtl6vc+BSTHH41Jqo
 RmdeRjuWdZdUfm1LKPfnrTWqYzhGYuk7LIu5mzbmRfS7n8A2kHVmNQoI+URoCNm7r5jQyNFpqZi+0MOYdjjZQdmXqgpwKrZFrBhuioKbv/UdWIjbrCXQ45UM
 7cTx1kL1GSi77XtBnnhZpGgtx7TLWXQeoDo/meIGXpAIHwiVyzODuO10FQvlyGnldjiqhBd0nfAStum4l6WhHv0H06j3zWkvHl8SI0qKKIjSwKl7WBuAnBm8
 1F7Ohte1hhxtYSByhgDKEYHXnZ3Y/xFAcKkG4rnIQmrrzvEN7m5FPk2sDoMeebB/mhqqrKhyibfCcf5pYO3tLw3iszb+5lnPdN73tVTphT6K3KlVVDhD/3tx
 fw5zbqhh6M62/LBNigQRnmOxepXcU6fmUkM2bMMtDoYEW8Ni6Z+E8s8c69tgPDThVafBXTOBTnpWh2lwzkwwbAnF/QaktzTA2qUrSYFLtetNIlYcYG2MMqQy
 UCtSVwkbJECb6tLosMGP9UiK3EY2vKGjuUxWDQKuYhd//XSHxvZpz4hgJWe1+pKI4RCD2Q0K55PgioX++DUPnNuJCsSBP+dk25pVbR4gjuZuhNRSx9amG036
 QQKqc+h+aN5b4zwbVs8B3okED8AZH0rZZN33F+EYolqA4gmogwi27TVUCxxQDjgtH3N8ShP+3LofNyOR01oLoFrw3F253GRCpSLwBxIjEiAERukgptJc5/QC
 9rbYcWe8RAaAHbJro54ay3t7Qnhs+/ezlumfkt5PUlNur9AzhWzYtV4p0Vvonw==
Subject: [Buildroot] [PATCH 28/28] configs/stm32mp157c_odyssey_defconfig:
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

This board has stm32mp157c that is a cortex-A7 and supports NEON/VFPV4 FPU
strategy, so let's enable it instead of the default VFPV4-D16.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/stm32mp157c_odyssey_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32mp157c_odyssey_defconfig b/configs/stm32mp157c_odyssey_defconfig
index 6b699830b1..6aa772b8c0 100644
--- a/configs/stm32mp157c_odyssey_defconfig
+++ b/configs/stm32mp157c_odyssey_defconfig
@@ -1,5 +1,6 @@
 BR2_arm=y
 BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
 BR2_GLOBAL_PATCH_DIR="board/seeed/stm32mp157c-odyssey/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_ROOTFS_OVERLAY="board/seeed/stm32mp157c-odyssey/overlay/"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
