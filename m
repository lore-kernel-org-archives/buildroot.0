Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A771AC4332F
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 11:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3ECBC8183D;
	Sun,  1 Jan 2023 11:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3ECBC8183D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nOB7lrK4yU-T; Sun,  1 Jan 2023 11:26:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89E41817B5;
	Sun,  1 Jan 2023 11:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89E41817B5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4FB971BF392
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 11:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38973404D5
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 11:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38973404D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x53hwF4Ldovs for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 11:25:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6326403E5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6326403E5
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 11:25:49 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.10.36])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 62BCE13F838;
 Sun,  1 Jan 2023 12:25:44 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 12:25:28 +0100
Message-Id: <20230101112528.11170-2-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230101112528.11170-1-ju.o@free.fr>
References: <20230101112528.11170-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672572347;
 bh=cOnsyVWIq6IPMfAe99j3NUDNU2Lj+zqFulI0RZ8aBkc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jCflYuqBUr+brQv9m0Vao1caPsD+UUfsurPWlWtoG7K1uBkajzvkLJEQjF6UZHL81
 /kCwpWmapmc43qUa7BhXdPra5GUVB2oe+OLVhUhOv8NU+/0j+U0NiFXnYwaY0od639
 KV33ZsJZRI3z3sVwq7yQXvq2N3+Z2gg9jUTg3nRzvS+yupQkl53ZVYGgKfoQ0CSmCi
 c2Oqa+7ReL7HlkRXp/26bO80dWgsGKd9cmH7644R7jT4uFwDWPfsmuTLL6eJ/8lf//
 rYWoslJ+hxIe3YWKf3J71X6VmQ7TZS4hxO3ObTnGybhRTJLi00pGIzXDnvI1rFU2dP
 iqDGZGZMZCqUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jCflYuqB
Subject: [Buildroot] [PATCH 2/2] package/fmc: bump to version LSDK-21.08
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
Cc: Julien Olivain <ju.o@free.fr>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit also updates the sed pattern, as the default platform was
changed in:
https://github.com/nxp-qoriq/fmc/commit/4377bfc24626a0db3bedb6e1cbb201f6f6df964c

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fmc/fmc.hash | 2 +-
 package/fmc/fmc.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fmc/fmc.hash b/package/fmc/fmc.hash
index 7309562b09..961ce18ac7 100644
--- a/package/fmc/fmc.hash
+++ b/package/fmc/fmc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e8594e37eb81e5b1f492f8494b98086f65180637b1e2e08d8a4475c23653a404  fmc-a079d2c844edd85dff85a317a63198e7988bcd09.tar.gz
+sha256  a58514816108a16d07307f924ebceb67c7d61709e4449978763fc44ed6e1fc44  fmc-LSDK-21.08.tar.gz
 sha256  f92862ceb95db5492f50a59d7c799c9395b714db88db92d11891dc0233e2ac42  COPYING
diff --git a/package/fmc/fmc.mk b/package/fmc/fmc.mk
index 6ac8c768df..4f25545ffd 100644
--- a/package/fmc/fmc.mk
+++ b/package/fmc/fmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMC_VERSION = a079d2c844edd85dff85a317a63198e7988bcd09
+FMC_VERSION = LSDK-21.08
 FMC_SITE = $(call github,nxp-qoriq,fmc,$(FMC_VERSION))
 FMC_LICENSE = MIT
 FMC_LICENSE_FILES = COPYING
@@ -26,7 +26,7 @@ endif
 FMC_PLATFORM = $(call qstrip,$(BR2_PACKAGE_FMLIB_PLATFORM))
 
 define FMC_BUILD_CMDS
-	$(SED) "s:P4080:$(FMC_PLATFORM):g" $(@D)/source/Makefile
+	$(SED) "s:LS1043:$(FMC_PLATFORM):g" $(@D)/source/Makefile
 	# The linking step has dependency issues so using MAKE1
 	$(TARGET_MAKE_ENV) $(MAKE1) $(FMC_MAKE_OPTS) -C $(@D)/source
 endef
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
