Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545A8C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 01:01:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F94E61207
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 01:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F94E61207
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4ADBB40510;
	Tue,  5 Oct 2021 01:01:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3jf5Yj88NFEM; Tue,  5 Oct 2021 01:01:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B38274013A;
	Tue,  5 Oct 2021 01:01:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D460A1BF2BA
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 01:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE0DC60766
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 01:00:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cj3vFpQtuD17 for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 01:00:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8E306073C
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 01:00:50 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XYiIm8WvNiqGsXYiJmX304; Tue, 05 Oct 2021 02:53:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1633395227; bh=Z7NXqbuc2tu4TX0NrkxXBge7/UFCnKgNE/ulG77/uFc=;
 h=From:To:Subject:Date:MIME-Version;
 b=l+oFdKQyD4hn79xxz8hE3U9PD0vVrXhH3n/SzXaAs+lQZDqOgbBhJvHJ+sy27SPVM
 yjhI1airReHTnt/GEk/o7xON1UeZb/NLEtzUd6PiqvToCJ0hgBwfp5zD9CVMIaSDE6
 aGDOegbIBTUHfUOHGL23bLsy0M+F6BsJJa7vtpONHblZ7ksbp4pIUFlf3h89QoFZEK
 StfBcQDHAxCyBA6ss6/h2FHij67o8uMSi4T6JHKjuc0JNxU0/3DbZoopQlJNQ8zYQv
 6yNohS0eHcUkCnIYMg6wZH2LWOeExlF3Lp3/diEs+eDaSybzz+dnSpmGi7EBPSdRrR
 y7mwo6KfXjuFQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  5 Oct 2021 02:53:43 +0200
Message-Id: <20211005005346.955339-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005005346.955339-1-giulio.benetti@benettiengineering.com>
References: <20211005005346.955339-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfLUpa+kz4RUqJs4e3zShwH0U5ECOuRLaL9+oxikDBZdm4KlmCUdvBa63dFTlAIskOA8CIjSUFb6YkhnJ9bOGOWThlZJ2JGo1/RmTplrxSkpEyWxheOxU
 h05zWdiiUfZOsJaOAHAbsvM5k5zJeHEwhiebQEfbHzYNXGGKsCHBvnFKFao7/a4pUNeQOXDzpOqEsx7OKQBtXs+BjnPLYngPbRKPl6Sg7k8fdwlS+U/bHJqx
 7DA9pxcAdFvh4TpLsgsqmc3KoEJgEkIHiGKxq6UhKP7wI0gq5qrNaJO0umDDSuwqCa0nKR6fLp2Lz+BGydT2gUc55eeJE7PfY7QrSm8msB67tMGqEL/GS1Op
 3ZmQZjgbUqHS1z5bdOYG11a7Njd+HA==
Subject: [Buildroot] [PATCH 1/4] configs/bananapi_m1: use NEON+VFPv4 as FPU
 strategy
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Allwinner A20 supports NEON+VFPv4 so let's enable instead of the default
VFPv4-D16.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/bananapi_m1_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/bananapi_m1_defconfig b/configs/bananapi_m1_defconfig
index 23da363345..2d948ec223 100644
--- a/configs/bananapi_m1_defconfig
+++ b/configs/bananapi_m1_defconfig
@@ -1,5 +1,6 @@
 BR2_arm=y
 BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M1"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
