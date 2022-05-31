Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83850C433F5
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 08:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D03461164;
	Tue, 31 May 2022 08:47:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zDDgEUe82VUc; Tue, 31 May 2022 08:47:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53D9260FCB;
	Tue, 31 May 2022 08:47:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83CC81BF313
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80C768403B
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:44:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0l3Lv4YvHLMb for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 08:44:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 376E084035
 for <buildroot@buildroot.org>; Tue, 31 May 2022 08:44:31 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6EB2D60006;
 Tue, 31 May 2022 08:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653986669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=aRJKTT1O4SlZB6m18BOUXRtpnneFBVeLQ+dUbBOF8zQ=;
 b=pZ/ztESqYxXvRkCdn5ukQyRMco2UE6SQ8qqP1I3I9YEu6bssTkCQO7mDzXGMw62e3Hbz3M
 QNKdobPAfdTOaNHJXMANmx3HCG9Ff7BEvuDM1YVp5xfakNZjWaKTH5isiNncCG/+BBTjbj
 +UN3vZUkNzbQkqtLV+olsDEO0Egd329N2poOlCmxV+muKz/xCqrjC+uol9rc+iRMhADH2a
 5DIAAlyYu6LBVUtTbEnah77BzQ6zUoSKXVHA4mIWQuxfNF+ttHLoWDGHJF/ZiAclaBgHXl
 CKN+M+BJKStZ3yr/MgQ5BlogG83/YVx3DQWKlhd/27haCQnbPGvzpggCFg8UNg==
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 10:44:28 +0200
Message-Id: <20220531084428.100082-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] boot/arm-trusted-firmware: add -fno-PIE to
 CFLAGS
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: kory.maincent@bootlin.com
Cc: Kory Maincent <kory.maincent@bootlin.com>, geomatsi@gmail.com,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kory Maincent <kory.maincent@bootlin.com>

By default the toolchain-wrapper enable -fPIE to the build of all packages.
TF-A support Position Independent Executable(PIE) only in few build cases,
therefore it should be disable by default.
If you still want to enable PIE, TF-A provide a "ENABLE_PIE" build options
that will override the cflags for the supported cases.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 03fa83b7b5..b0dec13a4c 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -50,6 +50,7 @@ endif
 
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
+	CFLAGS="-fno-PIE" \
 	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES)) \
 	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM)
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
