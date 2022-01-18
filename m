Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B24EC433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C928405EE;
	Tue, 18 Jan 2022 10:55:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sXNfvZhUMV5O; Tue, 18 Jan 2022 10:55:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31AD3400C6;
	Tue, 18 Jan 2022 10:55:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B4441BF2A6
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4998980B6E
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:53:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KIjC3zjJ_iN1 for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:53:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10106.aruba.it (smtpcmd10106.aruba.it [62.149.156.106])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7371980B4E
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:53:51 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9m0ana6Qb; Tue, 18 Jan 2022 11:46:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502810; bh=4zSNrKk+qLR/zbt4drEFtHZE8uyB9lrP4Q7sEmi71TY=;
 h=From:To:Subject:Date:MIME-Version;
 b=jD+GtJ1q26bBKEJrq0bjVArc7zzssZABPf2Ym4m+5oxot9HniRFiaHMXTA/ql6B79
 l3zaGwntkpNBUl3D/p9Vv9j3bRzNSlC2d+7qo8S00NAOv/XjBxT7K0YvqrEHFgo+z5
 Eyq5KmaCUDHZ292PhvpAoSKGvKgjlZSOV+olw6e5U0sIBeiKF1Nyl8mqR8vYGkBWEe
 RsmdFpHiIBDm5Ul6LuEF6vIABttdZ3nq+MuXsjTPnVEw8fffu0SHkYuIxwd1oPGBap
 wtBT8TnsLRDSoSie0cIyV9vF3Bd0dMLWiE/SWCQlM/Lq41eEuCwip4Qnp9GVcURCY0
 pF0LjWznxtveQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:23 +0100
Message-Id: <20220118104338.2081259-14-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfAgo0pKOv8aIc6emebqEiSAjXEZwKHlcz9gxxD41h+K0bmAjFETsrmloSIn6v0e0Ttx3uWj2hXXPJIaMC+mLvQFUqksMg7yWDTOmCPRum9Gz4ZSb4+vF
 viqqpHkQeJsO5FKaRpY2LuwSdPIIIGXXoyj5it8xtxZKl2WisqvZC9Bs5y2bDaMfuKX5TJYfMGsEi7mtaKe9NgmCdGM8uf+LGYK5abxp3eDEvwvhlyEe8HDU
 dnjroL8kr2KZJ1Fu9Z0EvPedJ8dBTr5/ADvx8n2TLN8bWVT6HtqvVmUEU9xVmKYoPokwwOco7vxLBtZszzHWqXvZUtpGudgLHA/tNcjIwiQW/dTr2UKcxS+u
 PuXCzuHT0j4E2hqE2K3ufATn0OjvyIFDvJd5vxUSoGl1Xo1Ohw5mS/i9wXhvQYwiJdckkrLRj2csv/yUQTuTam3ErcnvmVlFKu0fqfbB8LpKhLJmgxo19paK
 BcV410cV+8IJp+qH9EXAfY9Wr6PcrdaFQrHctsW3GGf1MFEE0XBbEVhnwWfnP9uOFGua2XtQGS82Nr0uAWRNucfFk8R50CAWWRb0D9mIV+kMO2hwoVg3iFO/
 v8+AJD3G1vtm8Ob8Wo4J94a9jekIq2CZ5Dw+XaJvshRoGDO6wJdF/4PKnDxvR9fUlyLdcYpDfgBDJmH6ReYhPhcIp4hv6Mco53RDOzqb6brLWnBy2V0uL/1J
 1q64PJ8M4YBnKewVncFDIWItJpelpO+bntZQnpwK/Bolu0WRoVj2jsQURFuXbMV651yieeQLADNweC640LC2VLRrTVMm03/gSvd0yEUWkiB5FFGcv1wWaMn3
 METQOseAzA9/JW25wx2oZ0Y3z0TW101T0/rjd4kMsMDDQ4AsBUghDp4uPDmbqA==
Subject: [Buildroot] [PATCH 13/28] configs/grinn_liteboard_defconfig: enable
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

This board has i.MX6UL that is a cortex-A7 and supports NEON/VFPV4 FPU
strategy, so let's enable it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/grinn_liteboard_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/grinn_liteboard_defconfig b/configs/grinn_liteboard_defconfig
index 9cad66e15a..640e77c4d7 100644
--- a/configs/grinn_liteboard_defconfig
+++ b/configs/grinn_liteboard_defconfig
@@ -1,5 +1,6 @@
 BR2_arm=y
 BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
