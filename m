Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6139AC07E9D
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 20:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 049B760A74;
	Sat, 24 Sep 2022 20:54:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 049B760A74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3sx2r_uoLonq; Sat, 24 Sep 2022 20:54:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 439FD607D1;
	Sat, 24 Sep 2022 20:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 439FD607D1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BD0D1BF28D
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 20:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC7C040139
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 20:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC7C040139
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bgflnXRFOT3o for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 20:53:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D09E40136
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D09E40136
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 20:53:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 53832E0002;
 Sat, 24 Sep 2022 20:53:45 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>, Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 24 Sep 2022 22:53:26 +0200
Message-Id: <20220924205327.1489102-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220924205327.1489102-1-thomas.petazzoni@bootlin.com>
References: <20220924205327.1489102-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664052825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1nvt/1r1rpwT8LvupC86/YtKuCoUHhPSwje90ikzmmM=;
 b=CtCkmIr85gv0M9aOsSDUIL7X4UDY7IPlgfP5mXDslLBURwDjX43amCbALjpxp3atkDHuY3
 2lwZSjvyl764MHpt7iD/jIMWdpdW1tEL0foo0ztCfed5KTnyrZE0jsguuBznJXQ7wBKjye
 eJfh6Y5qNmPuPwvo+k1mOM1VlOS1nrPAlICFz5u9Lk3zI3sXUYNr2K4dQRDQl9xOfxJqTX
 1NyMnVDEqg0ipUJ0rCeMzAU0FThHkPHMXRin58xZwJTabp8e9F4xzYzo/qEqePfpK+GrxQ
 +g4MLbfsenNKHG92XKjq3GmGcmWXbKdOoNnPGOb+lnYVEkQs7duYHPFUjsTbSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CtCkmIr8
Subject: [Buildroot] [PATCH 4/4] configs/qemu_xtensa_lx60*: use new
 BR2_xtensa_dc233c option
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that Xtensa DC233C is directly supported as an Xtensa core in
menuconfig, let's use the new option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/qemu_xtensa_lx60_defconfig       | 3 +--
 configs/qemu_xtensa_lx60_nommu_defconfig | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index cb78106091..845d466caf 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -1,7 +1,6 @@
 # Architecture
 BR2_xtensa=y
-BR2_XTENSA_CUSTOM=y
-BR2_XTENSA_OVERLAY_FILE="https://github.com/jcmvbkbc/xtensa-toolchain-build/raw/95291b7c39e6f790d0b2f062c945a630290f2c81/overlays/xtensa_dc233c.tar.gz"
+BR2_xtensa_dc233c=y
 
 # System
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index 4be1b66edc..f94019540f 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -1,7 +1,6 @@
 # Architecture
 BR2_xtensa=y
-BR2_XTENSA_CUSTOM=y
-BR2_XTENSA_OVERLAY_FILE="https://github.com/jcmvbkbc/xtensa-toolchain-build/raw/95291b7c39e6f790d0b2f062c945a630290f2c81/overlays/xtensa_dc233c.tar.gz"
+BR2_xtensa_dc233c=y
 # BR2_XTENSA_USE_MMU is not set
 
 # Use minimal busybox with hush and networking tools
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
