Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB36C433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6665401CD;
	Tue, 18 Jan 2022 10:52:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vdd8iHtgTHGt; Tue, 18 Jan 2022 10:52:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3A2040197;
	Tue, 18 Jan 2022 10:52:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6ED891BF28D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C033819E6
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:51:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fjRsS_fwJVtB for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:51:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10106.aruba.it (smtpcmd10106.aruba.it [62.149.156.106])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92A3F81323
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:51:20 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9m2Bna80b; Tue, 18 Jan 2022 11:48:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502900; bh=LJeckoRMMeZ9TioX35Ti0AEH/d85dRw0/3pwoFDkTWI=;
 h=From:To:Subject:Date:MIME-Version;
 b=O07UPXELcTNTf8OaW23s3hTbRp+buntLEwEIcEpz5XcFDJgO9nuuaTOCcLmUamWxB
 ++rghgfq9fTuPrpBUhVwbF5MjrdB9swDtJrgzGJKnug/xopVzNScdPNbuONOsSDfo0
 nbEJoM4Ic1lRD2Ta2vcBeO9lcYDGshpbeTpeZly0tE8nQgtLXGI6IfXGWkrO6OFe8R
 rXmHQ6uGJQPtdkyPRE6VzlORU0MWSvxPZMOe/Oyi6+7Ault7GoI6w1IJk87I6XrTnv
 O7fLHUy3alS0TJae1d5eG1YjkQm7KNk4XEz4WvKsczLyHHb39YNFIX4empdpzBk1vI
 d9duczvIs3wwQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:31 +0100
Message-Id: <20220118104338.2081259-22-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfGveJ/QlHvDzpTlql+kCjWLSujHRSJXgjY8hU7aC3dCYMazwJianiloik3UlYTOPxLv67Y9T3wGBhjExvUD3idB/vc2+lE/cslynnykKbavcdxJeZo6Q
 KktLo8aZFkiCfNr8HaIM/Hn+qkOW2sDWPVfRSKXhBnms/ChNAYFEQFkBVyK4RKKL6K3uxCUmUTyW4mLKunXsOf7His6BtgXUP4G+BRNCwiWqu007O1JUaFOn
 fGz7MjkW0M5NOdHfI1o4WmXFSrC4bUCEPL2nvq+ROlsRxpUAj4fSCQxVbk3N4WcC+IE3YTa/rfXP/t/GVIC2C7ri+mwMH8/VAGPBvmBDhmo23kHMiCrbZRun
 5nrYyDmOKR4lOSMvAIKPwO9x/VYwoALiXNVtDzYZBsjOlVPGHCXs7EsSNInAUXz6OL5UsuLzvNMunmo9bCf9qVTWg/8aLfcVK706JzLuGBlMvguj+JhBTUbu
 3aRU5ATVWnif+8Upe2rsf7MK0DYRDu4DeyebuWGBc4Sh0pU7uvhhJeJjatQodGbOSW4qHV4XWC2yt9+EhrwSIham6oNNW1ux8FUoSqsjVReOtGh6kSWexQsv
 kY6NlB5nhMwDMdosQwnOXb+geRd8vCjRehody64vMSXxaQXyENVF3Uj5q7NdTVrCiC1E0MGt0UAPNwJ18r8QLVn4qIgSMNHDA9LdQlotpBoZFmSRjNjMvxWt
 nh5VtOLeaRa90VsTy/QoEKqGnWAO1RiZ+T3PasctP8cVnCsQO85fUjWF8jBdktz0jW50CXTjyL1zEsXBktECB1rf6YmUuxWRSrv4KDcxuMD4uzTendfqrZRG
 y7VTosITCw+1bP86B05y4uX75pBsSqiAjAX+NlaoP5sIXW6+jd0OzLFpYUWCRA==
Subject: [Buildroot] [PATCH 21/28] configs/orangepi_pc_defconfig: enable
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

This board has Allwinner H3 that is a cortex-A7 and supports NEON/VFPV4
FPU strategy, so let's enable it instead of only VFPV4.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/orangepi_pc_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/orangepi_pc_defconfig b/configs/orangepi_pc_defconfig
index 44ea9b95c4..8d7d89599a 100644
--- a/configs/orangepi_pc_defconfig
+++ b/configs/orangepi_pc_defconfig
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_ARM_FPU_VFPV4=y
+BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi PC"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
