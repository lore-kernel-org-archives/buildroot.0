Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE8CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 12:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D720F40AFD;
	Tue, 31 May 2022 12:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AoIVD4rHGuXN; Tue, 31 May 2022 12:56:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E563B40B0B;
	Tue, 31 May 2022 12:56:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 112B71BF57B
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 12:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E9A741C2E
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 12:56:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B8dPeR_a-c0L for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 12:56:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A77ED41C2C
 for <buildroot@buildroot.org>; Tue, 31 May 2022 12:56:03 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E071D40004;
 Tue, 31 May 2022 12:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654001758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=PvTwgu2hYET7XuoeX5OO9/bYX8iNY3RL51+LeIt2eN8=;
 b=j3Xz2MM9q9Rd8gO6i8SF+qUkQFnByzJDLHdMjEvYVJ5s3rxsjZ3jwIZByeljpcZYVFIWvW
 9dq1oVphPXKvkeFUgOANn4XAV/hPJZwnaqMUcVw8+PpAXE4icU7BjvvmJxJZyem7oamF5v
 QUqjD7Vsn1WxiWA2U4Wq5anRisp+AE0gMRKoOPXa/3Fzxat2s5ssH05eIeK/lR3fl6nVP4
 5Nxbar1n6ytqCjRrQf7K2DCB73QuXA1rz00haijC6VfeJtr0iSNwFtMYbGtHbhQFVO/Aww
 BCXobjy8yb6A9xQOv2o0z0fSUH8VeyYKrNbaTTkCu9s6mRX/w4t5Nw2xhhGacQ==
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 14:55:57 +0200
Message-Id: <20220531125557.450076-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package: gcnano-binaries: bump version to
 969d115185
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
Cc: Kory Maincent <kory.maincent@bootlin.com>, scooby22@web.de,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kory Maincent <kory.maincent@bootlin.com>

Update to last version of gcnano-binaries compatible with kernel
from StMicroelectronics version 5.10

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 package/gcnano-binaries/gcnano-binaries.hash | 2 +-
 package/gcnano-binaries/gcnano-binaries.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gcnano-binaries/gcnano-binaries.hash b/package/gcnano-binaries/gcnano-binaries.hash
index e3efc82fc5..27e14d71f4 100644
--- a/package/gcnano-binaries/gcnano-binaries.hash
+++ b/package/gcnano-binaries/gcnano-binaries.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 afec2ba2f524821452d561b56afd2fc241293ea4a6e8598d1663f58e5d16800f  gcnano-binaries-1534c3eaabb5ae545a8f97e95f853531365a13fc.tar.gz
+sha256 32d91d6ce6e6551cb7ad0eee4698041fdeb10a4f216e6564adb06408476edc38  gcnano-binaries-969d11518529bb70a132909b02ddcc5736c92d91.tar.gz
 sha256 7d209718473d18f69f75adb7caf9cb5d4b0a31da068756aa011bea617de3dc57  EULA
diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
index f6adc36dbd..affe0a6063 100644
--- a/package/gcnano-binaries/gcnano-binaries.mk
+++ b/package/gcnano-binaries/gcnano-binaries.mk
@@ -8,8 +8,8 @@ GCNANO_BINARIES_LIB_VERSION = 6.4
 GCNANO_BINARIES_LIB_REVISION = 3
 GCNANO_BINARIES_LIB_FULL_VERSION = $(GCNANO_BINARIES_LIB_VERSION).$(GCNANO_BINARIES_LIB_REVISION)
 GCNANO_BINARIES_DRIVER_VERSION = $(GCNANO_BINARIES_LIB_FULL_VERSION)
-GCNANO_BINARIES_USERLAND_VERSION = $(GCNANO_BINARIES_LIB_FULL_VERSION)-20200902
-GCNANO_BINARIES_VERSION = 1534c3eaabb5ae545a8f97e95f853531365a13fc
+GCNANO_BINARIES_USERLAND_VERSION = $(GCNANO_BINARIES_LIB_FULL_VERSION)-20210726
+GCNANO_BINARIES_VERSION = 969d11518529bb70a132909b02ddcc5736c92d91
 GCNANO_BINARIES_SITE = $(call github,STMicroelectronics,gcnano-binaries,$(GCNANO_BINARIES_VERSION))
 
 GCNANO_BINARIES_LICENSE = MIT, Vivante End User Software License Terms
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
